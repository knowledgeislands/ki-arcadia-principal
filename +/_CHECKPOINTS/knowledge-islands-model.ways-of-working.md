---
type: ki-checkpoint
thread: knowledge-islands-model.ways-of-working
label: 'KI Model: ways-of-working'
state: active
created_at: 2026-10-09T20:58:00Z
updated_at: 2026-10-13T09:20Z
---

# knowledge-islands-model.ways-of-working

## Objective

Kris's way of working with a master thread and Project threads, background agents and the `ki` tools is defined in transferable skills and supported by a clear state-of-play view ([ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md), Initiative [knowledge-islands-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md)).

## Current state

- Active: Kris opened this thread ahead of the master's queue (Decision 1). Run `ways-of-working`; decisions log at `~/.local/state/ki/agents/ways-of-working/decisions.md`. Mark: 2026-10-13T04:03Z, decisions log at Decision 12.
- `wt-rule` delivered the worktree, retention and coordinator rules (Decisions 2 and 3). `agent-model` delivered `--model` and `--effort` for `ki agent` (local build `tools-ki/bin/ki` until the next release). `brief` delivered [the brief](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-brief.md) (28 reflection points). Delivered: two independent reviews (Fable, Astra) and the merged [report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-report.md); `coord-hard` made Coordinator responsiveness hard rules with a `Role: coordinator only` opener line (Decision 11). `merge-amend` added Models and environment and renamed candidates (Decision 10); `dispatch-assess` found the registry-resolved subshell or `mgit -B` sufficient, with an exact `--member` selector as the only later need (Decision 12). `notify` captured [KI-PRINCIPAL-ECO-012](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-012-notification-strategy-for-delegated-work.md>) as triage with a recommended approach and phased plan (Decision 13). `report-format` made the owner report (three sections, tagged queries, closing reply block, linking rule) the standard in `ki-delegation`'s Reporting section, with pointers from chezmoi, `tools-ki` and the design report (Decision 14). `responsive` put coordinator responsiveness at the top of the report as a non-negotiable principle with six enforcement layers, a diagnosis, and the pilot carrying layers 1, 2, 3 and 6 (Decision 15). Nothing running. Open for Kris: `PILOT-SCOPE`, `COORD-DEFAULT`, `BINDINGS`, `AIMS`, `THREAD-SCOPE`, `NAMES`, `TERRITORY-WORD`, `VIEWS`, `MEMBER-SEL`, `PAPERCLIP-REQ`, `COORD-HOOK`, `TRAILER`, and the notification tags `HOME`, `BOT-ID`, `TOKEN-HOME`, `QUIET`, `OBS-CHANNEL`, `REMOTE-SCOPE`, `ADOPT`. Resolved: `PUSH` (ki-principal level with origin); `DL-FILES` retired (the JSON export is gone and the `.dat` was rewritten at 07:13, so another thread now owns it).
- `ki-delegation` read at 70606d77 (2026-10-13), which adds the owner report.
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
- Decision 13: notification strategy - capture one bounded record and an approach, implement nothing; interim chat updates only.
- Decision 14: owner reports use the three-section format with tagged queries and a closing reply block; its canonical owner is `ki-delegation`'s Reporting section.
- Decision 15: coordinator responsiveness is a fundamental requirement - no substantive work in-thread, and an owner message never pre-empts work in flight.

## Files touched

None yet in this thread. The rules live in `/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/`.

## Open questions

- Needs `COORD-HOOK`: now enforcement layer 2 in the report; only build timing and scope remain open.
- Parked 2026-10-09: Markdown flavour - a gradual move from Obsidian-style to GitHub-flavoured Markdown, starting with a front-matter field declaring a note's flavour.

## Next step

1. Take Kris's answers to the report decisions into `design/change-management-decisions.md` (via a background agent), folding in Decision 11 and the dispatch assessment.
2. Then the rollout through `ki-next`, starting with the pilot.
