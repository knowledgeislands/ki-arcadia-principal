---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-027
area: GOV
title: Migrate Arcadia to the roadmap model
kind: deliver
purpose: governance
project: roadmap-model
component: streams
horizon: now
status: awaiting-review
blocks: []
blocked_by: []
baseline_ref: ff15cd91cb4d1f74dd38d941f90e7d021cbdd333
created_at: 2026-10-07T14:03:00Z
updated_at: 2026-10-07T14:12:00Z
---

# Migrate Arcadia to the Roadmap Model

## Goal

Arcadia works under the roadmap model: its Initiatives have their own notes with a review, the rollout has its own Project, every open record and live Activity carries its classification instead of a theme, and the theme checkpoints are gone.

## Context

The roadmap model of 2026-10-07 (`~/.local/state/ki/state-of-play/design/roadmap-model.md`) replaces `theme` with `kind`, optional `purpose`, a territory `project` or `initiative`, and a repository `component`. Kris's decisions of the same day (`decisions.md` beside it) settle the rest:

- decision 3: Activities declare `initiative`, and optionally `component` and `purpose`;
- decision 6: outcome authority for the whole rollout, through to `done`;
- decision 7: every migration proposal in `migration-proposals.json` is accepted, including a new Project `roadmap-model` under Platform foundations;
- decision 8: Initiatives get their own folder, `Streams/Initiatives/`, with one note per Initiative and a review section that replaces the state-of-play review; `Streams/Projects/Initiatives.md` goes.

[[KI-ARCADIA-GOV-026-create-the-initiative-and-project-registry|KI-ARCADIA-GOV-026]] created the registry with the Initiatives index inside `Streams/Projects/`, before decision 8. This record carries decision 8 and the rest of Arcadia's migration so that GOV-026 can close on what it delivered. The harness standard v1 (`ki-agentic-harness` KI-HARNESS-GOV-149, GOV-150 and GOV-151) defines the Initiative note, the work-item fields and the migration tolerance window.

## Boundary

- **In scope.** `Streams/Initiatives/`; the `roadmap-model` Project note; `Streams/Projects/Projects.md` and `Streams/Streams.md`; frontmatter of every open record in `Streams/Roadmap/`; the Tending and Briefings Activity notes; `.ki.toml`; the ledger and the Roadmap index; the five theme checkpoints and one line in `+/_CHECKPOINTS/state-of-play.md`.
- **Out of scope.** Record bodies beyond what a closure requires; done records, which keep their retired fields until pruned; the five paused Activities, which spawn no runs and stay untagged; `+/_CHECKPOINTS/techne.md` and anything in the Techne repositories; any other canonical `Admin/`, `Pillars/` or `Resources/` content; pruning.

## Current state

Twenty-one open records carry `theme`, and seven also carry the retired `candidate`. GOV-021 and GOV-024 use `horizon: triage`, which is now a status. `Streams/Projects/Initiatives.md` holds the four Initiatives and the projectless upkeep and hygiene records. Five theme checkpoints duplicate the Project notes GOV-026 seeded from them; none has changed since. `.ki.toml` declares no component vocabulary. `ki repo audit` passes all 24 skills.

## Design

### Initiatives folder

`Streams/Initiatives/` holds `Initiatives.md` (`note_type: streams/index`, the folder index) and four Initiative notes named by slug: `platform-foundations`, `techne`, `knowledge-islands-model` and `rig`. Each follows the harness Initiative note: `note_type: streams/initiative`, `slug`, `title`, `direction`, `lifecycle: active` and `lead`, then `## Direction`, `## Projects`, `## Upkeep`, `## Activities` and `## Review`. The content of `Streams/Projects/Initiatives.md` moves into these notes and the file is removed. The Review sections start from the state-of-play review's current judgement for each Initiative.

### Roadmap model Project

`Streams/Projects/roadmap-model.md` under Platform foundations holds KI-HARNESS-GOV-149, KI-HARNESS-GOV-150, KI-TOOL-CLI-112 and KI-ARCADIA-GOV-026 (decision 7), and this record. It completes when the checker enforces the model.

