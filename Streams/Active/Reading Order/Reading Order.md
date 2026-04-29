---
tags:
  - card/stream
  - topic/knowledge-islands
status: draft - April 2026
priority: medium
dependencies: []
author: Written with Claude
---

# Reading Order

## Overview

Developing a canonical reading order for the Knowledge Islands content — a sequence that ensures each idea is grounded before the next one builds on it, and that exposes contextualisation gaps in leaf notes as it goes. The work sits at the intersection of content quality and navigation: a first-time reader should be able to follow the sequence without encountering terms or concepts that have not yet been introduced.

The reading order lives at [[Reading Order]] and is built up incrementally alongside this stream.

---

## Level 1: Premise

Knowledge Islands treats the problem of knowledge not as filing, but as civilisation: who owns it, how it changes, and how it endures.

---

## Level 2: Acts

- **Concept** — the introduction: what knowledge is, why it needs a home, and the model at a glance
- **System** — the portable, generic model: Conventions, Processes, Activities, Agents, and Tools — the rules and patterns any island can adopt
- **Application** — the specific realisation: Knowledge Capital and Arcadia — where the System becomes real; the charter, council, integrations, and routing configuration that make this island what it is

---

## Level 3: Chapters

The story begins with a question — what is knowledge and why does it need a home? — and builds through the mechanics of how that home works, who governs it, and how it stays alive. By the end the reader understands not just what Knowledge Islands *is* but why someone would build one and how to participate in one.

Each act answers a question:

- **Concept** — *Why does this exist?* Establishes the problem (knowledge without structure decays), the model (an island, a cycle, a geography), and who holds the canonical definition (Arcadia). The foundation everything else builds on.
- **Conventions** — *What is the language?* The reader learns to read and write in the island's dialect before encountering the processes that depend on it. Notes, structure, residency — the shared vocabulary of form.
- **Processes** — *How does change happen?* The governance gates. Nothing reaches the Library without passing through here. Establishes that the island is not just a filing system but a governed body of knowledge.
- **Activities** — *How does the island stay alive?* The maintenance work — scheduled and conversational — that prevents drift and keeps the island aligned with the world it reflects.
- **Agents** — *Who acts?* The actors in the system: human and AI, their roles, operating conventions, and what each can and cannot do.
- **Tools** — *With what?* The instruments through which agents act and connect to the world outside the island.
- **Knowledge Capital** — *How does this become real?* The System instantiated: Arcadia's charter, council, integrations, and routing configuration. The model lands here; everything above is portable, this is specific.


---

## Level 4: Sections

Working at heading level within each section of the arc — checking that headings tell a coherent story and nothing arrives without setup. Status: draft, incomplete.

### Concept

*Why does this exist?*

Structured as a reveal: establish the problem and its history, show what others have tried, then land the model as the answer. The reader is primed before the model arrives.

- **History of Knowledge Systems** *(new scene)* — the long arc from oral tradition to the library, the card catalogue, Zettelkasten, PARA, LLM-native wikis. Establishes lineage: Knowledge Islands is the next step in an ancient project, not a novelty
- **What is Knowledge** — defines the raw material; separates information, knowledge, wisdom. The distinction everything else depends on
- **Layers of Knowledge** — individual → collective → civilisational. The scope: this is not personal PKM
- **Other Approaches** — Zettelkasten, PARA, LLM wikis. What they get right and what they leave open. Sets up the reveal
- **The Cycle of Knowledge** — capture, connect, reflect. The engine begins to take shape
- **The Home of Knowledge** *(the reveal)* — the island, Capital, Library, Streams, Harbour. The model lands here
- **Territories and Archipelagos** — scales the model: how islands relate, governance patterns, principal vs satellite
- **Agents** — who acts within the system; human vs AI; the force of change
- **Jurisdiction** — authority, standing, council patterns. Who decides what
- **Governance** — the five areas that make the island function day to day; closes the loop back to the operational model

*Arc: history → raw material → scope → existing attempts → mechanism → reveal → scale → actors → authority → operation.*


---

## Site Structure

See [[Site Structure]] — the storyboard at a glance (HTML, sibling file).

---

### Conventions

#### Notes

*What is the language?*

- **Format** — the physical structure every note follows
- **Frontmatter** — the metadata that classifies and surfaces notes
- **Types** — specialised structures that extend the base

#### Frontmatter

- **Properties** — standard YAML fields
- **Tags** — hierarchical taxonomy

#### Format

- **Full Note Structure** — the canonical template
- **H1 and Filenames** — naming conventions
- **Footer Sections** — Contents and Related Topics rules *(under review)*
- **Tables** — formatting rules
- **Markdown Conventions** — sub-headings, lists, trailing newlines
- **Wikilinks and Images** — link formats, image conventions; *references Obsidian without introduction — gap*

#### Types

- **Collection Card** — reference entries and index notes
- **Meeting Note** — structured meeting records
- **Session Digest** — AI work session summaries; temporary lifecycle
- **Activity Note** — Layer 1 activity note structure

#### Residency

*Where does knowledge live?*

- **Three Tiers** — Library, canonical memory, auxiliary memory
- **What Belongs Where** — decision table
- **Lifecycle** — how knowledge moves between tiers and gets promoted
- **Promotion Criteria** — when to move auxiliary → KI
- **Cross-Referencing Conventions** — `memory_file` frontmatter and `## KI Sources`; *technically dense; references Knowledge Rebuild (Activities) before that section is reached — gap*

