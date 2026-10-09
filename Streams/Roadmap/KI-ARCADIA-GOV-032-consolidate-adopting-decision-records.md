---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-032
area: GOV
title: Consolidate adopting Decision Records
kind: deliver
purpose: governance
status: ready
horizon: now
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-08T13:49:15Z
updated_at: 2026-10-09T15:46:39Z
---

# Consolidate Adopting Decision Records

## Goal

Arcadia holds one record for adopting Decision Records, so readers and citations find a single canonical answer rather than two records with the same title.

## Context

The GOV-020 Decision Record scope rollout renumbered the former `GDR-TECHNE-001` into Arcadia as [[GDR-KI-ARCADIA-007-adopting-decision-records|GDR-KI-ARCADIA-007]]. Arcadia already held [[GDR-KI-ARCADIA-001-adopting-decision-records|GDR-KI-ARCADIA-001]], dated 2026-07-18, under the same title; GDR-KI-ARCADIA-007 is dated 2026-09-09. Both were kept unchanged as the rollout instructed.

## Boundary

- In scope: deciding which record is canonical; consolidating any distinct engineering content from GDR-KI-ARCADIA-007 into it; retiring the other through the `ki-decision-records` consolidation mode; and updating citations in Arcadia and in other repositories.
- Out of scope: other Decision Records; the vestigial `shared_record` mechanism, which [KI-HARNESS-GOV-166](https://github.com/knowledgeislands/ki-agentic-harness/blob/main/docs/roadmap/KI-HARNESS-GOV-166-retire-shared-record.md) owns.

## Steps

- [ ] Keep [[GDR-KI-ARCADIA-001-adopting-decision-records|GDR-KI-ARCADIA-001]] as the canonical record: it is the older root and already carries the ecosystem-wide adoption. Fold in GDR-KI-ARCADIA-007's distinct content in present-state words: the Techné engineering discipline uses this collection; records adopted from the retired Techné principal are renumbered into the KI-ARCADIA series and their archived copies are historical evidence only; forward work stays in Streams. State serials as contiguous from `001` per prefix within the scope, matching the gap-free rule.
- [ ] Delete `GDR-KI-ARCADIA-007-adopting-decision-records.md`.
- [ ] Close the resulting gap by renumbering `GDR-KI-ARCADIA-008` (Governing Technology Investigations) to `GDR-KI-ARCADIA-007`: file name, `id` and heading.
- [ ] Repoint every citation: `decision_depends_on` and References in ADR-KI-ARCADIA-004, -005 and -006 to GDR-KI-ARCADIA-001; the Technology Investigation Programme wikilink to the renumbered GDR-KI-ARCADIA-007; and the Decisions index.
- [ ] Confirm no peer repository cites either moved identifier, then run the verification below and write the review packet.

## Files touched

- `Admin/Governance/Decisions/GDR-KI-ARCADIA-001-adopting-decision-records.md`
- `Admin/Governance/Decisions/GDR-KI-ARCADIA-007-adopting-decision-records.md` (deleted)
- `Admin/Governance/Decisions/GDR-KI-ARCADIA-008-governing-technology-investigations.md` (renamed to `GDR-KI-ARCADIA-007-governing-technology-investigations.md`)
- `Admin/Governance/Decisions/ADR-KI-ARCADIA-004-provider-neutral-isolated-agent-execution.md`
- `Admin/Governance/Decisions/ADR-KI-ARCADIA-005-one-persona-across-explicit-working-contexts.md`
- `Admin/Governance/Decisions/ADR-KI-ARCADIA-006-techne-implementation-ownership.md`
- `Admin/Governance/Decisions/Decisions.md`
- `Pillars/Engineering Practice/Operating Model/Technology Investigation Programme.md`
- this record

## Verify

- `ki repo audit --repo .` reports no new finding against the pre-change baseline, and the `ki-decision-records` audit passes, including contiguous serials (FILENAME-5) and ascending reveal order (INDEX-8).
- No file in Arcadia or any local peer checkout cites `GDR-KI-ARCADIA-008`, and every remaining `GDR-KI-ARCADIA-007` citation means Governing Technology Investigations.
- No added line contains an en-dash or em-dash.

## Dependencies / blocks

None. `KI-HARNESS-GOV-167` supplies the gap-free serial rule this plan follows.

## Discussion

### Capture

Captured as Triage from the GOV-020 Decision Record scope rollout report. No plan yet.

### Plan

Renumbering GDR-KI-ARCADIA-008 into the vacated serial is the standard's prescribed way to keep the series gap-free, so consolidation leaves no gap and needs no further owner choice. Every citation of both identifiers sits inside Arcadia.

### Adoption

Adopted by Kris on 2026-10-09 (state-of-play decisions log, Decision 9), with the instruction to plan, implement and advance it to Awaiting review.

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
