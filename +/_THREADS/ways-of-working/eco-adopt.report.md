# eco-adopt - report

## What has been done

- Adopted [KI-PRINCIPAL-ECO-012](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-012-notification-strategy-for-delegated-work.md>) to `draft` at horizon `next`, kind `deliver`, purpose `capability`, under the [ways-of-working](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md>) Project, as Decision 17 `ADOPT` and `HOME` (a) direct. The record now carries an Owner decisions table (`HOME`, `BOT-ID`, `TOKEN-HOME`, `QUIET`, `OBS-CHANNEL`, `REMOTE-SCOPE`, `ADOPT`), a Phase 1 requirements section, a Dependencies / blocks section naming the two receiving repositories, and the evidence that `ki agent wait --next` returned an older finish rather than the newest twice on 2026-10-13. Commit `8c473a8` on `ki-principal` main, pushed fast-forward.
- Captured the phase 1 mechanics handoff in `tools-ki` as [KI-TOOL-KI-CLI-123](</Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md>) (triage, no horizon, so the receiver owns priority and plan): the run events log, `wait --next` and `watch` returning `failed`, `blocked` and `needs-owner` events in sequence, the milestone line in the appended progress protocol, and the ordering defect as a requirement. Commits `78e26f0` (ledger reservation) and `b43d8b1` (record) on `tools-ki` main, pushed fast-forward.
- Captured the phase 1 wording handoff in `ki-agentic-harness` as [KI-HARNESS-GOV-175](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md>) (triage, no horizon): the `ki-delegation` event vocabulary, the milestone line, what the waiter and monitor return, and the coordinator outside any delivery path. Commits `602447fe` (ledger reservation) and `d47b717c` (record) on `ki-agentic-harness` main, pushed fast-forward.
- Cause of the waiter defect, from `src/core/agent/runs.ts` in `tools-ki`: `waitForRun` walks agents in alphabetical name order and returns the first unseen stopped one, so finish time plays no part. Evidence from this run: at 09:53 it returned `merge` (finished 04:52) while `notify` and `report-format` had finished at 09:25 and 09:32; `review-fable` and `review-astra` (04:20, 04:31) were never returned. Recorded in all three records; nothing implemented.
- Linking both ways: `ki-work-roadmap` forbids linking another repository's roadmap record or identifier, so each handoff names `KI-PRINCIPAL-ECO-012` in plain text and links the durable Project note, and the principal record names the receivers and links their durable documentation (tools-ki README, the background-run standard). No identifier links cross repositories.
- Checks: husky pre-commit (lint-staged with rumdl, syncpack) passed on all five commits; `rumdl check` clean on all three records. Audits: `ki-principal` FAIL=3, identical to the baseline before my change (RECORD-2 on the ways-of-working checkpoint's `updated_at`, TOPICS-1, PRINCIPAL-2); `ki-agentic-harness` FAIL=0, unchanged; `tools-ki` FAIL=1 on KNIP-2, which is not from my change: knip reports the unused export `agentRunMarker` in the uncommitted `src/core/agent/runtimes.ts` another session is editing (see below). Diffs touch only the three records and the two ledgers.
- Limitation: `git pull --rebase` in `tools-ki` refused because of that session's unstaged changes; `origin/main` was level with my parent commit, and the push went through as a plain fast-forward, so nothing was rebased or forced.

## What is in progress

Nothing is running.

Outstanding - no action requested now:

- Receiver-owned work: `tools-ki` and `ki-agentic-harness` each own adoption, horizon and plan for their triage record; neither is adopted or planned.
- Agent work by another session, left untouched and unstaged: in `tools-ki`, modified `src/core/agent/runs.ts`, `src/core/agent/runtimes.ts` and `src/tests/cli/agent.test.ts` (the `coord-hook` agent's run marker); in `ki-agentic-harness`, untracked `hooks/coordinator-reminder.sh` and `hooks/coordinator-reminder.test.ts`.
- Verification limitation: the `tools-ki` KNIP-2 audit failure will clear or move with that session's commit; the `ki-principal` RECORD-2 failure is on a checkpoint I was told not to edit.
- Retained material: the `change-management-decisions` file in the ways-of-working design folder does not record the notification decisions; the record's Owner decisions table is now their durable home.

## Outstanding queries

RECV-ADOPT - Adopt the two handoff records in their repositories

- Summary: both handoffs are `status: triage` with no horizon, because `ki-next` makes adoption a receiver decision and the brief said each repository owns priority and plan. Phase 1 cannot be planned until each receiver adopts its record.
- Need from you: whether to adopt [KI-TOOL-KI-CLI-123](</Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md>) and [KI-HARNESS-GOV-175](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md>) to `draft` now, and at which horizon.
- Recommendation: adopt both at `next` as `deliver`, mechanics first, so the harness wording can follow the launcher's actual behaviour in one planning pass.

```text
RECV-ADOPT - adopt KI-TOOL-KI-CLI-123 and KI-HARNESS-GOV-175 to draft at next as deliver; plan tools-ki first.
```
