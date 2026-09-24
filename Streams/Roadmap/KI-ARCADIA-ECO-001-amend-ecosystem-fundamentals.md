---
note_type: stream-roadmap
id: KI-ARCADIA-ECO-001
area: ECO
title: Amend ecosystem fundamentals
theme: ecosystem-coordination
horizon: now
status: ready
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-24T08:33:22Z
updated_at: 2026-09-24T08:33:22Z
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

- [ ] Record the immutable Arcadia baseline and mark the item In progress.
- [ ] Rewrite the Arcadia Decision Record and update its index gloss.
- [ ] Install the same decision-owned projection in Techne Principal, Agentic Harness, `tools-ki`, KI Specifications, and KI Website.
- [ ] Update each receiver's local index gloss without changing shared decision-owned content.
- [ ] Verify all six projections are semantically identical after excluding the permitted KB `note_type` field.
- [ ] Run Decision Record and authoring checks in every receiver and record exact revisions.
- [ ] Add the required review packet and move this item to Awaiting review.

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

## Governance

This roadmap record adheres to [[Enactment Process]]. Arcadia coordinates the campaign; each receiver remains owner of its local projection, verification, commit, and acceptance.
