---
type: ki-checkpoint
thread: baseline-rollout
state: active
created_at: 2026-10-08T08:35:00Z
updated_at: 2026-10-08T08:35:00Z
---

# baseline-rollout

## Objective

Every Knowledge Islands repository meets a solid baseline: `ki repo audit --estate` is green and the released `ki` is installed on every island ([baseline-rollout](../../Streams/Projects/baseline-rollout.md), Initiative [platform-foundations](../../Streams/Initiatives/platform-foundations.md)).

## Current state

- Open records, both Now: [KI-HARNESS-GOV-117](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-117-govern-hooks-beyond-packages.md) (draft) and [KI-HARNESS-GOV-127](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-127-adopt-dependency-cruiser-estatewide.md) (in progress).
- Helper `baseline2` (gov-020) is delivering these records in order and is on KI-HARNESS-GOV-117, capturing its follow-on records. Check `ki agent status gov-020` before assuming it is still live.
- Estate factorisation and Baseline rollout are the Now focus (Decision 17).

## Decisions made

- The master thread `state-of-play` owns cross-project priorities, releases and decisions; this thread works only this Project's records.
- Delivered records count as done and are pruned once verified; minor rollout changes are committed directly, citing records by full identifier.

## Files touched

None yet in this thread. Records live in `ki-agentic-harness/docs/roadmap/`; helper prompts, statuses and reports in `~/.local/state/ki/agents/gov-020/` (`baseline2.*`).

## Open questions

None for this thread; anything needing Kris goes to `state-of-play`.

## Next step

Read `baseline2.report.md` once `baseline2` reports DONE, verify its commits and audits, then pick up whatever of KI-HARNESS-GOV-117 and KI-HARNESS-GOV-127 remains, delegating through `ki agent`.
