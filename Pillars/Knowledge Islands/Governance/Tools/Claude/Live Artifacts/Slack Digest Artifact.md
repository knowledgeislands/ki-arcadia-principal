---
tags:
  - card/note
  - topic/ai
  - topic/productivity
  - topic/automation
  - topic/slack
  - topic/communications
  - source/claude
status: current - April 2026
purpose: Reusable recipe for the Cowork "Slack Digest" artifact - last 24 hours of channel conversations (grouped by name prefix) and direct messages, summarised per-channel as a British-English paragraph and per-DM as a one-liner
author: Written with Claude
---

# Slack Digest Artifact

## Overview

A self-contained Cowork HTML artifact that renders the last 24 hours of my Slack activity - channel conversations across a curated set of name prefixes plus direct messages - grouped, summarised, and linked back to the original messages. Pinned in the Cowork sidebar; re-fetches on every open via `window.cowork.callMcpTool` against the Slack MCP; the 24-hour window is computed client-side on each load so the view stays fresh without rebuilding.

The previous iteration of this artifact tracked only `@`-mentions. That model missed the ambient signal - the conversations happening in my channels that I should be aware of even when nobody pings me. The current iteration discovers channels by name prefix, reads each one for the window, and summarises what's actually been discussed.

---

## What It Produces

- **Header** - title "Slack digest" with a subtitle showing the rolling window (e.g. "Last 24 hours · since Tue, 21 Apr, 23:14").
- **Channel activity section** - count chip in the heading; cards grouped by channel-name prefix under sub-headings ("Product & engineering" for `prd-`, "HNR" for `hnr-`, "Partner groups" for `group-`, anything else under a capitalised auto-label). Buckets only render when they contain active channels.
- **Direct messages section** - flat list of cards, no prefix grouping.
- **Per channel card** - `#channel-name` on the left; "N messages · M people" footnote; a 2-3 sentence British-English paragraph summarising the main topics, key participants, and any decisions or open asks. The whole card is an `<a>` to the channel's Slack permalink.
- **Per DM card** - sender on the left; relative timestamp on the right ("2h ago", "45m ago"); a one-line summary; "N messages" footnote when the conversation has more than one entry. Card links to the message permalink.
- **Empty states** - "No channel activity in the last 24 hours." and "No new DMs in the last 24 hours." per section.
- **Error banner** - if any Slack call throws at the top level, the content area is replaced with a red banner carrying the error message.

---

## Key Design Decisions

