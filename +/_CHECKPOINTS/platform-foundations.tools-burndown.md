---
type: ki-checkpoint
thread: platform-foundations.tools-burndown
label: 'KI > Foundations > tools burndown'
state: active
created_at: 2026-10-16T00:00:47Z
updated_at: 2026-10-16T00:00:47Z
---

# platform-foundations.tools-burndown

**Pick-up - no mark yet (not opened)**

- **Status:** rest. Prepared by the state-of-play thread on 16 October 2026 under Kris's TOOLS-PROJECT; not yet opened, nothing running or queued.
- **Resume:** `Bootstrap as the tools-burndown coordination thread under ki-pmo: follow the Bootstrap in ki-pmo, act on the messages block, strike the first mark, then report in three lines.`
- **Next steps, in order:** act on the messages block, REPO-GIT-HYGIENE first; work the inventory in the [Tools burndown Project note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/tools-burndown.md) down to zero, chaining same-repository work and running about three agents at once; at zero, stop and ask Kris before the `ki` and `mgit` releases.

**Messages from Master: state-of-play** - the receiving thread acts on each line, then removes it.

- 2026-10-16 · REPO-GIT-HYGIENE · Kris, 16 October 01:00 BST: "Make the PR and branch clean-down ki-git rubric checks run through ki repo audit and conform, fleet-wide through mgit: the tools burndown thread first checks what mgit already reports, then captures one ki-next triage record in tools-ki (open PRs, merged and stale branches, ahead and behind, stashes, worktrees, untracked files), routes the rubric rule to KI Model: ways-of-working, and folds STALE-BRANCHES, UNPUSHED-COMMITS and STAGING-LEFTOVERS into it." Steps: first check what `mgit` already reports; then capture the one `ki-next` triage record in `tools-ki`, the only new record this Project may capture; route the `ki-git` rubric rule to [KI Model: ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md) through the state-of-play thread · detail: [decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/decisions.md)
- 2026-10-16 · STALE-BRANCHES, AUTOMATION-BRANCHES, UNPUSHED-COMMITS, STAGING-LEFTOVERS · folded into REPO-GIT-HYGIENE: the record's evidence and scope draw on the [digest-churn report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/digest-churn.report.md), the [hold-branches report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/hold-branches.report.md) and, once it exists, `+/_THREADS/state-of-play/query-review.report.md`; capture them in the one record, not as separate records.

## Objective

Burn the `tools-ki`, `tools-mgit` and `tools-git-almanac` roadmaps, and the `ki-agentic-harness` records about the `ki` CLI, its commands, release or packaging, down to zero (closed, merged or rejected), ending with the `ki` and `mgit` releases. Project [Tools burndown](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/tools-burndown.md), Initiative [Platform foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md). Excluded: `tools-rig` (Rig threads) and `tools-techne` (Techne Programme Hold). No new feature records except REPO-GIT-HYGIENE's one.

**Thread working rules.** Coordinator only under `ki-pmo`: every unit of work goes to a detached background agent through `ki agent` in run `tools-burndown`; an owner message steers and never pre-empts work in flight. Chain agents that touch the same repository, run different repositories in parallel, about three at once. Records named to another Project (ways-of-working, agent-host, knowledge-acquisition) are burned down with their owning threads through the state-of-play thread, not taken over. Releases stop and ask Kris first. Commit by explicit path, never `--no-verify` or force-push; pull with rebase, push fast-forward only, naming any other session's stacked commits.

## Current state

- Status: see the pick-up block. Thread folder: +/_THREADS/tools-burndown/. Run: `tools-burndown`.
- Inventory on 16 October 2026: 14 open `tools-ki` records, none in `tools-mgit` or `tools-git-almanac`, none in scope in `ki-agentic-harness`; the table is in the Project note.
- History: the earlier tools-burndown files in +/_THREADS/tools-burndown/, `decisions.md` and `historical-decisions.md` among them, were run under [Fnd: estate-factorisation](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/platform-foundations.estate-factorisation.md). They are left in place while OLD-THREAD-FOLDERS is open; its parked items KI-RELEASE, STORE-REPAIR, DEPS-HOLD and TRIAGE-OWNERS touch this inventory.

## Decisions made

- TOOLS-PROJECT and REPO-GIT-HYGIENE, Kris, 16 October 2026 01:00 BST, in the [state-of-play decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/decisions.md).

## Files touched

- Prepared by the state-of-play `tools-project` run: this checkpoint, Streams/Projects/tools-burndown.md, Streams/Projects/Projects.md and Streams/Initiatives/platform-foundations.md.

## Open questions

- None yet.

## Next step

Bootstrap with the resume line in the pick-up block, then act on the messages block.
