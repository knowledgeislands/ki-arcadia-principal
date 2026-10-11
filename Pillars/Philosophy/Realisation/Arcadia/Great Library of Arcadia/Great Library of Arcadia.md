---
note_type: pillars/index
updated: 2026-10-11T12:00:00Z
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: current - October 2026
author: Written with Claude
---

# Great Library of Arcadia

## Overview

The Great Library of Arcadia is the name for Arcadia's `Pillars/` zone: the curated, interconnected body of internal knowledge that Arcadia owns, and the place where the Knowledge Islands model is held, maintained and extended. [[SDR-KI-ARCADIA-007-the-great-library-of-arcadia|SDR-KI-ARCADIA-007]] establishes the name and its shape. This note closes [[Realisation/Realisation|Realisation]] by showing what the model's Library looks like in a real island, and records the questions the decision leaves open.

The name names an institutional role, not an ambition. Like a library rather than a wiki or note dump, it has structure, curation standards and an explicit boundary between what the island owns and what it merely references. It is "great" in scope: it does not specialise in one domain, but holds the philosophical, visual and technical infrastructure of the whole Knowledge Islands system.

---

## The Library in the model

Every Knowledge Base island has a Library. [[The Home of Knowledge]] places it in the Capital beside the Council Hall, and [[Structure]] defines it as the canonical record - version-controlled, governed and the single source of truth - containing Calendar, Pillars and Resources. [[SDR-KI-ARCADIA-002-the-home-of-knowledge|SDR-KI-ARCADIA-002]] puts stable internal knowledge in `Pillars/` and external reference in `Resources/`, with Calendar, Admin, Streams and the staging areas each in their own home. Streams, the Harbour (`+/`) and outbound staging (`-/`) are not part of the Library: their content is in motion or in transit, not canonical.

The Great Library is the realisation of that convention in Arcadia, with one deliberate narrowing: [[SDR-KI-ARCADIA-007-the-great-library-of-arcadia|SDR-KI-ARCADIA-007]] identifies it with Arcadia's `Pillars/` zone alone. Arcadia's Resources and Calendar still belong to its Library in the model's sense, but they are not what the name points at. The Pillars/Resources boundary in [[Structure]] keeps the distinction honest - internal knowledge in Pillars, independently existing reference in [[Resources]], linked both ways where relevant.

The name also answers the model's own history. [[History of Knowledge Systems]] recalls the great libraries of Alexandria, Baghdad and Nineveh - the first attempts to gather everything known in one place - and the single point of failure they shared. [[Layers of Knowledge]] places libraries at the civilisational layer, where knowledge outlives any single mind.

---

## The four pillars

[[SDR-KI-ARCADIA-007-the-great-library-of-arcadia|SDR-KI-ARCADIA-007]] organises the Library into four pillars, reflecting the registers of any complex system: a governing model, a visible identity and a technical practice, with a retained entry point for the engineering discipline. Each has its own conventions, depth and audience; Arcadia's governance holds them together. [[Pillars]] is the zone index.

### Philosophy

[[Philosophy]] holds the portable Knowledge Islands model and is its canonical seat: the definition an island wishing to adopt the model would read, not merely Arcadia's local notes about it. It is told in three acts - [[Introduction/Introduction|Introduction]], [[Model/Model|Model]] and Realisation - with [[Knowledge Islands]] as the narrative front door. The decision names the `Model/` subtree as the canonical layer that other islands pull from; they may hold their own copies, but knowledge flows from Arcadia's model, not the reverse.

### Aesthetics

[[Aesthetics]] holds the design language of Knowledge Islands: the visual style, symbol library, isometric tile sets, conceptual diagrams and logo. It gives the model a consistent, recognisable form across diagrams, interfaces and publications.

### Engineering Practice

[[Engineering Practice/Engineering Practice|Engineering Practice]] holds Techné, the engineering discipline maintained in Arcadia: foundations, architecture, operating model and technology posture. It is the canonical destination of knowledge adopted from the retired `ki-techne-principal` tree, with its scope and the [[Techne Programme Hold]] recorded in [[Engineering Practice/MEMORY|Engineering Practice memory]]. Implementation remains with `ki-techne-harness` and `tools-techne`.

### Technē

