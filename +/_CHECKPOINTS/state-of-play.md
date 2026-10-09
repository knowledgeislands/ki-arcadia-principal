---
type: ki-checkpoint
thread: state-of-play
state: active
created_at: 2026-10-06T21:07:00Z
updated_at: 2026-10-08T19:36:00Z
---

# state-of-play

## Objective

This is the master thread. It owns cross-project priorities, decisions, releases and the estate-wide view across the `kis` Agora and chezmoi, and keeps Now reflecting real intent. Each active Project is worked in its own thread, resumed from its checkpoint below.

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

- **Focus.** Estate factorisation and Baseline rollout are Now; the territory selection cut-over pair is Now in its own thread. The goal is a near-empty roadmap, finishing the easiest Now Projects first.
- **Projects with no thread.** No open records and no recurring work: [roadmap-model](../../Streams/Projects/roadmap-model.md), [skill-refresh](../../Streams/Projects/skill-refresh.md), [specification-review](../../Streams/Projects/specification-review.md), [delta-evaluation](../../Streams/Projects/delta-evaluation.md) and [trades-revamp](../../Streams/Projects/trades-revamp.md). Paused, with Hold records only: [specifications](../../Streams/Projects/specifications.md) and [website](../../Streams/Projects/website.md). No threads for specifications or website while they are on hold; their decisions stay here. Not active and no thread yet, with no Project or record: the [territory-rollout](territory-rollout.md) checkpoint, which gathers what rolling the Knowledge Islands shape out to Kris's other territories needs.
- **Projectless helpers this thread owns** (gov-020; check `ki agent status gov-020`): `streams-homes-r` (recurring-work homes and Project close-out) and `dr-refresh-r` (standing Decision Record consolidation) running; `chezmoi-fix-r` and `dr-after-r` queued. The rest of today's helpers have finished, including the Decision Record scope rename, the release-on-demand policy and the Paperclip records.
- **Tooling.** `ki` 0.9.0 (Homebrew and `~/.local/bin`) carries `ki agent`. tools-ki `main` holds unreleased changes, including KI-HARNESS-GOV-145's audit-summary disclosure.

## Decisions made

Rules live with their durable owners: the roadmap model in GDR-KI-ARCADIA-005 and the `ki-work` standards, delegation and project threads in `ki-delegation`, releases in the `ki-repo-tools` release-readiness standard. Standing instructions for this thread:

- One thread per active Project, opened only where there is active work; this thread is the master and passes directions to a project thread through its checkpoint.
- Keep agents moving: start the next queued delivery as soon as one finishes. Never delegate Kris-attended or Kris-gated records: DOTFILES-UE-062, DOTFILES-UE-071, DOTFILES-UE-027 and DOTFILES-UE-065.
- Trades are on hold: send no new trades; do the work directly or record it in the receiving repository.
- Commit minor rollout changes directly without new records, citing records by full identifier; push own commits fast-forward only.
- Delivered and awaiting-review records count as done; obsolete or ownerless records are cancelled; both are pruned once verified.
- Releases are on demand; the next is one combined tools-ki release.
- Linear and TickTick are not raised in this thread.
- The Enactment threshold is settled under KI-ARCADIA-GOV-024 (delivered and pruned on 2026-10-08): an explicit owner instruction for a bounded change stands in for a record, related changes share one record, and a record is needed only for new or reworked content in `Admin`, `Pillars` or `Resources`.
- The [mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md) Project lives under the Rig Initiative; Kris settled this on 2026-10-08.

## Files touched

- Working material, machine-local and non-durable: `/Users/krisbrown/.local/state/ki/state-of-play/design/` and helper runs in `/Users/krisbrown/.local/state/ki/agents/gov-020/`.
- Project and Initiative notes: [Projects](../../Streams/Projects/Projects.md) and [Initiatives](../../Streams/Initiatives/Initiatives.md).

## Open questions

- **Trades hold, by 2026-10-14:** re-enable trades or renew the hold. HOLD-1 warns from 2026-10-15.
- **Delta trial, on or after 2026-10-13:** yes or no, under [delta-evaluation](../../Streams/Projects/delta-evaluation.md).
- **Paperclip:** answer the two decision cards.
- **Specification review:** which repository first? `tools-ki` is suggested.
- **kit-hnr:** map `[skills.ki-work-roadmap].areas` codes to titles.
- **KI-HARNESS-GOV-164:** close through `ki-accept`, done or cancelled as delivered by direct handoff.
- **KI-HARNESS-GOV-099:** confirm the `INDEX-8` wording (move the index entry, never renumber), and whether apps-observatory's serial-contiguity check (KI-OBS-VIS-004) is recorded there directly while trades are on hold.

## Next step

1. Kris opens the Project threads from the table where there is active work; each works only its own records.
2. Here: verify `streams-homes-r`, `dr-refresh-r`, `chezmoi-fix-r` and `dr-after-r` as each finishes, and prune verified done records.
3. Cut the combined tools-ki release under the release-on-demand policy.
4. Settle the trades hold and start `/ki-design-loop start skill-refresh` before 2026-10-14.
5. Close the Projects `streams-homes-r` reports ready to close, starting with roadmap-model.
