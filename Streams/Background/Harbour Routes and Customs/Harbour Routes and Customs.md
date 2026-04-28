---
tags:
  - card/proposal
  - topic/knowledge-islands
status: draft - April 2026
purpose: Specify the three unresolved elements of the KI geographic model — Harbour, Routes, and Customs — in both Concept.md and Structure.md
priority: low
dependencies: []
author: Written with Claude
---

# Harbour, Routes and Customs

## Overview

Three elements of the Knowledge Islands geographic metaphor are present in the model but not yet fully specified. **Harbour** is introduced as the port of entry in both Concept and Structure but its structural conventions are stubs. **Routes** and **Customs** are named in Concept and flagged in Structure but have no substantive content beyond their definitions. This stream tracks the work of completing them.

All three are part of the same geographic metaphor layer: they describe how knowledge and jurisdiction operate at the boundaries of an island and between islands in an archipelago.

---

## Governance

This stream follows the [[Pillars/Knowledge Islands/Governance/Processes/Enactment Process|Enactment Process]] — the standard model for how streams enact change in the knowledge base.

---

## Inputs

| Type     | Detail                                                                                                                                         |
| -------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| Document | [[Pillars/Knowledge Islands/Concept/Concept\|Concept]] — `[!todo] Customs and Routes` at the end of the Geography section                      |
| Document | [[Pillars/Knowledge Islands/Governance/Conventions/Structure/Structure\|Structure]] — `[!todo] Harbour` and `[!todo] Routes and Customs` stubs |

---

## Outputs

| Type     | Detail                                                                                                             |
| -------- | ------------------------------------------------------------------------------------------------------------------ |
| Artefact | Updated `Concept.md` — `[!todo] Customs and Routes` resolved into prose covering both concepts at conceptual level |
| Artefact | Updated `Structure.md` — `[!todo] Harbour` and `[!todo] Routes and Customs` resolved into structural specification |

---

## Intended Destinations

- [ ] `Pillars/Knowledge Islands/Concept/Concept.md` — replace `[!todo] Customs and Routes` with conceptual prose
- [ ] `Pillars/Knowledge Islands/Governance/Conventions/Structure/Structure.md` — replace `[!todo] Harbour` with structural conventions for the `+/` inbox pattern
- [ ] `Pillars/Knowledge Islands/Governance/Conventions/Structure/Structure.md` — replace `[!todo] Routes and Customs` with structural specification for inter-island links and boundary controls

---

## Open Questions

1. **Customs: is it a governance concept or a structural one?** Concept.md treats it as jurisdictional (controls what passes between territories). Structure.md would need to translate that into something concrete — what does Customs look like as a structural convention?

2. **Routes: inter-island or intra-island?** Concept.md frames Routes as pathways between islands. Structure.md frames them as pathways between zones and between islands. Are intra-island routes (e.g. the relationship between Streams and Pillars) meaningfully different from inter-island routes?

3. **Harbour: is the `+/` folder the full specification?** The Harbour is already implemented as `+/` — material lands there and is routed inward. Is the structural spec just a formalisation of the existing convention, or is there more to say (e.g. sub-zones within `+/`, retention rules, voice notes handling)?

4. **Relationship between the three?** Harbour is where material arrives; Routes are the pathways it travels; Customs controls what crosses jurisdictional lines. They may form a natural sequence at the boundary level.

---

## Design Notes

The existing introduction of Harbour in Concept.md (§ The Shore) already says: "Nothing flows directly from the Harbour into the Library; it is assessed first, relevant material routed to the right Stream or zone, the rest discarded." The structural specification in Structure.md needs to give that concreteness: the `+/` folder is the Harbour; `+/_Voice Notes/` is managed by the voicenotes-sync plugin and excluded from manual routing; items age out if not processed.

Customs at the boundary rule is already implicit in Concept.md: "if customs exist at the boundary, it is a separate territory. If knowledge flows freely with no controls, it is internal structure." The conceptual section may only need to expand this into a definition rather than invent something new.

---

## Related Topics

- [[Streams/Background/Background|Background]] - parent stream index
- [[Pillars/Knowledge Islands/Concept/Concept|Concept]] - primary target note
- [[Pillars/Knowledge Islands/Governance/Conventions/Structure/Structure|Structure]] - secondary target note
- [[Streams/Active/KI Intentional/KI Intentional|KI Intentional]] - related conceptual stream; Intention may inform the Customs framing
- [[Pillars/Knowledge Islands/Governance/Processes/Enactment Process|Enactment Process]] - governance model for this stream
