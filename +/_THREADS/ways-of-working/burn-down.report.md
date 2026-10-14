# burn-down: harness and principal roadmap census

`burn-down`, [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) Project under the [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) Initiative, 2026-10-14 14:50 BST, window: since the thread began. State: finished.

Applied under Kris's words in the state-of-play thread's roadmap census: "RC-ALL: approve all; ways-of-working applies the harness part" and "RC-OPS-005: rescope now". Both repositories are committed and pushed fast-forward to `origin/main`.

## What has been done

**Counts.** Open records exclude `done` and `cancelled`.

| Repository | Open at start | Open at finish | Files at finish |
| --- | --- | --- | --- |
| ki-agentic-harness `docs/roadmap` | 9 (plus 1 awaiting review, 10 files) † | 4 | 5 ‡ |
| ki-principal `Streams/Roadmap` | 5 | 4 | 4 |

† The census said 15. When I started the harness held 10 files: KI-HARNESS-GOV-176, 177, 178, 180 and 182 had already been pruned by the previous commit on `main` (`chore(roadmap): prune 6 done work records`), and KI-HARNESS-GOV-186 was already gone. I followed the named actions and pruned nothing that was not named. ‡ KI-HARNESS-GOV-185 was accepted as `done` upstream by its own agent during this run and is still on disk unpruned, so the harness holds 4 open records in 5 files.

**ki-agentic-harness**, five commits, pushed as `7ac2b4de..15d9f49a`:

- Accepted [KI-HARNESS-GOV-183](https://github.com/knowledgeislands/ki-agentic-harness/commit/41cefd35) as `done` under `ki-accept`, after re-running its sync check (both diagram sources in sync) and `ki repo audit --skill ki-diagrams` (PASS); then pruned it.
- Merged KI-HARNESS-GOV-184 into [KI-HARNESS-GOV-175](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md): 175 carries the mark rule's Goal, Boundary, Steps, forms and open questions, quoting Kris's "MARK-RULE - yes, that reading; capture as a harness deliver record at next" and "DIAGRAMS-TIDY - (b) delete scratch and rebuild the stale HTML after the push; keep +/diagrams/ visible". 184 was cancelled `merged` with target 175, then pruned.
- Parked KI-HARNESS-GOV-179, 171 and 168 as cancelled `rejected` records, each with a Cancelled section naming its Project, then pruned them. Their substance is in Knowledge Islands Principal: 179 in [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md), 171 in [skill-refresh](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/skill-refresh.md), 168 in [baseline-rollout](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/baseline-rollout.md).
- Narrowed [KI-HARNESS-OPS-005](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md) to the delivered adapters and set it `awaiting-review` with the six-heading review packet: read-only Claude, Codex and ChatGPT adapters, the `tools-ki` acquisition command, the published `ki-acquire-chatgpt` capability, and the verified bootstrap staging. The one Granola mention was removed; nothing Granola-related remains. The eight unfinished steps and the open Spirituality binding and unreferenced-files questions moved to [knowledge-acquisition](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/knowledge-acquisition.md). During the rebase I folded in the upstream Tower Game move to `personal` so the packet no longer calls that binding provisional.
- Prune commit: `chore(roadmap): prune 5 done work records` (168, 171, 179, 183, 184). Pruned records are kept by Git history only.
- Checks: `ki repo audit --skill ki-work-roadmap` PASS after the edits (an earlier run failed on record shape; fixed by dropping delivery sections from cancelled records and renaming 183's closure heading to `Done` before committing). `ki acquire list` reports `chatgpt` enabled and executable. The pre-commit `lint-staged` hook passed on every commit.
- Left alone: KI-HARNESS-GOV-181, 185 and 186, and [KI-HARNESS-GOV-170](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-170-keep-resolution-targets-local.md).

**ki-principal**, three commits, pushed as `6101112..47f8fa5`:

- Parked KI-PRINCIPAL-ECO-012 as cancelled `rejected` and pruned it (`chore(roadmap): prune 1 done work record`). The ways-of-working note now carries its seven tagged owner decisions of 2026-10-13 quoted against their tags, the recommended approach and the four-phase plan.
- Carried the four ideas and the acquisition remainder into the Project notes in one commit (`docs(projects): carry parked records and the acquisition remainder into their Project notes`).
- [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) was already `in-progress`; no change made.
- Checks: `ki repo audit --skill ki-repo-kb-streams` FAIL=0 after a fix (the registry-note rule forbids work-record identifiers in Project notes, so three quoted decisions that named records are paraphrased or carry a bracketed substitution, for example `HOME` '(a) keep [the strategy record] in ki-principal; hand deliveries to each repository'). Two pre-existing warnings remain: the paperclip-capture-and-rebuild and website Projects have no open records and no close-out assessment.

**Limitations and dirty files.** Another session is editing the harness primary checkout: `skills/governance/ki-diagrams/` (SKILL.md, four references, `export-svg.ts` and its test, untracked `scripts/internal/`) and `+/diagrams/`; none was staged or touched. The harness rebase used autostash to carry those tracked edits across; they came back unchanged. In Knowledge Islands Principal the untracked reports under `+/_THREADS/chezmoi/` and `+/_THREADS/knowledge-acquisition/` and `gov185-tidy.report.md` were left alone. No checkpoint, `Admin`, `Pillars` or `Resources` file was edited.

## What is in progress

Nothing is running.

Outstanding - no action requested now:

- KI-HARNESS-GOV-185 is `done` on disk and unpruned; its owning agent or the thread prunes it.
- [KI-HARNESS-OPS-005](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md) awaits review under `ki-accept`; the KB-ACQUIRE-002 Granola review in the Master's thread is untouched by it.
- The knowledge-acquisition Project now lists eight unfinished steps that need records in their owning repositories when next selected.

## Outstanding queries

No outstanding queries.

```text
(nothing to reply)
```
