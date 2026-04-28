---
tags:
  - card/note
  - topic/ai
  - topic/productivity
  - topic/automation
  - topic/calendar
  - source/claude
status: current - April 2026
purpose: Reusable recipe for the Cowork "Week at a Glance" artifact - a rolling 7-day multi-calendar overview with per-day summaries, shimmer skeleton loading, and 5-min in-memory cache
author: Written with Claude
---

# Week at a Glance Artifact

## Overview

A self-contained Cowork HTML artifact that renders a rolling next-7-days view across every Google calendar I have access to. Each day gets a short British-English summary, a 06:00-23:00 busy/free sparkline, and the full ordered event list with an amber "Overlap" pill on any clashing timed event. Days that coincide with a lunar phase get a Unicode moon glyph in the date header. Pinned in the Cowork sidebar; re-fetches events on every open via `window.cowork.callMcpTool`; dates are computed client-side so it never goes stale. A 5-minute in-memory cache means re-focusing the sidebar after a brief switch is instant, with a small badge confirming whether data is live or cached.

---

## What It Produces

- Page header: the artifact title plus a sub-line showing the covered range, e.g. _Wednesday, 22 April - Tuesday, 28 April (Europe/London)_, a **cache badge** ("⚡ from cache · fetched Ns ago" in grey, or "↻ live · Nms" in green). A shimmer skeleton of 7 day-card shapes appears immediately while MCP calls are in flight, so the viewport never flashes blank-white.
- One `<section>` per day, 7 in total, rolling from today in `Europe/London`.
- Header per day: long weekday + date, a Unicode moon glyph when a moon-phases calendar contributes an event (the glyph carries the phase name as a hover tooltip), a _today_ pill on the current day, soft tint on Sat/Sun.
- One-sentence summary per day: shape is "N events from HH:MM to HH:MM - top three titles" plus separate lines for all-day items and transparent (Available) "backdrop" items.
- Busy/free sparkline per day with timed events: a thin horizontal bar spanning 06:00-23:00 with merged busy blocks; subtle `06 / 12 / 18 / 23` axis labels beneath. Today's blocks render in the warmer accent colour.
- Event rows: time range · title (with amber "Overlap" pill on any timed non-transparent event that clashes with another on the same day) · calendar · short location (first line, first comma segment, capped length).
- Footer: total event count, calendars loaded as _X of Y_ (exposes partial failures), generated-at timestamp, and any calendars that errored.

---

## Key Design Decisions

- **Rolling window, not fixed dates.** `new Date()` plus 7 in `Europe/London`, so the artifact stays useful indefinitely - no re-build needed each week.
- **Calendars discovered at load, fetched in parallel.** A single `list_calendars` call at the top of the script gets every calendar the user has access to; then `Promise.all` fans out one `list_events` call per ID. No hardcoded ID list - the artifact is resilient to calendar renames, additions, and removals with no rebuild. Parameter names passed to `list_events` are camelCase (`calendarId`, `startTime`, `endTime`, `timeZone`, `pageSize`) to match the google-calendar MCP schema; snake_case silently fails.
- **Transparent (Available) events become "backdrop."** Multi-day holiday/travel markers like _Janet Away_ or _York_ would otherwise dominate every day's summary, so they're styled italic-and-faded and surfaced on a separate "Backdrop:" line in the summary.
- **Conflict detection is scoped to timed, non-transparent events.** All-day events sit across the whole day by definition, and transparent backdrop items (_Janet Away_, _York_) would mark everything as overlapping. Restricting the check to solid timed events keeps the signal meaningful; the pill renders only when two such events truly clash.
- **Sparkline is calendar-hour-based, not raw event-time-based.** The 06:00-23:00 window mirrors the waking day; events earlier or later are clipped into that band rather than stretching the axis. Busy intervals are merged before rendering so back-to-back meetings read as one continuous block instead of a striped pattern. Days without timed events skip the sparkline entirely - no empty bar noise.
- **Moon phases fold into the header, not the list.** The Moon phases calendar emits one all-day event per phase and would clutter the event list it sits on. Instead, the day's phase is surfaced as a single Unicode glyph (🌑 🌓 🌕 🌗) next to the date, mapped from the event title prefix. The moon calendar is matched by a regex on its label (`MOON_SUMMARY_REGEX`, default `/moon/i`) rather than an exact string or hardcoded ID, so a rename (e.g. "Moon Phases UK") won't silently break the filter. The underlying event is filtered out of both the summary and the ordered list.
- **Deterministic summaries, not `sample()`.** Summary text is computed in JS - cheaper, offline-safe, and consistent across reloads. `sample()` is available if a more narrative tone is wanted later, but adds latency and variance.
- **Loading skeleton for instant perceived response.** Before any `await`, the `days` element is populated with 7 shimmer day-card shapes that mirror the real layout (header bar, two summary lines, sparkline bar, two event lines). The `@keyframes shimmer` animation runs a moving `linear-gradient` across warm earthy tones matching the artifact's palette. This eliminates the blank-white flash during the ~1-2 second calendar fetch and signals that the view is loading rather than broken.
- **In-memory cache with 5-minute TTL.** `_cache` and `_cacheTime` are declared at module scope (outside the IIFE) so they outlive a single script execution and survive sidebar re-focus. On open, the cache is checked first: if valid, `renderDays()` and the footer are called immediately with no MCP calls. The cache stores the fully processed `days` array (including `Date` objects, which survive fine in memory) and the pre-rendered footer HTML string. `CACHE_TTL` (default `5 * 60 * 1000` ms) is the single tunable constant.
- **Cache badge makes the data source visible.** A small pill in the date sub-header shows "⚡ from cache · fetched Ns ago" (grey) on a cache hit, or "↻ live · Nms" (green) after a live fetch. It makes it unambiguous whether the view reflects live data or a recent snapshot - important when a calendar event was just created.
- **Light-mode, storage-free, inline.** `:root { color-scheme: light }` with a warm off-white palette; no `localStorage` (the in-memory cache is sufficient for sidebar re-focus; it resets on hard reload, which is the right moment for a fresh fetch); all CSS and JS inlined; error banner on top-level `.catch`. See **Live Artifact Baseline** in [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/AI Automation Patterns|AI Automation Patterns]].

