---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-007
area: GOV
title: Reconcile decision record currency
theme: governance
horizon: now
status: awaiting-review
blocks: []
blocked_by: []
baseline_ref: 5d6c7abddbc5a7f6fb8625722bd958a3d268a739
created_at: 2026-09-14T22:07:41Z
updated_at: 2026-10-04T11:56:44Z
---

# Reconcile Decision Record Currency

Adopted into Now and shaped to Ready on 2026-10-04 under the owner's delegated authority for the estate roadmap push.

## Goal

Decide and scope a bounded maintenance pass that restores the affected Arcadia Decision Records to current, self-contained statements with valid references.

## Context

The September 2026 estate decision reconciliation found ten non-decision links under `## References` across `SDR-KI-ARCADIA-001` through `SDR-KI-ARCADIA-004`. Their targets moved from `Pillars/Knowledge Islands/` to `Pillars/Philosophy/`, so the stored paths no longer resolve. Repointing them would not be sufficient: the Decision Records standard limits this section to sibling Decision Records and external URLs, while internal Knowledge Base notes belong in the body where the reader encounters the concepts they support.

The same review found that current `GDR-KI-ARCADIA-002` retains future migration prose in its Decision even though a living Decision Record must state the present arrangement. The mechanical Decision Records and authoring audits pass, so these are judgmental currency findings rather than checker failures.

No existing roadmap record owns Decision Record reference placement or this present-state reconciliation.

## Boundary

This proposal covers only the ten internal Knowledge Base references in `SDR-KI-ARCADIA-001` through `SDR-KI-ARCADIA-004` and the future migration wording in `GDR-KI-ARCADIA-002`. It does not repair those records, redesign their decisions, introduce a replacement Decision Record, or authorise broader editorial rewriting.

## Current state

Re-grounded on 2026-10-04. `07afdd9` (1 October 2026) already reduced `SDR-KI-ARCADIA-002`'s References to its sibling Decision Record, so seven non-decision links remain: three in `SDR-KI-ARCADIA-001`, two in `SDR-KI-ARCADIA-003` and two in `SDR-KI-ARCADIA-004`. All seven point at the former `Pillars/Knowledge Islands/` tree and do not resolve. Each target concept (territories and archipelagos, governance, how an island takes shape, the cycle of knowledge, the Enactment Process) is named in the record body, and the current notes under `Pillars/Philosophy/` are supplementary context rather than undisclosed decision dependencies.

The Admin-zone migration in `GDR-KI-ARCADIA-002` is enacted: the Enactment Process lives at `Admin/Operations/Processes/Enactment Process.md` and Activity notes at `Admin/Operations/Activities/`. Its final Consequence still describes that migration as future work.

## Steps

- [x] Remove the seven non-resolving internal Knowledge Base links from the `## References` sections of `SDR-KI-ARCADIA-001`, `SDR-KI-ARCADIA-003` and `SDR-KI-ARCADIA-004`, keeping sibling Decision Record links; remove an emptied References section entirely.
- [x] Restate the final `GDR-KI-ARCADIA-002` Consequence in the present tense, preserving its meaning.
- [x] Run the verification below and prepare the review packet.

## Files touched

- `Admin/Governance/Decisions/SDR-KI-ARCADIA-001-knowledge-islands-the-strategy.md`
- `Admin/Governance/Decisions/SDR-KI-ARCADIA-003-the-governance-of-an-island.md`
- `Admin/Governance/Decisions/SDR-KI-ARCADIA-004-the-enactment-process.md`
- `Admin/Governance/Decisions/GDR-KI-ARCADIA-002-admin-zone-governance-and-operations.md`
- `Streams/Roadmap/KI-ARCADIA-GOV-007-reconcile-decision-record-currency.md`

## Verify

- Every remaining link under `## References` in the four records is a sibling Decision Record file that exists, or an external URL.
- `GDR-KI-ARCADIA-002` contains no future-tense migration wording.
- `ki repo audit` passes, including `ki-decision-records` and `ki-authoring`.

## Dependencies / blocks

None.

## Review

### Delivered

The bounded currency pass from immutable baseline `5d6c7abddbc5a7f6fb8625722bd958a3d268a739`: seven non-resolving internal links removed from Decision Record References sections and one `GDR-KI-ARCADIA-002` Consequence restated in the present tense. Excluded: any change to decision substance, other Decision Records, or broader editorial work.

### Change Summary

- `SDR-KI-ARCADIA-001`: removed three internal links; its References section, left empty, was removed.
- `SDR-KI-ARCADIA-003` and `SDR-KI-ARCADIA-004`: removed two internal links each; their sibling Decision Record links remain.
- `GDR-KI-ARCADIA-002`: "Enactment Process documentation and activity records are future work for migration to `Admin/Operations/`" now reads "Enactment Process documentation and Activity records live under `Admin/Operations/`."
- The original count of ten fell to seven because `07afdd9` had already corrected `SDR-KI-ARCADIA-002`.

### Verification

- Every remaining References link in the four records resolves to an existing sibling Decision Record (`SDR-KI-ARCADIA-002`, `SDR-KI-ARCADIA-003`, `GDR-KI-ARCADIA-001`); no internal Knowledge Base link remains.
- `GDR-KI-ARCADIA-002` contains no "future" wording.
- `ki repo audit` passed on all 23 skills.

### Outstanding concerns

`GDR-KI-ARCADIA-002` still uses em-dashes and names the former `knowledgeislands-decision-records` skill; both sit outside this record's boundary against broader editorial rewriting and are left for a separate editorial pass.

### Post-change review

Scope held to the recorded boundary. Each removed link's concept remains named in its record body, so no decision lost a disclosed dependency. Regression risk is minimal: only reference lists and one Consequence line changed. Ready for acceptance.

### Mini recap

Seven stale References links removed and one migration Consequence made present-tense; audits pass. Possible learning route: a `ki-decision-records` checker rule for non-decision References links, not promoted automatically.

## Discussion

A coherent maintenance pass could remove the invalid internal links from each `## References` section after confirming the corresponding concepts remain named clearly in the record body. It could then rewrite the migration wording in `GDR-KI-ARCADIA-002` as a present-state decision while preserving its meaning and Git history.

Before adoption, confirm that the ten linked Knowledge Base notes are supplementary context rather than undisclosed decision dependencies, and confirm that the Admin-zone migration described by `GDR-KI-ARCADIA-002` is fully enacted. Verification should combine the Decision Records and authoring audits with an explicit link-existence check, because the current mechanical audits do not expose these judgmental findings.
