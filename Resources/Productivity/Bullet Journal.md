---
note_type: resources/note
tags:
  - card/note
  - topic/productivity
status: current - October 2026
author: Written with Claude
url: https://bulletjournal.com
---

# Bullet Journal

## Overview

The Bullet Journal is an analogue method for tracking the past, ordering the present and designing the future, created by Ryder Carroll and published in _The Bullet Journal Method_ (Portfolio, 2018). Carroll describes it as a system - the notation and collections that capture and organise thoughts - and a practice - the reflection rituals that keep actions aligned with what matters. It deliberately adds friction at key points, above all at migration, so that only tasks worth the effort of rewriting survive.

---

## Rapid Logging

Rapid logging is the method's notation: short single-sentence entries, each led by a bullet that says what kind of entry it is.

| Bullet | Type | Meaning |
| --- | --- | --- |
| `•` | Task | Something to do; Carroll now calls these actions |
| `○` | Event | A scheduled or notable occurrence |
| `-` | Note | A thought or piece of information worth keeping |
| `=` | Mood | A physical or emotional state, added in later teaching |

A task changes state as work moves on: `×` when complete, `>` when migrated to a later log or collection, `<` when scheduled back to the Future Log, and struck through when it no longer matters. Optional signifiers to the left of a bullet add emphasis: `*` for priority, `!` for inspiration and `?` for something to explore.

---

## Collections

Every entry lives in a collection. Four core collections form the system:

- **Index** - a table of contents at the front of the notebook, listing collections by page.
- **Future Log** - a spread holding tasks and events for months beyond the current one.
- **Monthly Log** - a timeline of what actually happened each day and a task page for the month.
- **Daily Log** - the working space for the day, written as the day unfolds.

Any other list, tracker or project page is a custom collection added to the Index.

---

## Migration

At the end of each month, every open task is reviewed and given one of three outcomes: migrated (`>`) to the next Monthly Log or a collection, scheduled (`<`) into the Future Log against a date, or struck out. Carroll's test is that a task not worth rewriting was not worth doing. Tasks that keep migrating without being done prompt the question of why they are still there. Carroll pairs migration with regular reflection - daily, weekly, monthly and yearly - in a cycle of record, reflect, refine and respond.

---

## Mapping to Obsidian

| Concept | Maps to | Fit |
| --- | --- | --- |
| Daily Log | The daily Calendar note | Clean: one note per day already exists |
| Monthly Log | The monthly Calendar index | Clean for the task page and migration; the timeline is covered by the daily-note links |
| Weekly reflection | The weekly Calendar note | Clean: a short review of open and migrated items |
| Task and state bullets | Obsidian task checkboxes with a status character: `- [ ]`, `- [x]`, `- [>]`, `- [<]`, `- [-]` | Adapted: the symbols move inside the checkbox so they render without a plugin |
| Event and note bullets | `- o` and a plain `-` list item | Adapted: no checkbox, since neither is actionable |
| Strike-through for dropped tasks | `- [-]` | Adapted: a status character is searchable where strike-through is not |
| Index | Folder index notes and search | Not adopted: the vault's structure and search already index |
| Future Log | Future-dated daily notes or work records | Not adopted as a note type: a scheduled task points to the dated note that will hold it |
| Custom collections | Pillars and Resources notes | Not adopted in Calendar: durable lists belong in the knowledge zones |

---

## Sources

- [Bullet Journal](https://bulletjournal.com) - Ryder Carroll's official site, including the method's introductory guide.
- Ryder Carroll, _The Bullet Journal Method_ (Portfolio, 2018).
- [Bullet Journal on YouTube](https://www.youtube.com/@bulletjournal) - Carroll's official channel, the source of the mood bullet and the reflection rituals.
