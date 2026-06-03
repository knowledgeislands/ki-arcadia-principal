---
tags:
  - card/note
  - topic/knowledge-islands
status: draft - April 2026
author: Written with Claude
---

# Enactment Process

## Overview

The Enactment Process is the island's governance in action. It is not a tool the council uses - it is _how the council operates_. The council's authority is expressed entirely through this process. Nothing reaches stable knowledge in Pillars or Resources except through the Enactment Process gate.

The **operational definition** of the process - the status lifecycle, the cycle, proposal-document anatomy, rollout discipline, post-change review, and the working rules - is canonical in the `knowledgeislands-streams` skill, which agents working this island load. This note holds the island's governance _philosophy_ and its _local specifics_; the skill is the single source of truth for the mechanics.

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

- **Streams** are the home of ongoing work; authority to work there is granted by its presence in the workspace.
- **Pillars / Resources** are the home of stable, ratified knowledge; nothing lands there except through the council's ratification of a proposal that specifies the change.

A proposal moves through `draft → ready → in-progress` | `rejected` `→ rolled-out → reviewed → completed`; the skill defines what each status means and the transitions between them.

---

## Local specifics

These localise the canonical process to this island:

- **Approver.** The council ratifies proposals; on a single-person island the user stands in for it.
- **Stores.** Internal canonical knowledge settles into `Pillars/`; external reference into `Resources/`.
- **Working area.** For complex or destructive rollout steps, stage previews in the Cowork working area before they land in the island - a review checkpoint; nothing there is canonical until committed.
- **Naming.** Proposal note names end with a space and the word `Proposal`; streams live under a Focus folder (`Active` / `Background` / `Dormant` / `Future` / `Settled`). Full structure in the skill and in [[Structure]].
