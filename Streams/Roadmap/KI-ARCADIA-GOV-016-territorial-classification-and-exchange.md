---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-016
area: GOV
title: Govern territorial classification and exchange from the Capital
theme: governance
horizon: now
status: in-progress
blocks: []
blocked_by: []
baseline_ref: 768814fbed5cc878551398fc1df60eb06e78d499
created_at: 2026-10-06T09:00:00Z
updated_at: 2026-10-06T15:00:00Z
---

# Govern Territorial Classification and Exchange from the Capital

## Goal

The Knowledge Islands territory's permitted trade routes are declared once, in the Capital's tracked governance, and every island a route names declares `ki-trades` so it knows how to behave. Members carry no route tables. A shared classification separates a reference, local roadmap work and an optional trade, and frames, without activating, exchange with other territories.

## Context

[[Admin/Governance/Charter|Charter]] and [[Known Lands]] already make Arcadia the Capital of the Knowledge Islands territory. Trade routes are nonetheless declared pairwise: a sender's export and a receiver's matching import in each `.ki.toml`, under the harness's `ki-trades` standard. On 2026-10-05 a read-only inventory of 41 registered repositories found 28 declaring `ki-trades`, 57 partner-route entries all within KI across 21 repositories, 78 typed export directions of which one (`tools-techne` to `homebrew-tap`, `work`) had no matching import, and two submitted outbound records from the harness to `tools-ki` (`TRD-8004751b`, `TRD-d03495e9`). The seven non-KI declarations had no routes and no records. Every focused `ki-trades` audit passed.

An inbound draft proposal grounded this record. Its review questions were answered by the owner on 2026-10-06 and are recorded below; its design content is kept under Discussion.

## Decisions

Approved by Kris Brown on 2026-10-06.

1. **Capital-only route policy.** Internal routes live only in the Capital. A member does not restate or consent to a route the approved policy covers. The source still owns what it submits; the receiver still owns receipt, disposition and acceptance. A route grants no peer write, scheduling, implementation, publication, automatic acquisition or acceptance.
2. **Named islands declare the skill.** Any island a Capital route names declares a bare `[skills.ki-trades]`, so it knows how to behave. Enforcement is split three ways, because the Capital cannot reliably fail its own checks on another repository's state:
   - each member's own `ki-trades` audit resolves the Capital policy and fails if the member is named but undeclared, and warns if it declares the skill but is named nowhere;
   - a Capital-run `ki` sweep resolves every named island through the local registry and reports each as conforming, failing or unverifiable because not checked out;
   - a route cannot be added to the Capital policy until the named island declares the skill.
   Missing or ambiguous Capital policy is reported as unavailable and trade operations fail closed; no permission is inferred from an Agora.
3. **Classification before metadata.** Agree ownership, kind and subject, audience, provenance, intent, and version and status as meanings first. A reference connects knowledge, a roadmap item manages work, and a trade is an optional, deliberate handoff whose provenance or response needs tracking. A classification describes information and never overrides access control.
4. **Unused opt-ins removed.** The seven non-KI declarations were removed on 2026-10-06 with their `_TRADES` scaffolds: `kit-legal`, `kit-hnr`, `hnr-agentic-harness`, `5g-emerge-phase2`, `5g-emerge-testbed`, `5g-emerge-apex` and chezmoi. HNR's exchange decision record was amended in place to defer its transport to this record.
5. **Cross-territory exchange deferred.** Its governance principles are designed here; activation, transport, automation and agreements with specific territories are not.
6. **One design home.** This record owns the model and coordinated rollout. Receiving repositories own their delivery: `KI-HARNESS-GOV-122` is narrowed to the shared skill and standard, and `KI-TOOL-CLI-104` covers resolution, validation, the sweep and the migration report. Both are blocked by this record.
7. **One-step delivery.** Approved by Kris Brown later on 2026-10-06: "just push this through and just get to where we want to be in the config". The staged releases collapse into one change, member route tables are stripped in the same sweep, and one `tools-ki` release follows verification.
8. **Mandatory Capital declaration.** Every `.ki.toml` names its Capital in `[skills.ki-repo].capital`, and the Capital lists its members, for every territory in the registry. A missing declaration fails immediately, with no warning phase: "just make it mandatory, and we can live with the CI failures for a few moments".
9. **Techné-to-Homebrew direction activated.** The pending `work` direction from `tools-techne` to `homebrew-tap` is granted by the Capital policy.

## Boundary

- Arcadia governs which handoffs are permitted; it does not write to another island, accept its work or schedule its agents.
- The switch is one coordinated change with no dual-authority fallback and no legacy parser.
- The two submitted records keep their observation policies and sender payloads; no route a retained record depends on is removed.
- Other territories are not enrolled through KI's public configuration, and no private counterpart identity or source-store path enters public governance.
- [[Techne Programme Hold]]: local implementation only; no remote operation.