---

## Reusable Prompt

Paste this to rebuild or adapt the artifact:

```
Create a Cowork HTML artifact called "Week at a Glance" that:

- Shows a rolling next 7 days from today, computed client-side in Europe/London.
- Discovers calendars at load via the google-calendar MCP's list_calendars tool,
  then fetches events from every one in parallel via list_events. Declare both
  tools in mcp_tools. Pass parameters in camelCase - calendarId, startTime,
  endTime, timeZone, pageSize - to match the MCP schema; snake_case silently fails.
- Shows a shimmer skeleton immediately before any await - 7 day-card shapes
  matching the real layout (header, summary lines, sparkline, event rows) using
  a moving linear-gradient @keyframes shimmer animation. Warm earthy tones to
  match the palette. The status element is hidden before the skeleton is shown.
- Caches fetched + processed data in module-level variables (_cache, _cacheTime,
  CACHE_TTL = 5 * 60 * 1000 ms) declared outside the main IIFE so they survive
  sidebar re-focus. On open, check the cache first; if valid, call renderDays()
  and render the footer immediately - no MCP calls. Store the fully processed days
  array (including Date objects) and the pre-rendered footer HTML string.
- Shows a cache badge in the date sub-header: grey "⚡ from cache · fetched Ns ago"
  on a cache hit; green "↻ live · Nms" after a live fetch.
- Renders one section per day with:
    - Long weekday + date heading
    - A Unicode moon-phase glyph next to the date when a moon-phases calendar
      contributes an event that day. Identify the moon calendar by regex on its
      label (default /moon/i) so rename-churn doesn't break the filter. Map the
      event title prefix to a glyph (new moon → 🌑, first quarter → 🌓, full
      moon → 🌕, last/third quarter → 🌗, fallback → 🌙). Expose the phase
      name as a hover tooltip on the glyph. Filter those events out of the list
      and summary so the day's phase is surfaced only via the glyph.
    - "today" pill on the current day, soft tint on Sat/Sun
    - A single-sentence British-English summary (count, first/last times, top-3
      titles, separate lines for all-day items and transparent "backdrop" items)
    - A thin busy/free sparkline (~8px high) spanning 06:00-23:00 with merged
      busy blocks for timed, non-transparent events. Clip out-of-window events
      into the band. Render "06 / 12 / 18 / 23" labels beneath. Today's busy
      blocks use a warmer accent colour. Skip the sparkline on days with no
      timed events.
    - An ordered list of events: time range · title · calendar label · short
      location (first line, first comma segment, <60 chars)
- For every pair of timed, non-transparent events on the same day that overlap,
  render an amber "Overlap" pill next to both titles. Do not run the check on
  all-day or transparent events.
- Treats transparency="transparent" events as italic, softer "backdrop" rows.
- Expands all-day events across every covered day; shows them at the top with
  "all day".
- Has a footer with event count, calendars loaded, generated-at timestamp, and
  any calendars that failed to load.
- Uses light-mode styling only (:root { color-scheme: light }).
- Inlines all CSS and JS; no localStorage; no external fetches.

- Embed the comment <!-- Recipe: Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Week at a Glance Artifact.md --> as the first line of the <head>; preserve it through any regeneration or patch.
- If you modify this artifact, update the recipe note at the path in that comment - use the specific Knowledge Island's skill in SAVE mode. Read the note first and merge in; update only the sections that changed.
```

One-liner version that gets you the same result via the usual clarification flow:

> "Create a week-at-a-glance page from my calendar with a short summary for each day." - then pick _Next 7 days_, _Live artifact (HTML)_, _All calendars I can see_.

---

## Updating

Follow the **Two-Mechanic Update Protocol** in [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/AI Automation Patterns|AI Automation Patterns]]; this artifact's `id` is `week-at-a-glance`.

Common in-place changes and where to make them:

