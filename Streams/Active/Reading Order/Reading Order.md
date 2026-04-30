---
tags:
  - card/stream
  - topic/knowledge-islands
status: current - April 2026
priority: medium
dependencies: []
author: Written with Claude
---

# Reading Order

## Overview

The three-act structure of `Pillars/Knowledge Islands` is in place. The migration from the old flat-folder layout is complete; the reading order runs Introduction → Model → Realisation, with each act answering a question and each chapter building on the last. The foundation is solid. The work from here is content quality, contextual integrity, and structural completeness.

See [[Site Structure]] — the storyboard at a glance (HTML, sibling file).

---

## Outstanding Work

### Index notes

Every folder in the new tree needs a same-named index note per the CLAUDE.md convention. None currently exist for any of the act or chapter folders (`Introduction/`, `Introduction/Background/`, `Model/Activities/`, etc.). These are not decorative — they are the contextualising layer that makes the folder navigable.

### CLAUDE.md

The Key Meta Notes table in CLAUDE.md still points to the old flat paths (`Pillars/Knowledge Islands/Concept/Concept.md`, `Activities/Activities.md`, etc.). These are all dead paths now. The table needs to be rewritten to reflect the new tree before any automated task can reliably navigate the island.

### Old flat notes as chapter introductions

The six leftover flat index notes in `+/Knowledge Islands Left Overs/` each contain content that was not migrated because it is introductory or overview material, not leaf content. Rather than discarding it, each should be reviewed as a candidate introduction section for its chapter's index note:

- `Concept.md` → Introduction chapter indexes
- `Activities.md` → Model/Activities index (contains a useful schedule/trigger/summary table for all activities)
- `Agents.md` → Model/Agents index (contains a clean human vs agentic AI overview)
- `Tools.md` → Model/Tools index
- `Conventions.md` → Model/Conventions index
- `Processes.md` → Model/Processes index

### Prose audit — terminology

Older notes carry stale terminology that was not fully cleaned during migration. A sweep is needed for:

- "KI" used where "island" should now appear
- "vault" (should be "island" or "repository" depending on context)
- "Knowledge Capital" where the new term is "Knowledge Capitals"
- Any surviving references to the old flat paths (e.g. `Pillars/Knowledge Islands/Activities/...`)

### Contextual review — reading order walk

A step-by-step pass down the reading order checking that every concept is introduced before it is used. The known tension points from the original review were in the Residency and Format areas; the migration may have introduced new gaps, particularly around concepts that appear in the Model chapters before the Introduction has fully grounded them.

### Site Structure in the overview

The [[Site Structure]] HTML diagram should be referenced from (or embedded as a screenshot in) the `Knowledge Islands.md` root index note, giving a first-time reader a visual map alongside the prose entry point.

---

## Open Questions

- **Five-layer model terminology** — "Layer 1", "Layer 5", "five-layer model" reads as internal scaffolding that has leaked into the content. Needs a dedicated pass: either rename the layers to something reader-facing, or restructure so the layering is implicit rather than labelled.
- **Activity Note naming** — "Activity Spec" was considered as a more precise alternative. Deferred pending resolution of the five-layer terminology.

---

## Governance

This stream follows the [[Enactment Process]].

---

## Related Topics

- [[Streams/Active/Active|Active]] - parent stream index
- [[Pillars/Knowledge Islands/Knowledge Islands|Knowledge Islands]] - the content being sequenced
