---
note_type: stream-roadmap
id: KI-ARCADIA-OPS-003
area: OPS
title: Page registry
kind: deliver
purpose: upkeep
initiative: platform-foundations
tags:
  - topic/knowledge-islands
  - topic/conventions
status: cancelled
resolution: superseded
resolution_target: KI-HARNESS-GOV-155
priority: medium
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-04-28T20:40:18Z
updated_at: 2026-10-07T17:20:40Z
author: Written with Claude
---

# Page Registry Proposal

## Goal

Hand the shortest-unique wikilink collision problem, with the page-registry design as evidence, to the estate owner of the linking rule, so every Knowledge Base can detect links made ambiguous by a new page rather than Arcadia maintaining its own registry.

## Context

The page registry is a pre-built index mapping every leaf filename to its location or locations, so agents can resolve shortest-unique wikilinks with a lookup instead of scanning the filesystem. Every page is stored, not only collisions, because adding a second page with a previously unique name otherwise silently breaks existing bare links with no way to detect it.

The rule it supports is estate-wide. `ki-agentic-harness` `skills/repo-structure/ki-repo-kb` defines `LINK-1` (shortest-unique Obsidian wikilinks), but `scripts/rubric/items/links.ts` implements it as a judgement-only item over sampled notes: nothing mechanically detects a collision. `tools-ki` has no wikilink code. The problem is live in Arcadia: at planning, 19 leaf names collide among tracked Markdown outside `+/` and `-/`, including `Activities.md` (three paths), `Conformance.md` (three), and `Enactment Process.md`, `Processes.md` and `Governance.md` (two each).

## Boundary

- Arcadia builds no registry file, generation script, Activity or note-creation hook.
- The deliverable is one submitted work trade to `knowledgeislands/ki-agentic-harness` over the declared work route; Arcadia writes no file in the harness or `tools-ki` checkout. The receiver owns disposition, priority, implementer choice and any resulting record.
- No canonical `Admin/`, `Pillars/` or `Resources/` change. No remote operation under the [[Techne Programme Hold]].

## Current state

- `.ki.toml` declares `[skills.ki-trades.routes."knowledgeislands/ki-agentic-harness"]` with `export = ["work", "knowledge"]`.
- `-/_TRADES/` holds only its README; no prior trade for this subject exists, and no harness or `tools-ki` roadmap item mentions a page registry or wikilink collisions.
- The registry design below is sound but its original example tree used retired `Pillars/Admin/...` and `Knowledge Islands/Governance` paths; it is remapped to the current layout in Discussion.

## Steps

- [ ] Re-run the collision census (`git ls-files '*.md' | grep -vE '^(\+|-)/' | awk -F/ '{print $NF}' | sort | uniq -d`) and record the count and the largest sets in Discussion.
- [ ] Prepare one work trade with `ki-trade prepare` for `knowledgeislands/ki-agentic-harness`, citing `KI-ARCADIA-OPS-003` as origin and carrying: the problem (`LINK-1` is judgement-only; collisions are undetected), the census, the registry design and algorithms from Discussion, and the proposal of a mechanical `LINK-1` companion check that flags bare links made ambiguous by a colliding leaf and reports the shortest-unique form, with `tools-ki` suggested as the natural implementer.
- [ ] Submit the trade with `ki-trade submit <TRD>` and record its `TRD-` identity in Dependencies / blocks and Discussion.
- [ ] Prepare the review packet and set the record to `awaiting-review`.

## Files touched

- `-/_TRADES/knowledgeislands/ki-agentic-harness/TRD-<hex>.md` (new, sender-owned).
- This record.

## Verify

- `-/_TRADES/knowledgeislands/ki-agentic-harness/TRD-<hex>.md` exists with `phase: submitted` and names `KI-ARCADIA-OPS-003` as origin.
- `ki repo audit --skill ki-trades --repo . --progress never` PASS.
- `git diff --name-only <baseline_ref>..HEAD` lists only this record and the trade file.
- No commit in `ki-agentic-harness` or `tools-ki` originates from this delivery.
- `ki repo audit --progress never` PASS.

## Dependencies / blocks

