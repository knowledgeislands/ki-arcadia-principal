- **Agree:** Separate repository ownership from territory-wide intent; keep records canonical.
- **Differ:** Keep kind and purpose, but make artifact optional and use a smaller vocabulary.
- **Agree:** Triage is an intake status; one hold horizon works if its reason remains explicit.
- **Differ:** Active execution belongs in Now, not Next; projects must represent finite outcomes.
- **Add:** Preserve authority, provenance and terminal outcomes before migrating or projecting anything.

## Independent model

My starting point is six distinct questions: who owns the work, what outcome connects it to other work, what activity it represents, why it matters, what it produces, and when it receives attention. Progress and availability must remain distinguishable. Classifications should support decisions and useful views, rather than maximise populated fields.

Repository owns the record. Project connects records contributing to a finite outcome; initiative groups projects around strategic intent. Component locates the affected repository surface. Kind, purpose and artifact describe activity, motivation and primary output. Status describes progress, and horizon describes attention, with Hold as an explicit suspension exception. None of these fields grants implementation or acceptance authority.

That model leads to the following agreements and disagreements with the reflection.

## 1. Kind, artifact and purpose - Differ

They are conceptually distinct, but the reflection's lists overlap and demand too much classification. CLI, MCP and library are delivery forms of code; infrastructure and configuration frequently describe the same change. An investigation does produce something: evidence, a recommendation or a recorded conclusion. Calling that `none` hides its deliverable.

Use these concrete initial vocabularies:

- **kind:** `change`, `decision`, `investigation`, `audit`. Classify the controlling outcome, not every step. Verification and review ordinarily belong within another item's execution; use `audit` when an independent assessment is itself the outcome.
- **artifact:** `code`, `standard`, `skill`, `configuration`, `infrastructure`, `knowledge`, `documentation`, `data`, `none`. Optional, single primary output; `none` means an operational action without a retained deliverable. Knowledge covers decision and research outputs; documentation covers instructions and explanatory material.
- **purpose:** `capability`, `corrective`, `debt`, `governance`, `learning`, `adoption`, `upkeep`. Select the principal reason. Corrective restores expected behaviour; debt removes accumulated structural cost; upkeep preserves an existing capability. Adoption applies an established capability to a new owner or environment.

Do not import customer-specific Solution or the broad Enabler category unchanged. Those distinctions fit HNR's delivery business better than this estate.

Reality matters: GOV-087 is an investigation producing knowledge, whereas REV-011 changes the harness standard to establish a recurring obligation. Its title and REV identifier do not make it an audit run. Mandatory purpose can wait until reviewers demonstrate consistent classification; artifact should stay optional.

## 2. Triage and Hold - Agree

Triage represents admission, not timing. Use `status: triage` with no horizon, followed by adopted `draft` and the existing delivery states. Exit requires owner-approved adoption. Triage may already have a proposed project or component; classification is not adoption.

One `hold` horizon is a sound practical replacement for Waiting-for and Parked, although suspension is not literally a temporal horizon. Preserve a structured reason, `waiting-for` or `parked`, and a named release condition. A review date is useful where the trigger cannot be observed automatically. Resume destination is optional and must be re-evaluated, not executed automatically.

Hold must not become a dumping ground for poorly scoped Future work. DOTFILES-UE-062 is a genuine wait for a deliberately watched operation; the roadmap's adoption does not authorise running that operation.

## 3. Status x horizon and closure - Differ

The reflection permits `in-progress` in Next, recreating the ambiguity identified by the [matrix analysis](</Users/krisbrown/.local/state/claude-bg/gov-020/matrix.report.md>). Define Now as current attention and Next as the prepared queue. Starting work moves it to Now in the same authorised operation.

| Status | Horizon | Gate or meaning |
| --- | --- | --- |
| triage | absent | Captured, unadopted |
| draft | now, next, soon, future, hold | Adopted; being shaped or deferred |
| ready | now, next, hold | Reviewed plan retained; availability checked separately |
| in-progress | now, hold | Execution underway or paused |
| awaiting-review | now, hold | Delivery packet exists; review active or explicitly deferred |
| done, cancelled | absent | Terminal evidence retained |