- **Channel scope by name prefix, not by mention.** The artifact discovers all channels whose names begin with a prefix in `PREFIXES` (`prd-`, `hnr-`, `group-`) via `slack_search_channels`, regardless of whether I was pinged. Mentions-only digests miss the ambient context - what's being discussed across my channels even when no one tags me.
- **Three-tool design.** `slack_search_channels` for discovery (paginated, returns metadata + permalink); `slack_read_channel` for per-channel timeline within the window; `slack_search_public_and_private` for DM activity. DMs are kept on the search-based path because there's no `discover-DMs` equivalent and `to:me` / `channel_types: 'im,mpim'` already covers them well.
- **Two-phase fan-out.** Phase 1 in parallel: prefix discoveries + DM searches. Phase 2 in parallel: read each unique channel within the window. Phase 3 in parallel: `sample()` summaries for every active channel. Total wall time is dominated by the slowest single tool call rather than the count.
- **Strict `startsWith` filter on top of Slack's loose match.** `slack_search_channels` does a substring-style match, so a search for `prd-` returns `group-prd-*` and other near-misses. The artifact re-filters with `name.startsWith(prefix)` to keep buckets clean.
- **Cross-prefix dedup by channel ID.** `group-hnr-*` is matched by both the `hnr-` and `group-` searches. Dedup happens once on `channel.id` before any reads, so each channel gets read at most once.
- **Permalinks come from discovery, not construction.** Channels live in multiple workspaces (e.g. `humansnotrobots.slack.com`, `accedo.slack.com`, `smart-working-world.slack.com`); URL templates would be wrong. The discovery response carries the correct `permalink` - used as-is.
- **Markdown timeline parsed with regex.** `slack_read_channel` returns a markdown string with blocks shaped like `=== Message from <name> (<id>) at <time> ===` followed by `Message TS: …`, the body, and optional `Thread:` / `Files:` / `Reactions:` trailers. The parser splits on the header line, captures author/id/time, then extracts the body up to the first trailer or end-of-block. Multi-line bodies (bullet lists, paragraphs) are preserved.
- **Rolling 24-hour window, not calendar-day.** `now - 24h` Unix timestamp passed via `oldest` to `slack_read_channel` and `after` to the DM search. Avoids the empty-morning problem and survives midnight crossings without the user reloading.
- **`sample()`-driven summaries, with a deterministic fallback.** Each channel's paragraph and each DM's one-liner is generated by `window.cowork.sample()`. Channel prompt is "Summarise the last 24 hours of this Slack channel in 2-3 short sentences using British English. Cover the main topics being discussed, key participants, and any decisions or open asks. Do not list every message; keep it tight and informative. Return only the paragraph - no preamble, no quotes, no headings." If `sample()` errors, the card falls back to a deterministic line ("N messages from M people; latest from <author>").
- **Slack mrkdwn de-rendered before summarisation.** `<@Uxxx|Name>`, `<#Cxxx|name>`, `<url|label>` are flattened to readable forms before being handed to `sample()`. Otherwise the model wastes tokens describing Slack's ID syntax.
- **Loading skeleton for instant perceived response.** On every open, a shimmer skeleton - 5 cards split across two sections (3 channel + 2 DM) - is rendered synchronously before the first `await`, eliminating the blank-white flash while the Slack MCP calls run. The skeleton shares the same card dimensions as the real cards so the layout does not shift on populate.
- **In-memory cache with a 5-minute TTL.** `_cache` and `_cacheTime` are declared at module level (outside the IIFE) so they survive sidebar re-focus without triggering a re-fetch. If the cache is live, cards are rendered immediately using pre-collected summary text - no spinners, no `sample()` latency. Cache is invalidated after `CACHE_TTL = 5 * 60 * 1000` ms.
- **Deferred cache write after summarisation completes.** The cache is only written _after_ all `sample()` calls resolve - summary text is then collected from the DOM elements by ID. Re-focusing mid-summarise triggers a fresh fetch rather than caching a partial or empty summary. This prevents silent partial-summary cache hits.
- **Cache badge makes the data source visible.** A small pill in the sub-header shows "⚡ from cache · fetched Ns ago" (grey) when serving cached data, or "↻ live · Nms" (green) when a live fetch just completed. Updates automatically after every render.
- **Light-mode, storage-free, inline.** `:root { color-scheme: light }`, white cards on `#fafafa`, Slack aubergine (`#4A154B`) for hover and spinner accents; no `localStorage` (cache lives in module-level JS variables, not browser storage); all CSS and JS inlined; error banner on top-level `.catch`. See **Live Artifact Baseline** in [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/AI Automation Patterns|AI Automation Patterns]].

---

## Reusable Prompt

Paste this to rebuild or adapt the artifact:

```
Create a Cowork HTML artifact called "Slack digest" that:

- Computes a rolling 24-hour window client-side (now - 24h).
- Channel scope is discovery-driven, not mention-driven. Discover channels via
  `slack_search_channels` for each prefix in PREFIXES = ['prd-', 'hnr-',
  'group-']. Paginate using next_cursor until exhausted. Re-filter with
  name.startsWith(prefix) - Slack's match is substring-style. Dedupe across
  prefixes by channel.id.
- For each unique channel, call `slack_read_channel` with the window's start as
  the `oldest` Unix timestamp. Parse the returned markdown by splitting on
  `=== Message from <name> (<id>) at <time> ===`, extract author/id/time, then
  capture the body up to the first `Thread:` / `Files:` / `Reactions:` trailer
  or end-of-block. Preserve multi-line bodies.
- Keep only channels with at least one message in the window. Group by prefix
  using PREFIX_LABELS = { hnr: 'HNR', prd: 'Product & engineering',
  group: 'Partner groups' }; render in preferredOrder = ['prd', 'hnr', 'group']
  then by activity desc.
- Per channel card: `#channel-name` on the left, "N messages · M people"
  footnote, and a 2-3 sentence British-English paragraph summary generated by
  `window.cowork.sample()`. Card is an <a> to the channel.permalink returned
  by discovery - do not construct workspace URLs.
