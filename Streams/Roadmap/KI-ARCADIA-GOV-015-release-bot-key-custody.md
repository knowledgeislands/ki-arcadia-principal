---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-015
area: GOV
title: Record release bot key custody and rotation
theme: governance
horizon: now
status: ready
blocks: []
blocked_by: []
created_at: 2026-10-05T13:34:00Z
updated_at: 2026-10-05T13:34:00Z
---

# Record Release Bot Key Custody and Rotation

## Goal

Extend the `ki-tools-release-bot` section of [[GitHub Apps]] with where its private key is held, its key history, which repositories hold its credentials, the actual installation scope, a safe rotation procedure and the 2026-10-05 verification evidence, so that a future rotation is repeatable without rediscovering any of it.

## Context

[[KI-ARCADIA-GOV-014-record-tools-release-bot|KI-ARCADIA-GOV-014]] recorded the App as a tracked artefact with credential names and Kris as rotation owner, but not where the key is kept or how to rotate it. On 2026-10-05 the original key was found to be lost; Kris generated a replacement, deleted the old key and re-set the secret across the credential-holding repositories. One step of that rotation silently set an empty secret, because `op document get` fails on a Secure Note attachment and the failed read was piped straight into `gh secret set`. Kris approved recording the custody and rotation guidance on 2026-10-05.

Since GOV-014, `BREW-007` in `homebrew-tap` has landed: the installation now covers `homebrew-tap` as well as `ki-website`, and the tool repositories hold credentials only to mint a token that targets the tap. The existing "Installed (planned)" row therefore conflicts with fact and is replaced.

GOV-014 kept the App ID value out of the island alongside secret values. An App ID is a public identifier, not a secret, and Kris supplied it for recording; the note's opening statement is narrowed to secret values (private keys and tokens), and the App ID is recorded. This supersedes GOV-014's boundary on App ID values only; its exclusion of secret values stands.

## Boundary

- In scope: the `ki-tools-release-bot` section and the Overview credential statement of `Admin/Governance/Conventions/Admin Conventions/GitHub Apps.md`, the `GOV` high-water mark in `Streams/Roadmap/_ISSUES.md`, and this record.
- Never record a private key, installation token or any other secret value. The 1Password item is identified by vault and title only; the `.pem` attachment name is a `<file>` placeholder.
- Out of scope: changing App permissions or installations, rotating keys, editing peer repositories' workflows or settings, and `BREW-010` delivery in `homebrew-tap`.

## Current state

Planned. Facts are from Kris's brief of 2026-10-05.

## Steps

- [ ] Overview: narrow the "never in the island" statement to secret values; note that the App ID is a public identifier recorded below.
- [ ] Attribute table: add App ID 5008264; replace the confirmed and planned installation rows with the actual selected-repository installation (`ki-website`, `homebrew-tap`); add a credential-holders row naming the 7 repositories (`homebrew-tap`, `ki-website`, `tools-ki`, `tools-mgit`, `tools-rig`, `tools-techne`, `tools-git-almanac`) with per-repository, not organisation-level, settings; point key custody at the 1Password item.
- [ ] Add a `Key custody` subsection: 1Password Personal vault, Secure Note "ki-tools-release-bot private key" with the `.pem` attached and listing the App ID, repositories and rotation steps; key history (2026-09-20 key lost; 2026-10-05 key generated and the old key deleted the same day, leaving the 2026-10-05 key as the only active key).
- [ ] Add a `Credential holders` explanation: installed repositories versus repositories that only hold credentials to mint a tap-targeted token.
- [ ] Add a `Key rotation` subsection: generate, update all 7 secrets, delete the old key; `op read "op://Personal/ki-tools-release-bot private key/<file>.pem"` into a shell variable, a non-empty and `BEGIN` check, then pipe to `gh secret set`; the empty-secret trap and its 2026-10-05 cause.
- [ ] Add a `Verification` note: tap intake run 37317227744 (workflow_dispatch) green with the new key, the `tools-ki` and `tools-techne` formulae already at their latest releases so no pull request was expected, full end-to-end proof awaiting the next immutable tool release (`BREW-010` in `homebrew-tap`).
- [ ] Update the note's `updated` timestamp.
- [ ] Run `ki repo audit --progress never` and scan the diff for secret material.

## Files touched

- `Admin/Governance/Conventions/Admin Conventions/GitHub Apps.md`
- `Streams/Roadmap/_ISSUES.md` (GOV high-water mark to 015)
- This record

## Verify

`ki repo audit --progress never` passes. A diff scan finds no key header other than the literal `BEGIN` marker check, no token prefix and no secret value; the only long numerals are the App ID and the workflow run ID. Every fact in Kris's brief appears in the note, and no row still claims a planned installation or a credential scope that conflicts with the brief.

## Dependencies / blocks

None. Relates to `BREW-007` (done) and `BREW-010` (draft) in `homebrew-tap`; neither blocks this record.

## Documentation impact

### Decision Records

None: custody and rotation are operating practice, not a structural decision.

### Specifications

None.

### Guides

The rotation procedure lives in [[GitHub Apps]] beside the artefact it governs.

### Roadmap

This record carries the plan and review evidence.

## Discussion

### Owner approval - 2026-10-05

Kris approved adding key custody and rotation guidance for `ki-tools-release-bot` to [[GitHub Apps]], supplied the facts above, and directed that the record be raised, planned, implemented and left at `done` in one pass after independent review. Capture, shaping and approval therefore occur together, and the record lands directly at `ready`.

### Plan review - 2026-10-05

Fable reviewed the plan and returned ACCEPT, with minor refinements applied before commit: name the 7 credential-holding repositories and the `op://` path form in the Steps, note that GOV-014's App ID boundary is superseded, list `_ISSUES.md` in the Boundary, and clarify what "ki and techne were already current" means.
