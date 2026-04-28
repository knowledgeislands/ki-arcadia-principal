---
tags:
  - card/note
  - topic/knowledge-islands
status: current - April 2026
purpose: Canonical definition of the Knowledge Islands model - island types, archipelago structure, physical stores, and governance infrastructure
author: Written with Claude
---

# Knowledge Islands

## Overview

Knowledge Islands is a conceptual model for organising knowledge. It is informed by [Zettelkasten][zettelkasten] and [PARA Method][para] and greatly enhanced in its possibilities by LLM AI (such as Claude, ChatGPT, Gemini) and its evolvement in a pattern widely known as [Karpathy LLM Wiki][karpathy-llm-wiki].

In Knowledge Islands, knowledge is treated as a natural, evolving system - islands are discrete bodies of knowledge, archipelagos are groups of islands governed together under the same rules of access, contribution, and change.

Arcadia is the Knowledge Island of Knowledge Islands - a legendary utopia in the form of an archipelago that holds the canonical definition and governance model for the entire Knowledge Islands concept. Every other archipelago that adopts the model derives its baseline from Arcadia.

---

## Concept

[[Pillars/Knowledge Islands/Concept/Concept|Concept]] is the full conceptual model. It defines what knowledge is - distinct from information and from wisdom - and how it matures through continuous cycles of capture, connection, and reflection. It maps the geography of an island: the Capital and its Library (the canonical record, organised into Calendar, Pillars, and Resources) and Streams (knowledge in motion); the Harbour as the port of entry; and the territory and archipelago structures that govern how islands relate. It defines agents - human and artificial - and the jurisdictional model of Citizen, Visitor, and Council Member. The model is portable: Arcadia holds the canonical definition; any archipelago may adopt it and derive its own realisation.

---

## Governance

Every island holds jurisdiction over its own canonical knowledge - nothing reaches stable knowledge in Pillars or Resources except through the island's own ratification process. [[Pillars/Knowledge Islands/Governance/Governance|Governance]] is the operational layer that makes this work day to day: the conventions that define what a note looks like and where it lives, the processes through which changes are proposed and ratified, the activities that keep the island healthy, and the agents and tools through which all of this happens.

The governance model is portable. Three patterns are defined - council, single-governor, and joint-governor - and each island's specific realisation lives in its own [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]]. Every person interacting with an island holds a standing within it: a **Citizen** has full standing and is eligible for council membership; a **Visitor** may contribute informally but holds no formal standing. Changes to canonical knowledge move through the [[Pillars/Knowledge Islands/Governance/Processes/Enactment Process|Enactment Process]]. The [[Pillars/Knowledge Islands/Governance/Processes/Contribution Process|Contribution Process]] governs how knowledge crosses the boundary between islands and how other archipelagos may contribute back to the canonical model in Arcadia.

---

## Management

### Physical Stores

Each island realises its knowledge through one or more physical stores:

| Store             | Purpose                                                         | Structure                     |
| ----------------- | --------------------------------------------------------------- | ----------------------------- |
| **Text store**    | Markdown notes - version-controlled, git-backed, human-readable | Canonical KB folder structure |
| **Binary store**  | Large binary files - images, PDFs, exports, attachments         | Mirrors text store exactly    |
| **Working space** | Temporary area used by tools and agents; ephemeral              | None required                 |

The text and binary stores must share an identical folder structure so that files are co-located by topic regardless of which store they live in. When creating or referencing a binary asset, save it to the binary store under the same relative subfolder as the corresponding note.

Git is the source of truth for canonical knowledge. The working space is ephemeral - nothing in it is canonical until committed to a store.

### Governance Infrastructure

The governance infrastructure belongs to the principal island and serves the entire archipelago. It is not a store - it is the operational layer through which knowledge is managed and evolved:

| Infrastructure     | Purpose                                                                                              |
| ------------------ | ---------------------------------------------------------------------------------------------------- |
| **Cowork project** | The parliament - where proposals are reviewed, sessions are run, and archipelago-wide decisions made |
| **Working folder** | The yard - temporary scratch space for in-progress work; discarded once committed or abandoned       |

Specific paths for this island are defined in [[Physical Locations]].

---

## Knowledge Capitals

Every general concept defined in [[Knowledge Islands]] has a corresponding specific realisation in [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]]. The two are structural mirrors: Knowledge Islands holds the portable, island-agnostic definition; Knowledge Capital holds Arcadia's instance of that definition - this island's council, citizenship records, integration configuration, routing overrides, and identity. When adding a new generic concept here, its island-specific counterpart belongs in Knowledge Capital, not in Knowledge Islands itself.

---

## Related Topics

- [[Pillars/Pillars|Pillars]] - parent index
- [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]] - the specific realisation of Knowledge Islands for this island

[zettelkasten]: https://zettelkasten.de/introduction/
[para]: https://fortelabs.com/blog/para/
[karpathy-llm-wiki]: https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
