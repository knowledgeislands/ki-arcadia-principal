---
note_type: pillars/note
tags:
  - card/note
  - topic/ai
  - topic/productivity
  - topic/automation
  - source/claude
status: current - April 2026
author: Written with Claude
---

# AI Automation Patterns

## Overview

Recurring patterns and design principles for AI-driven productivity automations - scheduled tasks, regular activities, and any agent-driven workflow that runs repeatedly against the same island configuration. These are generalisations derived from the design of specific activities such as the Email activity group.

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

```text
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

The Route Triage activity runs three times each working day. Its routing rules (the ordered rule list in `Email Routing Config.md` plus every `Route - *.md` file) change only when the user manually edits them or applies a suggestion - typically a few times a week at most.

Without a cache, every run parses 19+ Route files plus the routing rules note before doing any email work. With the ratio firmly in caching territory, the routing table is compiled once and stored as `tasks/email-triage/routing-table.json5`. Subsequent runs load a single pre-parsed file and skip source parsing entirely.

Invalidation is handled by the mtime check across `Email Routing Config.md` and all `Route - *.md` files. When Route Review applies an agreed suggestion (modifying a source file), the cache file is deleted at the end of that phase - the next run recompiles from the updated sources.

The cache schema was documented in the Email group's former Approach note under Routing Table Cache, now retired.

---

## Live Artifact Patterns

Recurring design decisions for live HTML artifacts - self-contained pages that re-fetch their data through MCP tools each time they are opened. The pair convention and the source-to-render discipline belong to [[Admin/Operations/Live Artifacts/Live Artifacts|Admin Live Artifacts]]; the patterns below cover how the page itself is built.

### Live Artifact Baseline

Structural rules that apply to every live HTML artifact:

- **Light-mode only.** `:root { color-scheme: light }`. Dark-mode CSS adds complexity with no benefit when the host chrome is light.
- **No browser storage.** `localStorage` and `sessionStorage` are not reliably available in an artifact sandbox. All state lives in JS variables for the duration of the load.
- **Inline all CSS and JS; no external fetches.** The artifact must be self-contained. External CDN links introduce network dependencies and potential load failures.
- **Error banner on top-level `.catch`.** Wrap the entire fetch-and-render flow in a try/catch, or a `.catch` on the top-level promise. On failure, replace the content area with a visible red banner carrying the thrown message, so that a broken connector can be diagnosed without opening DevTools.
- **Verification surface.** Include a footer or meta line showing the generated-at timestamp, entity counts and any tool errors. This is what the reload-and-check step inspects after any update, because an update can succeed silently while leaving the artifact broken.

### Parallel MCP Fetch

When an artifact needs data from several endpoints, or must fan out across repeated calls against the same endpoint, use `Promise.all` rather than sequential awaits:

```js
const results = await Promise.all(SOURCES.map((src) => callMcpTool(TOOL, { ...src })))
```

Where calls may return overlapping entities, such as the same issue fetched under different state buckets, de-duplicate after merging with a `Map` keyed by the entity's stable ID:

```js
const seen = new Map()
for (const batch of results) {
  for (const item of batch) {
    if (!seen.has(item.id)) seen.set(item.id, item)
  }
}
```

If partial results are acceptable, so that one failing source should not abort the others, use `Promise.allSettled` and handle rejected entries individually.

### Client-Side Rolling Window

For time-based views, compute the window in JS from `new Date()` rather than baking dates into the prompt. This keeps the artifact useful indefinitely without a rebuild:

```js
const TZ = 'Europe/London' // single source of truth for the timezone
const now = new Date()
const windowStart = new Date(now - 24 * 60 * 60 * 1000)
```

Run all date formatting through `Intl.DateTimeFormat` with `timeZone: TZ`, so that nothing else needs touching when the timezone changes. Expose named constants for the window bounds rather than scattering literals through the code; the percentage maths and axis labels should all derive from those constants.

### Deterministic vs Sampled Synthesis

Two modes are available for rendering derived text in an artifact:

- **Deterministic** - plain JS: counts, truncation, string concatenation. Fast, consistent across reloads, works offline, zero latency. Prefer it for structured labels, grouping headers and stat tiles.
- **Sampled** - a model call from the page with a tight prompt specifying the language, a hard word cap and a "no preamble, no quotes" instruction. Warmer and more readable for one-line summaries of unstructured text, at the cost of latency and variance.

When sampling:

- Strip markdown and ID syntax, such as Slack's `<@Uxxx|Name>` and `<url|label>`, before passing text to the model, otherwise tokens are wasted on format artefacts.
- Always provide a deterministic fallback for when sampling errors or returns nothing; the artifact must never block on summarisation.
- Run summary calls in `Promise.all` across all cards rather than awaiting them sequentially.

Swapping modes later is localised: replace the sampled function body with a JS-derived line, or the reverse.
