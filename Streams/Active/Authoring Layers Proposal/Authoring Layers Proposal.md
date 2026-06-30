---
type: stream-proposal
tags:
  - topic/knowledge-islands
status: draft
priority: medium
dependencies: []
author: Written with Claude
---

# Authoring Layers Proposal

## Overview

Make the five-layer authoring framing implicit in reader-facing notes. The layers - Definition, Configuration, Pattern, Agent Behaviour, Prompt - are defined in [[Authoring Guidelines]] and remain useful as a design tool for authors; the goal is to stop them reading as scaffolding everywhere else. The earlier renaming pass is closed; this stream is the structural rewrite that follows it.

Arcadia-specific authoring decisions, when they emerge, live in [[Authoring]] under Admin/Governance.

---

## Governance

This stream follows the [[Enactment Process]].

---

## Background

This stream is the second half of a two-phase pass. The first phase (now closed) did the mechanical work:

- Layers are now named: Definition, Configuration, Pattern, Agent Behaviour, Prompt.
- Audited 22 reader-facing references across 14 Pillars notes, 4 Streams notes, and 1 HTML view.
- Created the stub [[Authoring]] note in Admin/Governance for Arcadia-specific authoring decisions; updated the KC Conventions index; added a pointer at the top of [[Authoring Guidelines]].

The remaining work is structural: making the layering implicit rather than labelled.

---

## Term Distribution

Role-name mentions across the Pillars notes in scope, regenerated after the prompt migration. Only notes with at least one mention are listed; 17 activity Definitions ended up clean and are not shown (named in observation 5 below). [[Authoring Guidelines]] is also excluded as the framework note that defines the role names - its mentioning all five is tautological and not informative for Option B targeting. Sorted by path. `x` marks a presence (prose mention or `## Prompt` section heading).

