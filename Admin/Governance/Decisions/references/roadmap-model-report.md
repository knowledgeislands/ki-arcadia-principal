# Roadmap model - recommendation (2026-10-07)

This report merges Kris's proposal and the orchestrator's reflection ([brief](brief.md)) with three independent reviews: Fable ([fable-view](fable-view.md)), Opus ([opus-check](opus-check.md)) and Astra ([astra-view](astra-view.md)). Disputes were settled against the roadmap standard, the work-item format, the next-work and acceptance procedures, the checker, the matrix report and the kit-legal Command Centre Guide. What evidence cannot settle is left to Kris in section 7.

## 1. Summary

- A **work record** (one Markdown file per piece of work, the KI equivalent of an Issue) gains `kind` (what sort of work), `project` (which finite outcome it serves) and `component` (which part of its repository it touches). `theme` goes, with the `.ki.toml` binding of each issuing area to a theme.
- **Status** says how far the work has got. It gains `triage` at the start and `cancelled` as a second ending. **Horizon** says when the work is intended, and stops meaning "not yet accepted".
- **Hold** replaces Waiting for and Parked with one `hold` horizon carrying a reason and release condition. Paused work keeps its status and baseline, and its timing is re-decided on release.
- **Projects are finite.** Upkeep is projectless and may name its initiative directly. `purpose` becomes optional; `artifact` stays out.
- **Initiatives and Projects** are a territory registry owned by Arcadia.
- **Ideas** stay outside records until they pass a stricter graduation test. The Enactment threshold stays with GOV-024.
- **Migration** covers open records, piloted in three repositories: lifecycle first, then registry, then judgement fields.

**Corrections to the brief.**
1. The deferral contradiction is inside the roadmap standard: it tells a deferral to preserve lifecycle state, but also keeps ready, in-progress and awaiting-review records in Now or Next. The checker enforces the second rule faithfully.
2. Only eight repositories plus chezmoi hold open records, not 21. There are 78 after OPS-011 closed; the theme map's 79 predates that.
3. Linear has no native Blocked state.
4. Remote adapters (Linear, GitHub Issues) are already allowed as canonical trackers, so tools are not only one-way projections.
5. The reflection's graduation test is word for word the existing capture rule, which produced the records captured too early.

## 2. The model

### Fields

The owner tier says who defines the allowed values: the harness standard, the territory (Arcadia) or each repository's `.ki.toml`.

| Field | Owner tier | Values | Required? | Linear mapping |
|---|---|---|---|---|
| `status` | standard | triage, draft, ready, in-progress, awaiting-review, done, cancelled | always | workflow state, with Duplicate for duplicates |
| `horizon` | standard | now, next, soon, future, hold | adopted, open records | priority or label group, not Cycle: Cycles are dated and roll over |
| `hold` | standard | `{reason: waiting-for \| parked, condition, review, trades}` | when horizon is hold | `hold` label plus blocking relations |
| `resolution` | standard | obsolete, rejected, duplicate, merged, superseded | when cancelled | Canceled or Duplicate, plus a comment |
| `resolution_target` | standard | qualified canonical ID, any repository | duplicate, merged, superseded | relation or link |
| `kind` | standard | deliver, decide, investigate, audit | once adopted | label group; GitHub and Jira have issue types |
| `purpose` | standard | capability, corrective, debt, governance, learning, adoption, upkeep | optional | label group |
| `project` | territory | registry slug | optional | Project |
| `initiative` | territory | registry slug | projectless records only; otherwise looked up | Initiative |
| `component` | repository | declared in `.ki.toml` | optional | label group, or Jira Components |
| `area` | repository | issuing code such as `GOV` | as today | not projected |

`theme`, `intake_disposition*`, `waiting_on_trades` and the Waiting for and Parked horizons go; `hold.trades` replaces `waiting_on_trades`. A direct initiative that conflicts with the project's fails the checker.

`kind` classifies the controlling outcome, not every step:
- `deliver` produces a change.
- `decide` closes by pointing at a Decision Record.
- `investigate` closes on a finding, as in [KI-HARNESS-GOV-087](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-087-evaluate-obscura-browser-runtime.md). Measurement and evaluation belong here.
- `audit` is an independent assessment whose outcome is findings, including each housekeeping run.

`audit` replaces the earlier `review`, which clashed with awaiting-review. Identifiers do not decide kind: [KI-HARNESS-REV-011](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-REV-011-review-harness-automation-coverage.md) changes the harness standard, so it is `deliver`. The kind decides which plan and review sections a record needs, so a decision is no longer forced through Steps, Files touched and a six-part review packet.

