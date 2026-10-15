---
note_type: streams/index
updated: 2026-10-15T21:20:00Z
author: Written with Claude
---

# Design

## Overview

This folder holds the `ki-pmo-design` artefacts (the skill was `ki-design-loop` while they were produced) for the change-management design in the [[ways-of-working|Ways of working]] Project: how Kris's change management - skills, threads, checkpoints, Initiatives, Projects and records, and the `ki` commands - should be structured now that it has evolved rather than been planned. The artefacts share the slug prefix `change-management` and are temporary: once their outcome is consolidated into a Decision Record, the Project note and the skills the rollout touches, the folder is deleted in one commit.

## Brief

[[change-management-brief]] states the problem, quotes Kris's proposal verbatim, as given at the start of the ways-of-working thread, sets out the established facts with their sources, and gives a numbered reflection with a candidate structure of named units for the independent reviews to agree with, differ from or extend.

## Reviews

Two independent, read-only reviews of the brief, each with its own fact checks, a point-by-point table against the brief's numbered reflection, a proposed model and owner decisions:

- [[change-management-review-fable]] by Fable (Claude) proposes four units plus the design loop, removes the Portfolio unit, the stored opener and the housekeeping rename, and adds corrections on the harness decision records, the refresh rule and the non-durable run-folder history.
- [[change-management-review-astra]] by Astra (Codex) proposes six units, keeps `ki-checkpoint` unchanged, adds a single designated checkpoint writer, three delegation gates and a trial of the `fast` coordinator, and records ten fact checks against the harness, `tools-ki` and this island.

## Report

[[change-management-report]] merges the two reviews into one proposed model of six named units (Work, PMO, Delegation, Continuity, the design loop and Model policy), with corrections to the brief, an agree-and-differ table across all 28 points, a rollout plan with one pilot and eight tagged owner decisions. Every dispute is settled on cited evidence, not by vote; Kris's recorded decisions win wherever they bear on a point. It was amended after the merge under Kris's models-and-naming instruction: a Models and environment section states which models and runtimes produced each stage and what that means for confidence, the loop and PMO gain a model-level floor and a degradation rule, and every proposed name is retested against the rule that a name conveys its purpose at a glance. A Durability and ownership section, added when Kris asked for durability and ownership to be settled, gives each kind of owner decision one durable home, classifies this folder's artefacts and says when the folder is deleted, settles who owns the coordinator reminder hook, and draws the boundary between `ki-pmo` and the loop, with five further tagged decisions. It was revised with Kris's answers to those five: it classifies each run-packet file as knowledge, recoverable or disposable against Kris's requirement that "if the state folder is lost, you shouldn't lose any knowledge, or at least you should be able to recover from it", proposes `+/_DESIGN/<subject-slug>/` as the home of a design folder, and examines `ki-pulse` and `ki-recap` as two questions.

## Decisions

[[change-management-decisions]] records Kris's answers to the report's nine tagged decisions and to `MEMBER-SEL`, `PAPERCLIP-REQ` and `TRAILER`, each with the option chosen and Kris's words verbatim, and folds in the decisions taken while the report was being written. It cites no decision number, under Kris's rule: "we should not necessarily need to put the decision number anywhere. It should be written about what the decision was or is." `BINDINGS` is closed, the Claude Code `fast` binding included. A further section records Kris's answers on durability, naming and the hook: `CITE-RULE`, `HOOK-OWNER`, `LOOP-NAME` (`ki-pmo-design`) and `GRAPH-DEFAULTS` settled, `STATE-CLEANUP` queued, and `DECISION-HOME`, the `DESIGN-RETENTION` path, `PULSE-NAME` and `RECAP-AWARE` open with a recommendation each. It states the authority position: no wave grant yet, push of this run's own commits and the thread's checkpoint commits only, no prune. The rollout starts from it: the pilot is captured through `ki-next` as one record under this Project, and each wave's records follow once the pilot's lessons are known.

## Roadmap sizing and burn-down

[[roadmap-sizing-and-burn-down]] is the one design record Kris asked for on roadmap sizing and burn-down history, captured under the burn-down focus as design only, with no roadmap record created. It quotes the direction verbatim and covers, in the order the direction sets: (a) a daily `ki` snapshot appending one JSON line per repository to a tracked file beside the ledger, with the date, the commit counted and the count by status, later points by status, repairable from Git history at any commit and charted as a burn-down in the Observatory's Roadmap instrument; (b) a `size` field in Fibonacci points 1 to 13 set at plan time, measuring Kris's attention (review, decisions, risk) rather than agent effort, with `13` as the marker of a record to split and triage unsized; (c) identifier allocation moved out of the `_ISSUES.md` front matter and body into one `ki`-owned per-area allocation file, reserved by a `ki` command and checked against Git history so a pruned identifier never recurs. It assigns ownership (`ki-work-roadmap` defines the fields and ledger, `tools-ki` allocates and snapshots, the Observatory charts, this island schedules), states that nothing is built until the current Next records close, and ends with nine tagged open questions, each with a recommendation. Unlike the `change-management` artefacts it keeps its own slug and stays until its delivery records are captured and cite it.

