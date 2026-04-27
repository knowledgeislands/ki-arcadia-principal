---
tags:
  - card/note
  - topic/ai
  - topic/productivity
  - topic/automation
  - topic/email
  - source/claude
status: current - April 2026
purpose: Reusable recipe for the Cowork "Email Pulse" artifact - a live, read-only view of the HNR Outlook _TRIAGE folder set with an optional per-folder message drill-down and a live Suggestions panel fed by the hnr-knowledge-base-mcp-server
author: Written with Claude
---

# Email Pulse Artifact

## Overview

A self-contained Cowork HTML artifact that mirrors the shape of [[Pillars/Knowledge Capital/Email/Email Status|Email Status]] - the pie and folder-count table - but re-queries Microsoft 365 on every open, so counts are always current rather than frozen to the last `Route Inbound` run. Pinned in the Cowork sidebar; re-fetches via `window.cowork.callMcpTool`. Designed as a live companion to the `Email Status.md` snapshot rather than a replacement: the scheduled tasks continue to rewrite the markdown (preserving the KB graph and audit trail), while the artifact is the live read surface used during the day.

v1 is deliberately **read-only**: the artifact never modifies inbox or KB state. One optional surface layers on top of the core counts view - a per-folder message drill-down that fetches and lists subjects on click, toggled via a checkbox at the top of the page and off by default. A compact Suggestions panel surfaces pending routing suggestions fetched live from `Email Routing Queue.md` via the `hnr-knowledge-base-mcp-server` MCP on every open; decisions on those suggestions are taken by editing the markdown file directly; write-back from the artifact is the primary v2 direction and is captured under Potential Enhancements.

On every open a shimmer skeleton (pie circle + table rows) renders immediately while the M365 and KB calls resolve, eliminating blank-white flash. Data is stored in a module-level in-memory cache with a 5-minute TTL; revisiting the artifact while the page remains loaded skips all network calls and renders instantly from the cached result. A `visibilitychange` listener fires `boot()` whenever the page becomes visible again and the cache has expired - this covers the case where Cowork keeps the WebView alive across sidebar restarts but the in-memory cache has cleared, which would otherwise cause 400 errors from MCP calls firing before connections have warmed. The boot logic lives in a named `async function boot({ force = false } = {})` so it is callable from both the initial load and the visibility listener; a `clearCache()` helper companion to `setCache()` allows forced-refresh code paths.

**Note - flagged panel currently disabled.** The `fetchFlaggedPanel()` call is a no-op pending Outlook search folder availability (see Flagged panel entry under _What It Produces_ below).

---

## What It Produces

