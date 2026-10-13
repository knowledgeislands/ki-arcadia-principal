---
note_type: stream-roadmap
id: KI-PRINCIPAL-ECO-013
area: ECO
title: PMO extraction pilot
kind: deliver
purpose: governance
project: ways-of-working
horizon: next
status: draft
tags:
  - topic/knowledge-islands
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-13T13:42:43Z
updated_at: 2026-10-13T23:45:32Z
---

# PMO Extraction Pilot

## Goal

A coordinating thread's rules live in their own skill, `ki-pmo`, so that a thread can be rebuilt from repository evidence alone and the thread stays responsive: it delegates every unit of work to a detached background agent, answers Kris within one short turn while agents keep running, and is reminded of that on every message by a hook on both runtimes. This is the one pilot of the change-management design; the waves that restructure the rest wait for its lessons.

## Context

The change-management design in the [[ways-of-working|Ways of working]] Project ran under `ki-design-loop`: a brief, two independent reviews, one merged report and Kris's decisions, all in the Project's [[ways-of-working/design/design|design folder]]. Kris chose the pilot's scope as `PILOT-SCOPE` (a), "ki-pmo move only, with the rebuild-from-checkpoint test", and `COORD-HOOK` (a), "both runtimes before the pilot opens, as the pilot's first task" (Decisions 16 and 17 of the `ways-of-working` run, recorded in [[change-management-decisions]]). The pilot also carries the responsive coordinator, which Kris made a fundamental requirement (Decision 15): the report's responsive-coordinator section sets six enforcement layers and requires the pilot to carry layers 1, 2, 3 and 6, the opener's role line, the salience hook, the counted turn budget and the measured acceptance test.

Today the thread material sits inside the `ki-delegation` background-run standard, beside the run mechanics, and the written responsiveness rules are not holding: threads keep doing work directly and every owner message pre-empts it. The report's diagnosis is that the rule is right and the enforcement is missing, so the pilot pairs the move with enforcement that does not depend on the model remembering.

The first task, the coordinator reminder hook for Claude Code and Codex, is in progress now: the `coord-hook` agent of the `ways-of-working` run is building it under Decision 16, with the script shipped by the harness beside its existing hooks and the registration managed in chezmoi. This record references that work as in progress and does not re-plan it.

This record belongs to Knowledge Islands Principal because the pilot is the design's rollout step under the ways-of-working Project, which this Capital owns, and its delivery spans the `ki-agentic-harness` skills and the chezmoi user configuration. It follows the pattern Kris set for the notification strategy under `HOME` (a): keep the record in `ki-principal` and hand deliveries to each repository, which keeps its own plan, priority and acceptance.

## Boundary

- The `ki-pmo` move only. No checkpoint schema field, no label change, no default coordinator model change and no `ki` command change; those belong to the waves.
- Layers 4 and 5 of the responsive coordinator are out: the `ki agent` mechanical support lands in Wave C and the lighter coordinator through the `COORD-DEFAULT` trial, each judged against the same acceptance test.
- The `COORD-DEFAULT` trial of `fast` at low effort may run on the pilot's Project thread but is not this record's deliverable, and the open Claude Code `fast` binding under `BINDINGS` is not needed by it.
- No rename of `ki-design-loop` or `ki-work-housekeeping`; `NAMES` is Wave E.
- No Decision Record and no deletion of the design folder; both are Wave F. Kris has since settled where design working material lives, in words that reached the thread with stop words stripped, quoted as received: "DESIGN-RETENTION - (a) +/_DESIGN/<subject-slug>/ in every repository." The pilot does not move the design folder or change the design loop's standard: the standard change is Wave B's and the move is Wave F's, and the choice is held here and in [[change-management-decisions]] until those waves have records.

## Scope

