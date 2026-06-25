---
type: admin/governance/decision
decision_type: governance
status: current - June 2026
author: Written with Claude
decision_depends_on: ['GDR-KI-ARCADIA-001']
---

# GDR-KI-ARCADIA-003: Admin Zone — Governance and Operations

**Status:** Accepted

**Date:** 2026-06-25

## Context

GDR-KI-ARCADIA-001 placed Decision Records at `Admin/Decisions/`. As the Admin zone of a Knowledge Island grows, it accumulates content of
two fundamentally different kinds: governance artefacts (conventions, policies, templates, decision records — things that describe _what
must be true_) and operational artefacts (processes, activities, skills, live working documents — things that describe _how things get
done_). A flat `Admin/` directory cannot express this distinction. Without structure, governance artefacts and operational artefacts share
the same space, making it harder to locate the authoritative record of a convention or understand which documents govern the island versus
which describe its running.

The `kit-legal` Knowledge Island demonstrates a two-arm pattern — `Admin/Governance/` and `Admin/Operations/` — that maps cleanly onto this
distinction. A Decision Record is always a governance artefact regardless of its `decision_type`: it records why a policy, convention, or
structural commitment became what it is. DRs are the provenance layer beneath governance.

This pattern applies to any Knowledge Island that has adopted the Knowledge Islands model, not only to Arcadia.

## Decision

The `Admin/` zone of a Knowledge Island organises into two arms:

- **`Admin/Governance/`** — conventions, policies, templates, and decision records: the things that define what the island is and how it
  must be structured
- **`Admin/Operations/`** — processes, activities, skills, and live operational artefacts: the things that describe how the island runs day
  to day

Decision Records live at `Admin/Governance/Decisions/`. The path `Admin/Decisions/` established in GDR-KI-ARCADIA-001 is retired; all
tooling and references are updated to `Admin/Governance/Decisions/`.

The legacy zone name "Knowledge Capital" is retired. `Admin/` with the Governance/Operations structure is the canonical zone name and layout
for a Knowledge Island's administrative layer.

## Consequences

- All KI KB repos conforming to this pattern should adopt the `Admin/Governance/` and `Admin/Operations/` structure.
- The `knowledgeislands-decision-records` skill's placement rule for KB repos is updated: `Admin/Governance/Decisions/` is the canonical
  path.
- Enactment Process documentation and activity records — currently in Knowledge Capital — are future work for migration to
  `Admin/Operations/`.
- "Knowledge Capital" as a zone name is deprecated across KI documentation and tooling.

## References

- [GDR-KI-ARCADIA-001: Adopting Decision Records](GDR-KI-ARCADIA-001-adopting-decision-records.md)
