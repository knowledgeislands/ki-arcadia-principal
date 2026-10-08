---
id: KI-ARCADIA-GOV-030
area: GOV
title: Refresh the release App note
kind: deliver
purpose: corrective
project: estate-factorisation
horizon: triage
status: draft
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-08T08:20:00Z
updated_at: 2026-10-08T08:20:00Z
---

# Refresh the release App note

## Goal

The `ki-tools-release-bot` section of the GitHub Apps convention records the release chain's current proof and points to the tap's operations guide rather than to a retired tap record.

## Context

`homebrew-tap` BREW-012 reconciled three disagreements about the shared release App. One sits in Arcadia: the [[GitHub Apps]] note's Verification subsection says full end-to-end proof awaits the next immutable tool release, tracked as `BREW-010` in `homebrew-tap`. `BREW-010` is no longer on the tap's `main`, and the proof now exists: on 2026-10-07 the App opened and auto-merged tap formula PRs #23 to #29 and KI Website PRs #24 to #28 for `ki` v0.8.1 to v0.9.0 and `mgit` v0.16.0.

The note's other release-App facts were checked and still hold, including the tap as an installation target and the seven credential holders. BREW-012 adds the tap's sender-side operations guide at `docs/guides/maintainer/release-app-operations.md`, which cites this note for key custody and rotation.

Originating repository and item: `homebrew-tap` BREW-012. Neither item blocks the other.

## Boundary

In scope: the Verification subsection and a pointer to the tap guide. Out of scope: key custody, the rotation procedure and any App permission or installation change.

## Current state

Captured on 2026-10-08 as a handoff from BREW-012; not adopted.

## Steps

- [ ] Plan through `ki-plan` once adopted.

## Files touched

`Admin/Governance/Conventions/Admin Conventions/GitHub Apps.md`, through the Enactment Process.

## Verify

`ki repo audit` passes and the note no longer names `BREW-010`.

## Dependencies / blocks

None.

## Documentation impact

### Decision Records

None.

### Specifications

None.

### Guides

None here; the tap owns its operations guide.

### Roadmap

Closes the Arcadia side of BREW-012's reconciliation.