I would allow held review as well: waiting for a named reviewer need not occupy active attention. Preserve baseline, completed steps and review evidence on hold. Revalidate scope and dependencies before resuming. Neither last-update age nor unchecked steps proves a record is paused.

Name regressions explicitly: failed review returns to `in-progress`; material replanning returns Ready work to `draft`; replanning active work preserves its original baseline and delivered evidence while replacing the remaining plan under renewed approval.

Cancel adopted work directly, with owner approval and a terminal resolution: `cancelled`, `duplicate`, `merged` or `superseded`; rejected intake also uses `cancelled` with resolution `rejected`. Do not move it back through Triage or claim delivery. Retain rationale, target where applicable, outstanding changes and their disposition. Extend retention and pruning rules to these terminal records.

Cross-repository duplicate targets must resolve through qualified canonical identity and retained evidence, including revision/path references after pruning. A capital cannot close another repository's record. OPS-001 has approved fold evidence but remains blocked by the existing same-roadmap target rule. Its surviving pointer is provenance, not a second delivery owner.

I also disagree with simply dismissing limits. Use a visible, agreed attention budget or warning across the working set, not an arbitrary universal hard cap.

## 4. Initiative and project - Agree

Store a stable `project` identifier and derive its initiative from the registry. For projectless work, permit a direct `initiative`; prohibit conflicting direct and derived assignments. Both may be absent. Upkeep can support an initiative, but routine workstation maintenance need not acquire a strategic parent.

Keep owner-governed definitions in Arcadia's Admin governance area through Enactment. Portable schema belongs in the harness; runtime registry discovery supplies local paths without embedding them in records. Project definitions need identity, outcome, owner, parent initiative and lifecycle; targets and health only when useful. Names may change without changing identifiers. Territory membership supplies discovery, not authority over participating repositories.

Projects must finish. Standards-upkeep and workstation-hygiene are enduring responsibilities, not automatically projects. Keep their finite records projectless and query by purpose/component. Recurring obligations remain Activity or housekeeping definitions, with linked finite runs. Avoid creating endless projects merely to satisfy Linear's initiative hierarchy; disclose projection coverage instead.

## 5. Component, theme and area - Differ

Agree that component replaces misleading theme classification, but it must vary independently of the issuing code. Today's [roadmap standard](</Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/skills/change-management/ki-work-roadmap/references/standards-repository-roadmaps.md>) binds each fixed issuing area to one theme. Renaming that field without removing the binding accomplishes little.

Declare stable component identifiers per repository, preferably a small list of owned surfaces: harness `work-management`, `coordination`, `acquisition`, `runtime-bindings`; chezmoi `rig-catalogue`, `launchd`, `credentials`, `agent-environment`. Allow absence for work spanning the repository. CLI is useful when it distinguishes a surface, less useful when every record belongs to a CLI repository.

Keep existing `area` and IDs unchanged during this migration; display it as Issuing series and never map it to a product Area. Renaming the stored field can be separate compatibility work. Governance-consistency is not a purpose by itself: its records include investigation, correction, adoption and new capability. Classify each controlling outcome.

## 6. Ideas and Enactment - Differ

Ideas belong in repository working notes, inbox captures or an existing project checkpoint; project documents cannot be the only home because an idea may precede any project. The Command Centre's Working Notes also support already-existing Items. They are supporting reasoning, not exclusively a pre-intake stage.

Create a record when there is a distinct unresolved outcome, concern, question or dependency, grounded context, a boundary and an identifiable owning repository. Check for an existing owner first. Unknown implementation is acceptable for investigations and decisions. Missing authority to execute is acceptable for Triage. A dependency that does not yet exist is not, alone, evidence of premature capture.

Working notes must not maintain a competing priority/status queue. On graduation, link the controlling record and remove duplicate operational state, retaining useful research.

