---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-007
area: GOV
title: Reconcile decision record currency
theme: governance
horizon: triage
status: draft
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-14T22:07:41Z
updated_at: 2026-09-14T22:07:41Z
---

# Reconcile Decision Record Currency

This record is a discussion proposal. It is not accepted, prioritised, or implementation authority.

## Goal

Decide and scope a bounded maintenance pass that restores the affected Arcadia Decision Records to current, self-contained statements with valid references.

## Context

The September 2026 estate decision reconciliation found ten non-decision links under `## References` across `SDR-KI-ARCADIA-001` through `SDR-KI-ARCADIA-004`. Their targets moved from `Pillars/Knowledge Islands/` to `Pillars/Philosophy/`, so the stored paths no longer resolve. Repointing them would not be sufficient: the Decision Records standard limits this section to sibling Decision Records and external URLs, while internal Knowledge Base notes belong in the body where the reader encounters the concepts they support.

The same review found that current `GDR-KI-ARCADIA-002` retains future migration prose in its Decision even though a living Decision Record must state the present arrangement. The mechanical Decision Records and authoring audits pass, so these are judgmental currency findings rather than checker failures.

No existing roadmap record owns Decision Record reference placement or this present-state reconciliation.

## Boundary

This proposal covers only the ten internal Knowledge Base references in `SDR-KI-ARCADIA-001` through `SDR-KI-ARCADIA-004` and the future migration wording in `GDR-KI-ARCADIA-002`. It does not repair those records, redesign their decisions, introduce a replacement Decision Record, or authorise broader editorial rewriting.

## Discussion

A coherent maintenance pass could remove the invalid internal links from each `## References` section after confirming the corresponding concepts remain named clearly in the record body. It could then rewrite the migration wording in `GDR-KI-ARCADIA-002` as a present-state decision while preserving its meaning and Git history.

Before adoption, confirm that the ten linked Knowledge Base notes are supplementary context rather than undisclosed decision dependencies, and confirm that the Admin-zone migration described by `GDR-KI-ARCADIA-002` is fully enacted. Verification should combine the Decision Records and authoring audits with an explicit link-existence check, because the current mechanical audits do not expose these judgmental findings.
