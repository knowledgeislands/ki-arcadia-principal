---
type: admin/governance/decision
decision_type: governance
status: current - June 2026
author: Written with Claude
---

# GDR-ARCADIA-001: Adopting Decision Records

**Status:** Accepted

**Date:** 2026-06-25

## Context

arcadia-principal had no mechanism for recording standalone structural decisions. The Enactment Process produces `Decision` output rows in
proposal documents, but proposals are deleted once settled -- the decision rationale disappears with them. Significant choices about island
structure, tooling, and cross-repo relationships left no permanent record beyond what was incidentally embedded in Pillars notes.

The `knowledgeislands-adrs` skill governed Architecture Decision Records for code/software repos, using the `ADR-` prefix and
`docs/decisions/` placement. A parallel `knowledgeislands-kdrs` skill was introduced for KB repos, using the `KDR-` prefix and
`Admin/Decisions/` placement. Both used the same Nygard five-section format; the split existed only for domain placement and type taxonomy.
Maintaining two instruments with identical format added friction without benefit.

## Decision

arcadia-principal adopts **Decision Records (DRs)** at `Admin/Governance/Decisions/`, governed by the `knowledgeislands-decision-records`
skill. DRs use the Nygard five-section format with a `decision_type` field drawn from a nine-value taxonomy. Each `decision_type` has its
own prefix: `GDR-` (governance), `ADR-` (architecture), `KDR-` (knowledge), `SDR-` (strategy), `PDR-` (product), `DDR-` (data), `XDR-`
(security), `ODR-` (operations), `RDR-` (research). Serials are global within the `ARCADIA` scope -- no two DRs share a serial regardless of
prefix.

The `knowledgeislands-adrs` and `knowledgeislands-kdrs` skills are retired. The unified `knowledgeislands-decision-records` skill covers all
DR types across code and KB repos. Decision Records placed at `Admin/Governance/Decisions/` are the formal output of Enactment Process
proposals whose `Decision` row warrants a standalone permanent record.

## Consequences

- `Admin/Governance/Decisions/` is the canonical decision store for arcadia-principal.
- Significant Enactment Process proposals now produce a DR as a named `Decision` output.
- The nine-value `decision_type` taxonomy covers the full decision surface of a knowledge island, replacing the six-value KDR taxonomy.
- The prefix encodes `decision_type` at the filename level, making the kind of decision immediately readable from the filename alone.
- Other KI islands may adopt the DR standard by declaring `[knowledgeislands-decision-records]` in their `.ki-config.toml`.

## References

- [knowledgeislands-decision-records skill](../../../Pillars/Knowledge%20Islands/Model/Tools/Claude/Claude.md) -- skill governing the DR
  format standard
- [Enactment Process](../../../Pillars/Knowledge%20Islands/Model/Processes/Enactment%20Process/Enactment%20Process.md) -- the process whose
  `Decision` outputs this DR formalises
