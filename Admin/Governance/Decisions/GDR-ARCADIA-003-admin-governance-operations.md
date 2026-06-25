---
type: admin/governance/decision
decision_type: governance
status: current - June 2026
author: Written with Claude
---

# GDR-ARCADIA-003: Admin Zone Governance/Operations Structure

**Status:** Accepted

**Date:** 2026-06-25

## Context

arcadia-principal's `Admin` zone was introduced as a minimal stub -- a zone root note and a `MEMORY.md` -- to match the canonical five-zone
model while governance material remained under Knowledge Capital. As the island grew, `Admin` accumulated its first substantive content: the
decision record store.

The `kit-legal` island provides a mature reference implementation of `Admin`, organised into two arms:

- **Governance/** -- what things must look like: conventions, policies, note templates, decision records.
- **Operations/** -- how things get done: processes, activities, skills, live artefacts.

This Governance/Operations split is a well-established pattern. The question facing arcadia-principal was where to place `Decisions/`: flat
in `Admin/`, or nested under `Admin/Governance/`.

A Decision Record is always a governance artefact regardless of its `decision_type`. DRs are the provenance layer of the Governance arm --
they record why a policy, convention, or structural commitment became what it is. Governance describes what must be true; DRs record why it
became true. Policies and conventions are the outputs of decisions; DRs are the rationale behind them. This is why `Decisions/` belongs
under `Admin/Governance/` rather than sitting flat alongside it.

## Decision

`Admin` organises into two arms:

- **`Admin/Governance/`** -- what things must look like: conventions, policies, templates, decision records.
- **`Admin/Operations/`** -- how things get done: processes, activities, skills, live artefacts.

Decision Records are placed at `Admin/Governance/Decisions/`. Any future conventions, policies, and note templates are placed under
`Admin/Governance/`. The Enactment Process and activity definitions belong in `Admin/Operations/` once that arm is built out.

## Consequences

- `Admin/Decisions/` is retired; the canonical path for all DRs is `Admin/Governance/Decisions/`.
- Future conventions and policies are placed under `Admin/Governance/` as that arm grows.
- The Enactment Process documentation and operational activities belong in `Admin/Operations/` -- a migration from Knowledge Capital that is
  deliberate future work.
- Any tool or note that references the old path must be updated to `Admin/Governance/Decisions/`.

## References

- [GDR-ARCADIA-001: Adopting Decision Records](GDR-ARCADIA-001-adopting-decision-records.md) -- the DR adoption that this record re-homes
  into the Governance arm
