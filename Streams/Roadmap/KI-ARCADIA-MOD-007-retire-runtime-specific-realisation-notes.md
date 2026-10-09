---
note_type: stream-roadmap
id: KI-ARCADIA-MOD-007
area: MOD
title: Retire runtime-specific realisation notes
kind: deliver
project: island-model-and-tending
status: draft
horizon: next
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-09T06:52:41Z
updated_at: 2026-10-09T21:18:31Z
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

### Adoption

Adopted by Kris on 2026-10-09 (state-of-play decisions log, Decision 9) for planning only: the knowledge base keeps no Claude- or Codex-specific notes. The proposed disposition below awaits Kris's approval before the record becomes Ready.

### Proposed disposition

Paths are relative to `Pillars/Philosophy/Model/`. Each row awaits Kris's approval; nothing has moved yet.

| Note | Worth keeping | Proposed home |
| --- | --- | --- |
| `Tools/Claude/Activities/` index notes: `Activities.md`, `Constitutional/Constitutional.md`, `Tending/Tending.md` | Nothing; they index the prompts below. | Delete. |
| `Tools/Claude/Activities/Constitutional/Conformance.md`, `Tending/Health Check.md`, `Tending/Knowledge Rebuild.md`, `Tending/Convergence Check.md` | Any step or check missing from the matching model Activity note. Runtime mechanics (Cowork paths, `CLAUDE.md` alignment, auto-memory steps) are not worth keeping. | Fold missing checks into the model notes under `Activities/`; executable procedure belongs in the skill that realises each Activity. Delete the prompts. |
| `Tools/Claude/Activities/Tending/Scheduled Task Audit.md` | Possibly the idea of auditing that scheduled automations match their Activity notes; it has no runtime-neutral definition and the [[Admin/Governance/Charter\|Charter]] roster and [[Tending Activity]] count it. | Kris to choose: write a runtime-neutral `Activities/Tending/Scheduled Task Audit.md`, or retire it and remove it from the Charter roster and Tending Activity. |
| `Tools/Claude/Claude.md` | The token-economics point that standing context costs tokens. | `ki-tokenomics`, which already owns standing-surface budgets. Delete the note. |
| `Tools/Claude/Cowork Configuration Layers.md` | The layering of always-on and on-demand context and how reliably each fires. | Fold any point the skill lacks into `ki-tokenomics-claude` through a harness handoff. Delete the note. |
| `Tools/Claude/Live Artifacts/Live Artifacts.md` | The pair convention and update sequence. | Already owned by `ki-repo-kb-live-artifacts` and [[Admin/Operations/Live Artifacts/Live Artifacts\|Admin Live Artifacts]]; fold any unique step there. Delete the note. |
| `Tools/Claude/Mistakes and Lessons.md` | The closed-loop incident register and its resolved lessons, which root `AGENTS.md` cites. | Move to `Admin/Operations/Mistakes and Lessons.md` with runtime-neutral wording ("the agent", "memory"), and repoint `AGENTS.md`. |
| `Tools/Claude Housekeeping/Claude Housekeeping.md` | Little; the `mcp-housekeeping-claude` README is the authoritative catalogue and `ki-housekeeping-claude` owns its use. | Delete and remove the [[Tools]] entry. Kris to confirm, since it describes a KI product rather than a realisation. |
| `Tools/ChatGPT/ChatGPT.md`, `Agents/ChatGPT/ChatGPT.md` | Only that a runtime without file access reads island context and returns work by manual routing. | One runtime-neutral sentence in [[How Tools Connect]]. Delete both notes. |
| `Agents/Claude/Claude.md` | The behavioural constraints and the draft-then-release discipline for scheduled or published targets, both runtime-neutral. The five operating modes are owned by `ki-repo-kb`, and memory by [[Admin/MEMORY\|MEMORY]]. | Fold the constraints and release discipline into [[Agentic AI]]. Delete the note. |

Inbound links to repoint or remove on delivery: [[Admin/Governance/Charter\|Charter]], [[Canonical Meta Notes]], [[Tending Activity]], [[Knowledge Islands]], [[Model/Activities/Activities\|Activities]], [[Authoring Guidelines]], [[Model/Activities/Tending/Health Check\|Health Check]], [[Structural Audit]], [[Model/Activities/Tending/Tending\|Tending]], [[What Keeps an Island Alive]], [[Agentic AI]], [[Model/Agents/Agents\|Agents]], [[How Tools Connect]], [[Tools]], root `AGENTS.md` and KI-ARCADIA-MOD-006. Root `CLAUDE.md` stays out of scope. Calendar notes keep their historical links.

Questions for Kris: approve or amend each row; choose the Scheduled Task Audit route; confirm whether the Claude Housekeeping note goes.

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
