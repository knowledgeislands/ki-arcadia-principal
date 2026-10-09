---
note_type: admin/governance/decision
id: GDR-KI-ARCADIA-001
title: 'Adopting Decision Records'
date: 2026-07-18
status: current
decision_type: governance
decision_type_url: https://knowledgeislands.info/specifications/decision-records/gdr
---

# GDR-KI-ARCADIA-001: Adopting Decision Records

## Context

Knowledge Islands repositories make durable decisions about knowledge, governance, specifications, architecture, tooling, publication, and operations. Without a common record, later contributors and agent sessions must reconstruct the reasoning from implementation details or transient working material.

Arcadia also maintains the canonical engineering principles, architecture, operating models and technology posture of the Techné engineering discipline, whose decisions need the same form as the rest of the territory's.

## Decision

Knowledge Islands repositories adopt Decision Records (DRs) as the canonical instrument for significant standalone decisions. A DR uses the Nygard structure: Context, Decision, Consequences, and optional References. Its prefix identifies the decision type, its scope identifies the repository or domain, and its serial runs contiguously from `001` per prefix within that scope.

A DR is a living present-state record. When a decision changes, its record is updated in place so it remains true now; git holds the history. KB repositories place records in `Admin/Governance/Decisions/`, while non-KB repositories place them in `docs/decisions/`. Every collection has an index in reveal order.

The Techné engineering discipline uses Arcadia's collection in `Admin/Governance/Decisions/`. The engineering records adopted from the retired Techné principal are renumbered into the KI-ARCADIA series; their archived source copies are historical evidence, not a second decision authority.

## Consequences

- Significant decisions remain searchable, reviewable, and available to humans and agents across context resets.
- Routine implementation details remain in commits and ordinary documentation; not every change warrants a DR.
- Forward work and unresolved implementation remain in Streams rather than becoming roadmap prose inside a DR.
- A record removed by merger or retirement does not leave its serial vacant: the rest of its series renumbers to close the gap, and every citation moves in the same change.
- Engineering decisions follow the same decision-type and scope sequences and take a deliberate place in the reveal-order index.
- A repository adopting Decision Records declares `[skills.ki-decision-records]` in `.ki.toml` and carries GDR001 as its first governance decision.
- The four primary ecosystem repositories keep GDR001 consistent in substance while using their own repository scope in the record identifier.
