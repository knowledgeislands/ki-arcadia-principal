---
tags:
  - card/note
  - topic/ai
  - topic/productivity
  - topic/automation
  - topic/engineering
  - topic/project-management
  - source/claude
status: current - April 2026
purpose: Reusable recipe for the Cowork "Linear Open Issues Tracker" artifact - a live workspace-wide view of open issues with project/priority grouping, team/assignee/status chip filters, stale callouts, a view toggle, and time-based project progress bars
author: Written with Claude
---

# Linear Open Issues Tracker Artifact

## Overview

A self-contained Cowork HTML artifact that renders every open Linear issue across the workspace, grouped by project then priority by default, with a one-click switch to a priority-first lens. Pinned in the Cowork sidebar; re-fetches the full open set on each open via `window.cowork.callMcpTool`, so no manual refresh or stale snapshots. Designed to be the default landing page for workspace-wide triage - summary counts at the top, filterable detail below (by team, assignee, status, or free-text search), and a live time-based progress bar on every project card with dated scope. One click on any row opens the issue in Linear.

---

## What It Produces

- Header meta line: `N issues across M teams · updated HH:MM` using the local time of the render.
- Summary row of eight stat tiles: total open, Urgent, High, Normal, Low, In progress (status type `started`), **Stale 14d+** (amber tile counting issues whose `updatedAt` is older than `STALE_DAYS`), and No project.
- Controls panel with four rows:
  - **Row 1** - free-text search (matches `id`, title, team, project, assignee), a segmented **view toggle** (Project → Priority · Priority → Project), and Expand all / Collapse all buttons.
  - **Row 2** - a chip per team showing its open-issue count, preceded by **All / None** bulk buttons that flip every team chip in one click.
  - **Row 3** - a chip per assignee showing their open-issue count (sorted by count desc, Unassigned pinned to the end), with the same **All / None** bulk buttons.
  - **Row 4** - a chip per workflow status showing its open-issue count, each prefixed with a small coloured dot matching its `statusType` (same palette as the row's status pill), sorted by status-type priority (In progress → To do / Unstarted → Triage → Backlog) then count desc, with the same **All / None** bulk buttons. Lets a triage session scope to e.g. just _In Progress_ and _In Review_ without touching the search box.
- **Project → Priority view** (default) - one card per project, sorted by Urgent count → High count → total count → name; the "No project" card is pinned to the bottom and starts collapsed. Each dated project card carries a time-based **progress bar** (elapsed fraction between `startDate` and `targetDate`) with a day-count label; the bar turns amber within 14 days of target and red once past target.
- **Priority → Project view** - one card per priority (Urgent → High → Normal → Low → No priority), tinted with its priority colour, each containing mini-cards per project within that priority. Same issue rows, same filters.
- Inside each project: priority buckets rendered in order Urgent → High → Normal → Low → No priority, each headed with a coloured dot, label, and count.
- Each issue row: Linear identifier, two-line truncated title, an amber **Stale** badge when the issue's `updatedAt` is older than `STALE_DAYS`, state-coloured status pill, team badge, relative updated time, and an initials avatar for the assignee (dashed outline when unassigned).
- Clicking any row opens the issue in Linear in a new tab via the issue's `url` field.
- An empty state message when no open issues match the current filters; an error banner with the thrown message when any `list_issues` call fails.

---

## Key Design Decisions

- **All open statuses and projects fetched in one `Promise.all`.** Four `list_issues` calls (one each for `state: "backlog"`, `"unstarted"`, `"started"`, `"triage"`) run in parallel with a single `list_projects` call - the projects index feeds the progress-bar computation. Completed and cancelled issues are excluded at source so the tracker never pays to walk years of closed history. `list_projects` fails soft: an error or missing field simply omits the bar rather than breaking the page.
- **Per-state pagination with a safety cap.** Each call loops over `cursor` / `hasNextPage` up to 15 pages of 250 issues. Plenty of headroom for the current workspace; easy to lift if it ever caps out.
- **De-duped by `id` after merge.** A `Map` keyed by issue `id` protects against the edge case where an issue moves between state buckets during the four parallel fetches.
- **Defensive open-state filter at render time.** Items whose `statusType` is not in `OPEN_TYPES` or that carry `archivedAt` are dropped a second time before rendering - belt and braces against MCP response surprises.
- **Priority numbering is non-intuitive and encoded deliberately.** Linear uses `0 = None, 1 = Urgent, 2 = High, 3 = Normal, 4 = Low`, so sort order is `[1, 2, 3, 4, 0]` (None rendered last, not first). The `PRIORITY_ORDER` and `PRIORITY_META` constants are the single place to adjust this.
- **Project sort triages the workspace.** Cards are ordered by Urgent count desc, then High count desc, then total count desc, then name asc - the project with the most on fire floats to the top without extra clicks.
- **"No project" is collapsed by default.** Loose issues exist but shouldn't dominate the view when it first opens.
- **Time-based progress, not a reported `progress` field.** Linear's `list_projects` does not expose a universal completion percentage, so progress is derived deterministically from `startDate` → `targetDate` elapsed fraction, with three variants: _normal_ (green), _close_ (amber, within 14 days of target), and _over_ (red, past target). Projects without both dates simply render without a bar - no noisy placeholder. The rule lives in a single `computeProgress(project)` function.
- **Stale threshold is a named constant.** `STALE_DAYS = 14` drives both the row-level amber "Stale" badge and the summary stat tile. Adjusting the definition of stale is a one-line edit; everything - badge, stat tile count, tooltip text - follows.
- **View-mode state triggers a full re-render.** A `state.viewMode` of `'project'` or `'priority'` selects between `renderByProject()` and `renderByPriority()`. Toggling re-runs the chosen renderer, then re-applies filters - search term, team chips, assignee chips, and status chips are all preserved across the switch.
- **Filters roll up generically across DOM structures.** `applyFilters()` walks every `.issue`, toggles `.hide` based on team × assignee × status × search, then hides any empty `.bucket`, `.project-mini`, `.project`, or `.priority-card` container. The same function works whether the current view is project-first or priority-first - no view-specific filter logic.
- **Assignee keys disambiguated with a fallback chain.** Chip identity uses `issue.assigneeId` if present, else the assignee's display name, else the synthetic `UNASSIGNED_KEY` constant. This protects against MCP responses that omit stable IDs and keeps Unassigned grouped as a single pinned chip.
- **Status chips key on display name, not `statusType`.** Linear workflows carry multiple user-defined statuses inside each `statusType` (e.g. "In Progress", "In Review", and "Ready for QA" are all `started`), so the filter uses `issue.status` as the identity to retain that granularity. The chip's coloured dot is driven by the issue's `statusType` via the `STATUS_TYPE_ORDER` map so the palette matches the on-row status pill exactly. Sort order is statusType priority (`started` → `unstarted` → `triage` → `backlog`) then count desc then name asc, which keeps active-work statuses at the front of the row.
- **Bulk chip toggles are first-class.** Each chip row (teams, assignees, and statuses) has its own `All` / `None` button pair so a triage session can scope to a single person, team, or workflow stage in two clicks rather than many.
- **Deterministic rendering, not `sample()`.** All grouping, sorting, and summary logic is plain JS - reloads are consistent, no model latency, no variance between opens. See **Deterministic vs `sample()` Synthesis** in [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/AI Automation Patterns|AI Automation Patterns]].
- **Loading skeleton for instant perceived response.** On every open, a shimmer skeleton is rendered synchronously before the first `await` - 8 shimmer stat boxes in `#summary` and 3 shimmer project cards in `#tracker` - eliminating the blank-white flash while the Linear MCP calls run. The skeleton uses the same `@keyframes shimmer` moving-gradient pattern as the other live artifacts.
- **In-memory cache with a 5-minute TTL.** `_cache` and `_cacheTime` are declared at module level (outside the IIFE) so they survive sidebar re-focus without triggering a re-fetch. On a cache hit, `state.issues` and `state.projectsById` are restored from the cached entries, and `hydrateAndRender(true)` is called - filter chips (teams, assignees, statuses) are re-derived from the cached issues array so nothing stale leaks into the UI. Cache is invalidated after `CACHE_TTL = 5 * 60 * 1000` ms.
- **Cache badge makes the data source visible.** A small pill in the header shows "⚡ from cache · fetched Ns ago" (grey) on cache hit, or "↻ live · Nms" (green) when a live fetch just completed. Updates automatically after every render.
- **Light-mode, storage-free, inline** - `:root { color-scheme: light }`, neutral panel palette, priority-dot colours, and state-type-coloured status pills; no `localStorage` (cache lives in module-level JS variables, not browser storage); all CSS and JS inlined; error banner on top-level `.catch`. See **Live Artifact Baseline** in [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/AI Automation Patterns|AI Automation Patterns]].

