---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-002
area: GOV
title: Authoring layers
theme: governance
tags:
  - topic/knowledge-islands
status: awaiting-review
priority: medium
horizon: next
blocks: []
blocked_by: []
baseline_ref: aa0a9b6881c050f9fcd1f436a6b61245bc15a4a0
created_at: 2026-04-30T07:53:50Z
updated_at: 2026-10-04T19:40:00Z
author: Written with Claude
---

# Authoring Layers Proposal

## Overview

Make the five-layer authoring framing implicit in reader-facing notes. The layers - Definition, Configuration, Pattern, Agent Behaviour, Prompt - are defined in [[Authoring Guidelines]] and remain useful as a design tool for authors; the goal is to stop them reading as scaffolding everywhere else. The earlier renaming pass is closed; this stream is the structural rewrite that follows it.

Arcadia-specific authoring decisions, when they emerge, live in [[Authoring]] under Admin/Governance.

---

## Governance

This stream follows the [[Admin/Operations/Processes/Enactment Process|Enactment Process]].

---

## Decisions

- **Scope.** Proceed with the structural rewrite: make the layer framing implicit outside [[Authoring Guidelines]], drop the "in the Definition layer" and "Prompt layer" pointers from the Claude prompt indexes and let the wikilink carry the navigation, and downgrade capitalised role names to ordinary nouns ("the prompt library", "prompt note"). Targets are the Claude prompt indexes (`Activities.md`, `Constitutional.md`, `Tending.md`), `Tools/Claude/Claude.md`, `Agentic AI`, `Activity Note`, `What Keeps an Island Alive`, the Tending definition index, `How Tools Connect` and the Scheduled Task Audit prose. Remove the stale Convergence Check shared-notes entry for Scheduled Task Audit. Prompt-note frontmatter is left to [[KI-ARCADIA-MOD-001-reading-order|MOD-001]]. Decided by the Fable reviewer under delegated autonomy (2026-10-04), reversible.
- **Open issues resolved.** The per-group "in the Definition layer" pointers are dropped (wikilinks and the lattice in [[Authoring Guidelines]] carry the context); capitalised role names are downgraded; the Convergence Check entry is removed or confirmed absent; prompt frontmatter was standardised by MOD-001.
- **Authoring Guidelines restructure held for the owner.** On 2026-04-30, after this record was created, the owner rewrote [[Authoring Guidelines]] by hand: it now describes four layers (Definition, Configuration, Behaviour, Script) while its lattice still names five (Definition, Configuration, Pattern, Agent Behaviour, Script), it carries an open "Note to Reviewer" question about a self-referencing `All/All/All` note, and its "Definitive Activities" example is unfinished. Restructuring it would overwrite owner design work and needs an owner decision on the layer vocabulary, so phase 1 is not delivered here. The remaining phases are vocabulary-neutral: they remove layer labels rather than choose names.
- **Prompt blocks unchanged.** Text inside fenced prompt blocks is the canonical copy of a live scheduled task prompt; it is not recased, so the change introduces no prompt drift.

---

## Current state

Re-surveyed on 2026-10-04. Layer labels outside [[Authoring Guidelines]] remain in: the Claude prompt indexes ("the Prompt layer", "the Definition layer"), `Tools/Claude/Claude.md` ("the Prompt library", "the Definition layer", and a stale list of Email, Briefings and Linear groups that no longer exist), `Agentic AI` ("This is the Pattern layer"), the Tending definition index ("the boundary between Definition and Prompt"), and capitalised "Prompt note" in `Activity Note`, `What Keeps an Island Alive`, `How Tools Connect`, the Claude Tending index and the Scheduled Task Audit prose. Pointers that name [[Authoring Guidelines]] as the home of the "content layers" are framework references and stay. The Convergence Check shared-notes list now names the whole `Pillars/Philosophy/` folder and no longer lists Scheduled Task Audit.

## Steps

- [x] Rewrite the layer-label sentences in the three Claude prompt indexes, `Tools/Claude/Claude.md`, `Agentic AI` and the Tending definition index as descriptive prose that keeps the wikilinks.
- [x] Downgrade capitalised "Prompt note", "Prompt library" and similar role names to ordinary nouns outside fenced prompt blocks.
- [x] Confirm the Convergence Check shared-notes list carries no Scheduled Task Audit entry.
- [x] Read every touched note end to end and smooth any awkward phrasing.

## Files touched

