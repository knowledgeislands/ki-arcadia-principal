---
id: KI-ARCADIA-GOV-030
area: GOV
title: Refresh the release App note
kind: deliver
purpose: corrective
project: estate-factorisation
status: done
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-08T08:20:00Z
updated_at: 2026-10-09T21:29:58Z
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

Captured on 2026-10-08 as a handoff from BREW-012. On 2026-10-09 Kris Brown approved the bounded note edit and this record's closure directly, as an explicit owner instruction under the Enactment Process, so the record was not separately adopted or planned.

## Steps

- [x] Replace the `BREW-010` sentence in the Verification subsection with the 2026-10-07 proof.
- [x] Add a pointer to the tap's release App operations guide at a pinned revision.

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

## Review

### Delivered

The GitHub Apps note records the release chain's 2026-10-07 end-to-end proof and points to the tap's release App operations guide.

### Change Summary

Commit `7f25851` replaces the `BREW-010` "awaits" sentence with the proof - `homebrew-tap` formula pull requests #23 to #29 and `ki-website` registry pull requests #24 to #28 for `ki` v0.8.1 to v0.9.0 and `mgit` v0.16.0 - and adds a link to `docs/guides/maintainer/release-app-operations.md` in `homebrew-tap` at revision `8111c9a9944f9f335a6ecfb1cf8c3a20cea6b4be`. The note's `updated` field advanced.

### Verification

`ki repo audit` passes for `ki-work-roadmap` and `ki-authoring`; `ki-repo-kb-streams` shows only its existing warning about the `specifications` Project close-out in `ki-agentic-harness`, unchanged from before this change. The note no longer names `BREW-010`.

### Outstanding concerns

None. Key custody, the rotation procedure and App permissions and installation are unchanged.

### Post-change review

The edit stays within the Verification subsection and the guide pointer. The pinned tap revision is on the tap's published `main`.

### Mini recap

Closes the Arcadia side of BREW-012's reconciliation.

## Done

Accepted 2026-10-09 by Kris Brown, by Decision 2 of the island-model-and-tending thread, which approved the note edit and this record's closure.

## Discussion

None.
