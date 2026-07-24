---
id: SDR-KI-ARCADIA-004
title: 'The Enactment Process'
date: 2026-06-25
status: current
type: Strategy Decision Record
type_url: https://knowledgeislands.info/specifications/decision-records/sdr
decision_type: strategy
decision_depends_on: ['SDR-KI-ARCADIA-003']
---

# SDR-KI-ARCADIA-004: The Enactment Process

## Context

Knowledge does not improve by accumulating unchanged. It improves through a continuous cycle — **Capture** (material arrives from outside), **Connect** (material is assessed, contextualised, and linked to existing knowledge), and **Reflect** (periodic review surfaces what is stale, resolves gaps, and retires what no longer holds). This cycle produces two kinds of change: **informational change**, when new material enters the body of knowledge, and **reflective change**, when existing knowledge is reframed or retired without new input. Both are necessary; neither replaces the other.

The cycle runs continuously. Without a governance gate, both kinds of change land directly in Pillars and Resources — the stable, canonical zones of the island. Stable knowledge would degrade: proposals that have not been reviewed, material that has not been contextualised, and changes that have not been ratified would share space with knowledge the island depends on.

SDR-KI-ARCADIA-003 established that Processes are one of the five governance areas of an island, and that they define the formal paths through which significant changes must pass. The Enactment Process is that gate.

## Decision

Knowledge Islands adopts the **Enactment Process** as the governance gate for all changes to stable knowledge. Nothing reaches Pillars or Resources as settled knowledge except through council ratification of a proposal that specifies the change.

The process operates in a cycle alongside Streams:

```text
Stream  ←→  Enactment Process (Council)
            ↓ ratify
      Pillars / Resources
```

- **Streams** are the home of ongoing work. Authority to work in Streams is granted by the material's presence in the workspace — no proposal is needed to begin work there.
- **Pillars and Resources** are the home of stable, ratified knowledge. A proposal must pass through the council before anything lands there as settled.

A proposal moves through a defined status lifecycle:

`draft → ready → in-progress` → `rolled-out → reviewed → completed`

or, if rejected: `draft → ready → rejected`

The Enactment Process is not a tool the council uses — it is how the council operates. The council's authority is expressed entirely through this process. On a single-person island, the sole member stands in for the council.

The operational mechanics — the full status lifecycle, proposal-document anatomy, rollout discipline, post-change review rules, and working conventions — are defined canonically in the `knowledgeislands-streams` skill. This DR establishes the governance commitment; the skill is the single source of truth for the mechanics.

## Consequences

- The boundary between Streams and Pillars/Resources is a governance boundary, not merely a physical one. Work in motion lives in Streams; ratified knowledge lives in Pillars/Resources.
- Every significant change to canonical knowledge — whether informational or reflective — requires a proposal that passes through the Enactment Process.
- Proposals are ephemeral: they are deleted once settled, leaving only the resulting artefact and any Decision Record that captures the rationale.
- The `knowledgeislands-streams` skill is the canonical reference for operational mechanics. Islands working the process load that skill.
- Decision Records (when adopted) are one class of output that a settled proposal may produce — the permanent record of rationale that proposals themselves cannot provide.

## References

- [SDR-KI-ARCADIA-003: The Governance of an Island](SDR-KI-ARCADIA-003-the-governance-of-an-island.md)
- [The Cycle of Knowledge](../../../Pillars/Knowledge%20Islands/Introduction/Background/The%20Cycle%20of%20Knowledge/The%20Cycle%20of%20Knowledge.md)
- [Enactment Process](../../../Pillars/Knowledge%20Islands/Model/Processes/Enactment%20Process/Enactment%20Process.md)
