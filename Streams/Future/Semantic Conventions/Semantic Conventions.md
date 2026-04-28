---
tags:
  - card/stream
  - topic/knowledge-islands
status: draft - April 2026
priority: low
dependencies: []
author: Written with Claude
---

# Island Conventions

## Overview

Structural note-taking conventions that could improve the semantic richness and retrievability of the island without requiring a tooling change. Both ideas below are patterns to research and trial before committing — they affect every note if adopted, so the bar is high.

---

## Governance

This stream follows the [[Pillars/Knowledge Islands/Governance/Processes/Enactment Process|Enactment Process]].

---

## Checklist

- [ ] **Typed wikilinks** — Current wikilinks are untyped: `[[Note Name]]`. Adding a `- relation_type [[Target]]` list before standard related-topics entries makes the graph semantically queryable. Most useful in `Streams/` where dependency and implementation relationships matter. Needs a convention note and a trial on a bounded section before island-wide adoption.
- [ ] **Observation-style fact tagging** — Structuring key facts within notes as categorised list items: `- [decision] Chose X over Y because Z` or `- [risk] Dependency on external API`. Enables targeted retrieval without reading full note prose. Needs an agreed tag vocabulary and a trial before adopting broadly.

---

## Related Topics

- [[Streams/Future/Future|Future]] - parent stream index
- [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Notes|Notes]] - the note convention standard these would extend
- [[Streams/Active/Boundary Rules/Boundary Rules|Boundary Rules]] - related active stream defining boundary rules; prospective conventions may surface here first