[[Technē]] is the retained entry point for the engineering discipline. It keeps existing links usable and, through the [[Tool Ecosystem Map]], signposts ownership across the ecosystem; it is deliberately not a second engineering knowledge store.

---

## Other islands and the Library

The Great Library is a reference for other islands, not a jurisdiction over them. [[Jurisdiction]] gives every island authority over what reaches its own Library, and [[SDR-KI-ARCADIA-005-territories-archipelagos-and-the-constitutional-layer|SDR-KI-ARCADIA-005]] makes Arcadia the canonical home of the public model while denying it any universal meta-jurisdiction. A receiving territory chooses whether to reference or adopt public Knowledge Islands knowledge, records its source and revision, owns any local adaptation and decides when to review updates. Adopting Charter and Conformance as a constitutional baseline gives the model's author no write, approval or execution authority over the adopter.

Within the territory, [[Known Lands]] owns the inventory of member islands and signposts external lands. Any island may keep its own chart of useful topics and sources without claiming jurisdiction. Contributions flow the other way only by consent: a formal contribution to the canonical model is carried through Arcadia's Council and Enactment Process, scoped to portable knowledge and accepted by Arcadia before it lands.

Publication follows the same rule. [[Arcadia]] describes the Knowledge Islands website as an independently deployable publication that vendors selected source material, never a third source of truth; what it publishes from the Library remains canonical here.

---

## How the Library grows

Nothing enters the Library except through governance. New or reworked content in `Pillars/` passes through the [[Admin/Operations/Processes/Enactment Process|Enactment Process]], Arcadia's local realisation of the model's [[Model/Processes/Enactment Process/Enactment Process|Enactment Process]]: a roadmap record moves from draft to done, or an explicit owner instruction for a bounded change stands in for one. Knowledge matures from Streams into Pillars, and the Stream is then retired; incoming material is assessed in the Harbour before it is routed inward.

Growth in breadth is deliberately slow. [[SDR-KI-ARCADIA-007-the-great-library-of-arcadia|SDR-KI-ARCADIA-007]] adds a pillar only when a coherent body of internal knowledge accumulates that is distinct from the existing pillars, warrants the overhead of an index, its own conventions and several notes, and does not fit as a sub-folder of an existing pillar. Domain knowledge tied to a client, project or tool goes to Resources or Streams instead. A new pillar is a deliberate decision, never a default response to a new topic.

---

## Open questions

These points are not settled by the island's current notes and decisions.

- **Scope of the name.** [[Structure]] and [[The Home of Knowledge]] say the Library contains Calendar, Pillars and Resources; [[SDR-KI-ARCADIA-002-the-home-of-knowledge|SDR-KI-ARCADIA-002]] groups Pillars and Resources as the Library with Calendar alongside; [[SDR-KI-ARCADIA-007-the-great-library-of-arcadia|SDR-KI-ARCADIA-007]] identifies the Great Library with Pillars alone. Whether Arcadia's Resources - and its Calendar - are part of the Great Library is undecided, and the three framings could be aligned.
- **Technē as a pillar.** [[SDR-KI-ARCADIA-007-the-great-library-of-arcadia|SDR-KI-ARCADIA-007]] counts Technē as one of four pillars, yet it is a signpost with no knowledge of its own and would not meet the decision's own criteria for a new pillar. Whether it stays a pillar, becomes a sub-entry of Engineering Practice or is retired once old links are repointed is open.
- **The canonical layer.** The decision names `Model/` as the canonical layer that adopters pull from, while Philosophy also holds Introduction and Realisation. Whether those acts are part of what adopters take, or Arcadia-specific narrative around the model, is not stated.
- **Publication.** The website is meant to acquire material through explicit, source-labelled vendor paths, but which parts of the Library are published, and how, is not yet decided.
- **Distribution.** The model recalls the single point of failure of the ancient libraries. Version control and recorded adoption with provenance spread copies of the model, but whether the Great Library should state a resilience posture of its own has not been considered.

---

## Related

- [[Arcadia]] - Arcadia as the living island and its publication principle
- [[Pillars]] - the zone index and current shape of the Library
- [[Structure]] - the Library, routing rules and the Pillars/Resources boundary
- [[SDR-KI-ARCADIA-007-the-great-library-of-arcadia|SDR-KI-ARCADIA-007]] - the decision that names the Great Library
