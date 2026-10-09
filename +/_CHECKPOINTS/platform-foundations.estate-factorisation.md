---
type: ki-checkpoint
thread: platform-foundations.estate-factorisation
label: 'Platform Foundations: estate-factorisation'
state: active
created_at: 2026-10-08T08:35:00Z
updated_at: 2026-10-08T08:35:00Z
---

# platform-foundations.estate-factorisation

## Objective

The Knowledge Islands estate is factorised: consistent repository structure vocabulary, explicit ownership seams, behavioural MCP policy evidence, a single OpenAI housekeeping product, observable copies and running systems, and one alignment item per surviving repository ([estate-factorisation](../../Streams/Projects/estate-factorisation.md), Initiative [platform-foundations](../../Streams/Initiatives/platform-foundations.md)).

## Current state

- Open records: [KI-HARNESS-GOV-141](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-141-auto-bump-released-ki-pin.md) (Now, draft) and [KI-ARCADIA-GOV-030](../../Streams/Roadmap/KI-ARCADIA-GOV-030-refresh-the-release-app-note.md) (triage, captured from homebrew-tap BREW-012).
- Helper `estate` (gov-020) is delivering KI-HARNESS-GOV-141 and was last running its tests and audits. Check `ki agent status gov-020` before assuming it is still live.
- The phase plan (FND-3 to ALIGN-1) and its owners are in the Project note's Notes; FND-5 opens the remaining phases.
- Estate factorisation and Baseline rollout are the Now focus (Decision 17).

## Decisions made

- The master thread `state-of-play` owns cross-project priorities, releases and decisions; this thread works only this Project's records.
- Releases are on demand under one common policy (Decision 25); delivered work closes without waiting for a release.

## Files touched

None yet in this thread. Helper prompts, statuses and reports in `~/.local/state/ki/agents/gov-020/` (`estate.*`).

## Open questions

None for this thread; anything needing Kris goes to `state-of-play`.

## Next step

Read `estate.report.md` once `estate` reports DONE and verify it; then disposition KI-ARCADIA-GOV-030 through `ki-next` and capture the next phase record (FND-5) in its owning repository.
