---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-026
area: GOV
title: Create the Initiative and Project registry
theme: governance
horizon: now
status: awaiting-review
blocks: []
blocked_by: []
baseline_ref: 0957cf80670fb5bb47c0dd2c46c3a51532c79fdb
created_at: 2026-10-07T12:20:00Z
updated_at: 2026-10-07T12:35:32Z
---

# Create the Initiative and Project Registry

## Goal

Arcadia holds the territory's Initiative and Project registry in `Streams/Projects/`: one note per Project, a Projects index and an Initiatives index. Each Project note carries its outcome, lifecycle, lead and update, takes over its theme checkpoint, and names the open records that belong to it.

## Context

The roadmap model of 2026-10-07 (`~/.local/state/ki/state-of-play/design/roadmap-model.md`, section 3) replaces per-repository `theme` values with a territory registry. An **Initiative** is a long-lived direction. A **Project** is a finite outcome with a lead, target, health and lifecycle (`planned`, `active`, `paused`, `completed`, `cancelled`). Upkeep never finishes, so it is projectless and names its Initiative directly.

Kris's decisions of the same day (`decisions.md` beside it) accept every recommendation, including:

- the registry is Project notes in Arcadia `Streams/Projects/` with an Initiatives index (decision 1, item 6);
- recurring work declares `initiative` and has no Project (decision 3);
- each Project note takes over its theme checkpoint - outcome, health, update narrative and Ideas - and the checkpoints are then removed (decision 4);
- in prose, "project repository" is the repository shape and "Project" the registry entry (decision 5).

The registry is migration step 5 in that model. The portable Project-note schema and checker belong to the harness, captured in parallel in `ki-agentic-harness`; this record creates the Arcadia instance.

## Boundary

- **In scope.** `Streams/Projects/` with ten Project notes, `Projects.md` and `Initiatives.md`; a Projects section in `Streams/Streams.md`; checkpoint content carried into the five seeded Project notes.
- **Out of scope.** Editing any member record, in Arcadia or elsewhere: tagging records with `project` or `initiative` is the migration phase. Removing or editing any checkpoint, including `+/_CHECKPOINTS/techne.md` and `state-of-play.md`. Any change in `Admin/`, `Pillars/` or `Resources/`. The harness schema, checker and `ki roadmap list --by project`. Activity notes, which declare `initiative` in the migration phase.

## Current state

There is no `Streams/Projects/` folder. Theme state lives in seven checkpoints under `+/_CHECKPOINTS/`: `baseline`, `delta-evaluation`, `estate-factorisation`, `paperclip-bootstrap-and-recovery`, `territories-and-trades`, `techne` (owned by the active Techne thread) and `state-of-play` (the cross-theme review). The theme map (`~/.local/state/ki/state-of-play/theme-map.json`, 79 open records) and `~/.local/state/claude-bg/gov-020/themes.report.md` assign records to themes. `ki repo audit --repo .` passes all 24 skills before this change.

## Design

### Registry layout

```text
Streams/
  Projects/
    Projects.md                          # folder index
    Initiatives.md                       # Initiatives index
    baseline-rollout.md                  # one note per Project, named by slug
    ...
```

**Initiatives index in `Streams/Projects/`.** The Initiatives index sits beside the Project notes rather than in `Streams/` or its own folder. Initiatives have no notes of their own: an Initiative is the grouping of its Projects plus its projectless work, so it belongs with the Projects it groups. One folder gives runtime registry discovery a single path to read; a separate `Streams/Initiatives/` folder would hold only its own index. Kept in `Streams/` root it would sit beside the zone index as a stray note.

**File names are slugs.** The model names Project notes `Streams/Projects/<slug>.md` so the checker can resolve a record's `project` value to a path.

**Note types.** `streams/project` for Project notes, `streams/initiatives` for the Initiatives index and `streams/index` for `Projects.md`, following the standard's `streams/zone` notation. If the harness schema settles different names, the migration phase renames them.

### Initiatives and Projects

Exactly those in the model's section 3:

| Initiative | Slug | Projects | Projectless work |
| --- | --- | --- | --- |
| Platform foundations | `platform-foundations` | `baseline-rollout`, `estate-factorisation` | Standards upkeep |
| Techne | `techne` | `agent-host`, `paperclip-bootstrap-and-recovery`, `delta-evaluation` | - |
| Knowledge Islands model | `knowledge-islands-model` | `island-model-and-tending`, `territories-and-trades`, `knowledge-acquisition`, `specifications` (paused), `website` (paused) | - |
| Rig | `rig` | - | Workstation hygiene |

