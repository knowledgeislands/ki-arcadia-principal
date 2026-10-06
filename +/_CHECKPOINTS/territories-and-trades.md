---
type: ki-checkpoint
thread: territories-and-trades
state: active
created_at: 2026-10-06T20:40:00Z
updated_at: 2026-10-06T20:40:00Z
---

# territories-and-trades

## Objective

Review the live territory and trade model now that Capital-governed routes are delivered, and decide what to simplify. The owner is not a fan of the current trade configuration and suspects `map_bonus` is obsolete. Exchange across territories (for example with HNR) is unresolved.

## Current state

Internal trade within the Knowledge Islands territory is live under `ki` v0.7.1 and the `ki-trades` audit passes on Arcadia.

- Authority: the [[Admin/Governance/Charter|Charter]] makes Arcadia the sole Capital and owner of trade-route policy; [[GDR-KI-ARCADIA-003-capital-governed-trade-routes|GDR-KI-ARCADIA-003]] records the decision. [[SDR-KI-ARCADIA-005-territories-archipelagos-and-the-constitutional-layer|SDR-KI-ARCADIA-005]] holds the wider territory strategy.
- Configuration: Arcadia's `.ki.toml` declares `[skills.ki-repo.territory]` (21 members) and `[skills.ki-trades.territory]` - a `subtypes` table (4), 10 `[[channels]]` and 4 `[[standing]]` grants, about 180 lines. Every member names its Capital in `[skills.ki-repo].capital`; a member's own `[skills.ki-trades]` may hold only `map_bonus`; per-repository `routes` and `subtypes` are retired and fail.
- Specification: the harness `ki-trades` skill (`references/standards-trades.md`, rubric) and the `ki-repo` repository standard, with GDR-KI-HARNESS-013, GDR-KI-HARNESS-005 and ADR-KI-HARNESS-SKILLS-005 in `ki-agentic-harness`. `ki-specifications` has no territory or trade specification or schema; only GDR-KI-FUNDAMENTALS-001 mentions trade routes in passing.
- `map_bonus`: an integer 0-3, presentation-only uplift on the generated registered-estate map. `tools-ki` still parses it and carries it through `src/core/trade/estate.ts` and `route-report.ts`; it changes no routing or authority. Whether anything still renders or reads that map is unverified.
- Delivery records KI-ARCADIA-GOV-016, KI-HARNESS-GOV-122 and KI-TOOL-CLI-104 are done and pruned; Git holds them.

## Decisions made

- Route policy is Capital-owned and held only in the Capital's `.ki.toml`; any island a channel names must declare `ki-trades` (GDR-KI-ARCADIA-003).
- Scope is internal trade only; exchange across territories was deferred.
- Non-KI repositories had `ki-trades` removed (2026-10-06), and GDR-HNR-HARNESS-002 was rewritten in place rather than superseded.
- 2026-10-06: the owner deferred the HNR follow-ups below while cleaning up Knowledge Islands repositories.

## Files touched

None in this thread yet. Subjects of review: `.ki.toml` in this repository; `ki-agentic-harness/skills/governance/ki-trades/`; `tools-ki/src/core/trade/`.

## Open questions

- Is `map_bonus` obsolete? It is still parsed and passed to the estate map and route report. Removing it touches the harness standard and rubric, `tools-ki` and every member declaring it.
- What specifically about the trade configuration is unwanted - its size, the separate `subtypes` and `standing` tables, the expansion of channels into member lists, or living in `.ki.toml` at all? The owner has not yet said.
- Should territory and trade configuration be formally specified (and schematised) in `ki-specifications`?
- Exchange across territories has no live roadmap item since GOV-016 closed. GDR-HNR-HARNESS-002 and HNR-HARNESS-003 in `hnr-agentic-harness` still name GOV-016 as its owner. Deferred by the owner.
- GDR-HNR-HARNESS-002 is about 1,630 words against the 200-500 word guide, and the hnr-agentic-harness dependency-cruiser DESIGN-2 check fails. Deferred by the owner.

## Next step

With the owner, pin down what is wrong with the trade configuration and settle `map_bonus`, then capture the agreed simplification as an Arcadia roadmap item with reciprocal harness and `tools-ki` handoffs.