| Note                                                             | Definition | Configuration | Pattern | Agent Behaviour | Prompt |
| ---------------------------------------------------------------- | :--------: | :-----------: | :-----: | :-------------: | :----: |
| `Model/Activities/Tending/Tending.md`                            |     x      |       —       |    —    |        —        |   x    |
| `Model/Activities/What Keeps an Island Alive.md`                 |     —      |       —       |    —    |        —        |   x    |
| `Model/Agents/Agentic AI/Agentic AI.md`                          |     —      |       —       |    x    |        —        |   —    |
| `Model/Conventions/Notes/Activity Note.md`                       |     —      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Activities.md`                    |     x      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Briefings/Briefings.md`           |     x      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Briefings/Morning Briefing.md`    |     —      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Constitutional/Conformance.md`    |     x      |       x       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Constitutional/Constitutional.md` |     x      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Email/Email Test.md`              |     —      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Email/Email.md`                   |     x      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Email/Re-route Triaged.md`        |     —      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Email/Recap.md`                   |     —      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Email/Route Drift.md`             |     —      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Email/Route Review.md`            |     —      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Email/Route Triage.md`            |     —      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Linear/Linear Sync.md`            |     —      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Linear/Linear.md`                 |     x      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Tending/Convergence Check.md`     |     —      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Tending/Health Check.md`          |     —      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Tending/Knowledge Rebuild.md`     |     —      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Tending/Scheduled Task Audit.md`  |     x      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Activities/Tending/Tending.md`               |     x      |       —       |    —    |        —        |   x    |
| `Model/Tools/Claude/Claude.md`                                   |     x      |       —       |    —    |        —        |   x    |
| `Model/Tools/How Tools Connect.md`                               |     —      |       —       |    —    |        —        |   x    |

### Observations

1. **Definition + Prompt is the dominant pair.** Eleven notes carry both: the [[Philosophy/Model/Activities/Tending/Tending|Activities/Tending]] index, [[Philosophy/Model/Tools/Claude/Claude|Claude]], the seven `Tools/Claude/Activities/*/*.md` per-group index notes, and the consolidated [[Philosophy/Model/Tools/Claude/Activities/Tending/Scheduled Task Audit|Scheduled Task Audit]] note. The seven group index notes plus `Activities.md` and `Claude.md` (nine notes) are the highest-volume target for the per-group index pass - each contains "in the Definition layer" or equivalent prose pointing Prompt-side at Definition-side.
2. **`Pattern` appears only in [[Agentic AI]]** outside the framework. One reader-facing reference. Can be rephrased as "this is general operating guidance, portable across islands" with the role term retired.
3. **`Agent Behaviour` appears nowhere outside the framework.** Zero reader-facing presence already - useful precedent that a framework term need not propagate outward.
4. **`Configuration` appears in only one non-framework Pillars note** ([[Conformance]] under `Tools/Claude/Activities/Constitutional/`). The use points the reader at where island-specific config lives - a candidate for replacement with the wikilink alone.
5. **All individual activity Definitions are now clean of role-name mentions.** The migration completed the structural separation: Definitions hold descriptive content, Prompts hold executable content, and neither side carries the layer name as part of its prose. The Definition-side notes that still mention role names are the convention ([[Activity Note]]), the activity index ([[What Keeps an Island Alive]]), and the Tending group index. The inline-`## Prompt`-in-Definition convention from [[Activity Note]] format remains as a documented option but is no longer in active use here.
6. **Role-name mentions concentrate on the `Tools/Claude/` side.** Of 25 notes with at least one mention (excluding the framework note), 20 sit under `Model/Tools/Claude/`. The remaining five are the convention, the activity index, the Tending Definition index, `Agentic AI`, and `How Tools Connect`. Option B's prose work focuses on the Tools/Claude side; the Definition side is already at the implicit-layering target.

### Caveats on the count

- Case-sensitive; only capitalised role-name uses are counted as "the layer", which is the right filter for the question the matrix answers.
- The Prompt column counts both prose mentions ("the Prompt library", "the prompt below") and `## Prompt` H2 section headings. After the migration these are now in the same notes (every Prompt-side activity note has both an H2 and prose), so the conflation is no longer ambiguous.
- Excluded as the framework: [[Authoring Guidelines]] is the note that defines the role names. Its mentioning all five is by definition, not a sign of leakage, so it is disregarded as a source.
- Excluded as collisions: `Configuration` as the title of `Realisation/Configuration/` (a separate concept); `Pattern` as a column header in Email routing tables; `Definitions` as an H2 heading in `Email/Approach.md` (terminology definitions, not the Definition layer); `Prompts` as a verb at line 26 of the Knowledge Rebuild Definition ("Prompts for confirmation").

---

## Phase Summary

| Phase                            | Status         | Description |
| -------------------------------- | -------------- | ----------- |
| Authoring Guidelines restructure | 🔲 Not started | †           |
| Per-group index pass             | 🔲 Not started | ‡           |
| Capitalisation pass              | 🔲 Not started | §           |
| Cross-check pass                 | 🔲 Not started | ¶           |

† Restructure [[Authoring Guidelines]] so the layered framing is descriptive rather than enumerated; keep the lattice as the analytical heart.

‡ Drop "in the Definition layer" / "in the Prompt layer" phrasing from each `Tools/Claude/Activities/*/*.md`; let the wikilink alone do the navigational work.

§ Downgrade capitalised role names where they read as proper nouns ("the Prompt library" → "the prompt library").

¶ Read every touched note end-to-end to catch awkward phrasing introduced by mechanical replacement.

---

## Design Decisions

| Decision                                                       | Rationale |
| -------------------------------------------------------------- | --------- |
| Keep the lattice visible in [[Authoring Guidelines]]           | ‖         |
| Make layering implicit elsewhere                               | ††        |
| Activities can be Claude-specific from the start               | ‡‡        |
| Schedule, Invocation, and Useful Commands move with the Prompt | §§        |

‖ The asymmetry of the cube (5 corners filled, 3 empty) is the analytical heart of the model and earns its place even after the layering becomes implicit.

†† The numbering and "five-layer model" framing read as scaffolding to readers who do not need to know the model exists; the role names carry enough meaning on their own.

‡‡ Demonstrated by [[Philosophy/Model/Tools/Claude/Activities/Tending/Scheduled Task Audit\|Scheduled Task Audit]]: when an activity has no agent-agnostic content, it lives only at the Prompt layer with no Definition counterpart. The empty `agent-agnostic Definition` corner is a structural option, not a requirement.

§§ These sections describe how a prompt is invoked or supported, not what the activity is. Consolidating them on the Prompt side keeps the Definition focused on "what and why" and avoids duplicating runtime-adjacent detail across two notes.

---

## Open Issues

| Issue                                                                                                         | Notes |
| ------------------------------------------------------------------------------------------------------------- | ----- |
| Whether to retain "in the Definition layer" pointers in per-group index notes                                 | ¶¶    |
| Whether to keep capitalised role names or downgrade to ordinary nouns                                         | ‖‖    |
| Convergence Check shared-notes list still references the deleted `Activities/Tending/Scheduled Task Audit.md` | ※     |
| Frontmatter conventions for Prompt notes are inconsistent                                                     | ❡     |

¶¶ The pointers were a navigational signpost; removing them risks readers who land cold losing context. Mitigation is wikilink quality and the lattice in Authoring Guidelines. Concrete target: nine notes carry this phrasing today.

‖‖ "the Prompt library" reads as a proper noun; "the prompt library" reads as descriptive. The descriptive form is closer to implicit layering.

※ The activity is now a Claude-specific Prompt note at `Tools/Claude/Activities/Tending/Scheduled Task Audit.md`. Per the existing convention, `Tools/Claude/Activities/` is "legitimately island-specific" and excluded from the shared-notes list - so the entry should be removed rather than relocated.

❡ Two patterns coexist: Conformance Prompt note uses `card/prompt` with `# X - Prompt` title and explicit `Definition: [[...]] Configuration: [[...]]` cross-link; the newly migrated Prompt notes use `card/note` with a plain `# X` title and no cross-link. Captured for review in [[Streams/Background/Reading Order/Reading Order\|Reading Order]] - decision will affect the capitalisation pass.

## Adherence

This stream adheres to the [[Enactment Process]]. Content reaches `Pillars/` or `Resources/` only on user approval of a `ready` proposal.
