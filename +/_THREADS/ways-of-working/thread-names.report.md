# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › thread-names

**Run report at 23:00 BST · last mark 16:09 BST**

---

## Done

- **Stopped before any edit. Nothing was changed, committed or pushed.** The harness checkout on sol is on `main` and level with `origin/main` after a fetch. `git pull --rebase` was not run because the working tree is dirty with other sessions' changes, and there was nothing to pull.
- **Blocker 1, no gate:** sol has no `node_modules`, no `core.hooksPath` and no active `.git/hooks`, so the pre-commit and commit-msg gate cannot run. The brief says "Commit only through the active harness gate; if it cannot run, stop and report", and `AGENTS.md` says "A declared audit or hook that cannot run is unknown, not a pass". This is the gap that [pmo-hold](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/pmo-hold.report.md) reported as GATE-INACTIVE and [registry-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/registry-model.report.md) reported as SOL-GATE.
- **Blocker 2, files dirty from other sessions:** pmo-hold left uncommitted edits, last written at 22:31 BST, in three of the files this task needs: `skills/change-management/ki-pmo/references/standards-pmo.md`, `output-styles/ki-coordinator.md` and `hooks/coordinator-reminder.sh`. registry-model and threads-records also hold uncommitted harness paths. The brief says "If a file you need is dirty from another session, leave it and name it", so I left all of them alone. `skills/governance/ki-checkpoint` is clean, but delivering only part of THREAD-NAMES there would split the change, and it could not be committed either.
- The owner decision to deliver: Kris, 15 October 22:45 BST, showing the thread list `KI > SoP`, `KI > Model > ways of working`, `KI > Model > knowledge acquisition`, `KI > Rig > mac studio setup`, `KI > mics / webcams`, `Acquire > intake (sol)` and `Chezmoi > misc (sol)`: "this is a better way I think". On the host suffix: "no, the machine is only added if its limited to that machine, so intake and chezmoi misc are machine specific". It is logged in the [ways-of-working decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/decisions.md) and the [state-of-play decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/decisions.md).

## In Progress

Nothing is running.

Outstanding - no action requested now:

- Once the gate is active and pmo-hold's ki-pmo paths are committed, the THREAD-NAMES change is ready to carry out. It covers the ki-pmo standard's openers and checkpoint-label rule, the ki-checkpoint label field, a transition note mapping the old labels (for example `KI Model: ways-of-working` to `KI > Model > ways of working` and `Master: state-of-play` to `KI > SoP`), and the hook line and output style only where they quote a label form. No checkpoint label is rewritten.
- This report is not committed: ki-principal on sol has no active commit gate either, so the thread commits it with its folder.

## Queries

### THREAD-NAMES-GATE - rerun THREAD-NAMES after the sol gate and pmo-hold land

**Context:** THREAD-NAMES edits the same ki-pmo standard, output style and hook as pmo-hold, whose changes are still uncommitted, and no harness commit can go through the gate on sol until the dev tools are installed. Both blockers resolve with GATE-INACTIVE and SOL-GATE: install, then commit pmo-hold, registry-model and threads-records. Running THREAD-NAMES after that keeps each change under its own author and commit.

**Query:** Should THREAD-NAMES be relaunched unchanged, chained after GATE-INACTIVE and the pmo-hold commit?

**Options:**
a) (recommended) Queue thread-names again with the same brief, chained after the GATE-INACTIVE install and the pmo-hold, registry-model and threads-records commits.
b) Run it now, layered on pmo-hold's uncommitted edits, leaving everything uncommitted until the gate is active.

```text
THREAD-NAMES-GATE

Queue thread-names again with its original brief, chained to start only after GATE-INACTIVE has installed the harness dev tools on sol and the pmo-hold, registry-model and threads-records harness paths have been committed through the gate and pushed. Then deliver THREAD-NAMES into the ki-pmo standard, ki-checkpoint's label field, the transition note, and the hook line and output style where they quote a label form, run the tests and ki repo audit, commit and push fast-forward only.
```

```text
╭─ run report · 2026-10-15T22:00:02Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] THREAD-NAMES-GATE
- [blocked] harness commit by the inactive sol gate and other sessions' dirty files
- [uncommitted] this report in ki-principal

```text
Resume KI Model: ways-of-working under current ki-pmo and ki-delegation since 16:09 BST: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
