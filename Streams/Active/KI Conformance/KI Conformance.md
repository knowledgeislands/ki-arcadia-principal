---
tags:
  - card/proposal
  - topic/knowledge-islands
status: draft - April 2026
purpose: Define the constitutional layer and adoption framework for Knowledge Islands — making islands self-describing, self-verifying, and explicit about what they have and have not adopted
priority: medium
dependencies: []
author: Written with Claude
---

# KI Conformance

## Overview

A stream to establish how Knowledge Islands govern their own validity. The core question was: how does an island declare what it has adopted, and how does it verify it remains a Knowledge Island at all?

The work introduced two interlocking concepts: the **constitutional layer** (the pre-adoptive baseline that defines what a Knowledge Island is — the Charter, which contains the island's Identity, and the Conformance Check itself) and the **adoption model** (every other activity group is either explicitly adopted or vetoed, with no unknowns permitted). The Charter is the authoritative declaration of identity and adoption state; the Conformance Check is the constitutional activity that verifies it.

---

## Governance

This stream follows the [[Pillars/Knowledge Islands/Governance/Processes/Enactment Process|Enactment Process]] — the standard model for how streams enact change in the knowledge base.

---

## Inputs

| Type       | Detail                                                                                         |
| ---------- | ---------------------------------------------------------------------------------------------- |
| Discussion | Entry points into Arcadia — what makes the Knowledge Capital directive rather than descriptive |
| Discussion | Explicit adoption contracts — framework notes declaring their KC requirements                  |

---

## Outputs

| Type      | Detail                                                                                             |
| --------- | -------------------------------------------------------------------------------------------------- |
| New note  | `Activities/Constitutional/Constitutional.md` — group index defining the constitutional concept    |
| New note  | `Activities/Constitutional/Conformance.md` — Layer 1 activity specification                        |
| New note  | `Tools/Claude/Activities/Constitutional/Constitutional.md` — Layer 5 group index                   |
| New note  | `Tools/Claude/Activities/Constitutional/Conformance.md` — executable Layer 5 prompt                |
| New note  | `Knowledge Capital/Charter.md` — authoritative adoption and activation record                      |
| New notes | `Knowledge Capital/Governance/Activities/Email/` stubs — veto record for Email activity group      |
| New note  | `Knowledge Capital/Governance/Activities/Linear/Linear.md` — veto record for Linear activity group |
| Edited    | `Concept.md` — constitutional references in Territories/Archipelagos and Governance                |
| Edited    | `Activities/Activities.md` — Constitutional group added; constitutional/adoptable distinction      |
| Edited    | `Activities/Email/Email.md` — Adoption Requirements section                                        |
| Edited    | `Knowledge Capital/Knowledge Capital.md` — Charter section; Activities reframed                    |
| Edited    | `Knowledge Capital/Governance/Activities/` notes — reframed as timing model, not activation record |

---

## Intended Destinations

- [x] Define the constitutional concept — Charter (containing Identity) and Conformance
- [x] Create `Activities/Constitutional/` group and Conformance activity
- [x] Create the Charter as Arcadia's directive adoption record
- [x] Add Adoption Requirements to the Email group index
- [x] Create KC veto stubs for Email and Linear
- [x] Write the Layer 5 Conformance prompt
- [ ] Add Adoption Requirements to Maintenance, Briefings, and Linear group indexes
- [ ] Update Authoring Activities — document constitutional concept and Adoption Requirements convention
- [ ] Update Canonical Meta Notes — add Charter to the cold-start reading list
- [ ] Update Scheduled Task Audit description — Conformance now runs first at 04:30
- [x] Review KC structure alignment with KI and the five-layer model
- [ ] Update CLAUDE.md to reflect current structure and constitutional model

---

## Design

### Constitutional vs. adoptable

Constitutional activities are prior to the adoption framework — they define what it means to be a Knowledge Island. Two elements are constitutional: the Charter and Conformance. Everything beyond these is adoptable: each territory takes an explicit `adopted` or `vetoed` position on each activity group. Absence of a position is non-conformant.

### The Charter

The Charter is the activation record — not a description of what the KC might contain, but an authoritative declaration of what the island is and what it has adopted. Its Identity section holds the fixed parameters; below that sits the adoption table, the activity roster, connected tools, and agent configuration. The Conformance Check uses it as its source of truth. It is the primary entry point for agents starting cold and for humans checking operational state.

### Adoption Requirements

Group index notes in `Activities/` now carry an Adoption Requirements section listing the KC notes an island must create to adopt that group. Vetoed groups need KC stubs acknowledging the veto. This makes the adoption contract explicit rather than implicit in wikilinks.

---

## Related Topics

- [[Streams/Active/Active|Active]] - parent stream index
- [[Pillars/Knowledge Islands/Governance/Activities/Constitutional/Constitutional|Constitutional]] - the group this stream defined
- [[Pillars/Knowledge Capital/Charter|Charter]] - the key output of this stream
- [[Streams/Active/KI Intentional/KI Intentional|KI Intentional]] - related conceptual stream
