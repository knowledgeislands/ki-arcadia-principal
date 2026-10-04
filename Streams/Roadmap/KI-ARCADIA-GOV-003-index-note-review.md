---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-003
area: GOV
title: Index note review
theme: governance
tags:
  - topic/knowledge-islands
status: done
priority: medium
horizon: next
blocks: []
blocked_by: []
baseline_ref: f517a4743bc56136a3c17903f1a04dfeaa9d0869
created_at: 2026-04-28T00:13:43Z
updated_at: 2026-10-04T21:30:00Z
author: Written with Claude
---

# Stream Index Review Proposal

## Overview

The index note standard in `AGENTS.md` is strictly enforced: every folder carries a same-name index note with an `## Overview` and one substantive H2 per direct child. This record brings the Knowledge Islands pillar (`Pillars/Philosophy/`) into line with that standard, and also covers roadmap navigation - verifying that [[Streams]], [[Roadmap]], and the allocation ledger accurately describe the flat work records, and adding a recurring audit step to the maintenance activity that owns structural health checks.

The goal is that by the end of the review, every folder in the Knowledge Islands pillar has an index note that accurately contextualises its contents, and roadmap navigation is coherent and covered by ongoing maintenance.

---

## Governance

This stream follows the [[Admin/Operations/Processes/Enactment Process|Enactment Process]].

---

## Approach

Work leaf-to-root within each subtree. For each missing index note: read the folder's children, write the index note to the standard in [[Notes]] and `AGENTS.md`, then move to the parent. Existing narrative chapter notes (for example [[How Tools Connect]]) stay where they are and are introduced from the new index as one of its children; no content moves.

---

## Decisions

- **Scope and primary work.** Scope the review to the `Pillars/Philosophy/` subtree and treat the folders lacking a same-name index note as the primary work: create them to the index-note standard, leaf-to-root, with no content moves. Confirm that `Streams/Roadmap/_ISSUES.md` and the Streams navigation agree, add an index-table audit step to the Health Check activity, and re-point this record's stale Governance link to the current Enactment Process note. Reasoning: mechanical conformance of a strictly enforced convention; the host activity choice is low-risk and reversible. Decided by the Fable reviewer under delegated autonomy (2026-10-04), reversible.
- **Boundary with KI-ARCADIA-MOD-001.** This record owns the missing index notes. [[KI-ARCADIA-MOD-001-reading-order|MOD-001]] owns reading order, chapter introductions and link quality, so this record does not rewrite the narrative chapter notes.

---

## Current state

Re-enumerated on 2026-10-04 with `find Pillars/Philosophy -type d`. Eleven folders lack a same-name index note: `Philosophy`, `Introduction`, `Introduction/Background`, `Introduction/Concept`, `Model`, `Model/Activities`, `Model/Agents`, `Model/Conventions`, `Model/Processes`, `Model/Tools` and `Realisation`. Each chapter folder under `Model/` and `Introduction/Concept` already holds a narrative chapter note under a different name (`What Keeps an Island Alive`, `Who Acts on the Island`, `What Conventions Cover`, `How Change Happens`, `How Tools Connect`, `How an Island Takes Shape`), and `Pillars/Philosophy/Knowledge Islands.md` is the pillar's narrative entry point.

Several live links already expect the missing notes and are broken today: `[[Introduction/Introduction]]` in `AGENTS.md`, `[[Model/Tools/Tools]]`, `[[Philosophy/Model/Tools/Tools]]`, `[[Tools]]`, `[[Model/Agents/Agents]]`, `[[Philosophy/Model/Activities/Activities]]` and `[[Philosophy/Model/Processes/Processes]]`. Bare `[[Activities]]` and `[[Agents]]` links in `Human.md`, `Claude.md` and `ChatGPT.md` will become ambiguous once the new notes exist, and the Admin `Activities.md` and `Processes.md` indexes carry stale `Philosophy/Activities` and `Philosophy/Processes` paths.

Roadmap navigation: `_ISSUES.md` high-water marks agree with the flat records (GOV 013 was issued and pruned), and [[Roadmap]] agrees with the flat model. [[Streams]] still describes a `Housekeeping` template area that no longer exists; recurring obligations are Activity notes in `Admin/Operations/Activities/`. The Health Check prompt already scans for "folders missing an index note" but its definition note does not, and neither checks index-note shape or Streams navigation.

## Steps

- [x] Create `Introduction/Background/Background.md` and `Introduction/Concept/Concept.md`, then `Introduction/Introduction.md`.
- [x] Create `Model/Activities/Activities.md`, `Model/Agents/Agents.md`, `Model/Conventions/Conventions.md`, `Model/Processes/Processes.md` and `Model/Tools/Tools.md`, then `Model/Model.md`.
- [x] Create `Realisation/Realisation.md`, then `Philosophy/Philosophy.md`, and point [[Pillars]] at the new pillar index.
- [x] Disambiguate or repair the inbound links listed under Current state so each resolves to exactly one note.
- [x] Replace the stale `Housekeeping` description in [[Streams]] with the Activity collection.
- [x] Add an index-note audit step (presence, Overview, one H2 per direct child, Streams navigation agreement) to the Health Check definition and its Claude prompt.

## Files touched