No local build-order dependency. The trade is non-blocking: this record closes once the trade is submitted, and the receiver schedules any resulting work in its own horizon. Reciprocity is carried by the trade identity recorded here and by the receiver's `transferred_from` on any record it creates, not by `blocks` or `blocked_by`, which the work-roadmap standard reserves for local build order and which must never hold trade identities.

## Documentation impact

### Decision Records

None. Arcadia makes no architectural choice; whether to add a mechanical check is the receiver's decision.

### Specifications

None in Arcadia. Any linking-rule contract change belongs to the harness `ki-repo-kb` standard and is the receiver's call.

### Guides

None. Arcadia authoring guidance already defers link rules to `ki-repo-kb`.

### Roadmap

Adds one outbound work trade to `ki-agentic-harness`. No further Arcadia item is expected unless the receiver declines and Arcadia later wants a local mitigation.

## Cancelled

Approved by Kris on 2026-10-07 under decision 13 of the state-of-play design ("Yes please, lets reduce stuff": cancel and prune obsolete or ownerless records).

The deliverable was a work trade, and trades are on hold (decision 11). The live defect, that nothing mechanically detects wikilink leaf-name collisions, is recorded directly in the receiving repository as KI-HARNESS-GOV-155 in `knowledgeislands/ki-agentic-harness` (`docs/roadmap/KI-HARNESS-GOV-155-detect-wikilink-name-collisions.md`). Arcadia still has colliding leaf names to repair once the check exists.

## Discussion

### Decisions under delegated autonomy

Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: the capability is estate-wide, so Arcadia does not build a committed registry; the Arcadia deliverable is a handoff to `ki-agentic-harness` carrying the design as evidence, with `tools-ki` named as the natural implementer.

Planning correction (2026-10-05): the triage proposed raising an item directly in `ki-agentic-harness/docs/roadmap/` with reciprocal `blocks`/`blocked_by`. `ki-trade` operates only the sender's side and never writes a peer checkout, and the standard forbids trade identities in `blocks`/`blocked_by`, so the handoff is a submitted trade and reciprocity is by trade identity and `transferred_from`.

### Owner question resolved (2026-10-05)

The 2026-10-04 question (a committed registry here, or capability in `tools-ki`) is resolved by the delegated decision above: no Arcadia registry; the capability is handed to the estate owner of `LINK-1`.

### Registry design (trade evidence)

Serialisation uses two sentinel values. An **array** marks a unique entry and lists the parent path from immediate parent to repository root. **`"*"`** marks a node that appears under every instance of its parent; rather than enumerating parent instances, the serialiser records the parent name and defers resolution to the parent's entry, so a `"*"` value is never resolved directly.

Mapping (path to shortest link): look up the leaf; an array entry yields `[[Leaf]]`; an object entry yields `[[Prefix/Leaf]]` with the minimum prefix that distinguishes this instance.

Mutating (new page): not found inserts a top-level array entry and uses `[[Leaf]]`; found as an array converts the entry to an object, flags every existing `[[Leaf]]` link for review because it is now ambiguous, and uses the disambiguated form; found as an object adds a further keyed entry.

Implementation notes: an ES `Map` keyed by filename gives constant-time lookup; the JSON form is compact and a full Arcadia registry is likely under 4 KB. A full rebuild is the source of truth after bulk moves or renames, with incremental mutation between rebuilds.

### Current-layout example

The original tree showed retired `Pillars/Admin/Governance` and `Knowledge Islands/Governance` paths. At planning the equivalent collisions are:

| Leaf | Paths |
| --- | --- |
| `Activities` | `Admin/Operations/Activities/`, `Pillars/Philosophy/Model/Activities/`, `Pillars/Philosophy/Model/Tools/Claude/Activities/` |
| `Conformance` | `Admin/Governance/`, `Pillars/Philosophy/Model/Activities/Constitutional/`, `Pillars/Philosophy/Model/Tools/Claude/Activities/Constitutional/` |
| `Enactment Process` | `Admin/Operations/Processes/`, `Pillars/Philosophy/Model/Processes/Enactment Process/` |
| `Processes` | `Admin/Operations/Processes/`, `Pillars/Philosophy/Model/Processes/` |
| `Governance` | `Admin/Governance/`, `Pillars/Philosophy/Introduction/Concept/Governance/` |

A bare `[[Enactment Process]]` in older records is exactly the silent ambiguity the registry was designed to catch.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
