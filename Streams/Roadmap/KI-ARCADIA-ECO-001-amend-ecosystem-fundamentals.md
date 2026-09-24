---
note_type: stream-roadmap
id: KI-ARCADIA-ECO-001
area: ECO
title: Amend ecosystem fundamentals
theme: ecosystem-coordination
horizon: now
status: awaiting-review
blocks: []
blocked_by: []
baseline_ref: 67d386d8169673505516402249fbce57b39cb9c5
created_at: 2026-09-24T08:33:22Z
updated_at: 2026-09-24T09:08:00Z
---

# Amend ecosystem fundamentals

## Goal

Rewrite `GDR-KI-FUNDAMENTALS-001` in place as the current estate responsibility, routing, repository-structure, boundary, and coordination record, then distribute the exact shared projection to its five existing receivers.

## Context

The current record describes six primary repositories, gives KI Specifications active pre-V1 authority, and treats MCP servers as an Agentic Harness capability kind. The approved factorisation establishes an estate-wide routing model, independently owned products, Arcadia coordination where work has no natural home, and dormant KI-wide specifications before overall V1.

`KI-ARCADIA-GOV-009` prepared the evidence and exact amendment boundary. The maintainer approved implementation on 2026-09-24.

## Boundary

This item may amend the Arcadia source record, its local index gloss, the five existing shared projections and their local index glosses, and the factorisation coordination sources that define the campaign. It must preserve the shared record identity, current status, decision type, and receiver-local `note_type` exception.

It does not create KI-wide specifications, add projections to repositories outside the existing six-copy set, change product source, merge repositories, or accept receiver work on a receiver's behalf.

## Locked decisions

- Arcadia is the canonical authoring and default ecosystem-coordination home when no natural repository owns the question.
- Natural-owner work stays local; clear bilateral work uses a direct handoff or declared trade route; cross-estate or unowned work uses an Arcadia `ECO` record.
- Repository structure, authority, source ownership, projection and distribution, runtime state, and working-set membership remain separate.
- Project and Knowledge Base are the two base structures; overlays and adapters do not grant authority.
- R1, R2, and R3 are strong repository-boundary presumptions, not a mechanical exhaustive test.
- Executable MCPs are independently governed products. The Agentic Harness owns reusable governance, binding, and conformance capabilities, not the products.
- KI Specifications has no active KI-wide normative route before overall V1.
- Arcadia owns `ki-all`, `ki-fnd`, `ki-mcps`, and `ki-tools`; membership is explicit, reciprocal, and non-authoritative.
- The record is a living present-state decision with no amendment history, migration plan, reversibility plan, roadmap state, or TODO.

## Steps

- [x] Record the immutable Arcadia baseline and mark the item In progress.
- [x] Rewrite the Arcadia Decision Record and update its index gloss.
- [x] Install the same decision-owned projection in Techne Principal, Agentic Harness, `tools-ki`, KI Specifications, and KI Website.
- [x] Update each receiver's local index gloss without changing shared decision-owned content.
- [x] Verify all six projections are semantically identical after excluding the permitted KB `note_type` field.
- [x] Run Decision Record and authoring checks in every receiver and record exact revisions.
- [x] Add the required review packet and move this item to Awaiting review.

## Files touched

- `Admin/Governance/Decisions/GDR-KI-FUNDAMENTALS-001-knowledge-islands-ecosystem-fundamentals.md`
- `Admin/Governance/Decisions/Decisions.md`
- Existing receiver copies of `GDR-KI-FUNDAMENTALS-001` and their Decision Record indexes
- `+/knowledge-islands-factorisation-roadmap.md`
- `+/knowledge-islands-fundamentals-amendment-plan.md`
- `+/knowledge-islands-factorisation-evidence-2026-09-20.md`

## Verify

- `ki repo audit --skill ki-decision-records --repo <receiver>` passes in all six repositories.
- `ki repo audit --skill ki-authoring --repo <receiver>` passes in all six repositories.
- The shared-record semantic-equivalence check passes for all six copies.
- No copy contains migration, compatibility, reversibility, amendment-history, or pre-V1 KI-wide specification obligations.

## Dependencies and blocks

The evidence and amendment boundary prepared by `KI-ARCADIA-GOV-009` are complete. Later estate-wide projection belongs to ALIGN-1 and does not block this six-copy campaign.

## Escalation points

Stop if a receiver copy has diverged semantically, a receiver's target file has uncommitted changes, a local Decision Record audit exposes a material unrelated blocker, or the shared projection contract requires metadata beyond the existing KB `note_type` exception.

## Review

### Delivered

`GDR-KI-FUNDAMENTALS-001` now provides the present-state estate responsibility, routing, structure, boundary, and coordination contract in Arcadia and all five existing receivers.

### Summary of changes

The record now makes Arcadia the default coordination home where no natural repository owns a question, separates MCP products from the Agentic Harness, defines Project and Knowledge Base structures, records R1/R2/R3 boundary presumptions, keeps KI Specifications dormant before overall V1, and defines four Arcadia-owned Agoras with explicit reciprocal membership. The factorisation roadmap, amendment plan, and evidence appendix now include `apps-observatory`, governed `tools-techne`, and the 23-repository post-merge estate.

Accepted receiver revisions are:

- Arcadia Principal: `33e091667e773f986a23fc98cb9d2dd9e3cc73b1`
- Techne Principal: `3d08e1750f3255487295b01ca9ec39ab1f345108`
- Agentic Harness: `2378c248e7e990251d865f3131cc0d0fb62bdbfa`
- `tools-ki`: `7874059f8f029b5c1afbb326dfef0630e448dbcf`
- KI Specifications: `f3a841bb6b65f78690c6d4b153dd37fa474cef48`
- KI Website: `d2a5bbfafb553e1c44ed3c30f95916b941ae6067`

### Verification

Decision Record and authoring audits pass in all six repositories. Excluding the permitted KB `note_type` field, every projection has SHA-256 `4c2a7fda52cacfb6b4b68936283116f8089d8a178abd66962abdb94235727681`. Arcadia's Streams audit also passes.

### Outstanding concerns

Broader projection remains ALIGN-1 work. The OpenAI merge and `ki-mcps` rehome remain OAI-1 work. Agentic Harness retained unrelated local `ki-repo-tools` changes throughout this campaign.

### Post-change review

The shared record now answers where work belongs without transferring receiver implementation or acceptance. The six-copy projection is exact, and the durable record contains no migration, reversibility, amendment-history, or roadmap narrative.

### Mini recap

The estate has one current routing authority and six verified projections. The next independent unit is the non-MCP Agora cutover under `KI-ARCADIA-ECO-002`.

## Governance

This roadmap record adheres to [[Enactment Process]]. Arcadia coordinates the campaign; each receiver remains owner of its local projection, verification, commit, and acceptance.
