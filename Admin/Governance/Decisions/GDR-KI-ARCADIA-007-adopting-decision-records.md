---
note_type: admin/governance/decision
id: GDR-KI-ARCADIA-007
title: 'Adopting Decision Records'
date: 2026-09-09
status: current
decision_type: governance
decision_type_url: https://knowledgeislands.info/specifications/decision-records/gdr
---

# GDR-KI-ARCADIA-007: Adopting Decision Records

## Context

Arcadia maintains canonical engineering principles, architecture, operating models, and technology posture for the Knowledge Islands ecosystem. Significant standalone decisions need a consistent form that preserves their current rationale, consequences, classification, and place in the knowledge base.

The collection also holds the ecosystem fundamentals in `GDR-KI-ARCADIA-006`. That record supplies ecosystem context but does not establish Arcadia's local decision instrument.

## Decision

The Techné engineering discipline uses Arcadia's typed, living Decision Records collection in `Admin/Governance/Decisions/`. Arcadia maintains the canonical collection and its local adoption instrument. The engineering records adopted from the retired Techné principal are renumbered into Arcadia's KI-ARCADIA series; their archived source copies are historical evidence, not a second decision authority. New local decisions follow Arcadia's decision-type and scope sequences and curated reveal order. A record is edited in place when the current decision changes.

## Consequences

- Significant architecture, governance, knowledge, strategy, product, data, security, operations, and research decisions use the corresponding Decision Record type.
- Forward work and unresolved implementation remain in Streams rather than becoming roadmap prose inside a Decision Record.
- The collection holds ecosystem decisions in the Arcadia series without treating them as its local adoption root.
- Each new local record must preserve continuous numbering within its own decision-type and scope series and be placed deliberately in the reveal-order index.

Arcadia maintains this decision record. The archived copy in `knowledgeislands/ki-techne-principal`, under its former TECHNE identifier, is historical evidence, not an independent authority. Original source evidence remains in Git at `b25e9c950fd87715d12f76b69bb2079c3a4fc054`; the Techné programme hold and retained work are unchanged.
