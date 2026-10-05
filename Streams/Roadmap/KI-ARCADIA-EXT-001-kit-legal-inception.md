---
note_type: stream-roadmap
id: KI-ARCADIA-EXT-001
area: EXT
title: Kit Legal inception
theme: ecosystem-adoption
tags:
  - topic/knowledge-islands
status: ready
priority: medium
horizon: now
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-04-27T19:18:58Z
updated_at: 2026-10-05T12:00:00Z
author: Written with Claude
---

# Kit Legal Inception Proposal

## Goal

Close the original `kit-legal` inception proposal honestly: show, step by step, which outcomes now exist in `kit-legal` and which steps were superseded by its establishment as an independent territory, so the owner can accept or redirect the record.

## Context

The proposal (April 2026) treated `kit-legal` as a satellite island of the Kit archipelago, to be mounted in Cowork and bootstrapped into the Knowledge Islands model by Arcadia. That premise no longer holds. `kit-legal` now carries its own `.ki.toml`, `AGENTS.md`, `CLAUDE.md`, `Admin/Governance/` and Streams roadmap, and its Charter declares Legal an independently governed territory with `krisb/kit-legal` as its own Capital. The 2026-09-27 pickup checkpoint asked for each original step to be reconciled against the current layout before any change; this record is that evidence-reconciliation pass.

The original six steps were: (1) add `kit-legal` to the Cowork project; (2) review existing content and structure; (3) create `Pillars/Admin/Governance/` with Identity, Physical Locations, Routing Rules, Glossary and Governance instance; (4) create or update `CLAUDE.md` for the Knowledge Islands model; (5) create `Pillars/Philosophy/Known Lands.md`; (6) link back to Arcadia concepts where relevant.

## Boundary

- Read-only inspection of `kit-legal`; no file in `kit-legal` is changed, and no matter or case content is quoted in this record, only governance paths.
- No Arcadia canonical change. Adding a public Arcadia Known Lands signpost to the private Legal territory is excluded and remains the owner's call.
- Whether `kit-legal` signposts Arcadia is `kit-legal`'s own choice and is not requested.
- No remote operation under the [[Techne Programme Hold]].

## Current state

Observed at planning, `kit-legal` HEAD `3967919f` (2026-10-04), resolved through the `ki` registry at `/Users/krisbrown/workspaces/kit/legal/kit-legal`:

- `ki repo audit --progress never` in `kit-legal`: PASS, 24 skills.
- `Admin/Governance/` holds `Charter.md`, `Conformance.md`, `Conventions/`, `Decisions/`, `Governance.md`, `Known Lands.md`, `Note Templates/` and `Policies/`.
- `Admin/Governance/Charter.md` § Territory: Legal is an independently governed territory and `krisb/kit-legal` is its Capital.
- `Admin/Governance/Known Lands.md` § External signposts lists only Equal Remedy (`equalremedy/er-research`).
- `CLAUDE.md` imports `AGENTS.md`.
- Arcadia is referenced from `Admin/Operations/Activities/File System Granola Import Activity.md`, `Admin/Governance/Policies/Claude Operating Rules Policy.md` and `Admin/Governance/Conventions/Admin Conventions/Skills Conventions.md`.
- The working tree carries unrelated uncommitted matter edits from other sessions; this record must leave them untouched.

## Steps

- [ ] Re-ground `kit-legal` read-only: record HEAD and `git status --short` before inspection, and re-run `ki repo audit --progress never` there.
- [ ] Step 1 (Cowork mount): disposition as dropped by owner decision (Kris, 2026-10-05: "we don't bother with COWORK.md"); no Cowork mount or `COWORK.md` check is made.
- [ ] Step 2 (review): record the `kit-legal` audit result as evidence.
- [ ] Step 3 (`Pillars/Admin/Governance/`): disposition as superseded by `Admin/Governance/`; list the governance surface present and note that Identity, Physical Locations, Routing Rules and Glossary were replaced by the Charter and Known Lands model.
- [ ] Step 4 (`CLAUDE.md`): record `CLAUDE.md` and `AGENTS.md` as evidence.
- [ ] Step 5 (`Pillars/Philosophy/Known Lands.md`): disposition as superseded by `Admin/Governance/Known Lands.md`.
- [ ] Step 6 (links to Arcadia): disposition the satellite premise as superseded by the independent territory; cite the existing Arcadia references; record that the external signpost set (Equal Remedy only) is `kit-legal`'s choice.
- [ ] Write the six-row evidence table into Discussion, confirm `kit-legal` HEAD and status are unchanged by this delivery, prepare the review packet and set the record to `awaiting-review`.

## Files touched

- This record only.

## Verify

- Discussion holds a six-row table in which every step has a `kit-legal` evidence path or a superseded disposition.
- `ki repo audit --progress never` in `kit-legal` PASS, and its HEAD and `git status --short` match the pre-inspection capture.
- `git diff --name-only <baseline_ref>..HEAD` in Arcadia lists only this record.
- `ki repo audit --progress never` in Arcadia PASS.

## Dependencies / blocks

No dependency. The former waiting-for condition (Arcadia governance stable enough to serve as baseline, and `kit-legal` setup) is discharged by the evidence above. Closure through `ki-accept` needs the owner's acceptance; nothing in this plan writes to `kit-legal`.

## Documentation impact

### Decision Records

None. The territorial status is already declared in `kit-legal`'s Charter; Arcadia records no decision about another territory.

### Specifications

None. No behaviour-level contract changes.

### Guides

None in Arcadia.

### Roadmap

Closes this inception record on acceptance. Any follow-up `kit-legal` work belongs in its own roadmap; the excluded Arcadia Known Lands signpost would be a separate owner-requested record.

## Discussion

### Decisions under delegated autonomy

Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: the waiting-for blocker is no longer live and the satellite-bootstrapped-by-Arcadia premise is superseded by Legal's independent territory, so the remaining work is an evidence-reconciliation pass with superseded steps dispositioned rather than recreated.

Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: adding a public Arcadia Known Lands signpost to the private Legal territory is excluded from this record.

### Owner decision - 2026-10-05

Kris decided "we don't bother with COWORK.md". The Cowork mount and `COWORK.md` checks are removed from this record's scope: Step 1 is dispositioned as dropped, and no Cowork mount state or `COWORK.md` path is inspected or reported. `kit-legal` is not edited.

### Original framing

Historical local path `~/kis/krisb/kit-legal`; the current checkout is resolved through the `ki` registry. The original Status ("not yet started") was already obsolete at the 2026-09-27 checkpoint.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
