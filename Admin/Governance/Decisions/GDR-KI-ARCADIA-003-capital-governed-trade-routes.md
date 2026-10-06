---
note_type: admin/governance/decision
id: GDR-KI-ARCADIA-003
title: 'Capital-governed trade routes'
date: 2026-10-06
status: current
decision_type_url: https://knowledgeislands.info/specifications/decision-records/gdr
decision_type: governance
decision_depends_on: ['SDR-KI-ARCADIA-005']
---

# GDR-KI-ARCADIA-003: Capital-governed trade routes

## Context

[[Charter]] and [[Known Lands]] already made Arcadia the Capital of the Knowledge Islands territory. Trade routes, however, were declared pairwise: each sender's export and each receiver's matching import lived in that repository's own `.ki.toml`. Standing knowledge-intake grants and their subtypes were declared the same way, so the receiver owned the subtype.

On 2026-10-05 an inventory of 41 registered repositories found 57 partner-route entries across 21 KI repositories. Of 78 typed export directions, one had no matching import, so the territory's actual route policy existed only as the sum of 21 local tables. Nothing checked those tables against the territory's governance or its member inventory.

Kris Brown approved the change on 2026-10-06 in [[KI-ARCADIA-GOV-016-territorial-classification-and-exchange|KI-ARCADIA-GOV-016]], and asked for it to be made in one step, with no staged or legacy-compatible phase.

## Decision

1. Every Knowledge Islands repository declares its territory Capital as a canonical HTTPS URL in `[skills.ki-repo].capital`. A Capital names itself. The declaration is mandatory and its absence fails the `ki-repo` audit.
2. A Capital, and only a Capital, declares `[skills.ki-repo.territory]`, which holds the territory name and its sorted member list including itself. Membership is authoritative at the Capital and is checked from both sides: a member names the Capital, and the Capital lists the member.
3. Trade routes, standing knowledge-intake grants and knowledge subtypes come only from the Capital's `[skills.ki-trades.territory]` policy, which holds:
   - `subtypes`;
   - `[[channels]]` naming members, directions and kinds;
   - `[[standing]]` grants, each covered by a knowledge channel.
4. A member's `[skills.ki-trades]` may hold only `map_bonus`. Its former `routes` and `subtypes` keys are retired and fail.
5. Each repository resolves its policy through its own declared Capital in the local registry, so several territories can share one registry. When the Capital is not checked out locally, its audit reports `territory policy lives in <capital>, not available here` as a warning and trade operations fail closed. It never reports an empty route set.
6. A route is active when both ends are listed members that declare `[skills.ki-trades]` and resolve the same Capital. A route grants only visibility of a deliberate handoff. The source still owns what it submits, and the receiver still owns receipt, disposition and acceptance. No route grants peer write, scheduling, implementation, publication, automatic acquisition or acceptance.

## Consequences

- Arcadia's `.ki.toml` carries the Knowledge Islands member list and its trade policy. Changing either follows the Enactment Process.
- The migration preserved the previous route set. The policy grants all 77 previously active directions and adds `tools-techne` to `homebrew-tap` for `work`, which the owner activated on 2026-10-06. Both open submitted records, `TRD-8004751b` and `TRD-d03495e9`, remain covered.
- The other territories (personal, HNR, Legal, Equal Remedy, TechMedix and Valle Armonia) each declare their own Capital and member list. They hold no trade policy until their owners adopt one.
- The harness `ki-repo` and `ki-trades` standards (KI-HARNESS-GOV-122) and the `ki` command-line tool (KI-TOOL-CLI-104) implement the model. Releases before that implementation do not understand the new tables.
- An Agora, the registry and a Paperclip company still confer no membership or route authority.

## References

- [[KI-ARCADIA-GOV-016-territorial-classification-and-exchange|KI-ARCADIA-GOV-016]]
- [SDR-KI-ARCADIA-005: Territories, Archipelagos, and the Constitutional Layer](SDR-KI-ARCADIA-005-territories-archipelagos-and-the-constitutional-layer.md)
- [[Charter]] and [[Known Lands]]
