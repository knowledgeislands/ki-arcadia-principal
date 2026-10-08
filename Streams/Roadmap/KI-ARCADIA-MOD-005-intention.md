---
note_type: stream-roadmap
id: KI-ARCADIA-MOD-005
area: MOD
title: Intention
kind: deliver
project: island-model-and-tending
component: model
tags:
  - card/proposal
  - topic/knowledge-islands
status: awaiting-review
priority: medium
horizon: now
blocks: []
blocked_by: []
baseline_ref: 8d9e8b79fe73869f429c7e2432fd16add9665e33
created_at: 2026-04-27T19:18:58Z
updated_at: 2026-10-08T08:46:29Z
author: Written with Claude
---

# Intentional Proposal

## Goal

Name Intention in the Knowledge Islands model as the purpose an island exists for, set beside its boundaries, so that readers of the Concept chapter understand that an island is a purposeful territory rather than an archive.

---

## Context

The question arose during a review of the Concept chapter: the model gives an island defined boundaries, actors, jurisdiction and governance, but never says what an island is _for_. [[The Home of Knowledge]] introduces the island as a discrete body of knowledge with defined boundaries; SDR-KI-ARCADIA-002 records that framing as Arcadia's strategy decision. Neither names purpose.

The record's own initial framing holds up: Intention is the island's purpose, and it is what distinguishes a living island from an archive. The cycle of knowledge (Capture, Connect, Reflect) is the mechanism; Intention keeps it purposeful rather than merely accumulative. It operates at two levels: the governor's intention at island level, which shapes scope and what the island holds, and the contributor's intention at capture level, which decides what is worth bringing in. Intention is distinct from jurisdiction: jurisdiction says who has authority, Intention says what for.

---

## Boundary

- One short addition to the Concept chapter; no new note, no new chapter section structure, and no change to the cycle of knowledge, jurisdiction or governance notes.
- No new Strategy Decision Record and no amendment to SDR-KI-ARCADIA-002.
- No `Admin/` change: the portable concept is defined here, and any Arcadia-specific statement of its own intention would be a separate Charter matter.

---

## Current state

- `Pillars/Philosophy/Introduction/Concept/Concept.md` is a `pillars/index` note: a prose `## Overview` and one H2 per direct child (How an Island Takes Shape, Territories and Archipelagos, Agents, Jurisdiction, Governance).
- `Pillars/Philosophy/Introduction/Concept/How an Island Takes Shape.md` is the chapter's orienting note: three prose paragraphs, no H2 sections, naming the four foundational concepts. It contains one em dash, after "structural mirrors".
- `grep -rli intention Pillars/Philosophy/Introduction` finds only an incidental use in Prior Art; the model does not name Intention.

---

## Steps

- [x] Add one short paragraph to `Pillars/Philosophy/Introduction/Concept/How an Island Takes Shape.md`, after the paragraph naming the four concepts, stating that an island exists for a purpose as well as within boundaries: Intention is the island's purpose, held by the governor at island level and exercised by contributors at capture level, distinct from jurisdiction, and what keeps the cycle purposeful rather than accumulative. Link [[The Home of Knowledge]].
- [x] Replace the existing em dash in that note with an ASCII hyphen while editing it.
- [x] Extend the `## How an Island Takes Shape` section of `Pillars/Philosophy/Introduction/Concept/Concept.md` by one clause noting that the orienting note also names Intention, keeping the index note's one-section-per-child structure.
- [x] Update the `status` month on each edited note per its existing convention.

---

## Files touched

- `Pillars/Philosophy/Introduction/Concept/How an Island Takes Shape.md`
- `Pillars/Philosophy/Introduction/Concept/Concept.md`
- this record

---

## Verify

- `grep -n -i intention "Pillars/Philosophy/Introduction/Concept/How an Island Takes Shape.md"` finds the new paragraph, and it links [[The Home of Knowledge]].
- `Concept.md` still has exactly the `## Overview` section plus one H2 per direct child.
- `grep -nP '[\x{2013}\x{2014}]'` on both edited notes returns nothing; prose uses British English.
- `ki repo audit --skill ki-repo-kb --repo . --progress never` PASS.
- `ki repo audit --progress never` PASS.
- Kris reviews the wording at awaiting-review.

