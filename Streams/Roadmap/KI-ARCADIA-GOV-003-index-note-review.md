---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-003
area: GOV
title: Index note review
theme: governance
tags:
  - topic/knowledge-islands
status: ready
priority: medium
horizon: next
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-04-28T00:13:43Z
updated_at: 2026-10-04T18:06:00Z
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

- [ ] Create `Introduction/Background/Background.md` and `Introduction/Concept/Concept.md`, then `Introduction/Introduction.md`.
- [ ] Create `Model/Activities/Activities.md`, `Model/Agents/Agents.md`, `Model/Conventions/Conventions.md`, `Model/Processes/Processes.md` and `Model/Tools/Tools.md`, then `Model/Model.md`.
- [ ] Create `Realisation/Realisation.md`, then `Philosophy/Philosophy.md`, and point [[Pillars]] at the new pillar index.
- [ ] Disambiguate or repair the inbound links listed under Current state so each resolves to exactly one note.
- [ ] Replace the stale `Housekeeping` description in [[Streams]] with the Activity collection.
- [ ] Add an index-note audit step (presence, Overview, one H2 per direct child, Streams navigation agreement) to the Health Check definition and its Claude prompt.

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

## Discussion

The original checklist asked to verify `Streams.md`, `Roadmap.md` and `_ISSUES.md` agree on the flat roadmap structure and to add a stream index table audit step to Health Check or Conformance Check; both are carried into Steps above.

---

## Adherence

This stream adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Content reaches `Pillars/` or `Resources/` only on user approval of a `ready` proposal.
