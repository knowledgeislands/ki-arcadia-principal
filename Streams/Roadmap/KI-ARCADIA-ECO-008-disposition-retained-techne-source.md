---
note_type: stream-roadmap
id: KI-ARCADIA-ECO-008
area: ECO
title: Decide retained Techne source and work disposition
theme: ecosystem-coordination
horizon: triage
status: draft
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-04T11:03:22Z
updated_at: 2026-10-04T16:52:15Z
---

# Decide Retained Techne Source and Work Disposition

## Goal

Agree the long-term disposition of the retained `ki-techne-principal` repository and its existing work without losing evidence, creating a second engineering-knowledge authority, or treating knowledge consolidation as permission to retire the source.

---

## Context

The accepted [[KI-ARCADIA-ECO-007-consolidate-techne-knowledge|Techné knowledge consolidation]] made Arcadia the canonical engineering-knowledge owner while preserving the Techné harness and operator CLI as separate products. The [[techne-consolidation-manifest|consolidation manifest]] records the bounded migration and retained evidence.

That delivery deliberately left source retirement, held-work transfer, foreign work-identifier policy and the missing source reference to `TECHNE-GOV-005` unresolved. The review retained `TECHNE-OPS-002`, `TECHNE-OPS-004` and `TECHNE-OPS-005`, the issue ledger, candidate commits and worktrees in the source repository. These are evidence to re-ground before proposing a disposition, not a claim that their present state is unchanged.

The current [[Techne Programme Hold]] restricts remote agent execution and remote-environment management. Local tool-building remains subject to each repository's ordinary authority; this item neither broadens that authority nor reinstates the earlier blanket hold.

---

## Boundary

If adopted, prepare a decision-useful census and explicit owner choices:

- Whether to retain the source as a clearly noncanonical evidence and work location, or propose a separately approved retirement after all required evidence has another durable home.
- Which repository should own each surviving work outcome, distinguishing knowledge work from harness and CLI implementation. Any transfer must preserve originating identity, provenance, dependencies and review evidence; decide the foreign-work-identifier policy before moving or reissuing records.
- How to resolve the missing `TECHNE-GOV-005` reference from surviving evidence, without inventing a missing record or reusing an issued identifier.
- What candidate commits, branches, worktrees and historical knowledge must remain recoverable, and what verification would make any later cleanup safe.

Arcadia owns this coordination proposal, not unilateral mutation of the source or products. Derive receiver-owned work records for approved changes that need their own delivery and acceptance. This is a non-blocking follow-up to the completed consolidation, not a reopening of its acceptance.

Capture authorises no source disposal or archival action, work transfer, identifier rewrite, candidate acceptance or integration, branch or worktree deletion, remote-operation resumption, company or registry mutation, Agora change, or trade-route change. Preserve the current hold and independent product ownership. Wider consumer-navigation drift and inter-territory exchange remain separately scoped concerns.

---

## Discussion

Captured on 2026-10-04 with the owner's permission to reserve and commit a Triage item. Before adoption, re-read the retained source state, the accepted consolidation evidence and the live hold policy, then present bounded alternatives and their evidence-retention consequences. No implementation choice is made by this record.

On 2026-10-04 the owner stated a preference for retiring `ki-techne-principal` and asked for this record to carry the retirement path. A point-in-time census taken that day, to be re-grounded on adoption:

- Candidate work in three Paperclip worktrees under `~/.paperclip/instances/default/worktrees/`: `0f77071` (KIS-10 write-root enforcement), `c99592a` (KIS-44 landing `0f77071` onto source `main`) and `eb7292a` (KIS-7 AWS cluster proof for `TECHNE-OPS-002`). The [[Techne Programme Hold]] keeps these reviewable, neither accepted nor discarded.
- Three open drafts: `TECHNE-OPS-002`, `TECHNE-OPS-004` and `TECHNE-OPS-005`, plus the source `_ISSUES.md` ledger.
- Live references: Arcadia `AGENTS.md`, the Charter, Known Lands, the Techne Programme Hold and five Decision Records; membership of the `kis` Agora in `.ki.toml`; a `ki` registry entry.

The retirement sequence the owner asked to be shaped, each step subject to its own approval:

1. Disposition each candidate: accept into its owning repository, transfer with provenance, or record it as discarded; then remove its Paperclip worktree and branch.
2. Transfer or close the three open drafts under the foreign-work-identifier policy decided above.
3. Update Arcadia governance to describe the source as retired, remove it from the `kis` Agora, and deregister it.
4. Archive the GitHub repository rather than delete it, so the evidence stays readable, then remove the local checkout.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
