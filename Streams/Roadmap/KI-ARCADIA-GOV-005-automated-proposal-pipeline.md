---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-005
area: GOV
title: Automated proposal pipeline
kind: deliver
purpose: capability
project: island-model-and-tending
component: operations
tags:
  - topic/knowledge-islands
status: cancelled
resolution: obsolete
priority: medium
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-04-28T00:13:43Z
updated_at: 2026-10-07T17:20:40Z
author: Written with Claude
---

# Auto Proposal Pipeline Proposal

## Goal

Define an Auto Proposal Research activity that periodically reviews draft roadmap records and shapes the mature ones towards Ready, so that council review starts from a pre-formed proposal rather than a reconstruction. The activity surfaces candidates; humans decide.

---

## Context

Draft records in `Streams/Roadmap/` accumulate open questions and design notes that are only turned into decision-ready proposals when someone sits down to do it. A periodic activity that reads drafts, identifies the ones whose open questions are resolved, and shapes them under the shared `ki-next` and `ki-plan` procedures would make council review evaluative: the thinking is documented, the connections are explicit and the remaining owner decisions are named.

The original framing asked for a bespoke "proposal-ready" convention and proposal note format. Both now exist in shared form: the `ki-plan` Ready criteria define when a record is decision-ready, and the `ki-work-roadmap` work-item format defines what a well-formed record contains. The activity therefore needs a definition and a prompt, not a new convention.

The activity follows the existing two-part pattern: a portable Definition under `Pillars/Philosophy/Model/Activities/Tending/` and an executable Prompt under `Pillars/Philosophy/Model/Tools/Claude/Activities/Tending/`, with Arcadia's adoption position held in `Admin/Operations/Activities/Tending Activity.md` and the [[Admin/Governance/Charter|Charter]].

---

## Boundary

- No scheduled task is created or enabled, and the Charter scheduled and conversational activity tables are not changed. Enabling a scheduled run is Kris's adoption and spend decision.
- The activity never moves a record to Ready, adopts work, accepts work or edits `Admin/`, `Pillars/` or `Resources/`; it proposes shaping and names owner decisions, and the shared lifecycle skills remain the authority for each transition.
- No new "proposal-ready" convention or proposal note format; the shared `ki-plan` Ready criteria and `ki-work-roadmap` format are referenced, not restated.
- No remote operations under the [[Techne Programme Hold]]; no cross-repository writes.

---

## Current state

- No Auto Proposal Research definition or prompt exists; `grep -rl "Auto Proposal" Pillars Admin` returns nothing.
- `Pillars/Philosophy/Model/Activities/Tending/` holds nine definitions with `Tending.md` as index (one H2 per activity plus `## Adoption Requirements`); `Pillars/Philosophy/Model/Tools/Claude/Activities/Tending/` holds the prompts with `Tending.md` as index (`## Prompts`).
- `Admin/Operations/Activities/Tending Activity.md` states that all nine Tending activities are enabled and defers to the Charter for the roster; the Charter lists three scheduled and six conversational Tending activities.
- `ki repo audit --skill ki-repo-kb-activities --repo . --progress never` passes at planning time.

---

## Steps

- [ ] Write the Definition `Pillars/Philosophy/Model/Activities/Tending/Auto Proposal Research.md` following the shape of the existing Tending definitions: purpose, inputs (draft and Next records in `Streams/Roadmap/`), the shared `ki-plan` Ready criteria as the readiness test, outputs (a shaping proposal per candidate with named owner decisions), and the rule that the activity surfaces and humans decide.
- [ ] Add an `## Auto Proposal Research` section to `Pillars/Philosophy/Model/Activities/Tending/Tending.md` in two to four substantive sentences, before `## Adoption Requirements`.
- [ ] Write the Prompt `Pillars/Philosophy/Model/Tools/Claude/Activities/Tending/Auto Proposal Research.md`: read the roadmap via `ki repo roadmap list`, select drafts whose open questions appear resolved, apply `ki-next` and `ki-plan` to draft a shaping proposal for each, report owner decisions and evidence gaps, and write nothing beyond the report unless the operator approves a specific record edit.
- [ ] Add the prompt to the `## Prompts` section of `Pillars/Philosophy/Model/Tools/Claude/Activities/Tending/Tending.md`.
- [ ] Update `Admin/Operations/Activities/Tending Activity.md` so it no longer says "all nine" are enabled, and records Auto Proposal Research as defined with realisation `manual` and not enabled pending Kris's adoption.
- [ ] Record the suggested cadence (weekly or fortnightly, aligned to council rhythm) in the Definition as guidance for a future adoption decision, not as a schedule.

