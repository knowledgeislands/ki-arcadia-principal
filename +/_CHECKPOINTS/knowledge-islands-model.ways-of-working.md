---
type: ki-checkpoint
thread: knowledge-islands-model.ways-of-working
label: 'Knowledge Islands Model: ways-of-working'
state: active
created_at: 2026-10-09T20:58:00Z
updated_at: 2026-10-11T02:42:18Z
---

# knowledge-islands-model.ways-of-working

## Objective

Kris's way of working with a master thread and Project threads, background agents and the `ki` tools is defined in transferable skills and supported by a clear state-of-play view ([ways-of-working](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/ways-of-working.md), Initiative [knowledge-islands-model](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md)).

## Current state

- New Project, created 2026-10-09 (Decision 18). Queued, third of three, behind the three-active-thread cap; the master thread prepared this checkpoint. Last read `ki-delegation` at harness revision 01ac726c (2026-10-09).
- [KI-HARNESS-GOV-169](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-169-roll-up-since-mark.md) (Next, ready): roll-up since a mark. Kris's design answers are recorded (Decision 16) and the mark-design agent wrote the plan; its report is `~/.local/state/ki/agents/state-of-play/mark-design.report.md` and lists the MARK-* defaults Kris must confirm. Not implemented.
- The thread rules now live in [`ki-delegation`'s background-run standard](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md) under Project threads: parking tangents, linking records, keeping primary checkouts current, reporting to the owner and refreshing this guidance. They are this Project's to refine.
- The thread cap is not yet in the skill.
- KI-HARNESS-GOV-169 still names Initiative `platform-foundations` and no Project, so `ki repo audit` warns STREAM-10 that ways-of-working has no open records.

## Decisions made

- The master thread `_state-of-play` owns cross-project priorities, releases and decisions and does only project management; this thread works only this Project's records (Decisions 17 and 18 in `~/.local/state/ki/agents/state-of-play/decisions.md`).
- Marks are per thread, one at a time, kept in the checkpoint; `ki-delegation` owns the roll-up and `ki-recap` stays the single-session summary (Decision 16).
- Kris caps active Project threads at three plus the master; the master queues the rest and prepares their checkpoints (Decision 19).
- Thread rules belong in skills, not personal preferences (Decisions 2, 3 and 15).

## Files touched

None yet in this thread. The rules live in `/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/skills/governance/ki-delegation/`.

## Open questions

- **MARK plan approval:** Kris confirms or changes the MARK-* defaults in the mark-design report; rejection returns KI-HARNESS-GOV-169 to draft.
- **2026-10-09 (parked): Markdown flavour.** A gradual move from Obsidian-style to GitHub-flavoured Markdown, starting with a front-matter field declaring a note's flavour.
- **2026-10-09 (parked): run-folder retention.** Kris approved adding a retention rule to `ki-delegation`: when a thread or run closes and its decisions are consolidated into durable owners, archive or delete its `~/.local/state/ki/agents/<run>/` folder. Pair with the findings of the master's `state-audit` background agent.
- **2026-10-10 (approved): background-run worktree location (state-audit FIX-1).** The background-run standard names no worktree location, so agents improvised (`~/.local/state/claude-bg/...`, `~/workspaces/kit/.worktrees/...`, `<repo>.wt-*`). Add to `ki-delegation`: worktrees go under `~/.local/state/ki/agents/<run>/worktrees/<repo>`, are removed with `git worktree remove` and their branch deleted once merged, before the run reports `DONE`. Optionally a `ki agent` helper. Fold into the run-folder retention rule; no new record (master Decision 34).
- **2026-10-10 (parked): restate open Needs.** Kris likes the short-tag Needs items. Add to `ki-delegation` Reporting: every Done/Needs report from a coordinating thread restates all still-open Needs items, not only new ones; small progress updates do not.
- **2026-10-10 (parked): coordinator model.** Coordinating threads (master and project threads) mostly dispatch work, so they could run on a faster, lower-reasoning model, handing any heavy reasoning to a background agent or subagent. Decide whether `ki-delegation` should recommend this and how threads are opened with it.
- **2026-10-10 (parked): mark consistency.** Threads struck marks differently (dated "Mark:" bullet in the master, "Mark 1" and "Mark A" styles elsewhere). Settle one form as part of KI-HARNESS-GOV-169.

## Next step

1. Point KI-HARNESS-GOV-169 at this Project (`project: ways-of-working`, `initiative: knowledge-islands-model`) in the harness, which clears the STREAM-10 warning. Then put the MARK-* defaults to Kris; once Kris approves the plan, delegate KI-HARNESS-GOV-169's implementation through `ki agent`.
2. Add the thread-cap rule to `ki-delegation`'s Project threads section: at most three or four active Project threads plus the master; the master queues the rest and prepares their checkpoints so each opens with one opener.
3. Review the other thread rules with Kris and refine them.
