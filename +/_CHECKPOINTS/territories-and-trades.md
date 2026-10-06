---
type: ki-checkpoint
thread: territories-and-trades
state: active
created_at: 2026-10-06T20:40:00Z
updated_at: 2026-10-06T20:46:29Z
---

# territories-and-trades

## Objective

Make the territory trade policy succinct without changing what it grants, retire `map_bonus`, and keep the related roadmap items consistent with the result. Exchange across territories remains open.

## Current state

- **Live model.** Arcadia's `.ki.toml` holds the territory in `[skills.ki-repo.territory]` (21 members as full HTTPS URLs) and the trade policy in `[skills.ki-trades.territory]`: 4 `subtypes`, 10 `[[channels]]` and 4 `[[standing]]` grants, about 180 lines with 93 repeated URLs. Members name their Capital in `[skills.ki-repo].capital`; a member's `[skills.ki-trades]` may hold only `map_bonus`. `ki` v0.7.1 enforces it and the `ki-trades` audit passes here.
- **Specification.** [[Admin/Governance/Charter|Charter]] and [[GDR-KI-ARCADIA-003-capital-governed-trade-routes|GDR-KI-ARCADIA-003]] here; the `ki-trades` standard (`references/standards-trades.md`) and rubric, the `ki-repo` standard, and GDR-KI-HARNESS-013 in `ki-agentic-harness`; the parser in `tools-ki/src/core/trade/configuration.ts`. `ki-specifications` has no territory or trade specification or schema.
- **`map_bonus`.** Presentation-only (0-3) uplift for the generated estate map; still parsed and carried through `tools-ki/src/core/trade/estate.ts` and `route-report.ts`. No consumer of that map was found.
- **Proposed succinct form** (owner asked for it; not yet agreed in detail). One inline table per route under `[skills.ki-trades.territory.routes]`, keyed by id, for example:

  ```toml
  harness-maintenance = { from = "*", to = "ki-agentic-harness", kinds = ["work", "knowledge"], standing = ["shared-capability-maintenance"] }
  ki-mgit             = { between = ["tools-ki", "tools-mgit"], kinds = ["work", "knowledge"] }
  ```

  Changes: short member names (bare name = Capital's GitHub owner, `owner/repo` otherwise, URL still accepted), also for `members`; `"*"` = every member except the other end; `between` for two-way pairs; `standing` attached to a route instead of separate `[[standing]]` tables, which needs the no-duplicate-triple rule relaxed to set semantics; `purpose` optional; `map_bonus` removed. About 20 lines for the same 10 channels. The only grant change is `"*"`: new members would gain the harness routes automatically.

### Related roadmap items

- **Stale route wording:** [[KI-ARCADIA-EXT-003-ki-skill-extractions|KI-ARCADIA-EXT-003]] and [[KI-ARCADIA-OPS-003-page-registry|KI-ARCADIA-OPS-003]] (both `ready`) still cite the retired `[skills.ki-trades.routes."knowledgeislands/ki-agentic-harness"]` declaration; the route now comes from the Capital's `harness-maintenance` channel.
- **Routes in use that any reshape must preserve:** [[KI-ARCADIA-ECO-009-legacy-serve-fallback-policy|KI-ARCADIA-ECO-009]] and [[KI-ARCADIA-OPS-007-agent-session-improvements|KI-ARCADIA-OPS-007]] (work trades from Arcadia to the harness); `KI-HARNESS-GOV-131` in `ki-agentic-harness` (knowledge trades from the harness to `ki-website` and `apps-observatory`).
- **Evidence for exchange across territories:** `KI-HARNESS-GOV-123`, `KI-HARNESS-GOV-124` and `KI-HARNESS-GOV-125` in `ki-agentic-harness` were raised by `5g-emerge-phase2` (HNR), which has no route to the harness, so the owner relays findings by hand. In `hnr-agentic-harness`, GDR-HNR-HARNESS-002 and HNR-HARNESS-003 still name the closed KI-ARCADIA-GOV-016 as owner of that exchange.
- **No item yet** covers the trade-configuration simplification itself.

## Decisions made

- Route policy stays Capital-owned and in the Capital's `.ki.toml`; the owner is content with that placement and wants the format more succinct.
- Scope remains trade within the Knowledge Islands territory; exchange across territories is out of scope for this simplification.
- The HNR follow-ups (stale GOV-016 references, GDR-HNR-HARNESS-002 length, the `hnr-agentic-harness` dependency-cruiser DESIGN-2 failure) are deferred while the owner cleans up Knowledge Islands repositories.

## Files touched

None.

## Open questions

- Does the owner accept the proposed form, in particular `"*"` auto-granting harness routes to new members and the relaxed duplicate rule?
- Confirm nothing renders the estate map before removing `map_bonus`.
- Should territory and trade configuration also be specified and schematised in `ki-specifications`?
- Who owns exchange across territories now that KI-ARCADIA-GOV-016 is closed?

## Next step

Agree the proposed form with the owner, then open an Arcadia roadmap item for the simplification with reciprocal handoffs to `ki-agentic-harness` (standard, rubric) and `tools-ki` (parser), folding in the stale wording in KI-ARCADIA-EXT-003 and KI-ARCADIA-OPS-003.
