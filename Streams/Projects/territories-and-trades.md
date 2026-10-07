---
note_type: streams/project
slug: territories-and-trades
title: Territories and trades
outcome: The territory trade policy is succinct without changing what it grants, `map_bonus` is retired, and the related roadmap items agree with the result.
initiative: knowledge-islands-model
lifecycle: planned
lead: Kris Brown
target: null
updated: 2026-10-07T14:05:00Z
author: Written with Claude
---

# Territories and Trades

## Outcome

Make the territory trade policy succinct without changing what it grants, retire `map_bonus`, and keep the related roadmap items consistent with the result. The test: Arcadia's `.ki.toml` declares the same routes in the agreed shorter form, `ki` parses it, the `ki-trades` audit passes, and no record cites a retired declaration. Exchange across territories remains open and is outside this outcome.

This Project sits in [[knowledge-islands-model|Knowledge Islands model]]. It is `planned` until Kris agrees the proposed form below.

---

## Update

Seeded on 2026-10-07 from the checkpoint last updated on 2026-10-06; recheck before acting.

- **Health.** On track for a planned Project: one decision from Kris starts it, and nothing else blocks it. A stated judgement for Kris to confirm.
- **Live model.** Arcadia's `.ki.toml` holds the territory in `[skills.ki-repo.territory]` (21 members as full HTTPS URLs) and the trade policy in `[skills.ki-trades.territory]`: 4 `subtypes`, 10 `[[channels]]` and 4 `[[standing]]` grants, about 180 lines with 93 repeated URLs. Members name their Capital in `[skills.ki-repo].capital`; a member's `[skills.ki-trades]` may hold only `map_bonus`. `ki` v0.7.1 enforces it and the `ki-trades` audit passes here.
- **Specification.** [[Admin/Governance/Charter|Charter]] and [[GDR-KI-ARCADIA-003-capital-governed-trade-routes|GDR-KI-ARCADIA-003]] here; the `ki-trades` standard (`references/standards-trades.md`) and rubric, the `ki-repo` standard, and GDR-KI-HARNESS-013 in `ki-agentic-harness`; the parser in `tools-ki/src/core/trade/configuration.ts`. `ki-specifications` has no territory or trade specification or schema.
- **`map_bonus`.** A presentation-only (0-3) uplift for the generated estate map; still parsed and carried through `tools-ki/src/core/trade/estate.ts` and `route-report.ts`. No consumer of that map was found.

### Proposed succinct form

Kris asked for it; it is not yet agreed in detail. One inline table per route under `[skills.ki-trades.territory.routes]`, keyed by id, for example:

```toml
harness-maintenance = { from = "*", to = "ki-agentic-harness", kinds = ["work", "knowledge"], standing = ["shared-capability-maintenance"] }
ki-mgit             = { between = ["tools-ki", "tools-mgit"], kinds = ["work", "knowledge"] }
```

Changes: short member names (a bare name is the Capital's GitHub owner, `owner/repo` otherwise, a URL is still accepted), also for `members`; `"*"` means every member except the other end; `between` for two-way pairs; `standing` attached to a route instead of separate `[[standing]]` tables, which needs the no-duplicate-triple rule relaxed to set semantics; `purpose` optional; `map_bonus` removed. About 20 lines for the same 10 channels. The only grant change is `"*"`: new members would gain the harness routes automatically.

### Related roadmap items

- **Stale route wording.** [[KI-ARCADIA-EXT-003-ki-skill-extractions|KI-ARCADIA-EXT-003]] and [[KI-ARCADIA-OPS-003-page-registry|KI-ARCADIA-OPS-003]] still cite the retired `[skills.ki-trades.routes."knowledgeislands/ki-agentic-harness"]` declaration; the route now comes from the Capital's `harness-maintenance` channel.
- **Routes in use that any reshape must preserve.** [[KI-ARCADIA-ECO-009-legacy-serve-fallback-policy|KI-ARCADIA-ECO-009]] and [[KI-ARCADIA-OPS-007-agent-session-improvements|KI-ARCADIA-OPS-007]] (work trades from Arcadia to the harness); `KI-HARNESS-GOV-131` in `ki-agentic-harness` (knowledge trades from the harness to `ki-website` and `apps-observatory`).
- **Evidence for exchange across territories.** `KI-HARNESS-GOV-123`, `KI-HARNESS-GOV-124` (done and pruned) and `KI-HARNESS-GOV-125` in `ki-agentic-harness` were raised by `5g-emerge-phase2` (HNR), which has no route to the harness, so Kris relays findings by hand. In `hnr-agentic-harness`, GDR-HNR-HARNESS-002 and HNR-HARNESS-003 still name the closed KI-ARCADIA-GOV-016 as owner of that exchange.
- **No sender-side withdrawal.** The trade standard has no way for a sender to withdraw a submitted trade the receiver never received. On 2026-10-07 the harness trades `TRD-8004751b` and `TRD-d03495e9` to `tools-ki` were withdrawn by hand under Kris's explicit one-off exception (harness `9cac0452`); their content is now `tools-ki` records `KI-TOOL-CLI-110` and `KI-TOOL-CLI-111`. `KI-TOOL-CLI-111` requires a withdraw command and notes the matching `ki-trades` standard change as a harness handoff, now harness GOV-148.
- **No item yet** covers the trade-configuration simplification itself.

### Decision

Does Kris accept the proposed form, in particular `"*"` auto-granting harness routes to new members and the relaxed duplicate rule? The test: the agreed form is written into an Arcadia roadmap record.

### Next step

Agree the proposed form with Kris, then open an Arcadia roadmap record for the simplification with reciprocal handoffs to `ki-agentic-harness` (standard, rubric) and `tools-ki` (parser), folding in the stale wording in KI-ARCADIA-EXT-003 and KI-ARCADIA-OPS-003.

---

## Constraints

- Route policy stays Capital-owned and in the Capital's `.ki.toml`; Kris is content with that placement and wants the format more succinct.
- Scope remains trade within the Knowledge Islands territory; exchange across territories is out of scope for this simplification.
- The HNR follow-ups (stale GOV-016 references, GDR-HNR-HARNESS-002 length, the `hnr-agentic-harness` dependency-cruiser DESIGN-2 failure) are deferred while Kris cleans up Knowledge Islands repositories.

---

## Open records

Membership is classification, not authority; each owning repository decides whether its record joins when the migration tags it. Status lives in each record.

- [KI-HARNESS-GOV-148](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-148-let-senders-withdraw-trades.md) - Let senders withdraw trades
- [KI-TOOL-CLI-111](../../../tools-ki/docs/roadmap/KI-TOOL-CLI-111-surface-undeliverable-trades.md) - Surface undeliverable trades

---

## Ideas

- Confirm nothing renders the estate map before removing `map_bonus`.
- Should territory and trade configuration also be specified and schematised in `ki-specifications`? That would touch the paused [[specifications]] Project.
- Who owns exchange across territories now that KI-ARCADIA-GOV-016 is closed?

---

## Sources

Seeded by KI-ARCADIA-GOV-026 from `+/_CHECKPOINTS/territories-and-trades.md` at `87e160f`.
