# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › heartbeat

**Run report at 22:17 BST · last mark 21:19 BST**

---

## Done

- Checked for partial work from the earlier run, which hit the usage limit: none. `ki-agentic-harness` was clean apart from the untracked `+/diagrams/` from another session, which I left alone. Nothing was ahead of `origin/main` and no file carried any heartbeat text. `pmo-simplify` had landed as `8f447874`, so I edited the standard once and regenerated the files built from it.
- Added HEARTBEAT to the update cadence in the ki-pmo standard (`skills/change-management/ki-pmo/references/standards-pmo.md`), quoting Kris's words: "HEARTBEAT / while work runs, the thread's background check also wakes it every 5 minutes for a one-to-two-line timed update with each agent's current step; add it to the ki-pmo update cadence and the hook line, and apply it in this thread now". While dispatched work runs, one detached background check stays armed. It exits as soon as any agent finishes or after 5 minutes, whichever comes first. Each time it exits, the thread reads `ki agent status`, gives a one-to-two-line timed update naming each running agent's current step, and re-arms the check. At rest there is no heartbeat.
- Added the heartbeat to the standard's `hook-line` and `output-style` source blocks. `ki dev skill generate ki-pmo --write` then rewrote `hooks/coordinator-reminder.sh` and `output-styles/ki-coordinator.md` from them, and all 7 generated files now match the standard. I updated the hook test's expected line and the hook README to match.
- Updated rubric item PMO-4 (`scripts/rubric/items/threads.ts`), both its description and its review prompt, and regenerated `references/rubric.md` with `ki dev skill rubric ki-pmo --write`.
- Record threshold: this carries out the decision in full, so I opened no record.
- Left the hand-copied sentence in ki-delegation alone, because the `log-writer` agent owns it.
- Checks: `bun run test` passed (1176 tests, 0 failures); `bunx tsc --noEmit` passed; the hook tests passed (13); `ki repo audit` passed for ki-pmo, ki-delegation and ki-work-roadmap. The pre-commit `ki-skills` audit reported two warnings, both about overdue source refreshes in `references/sources.md` (LONG-3) that were there before this change, and no failures.
- Committed `dfa52a12` `feat(ki-pmo): wake the thread on a five-minute heartbeat while work runs`, staging each path by name. I pulled with rebase (nothing new came in); `git log origin/main..HEAD` then listed only `dfa52a12`, with no commits from another thread, and I pushed it fast-forward (`8f447874..dfa52a12`).
- One slip: the two progress updates I gave during the run carried estimated times (22:18 and 22:24 BST) that ran ahead of the clock, which read 22:17 BST at push. The status file always used the real `date` output.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- To "apply it in this thread now", the ways-of-working thread has to start running the heartbeat check itself. This run can only change the standard, not the thread's behaviour. The thread picks the new rule up from the regenerated hook line on its next owner message.
- I have not committed this report; that is left to the thread's own commit of its folder.

## Queries

No outstanding queries

```text
No reply needed.
```

```text
╭─ run report · 2026-10-14T21:17:30Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [committed] ki-agentic-harness dfa52a12, pushed
- [uncommitted] this report in the thread folder

```text
Resume Ways of working under current ki-pmo and ki-delegation since 21:19 BST: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
