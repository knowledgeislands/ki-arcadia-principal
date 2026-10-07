# Roadmap field model - an independent view (Fable, 2026-10-07)

Read-only critique of the brief and the orchestrator's reflection. I read both standards, the next-work procedure, the matrix and theme reports, the Command Centre Guide, every `.ki.toml` roadmap declaration in the estate, and the frontmatter of all 86 records plus six records in full. No repository was edited.

## Verdict

1. Three-tier ownership (harness fields, Arcadia project registry, per-repository component) and a status-preserving `hold` are right. Adopt both.
2. `kind` earns its place; `artifact` and `purpose` do not. Cut both from the portable standard.
3. Triage is a status, not a horizon. Horizon then means only "when", with five values: now, next, soon, future, hold.
4. Store `project` on the record and derive `initiative`. Records without a project are simply unprojected; do not invent continuous projects.
5. Migrate in two passes: a mechanical rename first, judgement fields second. The reflection's sequence leaves every record frozen behind tooling for weeks.

## 1. kind, artifact, purpose - Differ

**kind - Agree, with a smaller list.** The record set proves the need. Of 78 open records, roughly 18 have titles beginning Decide, Evaluate, Assess, Review, Diagnose, Measure or Gather evidence. Each is forced through a format built for deliverables: Steps, Files touched, a Verify command, a six-part Review packet. GOV-099 (decide serial gaps) and GOV-087 (evaluate Obscura) are the clearest cases. `kind` lets the stage-detail contract vary: a `decide` record verifies by pointing at a Decision Record; an `investigate` record closes on a finding, not a diff.

Values: `deliver`, `decide`, `investigate`, `review`. Four, not five. The reflection's `verify` is a step inside other work, not a work item; in the Command Centre it exists because legal facts need standalone checking, which has no KI analogue. Housekeeping runs are `review`. Cross-repository handoff items are `deliver` in the receiving repository.

**artifact - Differ, cut.** HNR needs an Artifact label because one product codebase ships many output types. In KI the artefact is fixed by the repository: `tools-ki` ships CLI, every `mcp-*` ships an MCP server, chezmoi ships environment, a KB ships notes. The field would be constant within 18 of 21 repositories and so carry no information. The one repository where it varies, the harness (standard versus skill versus rubric script), is exactly where `component` should carry it. Allow a repository to declare artefact-like component values; do not add a portable field.

**purpose - Differ, cut.** Feature, Enabler, Debt, Corrective, Process and Solution is a portfolio-balance instrument for a business with customers and a backlog to defend. KI has one owner and no portfolio report. Agents would fill it by guesswork and nobody would query it. Nothing in the twelve themes or the state-of-play review asked a question that purpose answers.

Resulting portable additions: `kind` (required), `component` (repository-declared, optional for single-component repositories), `project` (optional slug). That is the whole split.

## 2. Triage - Differ

Kris already smells the redundancy ("triage both horizon and status???"). Today `horizon: triage` forbids every status except draft and a terminal disposition. A horizon that constrains lifecycle that tightly is a lifecycle state. The reflection's "triage means no horizon" keeps a required field that is null in exactly one state, which is the same awkwardness moved sideways.

Make `triage` the first status: `triage -> draft -> ready -> in-progress -> awaiting-review -> done`, plus `cancelled`. Adoption is the `triage -> draft` transition and sets the horizon. The checker rule becomes one line: horizon is required if and only if status is adopted and open. Linear agrees: Triage is a status category there, not a cycle.

**hold - Agree, with two tweaks.** Collapsing waiting-for and parked is sound because the two differ only in the reason, and the reason is what matters for leaving. The structured `hold: {reason, condition}` is not optional decoration: the matrix report found that only one of 18 held records has a dedicated condition heading, so the prose convention has already failed. Drop `resume`; store the horizon the record left in `hold.from` and return there by default. Add a WARN for an `in-progress` hold older than a month, because a stale `baseline_ref` turns resumption into a rebase.

## 3. Matrix, paused work, cancel, duplicate - Agree with cuts

With triage as a status the matrix collapses to a few rules.

| status | permitted horizon |
|---|---|
| triage, cancelled | none |
| draft | now, next, soon, future, hold |
| ready | now, next, hold |
| in-progress, awaiting-review | now, hold |
| done | last horizon kept, ignored |

This adopts the matrix report's best idea: starting work moves the record to Now in the same change, so Next finally means something. The 38 Now records are a symptom of Now and Next being indistinguishable, not of a missing ceiling. **Differ with a Now cap**, even as a WARN at five: it would fire in every active repository today and teach people to ignore it. Revisit once Next is honest.

**Paused work - Agree.** Hold preserves status and `baseline_ref`. This dissolves the standing contradiction between the deferral rule and the checker.

**Cancel - Add.** Adopted work needs `cancelled` as a second terminal status, with a `## Cancelled` section mirroring `## Done` (who, when, why, superseding identifier if any) and the same prune eligibility. Four approved closures were blocked last week for want of this.

**Cross-repository duplicate - Differ.** Do not build cross-roadmap `merged` or `duplicate` resolution. It needs the registry at validation time and breaks offline structural validity. Use `cancelled` with a free `superseded_by: <ID>` string that the checker does not resolve. That closes BREW-011 against GOV-141 today.

## 4. project and initiative - Agree on storage, Differ on upkeep

Store `project` only and derive `initiative` from the registry. Agree.