### Horizon x status after the change

| Status | Allowed horizon |
|---|---|
| triage | none |
| draft | now, next, soon, future, hold |
| ready | now, next, hold |
| in-progress, awaiting-review | now, hold |
| done, cancelled | none; kept as history |

The checker rule becomes one line: a horizon is required if and only if the record is adopted and open. Starting work moves the record to Now in the same change, so Now and Next finally differ, as the [matrix report](/Users/krisbrown/.local/state/claude-bg/gov-020/matrix.report.md) proposed. Held review covers a reviewer who is not yet available. Views show the Now count as a signal, with no cap.

### Lifecycle moves

| Move | Rule | Owner skill |
|---|---|---|
| Adopt | triage -> draft and set a horizon, with explicit human approval | ki-next |
| Defer | change horizon, keep status | ki-next |
| Hold | horizon -> hold with a reason, a named release condition, and a review date where release cannot be observed. Status, `baseline_ref`, completed steps and review evidence are kept. The checker warns on an in-progress hold older than a month, because a stale baseline turns resuming into a rebase | ki-next |
| Release | evidence that the condition changed; choose a horizon afresh and revalidate scope and dependencies | ki-next |
| Cancel | any open record, including triage, with a `resolution` and a `## Cancelled` section (who, when, why, outstanding changes), human-approved, prunable like done | ki-accept |
| Duplicate across repositories | `resolution: duplicate` or `merged` with a qualified target. Only the owning repository closes its record. The checker warns, never fails, on an unresolved target, and closure keeps a revision and path reference so evidence survives pruning | ki-accept |
| Failed review | awaiting-review -> in-progress | ki-accept |
| Replan | ready -> draft. Replanning in-progress work keeps baseline and delivered evidence and replaces only the remaining plan, under renewed approval | ki-plan |

Triage closure becomes an ordinary cancellation, removing today's Triage/done exception. Today the acceptance standard also requires a duplicate target in the same roadmap, which blocks the cross-repository cases. The four blocked closures map as follows:

- [BREW-011](/Users/krisbrown/workspaces/kit/knowledgeislands/homebrew-tap/docs/roadmap/BREW-011-register-ki-pin-consumers.md) is a duplicate of [KI-HARNESS-GOV-141](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-141-auto-bump-released-ki-pin.md).
- [KI-HARNESS-OPS-001](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-001-complete-claude-state-cleanup.md) is a duplicate of [DOTFILES-UE-056](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-056-review-host-claude-cleanup.md); its pointer is provenance, not a second owner.
- [KI-ARCADIA-OPS-002](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-OPS-002-tooling-rollout.md) is obsolete.
- [KI-ARCADIA-GOV-010](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-GOV-010-assess-estate-tooling-commonality.md) is superseded, with a target once the factorisation record exists.

These fields belong in `ki-work`'s abstract vocabulary, which the roadmap, KB Streams and Linear adapters all map; otherwise the first repository on `adapter = "linear"` forks the model. The roadmap and KB Streams checkers share one status and horizon table.

## 3. Initiatives and projects

An **Initiative** is a long-lived direction. A **Project** is a finite outcome with a lead, target, health and lifecycle (planned, active, paused, completed, cancelled).

| Initiative | Projects | Projectless work |
|---|---|---|
| Platform foundations | Baseline rollout; Estate factorisation | standards upkeep |
| Techné | Agent host; Paperclip bootstrap and recovery; Delta evaluation | - |
| Knowledge Islands model | Island model and Tending; Territories and trades; Knowledge acquisition; Specifications (paused); Website (paused) | - |
| Rig | - | workstation hygiene |

**Upkeep is not a project.** Standards upkeep and workstation hygiene never finish, so they cannot complete or report meaningful health. Their finite records carry no project, name the initiative directly where useful, and are found by `purpose: upkeep` and component. Recurring obligations stay Activity or housekeeping definitions with linked runs. Linear attaches issues to initiatives only through projects, so the projection reports that coverage gap rather than the canonical model inventing endless projects.

**Registry.** Arcadia owns the registry under the Charter's territorial authority: one note per project under `Streams/Projects/<slug>.md`, with frontmatter the checker reads (slug, outcome, initiative, lifecycle, lead, target), and an `Initiatives` index note. Not `+/_CHECKPOINTS/`, which is inbound staging removed when a thread ends. The portable schema belongs in the harness; runtime registry discovery supplies paths. Two limits apply:

- Tagging another island's record with a project is classification, not authority. The receiving repository decides whether its record joins.
- Project slugs are scoped to this territory. HNR, kit-legal and Vallearmonia keep their own.

An unknown slug or unavailable registry gives an unresolved-reference warning, never a failure or silent ungrouping. The checker reports a project whose members are all done or cancelled; completing it remains an accountable decision, and health is never inferred from counts.

**Checkpoints and reviews.** A checkpoint becomes the project note's update section: health, the one decision and its test, the facts it needs and one next step. State-of-play becomes the initiative review. Neither copies record lists into a second status source.

## 4. Ideas before records

An **idea** has no identifier, horizon or status. Like a Command Centre Working Note, it never owns state. It lives in its project note's Ideas section, or, with no project, as a bullet in a per-repository `_IDEAS.md` beside `_ISSUES.md`. Graduation links the record and removes the bullet, keeping useful research.

**Graduation test.** Goal, context and boundary is today's capture rule, so it is not enough. After checking for an existing owner, an idea becomes a record only when:

- (a) it is **actionable**: the next step is known and no unmade decision blocks it;
- (b) it is a **decision** with an owner and a needed-by date (`kind: decide`); or
- (c) it must **survive the session**: deferred, delegated, multi-step, or reviewed by someone else.

Unknown implementation is fine for an investigation or decision, and a missing prerequisite alone does not make capture premature. `ki-next` capture defaults to the Ideas section when a project is known.

**Enactment threshold.** Record capture and Enactment are different thresholds. [KI-ARCADIA-GOV-024](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-GOV-024-review-the-enactment-threshold.md) owns when Arcadia's canonical zones need an Enactment record, and this design must not silently widen today's exemptions. Test (c) goes to GOV-024 as a candidate: an owner-instructed change finished and verified in one sitting needs only a commit. Under it, [KI-ARCADIA-GOV-022](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-GOV-022-file-the-agent-host-prototype-diagrams.md) would have been a direct edit, and [KI-ARCADIA-GOV-025](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-GOV-025-model-agent-hosts-as-recipes-and-bindings.md), now Ready in Now, would have waited as an Agent host idea until actionable.

## 5. Where the reviewers agree and differ

All positions agree on three-tier ownership, triage as a status, a `cancelled` status, storing `project` and deriving initiative, no Now cap, horizon not being a Linear Cycle, and holding paused work without losing status or baseline.

| Topic | Reflection | Fable | Opus | Astra | Recommendation and evidence |
|---|---|---|---|---|---|
| `purpose` | keep | cut | keep, six values | optional, seven values | Optional (decision 4). With projectless upkeep, "find the upkeep" is a real query, and dropping `theme` strips 26 harness `governance-consistency` records of any signal |
| `artifact` | keep | cut | cut | optional | Leave out. No view needs it and `kind` implies decision and investigation outputs. Astra's list is the candidate if one does |
| `kind` | five, with verify | four | five | four | deliver, decide, investigate, audit. [DOTFILES-UE-062](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-062-measure-the-live-apply.md) closes on a finding, so it is `investigate` |
| Hold | horizon, `resume` | horizon, `hold.from` | marker | horizon; resume re-evaluated | Horizon (decision 2) |
| Held review | no | - | yes | yes | Allow |
| Cross-repository duplicate | `duplicate_of` | free `superseded_by` | `resolution` plus target | qualified target; owner closes | Qualified `resolution_target`, warn never fail, owner closes |
| Upkeep | `initiative` on record | no project | continuous project | no project, direct `initiative` | Finite projects (decision 5). A continuous project contradicts the definition |
| Registry home | Arcadia | TOML in Admin | Streams project notes | Admin, via Enactment | Streams project notes (decision 6) |
| Specifications, Website | paused projects | not projects | silent | silent | Paused projects only if each names a finite outcome |
| `area` | rename | keep | rename to `series` | keep, unbind from theme | Keep, and remove the `.ki.toml` area-to-theme binding |
| Idea home and test | project; capture rule | `_IDEAS.md`; capture rule | project note; stricter | working notes; near capture rule | Project note, `_IDEAS.md` fallback, stricter test |
| Enactment threshold | - | - | same as capture | separate; GOV-024 owns | Offer test (c) to GOV-024 |
| Migration | tooling first, all records | mechanical then judgement | open records, four phases | inventory, pilot, dual schema, enforce | Open records, pilot, enforce after coverage |