### Records

The mechanical pass removes `theme` and `candidate` and adds the approved `kind`, `purpose`, `project` or `initiative`, and `component` from the proposals. GOV-021 and GOV-024 become `status: triage` with no horizon. Each migrated record's `updated_at` advances. GOV-010's approved closure is superseded by an estate-factorisation record that does not yet exist, so it migrates its fields and stays open; it closes when that record exists to name as target. OPS-002 closes as cancelled, resolution obsolete, as approved.

### Activities

Tending and Briefings gain `initiative: knowledge-islands-model`, `component: operations` and `purpose: upkeep`. Their runs take the default `kind: audit`, so neither declares it.

### Configuration and ledger

`.ki.toml` gains `[skills.ki-work-roadmap]` with the issued areas and the approved component vocabulary. The ledger's Theme column is removed; areas stay as issued.

### Checkpoints

Remove `baseline.md`, `delta-evaluation.md`, `estate-factorisation.md`, `paperclip-bootstrap-and-recovery.md` and `territories-and-trades.md` from `+/_CHECKPOINTS/` under the `ki-checkpoint` remove procedure, after confirming their content is in the Project notes. `state-of-play.md` gains one line pointing to the Initiatives review; `techne.md` is untouched.

### Enactment

The Activity notes are in `Admin/`, a canonical zone. This record is the Enactment proposal for them: the change is exactly the three classification fields above on two notes, with no change to their bodies, schedules or realisation.

## Steps

- [x] Create `Streams/Initiatives/` with its index and four Initiative notes; remove `Streams/Projects/Initiatives.md`.
- [x] Add the `roadmap-model` Project note; update `Projects.md`, `Streams.md` and the Project notes' Initiative links.
- [x] Migrate the open records' frontmatter and the two Activities.
- [x] Declare the component vocabulary in `.ki.toml`; remove the ledger Theme column; update the Roadmap index.
- [x] Remove the five theme checkpoints; add the pointer line to `state-of-play.md`; shorten the `[[Projects/<slug>|<slug>]]` links that become unique.
- [x] Run the checks below; complete the review packet.

## Files touched

- `Streams/Initiatives/` (new): `Initiatives.md`, `platform-foundations.md`, `techne.md`, `knowledge-islands-model.md`, `rig.md`
- `Streams/Projects/Initiatives.md` (removed), `Streams/Projects/roadmap-model.md` (new), `Streams/Projects/Projects.md` and Project notes
- `Streams/Streams.md`, `Streams/Roadmap/Roadmap.md`, `Streams/Roadmap/_ISSUES.md`
- Open records in `Streams/Roadmap/`
- `Admin/Operations/Activities/Tending Activity.md`, `Admin/Operations/Activities/Briefings Activity.md`
- `.ki.toml`
- `+/_CHECKPOINTS/baseline.md`, `delta-evaluation.md`, `estate-factorisation.md`, `paperclip-bootstrap-and-recovery.md`, `territories-and-trades.md` (removed); `+/_CHECKPOINTS/state-of-play.md`

## Verify

- `ki repo audit --progress never` reports no failure.
- `bunx rumdl check` reports no issues on the changed files.
- No open record carries `theme` or `candidate`, and each carries its approved classification.
- Every link in changed notes resolves.
- No en-dash or em-dash appears in any added line.

## Dependencies / blocks

None blocking. The harness Initiative note and checker (KI-HARNESS-GOV-151) define the shape this record follows.

## Delegation

Delivered by an agent in this repository under decision 6.

## Documentation impact

### Decision Records

None. Kris's decisions are recorded in the design folder.

### Specifications

None.

### Guides

None.

### Roadmap

The Roadmap index and ledger lose their theme references.

## Review

### Delivered

The approved boundary: the Initiatives folder, the `roadmap-model` Project, classification of every open record and of the Tending and Briefings Activities, the component vocabulary, the ledger and Roadmap index, and retirement of five theme checkpoints. Done records, record bodies, paused Activities, `techne.md` and pruning were left alone. Baseline `ff15cd91cb4d1f74dd38d941f90e7d021cbdd333` (the ready plan); delivery is the commit that moves this record to `awaiting-review`.

