---
type: ki-checkpoint
thread: knowledge-islands-model.ways-of-working
label: 'Knowledge Islands Model: ways-of-working'
state: active
created_at: 2026-10-09T20:58:00Z
updated_at: 2026-10-12T18:22:00Z
---

# knowledge-islands-model.ways-of-working

## Objective

Kris's way of working with a master thread and Project threads, background agents and the `ki` tools is defined in transferable skills and supported by a clear state-of-play view ([ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working.md), Initiative [knowledge-islands-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md)).

## Current state

- Opened by Kris 2026-10-12, while the master's queue still listed it third (behind Fnd: baseline-rollout and KI Model: knowledge-acquisition). No run yet; the run will be `ways-of-working`. No mark yet.
- `ki-delegation` read at f2b14dca (2026-10-11).
- In the skill now: the mark standard, carry-forward of outstanding items and stable Needs tags; the thread cap and the territory master thread; thread openers and Bootstrap; steering, not stopping; parking tangents, linking records, keeping primary checkouts current, Summary banner and resting point, and refreshing this guidance - all in [`ki-delegation`'s background-run standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md). They are this Project's to refine.
- Not yet in the skill: the background-run worktree location and run-folder retention rule (approved), and the coordinator-model recommendation (undecided).

## Decisions made

- The master thread `_state-of-play` owns cross-project priorities, releases and decisions and does only project management; this thread works only this Project's records (Decisions 17 and 18 in `~/.local/state/ki/agents/state-of-play/decisions.md`).
- Marks are per thread, one at a time, kept in the checkpoint; `ki-delegation` owns the roll-up and `ki-recap` stays the single-session summary (Decision 16).
- Kris caps active Project threads at three plus the master; the master queues the rest and prepares their checkpoints (Decision 19).
- Thread rules belong in skills, not personal preferences (Decisions 2, 3 and 15).

## Files touched

None yet in this thread. The rules live in `/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/`.

## Open questions

- Parked 2026-10-09: Markdown flavour - a gradual move from Obsidian-style to GitHub-flavoured Markdown, starting with a front-matter field declaring a note's flavour.
- Parked 2026-10-09: run-folder retention - approved: when a thread or run closes and its decisions are consolidated into durable owners, archive or delete its `~/.local/state/ki/agents/<run>/` folder; pair with the master's `state-audit` findings.
- Parked 2026-10-10: background-run worktree location (state-audit FIX-1, approved, master Decision 34) - worktrees go under `~/.local/state/ki/agents/<run>/worktrees/<repo>`, removed with `git worktree remove` and their branch deleted once merged, before the run reports `DONE`; optionally a `ki agent` helper. Fold into the retention rule; no new record.
- Parked 2026-10-10: coordinator model - coordinating threads mostly dispatch, so could run on a faster, lower-reasoning model, handing heavy reasoning to a background agent; decide whether `ki-delegation` recommends this and how threads open with it.

## Next step

1. Brief one background agent in `ki-agentic-harness` to add the worktree-location and run-folder retention rule to `ki-delegation`'s background-run standard (approved; no new record).
2. Settle the coordinator-model question with Kris.
3. Review the other thread rules with Kris and refine them.
