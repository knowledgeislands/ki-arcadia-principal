---
note_type: stream-roadmap
id: KI-ARCADIA-ECO-002
area: ECO
title: Rehome ecosystem Agoras
theme: ecosystem-coordination
horizon: now
status: ready
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-24T08:33:22Z
updated_at: 2026-09-24T08:33:22Z
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

- [ ] Record the immutable Arcadia baseline and mark the item In progress.
- [ ] Declare the three Arcadia homes with the exact current member set and roles.
- [ ] Replace the Agentic Harness `ki-all` and `ki-fnd` homes with reciprocal membership in all three Arcadia-owned Agoras; retain its `ki-mcps` home unchanged.
- [ ] Repoint and reconcile every current member declaration without touching unrelated working-tree changes.
- [ ] Add Observatory to `ki-all`, add `ki-plugins` to `ki-fnd`, remove non-`ki-*` `ki-fnd` memberships, and add all agreed `ki-tools` members.
- [ ] Audit every changed repository locally, then inspect estate-level reciprocity and unresolved peers.
- [ ] Record exact revisions and any receiver blocker in the review packet.
- [ ] Add the required review packet and move this item to Awaiting review.

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

## Governance

This roadmap record adheres to [[Enactment Process]]. Each repository independently consents by accepting its local declaration; Arcadia's home declaration cannot grant consent on its behalf.