Standards upkeep and workstation hygiene are described in the Initiatives index, with their open records, not as Projects.

### Project note shape

Frontmatter: `note_type`, `slug`, `title`, `outcome`, `initiative`, `lifecycle`, `lead` (Kris Brown), `target` (null where unknown), `updated`, `author`. Body:

- **Outcome** - what finishing means, and how it is tested.
- **Update** - health with its basis, the current decision and its test, the facts it needs, and one next step. Health is a stated judgement for Kris to confirm, never inferred from record counts.
- **Constraints** - standing decisions carried from the checkpoint, where it has them.
- **Open records** - IDs and titles only, linked to their owning repository. Status stays in the records, so the note is not a second status source. Membership is classification, not authority: each owning repository decides whether its record joins when the migration tags it.
- **Ideas** - untracked ideas, never owning state.
- **Sources** - the checkpoint and revision it was seeded from.

Arcadia records use wikilinks. Records in other `knowledgeislands` repositories use relative links that resolve in the local checkout layout, as the checkpoints do. chezmoi records are named by ID only.

### Seeding

| Project | Seeded from | Lifecycle |
| --- | --- | --- |
| `baseline-rollout` | `baseline.md` | active |
| `estate-factorisation` | `estate-factorisation.md` | active |
| `agent-host` | links to `techne.md`; nothing copied | active |
| `paperclip-bootstrap-and-recovery` | `paperclip-bootstrap-and-recovery.md` | active |
| `delta-evaluation` | `delta-evaluation.md` | active |
| `island-model-and-tending` | theme map and member records | active |
| `territories-and-trades` | `territories-and-trades.md` | planned |
| `knowledge-acquisition` | theme map and member records | active |
| `specifications` | theme map and member records | paused |
| `website` | theme map and member records | paused |

Where the theme objective was ongoing ("keep coherent and current"), the Project outcome is restated as a finite one bounded by its current records, for Kris to confirm.

### Enactment

This change touches no canonical zone: every new or changed file is under `Streams/`, which is operational, and no `Admin/`, `Pillars/` or `Resources/` note changes. The Enactment Process gate is therefore not triggered by zone. The work still runs through this record because the model calls the registry a governed migration step and Kris approved it as an outcome. The Charter's territorial authority already covers an Arcadia-owned registry, so neither the Charter nor Known Lands changes.

The `ki-repo-kb-streams` structure standard lists only `Roadmap/` and a reserved `Trades/` under `Streams/`. Adding `Projects/` ahead of the harness standard is a known, temporary divergence that the parallel harness record closes.

### Checkpoints after acceptance

Kept until Kris accepts this record. Then remove, by explicit owner approval: `+/_CHECKPOINTS/baseline.md`, `delta-evaluation.md`, `estate-factorisation.md`, `paperclip-bootstrap-and-recovery.md` and `territories-and-trades.md`. `techne.md` stays with the Techne thread; `state-of-play.md` becomes the Initiatives review under decision 4 and is not removed here.

## Steps

- [x] Create `Streams/Projects/Projects.md` and `Streams/Projects/Initiatives.md`.
- [x] Create the ten Project notes, seeding the five checkpoint-backed notes from their checkpoints and linking `agent-host` to `techne.md`.
- [x] Name each Project's open records from the theme map, refreshed against current record status, omitting records now done.
- [x] Add a Projects section to `Streams/Streams.md`.
- [x] Run `ki repo audit --repo .` and `rumdl check`; check for en-dashes and em-dashes in added lines.
- [x] Complete the review packet and move this record to `awaiting-review`.

## Files touched

- `Streams/Projects/Projects.md` (new)
- `Streams/Projects/Initiatives.md` (new)
- `Streams/Projects/agent-host.md`, `baseline-rollout.md`, `delta-evaluation.md`, `estate-factorisation.md`, `island-model-and-tending.md`, `knowledge-acquisition.md`, `paperclip-bootstrap-and-recovery.md`, `specifications.md`, `territories-and-trades.md`, `website.md` (new)
- `Streams/Streams.md`
- This record

## Verify

- `ki repo audit --repo .` passes, or any new finding is explained by the known `Projects/` divergence.
- `rumdl check` reports no issues on `Streams/`.
- Every Project in the model's section 3 has exactly one note, and no upkeep work is a Project.
- Every link in the new notes resolves.
- No en-dash or em-dash appears in any added line, and no checkpoint or member record changes.

## Dependencies / blocks

None blocking. The harness record defining the portable Project-note schema and checker is independent; where its field or note-type names differ, the migration phase conforms these notes.

## Delegation

Delivered by an agent in this repository under Kris's outcome authority of 2026-10-07.

