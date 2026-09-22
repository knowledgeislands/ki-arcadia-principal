---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-010
area: GOV
title: Assess estate-wide tooling commonality
theme: governance
tags:
  - topic/knowledge-islands
  - topic/tooling
  - topic/factorisation
status: draft
priority: medium
horizon: future
blocks: []
blocked_by:
  - KI-ARCADIA-GOV-009
baseline_ref: e3eedc265f40c9fe49ef02081d98cb4de5ab8c49
created_at: 2026-09-22T06:37:24Z
updated_at: 2026-09-22T06:37:24Z
author: Written with Codex
---

# Estate-wide Tooling Commonality

## Goal

After the Knowledge Islands ecosystem has completed its current consolidation and factorisation work, assess the surviving tools together and decide which repeated behaviours should remain product-local, become shared conformance contracts, or be factored into governed common implementation.

## Context

Rig's adaptive progress bar and human-readable table work expose a broader question. Several Knowledge Islands tools solve adjacent command-line concerns such as progress reporting, tables, help, diagnostics, completions, XDG paths, release surfaces, and shell or terminal behaviour. Similarity alone does not prove one implementation should own them, especially while repository boundaries and product responsibilities are still being consolidated.

`KI-ARCADIA-GOV-009` and the consolidated factorisation roadmap establish the estate model and its later receiver-owned alignment work. This item is deliberately deferred until that consolidation is complete so it compares intended products rather than extracting from transitional copies.

## Boundary

This item will perform a comparative, evidence-led review of the tooling estate. It may identify common user expectations, behavioural contracts, reusable test fixtures, reference implementations, vendored modules with drift checks, or intentionally distinct product behaviour. It does not begin extraction, create a package, add a registry dependency, change another repository, or force Bash and TypeScript tools into one implementation model.

Progress rendering is a named case study, including truthful counts, terminal rewriting, redirected logs, diagnostics, accessibility, portability, and testing. The review should also consider table rendering, help and manual alignment, completions, diagnostics, installation, XDG handling, release metadata, and other repeated CLI mechanics supported by evidence at review time.

## Current state

The ecosystem remains in consolidation. Rig now has a Bash 3.2-compatible adaptive progress renderer and local table helpers; other tools have richer or different runtime models. No current inventory proves which semantics are genuinely common, which implementation differences are necessary, or which repository should own any shared source.

## Steps

- [ ] Confirm the factorisation and consolidation programme is complete enough for stable comparison, including receiver-owned alignment work.
- [ ] Inventory the surviving user-facing tools, runtimes, distribution paths, and repeated CLI mechanics.
- [ ] Compare progress bars and progress event semantics as the first detailed case study.
- [ ] Compare tables, help, manuals, completions, diagnostics, installation, XDG behaviour, and release surfaces.
- [ ] Separate common user contract, reusable conformance evidence, runtime-specific implementation, and product-specific policy.
- [ ] Evaluate no extraction, shared Specification, shared fixtures, vendored reference code with drift checks, pinned Git source, and other bounded factorisation options.
- [ ] Recommend canonical ownership and migration boundaries only where evidence justifies them.
- [ ] Route any accepted implementation through receiver-owned roadmap items; do not implement cross-repository changes from Arcadia.

## Files touched

- `Streams/Roadmap/KI-ARCADIA-GOV-010-assess-estate-tooling-commonality.md`
- `Streams/Roadmap/_ISSUES.md`
- Future working evidence beneath `+/` only after this item is selected for active shaping.

## Verify

- Re-read the final factorisation model and target estate before promotion from Future.
- Demonstrate the inventory covers every surviving first-party CLI tool and its actual runtime.
- Tie each recommendation to observed code, tests, user-facing behaviour, and ownership rather than filename similarity.
- Obtain owner approval before creating any receiver-owned handoff or canonical Decision Record.

## Dependencies / blocks

Blocked by `KI-ARCADIA-GOV-009` as the current Arcadia consolidation anchor. Completion of that record alone is not sufficient: keep this item in Future until the consolidated factorisation roadmap's repository consolidation and alignment work is complete.

## Documentation impact

### Decision Records

Create or amend a Decision Record only if the later review establishes a durable ownership or factorisation decision.

### Specifications

Prefer behavioural Specifications or conformance fixtures when products should share an expectation without sharing runtime implementation.

### Guides

Document common user-facing conventions only after ownership and applicability are agreed.

### Roadmap

Arcadia owns the ecosystem comparison. Each affected repository owns any subsequent implementation item and its release timing.

## Discussion

The desired outcome is not maximum code sharing. It is an evidence-based boundary that reduces accidental divergence without creating a premature common dependency or erasing legitimate differences between tools.

## Governance

This roadmap record adheres [[Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