Differ on upkeep: do not put `initiative` on a record. A record with no project is unprojected, and the by-initiative view shows "no project" per repository. Linear does not require an issue to have a project; "No project" is a first-class filter, so the standing continuous projects the reflection worries about are not needed.

Registry: Arcadia owns it under the Charter's territorial authority, Agree. It must be a machine-readable file (TOML) in `Admin/Governance/`, not prose, with one entry per project: slug, initiative, lifecycle (active, paused, done), target, checkpoint path. Unknown project values in other repositories WARN rather than FAIL, so repositories never break when Arcadia lags. Two of the twelve agreed themes, `specifications` and `website`, are repositories whose records are all on hold, not projects; `standards-upkeep` and `workstation-hygiene` are not finite. None of the four belongs in the registry. That leaves eight projects under three initiatives, which matches the Linear vocabulary Kris liked.

## 5. component and the area clash - Agree, Differ on rename

Rename `theme` to `component` and decouple it from `area`. Today fixed-area mode binds `areas.GOV = "governance-consistency"`, so GOV-087 (evaluate a browser runtime) is themed governance-consistency because its serial was issued under GOV. Decoupling fixes that. Make component optional where a repository declares one or none: chezmoi's eleven user-environment records and every `mcp-*` repository carry nothing in the field.

**Differ on renaming `area`.** It is baked into identifiers, every `_ISSUES.md` ledger, the checker and twenty `.ki.toml` files. The clash is with an HNR Linear label group KI will never project to. Keep `area` as the issuing code, map it to nothing in projections (the identifier already carries it), and say so in one sentence of the standard.

## 6. Ideas and the graduation test - Agree on test, Differ on home

The graduation test is right: a record exists once Goal, Context and Boundary can be stated; before that it is an idea with no identifier, horizon or status. The Command Centre's rule that Working Notes never own status is the discipline to copy.

Differ on where ideas live. The reflection puts them in the project checkpoint, but checkpoints are per thread and Arcadia-only, while ideas arise in every repository and three held harness records have no owning thread at all. Let each repository keep a flat `_IDEAS.md` beside `_ISSUES.md` (KB equivalent in `Streams/Roadmap/`): bullets only, no identifiers, no ordering, graduation deletes the bullet. Cross-repository ideas go to the project checkpoint. The checker verifies only that it is not a record.

This answers most of GOV-024. The enactment threshold becomes: a record is needed when the change would have a `kind` with more than one step or a decision in it; a bounded, owner-instructed single edit to canonical content is a direct edit with a commit message. Under that test GOV-022 (file the diagrams) would have been a direct edit inside the agent-host project, not a third record.

## 7. Tool mapping - Agree, with one correction

Clean: repository to Team; record to Issue; status to workflow state (triage, backlog for draft, todo for ready, in progress, in review, done, cancelled); `project` to Project; derived `initiative` to Initiative; `component` to a team label group; `kind` to a workspace label group (Linear has no native issue type); `blocks` and `blocked_by` to relations. GitHub Projects takes all of it as custom fields. Jira: `component` to Components, `kind` to Issue Type, `project` to Epic, and note that a Jira Project is our Team.

Does not project: horizon. The brief equates now and next with Cycles, but Cycles are dated and auto-roll, so the projection would have to manage dates it does not own. Map now, next, soon and future to priority levels and `hold` to a label. The review packet, `baseline_ref` and `area` stay in the record. Agree that projection is one-way with links back, and FND-014 (remote adapters) is itself on hold, so nothing here should block on it.

## 8. Migration - Differ on sequence

Pass one is mechanical and scriptable, one commit per repository, no judgement: `theme` to `component` with the same value; waiting-for and parked to `horizon: hold` with `hold.reason` set and `hold.condition` marked for later; `horizon: triage` to `status: triage` with horizon removed. The checker accepts old and new shapes for one release. Fifteen harness and `tools-ki` files name the old horizons and change in the same release; `waiting_on_trades` and the housekeeping `spawn-horizon` enumeration are the two with semantics attached.

Pass two is judgement, agent-proposed and Kris-approved per repository: `kind` on every open record (default `deliver`, override about eighteen); `project` lifted from the already-approved theme map; component re-picked where the old area binding was wrong; hold conditions written. Close the four duplicates first with the new `cancelled` status. Leave done records alone; they are prune-eligible and not worth the review time.

What I would cut: `purpose`, `artifact`, the `verify` kind, `initiative` on records, the Now cap, the `area` rename, continuous Linear projects, `hold.resume`, and any registry entry for a non-finite theme.

## 9. Missed - Add

- Projects need a lifecycle and a close ritual, or the registry becomes another list that rots. A project is done when every member record is done or cancelled; the checker can report that.
- `soon` has one record in the estate. Once Next is distinct from Now, soon-draft and next-draft may be the same thing. Keep it for now and watch.
- The record model is shared by two adapters with two checkers (roadmap and KB Streams). Every field change must land in both in one release, or Arcadia and the harness drift. Name one owner of the status and horizon tables and have the other import it.
- Housekeeping templates need a `component` and should spawn `kind: review` runs.
- Pass one is a semantic mutation under the timestamp contract, so `updated_at` advances on every record and age reporting resets. Accept it and say so in the migration note.
- Keep dates off records. The Command Centre's deadline and event kinds exist because courts set dates; projects carry a target, records do not.
