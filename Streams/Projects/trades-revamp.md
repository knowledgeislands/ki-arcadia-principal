---
note_type: streams/project
slug: trades-revamp
title: Trades revamp
outcome: The territory trade policy is succinct without changing what it grants, `map_bonus` is retired, and the related roadmap items agree with the result.
initiative: knowledge-islands-model
lifecycle: planned
lead: Kris Brown
target: null
updated: 2026-10-07T20:21:52Z
author: Written with Claude
---

# Trades Revamp

## Outcome

Make the territory trade policy succinct without changing what it grants, retire `map_bonus`, and keep the related roadmap items consistent with the result. The test: Arcadia's `.ki.toml` declares the same routes in the agreed shorter form, `ki` parses it, the `ki-trades` audit passes, and no record cites a retired declaration. Exchange across territories remains open and is outside this outcome.

This Project sits in [[knowledge-islands-model|Knowledge Islands model]]. It is `planned` until Kris agrees the proposed form below.

---

## Notes

- **Trades on hold.** Since decision 11 of the state-of-play design (2026-10-07) no new trades are sent, and under decision 13 every `.ki.toml` trade policy is stripped back to a bare `[skills.ki-trades]`. Arcadia's full policy (`[skills.ki-trades.territory]` and `map_bonus`) lives in Git history at commit `76e399b`, the commit before the strip. The hold is due for review by 2026-10-14; the [[skill-refresh]] Project carries that review.
- **The model before the strip.** Arcadia's `.ki.toml` held the territory in `[skills.ki-repo.territory]` (21 members as full HTTPS URLs) and the trade policy in `[skills.ki-trades.territory]`: 4 `subtypes`, 10 `[[channels]]` and 4 `[[standing]]` grants, about 180 lines with 93 repeated URLs. Members name their Capital in `[skills.ki-repo].capital`.
- **Where it is specified.** The [[Admin/Governance/Charter|Charter]] and [[GDR-KI-ARCADIA-003-capital-governed-trade-routes|GDR-KI-ARCADIA-003]] here; the `ki-trades` standard (`references/standards-trades.md`) and rubric, the `ki-repo` standard, and GDR-KI-HARNESS-013 in `ki-agentic-harness`; the parser in `tools-ki/src/core/trade/configuration.ts`. `ki-specifications` has no territory or trade specification or schema.
- **`map_bonus`.** A presentation-only (0-3) uplift for the generated estate map, still parsed and carried through `tools-ki/src/core/trade/estate.ts` and `route-report.ts`. No consumer of that map was found; confirm nothing renders it before removing the field.
- **A succinct form.** Kris asked for one; it is not agreed. The proposal was one entry per route under `[skills.ki-trades.territory.routes]`, keyed by id, with short member names (a bare name is the Capital's GitHub owner, `owner/repo` otherwise, a URL still accepted, for route endpoints), `"*"` for every member except the other end, `between` for two-way pairs, `standing` attached to a route instead of separate `[[standing]]` tables (relaxing the no-duplicate-triple rule to set semantics), optional `purpose`, and no `map_bonus` - about 20 lines for the same 10 channels. The only grant change is `"*"`: new members would gain the harness routes automatically. The proposal used inline tables, which the `.ki.toml` layout rules now forbid, so its trade policy needs reshaping. Territory identity, membership and selection are owned by [[ADR-KI-ARCADIA-002-territory-derived-repository-selection|ADR-KI-ARCADIA-002]] and are outside this Project.
- **Routes any reshape must preserve.** A possible work trade from Arcadia to the harness for the legacy serve fallback policy, and knowledge trades from the harness to `ki-website` and `apps-observatory`.
- **No sender-side withdrawal.** The trade standard has no way for a sender to withdraw a submitted trade the receiver never received. Two harness trades to `tools-ki` were withdrawn by hand on 2026-10-07 under Kris's one-off exception; the hold review decides whether the need for a withdraw command returns.
- **Boundaries.** Route policy stays Capital-owned and in the Capital's `.ki.toml`; Kris is content with that placement and wants the format more succinct. Exchange across territories is out of scope: HNR's `5g-emerge-phase2` has no route to the harness, so Kris relays its findings by hand, and the HNR records that still name a closed Arcadia owner for that exchange are deferred while Kris cleans up Knowledge Islands repositories.
- Should trade configuration also be specified and schematised in `ki-specifications`? That would touch the paused [[specifications]] Project.
- Who owns exchange across territories now that its Arcadia owner is closed?
