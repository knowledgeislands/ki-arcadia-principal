---
type: stream-roadmap
id: KI-ARCADIA-MOD-001
area: MOD
title: Reading order
theme: knowledge-model
tags:
  - topic/knowledge-islands
status: draft
priority: medium
horizon: soon
blocks: []
blocked-by: []
baseline-ref: null
author: Written with Claude
---

# Reading Order Proposal

## Overview

The three-act structure of `Pillars/Knowledge Islands` is in place. The migration from the old flat-folder layout is complete; the reading order runs Introduction → Model → Realisation, with each act answering a question and each chapter building on the last. The foundation is solid. The work from here is content quality, contextual integrity, and structural completeness.

See [Site Structure](KI-ARCADIA-MOD-001-reading-order.html) - the storyboard at a glance.

---

## Governance

This stream follows the [[Enactment Process]].

---

## Outstanding Work

### Folder Notes

One act-level folder note has been created: `Introduction/Introduction.md`.

Five leftover flat notes have been repurposed as intro sections within their respective chapters:

- `Model/Conventions/What Conventions Cover.md`
- `Model/Processes/How Change Happens.md`
- `Model/Activities/What Keeps an Island Alive.md`
- `Model/Agents/Who Acts on the Island.md`
- `Model/Tools/How Tools Connect.md`

Still outstanding - every folder in the tree still needs a folder note:

- Act level: `Model/Model.md`, `Realisation/Realisation.md`
- Introduction sub-chapters: `Introduction/Soon/Soon.md`, `Introduction/Concept/Concept.md`
- Section folders within chapters (e.g. `Tending/Tending.md`, `Email/Email.md`, each agent folder, each tool folder)
- Realisation: `Realisation/Arcadia/Arcadia.md`

### Prompt note frontmatter conventions

Two existing patterns conflict for the `Tools/Claude/Activities/{group}/` Prompt notes. The Conformance Prompt note uses `card/prompt` with a `# X - Prompt` title and an explicit `Definition: [[...]] Configuration: [[...]]` cross-link. The newer notes coming out of [[Streams/Roadmap/KI-ARCADIA-GOV-002-authoring-layers|Authoring layers]] use `card/note` with a plain `# X` title and no cross-link, mirroring the Definition's frontmatter. Needs a deliberate decision on the canonical shape, then a sweep to bring all Prompt notes into line. It connects to [[Streams/Roadmap/KI-ARCADIA-GOV-002-authoring-layers|Authoring layers]] because a capitalisation pass may make the title convention ("- Prompt" suffix) part of the same question.

### Contextual review - reading order walk

A step-by-step pass down the reading order checking that every concept is introduced before it is used. The known tension points from the original review were in the Residency and Format areas; the migration may have introduced new gaps, particularly around concepts that appear in the Model chapters before the Introduction has fully grounded them.

## Adherence

This stream adheres to the [[Enactment Process]]. Content reaches `Pillars/` or `Resources/` only on user approval of a `ready` proposal.
