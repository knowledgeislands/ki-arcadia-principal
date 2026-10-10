---
note_type: admin/governance/decision
id: GDR-KI-ARCADIA-003
title: 'Capital-governed trade routes'
date: 2026-10-06
updated: 2026-10-10
status: current
decision_type_url: https://knowledgeislands.info/specifications/decision-records/gdr
decision_type: governance
decision_depends_on: ['SDR-KI-ARCADIA-005']
---

# GDR-KI-ARCADIA-003: Capital-governed trade routes

## Context

Arcadia is the Capital of the Knowledge Islands territory, as its Charter and Known Lands declare. A territory's trade routes, standing knowledge-intake grants and knowledge subtypes need one authoritative declaration that can be checked against the territory's governance and member inventory. Pairwise route tables in each repository's own `.ki.toml` cannot provide that: the territory's policy would exist only as the sum of the local tables, and a sender's export can lack its matching import.

## Decision

1. Every Knowledge Islands repository declares its territory Capital as a canonical HTTPS URL in `[skills.ki-repo].capital`. A Capital names itself. The declaration is mandatory and its absence fails the `ki-repo` audit.
2. A Capital, and only a Capital, declares `territory_name` and `territory_members` under `[skills.ki-repo]`, which hold the territory name and its sorted member list including itself. Membership is authoritative at the Capital and is checked from both sides: a member names the Capital, and the Capital lists the member.
3. Trade routes, standing knowledge-intake grants and knowledge subtypes come only from the Capital's `[skills.ki-trades.territory]` policy, which holds:
   - `subtypes`;
   - `[[channels]]` naming members, directions and kinds;
   - `[[standing]]` grants, each covered by a knowledge channel.
4. A member's `[skills.ki-trades]` may hold only `map_bonus`; `routes` and `subtypes` keys fail.
5. Each repository resolves its policy through its own declared Capital in the local registry, so several territories can share one registry. When the Capital is not checked out locally, its audit reports `territory policy lives in <capital>, not available here` as a warning and trade operations fail closed. It never reports an empty route set.
6. A route is active when both ends are listed members that declare `[skills.ki-trades]` and resolve the same Capital. A route grants only visibility of a deliberate handoff. The source still owns what it submits, and the receiver still owns receipt, disposition and acceptance. No route grants peer write, scheduling, implementation, publication, automatic acquisition or acceptance.
7. Trade hold: no new trades are sent until the territory model is settled. Work is done directly or recorded in the receiving repository.

## Consequences

- Arcadia's `.ki.toml` carries the Knowledge Islands member list and its trade policy. While the trade hold stands, that policy declares no channels, standing grants or subtypes. Changing either follows the Enactment Process.
- The other territories (personal, HNR, Legal, Equal Remedy, TechMedix and Valle Armonia) each declare their own Capital and member list. They hold no trade policy until their owners adopt one.
- The harness `ki-repo` and `ki-trades` standards and the `ki` command-line tool implement the model.
- An Agora, the registry and a Paperclip company confer no membership or route authority.

## References

- [[SDR-KI-ARCADIA-005-territories-archipelagos-and-the-constitutional-layer|SDR-KI-ARCADIA-005]]
