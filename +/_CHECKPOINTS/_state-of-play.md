---
type: ki-checkpoint
thread: _state-of-play
label: 'Master: state-of-play'
state: active
created_at: 2026-10-06T21:07:00Z
updated_at: 2026-10-09T21:33:00Z
---

# _state-of-play

## Objective

This is the master thread. Since 2026-10-09 it does only project management and discussion: cross-project priorities, decisions, releases and the estate-wide view across the `kis` Agora and chezmoi. All real work is routed to Project threads, each resumed from its checkpoint below (Decision 17 in `~/.local/state/ki/agents/state-of-play/decisions.md`).

## Current state

- **Thread cap.** At most three Project threads are active at once, plus this master; the master queues the rest and prepares their checkpoints so each opens with one opener (Decision 19). Kris names a new Zed thread with the label and pastes the opener; the opener resolves the Project name to the single `*.<project>.md` checkpoint, or `_state-of-play.md` here.
- **Active threads.** The mac-studio-bootstrap thread runs on the Mac Studio. Rig: chezmoi is the thread for the [secrets-hygiene](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/secrets-hygiene.md) Project, active since 2026-10-09 (Decision 31).

  | Label | Checkpoint | Opener |
  | --- | --- | --- |
  | Master: state-of-play | [_state-of-play](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/_state-of-play.md) | `Re-bootstrap as the state-of-play master thread under ki-delegation.` |
  | Rig: chezmoi | [rig.chezmoi](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/rig.chezmoi.md) | `Re-bootstrap as the chezmoi project thread under ki-delegation.` |
  | Techne: agent-host | [techne.agent-host](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/techne.agent-host.md) | `Re-bootstrap as the agent-host project thread under ki-delegation.` |
  | Rig: mac-studio-bootstrap | [rig.mac-studio-bootstrap](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/rig.mac-studio-bootstrap.md) | `Re-bootstrap as the mac-studio-bootstrap project thread under ki-delegation.` |

- **Queue, in order.** Each checkpoint is prepared and ready to open when an active thread closes.

  | Order | Label | Checkpoint | Opener |
  | --- | --- | --- | --- |
  | 1 | Knowledge Islands Model: island-model-and-tending | [knowledge-islands-model.island-model-and-tending](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/knowledge-islands-model.island-model-and-tending.md) | `Re-bootstrap as the island-model-and-tending project thread under ki-delegation.` |
  | 2 | Platform Foundations: baseline-rollout | [platform-foundations.baseline-rollout](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/platform-foundations.baseline-rollout.md) | `Re-bootstrap as the baseline-rollout project thread under ki-delegation.` |
  | 3 | Knowledge Islands Model: knowledge-acquisition | [knowledge-islands-model.knowledge-acquisition](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/knowledge-islands-model.knowledge-acquisition.md) | `Re-bootstrap as the knowledge-acquisition project thread under ki-delegation.` |
  | 4 | Knowledge Islands Model: ways-of-working | [knowledge-islands-model.ways-of-working](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md) | `Re-bootstrap as the ways-of-working project thread under ki-delegation.` |

- **Other checkpoints, no thread open:** [platform-foundations.estate-factorisation](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/platform-foundations.estate-factorisation.md), [techne.paperclip-bootstrap-and-recovery](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/techne.paperclip-bootstrap-and-recovery.md), which waits on the Techne Programme Hold, and [knowledge-islands-model.territory-rollout](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/knowledge-islands-model.territory-rollout.md), which gathers what rolling the Knowledge Islands shape out to Kris's other territories needs and has no Project yet.
- **Projects with no thread.** No open records and no recurring work: [roadmap-model](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/roadmap-model.md), [skill-refresh](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/skill-refresh.md), [specification-review](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/specification-review.md), [delta-evaluation](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/delta-evaluation.md) and [trades-revamp](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/trades-revamp.md). Paused, with Hold records only: [specifications](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/specifications.md) and [website](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/website.md); their decisions stay here.
- **Master runs** (state-of-play; check `ki agent status state-of-play`): `close-ki` and `close-other` are accepting, merging and pruning under Decisions 20 to 22; `close-ki` also fixes the KI-ARCADIA-GOV-032 references before accepting it. `capture-sweep` runs after them to check every open item sits in a Project (Decision 23). The gov-020 helpers have all finished.
- **Parked tangents, now routed** (Decision 18):
  - State-of-play view of Projects and Initiatives, and the GitHub-flavoured Markdown move: [knowledge-islands-model.ways-of-working](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md).
  - Review tags and the Admin conventions: [knowledge-islands-model.island-model-and-tending](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/knowledge-islands-model.island-model-and-tending.md).
  - claude-swap auto-switching (`cswap auto --strategy consume-first` under launchd, Decision 14): with the Rig thread [rig.chezmoi](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/rig.chezmoi.md), as [DOTFILES-UE-081](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-081-claude-swap-auto-switch-service.md), accepted in Decision 20.