- New: eleven same-name index notes under `Pillars/Philosophy/`.
- `Pillars/Pillars.md`; `Pillars/Philosophy/Model/Agents/Human/Human.md`; `Pillars/Philosophy/Model/Agents/ChatGPT/ChatGPT.md`; `Pillars/Philosophy/Model/Tools/Claude/Claude.md`.
- `Pillars/Philosophy/Model/Activities/Tending/Health Check.md`; `Pillars/Philosophy/Model/Tools/Claude/Activities/Tending/Health Check.md`.
- `Admin/Operations/Activities/Activities.md`; `Admin/Operations/Processes/Processes.md`.
- `Streams/Streams.md`; this record.

## Verify

- `find Pillars/Philosophy -type d` reports no folder without a same-name index note.
- Each new index has an `## Overview` and one H2 per direct child with two to four substantive sentences.
- Every new or changed wikilink resolves to exactly one note (shortest-unique suffix match).
- `ki repo audit`, `ki repo audit --skill ki-repo-kb` and `ki repo audit --skill ki-repo-kb-streams` pass; markdown hooks pass on commit.

## Dependencies / blocks

None. Coordinates with [[KI-ARCADIA-MOD-001-reading-order|MOD-001]] (narrative reading order) and [[KI-ARCADIA-GOV-002-authoring-layers|GOV-002]] (layer phrasing); neither blocks this record.

## Delegation

Parallel drafting lanes per subtree may draft index notes from the children; the coordinator reviews every note and performs all commits.

---

## Review

### Delivered

The approved boundary: same-name index notes for every `Pillars/Philosophy/` folder that lacked one, built leaf-to-root with no content moves; inbound link repair for the new notes; the Streams navigation correction; and an index-note audit step in Health Check. Narrative chapter notes, reading order and pre-existing link quality are excluded and remain with [[KI-ARCADIA-MOD-001-reading-order|MOD-001]]. Baseline `f517a4743bc56136a3c17903f1a04dfeaa9d0869`.

### Change Summary

- **New index notes (11):** `Philosophy`, `Introduction`, `Introduction/Background`, `Introduction/Concept`, `Model`, `Model/Activities`, `Model/Agents`, `Model/Conventions`, `Model/Processes`, `Model/Tools` and `Realisation`, each `pillars/index` with an `## Overview` and one H2 per direct child; each chapter index introduces its narrative chapter note first.
- **Links:** [[Pillars]] now points at the Philosophy index; disambiguated the bare `[[Activities]]` and `[[Agents]]` links in `Human.md`, `Claude.md` and `ChatGPT.md`; repaired the stale `Philosophy/Activities` and `Philosophy/Processes` paths in the Admin Activities and Processes indexes. Previously broken links such as `[[Introduction/Introduction]]`, `[[Model/Tools/Tools]]` and `[[Model/Agents/Agents]]` now resolve.
- **Streams:** [[Streams]] no longer describes the retired Housekeeping area; it points at the Activity collection. `_ISSUES.md` and [[Roadmap]] already agreed with the flat records and are unchanged.
- **Health Check:** the definition note gains an index note audit bullet and the Claude prompt gains Step 5a covering presence, shape and Streams navigation agreement.
- **Deviation:** none. Three drafting subagents wrote the nine leaf and chapter indexes; the coordinator wrote `Model` and `Philosophy`, reviewed every note and linked the act indexes to one another.

### Verification

- `find Pillars/Philosophy -type d` with a same-name check reports no folder without an index note.
- A shape script confirms every new index has `## Overview` and an H2 for each direct child.
- A shortest-unique suffix resolver finds every new or changed wikilink resolves to exactly one note; the only unresolved links in touched files pre-date this record (see concerns).
- No em or en dashes in new content; `ki repo audit`, `--skill ki-repo-kb` and `--skill ki-repo-kb-streams` PASS; rumdl hook passes on commit.

### Outstanding concerns

- Pre-existing broken or ambiguous links remain in touched files and are left to MOD-001 link quality: `[[Knowledge Capital/Charter]]`, `[[Island Skill]]` and `[[Live Artifacts]]` in `Tools/Claude/Claude.md`, `[[Claude]]` in `Agents/ChatGPT/ChatGPT.md`, `[[Model/Activities/Linear/Linear]]` in [[Knowledge Islands]], the truncated Integrations link in `Realisation/Arcadia/Arcadia.md`, and two stale paths in `AGENTS.md` (`Structure/Library/Library`, `Frontmatter/Tags`).
- Some pre-existing index notes (`Notes`, `Tending`, `Constitutional`, `Obsidian/Templates`, Claude `Tending`) do not carry one H2 per direct child; the new Health Check step will surface them on its next run.

### Post-change review

The goal - every Philosophy folder carries a standard index note and roadmap navigation is coherent and covered by maintenance - is met. Scope held to new notes plus targeted link repairs, so regression risk is limited to link resolution, which was checked mechanically. Ready for acceptance.

### Mini recap

Eleven index notes created, eight link repairs, Streams navigation corrected, Health Check extended; audits pass. Learning route: the Health Check prompt still assumes a Cowork `Knowledge Capital` path in Step 0, worth a later tending review.

---

## Done

Accepted 2026-10-04 on the review packet above after an independent Fable review returned ACCEPT (all Philosophy index notes present with prose Overview and one section per child; link repairs resolve; audit PASS). Decided by the Fable reviewer under delegated autonomy (2026-10-04), reversible.

## Discussion

The original checklist asked to verify `Streams.md`, `Roadmap.md` and `_ISSUES.md` agree on the flat roadmap structure and to add a stream index table audit step to Health Check or Conformance Check; both are carried into Steps above.

---

## Adherence

This stream adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Content reaches `Pillars/` or `Resources/` only on user approval of a `ready` proposal.
