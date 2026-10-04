---
note_type: stream-roadmap
id: KI-ARCADIA-MOD-006
area: MOD
title: Knowledge acquisition lifecycle
theme: knowledge-model
tags:
  - topic/knowledge-islands
  - topic/acquisition
status: draft
priority: medium
horizon: soon
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-08-23T12:33:49Z
updated_at: 2026-10-04T18:01:50Z
---

# Knowledge Acquisition Lifecycle

## Goal

Make the provider-neutral Knowledge Islands acquisition lifecycle operationally clear, so material from AI sessions and other external sources can enter an island faithfully, be harvested into durable knowledge, and eventually leave its transient source safely.

## Context

[ADR-KI-ARCADIA-001](../../Admin/Governance/Decisions/ADR-KI-ARCADIA-001-provider-neutral-knowledge-acquisition.md) establishes one lifecycle: discover, acquire, stage, harvest, durable knowledge, then archive or delete source. It applies to ChatGPT, Granola, Codex, Claude, Slack, email, documents, and future sources; provider mechanics remain below the architectural boundary.

The first delivery evidence now exists. Claude and Codex have comparable read-only housekeeping surfaces, while `tools-ki` stages a validated local capture in the receiving repository's Harbour. The installed ChatGPT application has an opaque local session cache, which confirms that discovery, faithful raw acquisition, interpretation, and source retirement must remain separate concerns.

## Boundary

This item governs the KI-wide model, source-class boundaries, and evidence required to promote the lifecycle. It does not implement a provider MCP, decrypt or reverse-engineer private provider storage, require perfect initial routing, or delete a source session merely because it was imported.

## Shaping

### Intended approach

Describe the common provenance package and staging boundary independently of provider transport. Establish the minimum evidence that makes an acquisition safe to harvest: original available bytes, source identity, timestamps, assets, omissions, content-hash checkpoint, and repository context. Define how a repository can move material after imperfect routing without losing provenance.

### Known dependencies

`tools-ki` owns repository-context staging. Provider MCPs and local/API/export adapters own discovery and source reads. `ki-agentic-harness` owns reusable provider-facing skills and their paired adapter surfaces. Individual provider work stays in the owning repository's roadmap.

### Decisions still needed

Identify the durable record shape for acquisition provenance across source classes, the review checkpoint required before harvesting, and the evidence threshold before a provider-specific archive or deletion operation becomes eligible.

### Promotion conditions

Promote this item when at least one direct local source and one export/API-style source demonstrate the common provenance and staging model without special-casing a provider in KI semantics.

## Documentation impact

### Decision Records

Keep ADR-KI-ARCADIA-001 current if shaping refines the lifecycle; create a separate decision only for an independent architectural choice.

### Specifications

Shape a portable acquisition specification once two source mechanisms prove the common record and checkpoint boundary.

### Guides

Add operator guidance after the repository-context acquisition workflow is proven beyond prepared captures.

### Roadmap

Provider implementation remains in its owning repository; this record retains the KI-wide architecture and promotion conditions.

## Discussion

### Knowledge acquisition, not session archiving

A source-session browser is useful only because it makes transient working state visible. The destination is durable island knowledge after review and harvesting, not a permanent second archive of every source conversation.

### Faithful first capture

The first operation must favour preservation over interpretation. Opaque source records and unavailable media remain valid acquisition evidence when their bytes, identity, timestamps, and omissions are retained honestly. A later adapter may improve interpretation without rewriting the original acquisition evidence.

### Source retirement

Archive and deletion require a later, provider-specific safety decision. Successful discovery, staging, or even harvesting alone does not authorise source mutation.

### Pickup checkpoint - 2026-09-27

Before further implementation, reconcile the current destination branch, linked coordination tasks, and retained worktrees where applicable. Missing evidence does not release ownership or a hold; this checkpoint is guidance, not a mechanical execution block.

- **Observed:** `ADR-KI-ARCADIA-001` establishes the provider-neutral lifecycle, and the Context identifies initial read-only housekeeping and repository-context staging evidence. Those are foundations, not the common provenance package or retirement policy sought by this record.
- **Resolve:** Verify one direct local source and one export/API-style source against the same acquisition and staging evidence. Settle the provenance record, harvest checkpoint, imperfect-routing handling, and source archive/deletion threshold; leave provider mechanics with their owning repositories.
- **Close:** Review the provider-neutral documentation and source-class evidence against the Goal before seeking owner acceptance through `ki-accept`. Retain the `done` record; pruning is a later explicit owner choice.

### Question for Kris (2026-10-04)

Which two sources should prove the common provenance package (for example Claude housekeeping as the direct local source and Granola as the export or API source), and is a content hash plus source identity, timestamps and omissions record sufficient as the harvest checkpoint?

Classified as an owner decision by the Fable reviewer under delegated autonomy (2026-10-04): Promotion needs two real source mechanisms demonstrated end to end with live provider access and cross-repository evidence, and the provenance record shape is a KI-wide architectural choice recorded against ADR-KI-ARCADIA-001.
