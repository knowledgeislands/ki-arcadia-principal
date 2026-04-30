---
tags:
  - card/stream
  - topic/knowledge-islands
status: rolled-out - April 2026
priority: medium
dependencies: []
author: Written with Claude
---

# Reading Order

## Overview

Developing a canonical reading order for the Knowledge Islands content — a sequence that ensures each idea is grounded before the next one builds on it, and that exposes contextualisation gaps in leaf notes as it goes. The work sits at the intersection of content quality and navigation: a first-time reader should be able to follow the sequence without encountering terms or concepts that have not yet been introduced.

---

## Levels

- 1: Premise
- 2: Parts
- 3: Chapters
- 4: Sections

Sections are the lowest level of the reading order; they are the most granular points of reference for navigation. Chapters are collections of sections that form a coherent unit around a particular topic. Parts are collections of chapters that group related topics together. The Premise is the overarching foundation that sets the stage for everything that follows.

Sections may have sub-sections, but these are not included in the reading order. The reading order focuses on the main sections that carry the core content and ideas. Sub-sections are supplementary material that can be explored as needed, but they are not essential for following the main narrative.

## Site Structure

See [[Site Structure]] — the storyboard at a glance (HTML, sibling file).

---

## Decisions

- **Site Structure** is a separate note that serves as a visual map of the reading order. It is an HTML file that can include formatting and styling to enhance readability and navigation. The Site Structure provides a more interactive and visual representation of how the content is organized.  It would be good to include this as an image in the Reading Order note itself, but that is a future enhancement.

## Open Questions

- **Five-layer model terminology** — "Layer 1", "Layer 5", "five-layer model" reads as internal scaffolding that has leaked into the content. The layers are referenced across Activities, Agents, and Authoring Activities. Needs a dedicated pass: either rename the layers to something reader-facing, or restructure so the layering is implicit rather than labelled.
- **Activity Note naming** — "Activity Spec" was considered as a more precise alternative. Deferred pending resolution of the five-layer terminology, which may reframe what Layer 1 notes actually are.

---

## Checklist

- [ ] Review
- [ ] Capture a list of known gaps or placeholder
