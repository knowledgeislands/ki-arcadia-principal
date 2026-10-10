---
note_type: admin/governance/decision
id: GDR-KI-ARCADIA-002
title: 'Admin Zone - Governance and Operations'
date: 2026-06-25
updated: 2026-10-10
status: current
decision_type_url: https://knowledgeislands.info/specifications/decision-records/gdr
decision_type: governance
decision_depends_on: ['GDR-KI-ARCADIA-001']
---

# GDR-KI-ARCADIA-002: Admin Zone - Governance and Operations

## Context

The Admin zone of a Knowledge Island holds content of two fundamentally different kinds: governance artefacts (conventions, policies, templates, decision records - things that describe _what must be true_) and operational artefacts (processes, activities, skills, live working documents - things that describe _how things get done_). A flat `Admin/` directory cannot express this distinction. Without structure, governance artefacts and operational artefacts share the same space, making it harder to locate the authoritative record of a convention or understand which documents govern the island versus which describe its running.

A Decision Record is always a governance artefact regardless of its `decision_type`: it records why a policy, convention, or structural commitment became what it is. DRs are the provenance layer beneath governance.

This pattern applies to any Knowledge Island that has adopted the Knowledge Islands model, not only to Arcadia.

## Decision

The `Admin/` zone of a Knowledge Island organises into two arms:

- **`Admin/Governance/`** - conventions, policies, templates, and decision records: the things that define what the island is and how it must be structured
- **`Admin/Operations/`** - processes, activities, skills, and live operational artefacts: the things that describe how the island runs day to day

Decision Records live at `Admin/Governance/Decisions/`, and tooling and references use that path.

`Admin/` with the Governance/Operations structure is the canonical zone name and layout for a Knowledge Island's administrative layer.

## Consequences

- Every KI KB repository conforming to this pattern uses the `Admin/Governance/` and `Admin/Operations/` structure.
- The `ki-decision-records` skill's placement rule for KB repositories names `Admin/Governance/Decisions/` as the canonical path.
- Enactment Process documentation and Activity records live under `Admin/Operations/`.

## References

- [[GDR-KI-ARCADIA-001-adopting-decision-records|GDR-KI-ARCADIA-001]] - adopts the Decision Records instrument whose placement this record sets.
