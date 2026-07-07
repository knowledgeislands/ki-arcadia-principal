---
type: admin/governance/decision
decision_type: governance
status: current - June 2026
author: Written with Claude
decision_depends_on: ['SDR-KI-ARCADIA-001']
---

# GDR-KI-ARCADIA-002: Arcadia's repositories — the island and the framework

**Status:** Accepted

**Date:** 2026-06-25

## Context

The Knowledge Islands strategy (SDR-KI-ARCADIA-001) structures each domain of human concern as an independent territory with its own governance. **Knowledge Islands** is the portable framework — the model, the `ki-*` skill family, and the `KI-` decision-record scope — and **Arcadia** is its first and canonical island: the exemplar base that proves the model in practice. The work of Arcadia spans three repositories in the `knowledgeislands` organisation, and their concerns differ: one is the island itself, and two are framework-level infrastructure that any island can adopt or is served by. Repository names carry that distinction, and their boundaries are stated here so new work has a home rather than being placed by convention or accident.

## Decision

The Arcadia work is held in three repositories, each with a distinct and non-overlapping concern:

**`ki-arcadia-principal`** is the **canonical base** — the first Knowledge Island and the source of the KI model. It owns the Knowledge Islands philosophy and model; it is the exemplar island that proves the model in practice. New KI concepts are developed and validated here, its Pillars are authoritative, and the canonical portable model that other islands derive from lives here. It does not deliver tooling.

**`ki-agentic-harness`** is the **framework's general tooling** (scope `KI-HARNESS`). It holds the skills, agent definitions, MCP wrappers, and evals that any island adopts. It is framework-level, not Arcadia-territory-scoped: it receives patterns proven in `ki-arcadia-principal` and generalises them into reusable instruments. The harness does not originate philosophy; it makes philosophy usable. Skills in the harness cite source notes from `ki-arcadia-principal` and do not fork them.

**`ki-website`** is the **framework's public site** (knowledgeislands.info). It is framework-level: it disseminates the Knowledge Islands model outward to the world. It does not originate philosophy or tooling; it translates and publishes.

The canonical flow is: **base** (prove and model) → **harness** (generalise into portable tooling) → **website** (disseminate and publish).

## Consequences

- Content decisions about the KI model are made in `ki-arcadia-principal` under its Enactment Process.
- The harness pulls from `ki-arcadia-principal`; it does not push decisions back.
- `ki-website` publishes the framework outward; it does not independently develop knowledge.
- The base/framework separation applies as a pattern to future islands: each adopts the framework's shared tooling and public presence rather than standing up its own, and holds its own knowledge in its principal repository.

## References

- [SDR-KI-ARCADIA-001: Knowledge Islands — The Strategy](SDR-KI-ARCADIA-001-knowledge-islands-strategy.md)
- [Knowledge Islands](../../../Pillars/Knowledge%20Islands/Knowledge%20Islands.md)
- [Great Library of Arcadia](../../../Pillars/Knowledge%20Islands/Realisation/Arcadia/Great%20Library%20of%20Arcadia/Great%20Library%20of%20Arcadia.md)