### Change Summary

- `Streams/Initiatives/`: new folder index and four Initiative notes (`streams/initiative`), each with Direction, Projects, Upkeep, Activities and a Review dated 2026-10-07 drawn from the Project notes and the state-of-play review. The content of `Streams/Projects/Initiatives.md` moved here; that file is removed. The three records it left unclassified now sit under Platform foundations upkeep as the proposals classify them, except the cancelled RTP-002; the cancelled harness OPS-001 leaves the Rig list.
- `Streams/Projects/roadmap-model.md`: new Project under Platform foundations. `Projects.md` gains its section and points to the Initiatives folder; every Project note links its Initiative note, and the `[[Projects/<slug>|<slug>]]` links shorten to `[[<slug>]]`.
- `Streams/Streams.md`: an Initiatives section; the Projects section narrows to Projects.
- Twenty-one open records: `theme` and `candidate` removed; `kind`, and where approved `purpose`, `project` or `initiative`, and `component` added; GOV-021 and GOV-024 become `status: triage` without a horizon; `updated_at` advances on each.
- `Admin/Operations/Activities/Tending Activity.md` and `Briefings Activity.md`: `initiative`, `component` and `purpose` added; nothing else changes. This is the Enactment change this record proposed.
- `.ki.toml`: `[skills.ki-work-roadmap]` with the issued areas and the approved components.
- `Streams/Roadmap/_ISSUES.md`: Theme column removed. `Streams/Roadmap/Roadmap.md`: classification and cancellation described.
- `+/_CHECKPOINTS/`: `baseline`, `delta-evaluation`, `estate-factorisation`, `paperclip-bootstrap-and-recovery` and `territories-and-trades` removed; `state-of-play.md` gains one line pointing to the Initiatives review.

### Verification

- `ki repo audit --progress never`: PASS on 25 skills, no warnings. `ki-work-roadmap` is now selected by the new table.
- The roadmap checker on a scratch non-Knowledge-Base copy of `Streams/Roadmap/`, with Knowledge Base-only fields stripped: no classification or state finding on any open record. Its remaining findings are the Knowledge Base record body layout (a `## Governance` footer after Discussion, prose Steps), title length and ledger shape, all present before this change, and retired-field warnings on the three done records left out of scope.
- `bunx rumdl check` on every changed Markdown file: no issues.
- No en-dash or em-dash in any added line.
- Every wikilink and relative link added or changed resolves uniquely; the unresolved links found are in untouched record bodies and code examples.
- Checkpoint content: each removed checkpoint's objective, state, decisions, open questions and next step were compared with its Project note and are present there.

### Outstanding concerns

- **GOV-010 stays open.** Its approved closure as superseded needs the estate factorisation record as target, and none exists yet; it closes when that record exists.
- **`techne.md` links to the removed `baseline.md`.** That checkpoint belongs to the active Techne thread and was not touched; the thread should update or drop the link.
- **Reviews are first judgements.** Each Initiative Review restates existing judgements and open decisions; Kris has not yet reviewed them.

### Post-change review

The goal is met: the Initiatives have their own notes and Review, the rollout has its Project, every open record and live Activity is classified without a theme, and the theme checkpoints are retired with nothing lost. Scope held to the planned files. Regression risk is low: frontmatter-only record changes, and the audit passes. This review is the implementing agent's own rereading against the model, decisions and audits, not an independent reviewer.

### Mini recap

GOV-027 moved Arcadia onto the roadmap model: an Initiatives folder with four reviewed Initiative notes, a `roadmap-model` Project, classified records and Activities, a declared component vocabulary, and five theme checkpoints retired. GOV-010 waits for its target record, and the Techne checkpoint needs one link fixed by its thread.

## Discussion

### Capture, adoption and planning

Captured, adopted into Now and planned on 2026-10-07 under decision 6: "you can just carry it all the way through". The follow-up record exists because GOV-026's delivered layout predates decision 8, and its review evidence should stay true to what it delivered.
