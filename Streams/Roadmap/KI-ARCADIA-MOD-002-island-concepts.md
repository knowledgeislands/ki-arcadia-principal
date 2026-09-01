---
note_type: stream-roadmap
id: KI-ARCADIA-MOD-002
area: MOD
title: Island concepts
theme: knowledge-model
tags:
  - card/proposal
  - topic/knowledge-islands
status: draft
priority: low
horizon: future
candidate: true
blocks: []
blocked_by: []
baseline_ref: null
purpose: Specify and resolve unresolved elements of the island conceptual and geographic model - settlement types, Harbour, Known Lands, Routes, and Customs
author: Mixed
---

# Island Concepts Proposal

## Overview

Several elements of the Knowledge Islands conceptual and geographic model remain unresolved or only partially specified. This stream tracks the work of completing them.

The scope falls into two areas. **Settlement types** concern the vocabulary for how knowledge stores are classified and named - what makes something an island rather than something smaller, and how internal divisions of an island are described. **Boundary geography** covers three unresolved elements of the geographic metaphor - Harbour, Routes, and Customs - which are present in the model but not yet fully specified in Concept or Structure.

All of these belong to the same layer of the model: the geographic and jurisdictional frame through which knowledge is held, bounded, and exchanged. Knowledge signposting gives Routes a practical purpose: an island can identify where a question, capture, or piece of work belongs before the destination applies its own internal routing rules.

---

## Governance

This stream follows the [[Philosophy/Model/Processes/Enactment Process|Enactment Process]].

---

## Inputs

| Type     | Detail                                                                                                |
| -------- | ----------------------------------------------------------------------------------------------------- |
| Document | [[Concept]] - `[!todo] Customs and Routes` at the end of the Geography section; settlement type table |
| Document | [[Structure]] - `[!todo] Harbour` and `[!todo] Routes and Customs` stubs                              |
| Document | [[Known Lands]] - Arcadia's objective estate map and the current pointer to personal navigators' charts |

---

## Outputs

| Type | Detail |
| --- | --- |
| Artefact | Updated `Concept.md` - settlement type table expanded with Towns; island defined by repository boundary; naming resolved |
| Artefact | Updated `Concept.md` - `[!todo] Customs and Routes` resolved into prose covering both concepts at conceptual level |
| Artefact | Updated `Structure.md` - `[!todo] Harbour` and `[!todo] Routes and Customs` resolved into structural specification |
| Artefact | Knowledge Signposting model and graduated Known Lands expectations |

---

## Intended Destinations

- [ ] `Pillars/Philosophy/Concept/Concept.md` - resolve settlement type naming and add Town to the type table
- [ ] `Pillars/Philosophy/Concept/Concept.md` - replace `[!todo] Customs and Routes` with conceptual prose
- [ ] `Pillars/Philosophy/Model/Conventions/Structure/Structure.md` - replace `[!todo] Harbour` with structural conventions for the `+/` inbox pattern
- [ ] `Pillars/Philosophy/Model/Conventions/Structure/Structure.md` - replace `[!todo] Routes and Customs` with structural specification for inter-island links and boundary controls
- [ ] `Pillars/Philosophy/Introduction/Concept/Territories Archipelagos/Territories Archipelagos.md` - establish island-relative Known Lands and persona-home signposting without conflating them with principal governance
- [ ] `Pillars/Philosophy/Model/Conventions/Structure/Structure.md` - specify cross-island signposting before the destination island's internal zone routing
- [ ] `Admin/Governance/Known Lands.md` - conform Arcadia's instance to the settled signposting model

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

### Knowledge Signposting

Knowledge signposting is an island-level capability rather than a principal-only responsibility. Known Lands is not merely an estate inventory: it is an island-relative navigational chart identifying other islands, their scope, their relationship to this island, and the topics or intents that should be routed to them.

The working routing model is:

1. When the destination is known, a person or agent may work directly in that island.
2. When the destination is unknown, the interaction begins in the persona's home island.
3. The home island uses its Known Lands and routing rules to signpost the question, capture, or work.
4. Customs governs what may cross the boundary and any required handoff.
5. The destination island retains canonical authority and applies its own internal routing between Calendar, Streams, Pillars, Resources, and Admin.

The home island need not be a principal island. Principal describes governance position within a territory; persona describes the identity or role through which someone interacts; signposting describes navigation between islands. These are independent characteristics.

Known Lands expectations should be graduated:

- Every island may maintain Known Lands.
- An island with cross-island relationships should maintain it.
- A persona's home island is expected to maintain it because signposting is part of its purpose.
- A principal island must maintain it because it coordinates a territory.
- A specialist island may keep a narrower chart containing only relevant neighbours.

Potential signpost data includes canonical island identity, relationship, owned scope, topics or intents routed there, what remains local, and the handoff mechanism. Query signposting, capture signposting, and work signposting may select different destinations for the same topic.

This model must not turn Known Lands into an assertion of membership or authority. Agora declarations remain the reciprocal contract for formal repository membership. Known Lands may describe any relevant destination, while trades or another handoff mechanism carry concrete work between independently governed repositories.

Open design questions for this part of the work are:

1. Whether Known Lands becomes a default `ki-repo-kb` governance surface, remains optional for ordinary islands, or is structurally required only when cross-island relationships exist.
2. Whether "persona island" and "home island" are separate terms, with a persona nominating one home, or one combined concept.
3. Which minimum fields make a Known Lands entry actionable without turning it into a second repository registry.
4. Whether reusable signposting belongs in `ki-repo-kb`, a separate capability, or a runtime resolver; it must not be limited to `ki-repo-kb-principal`.

## Adherence

This stream adheres to the [[Enactment Process]]. Content reaches `Pillars/` or `Resources/` only on user approval of a `ready` proposal.