---

## Reusable Prompt

Paste this to rebuild or adapt the artifact:

```
Create a Cowork HTML artifact called "Linear Open Issues Tracker" that:

- On open, fetches every open Linear issue across the workspace's teams via
  the Linear MCP's list_issues tool, plus the workspace's projects via
  list_projects. Declare both in mcp_tools.
- Calls list_issues four times in parallel (one per open state type:
  backlog, unstarted, started, triage) alongside a single list_projects
  call, all in one Promise.all. Each list is paginated via cursor up to a
  safety cap. Excludes completed, cancelled, and archived issues.
  list_projects fails soft - if it errors, progress bars are simply omitted.
- Groups issues first by project (fallback bucket "No project" for loose
  issues) and then by priority inside each project, using Linear's numeric
  scheme: 0 = None, 1 = Urgent, 2 = High, 3 = Normal, 4 = Low. Render order
  is [1, 2, 3, 4, 0].
- Sorts projects by urgent count desc, high count desc, total count desc,
  name asc. "No project" pins to the bottom and starts collapsed.
- Provides a segmented view toggle that switches the top-level grouping
  between "Project → Priority" (default) and "Priority → Project". Both
  views share the same filter state and the same issue rows.
- Renders a summary row of stat tiles: total open, Urgent, High, Normal,
  Low, In progress (status type "started"), Stale 14d+ (amber tile
  counting issues whose updatedAt is older than STALE_DAYS, default 14),
  No project.
- Provides a search box (matches id, title, team, project, assignee), a
  per-team chip row with open-issue counts and All/None bulk buttons, a
  per-assignee chip row with open-issue counts and All/None bulk buttons
  (Unassigned pinned to the end), a per-status chip row keyed by the
  display-name status (not statusType) with All/None bulk buttons -
  each chip prefixed with a small statusType-coloured dot, sorted by
  statusType priority (started → unstarted → triage → backlog) then count
  desc - and Expand/Collapse all buttons.
- For each issue row: Linear id, truncated title, an amber "Stale" badge
  when updatedAt is older than STALE_DAYS, state-coloured status pill,
  team badge, relative updated-time badge, initials avatar for assignee,
  whole row links to the issue's url in a new tab.
- For each project card in the Project → Priority view, renders a
  time-based progress bar computed from the project's startDate and
  targetDate as the elapsed-time fraction. Three variants: normal (green),
  close (amber, within 14 days of target), over (red, past target).
  Projects without both dates render without a bar.
- Uses a shared applyFilters() that walks every .issue, hides based on
  team × assignee × status × search, then rolls up to hide empty
  containers - the same logic works across both views.
- Show a shimmer skeleton synchronously on open before any await: 8 stat
  box shapes in #summary and 3 project card shapes in #tracker, using a
  @keyframes shimmer animation with a moving linear-gradient. Eliminates
  the blank-white flash during MCP fetch.
- Cache the fetched issues and projects in module-level variables (_cache,
  _cacheTime) declared outside the IIFE. CACHE_TTL = 5 * 60 * 1000 (5
  minutes). Store { issues: state.issues, projectsByIdEntries:
  Array.from(state.projectsById.entries()) }. On a cache hit, restore state
  from the cache entries and call hydrateAndRender(true) - re-derive filter
  chips from the cached issues so nothing stale leaks. Show a small badge:
  "⚡ from cache · fetched Ns ago" (grey) on cache hit, "↻ live · Nms"
  (green) on live fetch.
- Uses light-mode styling only (:root { color-scheme: light }).
- Inlines all CSS and JS; no localStorage; no external fetches.

If an error banner appears on open, surface the thrown message so a broken
MCP connector is diagnosable without DevTools.
- Embed the comment <!-- Recipe: Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Linear Open Issues Tracker Artifact.md --> as the first line of the <head>; preserve it through any regeneration or patch.
- If you modify this artifact, update the recipe note at the path in that comment - use the specific Knowledge Island's skill in SAVE mode. Read the note first and merge in; update only the sections that changed.
```

