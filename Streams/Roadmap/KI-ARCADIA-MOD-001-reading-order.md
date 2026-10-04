---
note_type: stream-roadmap
id: KI-ARCADIA-MOD-001
area: MOD
title: Reading order
theme: knowledge-model
tags:
  - topic/knowledge-islands
status: awaiting-review
priority: medium
horizon: next
blocks: []
blocked_by: []
baseline_ref: 5c65c03d9e7b1b3e6aa4405b26a25e607d21d0a9
created_at: 2026-04-29T00:09:30Z
updated_at: 2026-10-04T19:10:00Z
author: Written with Claude
---

# Reading Order Proposal

## Overview

The three-act structure of the Knowledge Islands pillar, now at `Pillars/Philosophy/`, is in place. The migration from the old flat-folder layout is complete; the reading order runs Introduction → Model → Realisation, with each act answering a question and each chapter building on the last. The foundation is solid. The work from here is content quality, contextual integrity, and structural completeness.

See [Site Structure](KI-ARCADIA-MOD-001-reading-order.html) - the April 2026 storyboard, kept as a historical snapshot of the earlier `Pillars/Knowledge Islands/` layout.

---

## Governance

This stream follows the [[Admin/Operations/Processes/Enactment Process|Enactment Process]].

---

## Decisions

- **Scope and prompt-note shape.** Re-enumerate the current `Pillars/Philosophy/` tree and replace the stale Outstanding Work list; assess the Introduction -> Model -> Realisation ordering, chapter introductions and link quality; standardise Prompt-note frontmatter on the plainer `card/note` + `# X` pattern with an explicit cross-link to the activity's definition note (not `card/prompt` with `# X - Prompt`). [[KI-ARCADIA-GOV-003-index-note-review|GOV-003]] owns the missing index notes; this record owns reading order, chapter introductions and link quality, avoiding double work. Keep the `KI-ARCADIA-MOD-001-reading-order.html` sibling consistent if it is a live artifact, or note that it is stale. Reasoning: re-enumeration is already instructed by the pickup checkpoint; the frontmatter pattern is a local, reversible metadata convention affecting a handful of notes. Decided by the Fable reviewer under delegated autonomy (2026-10-04), reversible.

---

## Current state

Re-enumerated on 2026-10-04 after [[KI-ARCADIA-GOV-003-index-note-review|GOV-003]] delivered. The three-act tree lives at `Pillars/Philosophy/` with `Introduction/` (Background, Concept), `Model/` (Conventions, Processes, Activities, Agents, Tools) and `Realisation/` (Arcadia, Charter, Council, Integrations, Configuration). Every folder now has a same-name index note, and each chapter keeps its narrative chapter note (`How an Island Takes Shape`, `What Conventions Cover`, `How Change Happens`, `What Keeps an Island Alive`, `Who Acts on the Island`, `How Tools Connect`). The historical folder-note list (including `Introduction/Soon/Soon.md` and `Email/Email.md`) no longer describes the tree and is retired.

- **Reading order.** [[Knowledge Islands]] still walks the three acts in order, but Part II lists the Briefings, Email and Linear activity groups under `Model/Activities/`, which were moved out to Arcadia's Admin Activity notes, and Part III is headed "Knowledge Capital" with links into a retired `Knowledge Capital/` folder rather than the `Realisation/` notes.
- **Link quality.** A shortest-unique resolver over `Pillars/Philosophy/` finds 66 unresolved or ambiguous wikilinks outside the Obsidian templates (whose `YYYY-MM` and landmark links are intentional placeholders): 19 in [[Knowledge Islands]] and the rest spread across 27 notes, mostly `Knowledge Capital/...` paths, retired activity groups, and bare names that now collide (for example `Charter`, `Claude`, `Health Check`, `Knowledge Rebuild`).
- **Prompt notes.** Under `Model/Tools/Claude/Activities/`, only the Constitutional `Conformance.md` uses `card/prompt` with `# Conformance Check - Prompt`; the Tending prompts use `card/note` with a plain title but no cross-link to their definition notes.
- **Storyboard.** `KI-ARCADIA-MOD-001-reading-order.html` describes the earlier `Pillars/Knowledge Islands/` layout. It is a record attachment, not a Live Artifact pair, so it is kept as a dated historical snapshot rather than regenerated.

## Steps

- [x] Refresh [[Knowledge Islands]]: link each act and chapter to its index note, replace the retired activity groups with a pointer to adopted groups in Admin, and re-point Part III and the Conclusion at the `Realisation/` notes.
- [x] Review each chapter note's opening for consistency with its new index note; edit only where it misdescribes the current tree.
- [x] Repair every unresolved or ambiguous wikilink in `Pillars/Philosophy/` outside the Obsidian templates, using shortest-unique paths; where a target was retired, point at its current home or unlink the text.
- [x] Standardise the Claude activity prompt notes on `card/note`, a plain `# X` title and an explicit link to the activity's definition note.
- [x] Label the HTML storyboard link as a historical snapshot.

## Files touched

- `Pillars/Philosophy/Knowledge Islands.md` and the chapter notes as needed.
- Notes under `Pillars/Philosophy/` carrying broken links (about 28 files).
- Prompt notes under `Pillars/Philosophy/Model/Tools/Claude/Activities/`.
- This record.