- For DMs, run `slack_search_public_and_private` in parallel with two queries:
    1. query="to:me"
    2. query="-from:<@<MY_USER_ID>>", channel_types="im,mpim"
  Dedupe by channelId:ts. Render as a flat list (no prefix grouping) - sender
  on the left, relative time on the right ("2h ago"), one-line summary via
  sample(), card links to message permalink.
- Empty states per section. Red error banner on top-level catch.
- Fall back to deterministic text on sample() failure; never block on
  summarisation.
- Show a shimmer skeleton synchronously on open before any await: 5 cards split
  across two sections (3 channel + 2 DM), using a @keyframes shimmer animation
  with a moving linear-gradient. Eliminates the blank-white flash during MCP
  fetch.
- Cache the rendered digest in module-level variables (_cache, _cacheTime)
  declared outside the IIFE. CACHE_TTL = 5 * 60 * 1000 (5 minutes). Store
  { channelBuckets, dmGroups, activeChannelCount } where each channel entry
  includes pre-collected summaryText. Write the cache only after all sample()
  calls complete - collect summaryText from the DOM elements by ID at that
  point. This prevents partial-summary cache hits if the user re-focuses before
  summarisation finishes. On a cache hit, render immediately using the cached
  summary text (no spinners). Show a small badge in the sub-header: "⚡ from
  cache · fetched Ns ago" (grey) on cache hit, "↻ live · Nms" (green) on live
  fetch.
- Light-mode styling only; no localStorage; no external fetches.

Constants at the top of the script:
  CURRENT_USER_ID, PREFIXES, PREFIX_LABELS, preferredOrder, message-fetch
  limit (e.g. 100), CACHE_TTL, and three tool-name constants for
  search/discover/read.

