---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-014
area: GOV
title: Record the tools release bot as a tracked artefact
theme: governance
horizon: now
status: awaiting-review
blocks: []
blocked_by: []
baseline_ref: e4f6ab4f425ff3e56be9cc3d33ef04bf3921a9a5
created_at: 2026-10-05T10:25:00Z
updated_at: 2026-10-05T10:31:00Z
---

# Record the Tools Release Bot as a Tracked Artefact

## Goal

Record the `ki-tools-release-bot` GitHub App in Arcadia's governance as a tracked organisation artefact - its ownership, permissions, installation scope, credential names, consuming workflows, purpose and key-rotation owner - alongside a brief inventory of the other Apps installed on the `knowledgeislands` organisation.

## Context

Kris decided on 2026-10-05 (decision (a), raised alongside `KI-WEB-SITE-042` in `ki-website`) that the release bot should be a tracked artefact rather than knowledge held only in workflow files and GitHub settings. The App mints the tokens behind the tool release chain: an immutable tool release, then a Homebrew tap formula PR, then a KI Website registry PR, with auto-merge downstream of the immutable release. Nothing in Arcadia currently names it, its credentials or who rotates its key.

[[Integrations]] lists the tools Arcadia's own Activities resolve at runtime (MCP prefixes, inbox paths). An organisation-level GitHub App inventory is a different subject - estate infrastructure rather than Arcadia's runtime surface - so it is better held in its own Admin Conventions note and signposted from [[Integrations]].

## Boundary

- In scope: a new `GitHub Apps` note under `Admin/Governance/Conventions/Admin Conventions/`, a pointer from [[Integrations]], and the [[Admin Conventions]] index entry.
- Record credential names only. Never record an App private key, installation token, App ID value or any other secret value.
- Out of scope: changing App permissions or installations, rotating keys, editing peer repositories' workflows, and `BREW-007` delivery in `homebrew-tap`. Planned installations are recorded as planned, not as fact.

## Current state

Delivered on 2026-10-05: [[GitHub Apps]] records the release bot and the other organisation Apps, signposted from [[Integrations]] and indexed in [[Admin Conventions]]. Live organisation state (read through `gh api orgs/knowledgeislands/installations` on 2026-10-05) matched the recorded facts: `cloudflare-workers-and-pages` and `claude` on all repositories, and `ki-tools-release-bot` on selected repositories with Contents write, Pull requests write and Metadata read, created 2026-09-20.

## Steps

- [x] Create `Admin/Governance/Conventions/Admin Conventions/GitHub Apps.md` recording the release bot: creation date and owning organisation, permissions, installation scope (confirmed `ki-website`; planned `homebrew-tap` and the tappable tool repositories per `BREW-007`), credential names `KI_TOOLS_RELEASE_BOT_APP_ID` (variable) and `KI_TOOLS_RELEASE_BOT_PRIVATE_KEY` (secret), consuming workflows (`homebrew-tap` `propose-tool-releases.yml` and `ci.yml` notify-consumers; `ki-website` `update-tool-release.yml`), purpose, and key-rotation owner (Kris).
- [x] Briefly list the other organisation-installed Apps (`claude`, `cloudflare-workers-and-pages`) and Dependabot.
- [x] Signpost the new note from [[Integrations]] and add it to the [[Admin Conventions]] index.
- [x] Run `ki repo audit --progress never` and confirm no secret value appears in the diff.

## Files touched

- `Admin/Governance/Conventions/Admin Conventions/GitHub Apps.md` (new)
- `Admin/Governance/Conventions/Admin Conventions/Integrations.md`
- `Admin/Governance/Conventions/Admin Conventions/Admin Conventions.md`
- This record

## Verify

`ki repo audit --progress never` passes. A diff review shows only credential names, no secret or App ID value. Facts match the live installation listing and the brief from Kris.

## Dependencies / blocks

None. Relates to `KI-WEB-SITE-042` in `ki-website` (auto-merge behind the release bot) and `BREW-007` in `homebrew-tap` (planned installations); neither blocks this record.

## Documentation impact

### Decision Records

None: the auto-merge choice is recorded in `ki-website` as `ODR-KI-WEBSITE-001`; this record inventories the artefact.

### Specifications

None.

### Guides

None beyond the new convention note.

### Roadmap

This record carries the plan and review evidence.

## Review

### Delivered

Approved boundary: a new [[GitHub Apps]] convention note, a pointer from [[Integrations]] and the [[Admin Conventions]] index entry. Excluded: App permission or installation changes, key rotation, peer-repository edits and `BREW-007` delivery. Immutable baseline `e4f6ab4f425ff3e56be9cc3d33ef04bf3921a9a5`; the delivery commit follows this packet.

### Change Summary

- `Admin/Governance/Conventions/Admin Conventions/GitHub Apps.md` (new): release bot attribute table (owner, created, permissions, selected installation, confirmed `ki-website`, planned `homebrew-tap` and tappable tools per `BREW-007`, credential names, rotation owner Kris), workflow table, the website ruleset relationship, and a short table for `claude`, `cloudflare-workers-and-pages` and Dependabot.
- `Integrations.md`: one paragraph signposting [[GitHub Apps]].
- `Admin Conventions.md`: index row for [[GitHub Apps]].
- Placement decision: a separate note, because [[Integrations]] holds Arcadia's runtime tool table for Activities, whereas organisation Apps are estate infrastructure.

### Verification

- `ki repo audit --progress never`: PASS (23 skills, exit 0).
- Diff scan for key headers, token prefixes and long numeric values: none. Only credential names appear; the App ID value is not recorded.
- Facts cross-checked against the live organisation installation listing and Kris's brief.

### Outstanding concerns

None. Planned installations are labelled as planned and will need updating as `BREW-007` lands.

### Post-change review

The goal is met within the boundary: the bot is now a named, tracked artefact with its credential names and rotation owner, without any secret value. Regression risk is nil beyond the touched notes. Ready for acceptance.

### Mini recap

New [[GitHub Apps]] note with pointer and index entry; audit PASS. Learning route: update [[GitHub Apps]] when `BREW-007` installs the bot on further repositories or a key is rotated.

## Discussion

### Owner decision (a) - 2026-10-05

Kris directed that `ki-tools-release-bot` be recorded in Arcadia as a tracked artefact, adding to [[Integrations]] or a separate note if its structure suits that better, and that this record be raised, planned, implemented and left at `done` in one pass. Capture, shaping and approval therefore occur together, and the record lands directly at `ready`.