## Verify

- The shortest-unique resolver reports zero unresolved or ambiguous wikilinks in `Pillars/Philosophy/` outside the Obsidian templates.
- No prompt note under `Model/Tools/Claude/Activities/` carries `card/prompt` or a `- Prompt` title, and each links to its definition note.
- [[Knowledge Islands]] lists only notes and folders that exist, in Introduction -> Model -> Realisation order.
- No em or en dashes introduced; `ki repo audit` (plus `--skill ki-repo-kb` and `--skill ki-repo-kb-streams`) passes; markdown hooks pass on commit.

## Dependencies / blocks

Follows [[KI-ARCADIA-GOV-003-index-note-review|GOV-003]] (index notes, delivered). [[KI-ARCADIA-GOV-002-authoring-layers|GOV-002]] removes layer framing from prose and relies on this record for the prompt frontmatter; neither blocks the other.

## Delegation

One bounded lane may repair links outside [[Knowledge Islands]] and the prompt notes; the coordinator reviews and commits.

---

## Review

### Delivered

The approved boundary: a refreshed [[Knowledge Islands]] entry point in Introduction -> Model -> Realisation order, a review of the chapter-note openings, repair of every unresolved or ambiguous wikilink in `Pillars/Philosophy/` outside the Obsidian templates, standardised Claude prompt notes, and a historical label on the HTML storyboard. Index notes stay with [[KI-ARCADIA-GOV-003-index-note-review|GOV-003]] and layer phrasing with [[KI-ARCADIA-GOV-002-authoring-layers|GOV-002]]. Baseline `5c65c03d9e7b1b3e6aa4405b26a25e607d21d0a9`.

### Change Summary

- **Entry point:** [[Knowledge Islands]] links each act and chapter to its index note, replaces the retired Briefings, Email and Linear blocks with a pointer to adopted positions in the Admin [[Admin/Governance/Charter|Charter]] and Admin Activities, and re-points Part III, the Charter bullet and the Conclusion at the `Realisation/` notes.
- **Chapter openings:** the six narrative chapter notes already describe their chapters accurately and point onward; the new indexes introduce them first, so no opening needed rewriting.
- **Links:** about 70 unresolved or ambiguous links across 30 files now resolve. Retired `Knowledge Capital` paths point at `Admin/Governance/`; bare names duplicated by the Claude prompts (`Health Check`, `Knowledge Rebuild`, `Convergence Check`, `Claude`, `Charter`, `Enactment Process`, `Integrations`) carry a disambiguating path; deleted targets (`Island Skill`, the Email group notes, `Library`, `Types`) point at their current home or are unlinked.
- **Prompt notes:** `Conformance.md` moves from `card/prompt` and `# Conformance Check - Prompt` to `card/note` and a plain title; each Claude prompt with a definition counterpart now opens with "This prompt runs the activity defined in ..." linking that definition. `Scheduled Task Audit` has no definition by design.
- **Dashes:** em dashes on lines in touched files were replaced with ASCII hyphens.
- **Deviation:** one bounded subagent lane repaired 33 links; the coordinator reviewed its diff, fixed eight further ambiguities it surfaced and corrected a stale cache-schema sentence in `AI Automation Patterns`.

### Verification

- The shortest-unique resolver reports `bad 0` across every `Pillars/Philosophy/` note outside `Obsidian/Templates/`.
- No prompt note under `Model/Tools/Claude/Activities/` carries `card/prompt` or a `- Prompt` title; every prompt with a definition links to it.
- No em or en dashes in touched files; `ki repo audit`, `--skill ki-repo-kb` and `--skill ki-repo-kb-streams` PASS; rumdl hook passes on commit.

### Outstanding concerns

- Unlinked prose mentions of `Knowledge Capital` remain in the Conformance and Convergence Check definitions and the Health Check prompt Step 0; they describe a superseded Cowork layout and merit a tending review.
- `Admin/Operations/Activities/Email Activity.md` carries a broken `Philosophy/Activities/Email` link, and `AGENTS.md` two stale paths; both sit outside this record's `Pillars/Philosophy/` boundary.
- `Model/Conventions/Structure/Structure.md` now points its "local governance framing" at the portable Enactment Process note; switch to the Admin process note if Arcadia's own was intended.

### Post-change review

The pillar now reads in one order from a single entry point, and its link graph resolves cleanly, which removes the main obstacle to following that order. Changes were link and metadata repairs plus one entry-point rewrite, so regression risk is confined to link targets, all checked mechanically. Ready for acceptance.

### Mini recap

Entry point refreshed, roughly 70 links repaired, prompt notes standardised, storyboard labelled historical; audits pass. Learning route: duplicate note names between activity definitions and Claude prompts make bare links fragile, so prefer path-qualified links for those names.

---

## Discussion

### Earlier outstanding work (superseded)

The April folder-note inventory, the prompt-frontmatter question, and the pickup checkpoint of 2026-09-27 are resolved into Current state and Decisions above. The checkpoint asked for re-enumeration before creating anything and for structural and editorial work to be separated in the review packet; both are followed.

---

## Adherence

This stream adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Content reaches `Pillars/` or `Resources/` only on user approval of a `ready` proposal.