## Current state

- Done 2026-10-06: decisions 1-6 approved; GOV-016 reserved (`768814f`); all seven non-KI opt-ins removed in their own repositories, with GDR-HNR-HARNESS-002 amended in place; `KI-HARNESS-GOV-122` re-scoped and `KI-TOOL-CLI-104` captured.
- Done 2026-10-06 (single-step switch): Charter authority, GDR-KI-ARCADIA-003, the Capital, territory and trade policy in Arcadia's `.ki.toml`, Capital declarations across the registry, and the harness and `tools-ki` changes. Verification and review evidence is recorded under Discussion.

## Steps

- [x] Record the owner decisions and reserve this identity.
- [x] Remove the seven unused non-KI opt-ins in their own repositories.
- [x] Re-scope `KI-HARNESS-GOV-122` to the shared contract and capture `KI-TOOL-CLI-104`, each blocked by this record.
- [x] Declare the Capital's route-policy authority in [[Admin/Governance/Charter|Charter]] and record it in [[GDR-KI-ARCADIA-003-capital-governed-trade-routes|GDR-KI-ARCADIA-003]].
- [x] Settle the policy location and schema, then author the Capital policy reconciling every current effective route, activating the Techné-to-Homebrew direction.
- [x] Deliver the harness standard (KI-HARNESS-GOV-122) and `tools-ki` resolution, member audit, Capital sweep and migration comparison (KI-TOOL-CLI-104).
- [x] Compare the switched estate with the saved v0.6.1 route report, strip member route tables, declare every Capital and its members across the registry, and re-audit the territory.

## Files touched

- This record, [[Admin/Governance/Charter|Charter]], [[Known Lands]], [[Admin/Governance/Decisions/Decisions|Decisions]], Arcadia's `.ki.toml` (Capital, territory and trade policy) and [[GDR-KI-ARCADIA-003-capital-governed-trade-routes|GDR-KI-ARCADIA-003]].
- Delivery in other repositories is owned by their linked items.

## Verify

- Every `ki-trades` audit in the territory passes against the Capital policy, and the Capital sweep reports no failing island.
- The migration report shows no effective route added or removed without an explicit decision, and both open records remain resolvable.
- No member `.ki.toml` carries a route table after the switch.
- Every registered repository declares its Capital, and every Capital lists its members.

## Dependencies / blocks

No local dependency. This record blocks `knowledgeislands/ki-agentic-harness` `KI-HARNESS-GOV-122` and `knowledgeislands/tools-ki` `KI-TOOL-CLI-104`, which record the reciprocal relationship in prose. Related but independent: [[KI-ARCADIA-ECO-006-simplify-ecosystem-agora-declarations|ECO-006]], [[KI-ARCADIA-MOD-006-knowledge-acquisition-lifecycle|MOD-006]], [[KI-ARCADIA-MOD-004-semantic-conventions|MOD-004]], [[KI-ARCADIA-GOV-001-boundary-rules|GOV-001]] and [[KI-ARCADIA-MOD-003-island-visualisation|MOD-003]] keep their own scope.

## Documentation impact

### Decision Records

A new governance Decision Record grants the Capital route-policy authority. GDR-HNR-HARNESS-002 in `hnr-agentic-harness` was amended by its owner to defer HNR's transport to this record.

### Specifications

The harness `ki-trades` standard and rubric change in `KI-HARNESS-GOV-122`.

### Guides

`ki-trades` EDUCATE output and the `tools-ki` trade command help.

### Roadmap

Closes on acceptance once the switch is verified.

## Discussion

### Implementation plan

Grounded in the code on 2026-10-06; the location, schema and single-step sequence were confirmed by the owner the same day.

- **Policy location.** A `[skills.ki-trades.territory]` table in the Capital's own `.ki.toml`, approved by the owner on 2026-10-06. It follows the existing precedent of the `kis` Agora home in the same file and keeps repository configuration in one place. Because today's tools reject unknown `ki-trades` keys, release A must accept the table before Arcadia adds it.
- **Capital discovery.** Every repository names its Capital in `[skills.ki-repo].capital`, and resolution goes through that declared URL in the local registry. The Capital must be registered exactly once, must name itself, and must list the repository in `[skills.ki-repo.territory].members`. This replaces scanning for whichever repository declares a territory table, so several territories can share one registry. An unregistered Capital makes the policy unavailable and trade operations fail closed. No permission is inferred from an Agora.
- **Schema.** Membership lives in `[skills.ki-repo.territory]` (`name` and the sorted `members`, including the Capital). Trade policy lives in `[skills.ki-trades.territory]`:
  - a `subtypes` table;
  - purposeful `[[channels]]` (`id`, `purpose`, `from`, `to`, `kinds`), which expand to exact source, receiver and kind triples with no self-route, members only and no duplicate triple;
  - `[[standing]]` grants (`subtype`, `from`, `to`), each covered by a knowledge channel.

  A member's `[skills.ki-trades]` may hold only `map_bonus`, and `routes` and `subtypes` are retired. GDR-KI-ARCADIA-003 records the schema.
