# [Platform foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md) › [Tools burndown](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/tools-burndown.md) › push-principal

**Run report at 21:45 BST · last mark none**

---

## Done

- Pushed ki-principal `main` fast-forward to `origin`, `21986b0..69b46a9`. The pre-push hook passed and nothing was forced or skipped.
- Pushed **2 commits**, not the 16 expected: `bf8d1ae` (docs(threads): log tools-burndown owner answers and dispatch) and `69b46a9` (docs(checkpoints): route harness follow-ons, footer grants and tools-ki branches). The other 14 of the stack were already on `origin`, pushed up to `21986b0` at 21:37 BST by an earlier run. No commit went beyond the expected stack.
- `main` was not behind `origin/main`, so no rebase was needed. No tracked file had uncommitted changes. The only untracked files were four thread reports, and I left them alone.
- I committed nothing. This report is uncommitted.
- Hosted CI for `69b46a9`: [run 38964350437](https://github.com/knowledgeislands/ki-principal/actions/runs/38964350437), workflow `CI`, conclusion **failure**. "Read released KI pin" passed with `v0.10.5`, "Install released KI" passed, and the run reached `ki repo audit --repo .`, which failed with FAIL=6 skills and 183 failing findings. All of them are audit findings. They include PMO-7 (thread-report record links that are missing or broken, for example in `+/_THREADS/ways-of-working/types-reconcile.report.md`), STREAM-9 on `Streams/Projects/tools-burndown.md` (the known registry-note finding) and NOTE-1a (malformed frontmatter in about 20 `+/_THREADS/` reports). None of them is a repair or store error. The previous head, `21986b0`, failed in the same way, so this push did not cause the red.
- [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) Verify 4 now holds on the hosted runner, as worded. The install step passes against `v0.10.5`, the audit step is reached, and its failures are audit findings, including STREAM-9. The record's evidence section has only a local replay, so the hosted run above is the evidence its acceptance still needs.
- Limitation: to find the CI run, I made read-only `gh run list` and `gh run view` calls, because the task asked for the hosted run. The generic footer forbids GitHub API calls, so I am naming the exception here. I made no other remote calls.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- Add the hosted run above to the evidence for [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) at its acceptance, which belongs to the tools-ki writer.

## Queries

### CI-RED-PRINCIPAL - ki-principal CI stays red on audit findings

**Context:** ki-principal's hosted CI on `main` has failed on the last three pushes. Each time the cause is repository audit findings, not tooling. Most of the 183 findings are in `+/_THREADS/` reports: PMO-7 record links that are unlinked or point at files that do not exist, and NOTE-1a frontmatter that is malformed or unterminated. The rest are STREAM-9 on the tools-burndown Project note and a few others. While CI stays red, it cannot show whether a later push broke anything.

**Query:** Should a run be dispatched to bring ki-principal's audit back to FAIL=0?

**Options:**

a) (recommended) Dispatch one ki-principal run that fixes the PMO-7 links and NOTE-1a frontmatter in the `+/_THREADS/` reports, deletes reports that the thread-tidy rule already allows to go, and removes the record list from `Streams/Projects/tools-burndown.md` for STREAM-9. Each fix is committed by explicit path and pushed fast-forward once the audit passes.

b) Leave CI red until the threads that own those reports tidy their own folders at their next marks.

```text
CI-RED-PRINCIPAL

Dispatch one ki-principal run to bring `ki repo audit --repo .` to FAIL=0: fix the PMO-7 record links and the NOTE-1a frontmatter in the +/_THREADS/ reports, delete reports the thread-tidy rule already allows, and remove the record list from Streams/Projects/tools-burndown.md for STREAM-9. Commit each fix by explicit path and push fast-forward once the audit passes.
```

```text
╭─ run report · 2026-10-16T20:45:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] CI-RED-PRINCIPAL
- [uncommitted] this run report

```text
Resume tools-burndown under current ki-pmo and ki-delegation since none: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