---

## Files touched

- `Pillars/Philosophy/Model/Activities/Tending/Auto Proposal Research.md` (new)
- `Pillars/Philosophy/Model/Activities/Tending/Tending.md`
- `Pillars/Philosophy/Model/Tools/Claude/Activities/Tending/Auto Proposal Research.md` (new)
- `Pillars/Philosophy/Model/Tools/Claude/Activities/Tending/Tending.md`
- `Admin/Operations/Activities/Tending Activity.md`
- this record

---

## Verify

- Both new notes exist and each Tending index has a section or entry for Auto Proposal Research.
- `git diff --quiet HEAD -- Admin/Governance/Charter.md` succeeds: the Charter scheduled and conversational tables are unchanged.
- `ki repo audit --skill ki-repo-kb-activities --repo . --progress never` PASS.
- `ki repo audit --skill ki-repo-kb --repo . --progress never` PASS.
- `ki repo audit --progress never` PASS.
- New prose uses British English and ASCII hyphens only (`grep -nP '[\x{2013}\x{2014}]'` on the new and edited notes returns nothing).

---

## Dependencies / blocks

No local dependency. The activity consumes the shared `ki-next`, `ki-plan` and `ki-work-roadmap` standards from `ki-agentic-harness` as they stand; it raises no handoff. Enabling a scheduled realisation later is a separate owner adoption through the Charter.

---

## Documentation impact

### Decision Records

None. Adding a manual, unenabled activity inside an adopted group is routine; a Decision Record would be warranted only if a later adoption creates a new activity group or a scheduled spend.

### Specifications

None. The readiness test is the shared `ki-plan` Ready criteria, owned by `ki-agentic-harness`.

### Guides

The new Definition and Prompt notes are the guidance; the two Tending index notes gain an entry each.

### Roadmap

This record moves to awaiting-review on delivery. A future record may adopt a scheduled realisation through the Charter if the manual activity proves useful.

---

## Cancelled

Approved by Kris on 2026-10-07 under decision 13 of the state-of-play design ("Yes please, lets reduce stuff": cancel and prune obsolete or ownerless records).

The record was built around council review, which is no longer the operating model. The design loop (`ki-design-loop`, from KI-HARNESS-GOV-152) now owns how Projects and their records mature, and `ki-plan` owns readiness. No outstanding changes.

## Discussion

### Decisions under delegated autonomy

- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: "proposal-ready" means the shared `ki-plan` Ready criteria; no new convention or proposal format is defined.
- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: the activity belongs to the Tending group rather than a new Governance group.
- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: realisation `manual`, not enabled in the Charter; enabling a scheduled run is Kris's adoption and spend.

### Planning correction

The triage named the Admin Tending Activity note as the definition's home. In the current layout the portable Definition lives in `Pillars/Philosophy/Model/Activities/Tending/` beside the other nine, and the Admin note holds only Arcadia's adoption position, so both are touched. The triage also listed `Admin/Operations/Activities/Activities.md`; its Tending row ("Core maintenance loop") does not enumerate activities, so it needs no change.

### Original open questions

1. **Which activity group?** Resolved above as Tending. A dedicated Governance group remains possible if other governance-facing activities emerge.
2. **What triggers a proposal?** Resolved above: the `ki-plan` Ready criteria, which already cover resolved open questions, concrete steps and verification.
3. **Who reviews the proposals?** The activity surfaces; council members and the owner decide. The activity never ratifies.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
