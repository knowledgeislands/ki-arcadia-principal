# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › push-own

**Run report at 00:00 BST · last mark 23:22 BST**

---

## Done

- **This thread's two ki-principal commits are on `origin/main`, fast-forward.** The reconciled [ways-of-working checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md) is `b32c5503` and the [checkpoint-reconcile report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/checkpoint-reconcile.report.md) is `6a5e54be`; each touches only its own path. No force-push, no autostash, no `--no-verify`.
- **Correction to the brief's premise.** After a fresh fetch, `origin/main..HEAD` was empty: local `main` held no unpushed commits. The reflog shows another session ran `git pull --rebase --autostash` at 23:58:07 BST, then `reset: moving to origin/main` at 23:58:32 BST, which dropped three local commits from `main` that were never pushed: this thread's `f172a58d` (the rebased `d521780e`) and `4a05961b`, and the state-of-play thread's `3b8c8303` ("docs(threads): close the state-of-play round and tidy its folder"). The working tree went back to origin's content as well.
- **Recovery.** I cherry-picked `f172a58d` and `4a05961b` without conflict in a temporary detached worktree at `tmp/push-own`, on top of `origin/main`. Origin moved twice while I worked (`d0935407` and `0cf4b0e0`, from other sessions), so I re-applied the commits on the new tip and pushed `0cf4b0e0..6a5e54be`.
- **Local `main` levelled by fast-forward.** `git merge --ff-only` brought it to `6a5e54be`. No staged entries existed and no incoming path overlapped a dirty or untracked file, so `git status --porcelain` was identical immediately before and after. Between the start of the run and the fast-forward, other sessions committed or changed their own files, so the start-of-run listing differs, and none of that difference comes from this run.
- **Not restored: the state-of-play commit `3b8c8303`.** It is not this thread's, so I left it. It survives only as an unreachable object, in the reflog and in the `tmp/push-own` worktree's object store. See SOP-DROPPED.

## In Progress

Nothing is running.

- **This report's commit** is made by explicit path through a private index and pushed fast-forward in the same way, after this file is written.
- **Dirty files left alone** (other sessions'): `+/_THREADS/mac-studio-bootstrap/chezmoi-fix.report.md`, `+/_THREADS/techne/decisions.md`, `Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md` and the untracked `+/_THREADS/baseline-rollout/gate-clear.report.md`.

Outstanding - no action requested now

- CHECKPOINT-PUSH from the checkpoint-reconcile report is now resolved, because both commits are on origin. The ki-principal half of PUSH-CARRY no longer needs anything.
- The temporary worktree `tmp/push-own` is removed after the report is pushed.

## Queries

### SOP-DROPPED - the state-of-play thread's closing commit was dropped and never pushed

**Context:** At 23:58 BST another session in the shared ki-principal checkout ran `git pull --rebase --autostash` and then reset `main` to `origin/main`. That discarded the state-of-play commit `3b8c8303` ("docs(threads): close the state-of-play round and tidy its folder"). The commit updates `+/_CHECKPOINTS/_state-of-play.md` and `+/_THREADS/state-of-play/decisions.md`, adds `foundations-coherence.report.md` and deletes eleven answered reports. It is not on origin and no branch holds it, so a reflog expiry or `git gc` will eventually delete it.

**Query:** Should the state-of-play thread restore and push its closing commit?

**Options:**

a) (recommended) Ask the state-of-play thread to cherry-pick `3b8c8303` onto `origin/main` in a temporary worktree and push it fast-forward, then tell the session that reset `main` that `--autostash` and resets of shared `main` are not permitted.

b) Leave it, and let the state-of-play thread redo its close-out at its next mark.

```text
SOP-DROPPED

Ask the state-of-play thread to cherry-pick 3b8c8303 ("docs(threads): close the state-of-play round and tidy its folder") onto origin/main in a temporary worktree and push it fast-forward, then tell the session that reset ki-principal main at 23:58 BST that --autostash and resets of shared main are not permitted.
```

```text
╭─ run report · 2026-10-14T23:00:21Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] SOP-DROPPED
- [committed] checkpoint and thread folder, pushed

```text
Resume ways-of-working under current ki-pmo and ki-delegation since 23:22 BST: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