- `Pillars/Philosophy/Model/Tools/Claude/Activities/Activities.md`, `Constitutional/Constitutional.md`, `Tending/Tending.md`, `Tending/Scheduled Task Audit.md`.
- `Pillars/Philosophy/Model/Tools/Claude/Claude.md`; `Pillars/Philosophy/Model/Tools/How Tools Connect.md`.
- `Pillars/Philosophy/Model/Agents/Agentic AI/Agentic AI.md`; `Pillars/Philosophy/Model/Conventions/Notes/Activity Note.md`.
- `Pillars/Philosophy/Model/Activities/What Keeps an Island Alive.md`; `Pillars/Philosophy/Model/Activities/Tending/Tending.md`.
- This record.

## Verify

- Outside [[Authoring Guidelines]] and fenced prompt blocks, no Pillars note uses "Definition layer", "Prompt layer", "Pattern layer", "Prompt library" or capitalised "Prompt note".
- Every changed wikilink resolves to exactly one note; no em or en dashes introduced.
- `ki repo audit`, `--skill ki-repo-kb` and `--skill ki-repo-kb-streams` pass; markdown hooks pass on commit.

## Dependencies / blocks

None blocking. Follows [[KI-ARCADIA-MOD-001-reading-order|MOD-001]] (prompt frontmatter, delivered to review) and coordinates with [[KI-ARCADIA-GOV-003-index-note-review|GOV-003]].

## Delegation

None; the edits are small and sequential.

---

## Review

### Delivered

Phases 2 to 4 of the approved boundary: layer labels removed from reader-facing notes outside [[Authoring Guidelines]], the per-group "Definition layer" and "Prompt layer" pointers dropped in favour of the wikilinks, capitalised role names downgraded outside fenced prompt blocks, and an end-to-end read of every touched note. Phase 1, the [[Authoring Guidelines]] restructure, is held for an owner decision (see Decisions). Baseline `aa0a9b6`; the full SHA is in `baseline_ref`.

### Change Summary

- **Claude prompt indexes:** `Activities.md`, `Constitutional.md` and the Claude `Tending.md` no longer say "the Prompt layer" or "documented in the Definition layer"; each sentence now just links the definition.
- **Prose rewrites:** `Tools/Claude/Claude.md` calls `Activities` "the prompt library", drops "(the Definition layer)" and replaces the stale Email, Tending, Briefings and Linear group list with the current Constitutional and Tending groups. `Agentic AI` replaces "This is the Pattern layer" with a plain statement that its guidance holds for any activity, island and AI agent. The Tending definition index describes Scheduled Task Audit as keeping definition, prompt and live task in step, and now points at the prompt notes in `Tools/Claude/Activities` rather than "this folder".
- **Capitalisation:** "Prompt note" becomes "prompt note" in `Activity Note`, `What Keeps an Island Alive`, `How Tools Connect`, the Claude `Tending.md` and eight prose lines of Scheduled Task Audit; "Definition counterpart" becomes "definition note".
- **Convergence Check:** confirmed no Scheduled Task Audit entry remains; the shared-notes list now names the whole `Pillars/Philosophy/` folder, so no edit was needed.
- **Deviation:** phase 1 not delivered (owner hold); prompt text inside fenced blocks deliberately unchanged to avoid drift from the live scheduled task.

### Verification

- Outside [[Authoring Guidelines]] and fenced prompt blocks, grep finds no "Definition layer", "Prompt layer", "Pattern layer", "Prompt library", capitalised "Prompt note" or "Definition counterpart" in `Pillars/` or `Admin/`.
- The shortest-unique resolver reports `bad 0` across all touched files, including this record's previously ambiguous `[[Conformance]]` link; no em or en dashes added.
- `ki repo audit`, `--skill ki-repo-kb` and `--skill ki-repo-kb-streams` PASS; rumdl hook passes on commit.

### Outstanding concerns

- [[Authoring Guidelines]] needs an owner decision before phase 1 can proceed: four layers (Definition, Configuration, Behaviour, Script) or the five-corner lattice (Definition, Configuration, Pattern, Agent Behaviour, Script); the answer to its "Note to Reviewer" on a self-referencing `All/All/All` note; and completion of the "Definitive Activities" example. It also still cites `Pillars/Knowledge Capital/` paths. On acceptance, capture phase 1 as a follow-up record rather than closing it silently.
- The Convergence Check shared-notes list now covers all of `Pillars/Philosophy/`, which includes the island-specific `Tools/Claude/Activities/` prompts, and its island-specific table still names `Knowledge Capital/`; worth a tending review.

### Post-change review

Reader-facing notes outside the framework no longer carry layer labels, so the goal of implicit layering is met everywhere except the framework note itself, whose restructure now depends on an owner vocabulary choice. Edits were sentence-level and checked mechanically for links, dashes and residual labels. Ready for review as a partial delivery.

