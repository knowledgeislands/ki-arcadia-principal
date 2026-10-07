---
note_type: stream-roadmap
id: KI-ARCADIA-OPS-002
area: OPS
title: Tooling rollout
theme: operational-tooling
tags:
  - topic/ai
  - topic/automation
  - topic/knowledge-management
status: draft
priority: high
horizon: next
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-04-30T09:55:30Z
updated_at: 2026-10-07T10:21:00Z
author: Written with Claude
---

# Tooling Rollout Proposal

## Overview

Building out Arcadia's operational tooling across three areas. First, the `Tools/Claude/Activities/` prompt library - the Prompt layer in the [[Authoring Guidelines|content layers]] - migrating existing embedded prompts, authoring new ones, and keeping them aligned with their Knowledge Islands activity notes. Second, activity navigation aids: cached or synthesised views of the content layers that reduce the number of notes a human or agent needs to read. Third, Arcadia's operational infrastructure: the Arcadia skill definition and the scheduled task configuration.

The structural scaffolding (folder structure, stub index notes, authoring conventions) was created in the April 2026 governance restructuring session.

Once the remaining phases land and Arcadia is fully organised, the patterns this stream produced - prompt scaffolding, migration sequence, sync audit, scheduled task setup - become the recipe for rolling out a new Knowledge Island. The stream's outputs are then re-cast as a KI rollout activity rather than a one-off Arcadia project.

---

## Phase Summary

| Phase | Status | Description |
| --- | --- | --- |
| Prompt sync audit | `[ ]` Not started | Verify all Prompt notes are in sync with their Cowork scheduled tasks |
| Activity navigation | `[ ]` Not started | Investigate cached/synthesised views of the content layers for human and agent consumers |
| Arcadia skill | `[ ]` Not started | Define and configure the Arcadia Knowledge Islands skill |
| Scheduled tasks | `[ ]` Not started | Configure Arcadia's scheduled tasks in Cowork; verify against Charter |

---

## Next Step

Start **Phase 1: Prompt sync audit**.

- Read `Tools/Claude/Activities/` to enumerate Prompt notes and their current sync state.
- Cross-reference the notes against the Cowork scheduled task list.
- Log any gaps before proceeding to the next phase.

---

## Open Issues

None.

## Governance

This stream adheres to the [[Enactment Process]]. Content reaches `Pillars/` or `Resources/` only on user approval of a `ready` proposal.

---

## Blocker (2026-10-04)

Not shaped to Ready during the 2026-10-04 delegated roadmap push. The record assumes a `Tools/Claude/Activities/` prompt library and Cowork scheduled tasks; no `Tools/` folder exists, Activities now live in `Admin/Operations/Activities/`, and scheduled automation is separately proposed in `KI-ARCADIA-OPS-008`. The owner needs to decide which phases still apply before it can be re-scoped.

### Question for Kris (2026-10-04)

Should this record be closed as obsolete, with any surviving concern (an Arcadia skill definition, scheduled-task verification) folded into KI-ARCADIA-OPS-008 or a fresh record?

Classified as an owner decision by the Fable reviewer under delegated autonomy (2026-10-04): No `Tools/` prompt library exists, Activities live in `Admin/Operations/Activities/`, scheduled tasks are governed by KI-ARCADIA-OPS-008 and the Charter, and the Techne Programme Hold constrains remote scheduled execution; closing versus re-scoping is the owner's disposition.

## Discussion

### Close as obsolete - approved 2026-10-07

On 2026-10-07 Kris approved closing this record as obsolete in the state-of-play review (`+/_CHECKPOINTS/state-of-play.md`), answering the question above. Its surviving concern, Tending prompts and scheduled-task verification, sits in KI-ARCADIA-OPS-008. The closure is not carried out yet: the record is adopted in Next, `ki-accept` closes only an Awaiting-review delivery or an open Triage intake, and `ki-next` moves adopted work back into Triage only on an explicit human disposition. The route the skills allow is for Kris to approve moving this record from Next to Triage, then a `rejected` disposition (obsolete; concern carried by KI-ARCADIA-OPS-008) closed through `ki-accept`. No lifecycle field changes here.
