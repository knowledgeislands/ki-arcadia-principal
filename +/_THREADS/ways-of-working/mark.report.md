# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › mark

**Run report at 21:33 BST · last mark 21:19 BST**

---

## Done

- Partial work from the earlier run: none found in ki-principal. The checkpoint was still at the previous mark, nothing for this brief was in a commit, and `origin/main..HEAD` was empty. The only change found was two staged reports, `gate-scope.report.md` and `skills-map.report.md`, which this run kept and committed.
- The [checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md) is rewritten at the mark 2026-10-14T20:19:30Z (21:19 BST). It records every decision since 18:56:38Z by tag, with Kris's words quoted, from GATE-SCOPE to RELAUNCH-MODEL. It also records that HEARTBEAT applies in this thread now ("apply it in this thread now"), the three running agents (`area-diagrams`, `gate-release`, `pmo-simplify`) and the two queued ones (`log-writer`, `heartbeat`). The re-bootstrap prompt Kris now sends to the other threads is there, carrying commit-everything, the `+/_THREADS` tidy, the heartbeat and the ki-principal gate caveat. So is the lesson that a queued agent runs from its `<name>.prompt.md` snapshot, so an amended queued brief must be re-launched, along with the carried items. Pruned records are linked at their last revision: [KI-TOOL-KI-CLI-129 (pruned)](https://github.com/knowledgeislands/tools-ki/blob/f718dad967b93fef7d6173d5d707f28d03cc5f13/docs/roadmap/KI-TOOL-KI-CLI-129-staged-audit-verdict.md) and [KI-HARNESS-GOV-191 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/ab5abbb79c9f82f3f43b0c2f0507bc9ac4c6bb48/docs/roadmap/KI-HARNESS-GOV-191-banner-frame.md). The scoped `ki repo audit --skill ki-checkpoint` passes for this checkpoint. The whole-tree run still fails on other threads' checkpoints: the `estate-factorisation`, `mac-studio-bootstrap` and `observatory` checkpoints.
- The thread folder is tidied under THREADS-TIDY ("at each mark the thread deletes every report whose queries are all answered and whose outcome has a durable home"). 65 reports are deleted by explicit path, all of them already on `origin/main`, so Git history holds them: agent-model, answers-apply, approvals, apps-sweep, banner-amend, banner-build, banner-letters, banner-mock, brief, burn-down, checkpoint-mark, checkpoint-rules, checkpoint-sync, cli124-deliver, cli124-fix, closed-threads, coord-hard, coord-hook, decisions-file, decisions-sync, dispatch-assess, durability-amend, durability, eco-adopt, eco014-deliver, export-route, full-summary, gov180-deliver, gov181-deliver, gov185-tidy, harness-push, ki-release, mark-tidy, mark3, merge-amend, merge, name-graph, noise-apply, noise-format, notify, pilot-lessons, pilot-plan, pilot, principal-enact, principal-tidy, quiet-tools, quotes-fix, release2, reply-stack, report-format, responsive, review-astra, review-fable, run-close, sizing-amend, sizing-design, skill-graph, skill-renames, svg-extract, take-stock, thread-model-enact, thread-model, trailer, triage-plan and wt-rule.
- Kept: `decisions.md`; `skills-map.report.md`, the source for the `area-diagrams` and `pmo-simplify` briefs; `gate-scope.report.md`, linked from [KI-HARNESS-GOV-192](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-192-scoped-gate-verdict.md); and `eco014-close.report.md`, the report of the held `eco014-close` run. No report yet exists for the running or queued agents.
- Commit `48296b7` in ki-principal, "docs(checkpoint): take the ways-of-working mark at 21:19 BST and tidy the thread folder", made through a private index and covering 90 paths. It holds the checkpoint, the decisions log, 21 newly committed reports, the 65 deletions, and the two link edits made under PRINCIPAL-COMMIT ("the ways-of-working thread commits the two link edits by explicit path at its next mark, once the gate clears and the checkout is level with origin"): [Engineering Practice](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Pillars/Engineering%20Practice/Engineering%20Practice.md) and the [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) Project note. The checkout was fast-forwarded to `origin/main` (`320b9db`) first. The first attempt failed the gate on STREAM-9 on the [mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) note. After `gate-release` changed the local hook to `--staged`, the retry passed, with that finding now outside the commit's scope. Pushed fast-forward, `320b9db..48296b7`.
- Limitation: `git pull --rebase` refused to run because other sessions' staged changes sit in the main index. `origin/main` had no new commits, so the push was a plain fast-forward. This run did not touch those staged changes.
- The commit trailer names Claude Opus 5.5, the model that made the commit, under the standard's commit-trailer rule. The brief's Claude Fable 5.1 trailer predates RELAUNCH-MODEL.

## In Progress

- Running: `area-diagrams` (ki-agentic-harness), `gate-release` (tools-ki release v0.10.4, plus ki-principal's version pin, hook and Conformance note) and `pmo-simplify` (ki-agentic-harness). Queued behind `pmo-simplify`: `log-writer` (tools-ki) and `heartbeat` (ki-agentic-harness).
- Outstanding - no action requested now: `gate-release` has not yet committed its edit of ki-principal's `.githooks/pre-commit` to `--staged`, though this commit already relied on it. Other sessions' changes are still uncommitted in the ki-principal working tree and index, including the state-of-play, chezmoi and knowledge-acquisition thread folders, other checkpoints, and `+/_THREADS/mac-studio-bootstrap/stray-reports.report.md`.

## Queries

No outstanding queries

```text
No reply needed.
```

```text
╭─ run report · 2026-10-14T20:33:21Z ──────────────╮
│                                                  │
│  █▀▀▄ █  █ █▀▀▀ █  █   · thread busy             │
│  █▀▀▄ █  █ ▀▀▀█  ▀█▀   · running or queued work  │
│  █▄▄▀ █▄▄█ ▄▄▄█   █    · lines below say which   │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [running] area-diagrams - eight area diagrams, thread-model diagram, committed HTML
- [running] gate-release - tools-ki release and ki-principal's staged gate
- [running] pmo-simplify - REPORT-SOURCE, HOOK-BINDING, RECAP-OWNER in ki-pmo
- [queued] log-writer - after pmo-simplify
- [queued] heartbeat - after pmo-simplify
- [committed] checkpoint and thread folder, pushed
- [held] PAPERCLIP-REQ until Wave F
- [parked] 1