Record capture and formal Enactment are different thresholds. Exploratory work can become a record without authorising canonical changes. Changes to adopted policy, structural contracts, authority or material canonical knowledge require governed enactment; tightly bounded editorial corrections need proportionate handling. GOV-024 owns the local threshold review: this design must not silently expand today's exemptions. Several related edits can share one coherent approved record.

## 7. Tool mapping - Differ

These are model-level mappings from the supplied evidence, not live verification of vendor features.

| Model | Linear | GitHub Projects | Jira |
| --- | --- | --- | --- |
| Record | Issue | Issue or draft item | Issue/work item |
| Repository | Team, if justified | Repository | Project or repository association |
| Project | Cross-team project | Project or custom field | Epic or configured hierarchy |
| Initiative | Initiative | Custom field/grouping | Configured higher hierarchy |
| Component | Label group | Label/custom field | Component, within Jira project |
| Kind/purpose/artifact | Types or labels | Types, labels or fields | Types, labels or fields |

Repository equals Team is an option, not an exact equivalence. Twenty-one repositories need not imply twenty-one organisational teams. Jira's project often behaves more like an administrative boundary than a finite KI project.

Horizon is not a Cycle: Now/Next are relative attention buckets; cycles and iterations have dates. Project it as a field or labels, with dated cycles separately assigned. Hold preserves lifecycle plus a suspension marker. Draft-to-Ready approval, human acceptance, baseline evidence and prune guards require explicit adapter semantics; a remote Done state proves none of them.

Keep one-way projection initially and retain qualified `task_links`. FND-014 currently proposes authorised remote lifecycle adapters, which is broader than display projection. Settle that authority boundary explicitly rather than treating the two as interchangeable.

## 8. Migration - Differ

Agree with standards before estate-wide edits, but prepare the registry and representative mappings before enforcing registry references.

1. Freeze a dated inventory of every repository and retained record, preserving identities, links, timestamps, baselines and authority evidence. Reconcile counts first: the brief says 78; the reports say 79, and live GOV-025 has already moved from Triage to Now.
2. Approve the semantic contract, transition gates, terminal evidence and project/component vocabularies against representative records.
3. Update standards, lifecycle skills, parsers, checker and CLI together. Temporarily accept old and new schemas, with an explicit version boundary and diagnostics.
4. Pilot harness, Arcadia and chezmoi. Produce reviewable classification diffs; approve semantic decisions in batches under each owner's authority.
5. Migrate remaining open records, then retained terminal records with only defensible historical classifications. Never reconstruct missing approval or manufacture lifecycle history. Include empty-roadmap repositories in the coverage report.
6. Enforce the new schema once coverage is complete; then implement one projection adapter before additional tools.

Use repeatable, idempotent migration with drift detection and before/after semantic comparison. Keep title, body and identity changes out unless necessary. Cut mandatory artifact classification, speculative projects, an area rename, automatic reprioritisation, inferred completion and simultaneous three-tool integration. Classifier suggestions are evidence for review, not mutation authority.

## 9. Missing concerns - Add

The most consequential omission is dependency truth. The [work-item format](</Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/skills/change-management/ki-work-roadmap/references/standards-work-item-format.md>) describes build availability; the roadmap checker gates declared blockers on Done. Decide which governs when prerequisite work has landed but awaits acceptance. Prefer one authored dependency direction with a derived inverse eventually; do not enlarge this migration casually.

The [Command Centre guide](</Users/krisbrown/workspaces/kit/legal/kit-legal/Pillars/Command Centre/Command Centre Guide.md>) also demonstrates structured ownership, next action and explicit dates. Add owner and review/target dates when they affect action, without turning updated timestamps into deadlines. Hold release, project completion and cancellation need accountable decisions. Project health must not be inferred from issue counts.

Finally, registry unavailability must produce an unresolved-reference diagnostic, not silently ungroup work. Checkpoints may hold project interpretation and updates, but their copied record lists cannot become another status source. Territory dashboards must count each canonical record once and expose missing coverage.
