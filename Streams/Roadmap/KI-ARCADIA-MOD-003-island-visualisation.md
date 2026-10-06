---
note_type: stream-roadmap
id: KI-ARCADIA-MOD-003
area: MOD
title: Geography model and tiles
theme: knowledge-model
tags:
  - topic/knowledge-islands
horizon: future
status: draft
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-04-28T19:26:42Z
updated_at: 2026-10-06T01:45:00Z
author: Written with Claude
---

# Geography Model and Tiles

## Goal

Arcadia publishes an agreed island geography model and approves an isometric tile set fit for interactive web use, so that the Knowledge Islands website can render an island as a place from a canonical source rather than inventing its own mapping or artwork.

## Context

The record began in April 2026 as an Island Visualisation proposal: render a Knowledge Island as an isometric tile map in which the island's structure becomes literal geography, complementing Obsidian's graph view, which shows connections rather than place.

Two records have since carried the idea. This one, in Arcadia, is adopted Future work. `KI-WEB-SITE-001` (Interactive island diagram) in `knowledgeislands/ki-website` is the execution item for the rendered, interactive diagram and is in `waiting-for` until isometric graphics exist. The 2026-10-06 roadmap consolidation found the two overlapping; both are adopted, so neither can be merged. The owner decided to keep both and split them by ownership: the website owns the rendered artefact, and Arcadia owns the aesthetics and the knowledge model behind it. This record is therefore reshaped to the Arcadia side.

Arcadia already holds draft concept material in `Pillars/Aesthetics/Isometric Tiles/` (June 2026): a basic tile sheet and a structures and terrain sheet covering terrain, structures, connectors and props on a consistent isometric grid, with four colour palettes. These are concept sheets, not an approved, sliced asset set with a stated format and licence, and no canonical note yet says how an island's zones, notes, links and activity map onto that geography.

`KI-HARNESS-GOV-131` (Govern living diagrams) in `knowledgeislands/ki-agentic-harness` is related diagram-governance work. It is a non-blocking cross-link, not a dependency in either direction.

## Boundary

- Arcadia-owned content and knowledge model only: the geography model and the approval of a web-suitable tile set.
- No website implementation, interaction design, accessibility model or hosting choice; those belong to `KI-WEB-SITE-001`.
- No write to `ki-website` or any other repository.
- Canonical changes to `Pillars/` reach it only through this record once it is `ready`, under the [[Admin/Operations/Processes/Enactment Process|Enactment Process]].
- No diagram-governance rules; those belong to `KI-HARNESS-GOV-131` in the harness.

## Cross-repository relationship

This record blocks `KI-WEB-SITE-001` in `knowledgeislands/ki-website`. The relationship is genuine build order: the website cannot build an interactive geography diagram until the geography model and an approved asset set exist. It is recorded in prose on both records because `blocks` and `blocked_by` hold local identifiers only. `KI-WEB-SITE-001` names this record as its waiting-for condition; when this record's outputs land in `Pillars/`, that condition is discharged regardless of this record's later review or acceptance.

## Discussion

### Owner decision (2026-10-06)

Keep both items. Reshape this record to the Arcadia-owned side - content and knowledge model - and treat `KI-WEB-SITE-001` as the execution item, with a reciprocal prose link. The retired `candidate` field and the legacy `priority` field were dropped, and the legacy Overview, Outputs, Checklist and Ideas sections were restated in the current record format.

### Intended outputs

- A geography model note stating how an island's zones and artefacts map to places: which zone is which district, what a note, a link and activity density look like, and how Streams appear as waterways.
- An approved tile set derived from the existing concept sheets, with a stated format suitable for interactive web use, its licence, and the palette the website should use.

### Geography ideas carried from the proposal

- Streams are the island's lifeblood - flowing water irrigating the landscape and sustaining the agents in the cities and beyond. In a rendering they should feel alive: moving, branching, feeding into the land.
- Isometric bricks and tiles are the rendering primitive, so the island looks built rather than drawn.
- Structure maps to geography: Pillars as the library district, Streams as waterways, the Harbour as the port, Resources as external reference shelves, and Calendar as the archive tower.
- Notes could appear as buildings or structures, and links as paths between them.
- Density and activity could influence the visual weight of an area, so well-linked, frequently visited zones feel more established.
- The idea follows naturally from the boundary rules: walls are literal walls and gates are literal gates.
- The map complements Obsidian's graph view rather than replacing it: the graph shows connections, the map shows place.

### Open questions

- Where the geography model note belongs: beside the tiles in `Pillars/Aesthetics/`, or with the island model in `Pillars/Philosophy/Model/`.
- Which asset format the website needs (vector, sprite sheet or individual images) and who produces the sliced set from the concept sheets.
- Whether the Capital, Library, Streams and Harbour geography named in `KI-WEB-SITE-001` is the full set of places, or whether Resources and Calendar need their own.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