#### Structure

*The island's geography*

- **Physical Stores** — text store, binary store, working space; git as source of truth
- **Governance Infrastructure** — Cowork project and working folder
- **Library** — the canonical record; points to Library note
- **Harbour** — *todo: not yet specified*
- **Streams** — path structure, focus levels, index tables
- **Routes and Customs** — *todo: not yet specified*

#### Library

*The canonical record in detail*

- **Physical Locations** — where stores live on disk; defers to Knowledge Capital
- **Top-Level Folders** — Calendar, Pillars, Resources, Streams, +
- **Routing Rules** — how to file a note
- **Pillars/Resources Boundary** — the enforced separation
- **Streams/Pillars Convention** — what stays in a Stream vs what moves to Pillars
- **Index Notes** — the leaf/index principle, chapter metaphor, format rules

---

### Processes

*How does change happen?*

#### Enactment Process

- **Model** — Stream ↔ Council → Pillars/Resources; the iterative cycle
- **Status Lifecycle** — draft → ready → in-progress → rolled-out → reviewed → completed
- **The Cycle** — step-by-step walkthrough
- **Proposal Documents** — structure, inputs, outputs, checklist, open questions
- **Proposals Index** — live tracking
- **Priority** — urgent → high → medium → low
- **Rollout** — what completion means; preview pattern
- **Post-Change Review** — how to run it
- **Rejection** — first-class outcome, not failure
- **Working Rules** — behavioural constraints enforced by Claude

*Arc: model → lifecycle → process → artefacts → operational rules. Dense but coherent.*

#### Contribution Process

- **Who Can Contribute** — council members only; Visitor pathway
- **Customs at the Boundary** — inbound (any archipelago may adopt) vs outbound (formal proposal required)
- **Customs Rules in Practice** — decision table

*Short and clean.*

---

### Activities, Agents, Tools

*To be mapped in next session.*

---

## Governance

This stream follows the [[Knowledge Islands/Processes/Enactment Process|Enactment Process]].

---

## Decisions

- Reading Order note created as a living document at `Pillars/Knowledge Islands/Reading Order.md` — bullet list, no section headings, closing paragraph pointing to the full index
- **Leaf/index principle** established and added to [[Library]]: leaf notes carry all the material; index notes are recaps that orient and point. Corollary: content that only appears in an index belongs in a leaf
- **Concept.md** enriched with Zettelkasten/PARA/LLM-native wiki framing and Arcadia context in the opening overview
- **Knowledge Islands.md** first-timer signpost added to the Reading Order section; KI/KC authoring rule removed and moved to Concept.md
- **Activities.md** maintenance cycle framing added to the overview
- **Concept.md** KI/KC structural mirrors authoring rule added to close of Governance section
- Reading order format: bullet list with one-liners at top level; indented sub-lists for subareas; no separate heading for the list
- **Concept chapter restructured as a reveal** — Other Approaches moved from last to fourth position (after Layers of Knowledge); History of Knowledge Systems added as a new opening scene. The Home of Knowledge becomes the reveal that the setup leads to
- **Plot grid added** to stream as a Markdown table — Level 1 → Level 1.5 → Level 2 → Level 3; the canonical reference for the storyboard at a glance

## Open Questions

- ~~**Residency placement** — Residency is currently in the reading order after Notes subareas but before Structure. It references Knowledge Rebuild (an Activity, not yet covered at that point) and contains dense operational detail about `memory_file` and `{ki_prefix}` syntax. Decision needed: keep in sequence, move later, or treat as reference material outside the reading order?~~ Resolved: Knowledge Rebuild links removed from body and Related Topics; `{ki_prefix}` syntax remains (dense but accurate). Residency stays in sequence.
- **Related Topics sections** — the section is felt to be mechanical, noisy, and not earning its place across notes generally. Body wikilinks and Obsidian navigation should carry the connection work instead. Significant convention change — needs a decision on whether to remove entirely or keep in exceptional cases only.
- ~~**Format note / Obsidian reference** — Format.md references "Obsidian's pipe syntax" and "the Obsidian algorithm" without introducing what Obsidian is.~~ Resolved: brief contextualising sentence added to Wikilinks and Images section.

---

## Checklist

- [x] Create Reading Order note
- [x] Add leaf/index principle to Library.md
- [x] Enrich Concept.md opening
- [x] Fix index-only content in Knowledge Islands.md
- [x] Resolve Residency placement
- [x] Resolve index notes in reading order — Option B: list leaves only, index notes are chapter openers not reading stops
- [x] Fix Format.md Obsidian reference
- [x] Contextualisation check: Activities and subareas
- [x] Contextualisation check: Agents and subareas
- [x] Contextualisation check: Tools

---

## Related Topics

- [[Streams/Active/Active|Active]] - parent stream index
- [[Pillars/Knowledge Islands/Reading Order|Reading Order]] - the note being developed
- [[Pillars/Knowledge Islands/Knowledge Islands|Knowledge Islands]] - the content being sequenced
- [[Pillars/Knowledge Islands/Conventions/Structure/Library/Library|Library]] - where the leaf/index principle lives
