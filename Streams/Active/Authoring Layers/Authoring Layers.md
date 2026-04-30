---
tags:
  - card/stream
  - topic/knowledge-islands
status: draft - April 2026
priority: medium
dependencies: []
author: Written with Claude
---

# Authoring Layers

## Overview

Make the five-layer authoring framing implicit in reader-facing notes. The layers - Definition, Configuration, Pattern, Agent Behaviour, Prompt - are defined in [[Authoring Guidelines]] and remain useful as a design tool for authors; the goal is to stop them reading as scaffolding everywhere else. The earlier renaming pass is closed; this stream is the structural rewrite that follows it.

Arcadia-specific authoring decisions, when they emerge, live in [[Authoring]] under Knowledge Capital.

---

## Governance

This stream follows the [[Enactment Process]].

---

## Background

This stream is the second half of a two-phase pass. The first phase (now closed) did the mechanical work:

- Layers are now named: Definition, Configuration, Pattern, Agent Behaviour, Prompt.
- Audited 22 reader-facing references across 14 Pillars notes, 4 Streams notes, and 1 HTML view.

- Added the 2x2x2 lattice subsection to [[Authoring Guidelines]] - five corners populated, three empty, with prose explaining why.
- Created the stub [[Authoring]] note in Knowledge Capital for Arcadia-specific authoring decisions; updated the KC Conventions index; added a pointer at the top of [[Authoring Guidelines]].

The remaining work is structural: making the layering implicit rather than labelled.

---

## Phase Summary

| Phase | Status | Description |
| --- | --- | --- |
| Authoring Guidelines restructure | 🔲 Not started | Restructure [[Authoring Guidelines]] so the layered framing is descriptive rather than enumerated; keep the lattice as the analytical heart |
| Per-group index pass | 🔲 Not started | Drop "in the Definition layer" / "in the Prompt layer" phrasing from each `Tools/Claude/Activities/*/*.md`; let the wikilink alone do the navigational work |
| Capitalisation pass | 🔲 Not started | Downgrade capitalised role names where they read as proper nouns ("the Prompt library" → "the prompt library") |
| Cross-check pass | 🔲 Not started | Read every touched note end-to-end to catch awkward phrasing introduced by mechanical replacement |

---

## Design Decisions

| Decision | Rationale |
| --- | --- |
| Keep the lattice visible in [[Authoring Guidelines]] | The asymmetry of the cube (5 corners filled, 3 empty) is the analytical heart of the model and earns its place even after the layering becomes implicit |
| Make layering implicit elsewhere | The numbering and "five-layer model" framing read as scaffolding to readers who do not need to know the model exists; the role names carry enough meaning on their own |

---

## Open Issues

| Issue | Notes |
| --- | --- |
| Whether to retain "in the Definition layer" pointers in per-group index notes | The pointers were a navigational signpost; removing them risks readers who land cold losing context. Mitigation is wikilink quality and the lattice in Authoring Guidelines |
| Whether to keep capitalised role names or downgrade to ordinary nouns | "the Prompt library" reads as a proper noun; "the prompt library" reads as descriptive. The descriptive form is closer to implicit layering |