- Header meta line: `N emails across F triage folders · U unread · since last Route Inbound run HH:MM (±Nh ago)`. The since-last-run timestamp is fetched live from `Email Routing Queue.md` via `hnr-knowledge-base-mcp-server`; falls back to `SNAPSHOT_AT` if the MCP is unavailable.
- Delta pill: `+12 since last run` - live total minus the `SNAPSHOT_TOTAL` baked from `Email Status.md`. Amber when positive, neutral when zero or when the snapshot is older than 24 hours.
- Controls panel: a **Show messages on click** checkbox (drill-down toggle, off by default), and an **Actions panel** listing runnable activities - each row shows a short label and the command phrase and is clickable to copy the phrase to the clipboard. Clipboard copy uses a two-stage approach: `navigator.clipboard.writeText` first, falling back to `document.execCommand('copy')` for sandboxed iframes where the Clipboard API is blocked. The four built-in activities are: Route Inbound (`run the email route review`), Refresh Snapshot (`refresh Email Pulse snapshot`), Review Routing Queue (`review the email routing queue and suggest new rules`), Clear Disposal (`process the 981 Delete and 991 Junk folders`). No self-hosted Reload button - the Cowork sidebar header already provides one; duplicating it inside the artifact is discouraged by the `create_artifact` tool guidance. A **cache badge** in the controls row signals the data source: `⚡ from cache · fetched Nm ago` (green-tinted) when the render was served from the in-memory cache, or `↻ live · Nms` when data was fetched fresh from M365.
- **Loading skeleton** - shown immediately on open while the MCP calls are in flight: a shimmer-animated circle in the pie column and shimmer row-cells in the table column. Eliminates the blank-white flash that would otherwise appear during the M365 round-trip.
- **Pie** - inline SVG with the same slice ordering and colour accents as the `Email Status` mermaid pie. Shares a `FOLDER_ORDER` array with the table.
- **Folder table** - one row per `_TRIAGE` subfolder in `FOLDER_ORDER`: identifier, live count, live unread, chevron to expand. Totals row pinned at the bottom.
- **Expanded drill-down** (only when the toggle is on and a row is expanded) - recent messages in that folder via `list-emails`: subject (two-line truncate), sender, relative time. Clicking a row copies a readable descriptor - `"<subject>" - <fromName> <<fromEmail>> (<when>)` - to the clipboard. The M365 MCP's `list-emails` output does not expose a `webLink`, and an unread flag is not surfaced in the plain-text response, so there is no per-row unread dot and no link to navigate.
- **Suggestions panel** (fixed at the bottom) - read-only summary of pending routing suggestions fetched live from `Email Routing Queue.md` via `hnr-knowledge-base-mcp-server` on every open. Filters out `agreed` and `disagreed` rows; shows count, compact list of pattern → target folder with matches count, and a live "as at" timestamp. Hidden entirely when no pending suggestions remain. Shows an error state rather than crashing if the MCP is unavailable. A one-line pointer reads "Edit `Email Routing Queue.md` to agree or dismiss; then tell Claude to run the email route review."
- **Flagged panel** - **currently disabled.** `fetchFlaggedPanel()` is a no-op that clears `#flagged-panel` and returns immediately. The panel div renders as blank. Reason: `search-emails` with `{ flaggedOnly: true }` requires Outlook search folders which are not available in this mailbox - the M365 MCP returns `"No Outlook search folders were returned for this mailbox"`. To re-enable: replace the no-op body with the full implementation, restore `.flagged-panel*` CSS classes, and reinstate the call comment. When re-enabled, the design intent is: renders immediately after main content; fires independently of the main render; calls `search-emails` (`SEARCH_EMAILS`) with `{ flaggedOnly: true, receivedAfter: flaggedReceivedAfter(), count: FLAGGED_TOP_N, responseFormat: "json" }`. `flaggedReceivedAfter()` returns today minus one month as `YYYY-MM-DD`. `FLAGGED_TOP_N = 10`. Layout: red-tinted header ("🚩 Flagged - N most recent" · latency · "click to copy"), then a list where each row has `.fi-when` (52 px right-aligned, relative time), `.fi-body` (`.fi-subj` + `.fi-from` stacked), and `.fi-folder` chip (truncating pill, red accent). Clicking a row copies the descriptor `"<subject>" - <fromName> <<fromEmail>> (<whenAbs>)` to the clipboard via the shared `copyToClipboard` helper. Shows a loading skeleton (`renderFlaggedLoading`) immediately, then resolves to the list, an empty state, or an error state.
- **Debug panel** - a collapsible MCP call log rendered inside `#footer` when the `#debug-toggle` checkbox is checked (`state.debugOn = true`). Every `callMcp()` invocation appends an entry to `state.callLog`; `syncDebugVisibility()` is called after each mutation to keep the panel live. Each row shows an icon (⏳/✓/❌), the call label, and a stat string (latency, char count, `returnedCount` or item count if available; error brief on failure). Rows are clickable to expand a detail pane showing the raw request params and full response text (or error kind + message). The response section of each expanded detail pane includes a **copy** button (`.dbg-copy-btn`) inline in the label - clicking it copies the full raw response text to the clipboard via `copyToClipboard(entry.rawText)` using `data-copy-cid` attributes that look up the entry in `state.callLog` by ID; `ev.stopPropagation()` prevents the copy click from toggling the row expand/collapse. Error rows are styled with a red-tinted background (`.has-error`); the copy button on error rows takes a matching red tint. Auto-enabled when the main render produces `total === 0` (i.e. no triage folders parsed), so format-mismatch failures are diagnosable without opening DevTools. `attachDebugHandlers(panel)` wires both the row expand/collapse listeners and the copy button listeners after each re-render.
- **Footer**: generated-at timestamp, `list-folders` call latency (or "served from memory cache" note on cache hit), build-time timestamp of the baked Status snapshot, and live fetch timestamp of the routing queue (or unavailable note). When `list-folders` returns data but no triage folders are parsed (total = 0), the footer includes the raw response text (first 1,200 characters) as a monospace debug block, and the debug toggle is auto-enabled.
- Empty state if no `_TRIAGE` subfolders return; error banner with the thrown message when any top-level call fails.

