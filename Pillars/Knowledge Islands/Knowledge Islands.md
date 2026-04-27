---
tags:
  - card/note
  - topic/knowledge-islands
status: current - April 2026
purpose: Canonical definition of the Knowledge Islands model — island types, archipelago structure, physical stores, and governance infrastructure
author: Written with Claude
---

# Knowledge Islands

## Overview

Knowledge Islands is a conceptual model for organising knowledge. It is informed by [Zettelkasten][zettelkasten] and [PARA Method][para] and greatly enhanced in its possibilities by LLM AI (such as Claude, ChatGPT, Gemini) and its evolvement in a pattern widely known as [Karpathy LLM Wiki][karpathy-llm-wiki].

In Knowledge Islands, knowledge is treated as a natural, evolving system — islands are discrete bodies of knowledge, archipelagos are groups of islands governed together under the same rules of access, contribution, and change.

Arcadia is the Knowledge Island of Knowledge Islands — a legendary utopia in the form of an archipelago that holds the canonical definition and governance model for the entire Knowledge Islands concept. Every other archipelago that adopts the model derives its baseline from Arcadia.

---

## Concepts

See [[Concept|Concept]] for the full methodology. Key concepts:

**Ecosystem architecture** — the system is organised in three layers. The **island** (core) is the repository: Markdown files, version-controlled, single source of truth. **Knowledge Management** (ring) is the methodology layer — conventions, structure, and integration patterns that govern how the core is maintained. **Integrations** (petals) are the tools and surfaces through which the island is accessed and enriched; all integrations operate through the Knowledge Management layer and do not bypass it.

**Island types** — an **island** is a discrete, self-contained body of knowledge with defined boundaries. The unit of governance is a **territory**: one or more islands with exactly one **principal island** — the seat of governance, holding the Capital and carrying the shared governance infrastructure. A **satellite island** is a separate, governed extension: its own stores, same governance as the principal, but with an independent boundary. The boundary rule: **if customs exist at the boundary, it is a separate territory**. If knowledge flows freely with no boundary controls, it is internal structure.

**Archipelago** — a territory spanning multiple islands. Islands within a territory share governance conventions but maintain independent stores. A change to one island does not automatically affect another — each change goes through the shared [[Pillars/Knowledge Islands/Governance/Processes/Enactment Process|Enactment Process]].

---

## Governance

Every island holds jurisdiction over its own canonical knowledge. [[Concept|Concept]] defines the authority structure — nothing reaches stable knowledge in Pillars or Resources except through the island's own governance.

The governance model is portable: each island adopts the pattern that fits its scale and collaborative structure. Three patterns are defined — council, single-governor, and joint-governor — and each island's specific realisation lives in its own [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]].

Every person who interacts with an island has a standing within it: a **Citizen** has full standing and is eligible for council membership; a **Visitor** may contribute informally but holds no formal standing. Council members must be Citizens. Citizenship may be held across multiple territories simultaneously. See [[Concept|Concept]] for the full model.

Changes to canonical knowledge move through the [[Pillars/Knowledge Islands/Governance/Processes/Enactment Process|Enactment Process]] - the mechanism through which proposals move from draft to ratified knowledge. Formal proposals may only be submitted by council members. The [[Pillars/Knowledge Islands/Governance/Processes/Contribution Process|Contribution Process]] defines who can contribute to the Knowledge Islands model itself, and what customs govern knowledge at the boundary between islands.

---

## Management

[[Pillars/Knowledge Islands/Governance/Governance|Governance]] covers the methodology, conventions, integrations, and maintenance activities

TODO: exand and include a summary of Governance here. the two subsections below should be put in the management section (most likely merged in)

### Physical Stores

Each island realises its knowledge through one or more physical stores:

| Store             | Purpose                                                         | Structure                     |
| ----------------- | --------------------------------------------------------------- | ----------------------------- |
| **Text store**    | Markdown notes — version-controlled, git-backed, human-readable | Canonical KB folder structure |
| **Binary store**  | Large binary files — images, PDFs, exports, attachments         | Mirrors text store exactly    |
| **Working space** | Temporary area used by tools and agents; ephemeral              | None required                 |

The text and binary stores must share an identical folder structure so that files are co-located by topic regardless of which store they live in. When creating or referencing a binary asset, save it to the binary store under the same relative subfolder as the corresponding note.

Git is the source of truth for canonical knowledge. The working space is ephemeral — nothing in it is canonical until committed to a store.

### Governance Infrastructure

The governance infrastructure belongs to the principal island and serves the entire archipelago. It is not a store — it is the operational layer through which knowledge is managed and evolved:

| Infrastructure     | Purpose                                                                                                               |     |
| ------------------ | --------------------------------------------------------------------------------------------------------------------- | --- |
| **Cowork project** | The parliament — where proposals are reviewed, sessions are run, and archipelago-wide decisions are made              |     |
| **Working folder** | The yard — temporary scratch space for in-progress work; discarded once the work is committed to a store or abandoned |     |

Specific paths for this island are defined in [[Physical Locations]].

---

## Knowledge Capitals

Every general concept defined in [[Knowledge Islands]] has a corresponding specific realisation in [[Knowledge Capital]]. The two sections are structural mirrors: Knowledge Islands holds the portable, island-agnostic definition; Knowledge Capital holds Arcadia's instance of that definition. When adding a new generic concept to Knowledge Islands, its island-specific counterpart belongs in Knowledge Capital — not in Knowledge Islands itself.

---

## Related Topics

- [[Pillars/Pillars|Pillars]] - parent index
- [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]] - the specific realisation of Knowledge Islands for this island

[zettelkasten]: https://zettelkasten.de/introduction/
[para]: https://fortelabs.com/blog/para/
[karpathy-llm-wiki]: https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