- **Tooling.** `ki` 0.10.0 carries `ki agent`.

## Decisions made

Rules live with their durable owners: the roadmap model in GDR-KI-ARCADIA-005 and the `ki-work` standards, delegation and project threads in `ki-delegation`, releases in the `ki-repo-tools` release-readiness standard. Standing instructions for this thread:

- Project management and discussion only; one thread per active Project, at most three at once, opened only where there is active work. This thread passes directions to a project thread through its checkpoint.
- Keep agents moving: start the next queued delivery as soon as one finishes. Never delegate Kris-attended or Kris-gated records: DOTFILES-UE-062, DOTFILES-UE-071, DOTFILES-UE-027 and DOTFILES-UE-065.
- Trades are on hold: send no new trades; do the work directly or record it in the receiving repository.
- Commit minor rollout changes directly without new records, citing records by full identifier; push own commits fast-forward only.
- Delivered and awaiting-review records count as done; obsolete or ownerless records are cancelled; both are pruned once verified.
- Releases are on demand; the next is one combined tools-ki release.
- Linear and TickTick are not raised in this thread.
- The Enactment threshold is settled under KI-ARCADIA-GOV-024 (delivered and pruned on 2026-10-08): an explicit owner instruction for a bounded change stands in for a record, related changes share one record, and a record is needed only for new or reworked content in `Admin`, `Pillars` or `Resources`.
- The [mac-studio-bootstrap](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/mac-studio-bootstrap.md) Project lives under the Rig Initiative; Kris settled this on 2026-10-08.

## Files touched

- Working material, machine-local and non-durable: decisions log and master runs in `/Users/krisbrown/.local/state/ki/agents/state-of-play/`; earlier helper runs in `/Users/krisbrown/.local/state/ki/agents/gov-020/`.
- Project and Initiative notes: [Projects](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/Projects.md) and [Initiatives](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Initiatives/Initiatives.md). The [ways-of-working](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/ways-of-working.md) Project was created on 2026-10-09.

## Open questions

Needs Kris:

- **QUEUE:** confirm the queue order above.
- **CHECKLIST:** adopt the stock Repository review Activity in Arcadia and run a first full review against the master `ki-repo` REVIEW checklist; if yes, the island-model-and-tending thread does it, and baseline-rollout later rolls it across the estate.
- **ARC-PUSH:** Techne commits da093f5 and a9e502d sit unpushed on `main` in the Arcadia primary checkout. Leave them to their thread; do not push them from here.
- **REVIEWS:** KI-HARNESS-GOV-166 and KI-HARNESS-GOV-165 - Kris accepted them in Decision 20; `close-ki` is carrying out the acceptance. Confirm from its report.
- **PRFLOW:** keep background agents pushing to harness `main` through the admin bypass (recommended), or move to pull requests. Held by the baseline-rollout thread.
- **PIN:** how `tools-ki` takes its `ki` pin; the baseline-rollout thread recommends CI building from source.
- **Trades hold, by 2026-10-14:** re-enable trades or renew the hold. HOLD-1 warns from 2026-10-15.
- **Delta trial, on or after 2026-10-13:** yes or no, under [delta-evaluation](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/delta-evaluation.md).
- **Paperclip:** answer the two decision cards.
- **Specification review:** which repository first? `tools-ki` is suggested.
- **kit-hnr:** map `[skills.ki-work-roadmap].areas` codes to titles.

## Next step

1. Read the `close-ki`, `close-other` and `capture-sweep` reports as each finishes; route anything left over to its Project thread and pull the affected primary checkouts.
2. Put the Needs-Kris items above to Kris, QUEUE and CHECKLIST first.
3. When an active thread closes, open the next queued thread from the queue table.
4. Settle the trades hold before 2026-10-14 and cut the combined tools-ki release under the release-on-demand policy when Kris asks.