One-liner version that gets you the same result via the usual clarification flow:

> "Build a live tracker for my open Linear issues, grouped by project and priority." - then pick _All open issues in my teams_, _Project → Priority_, _Yes, include a No project bucket_.

---

## Updating

Follow the **Two-Mechanic Update Protocol** in [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/AI Automation Patterns|AI Automation Patterns]]; this artifact's `id` is `linear-open-issues-tracker`.

Common in-place changes and where to make them:

- **Narrow scope to "assigned to me."** Add `assignee: "me"` to the `args` object in `fetchByState()` - the MCP accepts the literal string `"me"`. To include issues you created as well, this would need a second fetch path plus a merge.
- **Change what counts as open.** Edit the `OPEN_TYPES` set and the array of state types passed to `Promise.all`. The two must stay in sync - the set is also used as a render-time filter.
- **Change priority labels, ordering, or colours.** Edit `PRIORITY_ORDER` and `PRIORITY_META`. The `PRIORITY_META[pv].key` value drives the CSS class name (`urgent`, `high`, `normal`, `low`, `none`), so update the CSS `--urgent` / `--high` / etc. custom properties at the top of the stylesheet if the visual palette changes.
- **Lift the pagination cap.** Change the `for (let page = 0; page < 15; page++)` loop bound in `fetchByState` (and the equivalent `< 10` bound in `fetchAllProjects`). The current caps handle 3,750 issues per state bucket and 2,500 projects per fetch; raise them before a workspace grows past that.
- **Adjust the stale threshold.** Edit the `STALE_DAYS` constant near the top of the script. The same value powers the row-level "Stale" badge, the summary stat tile's count, and the stat tile's label - the edit is a single source of truth.
- **Retune the progress variants.** Edit `computeProgress(project)`: the `now > target` check drives the _over_ variant, the `daysLeft <= 14` threshold drives the _close_ variant. The CSS custom properties `--progress-fill`, `--progress-close`, `--progress-over` set the three colours.
- **Swap to a different project-progress signal.** If Linear starts exposing a numeric completion field, replace `computeProgress` with a function that reads it directly - the call site in `renderProjectCard` only cares about the returned `{pct, label, variant}` shape.
- **Add a third view mode.** Extend `state.viewMode`, add a third button in `#view-toggle`, and add a `renderByWhatever()` function. The generic `applyFilters()` will work unchanged provided the new view uses the same `.issue` rows inside containers it knows (`.bucket`, `.project-mini`, `.project`, `.priority-card`) - if it introduces a new container type, add its selector to `containerSelectors` in `applyFilters`.
- **Change the assignee identity rule.** The fallback chain is in the initial `state.assigneesMap` build: `assigneeId` → display name → `UNASSIGNED_KEY`. Each key must match the `data-assignee` attribute written by `renderIssue` - edit both sites together.
- **Change the status filter identity or sort.** Chip identity is `issue.status` (the display name on the pill), written as `data-status` on each `.issue` and echoed into `state.statusesMap` during fetch - edit those two sites together if switching to e.g. `statusType` (which would coalesce "In Progress" and "In Review" into a single chip). Sort order lives in the `STATUS_TYPE_ORDER` map and the `entries.sort(...)` call inside `wireStatusChips()`; the chip's coloured dot uses the `.sdot[data-type="..."]` CSS rules, which share their custom properties (`--status-backlog`, `--status-unstarted`, `--status-started`, `--status-triage`) with the on-row status pill so the palettes stay aligned.
- **Tune the cache TTL** - change the `CACHE_TTL` constant (milliseconds). What's cached: `{ issues: state.issues, projectsByIdEntries: Array.from(state.projectsById.entries()) }`. Filter chips are always re-derived from the cached issues array on each hit. Set `CACHE_TTL = 0` to disable caching entirely and always fetch live.
- **Rewired MCP connector** - see **MCP Connector Rewiring** in [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/AI Automation Patterns|AI Automation Patterns]]. Constants to update: the `ISSUES_TOOL` and `PROJECTS_TOOL` constants in the script and both entries of the `mcp_tools` declaration. A mismatch fires the error banner with `list_issues failed for state=backlog`.