## Documentation impact

### Decision Records

None. Kris's decisions are recorded in the design folder; whether the model warrants an Arcadia Decision Record is migration step 1, not this record.

### Specifications

None.

### Guides

None.

### Roadmap

None beyond this record. Tagging member records is the migration phase.

## Decisions for Kris

Kris Brown, 2026-10-07: approved the roadmap model's recommendations, including the Arcadia registry in `Streams/Projects/`, and asked for the rollout "ASAP". That approval is the outcome authority for capture, adoption, planning and delivery of this record to `awaiting-review`. Acceptance stays with Kris.

## Discussion

### Capture, adoption and planning

Captured, adopted into Now and planned on 2026-10-07 under the outcome authority above. Choices made in planning: the Initiatives index sits in `Streams/Projects/`; note types follow `streams/...` notation; Project notes list open records without status; the four Projects without checkpoints get finite outcomes for Kris to confirm.

## Review

### Delivered

The approved boundary: `Streams/Projects/` with ten Project notes, `Projects.md` and `Initiatives.md`, and a Projects section in `Streams/Streams.md`. No checkpoint, member record or canonical-zone note changed. Baseline `0957cf80670fb5bb47c0dd2c46c3a51532c79fdb` (the ready plan); delivery is the commit that moves this record to `awaiting-review`.

### Change Summary

- `Streams/Projects/Projects.md`: new folder index - Overview plus one section per child.
- `Streams/Projects/Initiatives.md`: new - the four Initiatives with their Projects, the projectless standards-upkeep (15) and workstation-hygiene (8) records, and three records the theme map left unclassified (harness FND-014, OPS-003, RTP-002).
- Five checkpoint-seeded Project notes: `baseline-rollout` (from `d9931d4`), `estate-factorisation`, `paperclip-bootstrap-and-recovery`, `delta-evaluation` (from `53633b2`) and `territories-and-trades` (from `87e160f`). Each carries the checkpoint's objective as Outcome, its current state, decision and next step as Update, its decisions made as Constraints, and its open questions as Ideas or open questions.
- `agent-host`: links to the Techne checkpoint for its update and copies nothing from it.
- Four Projects without checkpoints - `island-model-and-tending`, `knowledge-acquisition`, `specifications` and `website` - have finite outcomes drawn from their records, for Kris to confirm.
- Open records per Project from the theme map, refreshed against current status, with done records omitted: baseline 5, estate 9, Paperclip 11, Techne 3, island model 12, acquisition 4, territories 2, specifications 3, website 2, Delta none.
- `Streams/Streams.md`: a Projects section.

### Verification

- `ki repo audit --repo .` (24 skills): PASS=23, WARN=1, FAIL=0. The warning is `ki-repo-kb-streams` STREAM-1, "unexpected Projects" - the known `Projects/` divergence the parallel harness record closes.
- `bunx rumdl check Streams/`: no issues.
- No en-dash or em-dash in any added or changed line.
- Every wikilink and relative link in the new notes resolves. Four Project slugs share a basename with their checkpoints until those are removed, so their links use `[[Projects/<slug>|<slug>]]`.
- Every Project in the model's section 3 has exactly one note; standards upkeep and workstation hygiene are not Projects.
- `git status` before commit showed only this record, `Streams/Streams.md` and `Streams/Projects/`.

### Outstanding concerns

- **Finite outcomes and health are judgements.** The outcomes of the four non-checkpoint Projects and every health line are for Kris to confirm; island model and acquisition carry no health call.
- **Note-type names are provisional.** `streams/project`, `streams/initiatives` and `streams/index` precede the harness schema; the migration conforms them if the schema differs. `Streams/Streams.md` itself uses `stream-zone`.
- **Paperclip constraints have no other home.** Several exist only in the checkpoint and now this note; the note records the question of their durable owner.
- **Disambiguated links.** Once the checkpoints are removed, the `[[Projects/<slug>|<slug>]]` links can shorten to `[[<slug>]]`.

### Post-change review

The goal is met: the registry exists with exactly the model's Projects and Initiatives, each checkpoint's content is carried into its Project, and records are named without status. Scope held to `Streams/`. Regression risk is low: one existing note gains a section. This review is the implementing agent's own rereading against the model, decisions, checkpoints and audits, not an independent reviewer.

### Mini recap

GOV-026 created Arcadia's Initiative and Project registry in `Streams/Projects/`: ten Project notes, a Projects index and an Initiatives index, seeded from five checkpoints and the theme map. After acceptance, Kris can approve removing the five seeded checkpoints; `techne.md` and `state-of-play.md` stay.

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
