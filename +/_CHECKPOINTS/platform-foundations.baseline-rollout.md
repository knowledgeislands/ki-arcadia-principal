---
type: ki-checkpoint
thread: platform-foundations.baseline-rollout
label: 'Fnd: baseline-rollout'
state: active
created_at: 2026-10-08T08:35:00Z
updated_at: 2026-10-12T18:45:00Z
---

# platform-foundations.baseline-rollout

## Objective

Every Knowledge Islands repository meets a solid baseline: `ki repo audit --estate` green and a released `ki` installed on each island ([baseline-rollout](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/baseline-rollout.md), Initiative [platform-foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md)).

## Current state

- Opened by Kris on 2026-10-12, first in the master's queue. Run: `baseline-rollout` (no agents launched yet). ki-delegation read at f2b14dca. No mark yet.
- [KI-HARNESS-GOV-168](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-168-roll-out-ki-pin-receivers.md) (Future, draft): roll out pin receivers to the `knowledgeislands` repositories still pinning `KI_VERSION` inline. It now also carries BREW-013 (tool-release consumer registration, replay and release-event verification; merged by the master's `close-ki`) and the CI-1 and HOOK-1 roll-out (master Decision 40). Steps written; not yet Ready, and it predates the 2026-10-12 estate reshape, so its repository list and paths need re-grounding.
- KI-HARNESS-GOV-163 was cancelled (master Decision 31) and survives as an idea in the [baseline-rollout](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/baseline-rollout.md) Project note; KI-ARCADIA-ECO-011 was folded into this Project (Decision 31).
- The release bot and `main` ruleset are on `ki-agentic-harness` (the reference receiver), `homebrew-tap` and `ki-website`. Every further repository needs its `main` ruleset before the bot, as [Release Cascade](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Operations/Processes/Release%20Cascade.md) sets out.
- Background agents launch with `--rules push` (master Decision 123).

## Decisions made

- The master thread `_state-of-play` owns cross-project priorities, releases and decisions and does only project management; this thread works only this Project's records (Decisions 17 and 18 in `~/.local/state/ki/agents/state-of-play/decisions.md`).
- Delivered records count as done and are pruned once verified; minor rollout changes are committed directly, citing records by full identifier.
- Trades are on hold (master standing instruction): no new trades; do the work directly in each receiving repository or record it there.
- Rulesets, App installation, credentials and auto-merge settings stay Kris's to change.

## Files touched

This checkpoint only. Records live in `/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/`; the run folder is `~/.local/state/ki/agents/baseline-rollout/`.

## Open questions

- **PIN: how `tools-ki` takes its pin.** Recommendation: CI builds `ki` from source and `tools-ki` gets no receiver, because `tools-ki` is the source of `ki`, so testing each commit against a previously released binary checks the wrong thing and a receiver tracking its own releases is circular. Alternative: a pin bump through the receiver like every other repository. Put this to Kris with the plan.
- **PRFLOW, with the master thread:** background agents push to harness `main` through the admin bypass. Kris to decide whether to keep direct pushes (the master recommends keeping them) or move to pull requests. If pull requests, update the run packet's push rule in `ki-delegation` and the delegation prompts.
- **CHECKLIST, later and only if Kris approves it for Arcadia first:** adopt the stock Repository review Activity ([repository-review-activity.md](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-work-housekeeping/assets/repository-review-activity.md)) across the estate.
- Parked 2026-10-10: for [KI-HARNESS-GOV-168](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-168-roll-out-ki-pin-receivers.md) (from island-model-and-tending), `update-ki-pin.yml` filters on `client_payload.source_repository` but tools-ki `release.yml` sends `client_payload.repository`, so `tool-release-published` dispatches would be skipped even after registration; tools-ki currently dispatches only to homebrew-tap. Arcadia now carries `.github/ki-version` and `update-ki-pin.yml`; its receiver stays inert until the tools-release bot App is installed on Arcadia and its secrets are set.

## Next step

1. Background agent `reground` (read-only): re-ground KI-HARNESS-GOV-168 against the reshaped estate - per repository, its pin, receiver and owner-setup state (ruleset, App installation, credentials, auto-merge), provisioned versus waiting, and current `ki repo audit --estate` result.
2. Bring Kris the plan, the ordered owner-setup list (ruleset first, then the bot) and the PIN recommendation; on approval, mark it Ready through `ki-plan` and deliver directly in each repository through `ki agent` (no trades while the hold stands).
