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
- Created the stub [[Authoring]] note in Knowledge Capital for Arcadia-specific authoring decisions; updated the KC Conventions index; added a pointer at the top of [[Authoring Guidelines]].

The remaining work is structural: making the layering implicit rather than labelled.

---

## Term Distribution

Role-name mentions across the Pillars notes touched by the rename pass and across all activity Definition notes. Sorted by path. `x` marks a presence (prose mention or `## Prompt` section heading); `—` marks none.

| Note                                                              | Definition | Configuration | Pattern | Agent Behaviour | Prompt |
| ----------------------------------------------------------------- | :--------: | :-----------: | :-----: | :-------------: | :----: |
| `Model/Activities/Authoring Guidelines/Authoring Guidelines.md`   |     x      |       x       |    x    |        x        |   x    |
| `Model/Activities/Briefings/Morning Briefing.md`                  |     —      |       —       |    —    |        —        |   x    |
| `Model/Activities/Constitutional/Conformance.md`                  |     —      |       —       |    —    |        —        |   —    |
| `Model/Activities/Email/Email Test.md`                            |     —      |       —       |    —    |        —        |   x    |
| `Model/Activities/Email/Re-route Triaged.md`                      |     —      |       —       |    —    |        —        |   x    |
| `Model/Activities/Email/Recap.md`                                 |     —      |       —       |    —    |        —        |   x    |
| `Model/Activities/Email/Route Drift.md`                           |     —      |       —       |    —    |        —        |   x    |
| `Model/Activities/Email/Route Review.md`                          |     —      |       —       |    —    |        —        |   x    |
| `Model/Activities/Email/Route Triage.md`                          |     —      |       —       |    —    |        —        |   x    |
| `Model/Activities/Linear/Linear Sync.md`                          |     —      |       —       |    —    |        —        |   x    |
| `Model/Activities/Tending/Asset Audit.md`                         |     —      |       —       |    —    |        —        |   —    |
| `Model/Activities/Tending/Convergence Check.md`                   |     —      |       —       |    —    |        —        |   x    |
| `Model/Activities/Tending/Health Check.md`                        |     —      |       —       |    —    |        —        |   x    |
| `Model/Activities/Tending/Inbox Review.md`                        |     —      |       —       |    —    |        —        |   —    |
| `Model/Activities/Tending/Knowledge Rebuild.md`                   |     —      |       —       |    —    |        —        |   x    |
| `Model/Activities/Tending/Scheduled Task Audit.md`                |     —      |       —       |    —    |        —        |   x    |
| `Model/Activities/Tending/Status Review.md`                       |     —      |       —       |    —    |        —        |   —    |
| `Model/Activities/Tending/Structural Audit.md`                    |     —      |       —       |    —    |        —        |   —    |
| `Model/Activities/Tending/Tending.md`                             |     x      |       —       |    —    |        —        |   x    |
| `Model/Activities/Tending/Wikilink Review.md`                     |     —      |       —       |    —    |        —        |   —    |
| `Model/Activities/What Keeps an Island Alive.md`                  |     —      |       —       |    —    |        —        |   x    |
| `Model/Agents/Agentic AI/Agentic AI.md`                           |     —      |       —       |    x    |        —        |   —    |
| `Model/Conventions/Notes/Activity Note.md`                        |     —      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Activities.md`                     |     x      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Briefings/Briefings.md`            |     x      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Constitutional/Conformance.md`     |     x      |       x       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Constitutional/Constitutional.md`  |     x      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Email/Email.md`                    |     x      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Linear/Linear.md`                  |     x      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Tending/Tending.md`                |     x      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Claude.md`                                    |     x      |       —       |    —    |        —        |   x    |
| `Model/Tools/How Tools Connect.md`                                |     —      |       —       |    —    |        —        |   x    |

### Observations

1. **Definition + Prompt is the dominant pair.** Ten notes carry both. Eight are `Tools/Claude/Activities/*/*.md` index notes pointing Prompt-side at their Definition counterparts; the other two are [[Authoring Guidelines]] and the [[Knowledge Islands/Model/Activities/Tending/Tending|Activities/Tending]] index. The eight index notes are the highest-volume target for the per-group index pass.
2. **`Pattern` appears only in [[Agentic AI]]** outside the framework note. One reader-facing reference. Can be rephrased as "this is general operating guidance, portable across islands" with the role term retired.
3. **`Agent Behaviour` appears nowhere outside [[Authoring Guidelines]].** Zero reader-facing presence already - useful precedent that a framework term need not propagate outward.
4. **`Configuration` appears in only one non-framework Pillars note** ([[Conformance]]). The use points the reader at where island-specific config lives - a candidate for replacement with the wikilink alone.
5. **Twelve of eighteen activity Definition notes carry an inline `## Prompt` H2.** This is the structural form of the convention defined in [[Activity Note]]. Not a target for Option B - the section heading is descriptive, not layer scaffolding. The six without inline prompts are Constitutional/Conformance (whose prompt lives in the separate Prompt note) and the five conversational tending activities (Asset Audit, Inbox Review, Status Review, Structural Audit, Wikilink Review).
6. **Six activity Definition notes carry no role-name mentions at all** - the same six listed in observation 5. They describe themselves with ordinary nouns plus links, demonstrating that the implicit-layering shape is already viable.

### Caveats on the count

- Case-sensitive; only capitalised role-name uses are counted as "the layer", which is the right filter for the question the matrix answers.
- The Prompt column conflates two kinds of presence: prose mentions ("the Prompt library", "the prompt below") and `## Prompt` H2 section headings. The H2 use is structural, follows the [[Activity Note]] format convention, and is not a target for Option B. Observations 1-4 concern prose mentions; observation 5 isolates the structural use.
- Excluded as collisions: `Configuration` as the title of `Realisation/Knowledge Capitals/Configuration/` (a separate concept); `Pattern` as a column header in Email routing tables; `Definitions` as an H2 heading in `Email/Approach.md` (terminology definitions, not the Definition layer).

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
