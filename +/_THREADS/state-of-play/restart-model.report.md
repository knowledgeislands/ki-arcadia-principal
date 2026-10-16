# [Knowledge Islands](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Charter.md) › State of play › restart-model

**Run report at 22:21 BST · last mark 16:14 BST**

---

## Done

- RESTART-SET worked out in the [restart-model design note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/restart-model.md), with HOLD-MODEL, HOLD-VERBS and HOLD-BANNER folded in as six rules, and indexed in the ways-of-working [design folder index](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/design.md). The table:

| Banner | Thread type | Status | Resume line in the pick-up block | First on resume |
| --- | --- | --- | --- | --- |
| REST | Coordination | `rest` | `Resume <label> under current ki-pmo and ki-delegation since <mark>: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.` | Re-bootstrap, act on the messages block, mark, Summary with the open queries carried forward |
| REST | State-of-play | `rest` | As coordination, label `Master: state-of-play` | As coordination, then check each coordination thread's pick-up block |
| BUSY | Coordination or state-of-play | `busy` | `Resume <label> from its checkpoint under current ki-pmo and ki-delegation since <mark>: re-bootstrap, reconcile running agents with ki agent status, take stock, restart only what stopped, then banner.` | Recovery, not a planned restart: reconcile each `[running]` and `[queued]` agent against `ki agent status`; one not found counts as stopped and restarts from its brief |
| HOLD | Coordination | `hold` | `Resume <label> from its checkpoint under current ki-pmo and ki-delegation since <mark>: re-bootstrap, read the pick-up block, take stock, put the parked queries back, restart authorised work, then banner.` | Only when the state-of-play pick-up block names it for restart, or Kris does: continue from its Next steps, raise the parked queries as open queries |
| HOLD | State-of-play | `hold` | `Resume Master: state-of-play from its checkpoint under current ki-pmo and ki-delegation since <mark>: re-bootstrap, read the pick-up block, fold or discard held branches, take stock, reinstate the threads it names, put the parked queries back, then banner.` | Resumes first; hands each thread its Next steps names its resume line; every other thread stays held |
| HOLD | Conversational with a checkpoint | `hold` | `Resume <label> from its checkpoint since <mark>: read the pick-up block and take the next step with me.` | Continue the next step with Kris under `ki-recap` |
| DONE | Coordination | `done` | None | Nothing resumes. Reopening is a new opener from the state-of-play thread |
| DONE | State-of-play | `done` | None | Territory closed. Nothing resumes |
| DONE | Conversational with a checkpoint | `done` | None | Nothing resumes |

  Cannot occur: REST or BUSY on a conversational thread, because it has no such banner; HOLD on a conversational thread with no checkpoint, which finishes to DONE first; DONE on the state-of-play thread except at territory close; and DRAINED as a state of its own, because it is the interim name for HOLD. The rules: the pick-up block is the first section under the H1, with the messages block beneath it; every banner rewrites it and a mark rewrites its heading; no resume line names a host, so the drain resume line loses "on sol"; a territory hold drains coordination threads first and state-of-play last, which lists the threads to restart; the hold report replaces the drain report, with the HOLD frame drawn at 52 code points; and status lives in the block, not the frontmatter.

- Hand-off: five dated lines, RESTART-SET, HOLD-MODEL, HOLD-VERBS, HOLD-BANNER and HOST-ROLES, added to the messages block of the [KI Model: ways-of-working checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md). `ki-pmo` is not edited; adopting it is up to ways-of-working.
- HOST-ROLES: the Seat host binding line (home is terra, hub is sol, with each role's territories) added to the Notes of the [Host network](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/host-network.md) Project note, where the Known Lands Seat column can point to it. Known Lands is not edited.
- SEAT-HOSTS line added to the [Rig: chezmoi checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.chezmoi.md), handing over the per-host seat binding. Its existing SEAT-BIND line asks for the same change, so the new line tells the thread to treat both as one.
- Committed as 2109cac in ki-principal by explicit path. The pre-commit gate passed, and the commit was pulled with rebase and pushed fast-forward to origin/main with no other commits beneath it.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- KI Model: ways-of-working is to adopt the five lines into `ki-pmo` when it is reinstated.
- Rig: chezmoi is to act on SEAT-HOSTS together with SEAT-BIND when it is reinstated.

## Queries

### FRONTMATTER-STATE - where a held thread's status lives

**Context:** `ki-pmo` says a drained checkpoint keeps frontmatter `state: active` because `ki-checkpoint` RESUME validates it. Despite that, the state-of-play, ways-of-working and Rig: chezmoi checkpoints all carry `state: drained`, and the state-of-play pick-up block says it keeps that until HOLD-MODEL is adopted. Rule 6 of the design note puts status only in the pick-up block.

**Query:** Should the status of a held thread live only in the pick-up block, with the frontmatter set back to `state: active`?

**Options:**

a) (recommended) Status lives only in the pick-up block. Each checkpoint sets its frontmatter back to `state: active` at its next update, and ways-of-working adopts rule 6 as written.

b) Add `hold` to `ki-checkpoint`'s state vocabulary and keep it in the frontmatter as well as in the block, which means a `ki-checkpoint` change through the harness.

### DESIGN-HOME - where the restart-model note lives

**Context:** The brief put the note in the ways-of-working Project folder, and it sits in that folder's existing `design/` subfolder beside the earlier thread-design notes. `ki-pmo`'s design-note rule, however, says design notes live in `+/_DESIGN/<subject-slug>/` and that a design folder under a Project note is retired.

**Query:** Should the note stay in the Project's design folder until ways-of-working adopts it?

**Options:**

a) (recommended) Leave it where it is. Ways-of-working deletes it when it graduates into `ki-pmo`, or moves it along with the rest of the design folder when that folder is resolved.

b) Move it now to `+/_DESIGN/restart-model/` in ki-principal and repoint the five message lines.

```text
FRONTMATTER-STATE

Status lives only in the pick-up block. Each of the state-of-play, KI Model: ways-of-working and Rig: chezmoi checkpoints sets its frontmatter back to state: active at its next update, and ways-of-working adopts rule 6 of the restart-model design note (Streams/Projects/ways-of-working/design/restart-model.md) as written.

---

DESIGN-HOME

Leave the restart-model design note in Streams/Projects/ways-of-working/design/. Ways-of-working deletes it when it graduates into ki-pmo, or moves it along with the rest of that design folder when the folder is resolved.
```

```text
╭─ run report · 2026-10-15T21:20:33Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] FRONTMATTER-STATE
- [waiting] DESIGN-HOME
- [committed] design note and hand-offs, pushed; this report committed with it

```text
Resume state-of-play under current ki-pmo and ki-delegation since 16:14 BST: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
