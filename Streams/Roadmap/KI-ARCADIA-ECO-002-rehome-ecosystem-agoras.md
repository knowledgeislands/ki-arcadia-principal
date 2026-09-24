---
note_type: stream-roadmap
id: KI-ARCADIA-ECO-002
area: ECO
title: Rehome ecosystem Agoras
theme: ecosystem-coordination
horizon: now
status: awaiting-review
blocks: []
blocked_by: []
baseline_ref: 1419d03170c5de0fa37ba8902d43fb9594851022
created_at: 2026-09-24T08:33:22Z
updated_at: 2026-09-24T09:20:00Z
---

# Rehome ecosystem Agoras

## Goal

Make Arcadia the reciprocal home of `ki-all`, `ki-fnd`, and the new `ki-tools` working set, while retaining `ki-mcps` at the Agentic Harness until the approved OpenAI MCP merge can move its surviving set directly.

## Context

The Agentic Harness currently owns `ki-all`, `ki-fnd`, and `ki-mcps`, although these are ecosystem coordination groups rather than Harness product boundaries. The current declarations also omit Observatory and `tools-techne`, place several non-`ki-*` repositories in `ki-fnd`, omit `ki-plugins`, and provide no tools-family Agora.

The maintainer approved Arcadia ownership, prefix-selected explicit membership, reciprocal consent, both harnesses as true related members, and `homebrew-tap` as a true `ki-tools` distribution member on 2026-09-24.

## Boundary

This item may declare Arcadia homes for `ki-all`, `ki-fnd`, and `ki-tools`; remove the corresponding Harness homes; and reconcile the reciprocal member declarations in the current 24-repository pre-merge estate. It may assign the agreed roles `product`, `governance-harness`, `execution-harness`, and `distribution`; dotfiles uses `environment` for its `ki-all` responsibility.

It does not move `ki-mcps`, merge or rename an MCP repository, change source ownership, create aliases or dual homes, alter repository work priority, or add a reference in place of an agreed true member. OAI-1 owns the direct post-merge `ki-mcps` move to Arcadia.

## Membership rules

- `ki-all` contains every governed Knowledge Islands organisation repository plus `krisb/dotfiles`.
- `ki-fnd` contains every canonical repository basename beginning `ki-`.
- `ki-tools` contains every canonical basename beginning `tools-`, plus `homebrew-tap`, the Agentic Harness, and the Techne Harness.
- Prefix rules define the expected set but never create membership dynamically. Every member appears in the Arcadia home declaration and independently declares the same home and role.
- Arcadia participates automatically as owner and is not listed in `members`.
- Agora membership grants no source ownership, product ownership, priority, work routing, implementation, release, publication, or acceptance authority.

## Steps

- [x] Record the immutable Arcadia baseline and mark the item In progress.
- [x] Declare the three Arcadia homes with the exact current member set and roles.
- [x] Replace the Agentic Harness `ki-all` and `ki-fnd` homes with reciprocal membership in all three Arcadia-owned Agoras; retain its `ki-mcps` home unchanged.
- [x] Repoint and reconcile every current member declaration without touching unrelated working-tree changes.
- [x] Add Observatory to `ki-all`, add `ki-plugins` to `ki-fnd`, remove non-`ki-*` `ki-fnd` memberships, and add all agreed `ki-tools` members.
- [x] Audit every changed repository locally, then inspect estate-level reciprocity and unresolved peers.
- [x] Record exact revisions and any receiver blocker in the review packet.
- [x] Add the required review packet and move this item to Awaiting review.

## Files touched

- Arcadia, Agentic Harness, and member repository `.ki.toml` files only
- `+/knowledge-islands-factorisation-roadmap.md`
- `+/knowledge-islands-fundamentals-amendment-plan.md`
- `+/knowledge-islands-factorisation-evidence-2026-09-20.md`

## Verify

- `ki repo audit --skill ki-agora --repo <changed-repository>` passes in every changed repository.
- `ki agora show ki-all`, `ki agora show ki-fnd`, and `ki agora show ki-tools` resolve one Arcadia owner and reciprocal current members.
- The family sets match the canonical repository inventory and no owner lists itself as a member.
- The Agentic Harness remains the unchanged `ki-mcps` home until OAI-1.

## Dependencies and blocks

The non-MCP move is independently executable. OAI-1 remains responsible for merging the OpenAI housekeeping repositories and moving the surviving `ki-mcps` group to Arcadia without repointing the retiring Codex repository.