- **Standing intake.** Grants and subtype descriptions move into the Capital policy so members stay bare. The receiver still runs capture in its own checkout and owns the resulting evidence.
- **Sequence.** On 2026-10-06 the owner collapsed the staged plan (releases A, B and C) into one change. In that change, Arcadia records the authority and decision, `tools-ki` (KI-TOOL-CLI-104) and the harness (KI-HARNESS-GOV-122) switch authority with no legacy parser or fallback, and every registered repository declares its Capital. Members strip their route tables in the same sweep. The coordinator cuts one `tools-ki` release after verification.
- **Known limits.** A named island that has not opted in cannot be selected by `--skill ki-trades`, so a full `ki repo audit` reports it through `ki-trades` resolution against the Capital instead. A Capital that is not checked out locally leaves a member audit with a warning, `territory policy lives in <capital>, not available here`, rather than a failure. A policy edit that withdraws a channel a live record depends on is caught by `ki repo trade policy compare` and by review under the Enactment Process.

### Classification meanings

Agree the meanings before choosing metadata keys. Use a small set of questions, not a new taxonomy imposed on every historical note:

- **Ownership:** which island owns the source, and under which territory's governance?
- **Kind and subject:** is this knowledge, a work request or a reference, and what is it about? A subject label is not permission.
- **Audience:** is the material public, territory-restricted, or restricted to an explicitly admitted audience? Access restrictions, licensing and confidentiality still apply inside one territory.
- **Provenance:** what source, path or item, revision, acquisition evidence and known omissions support it? Link versus copied adaptation must be distinguishable.
- **Intent:** is the receiver merely following a source, retaining knowledge, adapting it locally, offering a contribution, or being asked to do work?
- **Version and status:** is the source current, historical, superseded or a proposal, and is the local adoption pinned or intentionally refreshed? Delivery and acceptance are separate facts.

A classification describes information; it does not override access controls. A public reference can point towards material the reader cannot access without granting access to it. Credentials and raw restricted source material must not be placed in a public exchange record.

### When to use a trade

Keep trades optional and proportionate. Use one when a deliberate handoff needs originating constraints preserved or a receiver response tracked. The receiving roadmap or canonical knowledge artefact remains the outcome's authority; the trade is not a parallel execution queue.

Within KI, a repository asking another to change a capability may warrant a work trade. Reading another island's guidance, adding an ordinary reference, or directly creating an authorised receiver-owned roadmap item need not create one. A knowledge offer may warrant a trade when its receipt or disposition matters, not simply because it crosses a repository boundary.

For the first migration, preserve the two submitted records and their observation policies until their receiver-owned outcomes are resolved. Do not rewrite their sender payloads, claim receipt from a route declaration, or remove a route on which a retained record depends. Their individual disposition and cleanup remain separate from this proposal.

### Cross-territory cases

Central internal routing does not automatically extend across territorial boundaries. Distinguish three cases:

1. **Following public knowledge:** the receiving territory privately records its source, version and local adoption. Public upstream KI need not name its private consumers or declare a reciprocal route. Personal following public KI guidance is the worked example; it does not put dotfiles into `kis`.
2. **Restricted exchange:** the accountable owners explicitly agree the audience, permitted material and direction, provenance, update expectations and withdrawal conditions. Keep private counterpart identities and agreements out of public KI governance. Both sides' applicable export and import authority must be satisfied.
3. **A work offer or contribution:** the receiver decides whether to take it into local work. Publishing knowledge or offering a contribution does not grant execution authority; a formal trade is one possible handoff mechanism, not the mandatory form of every interaction.

The classification and governance of these cases belongs in the model proposal now. Activation, transport, automation and agreements with specific external territories remain deferred until reviewed separately. No public source-store path or private consumer inventory is introduced here.

### Techné-to-Homebrew direction

Resolved on 2026-10-06: the owner activated the `work` direction from `knowledgeislands/tools-techne` to `knowledgeislands/homebrew-tap`. Before the switch, `tools-techne` exported it but `homebrew-tap` did not import it, so it granted nothing. The Capital policy now grants it through the `homebrew-release` channel. It is the only route the migration adds.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
