---
type: admin/governance/decision
decision_type: governance
status: current - June 2026
author: Written with Claude
decision_depends_on: ['SDR-KI-ARCADIA-001']
---

# GDR-KI-ARCADIA-002: The Arcadia Archipelago — Three Islands

**Status:** Accepted

**Date:** 2026-06-25

## Context

The Knowledge Islands strategy (SDR-KI-ARCADIA-001) structures each domain of human concern as an independent territory with its own
governance. Within the Knowledge domain, the Arcadia territory currently operates through three repos: `arcadia-principal`,
`arcadia-agentic-harness`, and `arcadia-website`. Their boundaries and relationships have remained implicit. Concerns have blurred — where
does new work go? Who holds authority over the model? What can the harness decide independently? Without explicit island-level separation of
concerns, these questions are settled by convention or accident rather than by deliberate structure.

## Decision

The Knowledge domain of Arcadia manifests as three islands, each with a distinct and non-overlapping concern:

**arcadia-principal** is the **source of knowledge**. It owns the Knowledge Islands philosophy and model. It is the exemplar island: the one
that proves the model in practice. New KI concepts are developed and validated here. Pillars are authoritative; the canonical portable model
that other islands derive from lives here. arcadia-principal does not deliver tooling.

**arcadia-agentic-harness** is the **realisation**. It owns general-purpose KI tooling — skills, agent definitions, and evals — that any
island can adopt. It receives patterns proven in arcadia-principal and generalises them into reusable instruments. The harness does not
originate philosophy; it makes philosophy usable. Skills in the harness cite source notes from arcadia-principal and do not fork them.

**arcadia-website** is the **publication**. It disseminates the philosophy outward from arcadia-principal to the world. It does not
originate philosophy or tooling; it translates and publishes.

The canonical flow is: **principal** (prove and model) → **harness** (generalise and realise) → **website** (disseminate and publish).

## Consequences

- Content decisions about the KI model are made in arcadia-principal under its Enactment Process.
- The harness pulls from arcadia-principal; it does not push decisions back.
- arcadia-website publishes from arcadia-principal; it does not independently develop knowledge.
- This island-level separation applies as a pattern to future territories: each domain may have a source island, a realisation island, and a
  publication island, structured to the same principle.

## References

- [SDR-KI-ARCADIA-001: Knowledge Islands — The Strategy](SDR-KI-ARCADIA-001-knowledge-islands-strategy.md)
- [Knowledge Islands](../../../Pillars/Knowledge%20Islands/Knowledge%20Islands.md)
- [Great Library of Arcadia](../../../Pillars/Knowledge%20Islands/Realisation/Arcadia/Great%20Library%20of%20Arcadia/Great%20Library%20of%20Arcadia.md)
