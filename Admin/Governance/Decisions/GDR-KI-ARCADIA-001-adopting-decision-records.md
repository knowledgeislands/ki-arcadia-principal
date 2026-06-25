---
type: admin/governance/decision
decision_type: governance
status: current - June 2026
author: Written with Claude
decision_depends_on: ['SDR-KI-ARCADIA-001']
---

# GDR-KI-ARCADIA-001: Adopting Decision Records

**Status:** Accepted

**Date:** 2026-06-25

## Context

Knowledge Islands produces decisions — about structure, tooling, governance, and direction — but had no mechanism for recording them
permanently. The Enactment Process produces `Decision` output rows in proposal documents, but proposals are deleted once settled. Decision
rationale disappears with them, leaving only the artefact, not the reasoning.

Two legacy skills existed to partially address this: `knowledgeislands-adrs`, governing Architecture Decision Records for code repos with
the `ADR-` prefix at `docs/decisions/`, and `knowledgeislands-kdrs`, governing Knowledge Decision Records for KB repos with the `KDR-`
prefix at `Admin/Decisions/`. Both used the same Nygard five-section format; the split served domain placement, not any meaningful
difference in format or purpose. Maintaining two instruments for an identical format added friction without benefit.

## Decision

Knowledge Islands adopts **Decision Records (DRs)** as the standard instrument for recording significant standalone decisions. The unified
`knowledgeislands-decision-records` skill governs the format across all repo types. DRs use the Nygard five-section format with a
`decision_type` field drawn from a nine-value taxonomy. Each type has its own prefix — `GDR-` (governance), `ADR-` (architecture), `SDR-`
(strategy), `PDR-` (product), `KDR-` (knowledge), `DDR-` (data), `XDR-` (security), `ODR-` (operations), `RDR-` (research) — and its own
monotonically increasing serial within a scope.

In KB repos, DRs are placed at `Admin/Decisions/`. Code repos place them at `docs/decisions/`. The `knowledgeislands-adrs` and
`knowledgeislands-kdrs` skills are retired.

## Consequences

- `Admin/Decisions/` is the canonical decision store for Knowledge Islands KB repos.
- Significant Enactment Process proposals may produce a DR as a named `Decision` output.
- The nine-value `decision_type` taxonomy covers the full decision surface of a knowledge island.
- Each type's prefix encodes the kind of decision at the filename level, making it readable without opening the file.
- Serials are per prefix within a scope — `GDR-KI-ARCADIA-001` and `SDR-KI-ARCADIA-001` may share the integer `001`.
- Other islands adopt the DR standard by declaring `[knowledgeislands-decision-records]` in their `.ki-config.toml`.

## References

- [knowledgeislands-decision-records skill](../../../Pillars/Knowledge%20Islands/Model/Tools/Claude/Claude.md)
- [Enactment Process](../../../Pillars/Knowledge%20Islands/Model/Processes/Enactment%20Process/Enactment%20Process.md)
