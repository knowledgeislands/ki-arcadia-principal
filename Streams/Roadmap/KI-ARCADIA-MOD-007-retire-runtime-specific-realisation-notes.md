---
note_type: stream-roadmap
id: KI-ARCADIA-MOD-007
area: MOD
title: Retire runtime-specific realisation notes
status: triage
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-09T06:52:41Z
updated_at: 2026-10-09T06:52:41Z
---

# Retire Runtime-Specific Realisation Notes

## Goal

The island holds no Claude- or Codex-specific notes. Whatever such notes carry today either points back to the runtime-neutral knowledge-base notes or lives in the skills that realise them.

## Context

Several Pillars notes restate a runtime-neutral note for one agent runtime. The clearest case is the Claude activity prompts, which duplicate the model Activity notes they realise. Two links show the cost: `[[Health Check]]` and `[[Knowledge Rebuild]]` could resolve to either the model note or its Claude realisation. Commit `ac79533` qualified them to point at the model notes (ki-repo-kb LINK-1). Kris's direction, recorded in the GOV-020 decisions log (Decision 5, 2026-10-09), is that the island should ideally hold no Claude- or Codex-specific notes.

Runtime-specific notes in the island today:

- Claude activity realisations under `Pillars/Philosophy/Model/Tools/Claude/Activities/`:
  - `Activities.md`
  - `Constitutional/Constitutional.md`
  - `Constitutional/Conformance.md`
  - `Tending/Tending.md`
  - `Tending/Health Check.md`, which realises [[Model/Activities/Tending/Health Check|Health Check]]
  - `Tending/Knowledge Rebuild.md`, which realises [[Model/Activities/Tending/Knowledge Rebuild|Knowledge Rebuild]]
  - `Tending/Convergence Check.md`
  - `Tending/Scheduled Task Audit.md`
- Other Claude tool notes under `Pillars/Philosophy/Model/Tools/Claude/`: `Claude.md`, `Cowork Configuration Layers.md`, `Live Artifacts/Live Artifacts.md` and `Mistakes and Lessons.md`.
- `Pillars/Philosophy/Model/Tools/Claude Housekeeping/Claude Housekeeping.md`.
- `Pillars/Philosophy/Model/Tools/ChatGPT/ChatGPT.md`.
- Agent notes: `Pillars/Philosophy/Model/Agents/Claude/Claude.md` and `Pillars/Philosophy/Model/Agents/ChatGPT/ChatGPT.md`.

Several model notes link into this tree, including [[Model/Activities/Activities|Activities]], [[Model/Activities/Tending/Tending|Tending]], [[What Keeps an Island Alive]], [[Agentic AI]], [[Structural Audit]] and the [[Admin/Governance/Charter|Charter]]. Some links reach the Claude-only notes `Scheduled Task Audit` and `Mistakes and Lessons`. The root `AGENTS.md` and `CLAUDE.md` also cite `Mistakes and Lessons`.

## Boundary

- In scope: deciding the line between a realisation note that should go and a descriptive note that may legitimately describe an external tool or agent; folding any unique content into the runtime-neutral notes or the owning skills; retiring the realisation notes; and repointing the links to them.
- Out of scope: the root `CLAUDE.md` runtime file, the `+/` and `-/` staging areas, and skill content in other repositories, which those repositories own.

## Discussion

### Capture

Captured as Triage from the GOV-020 owner answers (batch 4). No plan yet. Changes to `Pillars` go through the Enactment Process once the record is adopted.

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
