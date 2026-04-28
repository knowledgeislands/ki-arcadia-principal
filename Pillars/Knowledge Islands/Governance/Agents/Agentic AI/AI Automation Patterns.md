---
tags:
  - card/note
  - topic/ai
  - topic/productivity
  - topic/automation
  - source/claude
status: current - April 2026
purpose: Design patterns for AI-driven productivity automations, covering performance, caching, and structural decisions
author: Written with Claude
---

# AI Automation Patterns

## Overview

Recurring patterns and design principles for AI-driven productivity automations - scheduled tasks, regular activities, and any Claude-powered workflow that runs repeatedly against the same KB configuration. These are generalisations derived from the design of specific activities such as [[Pillars/Knowledge Islands/Governance/Activities/Email/Email|Email]].

---

## Execution Frequency vs Change Frequency

When designing a scheduled automation, assess two independent rates for every input the task needs:

- **Execution frequency** - how often the task runs (e.g., 3× daily)
- **Change frequency** - how often the inputs to the task change (e.g., routing rules revised once a week or less)

When execution frequency significantly exceeds change frequency, loading and parsing those inputs fresh on every run is wasteful. The inputs are effectively static between runs - re-parsing them is redundant work that costs tokens and time.

The **execution/change ratio** is the key diagnostic:

| Ratio                                                              | Verdict                   |
| ------------------------------------------------------------------ | ------------------------- |
| Task runs several times per day; inputs change once a week or less | Strong case for caching   |
| Task runs daily; inputs change a few times a week                  | Worth evaluating          |
| Task runs weekly; inputs change frequently                         | Caching adds little value |

---

## JSON5 Cache Pattern

When the ratio justifies it, cache the compiled or parsed form of the slow-changing inputs in a JSON5 file in the temporary working folder.

### Structure

The cache file lives alongside other task artefacts:

```
tasks/{task-name}/{cache-name}.json5
```

The file contains a single JSON5 object with an `at` timestamp (ISO with offset) and the compiled data payload. Comments and trailing commas are permitted - JSON5 is preferred over plain JSON for readability.

### Cache check

Before parsing source files, check whether a valid cache exists:

```bash
newest_src=$(stat -c "%Y" source-file-1 source-file-2 2>/dev/null | sort -n | tail -1)
cache_mtime=$(stat -c "%Y" "$CACHE_FILE" 2>/dev/null || echo 0)
[ "$cache_mtime" -gt "$newest_src" ] && echo "CACHE_HIT" || echo "CACHE_MISS"
```

- **Cache hit** - the cache file is newer than all source files. Read it directly; skip parsing.
- **Cache miss** - a source file is newer than the cache (or the cache is absent). Parse the sources, write a fresh cache file, then proceed.

### Cache invalidation

The mtime check is the primary invalidation mechanism - when a source file is written (e.g., because an agreed rule was applied), its mtime updates and the next run detects a miss.

For explicit invalidation, delete the cache file. The next run will recompile. This is appropriate after bulk edits to source files within a single run - delete before stopping so the post-run state is clean.

### When not to cache

- The input is already a single, compact file that loads in one read (no marginal cost to reload).
- The input changes on the same schedule as the task runs (cache would be invalidated every run anyway).
- The task runs infrequently (weekly or less) - the overhead is negligible without a cache.

---

## Concrete Example - Route Inbound

The [[Pillars/Knowledge Islands/Governance/Activities/Email/Route Triage|Route Triage]] activity runs three times each working day. Its routing rules (the ordered rule list in `Email Routing Config.md` plus every `Route - *.md` file) change only when the user manually edits them or applies a suggestion - typically a few times a week at most.

Without a cache, every run parses 19+ Route files plus the routing rules note before doing any email work. With the ratio firmly in caching territory, the routing table is compiled once and stored as `tasks/email-triage/routing-table.json5`. Subsequent runs load a single pre-parsed file and skip source parsing entirely.

Invalidation is handled by the mtime check across `Email Routing Config.md` and all `Route - *.md` files. When Route Review applies an agreed suggestion (modifying a source file), the cache file is deleted at the end of that phase - the next run recompiles from the updated sources.

The cache schema is documented in the [[Pillars/Knowledge Islands/Governance/Activities/Email/Approach|Approach]] note under Routing Table Cache.

---

## Live Artifact Patterns

Recurring design decisions for Cowork HTML artifacts - self-contained pages that re-fetch data via `window.cowork.callMcpTool` on every open. Derived from the [[Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Live Artifacts|Live Artifacts]] collection.

### Live Artifact Baseline

Structural rules that apply to every Cowork HTML artifact:

- **Light-mode only.** `:root { color-scheme: light }`. Cowork's artifact chrome is light; dark-mode CSS adds complexity with no benefit.
- **No browser storage.** `localStorage` and `sessionStorage` are not reliably available in the artifact sandbox. All state lives in JS variables for the duration of the load.
- **Inline all CSS and JS; no external fetches.** The artifact must be self-contained. External CDN links introduce network dependencies and potential load failures.
- **Error banner on top-level `.catch`.** Wrap the entire fetch-and-render flow in a try/catch (or `.catch` on the top-level promise). On failure, replace the content area with a visible red banner carrying the thrown message - a broken MCP connector must be diagnosable without opening DevTools.
- **Verification surface.** Include a footer or meta line showing generated-at timestamp, entity counts, and any tool errors. This is the target for the reload-and-check step after any update - both mechanics can succeed silently while leaving the artifact in a broken state.

