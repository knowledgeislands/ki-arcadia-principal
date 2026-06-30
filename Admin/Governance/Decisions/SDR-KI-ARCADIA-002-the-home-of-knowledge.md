---
type: admin/governance/decision
decision_type: strategy
status: current - June 2026
author: Written with Claude
decision_depends_on: ['SDR-KI-ARCADIA-001']
---

# SDR-KI-ARCADIA-002: The Home of Knowledge

**Status:** Accepted

**Date:** 2026-06-25

## Context

SDR-KI-ARCADIA-001 established the geographic metaphor — islands, territories, archipelagos — and the strategic intent behind Knowledge Islands. What it did not define is what an island physically is: where knowledge lives, how it is organised, and what distinguishes a knowledge base from an unstructured repository.

Knowledge exists at three layers. **Individual knowledge** lives in the mind and its personal extensions — notes, tools, memory aids. **Collective knowledge** is shared across teams and communities. **Civilisational knowledge** is preserved across generations in libraries, archives, and cultural institutions. A Knowledge Island operates across all three layers, with the model providing the structure for knowledge to extend beyond any single mind — without replacing the mind as the source of meaning.

An island needs a physical home that reflects this. Without a defined structure, knowledge accumulates without governance: there is no clear distinction between what is in motion and what is settled, between canonical knowledge and working material, between what belongs to this island and what is incoming from outside.

## Decision

A Knowledge Island lives in a **knowledge base**: a git-backed text store (Markdown files, structured folders) with a defined zone layout. The knowledge base is the physical substrate of the island — the repository in which its Capital, Library, and Streams reside.

The island's physical home is organised around a geographic metaphor made structural:

**The Capital** is the civic centre of the island. It contains two buildings:

- **The Library** — the canonical record of the island's knowledge, organised into zones: **Calendar** (time-bound notes), **Pillars** (internal canonical knowledge), and **Resources** (external reference material). Nothing enters Pillars or Resources as settled knowledge without passing through the island's governance gate.
- **The Council Hall** — the governance space: the home of proposals, decisions, and the Enactment Process.

**Streams** are knowledge in motion — the working layer of the island. Active projects, evolving ideas, and incoming material under development live in Streams. Streams carry knowledge at five focus levels: Active, Background, Dormant, Future, and Settled.

**The Harbour** is the port of entry — the inbox where material arrives from outside before being assessed, routed, or discarded.

**Admin** is the governance and operations zone, separate from the knowledge stores: conventions, policies, decision records, and operational artefacts.

The physical zone layout of a knowledge base is therefore:

| Zone        | Purpose                                           |
| ----------- | ------------------------------------------------- |
| Calendar/   | Time-bound notes: daily, weekly, session, meeting |
| Pillars/    | Internal canonical knowledge — stable, ratified   |
| Resources/  | External reference material — stable, ratified    |
| Streams/    | Knowledge in motion — active, working             |
| Admin/      | Governance and operations                         |
| `+` (inbox) | Incoming material awaiting routing                |

## Consequences

- Every Knowledge Island is implemented as a knowledge base: a git-backed text store with this zone structure.
- The distinction between Streams (work in motion) and Pillars/Resources (stable, ratified knowledge) is a physical boundary, not merely a convention.
- The Capital — Library and Council Hall — is the governance infrastructure of the island. It is introduced here as a concept; its realisation (Charter, Council, integrations) is specific to each island and held in Knowledge Capital.
- Multiple knowledge bases may constitute a single territory; the zone structure applies to each.

## References

- [SDR-KI-ARCADIA-001: Knowledge Islands — The Strategy](SDR-KI-ARCADIA-001-knowledge-islands-strategy.md)
- [The Home of Knowledge](../../../Pillars/Knowledge%20Islands/Introduction/Background/The%20Home%20of%20Knowledge/The%20Home%20of%20Knowledge.md)
- [Layers of Knowledge](../../../Pillars/Knowledge%20Islands/Introduction/Background/Layers%20of%20Knowledge/Layers%20of%20Knowledge.md)
- [Structure](../../../Pillars/Knowledge%20Islands/Model/Conventions/Structure/Structure.md)
