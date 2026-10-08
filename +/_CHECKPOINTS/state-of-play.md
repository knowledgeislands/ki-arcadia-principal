---
type: ki-checkpoint
thread: state-of-play
state: active
created_at: 2026-10-06T21:07:00Z
updated_at: 2026-10-08T08:50:00Z
---

# state-of-play

## Objective

This is the master thread. It owns cross-project priorities, decisions, releases and the estate-wide view across the `kis` Agora and chezmoi, and keeps Now reflecting real intent. Each active Project is worked in its own thread (Decision 28), resumed from its checkpoint below.

## Current state

- **Threads.** One per active Project, plus chezmoi and the Mac Studio. Kris pastes the opener into a new Zed thread.

  | Thread | Checkpoint | Opener |
  | --- | --- | --- |
  | state-of-play (master) | [state-of-play](state-of-play.md) | `Resume the state-of-play checkpoint in ki-arcadia-principal and continue; delegate via ki agent; this is the master thread.` |
  | baseline-rollout | [baseline-rollout](baseline-rollout.md) | `Resume the baseline-rollout checkpoint in ki-arcadia-principal and continue; delegate via ki agent; state-of-play is the master thread.` |
  | estate-factorisation | [estate-factorisation](estate-factorisation.md) | `Resume the estate-factorisation checkpoint in ki-arcadia-principal and continue; delegate via ki agent; state-of-play is the master thread.` |
  | island-model-and-tending | [island-model-and-tending](island-model-and-tending.md) | `Resume the island-model-and-tending checkpoint in ki-arcadia-principal and continue; delegate via ki agent; state-of-play is the master thread.` |
  | knowledge-acquisition | [knowledge-acquisition](knowledge-acquisition.md) | `Resume the knowledge-acquisition checkpoint in ki-arcadia-principal and continue; delegate via ki agent; state-of-play is the master thread.` |
  | paperclip-bootstrap-and-recovery | [paperclip-bootstrap-and-recovery](paperclip-bootstrap-and-recovery.md) | `Resume the paperclip-bootstrap-and-recovery checkpoint in ki-arcadia-principal and continue; delegate via ki agent; state-of-play is the master thread.` |
  | agent-host | [agent-host](agent-host.md) | `Re-bootstrap as the agent-host project thread under ki-delegation.` |
  | chezmoi | [chezmoi](chezmoi.md) | `Resume the chezmoi checkpoint in ki-arcadia-principal and continue; delegate via ki agent; state-of-play is the master thread.` |
  | mac-studio-bootstrap | [mac-studio-bootstrap](mac-studio-bootstrap.md) | `On the Mac Studio, resume the mac-studio-bootstrap checkpoint in ki-arcadia-principal and continue; state-of-play is the master thread.` |
  | territory-selection | [territory-selection](territory-selection.md) | `Resume the territory-selection checkpoint in ki-arcadia-principal and continue; delegate via ki agent; state-of-play is the master thread.` |

- **Focus.** Estate factorisation and Baseline rollout are Now (Decision 17); the territory selection cut-over pair is Now in its own thread.
- **Projects with no thread.** No open records and no recurring work: [roadmap-model](../../Streams/Projects/roadmap-model.md), [skill-refresh](../../Streams/Projects/skill-refresh.md), [specification-review](../../Streams/Projects/specification-review.md), [delta-evaluation](../../Streams/Projects/delta-evaluation.md) and [trades-revamp](../../Streams/Projects/trades-revamp.md). Paused, with Hold records only: [specifications](../../Streams/Projects/specifications.md) and [website](../../Streams/Projects/website.md). Their decisions stay here.
- **Projectless helpers this thread owns** (gov-020; check `ki agent status gov-020`): `drscope` running the Decision Record scope rename (Decision 21); queued `harness-m1`, `harness-m2`, `diagrams2`, `deleg-rule`, `dr-refresh`, `release-policy` and `streams-homes`.
- **Tooling.** `ki` 0.9.0 (Homebrew and `~/.local/bin`) carries `ki agent`, which replaced `claude-bg`.

## Decisions made

The decisions in force (full text in `decisions.md`, see Files touched):

- One thread per active Project; this thread is the master (Decision 28).
- Trades are on hold: send no new trades; do the work directly or record it in the receiving repository.
- Commit minor rollout changes directly, citing records by full identifier; push own commits fast-forward only.
- Delivered records count as done and are pruned once verified; awaiting-review and obsolete records may be closed or cancelled and pruned.
- Releases are on demand under one common policy (Decision 25).
- Recurring work homes in a Project or Initiative, and a Project closes only after a close-out assessment (Decision 26).

## Files touched

- Design and decisions: `/Users/krisbrown/.local/state/ki/state-of-play/design/` (`decisions.md`, `roadmap-model.md`).
- Helper prompts, statuses and reports: `/Users/krisbrown/.local/state/ki/agents/gov-020/`.
- Project and Initiative notes: [Projects](../../Streams/Projects/Projects.md) and [Initiatives](../../Streams/Initiatives/Initiatives.md).

## Open questions

- **Trades hold, by 2026-10-14:** re-enable trades or renew the hold. HOLD-1 warns from 2026-10-15.
- **Delta trial, on or after 2026-10-13:** yes or no, under [delta-evaluation](../../Streams/Projects/delta-evaluation.md).
- **Paperclip:** answer the two decision cards.
- **Specification review:** which repository first? `tools-ki` is suggested.
- **kit-hnr:** map `[skills.ki-work-roadmap].areas` codes to titles.

## Next step

1. Kris opens the Project threads from the table; each works only its own records.
2. Here: verify each projectless helper's report as it finishes, and prune verified done records.
3. Settle the trades hold and start `/ki-design-loop start skill-refresh` before 2026-10-14.
4. Run a close-out assessment for roadmap-model, which has no open records.
