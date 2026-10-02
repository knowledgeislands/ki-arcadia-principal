---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-013
area: GOV
title: Narrow Techné remote hold
theme: governance
horizon: now
status: ready
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-02T02:56:44Z
updated_at: 2026-10-02T02:56:44Z
---

# KI-ARCADIA-GOV-013: Narrow Techné remote hold

## Goal

Keep Techné tooling development active and conformant with its repository standards while holding remote agent execution and remote-environment management until those operations have explicit authority and a safe delivery policy.

## Context

The canonical programme hold currently blocks new implementation, architecture changes and branch integration across the retained source, harness and CLI. The human clarified that this is too broad: the concern is tooling used for remote running and attempts to manage a remote environment. The two implementation repositories already describe a narrower hold and need Arcadia's canonical policy to agree.

## Boundary

This change is documentary governance only. It does not run remote agents, modify live services, accept retained candidates, change source work records, publish, release, push, or approve a remote-delivery policy. Historical Decision Records and completed roadmap evidence remain historical.

## Current state

Arcadia's policy and several standing orientation notes still describe a blanket programme hold. `tools-techne` and `ki-techne-harness` now permit local development but explicitly mark Arcadia's policy as awaiting reconciliation.

## Steps

- [ ] Narrow the canonical policy to remote agent execution and remote-environment operations while stating that local implementation, architecture, testing, review, branch integration and ordinary CI continue under declared repository standards.
- [ ] Reconcile Arcadia's standing policy and engineering navigation so none presents local tool development as generally suspended.
- [ ] Verify the policy, linked notes, work record and residual hold language with focused searches, Markdown checks and KI audits.

## Files touched

Arcadia: `Admin/Governance/Policies/Techne Programme Hold.md`, `AGENTS.md`, `README.md`, `Admin/MEMORY.md`, `Admin/Governance/Policies/Policies.md`, `Admin/Governance/Charter.md`, `Admin/Governance/Known Lands.md`, `Pillars/Pillars.md`, `Pillars/Technē/Technē.md`, `Pillars/Engineering Practice/MEMORY.md`, and this record. Product-repository wording that says the policy still needs reconciliation may be removed after Arcadia's policy lands, in separately verified commits.

## Verify

Run `ki repo audit --skill ki-repo-kb-streams --repo .`, `ki repo audit --skill ki-authoring --repo .`, and `ki repo audit --skill ki-repo-kb --repo .`. Check changed Markdown with `rumdl` and search standing Arcadia surfaces for residual blanket-hold claims. Confirm no infrastructure or release command was run and no historical record was rewritten.

## Dependencies / blocks

The human approved this policy correction and local Git commits on 2 October 2026. The GOV-013 ledger reservation is committed. No build-order blocker remains. Ordinary repository-specific approval and review gates still govern any future implementation or release.

## Documentation impact

### Decision Records

No Decision Record is needed: this corrects the scope of an operating hold without changing Techné's architecture or repository ownership decisions. Existing records remain historical evidence.

### Specifications

No accepted behaviour-level contract changes.

### Guides

No procedural guide changes; the canonical policy and standing orientation notes are the guidance affected.

### Roadmap

This record carries the bounded correction. Remote-delivery policy and individual candidate disposition remain separate work.

## Discussion

### Remote boundary

Hosted CI is not held merely because its runner is remote; its jobs must remain isolated from live Techné infrastructure. The hold applies when tooling dispatches work to remote agents or manages a remote runtime, service or environment. Passing CI does not grant that operational authority.

### Existing work

Retained branches and candidates remain available for ordinary review and integration under their owning repository's process, not automatically accepted by this policy correction. Existing remote services and secrets remain untouched.