- Embed the comment <!-- Recipe: Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Slack Digest Artifact.md --> as the first line of the <head>; preserve it through any regeneration or patch.
- If you modify this artifact, update the recipe note at the path in that comment - use the specific Knowledge Island's skill in SAVE mode. Read the note first and merge in; update only the sections that changed.
```

One-liner version that gets you the same result via the usual clarification flow:

> "Build me a live digest of my Slack channels from the last 24 hours, grouped by name prefix, with a short paragraph summarising what's been discussed in each - plus DMs as one-liners."

---

## Updating

Follow the **Two-Mechanic Update Protocol** in [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/AI Automation Patterns|AI Automation Patterns]]; this artifact's `id` is `slack-digest`.

Common in-place changes and where to make them:

- **Add or rename a prefix bucket** - append the prefix to `PREFIXES`, add a label entry to `PREFIX_LABELS`, and (if you want it surfaced near the top) extend `preferredOrder`. To split `group-hnr-*` from `group-*`, add a two-segment detection branch to `channelPrefix`.
- **Change the window size** - swap the `24 * 60 * 60 * 1000` constant in `windowStart`. The subtitle text, the `oldest` timestamp on `slack_read_channel`, and the `after` on the DM search all derive from it. Update the time-format breakpoints in `fmtTime` if the window exceeds 24 hours.
- **Different user identity** - change the `CURRENT_USER_ID` constant. Used in the `-from:<@…>` exclusion on the DM query.
- **Rewired Slack MCP** - see **MCP Connector Rewiring** in [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/AI Automation Patterns|AI Automation Patterns]]. Constants to update: `SEARCH_TOOL`, `CHANNELS_TOOL`, `READ_TOOL`, plus the matching `mcp_tools` declarations.
- **Tone of channel summaries** - edit the prompt string passed to `summariseChannel`. Keep "Return only the paragraph - no preamble, no quotes, no headings." - without it the model leaks "Here is the summary:" preludes. See **Deterministic vs `sample()` Synthesis** in [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/AI Automation Patterns|AI Automation Patterns]].
- **Tone of DM summaries** - same drill on `summariseDM`'s prompt; current spec is one line, ≤18 words, British English.
- **Cap on messages read per channel** - adjust the `limit` argument on the `slack_read_channel` call. Default keeps the prompt size manageable for `sample()`.
- **Swap to deterministic summaries** - replace the body of `summariseChannel`/`summariseDM` with a JS-derived line. Avoids `sample()` latency and variance at the cost of warmth.
- **Tune the cache TTL** - change the `CACHE_TTL` constant (milliseconds). What's cached: `{ channelBuckets, dmGroups, activeChannelCount }` where each channel entry carries pre-collected `summaryText`. Cache is written only after all `sample()` calls complete. Set `CACHE_TTL = 0` to disable caching entirely and always fetch live.

Verify per the **Two-Mechanic Update Protocol**: open the artifact, hit Reload, confirm the subtitle reflects the new window, the prefix buckets repopulate, and each card shows a coherent paragraph rather than a fallback line. On a second open within 5 minutes, confirm the cache badge reads "⚡ from cache" and summary text is intact. The artifact has no diagnostics footer, so open the browser devtools console (or the Cowork artifact log) to catch silent parse failures - a malformed regex will render an empty section without a visible error. Adding a footer is listed as an enhancement below. Then apply **Recipe Self-Synchronisation** - update this note at `Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Slack Digest Artifact.md` using the specific Knowledge Island's skill.

---

## Potential Enhancements

Ordered roughly by effort - small and practical first, creative last.

- **Diagnostics footer** - generated-at timestamp; channel-discovery counts per prefix; channels read; messages parsed; DM query strings; any tool errors. Mirrors the Week at a Glance footer and gives a verification surface instead of relying on the console.
- **Two-segment prefix detection** - split `group-hnr-*` into "HNR partners" from non-HNR `group-*` ("External partners"); cheap and high-value as the partner roster grows.
- **Explicit pin list** - always surface a hand-curated set of channels (e.g. `hnr-5g-emerge-planning`) at the top of their bucket regardless of activity volume.
- **Noisy-channel dampener** - collapse channels above an activity threshold (e.g. >50 messages in 24 h) into a single "high-traffic" line with the summary still present but the card visually de-emphasised.
- **Quiet-hours suppression** - fade or hide cards from channels in a "low-signal" allow-list so the digest reflects what actually wants attention.
- **Reaction-aware sorting** - promote channels with reactions from senior people to the top of their bucket; cheap signal that something matters more than message count.
- **Mention-aware highlight** - overlay a small "@" badge on cards where I was pinged within the window, so the discovery-driven view doesn't lose the mention signal entirely.
- **DM digest by person** - group multiple DM cards from the same user under a single header when there are several short bursts within the window.
- **Inline channel expansion** - click a card to expand the parsed timeline in-place, without leaving the artifact.
- **Rate-limit-safe batching** - if discovery finds many channels, chunk the `slack_read_channel` fan-out (e.g. 5 at a time) to stay under Slack's per-minute caps.
- **Daily digest archive** - at end-of-day, export the rendered digest as a Calendar session note for retrospective traceability.
- **Channel-of-the-day highlight** - pick the highest-signal channel and render its summary larger at the top of the artifact.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Live Artifacts|Live Artifacts]] - parent index
- [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/AI Automation Patterns|AI Automation Patterns]] - general patterns for recurring AI automations
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Cowork Configuration Layers|Cowork Configuration Layers]] - where Cowork preferences and rules live
