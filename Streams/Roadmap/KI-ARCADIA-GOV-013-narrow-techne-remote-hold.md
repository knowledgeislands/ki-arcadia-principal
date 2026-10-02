---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-013
area: GOV
title: Narrow Techné remote hold
theme: governance
horizon: now
status: done
blocks: []
blocked_by: []
baseline_ref: d3b641aaa2c874572a2b7110924bf89a3844b85c
created_at: 2026-10-02T02:56:44Z
updated_at: 2026-10-02T06:14:03Z
---

# KI-ARCADIA-GOV-013: Narrow Techné remote hold

## Goal

Keep Techné tooling development active and conformant with its repository standards while holding remote agent execution and remote-environment management until those operations have explicit authority and a safe delivery policy.

## Context

The canonical programme hold originally blocked new implementation, architecture changes and branch integration across the retained source, harness and CLI. The human clarified that this was too broad: the concern is tooling used for remote running and attempts to manage a remote environment. The two implementation repositories already described a narrower hold and needed Arcadia's canonical policy to agree.

## Boundary

This change is documentary governance only. It does not run remote agents, modify live services, accept retained candidates, change source work records, publish, release, push, or approve a remote-delivery policy. Historical Decision Records and completed roadmap evidence remain historical.

## Current state

At selection, Arcadia's policy and several standing orientation notes still described a blanket programme hold. `tools-techne` and `ki-techne-harness` permitted local development but explicitly marked Arcadia's policy as awaiting reconciliation.

## Steps

- [x] Narrow the canonical policy to remote agent execution and remote-environment operations while stating that local implementation, architecture, testing, review, branch integration and ordinary CI continue under declared repository standards.
- [x] Reconcile Arcadia's standing policy and engineering navigation so none presents local tool development as generally suspended.
- [x] Verify the policy, linked notes, work record and residual hold language with focused searches, Markdown checks and KI audits.

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

## Review

### Delivered

From baseline `d3b641aaa2c874572a2b7110924bf89a3844b85c`, Arcadia's policy and standing orientation now permit local Techné tool-building under repository standards while holding remote agent execution and remote-environment management. The two product repositories no longer claim that Arcadia's policy awaits correction. No remote service, release, push, historical Decision Record or retained candidate was changed.

### Change Summary

Arcadia policy and nine linked standing files changed in `551bae9`. `tools-techne` and `ki-techne-harness` each updated `AGENTS.md` and `README.md` in `9e3c666` and `6a19de1` respectively. Ordinary hosted CI is explicitly outside the hold when isolated from live Techné infrastructure; a CI job that manages a live environment remains held.

### Verification

Arcadia's `ki-repo-kb-streams`, `ki-authoring`, `ki-repo-kb` and `ki-repo-kb-principal` audits passed. `rumdl check` passed for all eleven changed Arcadia Markdown files and both changed Markdown files in each product repository; product `ki-authoring` audits passed. Focused search found no blanket-hold phrasing in the changed standing Arcadia surfaces. Post-commit path review found only intended files in each commit.

### Outstanding concerns

No outstanding concern remains within the approved Arcadia and product-repository boundary. The retained `ki-techne-principal` source repository's `AGENTS.md` and `README.md` still describe the former blanket hold; the canonical policy now identifies that discrepancy and leaves reconciliation to the source repository's own authority. This acceptance does not assert estate-wide documentary consistency. Existing candidate acceptance and any remote-delivery policy remain separate.

### Post-change review

The canonical policy and active product guidance meet the requested distinction without weakening the remote-operation gate. The human accepted this bounded delivery and left the retained source's older standing text to its own repository. No runtime or release regression was introduced by this documentation-only delivery.

### Mini recap

GOV-013 narrowed Arcadia's hold, kept tool-building and CI active under standards, and aligned the two product entry points. Markdown and focused KI audits passed. The source repository retains ownership of its older wording; no remote operation or automatic candidate integration was authorised.

## Done

Accepted 2026-10-02 by the accountable principal on the review packet above.

## Discussion

### Remote boundary

Hosted CI is not held merely because its runner is remote; its jobs must remain isolated from live Techné infrastructure. The hold applies when tooling dispatches work to remote agents or manages a remote runtime, service or environment. Passing CI does not grant that operational authority.

### Existing work

Retained branches and candidates remain available for ordinary review and integration under their owning repository's process, not automatically accepted by this policy correction. Existing remote services and secrets remain untouched.
