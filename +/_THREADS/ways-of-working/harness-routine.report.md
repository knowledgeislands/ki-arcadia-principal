# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › harness-routine

**Run report at 22:17 BST · last mark 16:09 BST**

---

## Done

- **OTHER-PUSH: there was nothing left to push.** Another session had already rebased and pushed this thread's commits before this run started:
  - `628762e7` from the other session became `39ea99f7`.
  - `c068e4be` became `065bbd5b`.
  - `b4875ac1` became `c43713ce`.
  - `f0f62c02`, which reserved the serial 195, is not on `main`. `a0f09d3f` had already reserved that number.
  - Local `main` was level with `origin/main` at `809f8898`. Before pulling I ran `bun run test` (1197 pass, 0 fail) and `bunx tsc --noEmit` (clean). My pull and push included no other session's commits.
- **PMO-CI is captured** as [KI-HARNESS-GOV-197](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-197-pmo-7-outside-checkout-links.md), at status `triage`. It covers absolute paths outside the audited checkout, where PMO-7 should check link shape only, and paths inside the checkout, where it keeps the existence check. It cites [cli-pin](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/cli-pin.report.md): in run 38814652019, 65 of PMO-7's 128 failures are local paths that do not exist on a runner. Nothing is implemented. Commits are `c7723ac4`, which reserves the number, and `a06354dc`, which captures the record.
- **THREADS-TRIM is implemented in `ki-pmo`**, commit `737cd4d1`:
  - The new rubric item PMO-9 is a heuristic warning with a judgement part. It flags two things in a thread folder: a file or folder outside the closed list, and a report whose Needs tags all appear in the folder's `decisions.md`. A report with no queries also counts as answered. Whether a flagged report's outcome has a durable home stays the owning thread's judgement, and the list never gives permission to delete.
  - The standard's Tidying section and Committing section now have the thread tidy at every resting point as well as at each mark. A new Flagging bullet, and a Tidy flags bullet under the state-of-play thread, have the state-of-play thread name flagged folders in each owning checkpoint's messages block at its own mark.
  - PMO-6 and `sources.md` are updated. `ki dev skill generate` and `ki dev skill rubric` regenerated the hook line, the `ki-coordinator` output style and `rubric.md`. The hook test's expected line and the remediation-inventory counts moved with the change.
  - Tests cover how query tags are read, a folder that passes, answered reports, files outside the closed list, and a folder that does not exist.
- **Check results on the final tree:**
  - `bun run test`: 1202 pass, 0 fail.
  - `bunx tsc --noEmit`: clean.
  - The commit hooks passed, and no check was skipped.
  - `ki repo audit --skill ki-skills`: WARN=2. Both are the existing LONG-3 warnings on `sources.md` refresh dates.
  - `ki repo audit --skill ki-authoring`: PASS.
  - `ki repo audit --skill ki-pmo`: FAIL=4 and WARN=1. The four failures are the existing PMO-7 findings in Kris's `+/_THREADS/skill-reviews/` reports, which link to [KI-HARNESS-GOV-193 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/c092431687d3542e55058cecd545e816a1dbadcf/docs/roadmap/KI-HARNESS-GOV-193-area-diagrams-with-html.md). The warning is the new PMO-9 correctly flagging the brief files in that same folder. None of these comes from this change, and I did not touch that folder.
- **Pushed:** the harness went fast-forward from `809f8898` to `737cd4d1`, carrying only this run's three commits.

## In Progress

Nothing is running.

### Outstanding - no action requested now

- [KI-HARNESS-GOV-197](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-197-pmo-7-outside-checkout-links.md) is at `triage` until it is selected and planned. After delivery it reaches ki-principal CI only through a `ki` release and a new pin.
- PMO-9 is not yet in any released `ki`. Once it is pinned, ki-principal's audit will warn on the thread folders still waiting for their tidy, this one included, because most of its 30 reports have answered queries.
- `ki repo audit --skill ki-work-roadmap` fails ITEM-1 because two records carry the serial 195. The query below covers it.

## Queries

### GOV-195-DUP - give the second record numbered 195 the serial 198, not 197

**Context:** Two harness records carry the serial `GOV-195`: [Granola screenshots and markers](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-195-granola-screenshots-markers.md), which reserved the number first, and [thread folder closed list](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-195-thread-folder-closed-list.md). Because of this, the `ki-work-roadmap` audit fails ITEM-1. The checkpoint parks GOV-195-RENUMBER, which planned to give the thread-folder record number 197. This run has now used 197 for PMO-CI, so the next free number is 198. PMO-9 now provides part of that record's goal, the rubric item that fails a folder holding files outside the closed list. Planning the renumbered record should therefore narrow it to the `ki-delegation` run-packet and run-prompt lines.

**Query:** Should a harness run renumber the thread-folder record to the serial 198 and narrow it to what PMO-9 does not cover?

**Options:**

a) (recommended) Launch a harness run that reserves the `GOV` serial 198 in `_ISSUES.md`, then renames the thread-folder closed-list record to that number and updates every link to it. The run also notes in the record that PMO-9 in `737cd4d1` delivers the rubric half, and leaves the record at `triage`. b) Renumber only, and leave the overlap with PMO-9 for planning.

```text
GOV-195-DUP

Launch a harness run that reserves KI-HARNESS-GOV-198 in ki-agentic-harness docs/roadmap/_ISSUES.md, then renames docs/roadmap/KI-HARNESS-GOV-195-thread-folder-closed-list.md to KI-HARNESS-GOV-198 and updates every link to it. Note in the record that PMO-9 (commit 737cd4d1) delivers its rubric half, and leave it at triage.
```

```text
╭─ run report · 2026-10-16T21:17:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] GOV-195-DUP
- [committed] harness pushed; this report committed in ki-principal
