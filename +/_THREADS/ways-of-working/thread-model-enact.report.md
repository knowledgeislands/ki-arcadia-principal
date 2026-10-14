# thread-model-enact: thread model and banner made normative in the harness, done

## What has been done

- Delivered [KI-HARNESS-GOV-187](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-187-thread-model-and-banner.md) for the Project [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) under Initiative [knowledge-islands-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md), from the designs [thread-types-and-durable-decisions.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/thread-types-and-durable-decisions.md) and [thread-banner-and-re-anchoring.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/thread-banner-and-re-anchoring.md). The record is a Kris-requested `deliver` at horizon `now`, status `awaiting-review`; it quotes Kris's words from the [decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/decisions.md) for every tag and cites no decision by number.
- Two commits on harness `main`, pushed fast-forward to `origin`:
  - `e6ed2254` `docs(roadmap): reserve KI-HARNESS-GOV-187` (the ledger advance, alone).
  - `8f23d27c` `feat(ki-pmo): make the thread model and the issued banner normative` (32 files).
- `ki-pmo` standard rewritten: Glossary with thread, session and chat; Thread types with conversational as the default; "project thread" and "territory master thread" replaced everywhere by coordination thread and state-of-play thread, the older openers accepted until every checkpoint re-bootstraps; Decisions and design with the four decision classes, the homeless-standalone rule, the one list, the `+/_DESIGN/<subject-slug>/` home deleted on graduation, and the four close steps before DONE; REST narrowed to nothing running or queued, with waiting queries on lines beneath; Re-anchoring after compaction with the optional compact paste first; Surfaces; Recovering a thread showing a red x; Committing the thread folder. SKILL.md, sources, rubric items, contexts, tests and the generated rubric follow.
- Banner amended to Kris's three decisions: top border `╭─ issued <YYYY-MM-DDTHH:MM:SSZ> ─…╮` padded to 52 code points; `banner <UTC>` off the housekeeping line; each running, queued or waiting item on its own `running:`, `queued:` or `waiting on you:` line; an agent report puts the frame in a text block. `scripts/banner.test.ts` asserts the border's pattern and width, the per-item lines, the absent banner time and the hook's clauses.
- Hook: `has_terminal` skipped when `CLAUDECODE` is set and kept for Codex until `KI_AGENT_RUN` ships there; a compact `SessionStart` injects a re-anchoring pointer naming the `ki-pmo` standard; the line names the issued border, the per-item lines and the thread-folder rule. Tests cover both runtimes, the run marker and the pointer. `hooks/README.md`, HARN-012 and HARN-013 in `docs/specs/harness.md` record the split and the pointer.
- Output style `ki-coordinator.md`: new type names, both frames with the issued border, per-item lines, thread-folder state on the housekeeping line, and a paragraph on re-anchoring and committing the thread folder.
- `ki-delegation`: new names in Coordinating threads; the decisions log is the Project's one list under the `ki-pmo` classes; `ki agent close` documented strict with `--reconciled` as the owner's waiver, never passed by a thread on its own account; new `### Connection-critical changes` in Kris's words; the restore-path line added to all four authority footers.
- `ki-engineering`: new `### Connection-critical rollouts` beside Clean-end-state cutovers, with "tested" meaning run once before the change on the same machine.
- `ki-checkpoint`: Coordination-thread naming replaces Project-thread naming; opener example, label rule, RESUME step, rubric strings and generated rubric renamed.
- ADR-KI-HARNESS-SKILLS-005 reworded in place; `skills/README.md` catalogue regenerated.
- Included beyond the brief: Kris's words in the log, "threads need to know that they need to commit their work under +/_THREAD/", directed at this run. The standard, hook line and output style now say every report and resting point commits and pushes `+/_THREADS/<run>/`, and the housekeeping line reads `thread folder committed and pushed`. Flagged below.
- Checks on the combined result: `bun run test` 1142 pass, 0 fail; `bunx tsc --noEmit` clean; skill-graph in sync; `ki repo audit --skill` PASS for `ki-skills`, `ki-delegation`, `ki-checkpoint`, `ki-pmo`, `ki-engineering`, `ki-repo-harness` and `ki-work-roadmap`. Pre-existing warnings only: two `ki-skills` sources past their refresh cadence, and `ki-repo-harness` diagram-freshness warnings raised by the other session's `ki-diagrams` work. The pre-commit hook ran in full: lint-staged, TypeScript and the staged-snapshot `ki-skills` audit.
- One file outside the listed set changed: `+/_CHECKPOINTS/README.md`, the harness's own scaffold orientation. The `ki-checkpoint` and `ki-pmo` audits failed STRUCTURE-1 on it once the canonical wording was renamed, so `ki repo conform --skill ki-checkpoint` republished it. It is the scaffold README, not a checkpoint record; no checkpoint, `Admin`, `Pillars` or `Resources` file was touched.
- Left untouched: `+/diagrams/`, untracked by another session.

## What is in progress

Nothing is running.

Outstanding - no action requested now:

- Every other Capital's `+/_CHECKPOINTS/README.md` now differs from the canonical scaffold until its `ki-checkpoint` CONFORM republishes it. A fleet finding, not a failure here.
- Checkpoints that still say `From the master thread`, or whose openers carry the older wordings, keep working and rename at their next update.
- The Zed compact pass-through test is Kris's; the hook's `source: compact` path is covered by the suite only.
- `tools-ki` handoffs this delivery names but does not make: `ki agent status` listing threads beside runs from `thread.status`; the `home:` convention on `ki agent decide` so the log carries each entry's class; `ki agent send` to replace the `--log` inbox idiom; `KI_AGENT_RUN` on the Codex launcher so the hook can drop the terminal check there.

## Outstanding queries

### THREAD-FOLDER - confirm the thread-folder rule belongs in this delivery

**Summary.** The log directs "threads need to know that they need to commit their work under +/_THREAD/" at this run, but the brief did not list it. I read `+/_THREAD/` as `+/_THREADS/` and enacted it: commit and push the thread folder at every report and resting point, said on the housekeeping line and in the hook line.

**Need from you.** Confirm the inclusion and the `+/_THREADS/` reading, or name the change to make.

**Recommendation.** Confirm as enacted.

### GOV-187-REVIEW - accept KI-HARNESS-GOV-187

**Summary.** The record is `awaiting-review` with Review filled and every gate green on `8f23d27c`.

**Need from you.** Review and accept, or return it with the change wanted.

**Recommendation.** Accept.

### KI-HANDOFFS - queue the tools-ki follow-ons

**Summary.** Four `tools-ki` changes fall out of the adopted model and were not made here: thread listing in `ki agent status`, the `home:` convention on `ki agent decide`, `ki agent send`, and `KI_AGENT_RUN` on the Codex launcher.

**Need from you.** Say whether to open a tools-ki record for them now.

**Recommendation.** Open one tools-ki record carrying all four.

```text
THREAD-FOLDER - confirmed as enacted: +/_THREADS/ committed and pushed at every report and resting point
GOV-187-REVIEW - accept KI-HARNESS-GOV-187 at 8f23d27c
KI-HANDOFFS - open one tools-ki record for ki agent status threads, home: on decide, ki agent send and KI_AGENT_RUN on the Codex launcher
```
