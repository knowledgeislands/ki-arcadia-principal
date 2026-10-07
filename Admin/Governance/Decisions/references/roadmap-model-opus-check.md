# Roadmap field model - independent Opus check (2026-10-07)

## Verdict

1. The reflection gets the main direction right: three-tier ownership, triage as a status, a real `cancelled`, and `project` stored on the record with `initiative` derived from it.
2. It misses the biggest constraint. `ki-work` already allows Linear and GitHub Issues as *canonical* adapters, so the field model belongs in the adapter-neutral vocabulary, not only in `ki-work-roadmap`.
3. I differ on three points. Drop `artifact`. Make hold an overlay on a horizon rather than a horizon of its own. Give every record a project, with standing projects for upkeep, instead of a second `initiative` field.
4. Using goal, context and boundary as the graduation test is the capture rule we already have, and that rule produced the records captured too early. The test needs to be stricter, and it can be the same test GOV-024 needs for enactment records.
5. Sequence the migration by pain: lifecycle first, then project, then kind and purpose, then component. Migrate open records only.

## Fact check of the brief

| Claim | Verdict | Evidence |
|---|---|---|
| Harness `governance-consistency` 26 of 36; chezmoi `user-environment` 11 of 11 | Correct | Frontmatter count today: 25 open plus 1 in progress of 36; 10 draft plus 1 done of 11 |
| "21 repositories + chezmoi; 78 open" | Correct but misleading | Only eight repositories plus chezmoi have roadmaps (`themes.report.md:3`). The count is 78 after OPS-011 closed (`themes-apply.report.md:16-18`) |
| `theme` "carries little information" | Understated | In fixed-area mode each area code maps one-to-one to a theme (`standards-repository-roadmaps.md:66-75`; harness `.ki.toml:92-96`). The harness `theme` adds **zero** information beyond the ID |
| "Standard says deferral preserves status but checker fails" | Wrong locus | RR:110 says "preserve ... any linked item lifecycle state", which is ambiguous. RR:144 itself requires `ready`/`in-progress`/`awaiting-review` to stay in Now or Next, and the checker (`roadmap-evidence.ts:574-578`) enforces that faithfully. The contradiction is inside the standard, not between the standard and the checker |
| Four approved duplicate closures blocked | Correct | `themes-apply.report.md:15,33-37`. Same-roadmap target: WF:53. Triage is not a deferral destination: NX:107 |
| `area` is the issuing code | Correct | WF:65, RR:47 |
| `task_links` exists; FND-014 would build adapters | Correct | WF:69-86; `ki-work-linear/references/standards-linear.md:32` |
| Command Centre: Working Notes never own status; views never hand-kept | Correct | `Command Centre Guide.md:26,51-53` |
| Kinds wait/chase/deadline/event | Correct | CCG:108-117. Note that CCG models `waiting`, `blocked` and `deferred` as **statuses** (CCG:122-131), which is relevant to hold |
| "Linear: hold -> Blocked state" (reflection 4) | Wrong | Linear has no native Blocked state. "Blocked" comes from issue relations, or from a custom state each team must add |
| "Records stay canonical; tools are one-way projections" | Incomplete | `ki-work` accepts `adapter = "linear"` or `"github-issues"` as the canonical tracker (`standards-change-management-adapters.md:17-20,28-30`). Projection is one option, not the only one |
| Now and Next indistinguishable | Correct | RR:112; NX:74 gathers both in one pool |

## 1. kind / artifact / purpose - **Differ**

Kind and purpose are orthogonal and worth having. Artifact is not, in this estate. Most repositories produce a single kind of artifact: chezmoi produces configuration, tools-ki the CLI, ki-website the site and the MCP repositories MCP servers. Artifact is therefore usually a function of the repository, and where it is not (the harness), `component` already says which part. HNR's own figures warn against it: "Tasks (non-artefact)" holds 80 of about 187 labelled issues, so the field degenerates into "none". Testing the reflection's list against real records shows the same strain. GOV-099, 102 and 108 ("Decide ...") produce a Decision Record, so "none" is wrong for `decide`.

Proposed values:

- **kind** (required once adopted): `deliver`, `decide`, `investigate`, `verify`, `review`. This mirrors CCG action/decision/investigation/verification. Recurring housekeeping runs are `review`. Today's titles map cleanly: GOV-087 "Evaluate" is investigate, UE-062 "Measure" is verify, REV-011 is review, and most GOV records are deliver.
- **purpose** (required once adopted): `capability` (new behaviour; HNR Feature), `adoption` (rolling an existing capability into an island or territory; HNR Solution), `enabler` (quality attributes), `correction`, `debt`, `upkeep` (keeping standards and the environment current). `process` folds into `enabler` or `upkeep`. A six-value list that everyone reads the same way beats a precise list nobody can tell apart.
- **artifact**: cut. If it is wanted later, make it an optional multi-valued tag, never required.

## 2. Triage and hold - **Agree** on triage, **Differ** on hold

Triage belongs in status (Linear treats Triage as a workflow state, and Kris's "both???" points the same way). Collapsing waiting-for and parked is sound, because the two differ only in who holds the key, and a `reason` subfield keeps that. But hold is neither "when" nor "how far". It is an interruption. Command Centre treats it as status-like (CCG:122-131).

My proposal is to keep the record's horizon and add an overlay, `hold: {reason: waiting-for | parked, condition: "...", trades: [TRD-...]}`. A paused in-progress record stays `now / in-progress` with `hold` set. This removes the need for `resume`, keeps the baseline, absorbs `waiting_on_trades`, and lets views show a Hold lane while excluding held records from Now counts. A parked Future idea becomes `future` plus hold, which says more than `parked` does today. If Kris prefers hold as a horizon for its lane metaphor, the reflection's `resume` field is the necessary price. That is workable, but it carries the extra field.

## 3. Status x horizon - **Agree** in outline, **Add** the gaps

| Status | Allowed horizon |
|---|---|
| triage | none |
| draft | now, next, soon, future |
| ready | now, next |
| in-progress, awaiting-review | now |
| done, cancelled | horizon kept as history, not checked |

`hold` is allowed on any open adopted record. Starting work moves it to Now, so Now and Next finally differ (matrix proposal, `matrix.report.md` section 3). The reflection omits the two regression routes the matrix found: `awaiting-review -> in-progress` for a failed review (owned by ki-accept) and `ready -> draft` for a replan (owned by ki-plan). Both need named owners.

For closure, use `cancelled` plus a `resolution` of `obsolete`, `rejected`, `duplicate`, `merged` or `superseded`, and `resolution_target` set to a canonical ID in any repository (Jira's resolution field is the direct precedent). This replaces `intake_disposition*` everywhere. Triage closure then becomes an ordinary cancellation, which removes the Triage/done exception. The four blocked cases map as follows: OPS-002 obsolete; BREW-011 and OPS-001 duplicate (cross-repository); GOV-010 superseded, with no target until FND-5 exists. Cross-repository targets resolve through the registry `repo_code`, so treat them as a WARN offline rather than a FAIL.

## 4. initiative / project - **Differ** in part

I agree that `project` is stored and `initiative` derived. I would not let upkeep records carry `initiative` instead. That creates two fields with an either-or rule, and Linear cannot represent it anyway. Give each initiative's upkeep a standing project (`standards-upkeep`, `workstation-hygiene`, marked `continuous: true` with no target date). Linear teams do this routinely. Every adopted record then carries at most one `project` and nothing else, and `purpose: upkeep` carries the semantics.

On where the registry lives: in Arcadia, but not in `+/_CHECKPOINTS/`. `+` is inbound staging, and ki-checkpoint is for "one active thread" that is removed when the thread finishes. A Project needs durable identity, lead, target, health and lifecycle (`planned / active / paused / completed / cancelled`). Proposal: Project notes in Arcadia `Streams/Projects/<project-id>.md`, with the checkpoint becoming the note's current update section, and `Initiatives` as the index note. Two cautions:

- Tagging another island's record with a project is classification, not authority. The receiving repository decides whether its record joins, per the Charter and AGENTS.md "confer no jurisdiction".
- HNR, kit-legal and Vallearmonia are other territories, so project IDs must be scoped per territory registry, not assumed global.

## 5. component vs theme; `area` - **Agree**, **Add**

Because of the fixed-area binding (RR:66-75), you cannot "rename theme to component" in the harness or chezmoi without breaking the area-to-theme map. Make the break deliberate:

- Delete `theme` entirely.
- Keep the issuing code but rename it `series` in `.ki.toml` (`series.GOV = "Governance"`).
- Drop the `area:` frontmatter field, because it duplicates the ID. That makes this a cut, not a rename.
- Declare `components` separately and make them mutable.

Real candidates:

- Harness: its skill families (`change-management`, `repo-structure`, ...), which are already directories.
- tools-ki: CLI command groups.
- chezmoi: `rig`, `shell`, `launchd`, `mcp-binding`, `secrets`, `claude-state`.
- Arcadia: `governance`, `model`, `operations`, `ecosystem`.

Component is optional where a repository declares none.

## 6. Idea stage, graduation and GOV-024 - **Differ**

The reflection's test ("can state goal, context and boundary") is word for word the capture rule (NX:66). That rule also tells agents to capture without approval, so it produced the records captured too early (GOV-025, UE-063 and the others in `themes.report.md`). A stricter graduation test is needed. An idea becomes a record only when one of these holds:

- (a) it is **actionable**: the next step is known and no unmade decision blocks it;
- (b) it is a **decision with an owner and a by-date** (`kind: decide`);
- (c) it must **survive the session**: work that is deferred, delegated, multi-step, or reviewed by someone else.

Otherwise it goes into the Project note's Ideas section, which carries no status, exactly as Command Centre Working Notes do (CCG:53). Amend NX:66 so that capture inside a known project defaults to the Ideas section.

GOV-024 asks the same question for Arcadia's canonical zones, so give both one test. Test (c) is the enactment threshold. An owner-instructed change completed and verified in one sitting needs only a commit. Anything deferred, delegated or needing review gets a record.

## 7. Tool mapping - **Agree**, **Add** losses

Maps cleanly:

- repository to Team or GitHub repository;
- status to workflow state (triage to Triage, draft to Backlog, ready to Todo, in-progress to In Progress, awaiting-review to In Review, done to Done, cancelled to Canceled, or to Duplicate when the resolution is duplicate);
- `blocks` and `blocked_by` to relations;
- `project` to Project, initiative to Initiative;
- timestamps to native fields;
- `task_links` as the back-link.

Maps poorly:

- **Horizon is not Cycle.** Cycles are dated time-boxes with automatic rollover. Use a team label group (Linear) or a single-select field (GitHub Projects, which is the cleanest fit).
- **Kind**: GitHub issue types and Jira issue types are native; in Linear it is a label group.
- **Component**: Jira Components; a per-team label group in Linear.
- **Hold**: a label (see the fact check).
- **IDs** do not project. Linear and GitHub assign native keys, so the KI ID has to ride in the title or the attachment.
- **Done with review packet**: acceptance cannot be inferred from a state name (`standards-linear.md`). Body sections go to the description; the remote side never carries the evidence of review.

## 8. Migration - **Differ** on scope

- Migrate **open** records only. Prune retained done records first, because they already have a defined route out. Grandfather any done or cancelled record that remains.
- Phase 1: the lifecycle fix (triage as status, hold overlay, `cancelled` plus `resolution`, the two regressions). This is mechanical, can run through `ki repo conform`, and addresses the current pain.
- Phase 2: the Arcadia project registry and `project`. This delivers the view by intent.
- Phase 3: `kind` and `purpose`, proposed by agents and approved by Kris.
- Phase 4: `component` with removal of `theme`, `area` and `series`.
- Run dual-read in the checker and tools-ki (`roadmap-evidence.ts:35`, `tools-ki/src/core/work/items.ts:36`) for one release.

What to cut: `artifact`; frontmatter `area`; `theme`; `intake_disposition*`; the `resume` field (made unnecessary by the overlay); the separate `initiative` field.

## 9. What the reflection missed - **Add**

- **Adapter neutrality.** Define the fields in `ki-work`'s abstract vocabulary, with roadmap, KB Streams and Linear mappings as adapters. Otherwise the first repository on `adapter = "linear"` forks the model.
- **KB Streams parity.** Arcadia records carry `note_type: stream-roadmap` and their own theme vocabulary. Migrate them under the same change.
- **Territory boundaries for projects** (section 4).
- **The tension between the Now cap and holds.** Excluding held records from Now is what keeps "no cap, it's intent" honest.
- **Priority.** Kris dropped a Now cap but has no ordering inside Now (38 records). Linear's priority field exists for this. Decide explicitly whether rank inside a horizon matters, or say it does not.