### Mini recap

Nine notes de-labelled, eight Scheduled Task Audit lines recased, stale group list fixed; Authoring Guidelines restructure held for owner. Learning route: the owner's April rewrite of the framework diverged from this record's five-name vocabulary, so re-read the target note before planning a terminology pass.

---

## Discussion

The survey, phase plan, design decisions and open issues below are this record's earlier analysis, retained as context for review.

---

## Term Distribution

Role-name mentions across the Pillars notes in scope, regenerated after the prompt migration. Only notes with at least one mention are listed; 17 activity Definitions ended up clean and are not shown (named in observation 5 below). [[Authoring Guidelines]] is also excluded as the framework note that defines the role names - its mentioning all five is tautological and not informative for Option B targeting. Sorted by path. `x` marks a presence (prose mention or `## Prompt` section heading).

| Note | Definition | Configuration | Pattern | Agent Behaviour | Prompt |
| --- | :-: | :-: | :-: | :-: | :-: |
| `Model/Activities/Tending/Tending.md` | x | - | - | - | x |
| `Model/Activities/What Keeps an Island Alive.md` | - | - | - | - | x |
| `Model/Agents/Agentic AI/Agentic AI.md` | - | - | x | - | - |
| `Model/Conventions/Notes/Activity Note.md` | - | - | - | - | x |
| `Model/Tools/Claude/Activities/Activities.md` | x | - | - | - | x |
| `Model/Tools/Claude/Activities/Briefings/Briefings.md` | x | - | - | - | x |
| `Model/Tools/Claude/Activities/Briefings/Morning Briefing.md` | - | - | - | - | x |
| `Model/Tools/Claude/Activities/Constitutional/Conformance.md` | x | x | - | - | x |
| `Model/Tools/Claude/Activities/Constitutional/Constitutional.md` | x | - | - | - | x |
| `Model/Tools/Claude/Activities/Email/Email Test.md` | - | - | - | - | x |
| `Model/Tools/Claude/Activities/Email/Email.md` | x | - | - | - | x |
| `Model/Tools/Claude/Activities/Email/Re-route Triaged.md` | - | - | - | - | x |
| `Model/Tools/Claude/Activities/Email/Recap.md` | - | - | - | - | x |
| `Model/Tools/Claude/Activities/Email/Route Drift.md` | - | - | - | - | x |
| `Model/Tools/Claude/Activities/Email/Route Review.md` | - | - | - | - | x |
| `Model/Tools/Claude/Activities/Email/Route Triage.md` | - | - | - | - | x |
| `Model/Tools/Claude/Activities/Linear/Linear Sync.md` | - | - | - | - | x |
| `Model/Tools/Claude/Activities/Linear/Linear.md` | x | - | - | - | x |
| `Model/Tools/Claude/Activities/Tending/Convergence Check.md` | - | - | - | - | x |
| `Model/Tools/Claude/Activities/Tending/Health Check.md` | - | - | - | - | x |
| `Model/Tools/Claude/Activities/Tending/Knowledge Rebuild.md` | - | - | - | - | x |
| `Model/Tools/Claude/Activities/Tending/Scheduled Task Audit.md` | x | - | - | - | x |
| `Model/Tools/Claude/Activities/Tending/Tending.md` | x | - | - | - | x |
| `Model/Tools/Claude/Claude.md` | x | - | - | - | x |
| `Model/Tools/How Tools Connect.md` | - | - | - | - | x |

### Observations

1. **Definition + Prompt is the dominant pair.** Eleven notes carry both: the [[Philosophy/Model/Activities/Tending/Tending|Activities/Tending]] index, [[Philosophy/Model/Tools/Claude/Claude|Claude]], the seven `Tools/Claude/Activities/*/*.md` per-group index notes, and the consolidated [[Philosophy/Model/Tools/Claude/Activities/Tending/Scheduled Task Audit|Scheduled Task Audit]] note. The seven group index notes plus `Activities.md` and `Claude.md` (nine notes) are the highest-volume target for the per-group index pass - each contains "in the Definition layer" or equivalent prose pointing Prompt-side at Definition-side.
2. **`Pattern` appears only in [[Agentic AI]]** outside the framework. One reader-facing reference. Can be rephrased as "this is general operating guidance, portable across islands" with the role term retired.
3. **`Agent Behaviour` appears nowhere outside the framework.** Zero reader-facing presence already - useful precedent that a framework term need not propagate outward.
4. **`Configuration` appears in only one non-framework Pillars note** ([[Tools/Claude/Activities/Constitutional/Conformance|Conformance]] under `Tools/Claude/Activities/Constitutional/`). The use points the reader at where island-specific config lives - a candidate for replacement with the wikilink alone.
5. **All individual activity Definitions are now clean of role-name mentions.** The migration completed the structural separation: Definitions hold descriptive content, Prompts hold executable content, and neither side carries the layer name as part of its prose. The Definition-side notes that still mention role names are the convention ([[Activity Note]]), the activity index ([[What Keeps an Island Alive]]), and the Tending group index. The inline-`## Prompt`-in-Definition convention from [[Activity Note]] format remains as a documented option but is no longer in active use here.
6. **Role-name mentions concentrate on the `Tools/Claude/` side.** Of 25 notes with at least one mention (excluding the framework note), 20 sit under `Model/Tools/Claude/`. The remaining five are the convention, the activity index, the Tending Definition index, `Agentic AI`, and `How Tools Connect`. Option B's prose work focuses on the Tools/Claude side; the Definition side is already at the implicit-layering target.

