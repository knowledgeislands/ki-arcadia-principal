---
note_type: streams/project
slug: baseline-rollout
title: Baseline rollout
outcome: Every Knowledge Islands repository meets the solid baseline - `ki repo audit --estate` is green and the released `ki` is installed on every island.
initiative: platform-foundations
lifecycle: active
lead: Kris Brown
target: null
updated: 2026-10-14T13:49:14Z
author: Written with Claude
---

# Baseline Rollout

## Outcome

Reach a solid Knowledge Islands baseline and roll it out to every island. The test: `ki repo audit --estate` is green and the released `ki` is installed everywhere. Knowledge Islands Principal coordinates; each item is delivered through a work record in its owning repository.

This Project sits in [[platform-foundations|Platform foundations]]. The move of agent work into the Techne footprint is the separate [[agent-host]] Project, and neither gates the other. [[estate-factorisation]] owns structure, MCP, distribution and `ki` pin automation, and its remainder does not gate this Project; [[paperclip-capture-and-rebuild]] and [[trades-revamp]] own their own scope.

---

## Notes

- Kris split `baseline-and-cloud` into this Project and the Techne agent-host work on 2026-10-07. Work that moves neither `ki repo audit --estate` nor the `ki` install belongs elsewhere.
- The delivery order runs conform activation first, then consistent commit gates before rollout, then hook governance, with the criterion-coverage and dependency-cruiser work alongside. Kris approves the order before delivery starts.
- The commit-gate work must preserve the supported boundary install.
- An estate audit did not finish within five minutes on 2026-10-07, so the gate needs a run that completes before it can be judged.
- `tools-ki` could add a terminal Granola disposition for meetings dropped without harvest. The ledger has none, so the dropped 2026-10-05 Alec catch-up is recorded `harvested-locally`. Kris has not decided whether to capture it in `tools-ki` or leave it.
- **Idea: Bun boundary proof adapter.** Let the `ki-engineering` boundary check prove a repository whose suite runs under `bun test` with TypeScript outside `src/`, and a flat repository's root `scripts/`, so `ki-agentic-harness` can adopt Dependency Cruiser as the reference Bun adopter. Kept as an idea on 2026-10-09 in place of a cancelled harness work record: Kris approved all capture-sweep-2 proposals on 2026-10-09 in the state-of-play run, including cancelling the harness record as an 'idea in baseline-rollout'.
- **Idea: Observatory adopts `ki-diagrams`.** `apps-observatory.local` could declare `[skills.ki-diagrams]`, retire its own `scripts/diagrams/export-svg.ts` for the harness copy, and move the operational fields of its seven diagrams from `docs/diagrams/README.md` into `docs/diagrams/diagrams.toml`. Kept as an idea on 2026-10-09 in place of a cancelled Observatory work record: Kris approved all capture-sweep-2 proposals on 2026-10-09 in the state-of-play run, including making the two orphan records 'as direct changes, cancel both'.
- **Idea: enforce the commit gate.** Each repository shape states what its committed `.githooks/pre-commit` runs, repositories without a hook receive trades to add one, and once the estate converges `HOOK-1` and `HOOK-2` move from WARN to FAIL. Kept as an idea on 2026-10-11 in place of a cancelled harness work record, under Kris's 2026-10-11 'TRIAGE approve all' in the state-of-play run.

### Close-out assessment

Nothing has been delivered against the Outcome: the Project has carried no work since it was registered, and the estate audit has never run to completion, so the gap is unmeasured. The Outcome still stands. The first step is to measure the starting point: a completed `ki repo audit --estate` run and a check of the released `ki` on every island, with each gap captured as a record in its owning repository. That follow-up was a separate Knowledge Islands Principal audit record until it was folded into this note on 2026-10-09, when Kris approved all capture-sweep-2 proposals on 2026-10-09 in the state-of-play run, including folding the duplicate audit record 'into baseline-rollout'. The Project stays open.

- **Idea: roll out the `ki` pin receivers.** Every `knowledgeislands` repository that installs a released `ki` in CI would keep its pin in `.github/ki-version`, run the auto-merging `update-ki-pin.yml` receiver copied from the `ki-engineering` exemplar, and be registered as a tap-dispatch consumer in `homebrew-tap`'s `.github/tool-release-consumers.json`, so each release reaches it within minutes. On 2026-10-09 nineteen repositories still pinned `v0.8.4` inline (apps-observatory, homebrew-tap, ki-principal, ki-specifications, ki-techne-harness, ki-website, the seven mcp repositories, tools-git-almanac, tools-ki, tools-mgit, tools-rig and tools-techne); only the harness, homebrew-tap and ki-website had the release bot installed. The order: re-ground each repository's pin, receiver and owner setup; decide with Kris whether `tools-ki` tracks its own releases or builds from source; send one `ki-trades` work trade per repository, first where owner setup is complete; ask Kris to complete each waiting repository's setup in order (`main` ruleset, App installation, App ID variable, private-key secret, auto-merge); register each provisioned repository with the tap only after provisioning, since registration before App installation fails the tap's token mint for every consumer. Kris approved installing `ki-tools-release-bot` across the organisation on 2026-10-09 and approved merging the tap's own registration record into the harness record the same day, in the state-of-play run; Kris deferred it to Future on 2026-10-12 ('ROADMAP-BATCHES 3 to 5 approved as recommended') because only the harness and this base carry the receiver and the current rollout does not need the rest. Kept as an idea on 2026-10-14 in place of a cancelled harness work record: Kris approved the state-of-play thread's roadmap census on 2026-10-14 ('RC-ALL: approve all'), which parked it.
