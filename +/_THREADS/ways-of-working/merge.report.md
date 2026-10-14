# Merge report: change-management design, stage three

## Done

- Merged report written at `ki-principal/Streams/Projects/ways-of-working/design/change-management-report.md`, following the design-loop report template: summary, corrections to the brief, model of six units, agree-and-differ table across all 28 points plus both reviews' additions, rollout plan with one pilot, eight tagged owner decisions, changes-after-review log.
- Every citation in the report was re-checked against its source on 2026-10-13. Two reviewer facts were corrected on the way: `ki-work-housekeeping` is declared in six `.ki.toml` files, not five (the chezmoi source is the sixth), and the footer defect is at `runs.ts` line 101.
- `design.md` (folder index) now introduces the two reviews and the report; `updated` bumped.
- Committed as one Conventional Commit on `ki-principal` `main`, explicit paths only (two reviews, report, index): `40476bb docs(ways-of-working): record change-management reviews and merged report`. Pre-commit hooks passed (lint-staged with rumdl, `ki repo audit --skill ki-repo-kb`: FAIL=0).
- `ki repo audit --repo .` before commit: PASS=21 WARN=1 FAIL=1, identical to baseline; the single FAIL is the pre-existing PRINCIPAL-2. rumdl clean on all four files. Diff touched only the design folder.
- `git pull --rebase` reported up to date; `git fetch`; pushed fast-forward `cdf558e..40476bb` to `origin/main`. Nothing left uncommitted from this run.

## Failed

- None.

## Needs Kris

Note on the trailer: the task named `Claude Opus 5.5` but the run executed on Claude Fable 5.1, so the commit carries `Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>` under the rule "your runtime's co-author trailer". Say if you want it amended.

The proposed model in five lines:

1. Work (`ki-work` and its adapters and process skills) stays the home of records, Projects, Initiatives and the registry, and gains one table defining direction, outcome and goal.
2. PMO (`ki-pmo`, new, change-management, declared by every Capital) owns the coordinating thread: master and Project threads, cap and queue, derived openers, Needs and handoffs, mark and roll-up, single checkpoint writer.
3. Delegation (`ki-delegation`) keeps the whole background-run contract on both sides, loses the thread material, and gains three distinct gates so a finished run is not a successful one.
4. Continuity (`ki-checkpoint`) stays the generic checkpoint format and checker, with no stored opener and a structured mark only in a later wave; the design loop keeps its name and gains a re-entry rule; Model policy (`ki-tokenomics`) owns purposes while `ki` resolves them per runtime.
5. The `ki` surface gets one rule (repo acts, territory describes, registry registers, agent runs), folds `territory show|open` into `ki repo`, adds `territory projects|threads`, keeps the word "territory"; the pilot is the `ki-pmo` extraction with a cold-reconstruction test, and the coordinator trials `fast` at low effort against a gate.

Decisions (tag, recommendation):

- `PILOT-SCOPE`: the `ki-pmo` move alone, with the cold-reconstruction acceptance test and no schema, label or model change.
- `COORD-DEFAULT`: `standard` at low effort stays the written default; the pilot's Project thread trials `fast` at low effort against the five-test gate; `fast` becomes default when the gate passes and the views and mark command exist.
- `BINDINGS`: a user-level `ki` binding per runtime (model and default effort per purpose, stop on unknown); the repository keeps purpose policy; you name the trial bindings (Astra proposes GPT-6 Luna low for Codex with GPT-6.1 Sol fallback; Claude Code `fast` is yours to pick).
- `AIMS`: an optional bounded list of three to five aims inside `## Direction`, naming no Project, with no identifiers or completion state.
- `THREAD-SCOPE`: remove the "named estate area" escape; one Project per thread; continuing upkeep delegated from the master; `rig.chezmoi` folds into the master unless you name a finite outcome worth a Project.
- `NAMES`: `ki-pmo`, plus `ki-work-housekeeping` to `ki-work-recurring` as a bounded naming wave after the pilot; the design loop keeps its name; `ki-shape` ruled out on evidence.
- `TERRITORY-WORD`: keep `ki territory`; `land` rejected on Known Lands' evidence; `terr` only as a canonical rename if you want it.
- `VIEWS`: `ki territory projects|threads` for the portfolio and thread views, with `ki repo checkpoint list|opener` for generic checkpoints.

Also under Needs, per Decision 6: the command-centre definitions table is handed off only when you say so; the report names it as a Wave F item.
