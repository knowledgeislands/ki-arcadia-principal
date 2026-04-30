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

Role-name mentions across the touched Pillars notes after the rename pass. Only notes with at least one mention are listed; the two that ended up clean are named in observation 5 below.

| Note                                                             | Definition | Configuration | Pattern | Agent Behaviour | Prompt |
| ---------------------------------------------------------------- | :--------: | :-----------: | :-----: | :-------------: | :----: |
| `Model/Activities/Authoring Guidelines/Authoring Guidelines.md`  |     x      |       x       |    x    |        x        |   x    |
| `Model/Activities/What Keeps an Island Alive.md`                 |     —      |       —       |    —    |        —        |   x    |
| `Model/Conventions/Notes/Activity Note.md`                       |     —      |       —       |    —    |        —        |   x    |
| `Model/Agents/Agentic AI/Agentic AI.md`                          |     —      |       —       |    x    |        —        |   —    |
| `Model/Activities/Tending/Tending.md`                            |     x      |       —       |    —    |        —        |   x    |
| `Model/Tools/How Tools Connect.md`                               |     —      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Claude.md`                                   |     x      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Activities.md`                    |     x      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Email/Email.md`                   |     x      |       —       |    —    |        —        |   —    |
| `Model/Tools/Claude/Activities/Briefings/Briefings.md`           |     x      |       —       |    —    |        —        |   —    |
| `Model/Tools/Claude/Activities/Linear/Linear.md`                 |     x      |       —       |    —    |        —        |   —    |
| `Model/Tools/Claude/Activities/Tending/Tending.md`               |     x      |       —       |    —    |        —        |   —    |
| `Model/Tools/Claude/Activities/Constitutional/Constitutional.md` |     x      |       —       |    —    |        —        |   —    |
| `Model/Tools/Claude/Activities/Constitutional/Conformance.md`    |     x      |       x       |    —    |        —        |   —    |

### Observations

1. **Definition + Prompt is the dominant pair.** Eight Pillars notes carry both: the six `Tools/Claude/Activities/*/*.md` per-group index notes plus [[Knowledge Islands/Model/Tools/Claude/Claude|Claude]] and [[Knowledge Islands/Model/Tools/Claude/Activities/Activities|Activities]]. All use this combination to point Prompt-side notes at their Definition counterparts. This is the highest-volume target for the per-group index pass.
2. **`Pattern` appears only in [[Agentic AI]]** outside the framework note. One reader-facing reference. Can be rephrased as "this is general operating guidance, portable across islands" with the role term retired.
3. **`Agent Behaviour` appears nowhere outside [[Authoring Guidelines]].** Zero reader-facing presence already - useful precedent that a framework term need not propagate outward.
4. **`Configuration` appears in only one non-framework Pillars note** ([[Conformance]]). The use points the reader at where island-specific config lives - a candidate for replacement with the wikilink alone.
5. **Two touched Pillars notes carry no role-name mentions** post-rename ([[Knowledge Islands]], [[Convergence Check]]). They describe content with ordinary nouns plus a wikilink, demonstrating that the implicit-layering shape is already viable.

### Structural Prompt uses

Activity Definition notes carry an inline `## Prompt` H2 section per the [[Activity Note]] format convention. This is structural, not prose - it is the section heading that holds the executable prompt when the prompt lives inline rather than in a separate Prompt note. Out of scope for Option B (the convention itself is not what reads as scaffolding), but it is a use of the term and belongs in the audit:

- `Model/Activities/Email/Route Triage.md`
- `Model/Activities/Email/Route Drift.md`
- `Model/Activities/Email/Route Review.md`
- `Model/Activities/Email/Re-route Triaged.md`
- `Model/Activities/Email/Recap.md`
- `Model/Activities/Email/Email Test.md`
- `Model/Activities/Briefings/Morning Briefing.md`
- `Model/Activities/Linear/Linear Sync.md`
- `Model/Activities/Tending/Health Check.md`
- `Model/Activities/Tending/Scheduled Task Audit.md`
- `Model/Activities/Tending/Knowledge Rebuild.md`
- `Model/Activities/Tending/Convergence Check.md`

`Model/Conventions/Notes/Activity Note.md` (already in the matrix above) is the note that defines this convention. The Prompt-layer notes under `Tools/Claude/Activities/{group}/` also carry `## Prompt` sections, since they exist solely to hold a prompt.

### Caveats on the count

- Case-sensitive; only capitalised role-name uses are counted as "the layer", which is the right filter for the question the matrix answers.
- The matrix counts prose mentions only (e.g. "the Prompt library"). Structural uses - `## Prompt` H2 section headings in Definition notes - are listed separately above.
- Excluded as collisions: `Configuration` as the title of `Realisation/Knowledge Capitals/Configuration/` (a separate concept); `Pattern` as a column header in Email routing tables.

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
