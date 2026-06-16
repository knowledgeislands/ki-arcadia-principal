---
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

Recurring patterns and design principles for AI-driven productivity automations - scheduled tasks, regular activities, and any
Claude-powered workflow that runs repeatedly against the same island configuration. These are generalisations derived from the design of
specific activities such as [[Knowledge Islands/Model/Activities/Email/Email]].

---

## Execution Frequency vs Change Frequency

When designing a scheduled automation, assess two independent rates for every input the task needs:

- **Execution frequency** - how often the task runs (e.g., 3× daily)
- **Change frequency** - how often the inputs to the task change (e.g., routing rules revised once a week or less)

When execution frequency significantly exceeds change frequency, loading and parsing those inputs fresh on every run is wasteful. The inputs
are effectively static between runs - re-parsing them is redundant work that costs tokens and time.

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

The file contains a single JSON5 object with an `at` timestamp (ISO with offset) and the compiled data payload. Comments and trailing commas
are permitted - JSON5 is preferred over plain JSON for readability.

### Cache check

Before parsing source files, check whether a valid cache exists:

```bash
newest_src=$(stat -c "%Y" source-file-1 source-file-2 2>/dev/null | sort -n | tail -1)
cache_mtime=$(stat -c "%Y" "$CACHE_FILE" 2>/dev/null || echo 0)
[ "$cache_mtime" -gt "$newest_src" ] && echo "CACHE_HIT" || echo "CACHE_MISS"
```

- **Cache hit** - the cache file is newer than all source files. Read it directly; skip parsing.
- **Cache miss** - a source file is newer than the cache (or the cache is absent). Parse the sources, write a fresh cache file, then
  proceed.

### Cache invalidation

The mtime check is the primary invalidation mechanism - when a source file is written (e.g., because an agreed rule was applied), its mtime
updates and the next run detects a miss.

For explicit invalidation, delete the cache file. The next run will recompile. This is appropriate after bulk edits to source files within a
single run - delete before stopping so the post-run state is clean.

### When not to cache

- The input is already a single, compact file that loads in one read (no marginal cost to reload).
- The input changes on the same schedule as the task runs (cache would be invalidated every run anyway).
- The task runs infrequently (weekly or less) - the overhead is negligible without a cache.

---

## Concrete Example - Route Inbound

The [[Route Triage]] activity runs three times each working day. Its routing rules (the ordered rule list in `Email Routing Config.md` plus
every `Route - *.md` file) change only when the user manually edits them or applies a suggestion - typically a few times a week at most.

Without a cache, every run parses 19+ Route files plus the routing rules note before doing any email work. With the ratio firmly in caching
territory, the routing table is compiled once and stored as `tasks/email-triage/routing-table.json5`. Subsequent runs load a single
pre-parsed file and skip source parsing entirely.

Invalidation is handled by the mtime check across `Email Routing Config.md` and all `Route - *.md` files. When Route Review applies an
agreed suggestion (modifying a source file), the cache file is deleted at the end of that phase - the next run recompiles from the updated
sources.

The cache schema is documented in the [[Approach]] note under Routing Table Cache.
