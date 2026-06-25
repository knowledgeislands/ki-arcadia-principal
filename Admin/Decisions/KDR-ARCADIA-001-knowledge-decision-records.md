---
tags:
  - card/kdr
type: governance
status: current - June 2026
author: Written with Claude
---

# KDR-ARCADIA-001: Adopting Knowledge Decision Records

**Status:** Accepted

**Date:** 2026-06-25

## Context

arcadia-principal has no mechanism for recording standalone architectural decisions. The Enactment Process produces `Decision` output rows
in proposal documents, but proposals are deleted once settled -- the decision rationale disappears with them. Significant choices about
island structure, tooling, and cross-repo relationships leave no permanent record beyond what is incidentally embedded in Pillars notes.

The `knowledgeislands-adrs` skill governs Architecture Decision Records for code/software repos, but arcadia-principal is a knowledge base
organised by zones. The code-repo convention (`docs/decisions/`) does not align with the zone model, and "Architecture" is a
software-specific framing that does not cover the full decision surface of a knowledge island (taxonomy, naming, governance, process,
product).

## Decision

arcadia-principal adopts **Knowledge Decision Records (KDRs)** as `card/kdr` notes in `Admin/Decisions/`. KDRs use the same Nygard
five-section format as ADRs but are named and placed for KB/island repos. Each KDR carries a `type` field drawn from a six-value taxonomy
(architecture, product, governance, taxonomy, naming, process) covering the full decision surface of a knowledge island.

The `knowledgeislands-kdrs` skill governs the format standard, rubric, and mechanical checker. `.ki-config.toml` declares adoption and
configures the scope identifier (`ARCADIA`). For code repos (arcadia-agentic-harness, arcadia-website), ADRs and `docs/decisions/` remain
correct.

KDRs are the formal artifact for Enactment Process proposals whose `Decision` output warrants a standalone record. The proposal's output row
cites the KDR by ID.

## Consequences

- `Admin/Decisions/` is established as the governance decision store, giving the Admin zone its first substantive content and advancing the
  planned migration of governance artifacts from Knowledge Capital into Admin.
- Significant Enactment Process proposals now produce a KDR as a named `Decision` output.
- The `card/kdr` tag is added to the island's tag taxonomy.
- Other KI islands may adopt KDRs by declaring `[knowledgeislands-kdrs]` in their `.ki-config.toml`.

## References

- [knowledgeislands-kdrs skill](../../Pillars/Knowledge Islands/Model/Tools/Claude/Claude.md) — skill governing the KDR format standard
- [Enactment Process](../../Pillars/Knowledge Islands/Model/Processes/Enactment%20Process/Enactment%20Process.md) — the process whose
  `Decision` outputs this KDR formalises
