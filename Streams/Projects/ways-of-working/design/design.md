---
note_type: streams/index
updated: 2026-10-13T20:30:00Z
author: Written with Claude
---

# Design

## Overview

This folder holds the `ki-design-loop` artefacts for the change-management design in the [[ways-of-working|Ways of working]] Project: how Kris's change management - skills, threads, checkpoints, Initiatives, Projects and records, and the `ki` commands - should be structured now that it has evolved rather than been planned. The artefacts share the slug prefix `change-management` and are temporary: once their outcome is consolidated into a Decision Record, the Project note and the skills the rollout touches, the folder is deleted in one commit.

## Brief

[[change-management-brief]] states the problem, quotes Kris's proposal verbatim (Decisions 1 to 8 of the ways-of-working run), sets out the established facts with their sources, and gives a numbered reflection with a candidate structure of named units for the independent reviews to agree with, differ from or extend.

## Reviews

Two independent, read-only reviews of the brief, each with its own fact checks, a point-by-point table against the brief's numbered reflection, a proposed model and owner decisions:

- [[change-management-review-fable]] by Fable (Claude) proposes four units plus the design loop, removes the Portfolio unit, the stored opener and the housekeeping rename, and adds corrections on the harness decision records, the refresh rule and the non-durable run-folder history.
- [[change-management-review-astra]] by Astra (Codex) proposes six units, keeps `ki-checkpoint` unchanged, adds a single designated checkpoint writer, three delegation gates and a trial of the `fast` coordinator, and records ten fact checks against the harness, `tools-ki` and this island.

## Report

[[change-management-report]] merges the two reviews into one proposed model of six named units (Work, PMO, Delegation, Continuity, the design loop and Model policy), with corrections to the brief, an agree-and-differ table across all 28 points, a rollout plan with one pilot and eight tagged owner decisions. Every dispute is settled on cited evidence, not by vote; Kris's recorded decisions win wherever they bear on a point. It was amended after the merge under Decision 10: a Models and environment section states which models and runtimes produced each stage and what that means for confidence, the loop and PMO gain a model-level floor and a degradation rule, and every proposed name is retested against the rule that a name conveys its purpose at a glance.

## Decisions

[[change-management-decisions]] records Kris's answers to the report's nine tagged decisions and to `MEMBER-SEL`, `PAPERCLIP-REQ` and `TRAILER`, each with the option chosen, Kris's words verbatim and the decision number in the run's log (Decisions 16 and 17), and folds in the decisions taken while the report was being written (Decisions 11, 12, 14 and 15). One item stays open: the Claude Code `fast` binding under `BINDINGS`. It states the authority position: no wave grant yet, push of this run's own commits only, no prune. The rollout starts from it: the pilot is captured through `ki-next` as one record under this Project, and each wave's records follow once the pilot's lessons are known.

## Skill graph

`change-management-skills.architecture.json` is an Archify architecture source and `change-management-skills.svg` its static export, drawn under Decision 22: "Skill names: show an Archify graph of the skills and how they interrelate, as part of reviewing current and proposed naming." The interactive HTML is built under `+/diagrams/change-management-skills/` and is not committed, as `ki-diagrams` requires. The drawing has two regions. TODAY shows the change-management, governance and related skills with the reliance each declares in its `SKILL.md` frontmatter at harness revision `1cfa7d8`, solid for `ki-depends-on` and dashed for `ki-optional-depends-on`; `ki-work` and its adapters declare nothing between them, which the drawing says. PROPOSED shows the same skills in the report's six units, with Kris's names: "NAMES (c) ki-pmo, ki-work-recurring, ki-design-loop -> ki-blueprint." (Decision 17), revised by "BLUEPRINT-FIT - Name for ki-design-loop: ki-pmo-review, and how does it differ from ki-pmo (question open)." and "DESIGN-AREA - Keep design area, ki-design-system and ki-design-inspiration." (Decision 21). Every renamed skill carries its new name, the line "was <old name>" and a RENAMED tag; `ki-pmo` is tagged NEW, `ki-delegation` REDUCED and `ki-pulse` MOVES; a card quotes the decisions above verbatim and another lists what moves from `ki-delegation` to `ki-pmo`. Archify's four gates pass at showcase quality; its advisory route review still reports two line crossings beside `ki-pmo-review` and `ki-pmo` that one placement edit did not remove, so the drawing's readability rests on automated checks, not on a visual inspection.

![[change-management-skills.svg]]

Read against Kris's rule that a skill name conveys its purpose at a glance (Decision 10), these current names fail:

- `ki-work-housekeeping` - "housekeeping" says cleanup, and the skill runs the recurring work an Activity declares. Renamed `ki-work-recurring` under `NAMES`.
- `ki-design-loop` - "design" and "loop" name an activity but not its subject, and beside `ki-design-system` and `ki-design-inspiration` it reads as interface design. Renamed `ki-pmo-review` under `BLUEPRINT-FIT`; how it differs from `ki-pmo` is Kris's open question.
- `ki-delegation` - the word says handing work to a background run, but the skill today also holds the master and Project thread material, the opener, bootstrap and thread working rules, which no reader would look for under delegation. The remedy is the move to `ki-pmo`, not a rename; the name fits what is left.
- `ki-pulse` - a pulse is a heartbeat or health check, and the skill triages incoming signals into records. The report moves it to `acquire` without renaming it; no replacement name is proposed here.
- `ki-next` - the name is a horizon, not an act, and a newcomer cannot tell it from `ki-plan`; it captures a record into triage. Borderline rather than a clear failure, and no rename is proposed.

The remaining names in the set pass: `ki-plan`, `ki-implement`, `ki-accept`, `ki-batch`, `ki-recap`, `ki-checkpoint`, `ki-tokenomics`, `ki-decision-records`, `ki-work`, `ki-work-roadmap` and the adapters each say what they do.
