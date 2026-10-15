---
type: ki-checkpoint
thread: platform-foundations.baseline-rollout
label: 'Fnd: baseline-rollout'
state: drained
created_at: 2026-10-08T08:35:00Z
updated_at: 2026-10-15T15:00:00Z
---

# platform-foundations.baseline-rollout

## Objective

Every Knowledge Islands repository meets a solid baseline: `ki repo audit --estate` green and a released `ki` installed on each island ([baseline-rollout](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/baseline-rollout.md), Initiative [platform-foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md)).

## Current state

- Mark: 2026-10-15T14:59Z (drain for sol). ki-pmo read at daa63224. State: drained. Running: nothing; queued: nothing. Thread folder: +/_THREADS/baseline-rollout/ (decisions.md only; nothing in ~/.local/state/ki/agents/baseline-rollout/ is needed to resume). Run: `baseline-rollout` (gate-clear and gate-follow finished). Open queries: none. Waiting on: nothing.
- Re-bootstrapped as a coordination thread under ki-pmo on 2026-10-14; resting.
- The Project has no open work records. [KI-HARNESS-GOV-168 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/14401241/docs/roadmap/KI-HARNESS-GOV-168-roll-out-ki-pin-receivers.md) was cancelled and parked as an idea in the [baseline-rollout](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/baseline-rollout.md) Project note on 2026-10-14, then pruned; its scope (pin receivers, the BREW-013 tool-release consumer registration, and the CI-1 and HOOK-1 roll-out) lives there as an idea.
- The release bot and `main` ruleset are on `ki-agentic-harness` (the reference receiver), `homebrew-tap` and `ki-website`; every further repository needs its `main` ruleset before the bot, as [Release Cascade](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Operations/Processes/Release%20Cascade.md) sets out.
- ki-principal's pre-commit gate now scopes to staged paths. gate-clear and gate-follow committed and pushed the STREAM-9 fix to the mac-studio-bootstrap Project note and the gate-clear report. The remaining whole-tree failures belong to other threads and were handed to the state-of-play thread on 2026-10-15 (GATE-REMAIN). Commit through a private index by explicit path; never `--no-verify`.

## Decisions made

- BASELINE-NEXT (Kris, 2026-10-14): rest the thread; the pin-receiver idea stays parked in the Project note until Kris revives it.
- PRFLOW (Kris, 2026-10-14): background agents keep pushing to harness `main` through the admin bypass; no change to the `ki-delegation` push rule.
- Token budget (Kris, 2026-10-14): until the reset, prefer mechanical work on the lightest model.
- COMMIT-GATE, GATE-FOLLOW (Kris, 2026-10-14 and 2026-10-15): clear this thread's commit-gate blockers on haiku; done.
- GATE-REMAIN and THREADS-CHECKINS (Kris, 2026-10-15): passed to the state-of-play thread by Kris; nothing held here.
- The master thread `_state-of-play` owns cross-project priorities, releases and decisions and does only project management; this thread works only this Project's records (Decisions 17 and 18 in `~/.local/state/ki/agents/state-of-play/decisions.md`).
- Delivered records count as done and are pruned once verified; minor rollout changes are committed directly, citing records by full identifier.
- Trades are on hold (master standing instruction): no new trades; do the work directly in each receiving repository or record it there.
- Rulesets, App installation, credentials and auto-merge settings stay Kris's to change.

## Files touched

This checkpoint and `+/_THREADS/baseline-rollout/`. Records live in `/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/`; the run folder is `~/.local/state/ki/agents/baseline-rollout/`.

## Open questions

- Held with the pin-receiver idea, PIN: `tools-ki` builds `ki` from source in CI and gets no receiver (recommended), rather than a receiver bump.
- Held, CHECKLIST: adopt the stock Repository review Activity across the estate only if Kris approves it for the Capital first.
- Parked 2026-10-10: for the pin-receiver idea, `update-ki-pin.yml` filters on `client_payload.source_repository` but tools-ki `release.yml` sends `client_payload.repository`, so `tool-release-published` dispatches would be skipped; the Capital carries `.github/ki-version` and `update-ki-pin.yml`, inert until the tools-release bot App and secrets are on it.

## Next step

1. Resting; launch nothing until Kris revives the pin-receiver idea.

Resume line: `Resume Fnd: baseline-rollout on sol from its checkpoint under current ki-pmo and ki-delegation since 2026-10-15T14:59Z: re-bootstrap, read the parked queries, take stock, restart authorised work, then banner.`
