---
id: SDR-KI-ARCADIA-007
title: 'The Great Library of Arcadia'
date: 2026-06-25
status: current
type: Strategy Decision Record
type_url: https://knowledgeislands.info/specifications/decision-records/sdr
decision_type: strategy
decision_depends_on: ['SDR-KI-ARCADIA-001', 'SDR-KI-ARCADIA-002', 'SDR-KI-ARCADIA-003']
---

# SDR-KI-ARCADIA-007: The Great Library of Arcadia

## Context

SDR-KI-ARCADIA-001 named Arcadia as the first Knowledge Island and the canonical seat of the Knowledge Islands model. SDR-KI-ARCADIA-002 established Arcadia's role within the Archipelago. SDR-KI-ARCADIA-003 defined the governance of a single island and its zones.

What remained undefined was what Arcadia's `Pillars` zone actually contains - the shape and scope of the library that makes Arcadia more than an administrative repository. A Knowledge Island is only as valuable as the knowledge it holds. Arcadia has a specific purpose: it is the island from which the Knowledge Islands model is maintained and extended, and from which the practical tools of the system - design language, technical infrastructure, operating philosophy - are held.

The "Great Library of Arcadia" names this intentional structure: a curated, interconnected body of knowledge that grounds and extends the model in practice.

## Decision

### The Library metaphor

Arcadia's `Pillars/` zone is the Great Library - a living, structured repository of internal knowledge owned by the island. The Library metaphor is precise: it is an institution for organising, preserving, and making accessible a curated body of knowledge. Unlike a wiki or a note dump, the Library has structure, curation standards, and an explicit boundary (the Pillars/Resources boundary) between what the island owns and what it merely references.

The Library is "great" in the sense of scope: it does not specialise in a single domain. It holds the operational and philosophical infrastructure of the entire Knowledge Islands system.

### Pillars in Arcadia

The Library is organised into three pillars, each with a distinct scope and purpose:

| Pillar         | Scope                                                                                  |
| -------------- | -------------------------------------------------------------------------------------- |
| **Philosophy** | The Knowledge Islands model †                                                          |
| **Aesthetics** | The design language of the Knowledge Islands system ‡                                  |
| **Technē**     | Technical knowledge: engineering conventions, infrastructure, tooling, and substrate § |

† Its structure, conventions, processes, activities, agents, and tools. The canonical definition of what Knowledge Islands is.

‡ Visual identity, component library, isometric tile sets, maps, diagrams, and the logo.

§ The technical substrate on which the islands run.

This structure reflects the three registers of any complex system: the governing model (Philosophy), the visible identity (Aesthetics), and the technical execution (Technē). Each pillar has its own conventions, its own depth, and its own audience - but they are held together because Arcadia governs all three.

### Philosophy as the canonical seat

The Philosophy pillar is not merely Arcadia's local notes about Knowledge Islands. It is the canonical definition: the specification from which any island wishing to adopt the model would read. Changes to Philosophy's canonical layer (the `Model/` subtree) go through the Contribution Process defined in SDR-KI-ARCADIA-005. Other islands may hold their own copies; they pull from Arcadia's model, not the reverse.

Philosophy is named for what its content IS - the conceptual backstory and governing principles of the Knowledge Islands system - not for who it belongs to. All pillars in Arcadia are about Knowledge Islands in one sense; Philosophy holds the philosophical and structural layer that defines the system itself.

### Scope and growth

New pillars are added when:

1. A coherent body of internal knowledge accumulates that is distinct in scope from existing pillars.
2. That knowledge warrants the structural overhead of a pillar: an index, its own conventions, depth of at least several notes.
3. It does not fit cleanly as a sub-folder of an existing pillar.

Domain knowledge that belongs to a specific context (a client, a project, a tool) goes to `Resources/` (external reference) or `Streams/` (live work in progress), not `Pillars/`.

## Consequences

- Arcadia's `Pillars/` zone is three pillars: Philosophy, Aesthetics, and Technē. This is the deliberate shape of the Great Library.
- The Philosophy pillar is the canonical seat of the Knowledge Islands model. Changes to it pass through the Contribution Process.
- New pillars require deliberate decision - they are not created by default when a new topic area emerges.
- The "Great Library" name is not metaphor for ambition; it names the institutional role Arcadia's Pillars play within the Knowledge Islands system: the place where the model is held, maintained, and extended.

## References

- [SDR-KI-ARCADIA-001: Knowledge Islands - The Strategy](SDR-KI-ARCADIA-001-knowledge-islands-the-strategy.md)
- [SDR-KI-ARCADIA-002: The Home of Knowledge](SDR-KI-ARCADIA-002-the-home-of-knowledge.md)
- [SDR-KI-ARCADIA-003: The Governance of an Island](SDR-KI-ARCADIA-003-the-governance-of-an-island.md)
- [SDR-KI-ARCADIA-005: Territories, Archipelagos, and the Constitutional Layer](SDR-KI-ARCADIA-005-territories-archipelagos-and-the-constitutional-layer.md)
- [Great Library of Arcadia](../../../Pillars/Philosophy/Realisation/Arcadia/Great%20Library%20of%20Arcadia/Great%20Library%20of%20Arcadia.md)
- [Pillars](../../../Pillars/Pillars.md)