## 6. Migration plan

| # | Step | Owner repository |
|---|---|---|
| 1 | Accept this model as a design decision | ki-arcadia-principal |
| 2 | Freeze a dated inventory of every repository and record, including empty roadmaps, with identities, links, timestamps, baselines and approvals | ki-arcadia-principal (read-only elsewhere) |
| 3 | Harness standard: fields in `ki-work`'s vocabulary, one status and horizon table, new moves and owners, housekeeping runs as `kind: audit`, no area-to-theme binding | ki-agentic-harness |
| 4 | Checker and CLI: old and new shapes behind an explicit schema version, an idempotent migration helper with before/after comparison, `ki roadmap list --by project` | ki-agentic-harness, tools-ki |
| 5 | Registry project and initiative notes, with checkpoints folded in through Enactment | ki-arcadia-principal |
| 6 | Pilot in the harness, Arcadia and chezmoi. Mechanical pass: triage horizon to status; Waiting for and Parked to hold with the condition lifted from prose; `waiting_on_trades` to `hold.trades`. Judgement pass, agent-proposed and Kris-approved: `kind` (default `deliver`, about 18 overrides), `project`, `component` and `purpose` where clear. Close the four duplicates | pilot repositories |
| 7 | Remaining open records, one commit per repository. Prune eligible done records; grandfather the rest | each repository |
| 8 | Enforce the new schema once coverage is complete | ki-agentic-harness, tools-ki |
| 9 | Later: one Linear projection, after settling its authority boundary with [KI-HARNESS-FND-014](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-FND-014-implement-remote-adapters.md), which proposes authorised remote lifecycle adapters, GitHub Issues first - broader than display projection | ki-agentic-harness |

`theme` moves to `component` where the value is genuinely a component and is dropped otherwise; `governance-consistency` records are classified by kind and purpose instead. Classifier suggestions are evidence for review, not mutation authority, and missing approvals or history are never reconstructed.

**Keep minimal:** no `artifact`; no mandatory `purpose`; no `area` rename; no Now cap; no record dates except the hold review date; no cross-repository resolution at validation time; nothing waits for FND-014.

The mechanical pass advances `updated_at` on every open record, resetting age reporting. Accept that and say so in each migration commit.

**Left open.** The work-item format clears `blocked_by` once the prerequisite exists, while readiness requires dependencies done. Settle landed-but-unaccepted prerequisites in a separate record.

## 7. Decisions for Kris

1. **Triage and cancel.** Triage as a status plus `cancelled` with `resolution` (A), or triage stays a horizon (B). *Recommend A*: it unblocks the four approved closures.
2. **Hold.** A `hold` horizon whose timing is re-decided on release (A), or a marker that keeps the original horizon and returns there (B). *Recommend A*: your original instinct, favoured by three of four reviewers, and no costlier than B without a return-path field. Choose B if automatic return matters more.
3. **`kind`.** deliver, decide, investigate, audit (A), or add `verify` (B). *Recommend A.*
4. **`purpose` and `artifact`.** Optional `purpose` now, no `artifact` (A); defer both (B); both optional (C). *Recommend A* if you choose 5A, since upkeep then has no other home. Make `purpose` mandatory only once classifications prove consistent.
5. **Upkeep.** Finite projects with a direct `initiative` on projectless records (A), or continuous standing projects (B). *Recommend A*: project health stays meaningful and Rig survives. B fits Linear's hierarchy better.
6. **Registry home.** Project notes in Arcadia `Streams/Projects/` with an Initiatives index (A), or TOML in `Admin/Governance/` (B). *Recommend A.* Both go through Enactment.
7. **Ideas and enactment.** Stricter test for capture, with test (c) offered to GOV-024 (A); stricter test for both now (B); or today's rule (C). *Recommend A.*
8. **Migration scope.** Open records, three-repository pilot, enforce after coverage (A), or every record including retained terminal ones (B). *Recommend A*, and keep `area` unless you want `series`.

## Changes after Astra

- Hold becomes a horizon with timing re-decided on release; held review is allowed.
- Projects must be finite: upkeep is projectless with a direct `initiative`, and optional `purpose` finds it.
- `review` becomes `audit`, `merged` joins the resolutions, and only the owning repository closes a duplicate.
- The Enactment threshold goes to GOV-024 rather than being settled here.
- Migration gains an inventory, a pilot and later enforcement; FND-014 is described accurately.
- The area-to-theme binding is removed explicitly, and the dependency-rule conflict is left open.
