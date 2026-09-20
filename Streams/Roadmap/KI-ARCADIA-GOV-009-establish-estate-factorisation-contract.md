---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-009
area: GOV
title: Establish estate factorisation contract
theme: governance
horizon: now
status: draft
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-09-20T10:33:52Z
updated_at: 2026-09-20T11:16:39Z
---

# Establish estate factorisation contract

This adopted Draft is selected in Now. It does not authorise implementation or cross-repository changes.

## Goal

Re-verify the evidence underpinning the Knowledge Islands factorisation roadmap and prepare the exact in-place amendment and projection set for `GDR-KI-FUNDAMENTALS-001`.

## Context

[The consolidated factorisation roadmap](../../+/knowledge-islands-factorisation-roadmap.md) makes Arcadia Principal the home of shared estate initiatives. Its smallest coherent first delivery is FND-1, a dated evidence baseline, followed by planning FND-2, the amendment of the shared fundamentals record. The source reviews also show that repository state changed during analysis, so implementation cannot safely inherit every point-in-time claim without remeasurement.

`KI-ARCADIA-GOV-008` completed a narrower reconciliation of Arcadia's then-current shared fundamentals projection. This proposal does not reopen that accepted work. It considers the later, materially broader routing and repository-boundary amendment defined by the consolidated roadmap.

## Boundary

This proposal covers read-only verification of the 22-repository pre-merge estate and preparation of the Arcadia-owned amendment plan. It may identify the precise receiving repositories, local work adapters, evidence corrections, amendment outline, and projection checks.

It does not amend the decision record, modify another repository, create estate-wide specifications, merge the OpenAI MCP repositories, issue every repository's later alignment item, or authorise delivery beyond this first evidence-and-planning unit.

## Discussion

The evidence report should record source revisions and measured facts for repository inventory and visibility, MCP dependency and test state, shared-file hashes, dotfiles registrations, CI pins, projection freshness, Specifications state, and active build or deployment registrations. Each fact needed by FND-2, MCP-1, or OAI-1 should be confirmed, corrected, or labelled an assumption.

The amendment plan should name the canonical source, exact initial projection set, receiver-local metadata exceptions, semantic-equivalence check, and the responsibilities and routing text to add. It should preserve the decision record identifier and current status, advance its date to the delivery date, rewrite the record as a self-contained present-state decision without an amendment history, treat R1/R2/R3 as strong presumptions rather than a mechanical rule, and keep portable specifications dormant before overall V1. The initial amendment should update only the existing six-copy set; post-merge ALIGN-1 should govern any broader projection and should not seed the retiring Codex repository.

The approved adoption places this first unit in `now` and keeps its delivery boundary limited to the evidence appendix plus a reviewable FND-2 amendment plan. Cross-repository implementation remains behind a later review checkpoint.

The first read-only pass is recorded in [the dated evidence appendix](../../+/knowledge-islands-factorisation-evidence-2026-09-20.md). Its resulting [fundamentals amendment plan](../../+/knowledge-islands-fundamentals-amendment-plan.md) defines the proposed six-copy campaign and the review decisions required before implementation.

## Current state

The initial evidence appendix and amendment plan exist. The six current fundamentals projections are semantically identical, and their distribution contract is understood. Executable MCPs are now classified as independently governed products rather than Harness capability members; the Harness retains reusable MCP governance, binding semantics, token policy, and black-box conformance assets. The roadmap and amendment plan carry that boundary.

## Steps

- [x] Re-verify the initial estate, projection, MCP, distribution, and work-adapter evidence.
- [x] Correct the living Decision Record and six-copy projection assumptions.
- [x] Decide the target relationship between the Agentic Harness and separately operated MCP products.
- [x] Incorporate that decision into the factorisation roadmap and fundamentals amendment plan.
- [x] Recheck the moving Techne Principal and WhatsApp evidence at the final evidence cut.
- [ ] Present the exact FND-2 text and delivery boundary for readiness approval.

## Files touched

- `+/knowledge-islands-factorisation-evidence-2026-09-20.md`
- `+/knowledge-islands-factorisation-roadmap.md`
- `+/knowledge-islands-fundamentals-amendment-plan.md`
- `Streams/Roadmap/KI-ARCADIA-GOV-009-establish-estate-factorisation-contract.md`
- `Streams/Roadmap/_ISSUES.md`

## Verify

- Run the `ki-authoring` and `ki-repo-kb-streams` repository audits.
- Check the final diff and links to the three factorisation working documents.
- Re-read every source revision used for a delivery-critical claim immediately before the readiness review.
- Confirm the proposed Harness/MCP boundary against the current Harness, `tools-ki`, Plugins, dotfiles, Agora, and MCP repository contracts.

## Dependencies and blocks

The planning inputs are resolved. WhatsApp remains a deliberately unverified product-test baseline while its owner has a dirty worktree, which blocks MCP-3 rather than the FND-2 responsibility amendment. The dirty Harness worktree prevents receiver-owned Harness implementation from starting but does not prevent review of this Arcadia plan. FND-2 implementation remains a separate later Arcadia record with receiver-owned local records; this planning item does not block unrelated repository work.

## Delegation

Read-only delegated reviews cover the Harness capability model, the live dependency surface, and independent factorisation alternatives. Arcadia retains synthesis, lifecycle changes, authored outputs, verification, and any later repository handoffs.

## Governance

This roadmap record adheres [[Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
