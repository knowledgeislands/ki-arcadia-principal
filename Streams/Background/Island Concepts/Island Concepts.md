---
tags:
  - card/proposal
  - topic/knowledge-islands
status: draft - April 2026
purpose: Specify and resolve unresolved elements of the KI conceptual and geographic model - settlement types, Harbour, Routes, and Customs
priority: low
dependencies: []
author: Written with Claude
---

# Island Concepts

## Overview

Several elements of the Knowledge Islands conceptual and geographic model remain unresolved or only partially specified. This stream tracks the work of completing them.

The scope falls into two areas. **Settlement types** concern the vocabulary for how knowledge stores are classified and named - what makes something an island rather than something smaller, and how internal divisions of an island are described. **Boundary geography** covers three unresolved elements of the geographic metaphor - Harbour, Routes, and Customs - which are present in the model but not yet fully specified in Concept or Structure.

All of these belong to the same layer of the model: the geographic and jurisdictional frame through which knowledge is held, bounded, and exchanged.

---

## Governance

This stream follows the [[Knowledge Islands/Processes/Enactment Process|Enactment Process]].

---

## Inputs

| Type     | Detail                                                                                                                                         |
| -------- | ---------------------------------------------------------------------------------------------------------------------------------------------- |
| Document | [[Concept]] - `[!todo] Customs and Routes` at the end of the Geography section; settlement type table |
| Document | [[Structure]] - `[!todo] Harbour` and `[!todo] Routes and Customs` stubs |

---

## Outputs

| Type     | Detail                                                                                                                   |
| -------- | ------------------------------------------------------------------------------------------------------------------------ |
| Artefact | Updated `Concept.md` - settlement type table expanded with Towns; island defined by repository boundary; naming resolved |
| Artefact | Updated `Concept.md` - `[!todo] Customs and Routes` resolved into prose covering both concepts at conceptual level       |
| Artefact | Updated `Structure.md` - `[!todo] Harbour` and `[!todo] Routes and Customs` resolved into structural specification       |

---

## Intended Destinations

- [ ] `Pillars/Knowledge Islands/Concept/Concept.md` - resolve settlement type naming and add Town to the type table
- [ ] `Pillars/Knowledge Islands/Concept/Concept.md` - replace `[!todo] Customs and Routes` with conceptual prose
- [ ] `Pillars/Knowledge Islands/Conventions/Structure/Structure.md` - replace `[!todo] Harbour` with structural conventions for the `+/` inbox pattern
- [ ] `Pillars/Knowledge Islands/Conventions/Structure/Structure.md` - replace `[!todo] Routes and Customs` with structural specification for inter-island links and boundary controls

---

## Open Questions

1. **Satellite vs Subsidiary?** The current model uses "satellite island" for a governed extension of a territory. Does "satellite" carry the right connotation - something orbiting a principal - or does "subsidiary" better convey the governance relationship? Both imply dependency; the distinction is whether the framing is spatial or organisational.

2. **What characterises a Town?** The working definition is: an internal division of an island that has distinct identity but no separate repository. Is the repository boundary sufficient as the defining criterion, or does a Town also imply something about community - a group of citizens with a shared focus, as opposed to a folder structure? Can a solo practitioner have a town, or is the concept inherently collective?

3. **Customs: governance concept or structural one?** Concept.md treats it as jurisdictional (controls what passes between territories). Structure.md would need to translate that into something concrete - what does Customs look like as a structural convention?

4. **Routes: inter-island or intra-island?** Concept.md frames Routes as pathways between islands. Structure.md frames them as pathways between zones and between islands. Are intra-island routes (e.g. the relationship between Streams and Pillars) meaningfully different from inter-island routes?

5. **Harbour: is the `+/` folder the full specification?** The Harbour is already implemented as `+/` - material lands there and is routed inward. Is the structural spec just a formalisation of the existing convention, or is there more to say (e.g. sub-zones within `+/`, retention rules, voice notes handling)?

---

## Design Notes

The existing introduction of Harbour in Concept.md (§ The Shore) already says: "Nothing flows directly from the Harbour into the Library; it is assessed first, relevant material routed to the right Stream or zone, the rest discarded." The structural specification in Structure.md needs to give that concreteness: the `+/` folder is the Harbour; `+/_Voice Notes/` is managed by the voicenotes-sync plugin and excluded from manual routing; items age out if not processed.

Customs at the boundary rule is already implicit in Concept.md: "if customs exist at the boundary, it is a separate territory. If knowledge flows freely with no controls, it is internal structure." The conceptual section may only need to expand this into a definition rather than invent something new.

The working hypothesis on settlement types: the repository is the defining boundary. An island is an island because it has its own repository. Below that threshold - a named division within a single repository - is a Town. This would be added to the settlement type table in Concept.md alongside Principal and Satellite.

---

## Related Topics

- [[Streams/Background/Background|Background]] - parent stream index
- [[Pillars/Knowledge Islands/Concept/Concept|Concept]] - primary target note
- [[Pillars/Knowledge Islands/Conventions/Structure/Structure|Structure]] - secondary target note
- [[Streams/Active/Intentional/Intentional|Intentional]] - related conceptual stream
- [[Pillars/Knowledge Islands/Processes/Enactment Process|Enactment Process]] - governance model
