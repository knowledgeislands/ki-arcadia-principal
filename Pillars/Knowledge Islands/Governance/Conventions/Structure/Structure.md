---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: current - April 2026
purpose: The geographic structure of the island — Library, Harbour, Streams, and the pathways between them
author: Written with Claude
memory_file: project_{kb_prefix}_structure.md
---

# Structure

## Overview

An island has geography — both natural and constructed. The streams run through the landscape; the harbour opens onto the sea; the library is built at the heart of the capital. Each zone has a different character: some feel organic, shaped by flow and movement; others feel institutional, shaped by governance and permanence. Both are of the place.

Structure is where those geographic conventions are specified. Each zone has its own note covering its internal organisation, routing rules, and governing logic. What you find here is the map; what you find in each sub-note is the territory.

---

## Library

The Library is the canonical record: version-controlled, ratified, and the single source of truth for all stable knowledge. It contains three zones — Calendar (time-bound notes), Pillars (internal knowledge owned by the island), and Resources (external reference material). Nothing enters the Library except through the governance process.

The Library's internal structure — top-level folders, routing rules, the Pillars/Resources boundary, and index note conventions — is documented in [[Pillars/Knowledge Islands/Governance/Conventions/Structure/Library/Library|Library]].

---

## Harbour

> [!todo] Harbour The Harbour is the port of entry — where incoming material arrives before being assessed and routed inward. Nothing flows directly from the Harbour into the Library; all material is assessed first, relevant content routed to the right Stream or zone, the rest discarded. The Harbour's structural conventions are not yet fully specified.

---

## Streams

Streams carry knowledge in motion: active projects, evolving ideas, ongoing work. They are not part of the Library; their content is not canonical. The lifecycle is: emerge as a Stream → mature through work → stabilise into Pillars or Resources → the Stream is retired.

### Path Structure

Every stream follows the path:

```
Streams/$Focus/$Category/$ProposalName/$ProposalName.md
```

**Focus** is mandatory. It expresses the current level of attention the stream is receiving:

| Focus        | Meaning                             |
| ------------ | ----------------------------------- |
| `Active`     | Receiving focused attention         |
| `Background` | Being progressed in the background  |
| `Dormant`    | Paused with intention to return     |
| `Future`     | Planned or ideated; not yet started |
| `Settled`    | Concluded                           |

**Category** is optional. It groups related streams within a Focus for comprehensibility. Category can itself be a path. The guiding principle is easy navigation — too much depth is as unhelpful as too much breadth in a single level.

Three common approaches:

- **No category** — suitable for simple islands with few concurrent proposals; keeps the structure flat and unambiguous
- **Pillar path** — category mirrors the destination in Pillars (e.g. `Active/Knowledge Islands/Governance/`); scales well at volume and echoes where the knowledge is heading
- **Proposal status** — category expresses current status; useful for islands processing many proposals concurrently across a single domain

Category is a local decision. Active, Background, Dormant, and Future often share the same scheme. Settled frequently warrants a different approach — time-based categorisation (e.g. by year or quarter) works well when the volume of settled streams makes a flat listing unwieldy.

---

## Routes and Customs

> [!todo] Routes and Customs Routes are the explicit pathways and relationships between zones and between islands. Customs is the jurisdictional layer at each boundary, controlling what passes between territories. Both need fuller specification as the model develops.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Conventions/Conventions|Conventions]] - parent index
- [[Pillars/Knowledge Islands/Governance/Conventions/Structure/Library/Library|Library]] - internal Library structure, routing rules, and index note conventions
- [[Pillars/Knowledge Islands/Knowledge Islands|Knowledge Islands]] - island types, archipelago model, and the full geographic model