### Parallel MCP Fetch

When an artifact needs data from multiple endpoints or must fan out across repeated calls against the same endpoint, use `Promise.all` rather than sequential awaits:

```js
const results = await Promise.all(SOURCES.map((src) => window.cowork.callMcpTool(TOOL, { ...src })))
```

Where calls may return overlapping entities (e.g. fetching the same issue under different state buckets), de-dup after merging using a `Map` keyed by the entity's stable ID field:

```js
const seen = new Map()
for (const batch of results) {
  for (const item of batch) {
    if (!seen.has(item.id)) seen.set(item.id, item)
  }
}
```

If partial results are acceptable (one failing source should not abort all others), use `Promise.allSettled` instead and handle rejected entries individually.

### Client-Side Rolling Window

For time-based views, compute the window in JS from `new Date()` rather than baking dates into the prompt. This keeps the artifact useful indefinitely without a rebuild:

```js
const TZ = 'Europe/London' // single source of truth for the timezone
const now = new Date()
const windowStart = new Date(now - 24 * 60 * 60 * 1000)
```

Run all date formatting through `Intl.DateTimeFormat` with `timeZone: TZ` - nothing else needs touching when the timezone changes. Expose named constants for window bounds (e.g. `SPARK_START`, `SPARK_END` in minutes-of-day) rather than scattering literals through the code; the percentage maths and axis labels should all derive from those two constants.

### MCP Connector Rewiring

Tool names are `mcp__<uuid>__<method>`. The UUID is not stable - it changes when an MCP server is reinstalled or re-authenticated. The symptom is a silent failure that fires the error banner with a cryptic message.

Mitigation: expose the fully-qualified tool name as a named constant at the top of the script, and keep it in sync with the `mcp_tools` declaration on the artifact. When the connector is rewired, it is a one-line fix rather than a grep through the HTML:

```js
const TOOL = 'mcp__<uuid>__list_events' // update here and in mcp_tools if MCP is reinstalled
```

The `mcp_tools` declaration must reference the same string; a mismatch causes the call to be rejected before it reaches the network.

### Deterministic vs `sample()` Synthesis

Two modes for rendering derived text in an artifact:

- **Deterministic** - plain JS (counts, truncation, string concatenation). Fast, consistent across reloads, works offline, zero latency. Prefer for structured labels, grouping headers, and stat tiles.
- **`sample()`** - `window.cowork.sample()` with a tight prompt specifying language, a hard word cap, and a "no preamble, no quotes" instruction. Warmer and more readable for one-line summaries of unstructured text. Adds latency and variance.

When using `sample()`:

- Strip markdown and ID syntax (e.g. Slack's `<@Uxxx|Name>`, `<url|label>`) before passing text to the model - otherwise tokens are wasted on format artefacts.
- Always provide a deterministic fallback for when `sample()` errors or returns empty; the artifact must never block on summarisation.
- Run summary calls in `Promise.all` across all cards - do not await them sequentially.

To swap modes later: replace the `sample()`-driven function body with a JS-derived line (or vice versa). The swap is localised to one function.

### Two-Mechanic Update Protocol

Two mechanics are available for changing a live artifact without starting from scratch:

- **Regenerate in place.** Call `mcp__cowork__create_artifact` with the same `id` and replacement HTML. Cowork overwrites in place; the pinned artifact refreshes on next open. Use when touching more than one section.
- **Patch a fragment.** Use `mcp__cowork__update_artifact` to swap a targeted region. Cheaper when only a small area changes.

After either mechanic: open the artifact, hit the Reload button in the Cowork header, and check the verification surface (footer timestamp, counts, error banner). Both mechanics can succeed silently while leaving the artifact in a broken state. Then apply the Recipe Self-Synchronisation pattern below.

### Recipe Self-Synchronisation

Every live artifact should carry a pointer back to its recipe note, and any modification to the artifact should be reflected in that note.

**In the artifact HTML** - embed the recipe path as the first line of the `<head>`:

```html
<!-- Recipe: Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/<Recipe Name>.md -->
```

Preserve this comment through any regeneration or patch. It is the single source of truth for where the recipe lives, readable without opening the KB.

**In the Reusable Prompt** - include the following instruction so that future rebuilds preserve the comment and the sync discipline:

```
- Embed the comment <!-- Recipe: Pillars/.../This Recipe.md --> as the first line of the <head>; preserve it through any regeneration or patch.
- If you modify this artifact, update the recipe note at the path in that comment - use the specific Knowledge Island's skill in SAVE mode. Read the note first and merge in; update only the sections that changed: Overview for scope changes, Key Design Decisions for structural changes, Updating for new in-place edit patterns, Potential Enhancements to mark items as built-in.
```

**After modifying an artifact** - update the recipe note using the specific Knowledge Island's skill in SAVE mode. Read the note first and merge in, preserving existing structure.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/Agentic AI|Agentic AI]] - parent index
- [[Pillars/Knowledge Islands/Governance/Activities/Email/Email|Email]] - the activity that originated the JSON5 Cache Pattern
- [[Pillars/Knowledge Islands/Governance/Activities/Activities|Activities]] - all scheduled activities; apply these patterns when designing new ones
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Live Artifacts|Live Artifacts]] - source collection for the Live Artifact Patterns
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Mistakes and Lessons|Mistakes and Lessons]] - operational lessons from Claude KB sessions
