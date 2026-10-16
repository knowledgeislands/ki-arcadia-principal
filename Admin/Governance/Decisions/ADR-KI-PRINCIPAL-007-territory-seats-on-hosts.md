---
note_type: admin/governance/decision
id: ADR-KI-PRINCIPAL-007
title: 'Territory seats on hosts'
date: 2026-10-15
updated: 2026-10-15
status: current
decision_type: architecture
decision_type_url: https://knowledgeislands.info/specifications/decision-records/adr
decision_depends_on: ['ADR-KI-PRINCIPAL-003']
---

# ADR-KI-PRINCIPAL-007: Territory seats on hosts

## Context

Kris works the eight territories from more than one host, and every host holds a full checkout of each. Coordination services, such as the Observatory, a Paperclip service and a pub-sub endpoint, need to know which host treats a territory as live, so that a message or task has one place to land and no task has two writers. Nothing recorded that placement.

Public governance keeps physical locations out, so the placement is expressed by host role rather than machine name: the home host is the workstation, and the hub host is the always-on studio. The binding of each role to a machine belongs to the local registry and chezmoi's host data.

## Decision

Kris accepted this decision on 15 October 2026, in these words:

- Every host holds all eight territories.
- Each territory has one seat and one standby.
- Knowledge Islands is active-active, tipped to the hub.
- Coordination is routed by seat, with standby fallback.
- Git is the source of truth.

The seats are recorded by role in the Estate territories table of Known Lands: home for personal, legal and humans-not-robots; hub for valle-armonia, sacred-inquiry, techmedix and equal-remedy; both for knowledge-islands.

## Consequences

- A coordination service on a host treats as live only the territories seated there; a message or task for a territory goes to its seat and falls back to the standby only when the seat is unreachable.
- Because Git is the source of truth, any host can stand in for any other: the seat decides where work is coordinated, not where it may be done.
- Renaming or replacing a machine changes one binding in chezmoi's host data, not this record or Known Lands.
- The per-host Paperclip rebuild, the Observatory's scoping and the pub-sub topics follow the seats; each is designed in its own Project.
- Live agent-host authority stays with the Techne Programme Hold; this record grants none.

## References

- [[ADR-KI-PRINCIPAL-003-the-agent-host-workstation-model|ADR-KI-PRINCIPAL-003]] - the agent host workstation model this placement builds on.
- [Known World](https://github.com/knowledgeislands/ki-principal/blob/76c64049581426ae7cebaaabf1a762643f52725f/Pillars/Philosophy/Emerging%20Concepts/Known%20World.md) - the emerging foundations model in which seats bind territories to hosts.
- [Known Lands](https://github.com/knowledgeislands/ki-principal/blob/76c64049581426ae7cebaaabf1a762643f52725f/Admin/Governance/Known%20Lands.md) - the Estate territories table that records each territory's seat.