1. Create `ki-pmo` in the harness's `change-management` area, declaration-only, declared by every Capital, and move the thread material of the `ki-delegation` background-run standard into it without changing its meaning: project threads, the territory master thread, opening a thread, bootstrap, directions from the master, the thread working rules and the coordinating-thread reporting practices. Worker reporting and the run mechanics stay with `ki-delegation`; the owner report and its Needs tags stay with their canonical owner and `ki-pmo` adopts them by reference.
2. Add reciprocal off-ramps in `ki-delegation`, `ki-checkpoint`, `ki-tokenomics` and `ki-recap`. The `ki-recap` off-ramp is the form Kris chose for `RECAP-AWARE`, quoted as received: "RECAP-AWARE - (c) ki-recap detects coordinating thread and hands to ki-pmo's forms." In a coordinating thread `ki-recap` hands to `ki-pmo`'s forms, and elsewhere it recaps as it does today. Then re-point `ki-checkpoint`'s cross-references and the refresh rule to `ki-pmo`; refine `ADR-KI-HARNESS-SKILLS-005` and `ADR-KI-HARNESS-SKILLS-006` in place and widen the `change-management` area description; write the five-word glossary and the thin rubric.
3. Layer 1: the opener's role line carries the three rules of the responsive coordinator in Kris's words, and the thread re-bootstraps on request, after a compaction and after a model switch.
4. Layer 2: the coordinator reminder hook on both runtimes, in progress now as the first task, injecting `ki-pmo`'s one line on every owner message and after compaction in a coordinating thread, silent in any agent `ki agent` launched.
5. Layer 3: the counted turn budget and self-check, at most five tool calls a turn with reads and writes limited as the report states, anything beyond a launch, and drift reported to Kris in one line and noted in the checkpoint.
6. Layer 6: the acceptance tests below, run and scored from the session transcript.
7. Coordinator output style, Kris's `COORD-STYLE` answer of 2026-10-14, "(c) in the pilot; (a) now": the harness ships an output-style file for coordinating threads, selected by `outputStyle` in the tracked `.claude/settings.json` of each Capital and the harness, carrying the three responsiveness rules and the owner-report shape as the style text so that the style and the contract are one document; `Concise` stays everywhere else. Option (a), the one sentence in `ki-delegation`'s Reporting section that no style or shaping layer shortens an owner report, is applied now and is the fallback. Its first check: whether a project-level `outputStyle` overrides the user-level one in Claude Code, which is not verified; if it does not, the style cannot be selected per repository and (a) stands alone.

## Acceptance tests

1. **Rebuild from checkpoint.** With the run folder made unavailable, a fresh session re-bootstraps the master and one Project thread from repository evidence alone, recovers scope, in-force authority, outstanding Needs and the next step, and derives the correct opener by hand from the rule. A generic checkpoint in a repository without `ki-pmo` still validates.
2. **Responsiveness.** While a background agent of the pilot's run is working, Kris sends the Project thread a message. The thread answers within one turn of at most five tool calls, reading nothing beyond its checkpoint and `ki agent status`; `ki agent status` before and after shows the same agents running; the session transcript shows no in-session subagent. Run at least three times, once after a compaction.
3. **Hook.** The reminder line appears on every owner message in a coordinating thread on Claude Code and on Codex, appears again after a compaction, and does not appear in an agent launched by `ki agent`.

## Dependencies / blocks

- The coordinator reminder hook, being built now by the `coord-hook` agent of the `ways-of-working` run in `ki-agentic-harness` with its registration in the chezmoi source; the pilot cannot run acceptance tests 2 and 3 until it is installed on both runtimes.
- `ki-agentic-harness` delivers the skill, standard, Decision Record and rubric changes under its own authority; the handoff is written as `ki-work-roadmap` describes when this record is planned, and the harness owns its plan and acceptance. The chezmoi source registers the hook under its own ownership.
- The current `ki-delegation` background-run standard, including the Reporting section that carries Kris's owner report (Decision 14), is the source of the moved material.
- Nothing in this repository blocks the pilot; `blocked_by` is empty. Waves A to F wait for the pilot's lessons, which are written into each wave's brief before it starts.

## Discussion

### Why one record and why here

The design-loop standard asks for one pilot before any parallel wave, and `PILOT-SCOPE` (a) narrows it to the `ki-pmo` move so that one failure mode gives clean lessons. The report places the pilot record in `ki-agentic-harness`; Kris's `HOME` answer for the sibling notification record keeps the coordinating record in the Capital and hands deliveries to each repository, and this record follows that pattern. If Kris prefers the harness to hold the record directly, the trade of its content is one `ki-trade` step.

### Open questions

- Whether `claude -p` runs hooks at all is not verified; the hook's guard holds either way, and the `coord-hook` agent's report settles it.
- Whether a project-level `outputStyle` in `.claude/settings.json` overrides the user-level one is not verified; scope item 7 checks it first, before any style file is written.
- The `fast` trial under `COORD-DEFAULT` could run on this pilot's Project thread once the hook and the budget are in place; that is a planning choice for `ki-plan`, not a change to this record's boundary.
