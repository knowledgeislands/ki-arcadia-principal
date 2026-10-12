---
type: ki-checkpoint
thread: knowledge-islands-model.ways-of-working
label: 'Knowledge Islands Model: ways-of-working'
state: active
created_at: 2026-10-09T20:58:00Z
updated_at: 2026-10-11T09:02:08Z
---

# knowledge-islands-model.ways-of-working

## Objective

Kris's way of working with a master thread and Project threads, background agents and the `ki` tools is defined in transferable skills and supported by a clear state-of-play view ([ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working.md), Initiative [knowledge-islands-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md)).

## Current state

- New Project, created 2026-10-09 (Decision 18). Queued, third of three, behind the three-active-thread cap; the master thread prepared this checkpoint. Last read `ki-delegation` at harness revision 01ac726c (2026-10-09).
- The mark standard - a recap since the mark, carry-forward of outstanding items and stable Needs tags - is accepted and lives in [`ki-delegation`'s background-run standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md#recap-since-the-mark) under Recap since the mark.
- The thread rules now live in [`ki-delegation`'s background-run standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md) under Project threads: parking tangents, linking records, keeping primary checkouts current, reporting to the owner and refreshing this guidance. They are this Project's to refine.
- The thread cap is not yet in the skill.

## Decisions made

- The master thread `_state-of-play` owns cross-project priorities, releases and decisions and does only project management; this thread works only this Project's records (Decisions 17 and 18 in `~/.local/state/ki/agents/state-of-play/decisions.md`).
- Marks are per thread, one at a time, kept in the checkpoint; `ki-delegation` owns the roll-up and `ki-recap` stays the single-session summary (Decision 16).
- Kris caps active Project threads at three plus the master; the master queues the rest and prepares their checkpoints (Decision 19).
- Thread rules belong in skills, not personal preferences (Decisions 2, 3 and 15).

## Files touched

None yet in this thread. The rules live in `/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/`.

## Open questions

- **2026-10-09 (parked): Markdown flavour.** A gradual move from Obsidian-style to GitHub-flavoured Markdown, starting with a front-matter field declaring a note's flavour.
- **2026-10-09 (parked): run-folder retention.** Kris approved adding a retention rule to `ki-delegation`: when a thread or run closes and its decisions are consolidated into durable owners, archive or delete its `~/.local/state/ki/agents/<run>/` folder. Pair with the findings of the master's `state-audit` background agent.
- **2026-10-10 (approved): background-run worktree location (state-audit FIX-1).** The background-run standard names no worktree location, so agents improvised (`~/.local/state/claude-bg/...`, `~/workspaces/kit/.worktrees/...`, `<repo>.wt-*`). Add to `ki-delegation`: worktrees go under `~/.local/state/ki/agents/<run>/worktrees/<repo>`, are removed with `git worktree remove` and their branch deleted once merged, before the run reports `DONE`. Optionally a `ki agent` helper. Fold into the run-folder retention rule; no new record (master Decision 34).
- **2026-10-10 (settled): restate open Needs.** Kris likes the short-tag Needs items. Settled: [`ki-delegation`'s Reporting](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md#reporting) has coordinating threads give one consolidated Summary of everything still outstanding, with Needs tags stable across repeated Needs sections, and the recap carries every open Needs item forward.
- **2026-10-10 (parked): coordinator model.** Coordinating threads (master and project threads) mostly dispatch work, so they could run on a faster, lower-reasoning model, handing any heavy reasoning to a background agent or subagent. Decide whether `ki-delegation` should recommend this and how threads are opened with it.

## Next step

1. Add the thread-cap rule to `ki-delegation`'s Project threads section: at most three or four active Project threads plus the master; the master queues the rest and prepares their checkpoints so each opens with one opener.
2. Review the other thread rules with Kris and refine them.
