---
type: stream-proposal
tags:
  - topic/knowledge-islands
status: draft
priority: low
dependencies: []
author: Written with Claude
---

# Island Conventions

## Overview

Structural note-taking conventions that could improve the semantic richness and retrievability of the island without requiring a tooling change. Both ideas below are patterns to research and trial before committing - they affect every note if adopted, so the bar is high.

---

## Governance

This stream follows the [[Knowledge Islands/Model/Processes/Enactment Process|Enactment Process]].

---

## Checklist

- [ ] **Typed wikilinks** - Current wikilinks are untyped: `[[Note Name]]`. Adding a `- relation_type [[Target]]` list before standard related-topics entries makes the graph semantically queryable. Most useful in `Streams/` where dependency and implementation relationships matter. Needs a convention note and a trial on a bounded section before island-wide adoption.
- [ ] **Observation-style fact tagging** - Structuring key facts within notes as categorised list items: `- [decision] Chose X over Y because Z` or `- [risk] Dependency on external API`. Enables targeted retrieval without reading full note prose. Needs an agreed tag vocabulary and a trial before adopting broadly.

## Governance

This stream adheres to the [[Enactment Process]]. Content reaches `Pillars/` or `Resources/` only on user approval of a `ready` proposal.