### Caveats on the count

- Case-sensitive; only capitalised role-name uses are counted as "the layer", which is the right filter for the question the matrix answers.
- The Prompt column counts both prose mentions ("the Prompt library", "the prompt below") and `## Prompt` H2 section headings. After the migration these are now in the same notes (every Prompt-side activity note has both an H2 and prose), so the conflation is no longer ambiguous.
- Excluded as the framework: [[Authoring Guidelines]] is the note that defines the role names. Its mentioning all five is by definition, not a sign of leakage, so it is disregarded as a source.
- Excluded as collisions: `Configuration` as the title of `Realisation/Configuration/` (a separate concept); `Pattern` as a column header in Email routing tables; `Definitions` as an H2 heading in `Email/Approach.md` (terminology definitions, not the Definition layer); `Prompts` as a verb at line 26 of the Knowledge Rebuild Definition ("Prompts for confirmation").

---

## Phase Summary

| Phase                            | Status        | Description |
| -------------------------------- | ------------- | ----------- |
| Authoring Guidelines restructure | Held (owner)  | †           |
| Per-group index pass             | Delivered     | ‡           |
| Capitalisation pass              | Delivered     | §           |
| Cross-check pass                 | Delivered     | ¶           |

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

| Issue | Notes |
| --- | --- |
| Whether to retain "in the Definition layer" pointers in per-group index notes | ¶¶ |
| Whether to keep capitalised role names or downgrade to ordinary nouns | ‖‖ |
| Convergence Check shared-notes list still references the deleted `Activities/Tending/Scheduled Task Audit.md` | ※ |
| Frontmatter conventions for Prompt notes are inconsistent | ❡ |

¶¶ The pointers were a navigational signpost; removing them risks readers who land cold losing context. Mitigation is wikilink quality and the lattice in Authoring Guidelines. Concrete target: nine notes carry this phrasing today.

‖‖ "the Prompt library" reads as a proper noun; "the prompt library" reads as descriptive. The descriptive form is closer to implicit layering.

※ The activity is now a Claude-specific Prompt note at `Tools/Claude/Activities/Tending/Scheduled Task Audit.md`. Per the existing convention, `Tools/Claude/Activities/` is "legitimately island-specific" and excluded from the shared-notes list - so the entry should be removed rather than relocated.

❡ Two patterns coexist: Conformance Prompt note uses `card/prompt` with `# X - Prompt` title and explicit `Definition: [[...]] Configuration: [[...]]` cross-link; the newly migrated Prompt notes use `card/note` with a plain `# X` title and no cross-link. Captured for review in [[Streams/Roadmap/KI-ARCADIA-MOD-001-reading-order|Reading order]] - the decision will affect the capitalisation pass.

### Pickup checkpoint - 2026-09-27

Before further implementation, reconcile the current destination branch, linked coordination tasks, and retained worktrees where applicable. Missing evidence does not release ownership or a hold; this checkpoint is guidance, not a mechanical execution block.

- **Observed:** The mechanical renaming pass described in Soon was closed separately. The Phase Summary still marks all four phases of this record's structural rewrite as not started; that earlier closure is not completion of this item.
- **Resolve:** Verify current reader-facing layer labels and note locations, then carry out or explicitly re-scope the Authoring Guidelines restructure, per-group index pass, capitalisation pass, and cross-check. Do not repeat the completed renaming pass as new work.
- **Close:** Seek owner acceptance through `ki-accept` only after this record's own phases have a reviewed outcome. Retain the `done` record; pruning is a later explicit owner choice.

---

## Adherence

This stream adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Content reaches `Pillars/` or `Resources/` only on user approval of a `ready` proposal.
