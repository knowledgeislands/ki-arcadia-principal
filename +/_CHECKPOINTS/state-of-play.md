---
type: ki-checkpoint
thread: state-of-play
state: active
created_at: 2026-10-06T21:07:00Z
updated_at: 2026-10-07T17:30:00Z
---

# state-of-play

## Objective

Take stock of all in-flight work across the `kis` Agora (the repositories in the `knowledgeislands` workspace folder) and the chezmoi source repository. Then reduce it to a focused set of Projects that Kris chooses between. The review moved the territory onto roadmap model v1 and set a baseline. It is now cutting obsolete work so that Now reflects real intent.

## Current state

- **Roadmap model v1** is rolled out and enforced across the Agora. Records carry `kind`, `initiative`, `project` and `component`; triage and cancelled are statuses; hold is a horizon. The Project and Initiative registry is in [Projects](../../Streams/Projects/Projects.md) and [Initiatives](../../Streams/Initiatives/Initiatives.md). The theme checkpoints are folded into Project notes. Each Initiative note's Review section is the periodic review.
- **Design loop.** `KI-HARNESS-GOV-152` is done. `/ki-design-loop start <project>` moves a Project forward.
- **Baseline.** Done records were pruned across the estate, and awaiting-review records were closed and pruned. The trades hold notice is due for review on 2026-10-14, and HOLD-1 warns after that date.
- **Reduction (decision 13).** 13 obsolete or superseded records were cancelled and pruned: 10 in Arcadia, 2 in the harness and 1 in `tools-ki`. `KI-HARNESS-GOV-155` was captured in triage, and two new planned Projects were created: [skill-refresh](../../Streams/Projects/skill-refresh.md) and [specification-review](../../Streams/Projects/specification-review.md). After the reduction the estate holds 26 Now, 3 Next, 1 Soon, 1 Future, 16 Hold and 14 triage records.
- **Running.** Two background agents are still running. The `tidy` agent is rolling out the five `.ki.toml` layout rules and stripping the trades policy back to bare tables across the Agora. Its uncommitted harness edits cause the current ki-authoring RUBRIC-1 audit failure. The `toolski2` agent is adding `summary --by project`, the README diagnostic fix and the combined Now and Next view to `tools-ki`. Agents are tracked under `~/.local/state/claude-bg/gov-020/`; check `claude-bg status gov-020` before assuming either is live.
- **Other thread.** [techne](techne.md) is the separate, paused Techne thread.

## Decisions made

The full text is in `~/.local/state/ki/state-of-play/design/decisions.md`. In summary, all on 2026-10-06 or 2026-10-07:

1. All eight roadmap-model recommendations were accepted: triage and cancelled statuses, hold horizon, `kind`, optional `purpose`, Project notes as the registry, and a staged migration.
2. No schema version bump: everything stays v1, and the old values are rejected once coverage is complete.
3. Recurring work is part of the model: Activities declare `initiative` and spawn audit runs with no Project.
4. Checkpoints stop being theme homes. Project notes take over outcome, health and ideas.
5. "Project" also names a repository type. Write "project repository" for the shape and "Project" for the registry entry.
6. Outcome authority covers the whole rollout, including fast-forward pushes of its own commits.
7. Migration proposals were accepted "all as recommended", including the `roadmap-model` Project and dated holds.
8. Initiatives get their own `Streams/Initiatives/` folder.
9. Cross-territory Project references were approved. Techne repositories migrated; enforcement and pruning were done as soon as possible. A tools-ki release was authorised.
10. The design loop was approved. Skills were swept for v1 conflicts. Every fixed area code is defined.
11. The design loop landed first. ki-checkpoint stays close to its original scope. Area codes became a map. Trades are on hold. Done records are pruned. No records are kept for minor rollout changes. Records are cited by full identifier.
12. Awaiting-review records count as accepted. Obsolete records are cancelled and pruned. A ki-trades hold check was added. Skill refresh and relevance prompting were added. The `.ki.toml` tidy was approved.
13. The `.ki.toml` layout was adopted, obsolete records were reduced, and the focus is decided by Project. The `skill-refresh` and `specification-review` Projects were created. `OPS` was dropped from the two housekeeping MCPs, and the `tools-ki` summary and view changes were made. This checkpoint stays as the thread's live checkpoint.

## Files touched

- **Design and decisions:** `~/.local/state/ki/state-of-play/design/`, which holds `roadmap-model.md`, `decisions.md` and the migration proposals.
- **Reports:** `~/.local/state/claude-bg/gov-020/*.report.md`. The latest are `survey.report.md`, `closeout.report.md` and `reduce.report.md`, and `focus.md` is the per-Project focus view.
- **Project and Initiative notes:** [Projects](../../Streams/Projects/Projects.md) and [Initiatives](../../Streams/Initiatives/Initiatives.md). These hold the durable status, health and next step for each Project.
- **Reduction commits:** these are in `ki-arcadia-principal` (Projects, cancellations and the prune), `ki-agentic-harness` (cancellations, `KI-HARNESS-GOV-155` and the prune) and `tools-ki` (cancellation and prune). Git history keeps the pruned records.

## Open questions

- **Focus.** Which two or three Projects get Now, and which Now records move to Next? `focus.md` recommends baseline-rollout, skill-refresh and knowledge-acquisition. No horizon has moved.
- **Trades hold review on 2026-10-14:** re-enable trades or renew the hold. This now sits in skill-refresh.
- **`KI-HARNESS-GOV-144`:** which skill owns routine background delegation? This is reserved to Kris.
- **Paperclip:** two decision cards still gate the seven Now records in paperclip-bootstrap-and-recovery.
- **Estate factorisation:** which repository first carries FND-5?
- **Agent host:** the prototype review `KI-ARCADIA-GOV-021` is due on 2026-11-06.
- **Specification review:** which repository is reviewed first?

## Next step

Bring `focus.md` to Kris to pick the short list of Projects and approve the Now-to-Next moves. Then apply the moves in each owning repository. Then start `/ki-design-loop start skill-refresh` before the trades hold review on 2026-10-14.
