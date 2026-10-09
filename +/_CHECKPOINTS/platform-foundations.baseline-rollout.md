---
type: ki-checkpoint
thread: platform-foundations.baseline-rollout
label: 'Platform Foundations: baseline-rollout'
state: active
created_at: 2026-10-08T08:35:00Z
updated_at: 2026-10-09T20:55:00Z
---

# platform-foundations.baseline-rollout

## Objective

Every Knowledge Islands repository meets a solid baseline: `ki repo audit --estate` green and a released `ki` installed on each island ([baseline-rollout](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/baseline-rollout.md), Initiative [platform-foundations](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Initiatives/platform-foundations.md)).

## Current state

- Queued, second of three, behind the three-active-thread cap; the master thread prepared this checkpoint on 2026-10-09. Last read `ki-delegation` at harness revision 01ac726c (2026-10-09).
- KI-HARNESS-GOV-117 and KI-HARNESS-GOV-127 were delivered by helper `baseline2` (gov-020), closed done and pruned. Its follow-on KI-HARNESS-GOV-163 (Bun boundary proof adapter) is deferred (Decision 10).
- [KI-HARNESS-GOV-168](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-168-roll-out-ki-pin-receivers.md) (Next, draft): roll out pin receivers to the 20 `knowledgeislands` repositories still pinning `KI_VERSION: v0.8.4` inline. Adopted for planning (Decision 8); its steps are written but it is not yet Ready.
- The release bot and the `main` ruleset are set up on `ki-agentic-harness` (2026-10-09, Decision 12), which is the reference receiver. The bot is also on `homebrew-tap` and `ki-website`. Every further repository needs its `main` ruleset before the bot is installed, as [Release Cascade](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Admin/Operations/Processes/Release%20Cascade.md) sets out.
- Background agents push to harness `main` through the ruleset's admin bypass.

## Decisions made

- The master thread `_state-of-play` owns cross-project priorities, releases and decisions and does only project management; this thread works only this Project's records (Decisions 17 and 18 in `~/.local/state/ki/agents/state-of-play/decisions.md`).
- Delivered records count as done and are pruned once verified; minor rollout changes are committed directly, citing records by full identifier.
- BREW-013 (`homebrew-tap` tap registration) merges into KI-HARNESS-GOV-168 (Decision 21); the master's run `close-ki` is doing the merge.
- Rulesets, App installation, credentials and auto-merge settings stay Kris's to change.

## Files touched

None yet in this thread. Records live in `/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/`; the last helper's report is `~/.local/state/ki/agents/gov-020/baseline2.report.md`.

## Open questions

- **PIN: how `tools-ki` takes its pin.** Recommendation: CI builds `ki` from source and `tools-ki` gets no receiver, because `tools-ki` is the source of `ki`, so testing each commit against a previously released binary checks the wrong thing and a receiver tracking its own releases is circular. Alternative: a pin bump through the receiver like every other repository. Put this to Kris with the plan.
- **PRFLOW, with the master thread:** background agents push to harness `main` through the admin bypass. Kris to decide whether to keep direct pushes (the master recommends keeping them) or move to pull requests. If pull requests, update the run packet's push rule in `ki-delegation` and the delegation prompts.
- **CHECKLIST, later and only if Kris approves it for Arcadia first:** adopt the stock Repository review Activity ([repository-review-activity.md](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/skills/change-management/ki-work-housekeeping/assets/repository-review-activity.md)) across the estate.

## Next step

1. Re-ground KI-HARNESS-GOV-168: per repository, its pin, receiver and owner-setup state (ruleset, App installation, credentials, auto-merge), split into provisioned and waiting; check `~/.local/state/ki/agents/state-of-play/close-ki.report.md` for the BREW-013 merge.
2. Bring Kris the plan, the ordered owner-setup list (ruleset first, then the bot) and the PIN recommendation; on approval, mark it Ready through `ki-plan` and delegate the trades through `ki agent`.