Verify per the **Two-Mechanic Update Protocol**: open the artifact, hit Reload, check the meta line (issue count, teams count, updated timestamp) plus the state-type colour on a known in-progress issue. On a second open within 5 minutes, confirm the cache badge reads "⚡ from cache" and the issue count matches. Then apply **Recipe Self-Synchronisation** - update this note at `Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Linear Open Issues Tracker Artifact.md` using the specific Knowledge Island's skill.

---

## Potential Enhancements

Ordered roughly by effort - small and practical first, creative last.

- **SLA risk surfacing** - the MCP returns `slaBreachesAt`, `slaHighRiskAt`, and `slaMediumRiskAt`; render a red/amber pill on any at-risk issue so SLA-sensitive items are visible without a separate view.
- **Cycle-aware "now" section** - resolve the active cycle per team via `list_cycles`, render a pinned "Current cycle" panel at the top separate from the full backlog.
- **Labels as filter chips** - render issue labels inline on rows and expose them as an optional filter row; useful when labels carry workflow meaning like `needs-triage` or `blocked`.
- **Weekly Slack digest** - a scheduled task that renders the same summary as text and posts it to `#eng-standup` each Monday morning; keeps the tracker top-of-mind without requiring an open.
- **Cross-link to PRDs and docs** - when an issue description carries a Notion URL, render a small doc-icon button on the row for one-click context without leaving the tracker.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Live Artifacts|Live Artifacts]] - parent index
- [[Pillars/Knowledge Islands/Governance/Tools/Linear/Linear|Linear]] - MCP usage notes, UI patterns, and lessons learned
- [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/AI Automation Patterns|AI Automation Patterns]] - general patterns for recurring AI automations
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Cowork Configuration Layers|Cowork Configuration Layers]] - where Cowork preferences and rules live