## Escalation points

Stop on a changed target `.ki.toml`, an identity mismatch, an unapproved family exception, or an audit result that would require changing source ownership or another governance contract.

## Review

### Delivered

Arcadia is now the reciprocal home of `ki-all`, `ki-fnd`, and `ki-tools`. Every current member independently declares the matching home and role. The Agentic Harness remains the healthy `ki-mcps` home until OAI-1.

### Summary of changes

`ki-all` now includes all 24 current pre-merge repositories, including Observatory and `tools-techne`. `ki-fnd` now contains Arcadia and the six canonical `ki-*` members only. `ki-tools` contains Arcadia, all five `tools-*` products, both harnesses, and `homebrew-tap` as a true `distribution` member. Dotfiles participates in `ki-all` with role `environment`.

Accepted configuration revisions are:

- Arcadia Principal: `093fcfd4e9b73b49ea392556779ed5a1ae8b4e1c`
- Observatory: `6db7dee33af82f489781591bd3213c3213b05725`
- Homebrew tap: `2a89db2f948f36fe6ee4d453567f63d09c84e0c7`
- Agentic Harness: `59c4c476f5f1798cfc6684f8add82bbac61b8c2e`
- KI Plugins: `d177a05efd94e6280abb5aa0206b5ed8e5c8f996`
- KI Specifications: `d27769d731d2e26fde85c60ec702505f44f509af`
- Techne Harness: `194dabfe3bdb7176c23aef9b9e4b52b493d43e7c`
- Techne Principal: `be997edfec92c55a00f89a5f63cf8301a1bec0b8`
- KI Website: `fe3781b1f8a39a92e7e7bbaad96bbd730650a2bf`
- WhatsApp MCP: `b5582536554a4b640f927eefb9c9999dbd0a03f9`
- Git Audit MCP: `8e72842455d1b6326117507f67e9e4ab43900f9c`
- Google Workspace MCP: `eed3fab71b0531ca7fa7c4c3e8d59581cc641208`
- ChatGPT housekeeping MCP: `1c3b98fa90710a78af697eae423605a503c5cdc1`
- Claude housekeeping MCP: `2087300f80449322f97f916acdc9f164d3d45572`
- Codex housekeeping MCP: `21f06ef57de39a2ce36268d7f0fdcfe64d0f329c`
- KI KB filesystem MCP: `4029ebc24b47b3ae8cdbc6eebade7d7ace0d9a56`
- Notion mirror MCP: `db8ad03a1cdf581d0cb70725c09725d4ddb10a42`
- Microsoft 365 MCP: `298a62b59135be2aea98738899c9e1889639d6f6`
- Git Almanac: `1ff10e647d3e7614dfb151c9e878ca0f4c85f483`
- `tools-ki`: `4f1a4e622229636094fc1085af91efee81325beb`
- `tools-mgit`: `485594bd4dfefbcda4a9e3f4757f2e998846bc06`
- `tools-rig`: `589fcd2b908c4d9f684e2f8ea88a936569509fb2`
- `tools-techne`: `a415ee6fd6634bbe832653b83256ae689b192ae7`
- Dotfiles: `b11e19861c70e9cf13788d2234d3e20b50f93e2c`

### Verification

All 24 local `ki-agora` audits pass. Estate audits report `ki-all`, `ki-fnd`, `ki-tools`, and the unchanged `ki-mcps` healthy with zero findings. Resolved participant counts are 24, 7, 9, and 10 respectively. No home lists itself as a member, and no alias, reference, or dual home was introduced.

### Outstanding concerns

OAI-1 still needs to merge the ChatGPT and Codex housekeeping products, add both harnesses as true related `ki-mcps` members, and move the surviving group directly to Arcadia. Agentic Harness, `tools-rig`, and dotfiles retained unrelated user-owned changes. Dotfiles' adjacent trade routes were restored and separately audited after the initial section replacement exposed its different table order.

### Post-change review

The three independently executable working sets now match the approved repository families and related-member exceptions. Reciprocal consent is observable, while repository ownership and work authority remain unchanged.

### Mini recap

Arcadia now provides the central ecosystem coordination point requested by the factorisation review. The only deferred Agora change is the intentionally sequenced `ki-mcps` move under OAI-1.

## Governance

This roadmap record adheres to [[Enactment Process]]. Each repository independently consents by accepting its local declaration; Arcadia's home declaration cannot grant consent on its behalf.
