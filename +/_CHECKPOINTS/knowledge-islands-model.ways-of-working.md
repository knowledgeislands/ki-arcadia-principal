---
type: ki-checkpoint
thread: knowledge-islands-model.ways-of-working
label: 'Knowledge Islands Model: ways-of-working'
state: active
created_at: 2026-10-09T20:58:00Z
updated_at: 2026-10-13T03:20:00Z
---

# knowledge-islands-model.ways-of-working

## Objective

Kris's way of working with a master thread and Project threads, background agents and the `ki` tools is defined in transferable skills and supported by a clear state-of-play view ([ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md), Initiative [knowledge-islands-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md)).

## Current state

- Active: Kris opened this thread ahead of the master's queue (Decision 1). Run `ways-of-working`; decisions log at `~/.local/state/ki/agents/ways-of-working/decisions.md`. No mark yet.
- `wt-rule` delivered the worktree, retention and coordinator rules (Decisions 2 and 3). `agent-model` delivered `--model` and `--effort` for `ki agent` (local build `tools-ki/bin/ki` until the next release). `brief` delivered [the brief](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-brief.md) (28 reflection points). Running: `review-fable` (Fable, high), `review-astra` (Astra, high), then `merge` (Fable, max) gated on both.
- `ki-delegation` read at c6850675 (2026-10-13).
- Pending at the next mark (master Decision 143): change `label` to `KI Model: ways-of-working`.
- In the skill now: the mark standard, carry-forward of outstanding items and stable Needs tags; the thread cap and the territory master thread; thread openers and Bootstrap; steering, not stopping; parking tangents, linking records, keeping primary checkouts current, Summary banner and resting point, and refreshing this guidance - all in [`ki-delegation`'s background-run standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md). They are this Project's to refine.
- Proposed model, awaiting Kris: thread rules move out of `ki-delegation` into a new threads skill under change-management, leaving `ki-delegation` with background runs and packets; the registry stays in `ki-work`, records with the lifecycle skills, state in `ki-checkpoint`. Settled: `SPLIT`, `SKILL-REVIEW`, `PLAN`, `AGENT-MODEL`, `PUSH`, `MASTER-SYNC` (Decisions 4 to 9). The design also covers the `ki` command surface and naming (Decision 7) and the default coordinator model and effort, which absorbs `COORD-WORDING` (Decision 8).

## Decisions made

- Thread rules get their own skill, working name `ki-pmo`, adopted by every principal knowledge base; every repository adopts the roadmap skill. One `ki-design-loop` review of change management as a whole, with Fable and Astra reviews and a high-reasoning merge; command-centre's KI-model scope moves into it (Decisions 4 and 5).
- A handoff to another thread stays under Needs, as one current message, until Kris says it is done (Decision 6).
- Coordinating threads coordinate; substantive reasoning goes to background agents, and coordinators may run on a faster, lower-reasoning model (Decision 3).
- Worktrees and run-folder retention go into `ki-delegation` with no new record (Decision 2).
- The master thread `_state-of-play` owns cross-project priorities, releases and decisions and does only project management; this thread works only this Project's records (Decisions 17 and 18 in `~/.local/state/ki/agents/state-of-play/decisions.md`).
- Marks are per thread, one at a time, kept in the checkpoint; `ki-delegation` owns the roll-up and `ki-recap` stays the single-session summary (Decision 16).
- Kris caps active Project threads at three plus the master; the master queues the rest and prepares their checkpoints (Decision 19).
- Thread rules belong in skills, not personal preferences (Decisions 2, 3 and 15).

## Files touched

None yet in this thread. The rules live in `/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/`.

## Open questions

- Parked 2026-10-09: Markdown flavour - a gradual move from Obsidian-style to GitHub-flavoured Markdown, starting with a front-matter field declaring a note's flavour.

## Next step

1. When `merge` finishes, bring the report's owner decisions to Kris, then record them in the design folder's decisions file.
