---
note_type: admin/governance/decision
id: ADR-KI-ARCADIA-001
title: 'Provider-neutral knowledge acquisition'
date: 2026-08-23
status: current
decision_type: architecture
decision_type_url: https://knowledgeislands.info/specifications/decision-records/adr
decision_depends_on: ['SDR-KI-ARCADIA-002']
---

# ADR-KI-ARCADIA-001: Provider-neutral knowledge acquisition

## Context

An island's Harbour receives material from many external systems: AI sessions, ChatGPT and Granola exports, Slack, email, documents, and future sources. These systems retain transient working state or external records, but none is a Knowledge Islands knowledge base. Their storage mechanics vary between local files, export bundles, APIs, and MCP servers.

The Harbour defined by SDR-KI-ARCADIA-002 needs a common ingress model that preserves available source material before interpretation. A provider-specific archive or session browser cannot provide that model because durable knowledge may emerge only after review and harvesting, and an initially imperfect routing decision must not lose the source.

## Decision

Knowledge Islands adopts provider-neutral acquisition: **discover → acquire → stage → harvest → durable knowledge → archive/delete source**. `ki space acquire <provider> import` is the repository-context operation that stages material in the receiving island's `+` Harbour and maintains incremental checkpoint state.

Every provider adapter must faithfully preserve available original content, source identity, timestamps, media and attachments as byte-preserved assets, provenance, and declared omissions. It must distinguish content-minimised discovery and checkpoint data from faithful source reads. MCPs, APIs, local parsers, and export importers are provider mechanics, not the acquisition architecture.

Acquisition does not require perfect initial routing, infer durable knowledge, or mutate a source. Harvesting promotes reviewed knowledge into the island. Archive or deletion remains a separate, later action permitted only after verified acquisition, review, and harvesting.

## Consequences

- ChatGPT, Granola, Codex, Claude, Slack, email, documents, and future sources share one acquisition vocabulary and staging boundary.
- Repeated acquisition selects new or changed source material through checkpoints rather than copying every source repeatedly.
- An unavailable image, attachment, or field is recorded as an omission or unavailable provenance; acquisition never invents a faithful copy.
- Provider repositories own adapter code and source-specific safeguards. The Harness owns reusable skills and MCP pairing. `tools-ki` owns the repository-context command and staging mechanics.
- Retaining a source capture is distinct from promoting knowledge from it, so source archive or deletion cannot be implied by import success.

## References

- [SDR-KI-ARCADIA-002: The Home of Knowledge](SDR-KI-ARCADIA-002-the-home-of-knowledge.md) — establishes the Harbour as the island's incoming working area.
