---
type: admin/governance/decision
decision_type: strategy
status: current - June 2026
author: Written with Claude
decision_depends_on: ['SDR-KI-ARCADIA-002']
---

# SDR-KI-ARCADIA-003: The Governance of an Island

**Status:** Accepted

**Date:** 2026-06-25

## Context

SDR-KI-ARCADIA-002 defined what an island is physically: a knowledge base with defined zones. A physical structure alone does not make an island function. Without governance, the zones are folders: the Library does not stay stable, the Streams do not flow toward settled knowledge, and the island cannot be operated by agents — human or artificial — in a consistent, coherent way.

The Knowledge Islands model is portable: it defines a generic governance framework that any island can adopt, independent of the specific tools, integrations, or routing rules that island uses. The portable model and the island's specific realisation are distinct things. An island that conflates them — embedding its specific integrations in its governance documentation, or claiming its tool choices as part of the model — becomes harder to adapt, audit, and share.

## Decision

A Knowledge Island is governed across five areas that together make it operate day to day:

1. **Conventions** — the shared language of the island: note format, metadata schema, folder structure, and routing rules. Conventions define how knowledge is expressed and where it lives.
2. **Processes** — formal governance gates: the paths through which significant changes to the island must pass. Processes define how knowledge becomes stable and how the island itself evolves.
3. **Activities** — the ongoing work that keeps the island alive: scheduled automations, conversational curation, inbox review, and maintenance. Activities operate within the space the conventions and processes define.
4. **Agents** — who reads, writes, and reasons on the island: human and artificial. Agents carry out activities and submit proposals through processes.
5. **Tools** — the editors, AI systems, task managers, and connected services through which agents work. Tools are the operational implementation of everything above.

These five areas constitute the **portable model** — the generic framework that Knowledge Islands defines and that any island can adopt.

Each island's specific realisation of this model is held in its `Admin/` zone: the island's council, citizenship records, integration configuration, routing overrides, and declared adoption position on each activity group. Two elements are required by every island:

- **Charter** — the island's identity and its declared adoption position on every activity group; no unknowns are permitted.
- **Council** — the governance body that ratifies proposals and holds authority on the island. On a single-person island, the sole member stands in for the council.

## Consequences

- The five governance areas — Conventions, Processes, Activities, Agents, Tools — provide the complete vocabulary for describing how any island works.
- The portable model (defined in Arcadia, adopted by any island) is distinguished from island-specific realisation. Documentation of the portable model belongs in Pillars; island-specific realisation belongs in `Admin/`.
- Charter and Council are required elements of every island's governance; their absence makes governance incomplete. Both live in `Admin/`.

## References

- [SDR-KI-ARCADIA-002: The Home of Knowledge](SDR-KI-ARCADIA-002-the-home-of-knowledge.md)
- [SDR-KI-ARCADIA-005: Territories, Archipelagos, and the Constitutional Layer](SDR-KI-ARCADIA-005-territories-archipelagos-constitutional-layer.md)
- [Governance](../../../Pillars/Knowledge%20Islands/Introduction/Concept/Governance/Governance.md)
- [How an Island Takes Shape](../../../Pillars/Knowledge%20Islands/Introduction/Concept/How%20an%20Island%20Takes%20Shape.md)
