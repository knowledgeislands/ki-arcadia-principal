---
note_type: pillars/index
tags:
  - card/note
  - topic/knowledge-islands
status: current - October 2026
author: Mixed
---

# Enactment Process

## Overview

The Enactment Process is the island's governance in action. It is not a tool the council uses - it is _how the council operates_. The council's authority is expressed entirely through this process. Nothing reaches stable knowledge in Pillars or Resources except through the Enactment Process gate.

The **operational definition** of the process - the Streams structure, status lifecycle, roadmap-record anatomy, rollout discipline, post-change review, and working rules - is canonical in `ki-repo-kb-streams` and the shared change-management skills. This note holds the island's governance _philosophy_ and its _local specifics_; those skills are the source of truth for the mechanics.

---

## Model

The Enactment Process works alongside Streams, Pillars and Resources in an iterative cycle. Work moves back and forth between them until the council ratifies or rejects.

```text
┌──────────────────────────────────────────────┐
│   Stream  ←→  Enactment Process (Council)    │
│               ↓ ratify                       │
│         Pillars / Resources                  │
└──────────────────────────────────────────────┘
```

- **Streams** are the home of ongoing work. Draft capture follows the shared process; adoption and delivery require the applicable owner's approval, not merely workspace presence.
- **Pillars / Resources** are the home of stable, ratified knowledge; nothing lands there except through the council's ratification of a proposal that specifies the change.

A roadmap record moves through `draft → ready → in-progress → awaiting-review → done`; the shared change-management skills define what each status means and the transitions between them. Each gate protects something specific. `ready` means the plan is settled and approved before any canonical content changes, so work never starts on an open question. `in-progress` records the baseline the change starts from, so the result can be compared with it. `awaiting-review` separates finishing the work from accepting it: the review evidence sits in the record until someone with authority accepts it. A `done` record is retained until it is explicitly pruned, so the evidence behind a canonical change outlives the change itself. This sequence replaces the earlier stream vocabulary of `future`, `background`, `active` and `ratified`.

---

## Local specifics

These localise the canonical process to this island:

- **Approver.** The council ratifies proposals; on a single-person island the user stands in for it.
- **Stores.** Internal canonical knowledge settles into `Pillars/`; external reference into `Resources/`.
- **Working area.** For complex or destructive rollout steps, stage previews in the Cowork working area before they land in the island - a review checkpoint; nothing there is canonical until committed.
- **Naming.** Finite work is a flat, identifier-qualified record in `Streams/Roadmap/`; recurring obligations are Activity notes in the configured collection and opted-in housekeeping creates ordinary roadmap runs. Horizon and lifecycle are record metadata. `ki-repo-kb-streams` owns the container, `ki-repo-kb-activities` owns Activity definitions and `ki-work-housekeeping` owns opted-in recurrence. [[Structure]] supplies the local placement.