- **Add or remove a calendar** - nothing to change in the artifact. Calendars are discovered at load via `list_calendars`, so adding, removing, or renaming one in Google Calendar propagates on the next reload. The moon-phase handling matches by regex on the calendar label (`MOON_SUMMARY_REGEX`, default `/moon/i`), so any calendar with "moon" in its name will be picked up; rename with that in mind, or adjust the regex.
- **Change the window size** - swap the `for (let i = 0; i < 7; i++)` loop bound. `endYMD`, the header labels, and the footer counts all follow automatically.
- **Different time zone** - change the `TZ` constant. Every date operation flows through `Intl.DateTimeFormat` with `timeZone: TZ` (including `londonMinutes()` for the sparkline), so nothing else needs touching.
- **Tune the sparkline window** - edit `SPARK_START` and `SPARK_END` (minutes-of-day, e.g. `6 * 60` and `23 * 60`); the percentage maths, clip bounds, and axis labels derive from those two constants. Change the axis `<span>`s if you shift the window.
- **Tune the overlap test** - the `a/b` pair loop sets `a._conflict = true` when `b.start < a.end && b.end > a.start`. To ignore short back-to-back touches, relax the comparison with a minute-tolerance; to suppress the pill on trivial overlaps, add a `Math.min(a.end - b.start, b.end - a.start) >= THRESHOLD` guard.
- **Change the moon-glyph mapping** - `moonGlyph()` maps phase title prefixes to glyphs; add or reorder cases there. Moon calendars are detected by `MOON_SUMMARY_REGEX` (default `/moon/i`) on the calendar label; tighten or loosen that if multiple calendars match. The shared `isMoonItem()` helper drives both the header-glyph extraction and the list/summary filtering - keep all three in sync if you change the predicate.
- **Tune the cache TTL** - edit the `CACHE_TTL` constant (default `5 * 60 * 1000` ms = 5 minutes). The cache stores the fully processed `days` array and the pre-rendered footer HTML. Set to `0` to effectively disable caching. `_cache` and `_cacheTime` must be declared at module scope outside the IIFE - if they move inside, they reset on every execution and the cache never hits.
- **Rewired MCP connector** - see **MCP Connector Rewiring** in [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/AI Automation Patterns|AI Automation Patterns]]. Constants to update: the `LIST_EVENTS` and `LIST_CALENDARS` tool-name constants, and the two entries in the `mcp_tools` declaration. Parameter names passed to `list_events` are camelCase - `calendarId`, `startTime`, `endTime`, `timeZone`, `pageSize` - match the schema exactly; snake_case silently fails. If the moon-phase calendar is renamed, only `MOON_SUMMARY_REGEX` needs a look.
- **Swap to narrative summaries** - replace the `summarise()` body with `await window.cowork.sample()` calls run in parallel via `Promise.all` over the days. Warmer tone at the cost of some latency and variance. See **Deterministic vs `sample()` Synthesis** in [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/AI Automation Patterns|AI Automation Patterns]].

Verify per the **Two-Mechanic Update Protocol**: open the artifact, hit Reload, check the footer timestamp and calendars-loaded count. Re-focus within 5 minutes and confirm the cache badge reads "⚡ from cache"; a cold open reads "↻ live · Nms". Then apply **Recipe Self-Synchronisation** - update this note at `Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Week at a Glance Artifact.md` using the specific Knowledge Island's skill.

---

## Potential Enhancements

Ordered roughly by effort - small and practical first, creative last. _Conflict detection, the free-time sparkline, and the moon-phase marker were previously listed here and are now built in; see the Overview for how each is rendered._

- **Links out to Google Calendar** - render each event title as an anchor to its `htmlLink`; opens in a new tab for fast edits. Only expose links from known calendar IDs - keeps the link-safety discipline intact.
- **Travel-time buffers** - when two consecutive events carry distinct `location` values, mark the gap between them as "travel" rather than "free" on the sparkline; useful on York days and choir-plus-church Sundays.
- **Cross-source overlay** - pull scheduled or due items for each day from TickTick (the active task system in [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]]) and thread them in alongside calendar events.
- **Weather inline** - if a forecast MCP becomes available, show a short descriptor + high/low on each date header.
- **Collapsible days** - fold empty days by default, or past days once the window ever widens beyond "next 7"; keeps the at-a-glance promise when the view gets busy.
- **Overlap badge richness** - hover/tooltip on the "Overlap" pill could list the specific clashing event title and time range, so a double-booked slot is actionable without scrolling to find its mate.
- **Sparkline legends and ticks** - add subtle hour-tick marks every three hours, and optionally a faint "now" marker on the current day so the sparkline reads as a live rather than summary view.
- **Narrative summaries** - the `sample()` swap from the Updating section, framed as a deliberate stylistic enhancement. Consider a one-line British-English tone brief in the prompt so the voice stays consistent across days.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Live Artifacts|Live Artifacts]] - parent index
- [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/AI Automation Patterns|AI Automation Patterns]] - general patterns for recurring AI automations
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Cowork Configuration Layers|Cowork Configuration Layers]] - where Cowork preferences and rules live
