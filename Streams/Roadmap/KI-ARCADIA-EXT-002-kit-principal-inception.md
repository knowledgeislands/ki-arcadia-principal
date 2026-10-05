---
note_type: stream-roadmap
id: KI-ARCADIA-EXT-002
area: EXT
title: Kit Principal inception
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
updated_at: 2026-10-05T08:17:56Z
author: Written with Claude
---

# Kit Principal Inception Proposal

## Goal

Close the original `kit-principal` inception proposal honestly: disposition each row of its Items table against what `kit-principal` now holds, so the owner can accept or redirect the record.

## Context

The proposal (April 2026) listed content `kit-principal` would need to align with the Knowledge Islands model, to be executed once Arcadia governance was stable. Since then `kit-principal` has become the Capital of the independently governed Personal territory with its own governance surface and roadmap. The 2026-09-27 pickup checkpoint found the Items table reflected an older baseline and its missing-folder claim obsolete, and asked for each row to be explicitly dispositioned rather than recreated.

The original Items table:

| Item | Description | Derives from |
| --- | --- | --- |
| Kit's council membership | Personal context: Kit's role on the Arcadia council, with personal depth held in `kit-principal` | `Pillars/Admin/Governance/Charter.md` |
| Known Lands | Already created (`Pillars/Philosophy/Known Lands.md`); may need enriching once Arcadia governance is stable | `Pillars/Admin/Governance/Known Lands.md` |
| Admin/Governance | `Pillars/Admin/Governance/` needs creating (Identity, Physical Locations, Routing Rules, Glossary, Governance instance) | Phase B.3 output |
| Cross-island links | Notes linking `kit-principal` streams and pillars to Arcadia concepts | Ongoing |

## Boundary

- Read-only inspection of `kit-principal`; no file there is changed. Council membership and other personal content are `kit-principal`-owned and are cited by path, not copied.
- No Arcadia canonical change.
- No remote operation under the [[Techne Programme Hold]].

## Current state

Observed at planning, `kit-principal` HEAD `316a766` (2026-10-04), resolved through the `ki` registry at `/Users/krisbrown/workspaces/kit/personal/kit-principal`:

- `ki repo audit --progress never` in `kit-principal`: PASS, 21 skills.
- `.ki.toml`, `AGENTS.md` and `CLAUDE.md` are present; `Streams/Roadmap/` holds 30 `KIT-` records.
- `Admin/Governance/` holds `Charter.md`, `Conformance.md`, `Conventions/Conventions.md`, `Decisions/` (`GDR-KIT-001`, `DDR-KIT-001`), `Governance.md` and `Known Lands.md`.
- `Admin/Governance/Charter.md` § Territory and Capital: Personal is an independently governed territory with Kit Principal as Capital; the Charter signposts `knowledgeislands/ki-arcadia-principal` as an independently governed territory.
- `Pillars/Knowledge Capital/Known Lands.md` is the personal navigator's chart and carries a section on Kit as a founding Arcadia council member.
- Arcadia's own `Admin/Governance/Charter.md` no longer mentions a council.
- Further Arcadia references appear in `Pillars/Technology/Project Portfolio.md`, `Pillars/Knowledge Capital/Knowledge Capital.md` and `Streams/Roadmap/KIT-001-knowledge-island-workbench.md`, among others.
- The working tree carries unrelated uncommitted edits from other sessions; this record must leave them untouched.

## Steps

- [ ] Re-ground `kit-principal` read-only: record HEAD and `git status --short` before inspection, and re-run `ki repo audit --progress never` there.
- [ ] Council membership: disposition as fulfilled in `kit-principal`-owned personal content at `Pillars/Knowledge Capital/Known Lands.md`; note that the Arcadia-side derivation (`Pillars/Admin/Governance/Charter.md`) no longer exists.
- [ ] Known Lands: disposition the old `Pillars/Philosophy/Known Lands.md` path as superseded by `Admin/Governance/Known Lands.md` (territorial inventory) and `Pillars/Knowledge Capital/Known Lands.md` (personal chart).
- [ ] Admin/Governance: disposition the "needs creating" claim as obsolete, citing the governance surface present, and record that Identity, Physical Locations, Routing Rules and Glossary were replaced by the Charter and Known Lands model.
- [ ] Cross-island links: cite the Charter signpost and the Pillars and Streams notes that reference Arcadia; disposition the "ongoing" item as owned by `kit-principal`'s own roadmap.
- [ ] Write the dispositioned table into Discussion, confirm `kit-principal` HEAD and status are unchanged by this delivery, prepare the review packet and set the record to `awaiting-review`.

## Files touched

- This record only.

## Verify

- Discussion holds the four-row table with each row dispositioned and citing a `kit-principal` path.
- `ki repo audit --progress never` in `kit-principal` PASS, and its HEAD and `git status --short` match the pre-inspection capture.
- `git diff --name-only <baseline_ref>..HEAD` in Arcadia lists only this record.
- `ki repo audit --progress never` in Arcadia PASS.

## Dependencies / blocks

No dependency. The former waiting-for condition (Arcadia governance stable enough to serve as baseline) is discharged. Closure through `ki-accept` needs the owner's acceptance.

## Documentation impact

### Decision Records

None. Territorial status is declared in `kit-principal`'s Charter; Arcadia records no decision about another territory.

### Specifications

None. No behaviour-level contract changes.

### Guides

None. Personal-context guidance is owned by `kit-principal`.

### Roadmap

Closes this inception record on acceptance. Any further alignment work belongs in `kit-principal`'s own roadmap.

## Discussion

### Decisions under delegated autonomy

Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: council membership is `kit-principal`-owned personal content, the Admin/Governance "missing" claim is obsolete, and the remaining work is dispositioning the Items table with evidence rather than creating content.

### Original framing

Historical local path `~/kis/krisb/kit-principal`; the current checkout is resolved through the `ki` registry. The original record followed the then-current Enactment Process note under `Pillars/Philosophy/Model/Processes/`; the live process is `Admin/Operations/Processes/Enactment Process.md`.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
