---
id: KI-ARCADIA-GOV-028
area: GOV
title: Territory selection cut-over
kind: deliver
purpose: capability
initiative: knowledge-islands-model
horizon: now
status: in-progress
blocks: []
blocked_by: []
baseline_ref: 2a83eb526f15c8fc2b590aba6b2ad2c2ffde7a1b
created_at: 2026-10-07T20:07:41Z
updated_at: 2026-10-07T20:26:58Z
---

# Territory selection cut-over

## Goal

Arcadia's declarations and governance use territorial selection with one roster and the short handle ki.

## Context

Kris approved the territory-selection design and its clarified choices with "all agreed" on 7 October 2026. The accepted source is [ADR-KI-ARCADIA-002](https://github.com/knowledgeislands/ki-arcadia-principal/blob/main/Admin/Governance/Decisions/ADR-KI-ARCADIA-002-territory-derived-repository-selection.md); the [owner's decisions](https://github.com/knowledgeislands/ki-arcadia-principal/blob/main/Streams/Initiatives/knowledge-islands-model/design/territory-selection-decisions.md) grant rollout implementation, push, prune and release. No Project is required.

## Boundary

No new Project, speculative records, trade routing changes, other territory's governance or live Paperclip/company changes.

## Current state

The duplicated Agora roster is still in use. Existing trade-policy changes are separate and must be preserved. This record serves one repository's part of the same rollout; acceptance is not inferred from implementation or publication.

## Steps

- [x] Record the accepted design and coordinate the serial pilot.
- [x] Reconcile the trade-only scope and its references.
- [ ] After both tools pass, declare territory_prefix and retire Arcadia's Agora roster.
- [ ] Update canonical governance references and verify the retained membership and Paperclip code.

## Files touched

The accepted Decision Record and index, the decisions supporting file, .ki.toml, territorial governance references, the trade Project and its direct references, and this record.

## Verify

Focused ki-work and ki-repo-kb-streams audits; Decision Record audit; Markdown lint with supporting files included; parsed TOML assertions for the unchanged 21 members, short prefix ki, absent Agora roster and organisation code KIS; read-only parity of KI and mgit roots.

## Dependencies / blocks

The delivery order is shared contract, KI resolver pilot, mgit caller pilot, then Arcadia reconciliation and retirement. Each owning repository delivers its own code. Consumer retirement waits for the verified caller without treating review status as a build dependency.

## Documentation impact

### Decision Records

Cite the accepted Arcadia decision; preserve its owner-approved meaning.

### Specifications

Update the repository-owned shared or executable selector contract and remove current Agora semantics after consumer verification.

### Guides

Explain the new flags, literal-prefix filtering, failure boundaries and hard cut-over.

### Roadmap

Use this single bounded record for this repository; create no speculative follow-on queue.

## Discussion

### Authority

The owner explicitly permits push, prune and release for the verified rollout. Only intended paths may be committed. No unrelated record, live company state or remote Techné runtime is within scope.
