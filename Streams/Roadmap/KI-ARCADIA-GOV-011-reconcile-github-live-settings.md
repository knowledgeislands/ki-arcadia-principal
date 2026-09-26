---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-011
area: GOV
title: Reconcile GitHub live settings with the declared contract
theme: governance
horizon: triage
status: draft
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-26T16:26:40Z
updated_at: 2026-09-26T16:26:40Z
---

# Reconcile GitHub Live Settings with the Declared Contract

This record is a discussion proposal captured from an audit observation. It is not accepted, prioritised, or implementation authority.

## Goal

Decide and carry out a bounded pass that brings the `knowledgeislands/ki-arcadia-principal` GitHub repository settings back into agreement with what `.ki.toml` declares, so `ki repo audit --skill ki-repo` returns a clean result.

## Context

`ki repo audit` on 2026-09-26 reported one remaining failure against the GitHub live state: `Repository feature toggles (TOGGLE-1)` - Issues are enabled, and the contract wants them disabled because `[skills.ki-work-github-issues]` is not declared. Arcadia declares `[skills.ki-work] adapter = "kb-streams"`, so its forward work lives in `Streams/Roadmap/` and the GitHub issue tracker has no governed role.

A second finding in the same run, `Package identity metadata (PKG-1)` - `package.json` must not carry `bugs` - was already resolved locally by commit `1cc7136`, which removed the field. The finding evaluates the live state as well as the checkout, so it will only clear once `main` is pushed. No push was made during the capturing session.

Neither remedy is a local file edit. Disabling Issues is a change to repository settings on GitHub, and clearing PKG-1 needs a push of already-committed work. Both therefore need explicit owner authority rather than an ordinary content change.

## Boundary

This record covers reconciling GitHub live settings for this repository only. It does not decide the estate-wide policy for issue trackers, sweep peer repositories, adopt `[skills.ki-work-github-issues]` as an alternative resolution without a decision, or authorise a push on its own.

## Discussion

### Two available resolutions, and they are not equivalent

Disabling Issues affirms that `Streams/Roadmap/` is Arcadia's single forward-work surface, which is what the repository already practises. Declaring `[skills.ki-work-github-issues]` instead would satisfy the same audit rule by admitting a second queue, and would contradict the adapter already in force. The first is almost certainly right, but it closes a public intake route on a public repository and so is the owner's call.

### Relationship to the existing topics finding

[[Streams/Roadmap/KI-ARCADIA-GOV-006-audit-topics-discussion|KI-ARCADIA-GOV-006]] holds an earlier audit observation of the same class: GitHub topics drifting from `package.json` keywords. Both are GitHub live-state drift against the declared contract, and one settings pass could reasonably close both. Whether to merge them or keep them separate needs confirmation, since GOV-006 sits at `future` and is already adopted.

### Verification

`ki repo audit --skill ki-repo` is the gate. It reads live GitHub state, so it will keep failing until the settings change has actually been applied, which makes it a usable check rather than a formality.
