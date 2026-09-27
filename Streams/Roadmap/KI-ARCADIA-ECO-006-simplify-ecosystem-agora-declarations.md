---
note_type: stream-roadmap
id: KI-ARCADIA-ECO-006
area: ECO
title: Simplify ecosystem Agora declarations
theme: ecosystem-coordination
horizon: triage
status: draft
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-27T17:43:10Z
updated_at: 2026-09-27T22:02:31Z
---

# Simplify Ecosystem Agora Declarations

This record captures the requested consolidation. It is not yet an approved canonical-content change.

## Goal

Retain one reciprocal ecosystem Agora named `kis`, replacing `ki-all` and retiring `ki-fnd`, `ki-mcps`, and `ki-tools`.

## Context

The four-group arrangement is stated in [[GDR-KI-FUNDAMENTALS-001]]. The owner and member declarations are distributed across Arcadia, the Agentic Harness, product repositories, and dotfiles. Live examples in the Harness, Observatory, and `mgit` also name the retired groups. Agora membership is non-exclusive: dotfiles joins both `kis` and `personal`, while `kit-legal` joins both `legal` and `equalremedy`.

## Progress

The home and reciprocal member declarations now name `kis`; the other three homes and their consents have been removed. `ki agora audit kis` reports one healthy profile with no findings. Live README and `mgit` examples have been updated. The requested overlapping memberships also pass `ki agora audit personal` and `ki agora audit equalremedy`. The canonical shared Decision Record remains unchanged pending Enactment approval.

## Proposed canonical amendment

Amend the existing living shared Decision Record in place. Its replacement Agora paragraph will state that Arcadia owns `kis` for all governed Knowledge Islands ecosystem repositories; Arcadia explicitly declares every non-owner member and each member independently consents. Membership in another Agora is permitted and does not change `kis` membership or authority. Product repositories retain role `product`, the Agentic Harness `governance-harness`, the Techne Harness `execution-harness`, `homebrew-tap` `distribution`, and dotfiles `environment`. Arcadia participates automatically as owner. Membership grants no source or product ownership, priority, routing, implementation, release, publication, or acceptance authority. Reconcile the six shared copies without altering other factorisation decisions. Update any canonical index text that names the retired groups.

## Verification

- `ki agora audit kis` reports healthy reciprocity.
- No `.ki.toml` declares `ki-all`, `ki-fnd`, `ki-mcps`, or `ki-tools`.
- Current user guidance names `kis`; historical evidence and test fixtures may retain old identifiers as examples.
- Decision Record audits pass in repositories whose shared copy changes.

### Pickup checkpoint - 2026-09-27

Before further implementation, reconcile the current destination branch, linked coordination tasks, and retained worktrees where applicable. Missing evidence does not release ownership or a hold; this checkpoint is guidance, not a mechanical execution block.

- **Observed:** `ki agora audit kis` reports one healthy profile with no findings. The live declaration work described above is present, while `GDR-KI-FUNDAMENTALS-001` still names the four retired groups.
- **Resolve:** Treat the Decision Record amendment and any shared-copy reconciliation as the remaining canonical change. Verify the proposed roles and memberships against live declarations, then adopt and plan this Triage record through the Enactment Process before editing canonical content. Re-run the Agora and Decision Record checks after delivery.
- **Close:** A healthy live audit alone does not close this draft. After the canonical amendment is reviewed, seek owner acceptance through `ki-accept`, retain the `done` record, and leave pruning for a later explicit selection.

## Governance

This roadmap record adheres to [[Enactment Process]]. Move the proposed Decision Record amendment into `Admin/` only after approval of a ready record.