---

## Dependencies / blocks

No dependency. The wording is a prose judgement for Kris at review, not a precondition.

---

## Documentation impact

### Decision Records

None. The addition elaborates the framing already recorded in SDR-KI-ARCADIA-002 and does not change it.

### Specifications

None.

### Guides

The Concept chapter orienting note and its index entry are the only documentation changed.

### Roadmap

This record moves to awaiting-review on delivery; no follow-up record is expected.

---

## Review

### Delivered

Intention is named in the Concept chapter as the island's purpose, set beside its boundaries. Baseline `8d9e8b79fe73869f429c7e2432fd16add9665e33`; the result is the delivery commit that sets this record to awaiting-review.

### Change Summary

- `How an Island Takes Shape.md`: one new paragraph after the four-concepts paragraph defining Intention at island and capture level, distinct from jurisdiction, and linking [[The Home of Knowledge]]; the em dash after "structural mirrors" is now an ASCII hyphen; status month moved to October 2026.
- `Concept.md`: the `## How an Island Takes Shape` section gains one clause noting that the orienting note names Intention; its section structure is unchanged.

### Verification

- `grep -n -i intention` on the orienting note finds the new paragraph, which links [[The Home of Knowledge]].
- `Concept.md` keeps `## Overview` plus one H2 per direct child.
- No en or em dash in either edited note.
- `ki repo audit --skill ki-repo-kb --repo . --progress never` on 2026-10-08: PASS, 4 skills.
- `ki repo audit --progress never` on 2026-10-08: PASS=23 WARN=1 FAIL=0; the one warning is the repository-wide missing `.githooks/pre-commit` gate (HOOK-1), unrelated to this record.

### Outstanding concerns

- The wording is a prose judgement; Kris may refine it at any time without reopening the record.

### Post-change review

The goal is met within the boundary: one paragraph and one clause, no new note, no Decision Record and no `Admin/` change. Regression risk is nil. This is the implementing agent's own check, not an independent review.

### Mini recap

KI-ARCADIA-MOD-005 names Intention in the Concept chapter's orienting note and points to it from the chapter index. Learning route: none.

## Discussion

### Decisions under delegated autonomy

- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: adopt the record's initial framing - Intention is the island's purpose, at island level beside boundaries, with the governor's intention at island level and the contributor's at capture level.
- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: one short addition in the Concept chapter, related to SDR-KI-ARCADIA-002, and no new SDR.

### Planning corrections

- The triage placed the addition in `Concept.md`. That note is an index whose H2s must be one per direct child, so a new Intention section there would break the index rule. The addition goes in the chapter's orienting note, How an Island Takes Shape, with a one-clause pointer in the index.
- The triage asked for a link to SDR-KI-ARCADIA-002. Introduction notes are portable and carry no links to Arcadia Decision Records, so the note links [[The Home of Knowledge]], the concept that SDR records; this record cites the SDR as the rationale anchor.
- The legacy path `Pillars/Philosophy/Concept/Concept.md` is now `Pillars/Philosophy/Introduction/Concept/Concept.md`.

### Original open questions, resolved

1. **Where does Intention sit?** As a property of the island itself: its purpose. The alternatives considered were a dimension of the cycle (intentional versus passive capture), a property of the agent, or something prior to the cycle. The chosen framing absorbs the agent view at capture level and the "precedes the cycle" view in the living-island-versus-archive distinction.
2. **Is it already implicit?** Partly: boundaries, ratification and the deliberate cycle imply it. Naming it makes the implication explicit without adding machinery.
3. **Whose intention?** The governor's at island level and the contributor's at capture level. The council's intention is exercised through jurisdiction rather than named separately.
4. **Relation to jurisdiction?** Distinct: jurisdiction is who, Intention is what for.

### Original design note

A personal island has personal intentions; a community island has shared ones; an archipelago may have civilisational ones. The choice to preserve something across generations is itself an act of intention: libraries and archives are intentional acts of selection and custody, not neutral accumulation.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
