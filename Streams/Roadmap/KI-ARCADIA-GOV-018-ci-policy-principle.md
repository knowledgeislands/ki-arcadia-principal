---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-018
area: GOV
title: CI policy principle
kind: deliver
purpose: governance
project: estate-factorisation
component: engineering-practice
status: cancelled
resolution: obsolete
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-06T01:20:06Z
updated_at: 2026-10-07T17:20:40Z
---

# CI Policy Principle

## Goal

Arcadia's Engineering Practice states one continuous-integration principle for Knowledge Islands repositories: pin released tools, bump those pins automatically, gate on `ki repo audit`, and treat warnings as debt to be paid down rather than noise to be ignored.

## Context

The 2026-10-06 roadmap consolidation found that the estate already behaves this way in part, but no canonical note says why. Arcadia's own CI pins `KI_VERSION: v0.6.1` in `.github/workflows/ci.yml` and installs that released `ki` from `tools-ki`; 21 repositories across the estate pin the same release. Pins are not yet bumped automatically: the tap's `.github/tool-release-consumers.json` in `knowledgeislands/homebrew-tap` lists only `knowledgeislands/ki-website` as a release consumer, so every other pin moves by hand.

No note in [[Engineering Practice]] covers CI. [[Principles]] under `Pillars/Engineering Practice/Foundations/` states no CI principle on tool pinning, gates or warning treatment. Arcadia owns Techné's canonical Engineering Practice, so the principle belongs here, while the mechanical rule that repositories are audited against belongs to the harness `ki-engineering` standard. That standard's rubric already carries `CI-1` (CI installs the declared toolchain, a released `ki` rather than a source checkout) as a warning-only criterion; it says nothing about automatic bumps, the audit as gate, or warning debt.

Two related gaps sit outside Arcadia in the same consolidation plan: a harness item for a receiver contract that bumps `KI_VERSION` from the tap's consumer dispatch and opens an auto-merge pull request, and a tap item to register the pinned repositories as consumers once that receiver exists. Neither blocks this record, and this record blocks neither.

## Boundary

- Adopted into Now at `draft` by Kris Brown on 2026-10-06. Adoption does not plan or ready the record, and nothing reaches `Pillars/` until the owner readies it under the [[Admin/Operations/Processes/Enactment Process|Enactment Process]].
- Arcadia owns the principle and its rationale in Engineering Practice. It does not own the `ki-engineering` rubric, CI workflow templates, the tap consumer list or any receiver workflow.
- No write to `ki-agentic-harness`, `homebrew-tap`, `tools-ki` or any other repository, and no change to any repository's CI.
- No remote operation under the [[Techne Programme Hold]].

## Cancelled

Approved by Kris on 2026-10-07 under decision 13 of the state-of-play design ("Yes please, lets reduce stuff": cancel and prune obsolete or ownerless records).

Its premise that CI has no audit gate is stale: the `ki-engineering` rubric carries `CI-1`, and automatic pin bumps are owned by KI-HARNESS-GOV-141 in `knowledgeislands/ki-agentic-harness` (`docs/roadmap/KI-HARNESS-GOV-141-auto-bump-released-ki-pin.md`). The remaining principle note had no driver. No outstanding changes.

## Discussion

### Candidate principle

- **Pin released tools.** CI installs a named release of `ki` and other estate tools, never a source checkout or a floating latest, so a run is reproducible and a tool change reaches a repository as a reviewable diff.
- **Bump pins automatically.** A tool release dispatches to its consumers, which open an auto-merge pull request moving the pin; the repository's own gate decides whether it lands.
- **The audit is the gate.** `ki repo audit` passing in CI is the merge condition for governance conformance, alongside the repository's own build and tests.
- **Warnings are debt.** A warning is a recorded shortfall with an owner, not permission to ignore it; repositories pay it down rather than accumulate it, and a standard may promote a warning to a failure once the estate is clean.

### Handoff to the harness `ki-engineering` standard

On adoption, raise a non-blocking work handoff to `knowledgeislands/ki-agentic-harness` over the declared `work` route, proposing that `ki-engineering` reflect the principle mechanically: extend or accompany `CI-1` with criteria for automatic pin bumps and the audit gate, and state how warning-only criteria mature. The harness owns that standard's disposition, priority and wording. This is recorded in prose because `blocks` and `blocked_by` hold local identifiers only, and no trade is raised while the record is unadopted triage.

### Open questions

- Whether the principle sits in [[Principles]] or in its own Engineering Practice note under `Technology/` or `Operating Model/`.
- Whether "warnings are debt" needs a stated mechanism, such as a warning count in the review packet or a promotion schedule, or stays a stance.
- Whether the principle covers all pinned estate tools or `ki` alone for now.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
