---
note_type: stream-roadmap
id: KI-ARCADIA-MOD-004
area: MOD
title: Semantic conventions
kind: investigate
purpose: learning
project: island-model-and-tending
component: model
tags:
  - topic/knowledge-islands
status: ready
priority: low
horizon: now
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-04-28T18:32:31Z
updated_at: 2026-10-07T14:08:03Z
author: Written with Claude
---

# Semantic Conventions Proposal

## Goal

Trial two lightweight note-writing patterns, typed wikilinks and observation-style fact tags, on a handful of roadmap records, and decide from the evidence whether either is worth keeping. The outcome is a keep or drop recommendation, not an island-wide convention.

---

## Context

Wikilinks in the island are untyped: `[[Note Name]]` says that two notes are related but not how. Key facts sit inside prose, so retrieving every decision or risk means reading whole notes. Two patterns could add semantic richness without any tooling change:

- **Typed wikilinks** - a short list of `- relation [[Target]]` lines that states the relationship, making the graph queryable by relation. Most useful in `Streams/`, where implementation and supersession matter.
- **Observation-style fact tagging** - key facts written as categorised list items, for example `- [decision] Chose X over Y because Z` or `- [risk] Dependency on external API`, so a grep can retrieve every decision or risk without reading prose.

Both would affect every note if adopted, so the bar is high. A bounded trial in non-canonical records is the cheapest way to learn whether they help retrieval or only add noise.

---

## Boundary

- The trial touches at most five records in `Streams/Roadmap/` and this record. No `Admin/`, `Pillars/`, `Resources/` or `Calendar/` note is changed, and no convention note is written until the trial is evaluated.
- Typed-link lines supplement, never replace, the `blocks` and `blocked_by` frontmatter, which remain the authoritative dependency fields.
- No change to shared skills; any island-wide or estate-wide adoption would be a handoff to `ki-repo-kb` in `ki-agentic-harness`, raised only after a keep recommendation is accepted.
- Records being actively edited by another session, and records with status `done`, are excluded from the trial.

---

## Current state

- Apart from the examples quoted in this record, no record in `Streams/Roadmap/` uses typed-link lines or `[decision]`, `[risk]`, `[fact]` or `[question]` markers at planning time.
- Relationships between records are expressed in `blocks` and `blocked_by` frontmatter and in `## Dependencies / blocks` prose.
- `ki repo audit --skill ki-repo-kb-streams --repo . --progress never` is the gate that must keep passing on every trial record.

---

## Steps

- [ ] Select up to five non-done records with real relationships to other records or notes, preferring ones with substantive Discussion; list them with their IDs in this record's Discussion before editing any.
- [ ] In each selected record add typed-link lines in `## Dependencies / blocks` using only the trial vocabulary `implements`, `informs` and `supersedes`, in the form `- informs [[Target]]`.
- [ ] In each selected record tag existing key facts in `## Context` or `## Discussion` with only the trial vocabulary `[decision]`, `[risk]`, `[fact]` and `[question]`, in the form `- [decision] ...`; never inside `## Steps`, where items must remain task-list checkboxes.
- [ ] Run `ki repo audit --skill ki-repo-kb-streams --repo . --progress never` after editing each record and revert any change that breaks it.
- [ ] Exercise retrieval: run `grep -rn -- '- \[decision\]' Streams/Roadmap` and `grep -rn -E -- '^- (implements|informs|supersedes) \[\[' Streams/Roadmap`, and note whether the results answer a realistic question faster than reading the records.
- [ ] Write a `### Trial evaluation` section in Discussion with the records trialled, the retrieval evidence, the authoring cost observed, any rendering issue in Obsidian, and a keep or drop recommendation for each pattern.
- [ ] If either pattern is recommended for keeping, say in the evaluation that island-wide adoption would need a `ki-repo-kb` handoff to `ki-agentic-harness`; do not raise it until Kris accepts the recommendation.

---

## Files touched

- Up to five records in `Streams/Roadmap/`, named in Discussion before editing
- this record

---

## Verify

- Discussion lists the trialled records, and each listed record contains at least one typed-link line and one fact tag from the trial vocabularies only.
- No file outside `Streams/Roadmap/` changed: `git diff --name-only <baseline>..HEAD` lists only roadmap records.
- `ki repo audit --skill ki-repo-kb-streams --repo . --progress never` PASS.
- `ki repo audit --progress never` PASS.
- `### Trial evaluation` exists with an explicit keep or drop recommendation per pattern.

---

## Dependencies / blocks

No dependency. A keep recommendation would lead to a separate handoff to `ki-repo-kb` in `ki-agentic-harness` under the cross-repository convention; that handoff is not part of this record.

---

## Documentation impact

### Decision Records

None during the trial. A keep recommendation adopted island-wide might warrant a KDR recording the convention choice.

### Specifications

None. The `ki-work-roadmap` record format is unchanged; trial lines sit inside existing sections.

### Guides

None until the trial is evaluated; a convention note follows only on an accepted keep recommendation.

### Roadmap

This record carries the trial evaluation and moves to awaiting-review on delivery. Any adoption becomes a new record or harness handoff.

---

## Discussion

### Decisions under delegated autonomy

- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: the trial runs only in non-canonical `Streams/Roadmap/` records, at most five.
- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: typed-link vocabulary is `implements`, `informs` and `supersedes`; fact-tag vocabulary is `[decision]`, `[risk]`, `[fact]` and `[question]`.
- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: no convention note until the trial is evaluated; island-wide adoption would be a `ki-repo-kb` handoff to the harness.

### Why roadmap records

The original idea named `Streams/` as the place where typed relations matter most. Roadmap records are non-canonical, are already audited by `ki-repo-kb-streams`, and are pruned after acceptance, so a failed trial leaves little residue.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
