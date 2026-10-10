---
note_type: admin/governance/decision
id: SDR-KI-ARCADIA-002
title: 'The Home of Knowledge'
date: 2026-10-01
updated: 2026-10-10
status: current
decision_type_url: https://knowledgeislands.info/specifications/decision-records/sdr
decision_type: strategy
decision_depends_on: ['SDR-KI-ARCADIA-001']
---

# SDR-KI-ARCADIA-002: The Home of Knowledge

## Context

Knowledge Islands rests on a geographic metaphor - islands, territories, archipelagos - and the strategic intent set out in SDR-KI-ARCADIA-001. A Knowledge Base island also needs a physical organisation: where knowledge lives, how it is organised, and what distinguishes a knowledge base from an unstructured repository.

Knowledge exists at three layers. **Individual knowledge** lives in the mind and its personal extensions - notes, tools, memory aids. **Collective knowledge** is shared across teams and communities. **Civilisational knowledge** is preserved across generations in libraries, archives, and cultural institutions. A Knowledge Island operates across all three layers, with the model providing the structure for knowledge to extend beyond any single mind - without replacing the mind as the source of meaning.

An island needs a physical home that reflects this. Without a defined structure, knowledge accumulates without governance: there is no clear distinction between what is in motion and what is settled, between canonical knowledge and working material, between what belongs to this island and what is incoming from outside.

## Decision

A Knowledge Base island lives in a git-backed text store with Markdown notes and a governed zone layout. Product repositories are also islands but use their applicable repository contracts; they do not acquire Knowledge Base folders through territorial membership.

The Library holds stable internal knowledge in `Pillars/` and external reference in `Resources/`. `Calendar/` holds time-bound notes. `Admin/` holds local governance and operations: conventions, policies, decisions, Activities and operating processes. Canonical changes to Admin, Pillars and Resources pass through the Enactment Process.

`Streams/Roadmap/` holds flat finite work records and their allocation ledger. Horizon and lifecycle are record metadata, not focus folders. Recurring obligations are Activity notes in the configured collection; opted-in housekeeping Activities create ordinary roadmap runs. The Streams, Activity and housekeeping skills own those contracts.

The Harbour is the entry metaphor for inbound staging in `+/`; `-/` holds outbound staging. Staging is not canonical knowledge and does not grant acceptance or transfer permission.

The Capital is the territorial governance role held by its one principal island. Every Knowledge Base has local governance infrastructure without becoming another Capital. Independent stores and audience boundaries survive shared territorial governance.

## Consequences

- Knowledge Base islands share a recognisable zone model without imposing that shape on product repositories.
- Work in motion, governed knowledge, external reference and staging have distinct homes.
- Recurring definitions are canonical Activities; individual work runs remain ordinary roadmap records.
- A territory can include multiple Knowledge Bases and product islands while retaining one Capital and repository-owned acceptance.
- Local operating details belong in Admin governance, with physical checkout and source-store locations resolved through the local registry.

## References

- [SDR-KI-ARCADIA-001](SDR-KI-ARCADIA-001-knowledge-islands-the-strategy.md) - foundational strategy.