## Skill graph

`change-management-skills.architecture.json` is an Archify architecture source and `change-management-skills.svg` its static export, drawn at Kris's request: "Skill names: show an Archify graph of the skills and how they interrelate, as part of reviewing current and proposed naming." The interactive HTML is built under `+/diagrams/change-management-skills/` and is not committed, as `ki-diagrams` requires. The drawing has two regions. TODAY shows the change-management, governance and related skills with the reliance each declares in its `SKILL.md` frontmatter at harness revision `1cfa7d8`, solid for `ki-depends-on` and dashed for `ki-optional-depends-on`; `ki-work` and its adapters declare nothing between them, which the drawing says. PROPOSED shows the same skills in the report's six units, with Kris's names: "NAMES (c) ki-pmo, ki-work-recurring, ki-design-loop -> ki-blueprint.", revised by "BLUEPRINT-FIT - Name for ki-design-loop: ki-pmo-review, and how does it differ from ki-pmo (question open).", "DESIGN-AREA - Keep design area, ki-design-system and ki-design-inspiration." and, closing the open question, "LOOP-NAME - `ki-pmo-design`". Every renamed skill carries its new name, the line "was <old name>" and a RENAMED tag; `ki-pmo` is tagged NEW, `ki-delegation` REDUCED and `ki-pulse` MOVES; a card quotes the decisions above verbatim and another lists what moves from `ki-delegation` to `ki-pmo`. Archify's four gates pass at showcase quality; its advisory route review still reports two line crossings beside `ki-pmo-design` and `ki-pmo` that one placement edit did not remove, so the drawing's readability rests on automated checks, not on a visual inspection.

![[change-management-skills.svg]]

Read against Kris's rule that a skill name conveys its purpose at a glance, these current names fail:

- `ki-work-housekeeping` - "housekeeping" says cleanup, and the skill runs the recurring work an Activity declares. Renamed `ki-work-recurring` under `NAMES`.
- `ki-design-loop` - "design" and "loop" name an activity but not its subject, and beside `ki-design-system` and `ki-design-inspiration` it reads as interface design. Renamed `ki-pmo-design` under `LOOP-NAME`, which closed the question `BLUEPRINT-FIT` left open; the report's `ki-pmo` against the loop subsection draws the boundary.
- `ki-delegation` - the word says handing work to a background run, but the skill today also holds the master and Project thread material, the opener, bootstrap and thread working rules, which no reader would look for under delegation. The remedy is the move to `ki-pmo`, not a rename; the name fits what is left.
- `ki-pulse` - a pulse is a heartbeat or health check, and the skill triages incoming signals into records. The report moves it to `acquire` without renaming it. Kris: "`ki-pulse` is fine for now, but maybe we go with `ki-pmo-pulse`"; the report finds `ki-pmo-pulse` fails this test and leaves `PULSE-NAME` open for the naming wave.
- `ki-next` - the name is a horizon, not an act, and a newcomer cannot tell it from `ki-plan`; it captures a record into triage. Borderline rather than a clear failure, and no rename is proposed.

The remaining names in the set pass: `ki-plan`, `ki-implement`, `ki-accept`, `ki-batch`, `ki-recap`, `ki-checkpoint`, `ki-tokenomics`, `ki-decision-records`, `ki-work`, `ki-work-roadmap` and the adapters each say what they do.

## Thread banner and re-anchoring

[[thread-banner-and-re-anchoring]] is a design-only note for Kris's sanity check before anything is built: two mock status banners (AT REST and NOT AT REST) with the copyable resume line, the unit model for the banner, resume line, mark, re-anchoring after compaction, Thread working rules block, compact hook pointer, RESTORE-PATH rule and thread messaging, the proposed text placement in `ki-delegation`, the hook and the engineering standard, the master-to-thread messaging interface, the provisional BANNER-MARK order and the open questions with a recommendation each.

## Thread types and durable decisions

[[thread-types-and-durable-decisions]] is a design-only note for Kris's sanity check before anything is built. It defines thread, session and chat, recommending thread as the owner-facing term and session only for the runtime instance; defines the three thread types (conversational, coordination and state-of-play) with each type's purpose, delegation, identity, banner and close-out, including a CLOSED state word for the coordination frame; models the decision lifecycle from utterance to thread log, work record, Decision Record and enacted knowledge, with four decision classes set at each mark; models the lifecycle of design notes and their move to `+/_DESIGN/<subject-slug>/`; names each unit with its boundary and hand-offs, lists the pending records it touches, and ends with eight tagged open questions, each with a recommendation.

## Restart model

[[restart-model]] is a design-only note for adoption into `ki-pmo`: the pick-up state of a thread as its banner type combined with its thread type, in one table giving each combination's status, resume line and first instructions on resume and naming the combinations that cannot occur, with six rules folding in Kris's HOLD-MODEL, HOLD-VERBS and HOLD-BANNER of 15 October 2026: drain and resume are activities and hold is the state, every banner writes a pick-up block at the top of the checkpoint, no resume line names a host, and the drain report becomes the hold report with a HOLD frame.