---

## Key Design Decisions

- **Four live sources, one baked source.** Live: `list-folders` (counts + unread), `list-emails` (drill-down), `search-emails` (flagged panel), and `kb_read_note` via `hnr-knowledge-base-mcp-server` (routing queue suggestions + last-run timestamp). Baked at build time: the `Email Status.md` total (for the delta pill), sitting as `SNAPSHOT_TOTAL` / `SNAPSHOT_AT` constants. The `list-folders` and `kb_read_note` calls fire in parallel via `Promise.allSettled` so a KB MCP failure never blocks the M365 folder data from rendering. The `search-emails` call fires independently after the main render.
- **Read-only in v1.** No Approve / Dismiss, no command composition, no direct file writes. Decisions on routing suggestions are taken by editing `Email Routing Queue.md` - already the source of truth. This keeps v1 honest about the sandbox's capabilities and its one-way data flow. Write-back is the explicit v2 direction under Potential Enhancements.
- **Loading skeleton for instant perceived response.** A shimmer-animated layout (CSS `@keyframes shimmer` with a moving gradient) renders synchronously before any `await`, giving the user immediate visual feedback. The skeleton matches the real layout: a circle in the pie column and row-cells in the table column. Eliminates blank-white flash on every open, regardless of M365 latency.
- **In-memory cache with 5-minute TTL.** Module-level `_cache` and `_cacheTime` variables store the last successful `{ rows, total, unread, queue, rawFoldersText, latencyMs }` result. On boot, `getCached()` checks whether the data is within `CACHE_TTL` (default 5 minutes); a hit calls `renderAll` directly, skipping both MCP calls entirely and showing the skeleton only for the briefest flash before the cache renders. A cache miss shows the skeleton and fetches normally. The cache is cleared on hard reload or when the page is destroyed - this is intentional rather than a limitation: Cowork's Reload button gives the user a clean fetch on demand. The per-folder drill-down `Map` (`state.drillCache`) is a separate, independent cache that also persists for the page lifetime and has no TTL.
- **`visibilitychange` listener guards against stale WebView state.** When Cowork restarts but keeps the WebView alive (common in sidebar panels), the module-level `_cache` and `_cacheTime` variables may survive. If the cache TTL has expired by the time the artifact becomes visible again, `boot()` fires fresh MCP calls - but the MCP connections may not have re-warmed yet, producing 400 errors. The fix: `document.addEventListener('visibilitychange', () => { if (document.visibilityState === 'visible' && !getCached()) boot(); })`. This defers the fresh fetch until the user actually sees the panel (when connections are typically ready) rather than firing immediately on Cowork startup. The boot logic is extracted from the IIFE into a named `async function boot({ force = false } = {})` so it is callable from both the initial load and the listener without code duplication. A `clearCache()` helper (companion to `setCache()`) supports any future forced-refresh path.
- **Cache badge makes the data source visible.** After every render, a small pill in the controls row shows `⚡ from cache · fetched Nm ago` or `↻ live · Nms`. This prevents silent confusion about whether counts are current - the user always knows whether they're looking at a cached or live view without needing to check the footer.
- **Drill-down is opt-in for pay-as-you-go cost.** Default state has the checkbox off and per-row fetch disabled. Flipping the toggle enables row expansion, which triggers a fresh `list-emails` call scoped to that folder with `count: 25` (the MCP's parameter is `count`, not `pageSize`, and caps at 50). Results cache in a `Map` keyed by folder name for the lifetime of the session so re-expanding doesn't re-fetch.
- **Folder identification by name prefix, not ID.** Folders match the three-digit numeric prefix in their display name (`000`, `101`, `111`, etc.) - the same convention used in `Email Routing Config.md`. Resilient to folder renames as long as the prefix is preserved. `list-emails` is called with the folder's display name; the MCP resolves it internally, so the artifact never needs to track Microsoft Graph folder IDs. The `parseTriageFolders` function matches any line in the `list-folders` response whose folder name begins with the three-digit prefix (`/^\d{3} \S/`), at any indentation level - it does **not** require a `_TRIAGE` parent heading to appear in the output, as the M365 assistant's response format is not guaranteed to include it.
- **Ordering mirrors `Email Status.md` exactly.** A single `FOLDER_ORDER` array drives the table rows and the pie slice order, so the artifact reads as a live version of the same document rather than a redesign.
- **Pie rendered as inline SVG.** No third-party render dependency and no extra MCP round-trip on open. Colours and slice order match `Email Status.md`'s mermaid pie visually but not pixel-exactly - a deliberate trade: the artifact should not fan out to a second MCP call every time it opens just to redraw a chart.
- **Delta pill uses the snapshot, not a second live call.** The comparison point is "what the last Route Inbound run left behind," which is exactly what `Email Status.md` records. Baking the snapshot at build time is therefore correct - a live second call would compare live-to-live and tell the user nothing.
- **Since-last-run colour signal.** Under `RUN_WARN_HOURS` (default 4) → neutral. Between `RUN_WARN_HOURS` and `RUN_ALERT_HOURS` (default 12) → amber. Over `RUN_ALERT_HOURS` → red, and the Route Inbound row in the Actions panel takes visual emphasis (red label, warm background).
- **Clipboard copy is not write-back.** The Actions panel rows (each copies an instruction phrase) and row-click on expanded messages (copies a readable descriptor) are read-only affordances - the artifact itself makes no changes to any external state. The user decides whether and when to paste. Clipboard access uses a two-stage approach (`navigator.clipboard.writeText` with `document.execCommand('copy')` fallback) because the Clipboard API is blocked in sandboxed iframes.
- **No localStorage; in-memory cache instead.** Per **Live Artifact Baseline** in [[Pillars/Knowledge Islands/Governance/Tools/Claude/AI Automation Patterns|AI Automation Patterns]], `localStorage` isn't reliable in the artifact sandbox and is never used. The 5-minute in-memory cache is the correct scope for this artifact: it survives sidebar re-focus (where the page stays loaded) but resets on hard reload, which is exactly what the Cowork sidebar Reload button provides. Toggle state (drill-down checkbox, row expansion) still resets on reload - also intentional.
- **Deterministic, not `sample()`-driven.** All counts, deltas, and ordering are plain JS. `sample()` is available for a one-sentence narrative summary of inbox state later, but v1 leans on structured data.
- **Light-mode, storage-free, inline** - `:root { color-scheme: light }`, neutral panels with a warm accent on the delta pill, all CSS and JS inlined, error banner on top-level `.catch`. See **Live Artifact Baseline** in [[Pillars/Knowledge Islands/Governance/Tools/Claude/AI Automation Patterns|AI Automation Patterns]].

---

## Reusable Prompt

Paste this to rebuild or adapt the artifact:

```
Create a Cowork HTML artifact called "Email Pulse" that:

- On open, immediately renders a shimmer loading skeleton matching the
  real layout: a shimmer-animated circle (CSS @keyframes shimmer with a
  moving gradient) in the pie column and shimmer row-cells in the table
  column. The skeleton must appear synchronously before any awaited call,
  so there is no blank-white flash during the M365 round-trip.

- Uses a module-level in-memory cache with a 5-minute TTL (CACHE_TTL =
  5 * 60 * 1000). Store _cache and _cacheTime at module scope. Provide
  setCache(data), getCached(), and clearCache() helpers. On boot, call
  getCached(): if data is within TTL, call renderAll() directly and
  return - no MCP calls, no skeleton delay. On cache miss, show the
  skeleton, fetch, store with setCache(), then renderAll(). After every
  render show a cache badge in the controls row: "⚡ from cache · fetched
  Nm ago" (green-tinted pill) on a cache hit, "↻ live · Nms" on a live
  fetch.

- Extract the boot logic into a named async function instead of an IIFE:
    async function boot({ force = false } = {}) { ... }
  Call boot() on initial load. Also add:
    document.addEventListener('visibilitychange', () => {
      if (document.visibilityState === 'visible' && !getCached()) boot();
    });
  This guards against Cowork keeping the WebView alive across restarts:
  when the panel becomes visible again with an expired cache, boot()
  re-fetches rather than leaving the user on a blank or errored panel.
  The force option (boot({ force: true })) calls clearCache() before
  checking - reserved for future forced-refresh affordances.

- Fetches the current counts of every _TRIAGE subfolder from Microsoft
  365 via the mcp-m365 MCP's list-folders tool, and fetches the
  routing queue live via the hnr-knowledge-base-mcp-server MCP's
  kb_read_note tool. Declare list-folders, list-emails, search-emails,
  and kb_read_note in mcp_tools. Fire list-folders and kb_read_note in
  parallel via Promise.allSettled so a KB MCP failure never blocks the
  folder data from rendering.

- Identifies _TRIAGE subfolders by matching any line in the list-folders
  response whose folder name begins with the three-digit prefix pattern
  /^\d{3} \S/ at any indentation level - do NOT require a "_TRIAGE"
  parent heading to appear in the output. The folder ordering is a single
  FOLDER_ORDER array taken from Email Status.md.

- Renders an inline SVG pie with the same slice ordering and colour accents
  as Email Status.md's mermaid pie (visual match, not pixel parity). No
  mermaid calls, no external renderers - SVG only.

- Renders a table with one row per folder: identifier, live count, live
  unread, chevron to expand. Totals row pinned at the bottom. The Count
  and Unread column headings must be right-aligned (text-align: right on
  the <th> elements) to match the body cells.

- Shows a header meta line: `N emails across F triage folders · U unread
  · since last Route Inbound run HH:MM (±Nh ago)`; colour the
  since-last-run fragment per RUN_WARN_HOURS (4) and RUN_ALERT_HOURS (12).

- Shows a delta pill derived from the live total minus SNAPSHOT_TOTAL
  (baked from Email Status.md at build time; include the snapshot's
  generated-at as SNAPSHOT_AT).

- Provides two top-of-page elements (no self-hosted Reload button - the
  Cowork sidebar header already provides one):
    - "Show messages on click" checkbox (drill-down toggle, off by default).
    - An Actions panel listing four runnable activities as clickable rows:
      Route Inbound ("run the email route review"), Refresh Snapshot
      ("refresh Email Pulse snapshot"), Review Routing Queue ("review the
      email routing queue and suggest new rules"), Clear Disposal ("process
      the 981 Delete and 991 Junk folders"). Each row shows a label and the
      command phrase; clicking copies the phrase to the clipboard.
      Clipboard copy must use navigator.clipboard.writeText first, with a
      document.execCommand("copy") fallback for sandboxed iframes where
      the Clipboard API is blocked.
      When the Route Inbound run is overdue (sinceFragment.hours >=
      RUN_ALERT_HOURS), highlight the Route Inbound row (red label, warm
      background).

- When the drill-down toggle is on and a folder row is expanded, fetches
  messages in that folder via list-emails with the folder display name
  and count: 25 (the MCP's parameter is `count`, not `pageSize`, and caps
  at 50). The output is plain text with no webLink and no unread flag -
  parse each line to extract subject, from-name, from-email, and when.
  Cache results in a Map keyed by folder name for the lifetime of the
  session. Rows show subject (two-line truncate), sender, relative time.
  Clicking a message copies a readable descriptor of the form
  `"<subject>" - <fromName> <<fromEmail>> (<when>)` to the clipboard;
  never navigate directly.

- [CURRENTLY DISABLED - see note below] Define fetchFlaggedPanel() as a
  no-op that clears #flagged-panel and returns immediately:
    async function fetchFlaggedPanel() {
      $("flagged-panel").innerHTML = "";  // disabled - remove to re-enable
    }
  The search-emails flaggedOnly call requires Outlook search folders which
  are not available in the current mailbox. When Outlook search folders
  become available, replace the no-op with: fire fetchFlaggedPanel()
  immediately after the main content renders, independently (not awaited
  by renderAll). Calls search-emails (SEARCH_EMAILS) with { flaggedOnly:
  true, receivedAfter: flaggedReceivedAfter(), count: FLAGGED_TOP_N,
  responseFormat: "json" } where FLAGGED_TOP_N = 10 and
  flaggedReceivedAfter() returns today minus one month as YYYY-MM-DD.
  Render a loading skeleton (renderFlaggedLoading) into #flagged-panel
  immediately; on resolution render the item list, empty state, or error
  state. Each item row: .fi-when (52 px right-aligned relative time),
  .fi-body (.fi-subj + .fi-from), .fi-folder chip (red-tinted pill).
  Clicking any row copies the descriptor "<subject>" - <fromName>
  <<fromEmail>> (<whenAbs>) to the clipboard. Use responseFormat:"json"
  so the response can be parsed with JSON.parse rather than line-by-line
  text. Restore .flagged-panel* CSS classes when re-enabling.

- Include a debug panel controlled by a "Show raw responses" checkbox
  (#debug-toggle) in the controls row alongside the drill-down toggle.
  state.debugOn tracks the checkbox state. Every callMcp() call appends
  an entry to state.callLog; after each mutation call syncDebugVisibility()
  which re-renders #debug-panel inside #footer when state.debugOn is true,
  or removes it when false. Each entry shows icon (⏳/✓/❌), call label,
  and stat line (latency, char count, returnedCount or item count; error
  brief on failure). Clicking a row expands a detail pane with the raw
  request params and full response text; the response label includes a
  copy button (.dbg-copy-btn) that copies the full raw response text to
  the clipboard - use data-copy-cid="${e.id}" on the button and look up
  entry.rawText in state.callLog by ID inside attachDebugHandlers(); call
  ev.stopPropagation() so the copy click does not toggle the row open/close.
  Error rows styled with red-tinted background (.has-error); the copy
  button on error rows takes matching red-tinted colours. Auto-enable the
  debug toggle (state.debugOn = true; #debug-toggle.checked = true) when
  renderAll() finds total === 0, so format-mismatch failures are
  diagnosable without DevTools.

- Fetches the routing queue live via kb_read_note, passing the constant
  ROUTING_QUEUE_PATH (vault-relative path to Email Routing Queue.md).
  Parse the `## Run State` table to extract the `Last Route Inbound Run`
  timestamp, and the `## Suggestions` table filtering out any row whose
  status column is `agreed` or `disagreed`. Renders a Suggestions panel
  at the bottom as a read-only summary: count, compact list of pattern →
  target with matches count, a live "as at" timestamp, and a one-line
  pointer: "Edit Email Routing Queue.md to agree or dismiss; then tell
  Claude to run the email route review." Hidden entirely when no pending
  suggestions remain. If the MCP is unavailable, show a styled error
  state inside the panel rather than crashing the artifact. No Approve /
  Dismiss, no Apply buttons - v1 is strictly read-only.

- Uses light-mode styling only (:root { color-scheme: light }).
- Inlines all CSS and JS; no localStorage; no external fetches.
- When list-folders returns successfully but no triage folders are parsed
  (total = 0), show the raw response text (first 1,200 characters) in a
  monospace debug block in the footer so format mismatches are diagnosable
  without DevTools.

If an error banner appears on open, surface the thrown message so a broken
MCP connector is diagnosable without DevTools.

- Embed the comment <!-- Recipe: Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Email Pulse Artifact.md --> as the first line of the <head>; preserve it through any regeneration or patch.
- If you modify this artifact, update the recipe note at the path in that comment - use the hnrkb skill in UPDATE mode. Read the note first and merge in; update only the sections that changed.
```

One-liner version that gets you the same result via the usual clarification flow:

> "Build a live version of Email Status that pulls fresh folder counts from M365." - then pick _Show messages on click as an option (off by default)_, _Read-only for v1_, _SVG pie, no mermaid_, _shimmer skeleton on load_, _5-minute in-memory cache_.

---

## Updating

Follow the **Two-Mechanic Update Protocol** in [[Pillars/Knowledge Islands/Governance/Tools/Claude/AI Automation Patterns|AI Automation Patterns]]; this artifact's `id` is `email-pulse`.

Common in-place changes and where to make them:

- **Refresh the baked snapshot total.** Same as above but for `SNAPSHOT_TOTAL` and `SNAPSHOT_AT`, read from the totals row of `Email Status.md`. Keep in sync after manual folder edits or the delta pill will mislead.
- **Change the cache TTL.** Edit `CACHE_TTL` (default `5 * 60 * 1000` = 5 minutes). Shorter values trade cache benefit for freshness; longer values trade freshness for speed. The Cowork Reload button always forces a live fetch regardless of TTL.
- **Change the `_TRIAGE` prefix pattern.** Edit the regex in `parseTriageFolders` (default `/^\d{3} \S/`). `FOLDER_ORDER` must stay aligned, or rows/slices will drop off.
- **Change folder ordering.** Edit `FOLDER_ORDER`. The pie and the table both derive from this one array.
- **Tune the run-recency thresholds.** Edit `RUN_WARN_HOURS` (default 4) and `RUN_ALERT_HOURS` (default 12). Header colouring and the Route Inbound action row emphasis follow.
- **Add or change Actions panel entries.** Edit the `<ul id="actions-list">` HTML and update `data-phrase` values. No JS change needed - the click handler reads `data-phrase` generically.
- **Change the drill-down page size.** Edit `DRILL_PAGE_SIZE` (default 25), which is passed to `list-emails` as `count` (the MCP's parameter name; caps at 50). Lift with care - each expand costs proportionally more.
- **Adjust the pie palette.** Slice colours are pulled from a shared `FOLDER_META` map keyed by folder identifier; edit entries there to change both the pie slice and the folder row's accent dot in one place.
- **Rewired MCP connector** - see **MCP Connector Rewiring** in [[Pillars/Knowledge Islands/Governance/Tools/Claude/AI Automation Patterns|AI Automation Patterns]]. Constants to update: `LIST_FOLDERS`, `LIST_EMAILS`, and `SEARCH_EMAILS` (mcp-m365), `KB_READ_NOTE` (hnr-knowledge-base-mcp-server), plus all four entries in the `mcp_tools` declaration. A mismatch fires the error banner (for folder failures), the flagged panel error state (for flagged search failures), or the suggestions error state (for KB failures) with the call name that failed.
- **Tune the flagged look-back window.** Edit `flaggedReceivedAfter()` - currently returns today minus one month as `YYYY-MM-DD`. To widen or narrow the window, adjust the `setMonth(d.getMonth() - N)` value.
- **Change the flagged top-N.** Edit `FLAGGED_TOP_N` (default 10). The `search-emails` `count` parameter caps at whatever the MCP allows; the recipe value is a soft limit on display, not a hard API limit.

Verify per the **Two-Mechanic Update Protocol**: open the artifact, check that the skeleton appears immediately, then resolves to live data with the `↻ live · Nms` badge. Click away and back within 5 minutes - the `⚡ from cache` badge should appear with no perceptible delay. Hit Reload to force a live re-fetch. Check the meta line (folder count, email total, since-last fragment) and the pie render. Expand one folder with the drill-down toggle on and confirm a message list returns. **Flagged panel - currently disabled:** confirm `#flagged-panel` is blank and no error appears (a visible error state or 400 in the debug panel means the no-op was not applied correctly). Enable "Show raw responses" and confirm the debug panel appears in the footer with one entry per MCP call; click an entry to expand the request/response detail; click the **copy** button in the response section and confirm the raw response text lands on the clipboard (the button click must not collapse the row). Confirm the Suggestions panel shows live pending suggestions from the routing queue and nothing is actionable inside the artifact (or is hidden if no pending items remain). Also verify the `visibilitychange` fix: close the Cowork sidebar, wait a few seconds, reopen - the artifact should re-fetch cleanly rather than showing a blank or error state. Then apply **Recipe Self-Synchronisation**: (1) update this note at `Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Email Pulse Artifact.md` using the `hnrkb` skill - read first and merge in, updating only changed sections; (2) write the colocation backup by reading `/Users/krisbrown/Documents/Claude/Artifacts/email-pulse/index.html` and writing it to `Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Email Pulse.html`.

---

## Potential Enhancements

Ordered roughly by effort - small and practical first, creative last.

- **Per-folder delta column.** Compute per-folder deltas against the `Email Status.md` snapshot so the table shows which buckets grew since the last run; amber the rows where delta is positive.
- **Unread-only drill-down filter.** A checkbox inside each expanded folder restricts the message list to unread; often the subset worth acting on.
- **Unread sparkline.** Persist each build's unread totals in a sidecar `Email Status History.json5` and render a 14-day sparkline next to the unread total.
- **One-click reply scaffold.** For messages in `101 Do` and `102 Urgent`, a button that copies a pre-filled prompt for drafting a reply via `mcp-m365 draft-email`, with the thread id included. Still read-only from the artifact's perspective - the user decides whether to paste.
- **Write-back for routing suggestions (v2).** Re-introduce Approve / Dismiss buttons on the Suggestions panel plus an Apply decisions button that composes a single Claude command of the form `Update Email Routing Queue: approve <pattern>, dismiss <pattern>, …` and copies it to the clipboard. The user pastes into Cowork chat; Claude edits `Email Routing Queue.md` via the `hnrkb` skill in UPDATE mode; the next `Route Review` run applies the changes. A new pattern for the recipes collection - consider hoisting to [[Pillars/Knowledge Islands/Governance/Tools/Claude/AI Automation Patterns|AI Automation Patterns]] once in use.
- **Direct file write-back when a filesystem MCP arrives.** If a cowork filesystem MCP becomes callable from artifacts, replace any clipboard bridge with a direct write to `Email Routing Queue.md`, surfacing the diff. Collapses the v2 pattern into a one-click action.
- **Route-drift alerts.** When the Route Drift task flags sustained miscategorisation, surface a banner suggesting the affected route needs inspection, with a button that opens the route note via `present_files`.
- **Narrative summary line.** A single British-English sentence under the header - "427 emails settled, 187 in 5G-EMERGE, 34 unread; last triage 2 hours ago" - generated via `window.cowork.sample()` with a deterministic fallback. See **Deterministic vs `sample()` Synthesis** in [[Pillars/Knowledge Islands/Governance/Tools/Claude/AI Automation Patterns|AI Automation Patterns]].
- **localStorage probe on first open.** On first load, write a test key to `localStorage` and read it back; if it survives, upgrade the cache to use `localStorage` with the same TTL logic so the cache persists across hard reloads as well. Log the result in the footer. This would make the cache resilient to Reload clicks in environments where `localStorage` is available.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Live Artifacts|Live Artifacts]] - parent index
- [[Pillars/Knowledge Capital/Email/Email|Email]] - KB-specific email configuration this artifact renders
- [[Pillars/Knowledge Capital/Email/Email Status|Email Status]] - the markdown snapshot this artifact complements
- [[Pillars/Knowledge Capital/Email/Email Routing Queue|Email Routing Queue]] - live source for the Suggestions panel, fetched via `hnr-knowledge-base-mcp-server`
- [[Pillars/Knowledge Islands/Governance/Activities/Email/Email|Email]] - the activity that writes `Email Status.md` and `Email Routing Queue.md`
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/AI Automation Patterns|AI Automation Patterns]] - general patterns for recurring AI automations
