---
note_type: streams/design
updated: 2026-10-15T21:20:00Z
author: Written with Claude
---

# Restart model

A design-only note for adoption into `ki-pmo` by the [[ways-of-working|Ways of working]] thread. It works out RESTART-SET and folds in HOLD-MODEL, HOLD-VERBS and HOLD-BANNER, all set by Kris on 15 October 2026 in the state-of-play thread; Kris's words are in the state-of-play `decisions.md`. It starts from what `ki-pmo` already holds: the REST, BUSY, DRAINED and DONE frames, the drain, and the three thread types.

## The model

Kris, 15 October: "A mark is a point in time", and a hold is a mark plus stopping all work, "draining any work ongoing by not restarting any". **Drain** and **resume** are activities; **hold** is the state between them. A thread drains to reach a hold and resumes to leave it. A hold is used for a move between hosts or to close a thread for a period, and may be issued across a whole territory. It never says which host the work comes back up on.

The pick-up state of a thread is its banner type combined with its thread type. Every banner updates a **pick-up block**, the first thing in the checkpoint, so that the checkpoint alone says how the thread is picked up.

## Pick-up states

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

Cannot occur:

- **REST or BUSY on a conversational thread.** It carries no REST or BUSY banner. One with background work in flight finishes to DONE or drains to HOLD.
- **HOLD on a conversational thread without a checkpoint.** There is nowhere to park. It finishes to DONE through `ki-recap` before a hold lands.
- **DONE on the state-of-play thread** except at territory close.
- **DRAINED as its own state.** DRAINED is the interim name for HOLD: a DRAINED frame or a `State: drained` line is picked up as HOLD of the same thread type.

## Rules

1. **Pick-up block.** The first section under the H1, with the messages block directly beneath it, in this shape. Open and parked queries stay below it, not in it.

   ```markdown
   ## Pick-up - mark <YYYY-MM-DDTHH:MM:SSZ> (<local time>)

   - **Status:** rest | busy | hold | done, with one line on why.
   - **Resume:** `<resume line from the table>`
   - **Next steps, in order:** what the thread does when back in use.
   ```

2. **Every banner writes it.** A REST, BUSY, HOLD or DONE banner rewrites the status, resume line and next steps to agree with the banner, and a mark also rewrites the heading's mark. DONE writes it as the last change before `ki-checkpoint` REMOVE, so Git history holds the final state.
3. **No host.** Neither the pick-up block nor any resume line names a host; the drain resume line loses "on sol". Where a territory is seated is host data, under HOST-ROLES, not thread state.
4. **Territory hold.** Kris issues it through the state-of-play thread. Every coordination thread drains first and the state-of-play thread drains last. Its Next steps list which threads restart on reinstatement and which stay held, because on a hold or reinstatement the state-of-play thread "just says threads you think should be restarted".
5. **Hold report.** The drain report becomes the hold report: form line `**Hold report at <local time> · mark <local time>**`, the same `## Done`, `## Parked` and `## Left over`, the HOLD frame below, its list, then "To bring this thread back and continue the work, paste this:" and the resume line. The DRAINED frame and its `[drained]` item retire when it lands.

   ```text
   ╭─ hold report · 2026-10-15T14:00:00Z ─────────────╮
   │                                                  │
   │  █  █ ▄▀▀▄ █    █▀▀▄   · threads drained         │
   │  █▀▀█ █  █ █    █  █   · queries parked          │
   │  █  █ ▀▄▄▀ █▄▄▄ █▄▄▀   · fully archived          │
   │                                                  │
   ╰──────────────────────────────────────────────────╯

   - [hold] nothing running or queued; committed and pushed
   - [parked] <count> queries in the checkpoint
   - [left over] <what>, only if any
   ```

6. **Status lives in the block.** The checkpoint frontmatter keeps `state: active`, as `ki-pmo` already says for a drained thread, because `ki-checkpoint` RESUME validates it; the block's status line replaces the `State:` line the drain writes in `Current state`.
