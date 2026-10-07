# Territory selection and Agora retirement: merged report

**Brief:** [[territory-selection-brief]] - **Reviews:** [[territory-selection-review-astra]], [[territory-selection-review-sol]] - **Date:** 2026-10-07

## Summary

Replace the duplicated Agora membership rosters with territory-derived selection, using Kris's proposed `-t, --territory`, `--estate` and `-f, --filter` spellings in ki and mgit. Keep one territorial membership authority and preserve mgit's standalone Bash/Git operation. Migrate consumers before removing declarations or retiring the Agora capability.

The implementation evidence supports matching explicit KI selections, rather than making every command and default population identical. Both independent reviews identified that boundary. The remaining choices are numbered below for Kris; this report is a proposed design and grants no rollout authority.

---

## Corrections to the brief

- **Parity has a defined scope.** The current tools have different command eligibility, default discovery and handling of non-KI repositories. The common contract should cover explicit territory and estate selections and the filter operation itself. ki's repository commands still require KI eligibility; mgit still has Git-specific worktree and standalone behaviour. See [ki selection][selection], [mgit][mgit] and both reviews, point 5.
- **Retirement includes enforcement predicates.** The harness uses the KIS Agora to decide configuration-layout and roadmap-area check severity. Removing the roster before replacing these predicates would change enforcement. Preserve the current governed population and fail/warn outcomes through territorial evidence. See [configuration governance][configuration] and [roadmap context][roadmap-context]; Astra point 6 and Sol's additional fact.
- **A successful roots response does not currently prove completeness.** Agora profiles can contain unresolved reference diagnostics, while the roots command emits available paths without reporting those diagnostics. mgit buffers and validates returned roots, but cannot detect an omission hidden by a successful producer. The replacement interface must define completeness and failure before execution. See [profile resolution][profiles], [roots][roots] and Astra's fact check.
- **Saved membership is a snapshot.** mgit records location specifications and generated entries; later ordinary commands can use those entries without ki. An explicit selector resolves current membership, while a saved manifest keeps the last generated selection until registration refreshes it. Preserve and document this distinction. See [mgit][mgit] and both reviews, point 6.
- **Naming choices must be separated.** A local Capital registry key already names a territory in qualified work references. Canonical repository identity, repository registry key, checkout name and historic Agora identifier have different purposes. The current installation largely conceals these differences; the pilot must deliberately make them differ. See [Project registry][projects], [work registry resolution][work-registry] and both reviews, points 3 and 4.

Source snapshots are those cited in the brief and independently verified by both reviewers: harness `11416cde3bd0bf4933ff61d76b6421666effc78c`, tools-ki `13e046a723f6387ba829fe2b7a79825a2f455ac6`, and tools-mgit `50d658973f7918a811d0e51199f1933c56c65db7`. Concurrent trade-policy work has its own owner; the selector must use the canonical parsed territorial identities rather than depend on a proposed TOML shorthand.

---

## Model

### Ownership and identity

The Capital's `[skills.ki-repo.territory]` roster owns governed membership, including the Capital explicitly. [[Known Lands]] explains that inventory and external signposting. Local registry resolution maps canonical identities to checkouts. A Paperclip company admits its operational scope through approved bindings and repository organisation declarations; it does not acquire territorial jurisdiction through selection.

The proposed territory handle is the Capital's local registry key, matching qualified Project references. A discovery view should show that key beside the readable territory name and canonical Capital identity. Local key renames need an explicit saved-location and work-reference migration; historic context and acquisition identifiers should not be silently replaced with local keys.

Agora retirement does not require a new named working-set hierarchy. Existing explicit repository selections and mgit workspace composition remain available. A future named cross-cutting selection should be proposed only for a demonstrated need.

### Selection

Use one primary explicit scope: a territory or the whole registered estate. Reject conflicting primary selectors; the pilot must define their interaction with each tool's existing explicit repository options. Filters narrow a scope and never silently widen it. Repeated prefixes are proposed as alternatives, followed by deduplication.

The prefix domain is an owner decision, not an established fact. Decision 3 recommends the selected repository directory name because it is available to both tools without a new mandatory dependency. Filtering occurs before Git worktree expansion, so a branch or worktree name never substitutes for a repository name. If Kris prefers registry keys, ki must apply those filters before emitting roots; standalone mgit then needs an explicit naming rule of its own.

Without a territory or estate selector, preserve the current tool's base selection. A filter alone narrows that set. This preserves ki's current-repository or current-manifest default and mgit's local discovery or current-workspace default. Identical filter syntax does not require those defaults to discover the same eligible population.

### Resolution and execution

The proposed sequence is: validate scope metadata, identify its candidate members, apply the chosen prefix rule, validate the selected checkouts, then expose the complete ordered result. A malformed roster, ambiguous identity or member whose missing registration prevents identifying its filter name is an error; it is not evidence that the member failed to match. A known registered root excluded by a filter need not exist physically for the remaining selected roots to run.

Operational selection fails on an unavailable selected root or zero matches. The producer resolves the complete result before writing machine-readable output; diagnostics use stderr. mgit buffers the NUL-delimited roots response and validates it before any Git command. Both tools agree on selected canonical identities, ordering, duplicates, prefix meaning and failure categories for explicit KI scopes. Exact error prose and downstream operation restrictions remain tool-owned.

No new shared registry package or mandatory runtime is proposed. ki owns canonical identity and territorial resolution; mgit consumes an explicit machine interface for KI selectors and retains its existing Bash/Git local operation. The tools-ki record will name and verify the roots endpoint rather than infer it by replacing a word in `ki agora roots`.

### Saved state and coordination

Saved workspace locations need a territory form and a previewable migration from `agora:<id>`. Registration refreshes generated entries; ordinary snapshot execution remains possible without ki. A failed refresh preserves the previous manifest. Test membership addition and removal so current explicit selection and saved snapshot execution have observable, documented differences.

Paperclip scope and the repository owning consolidated reports must be explicit. A company's organisation binding is preserved unless its owner approves a change. Adopted coordination standards can migrate locally through normal delivery; changing live managed instructions or company state needs its own authority and must respect existing holds.

Historic context and acquisition paths remain source provenance. New producers, opening adapters and capture routes need an explicit identity mapping and verified destinations. A provenance mapping is not an executable Agora membership declaration or a grant of access.

---

## Agreement and difference

| Point | Astra | Sol | Settlement |
| --- | --- | --- | --- |
| 1 | Agree | Agree | Derive rosters from territory; remove duplicates after consumer verification. |
| 2 | Add | Add | Separate metadata validity from selected-root availability; owner decides partial-result policy. |
| 3 | Agree | Add | Existing Project references support Capital-key territory lookup; prefixes need their own domain. |
| 4 | Add | Add | Preserve default scope; decide literal prefix semantics and the glob transition explicitly. |
| 5 | Differ | Differ | Source behaviour limits parity to the shared KI boundary; standalone mgit remains supported. |
| 6 | Add | Add | Add audit scope and snapshot freshness to the consumer migration. |
| 7 | Agree | Agree | One finite Project, repository-owned records, separate trade-policy outcome. |
| 8 | Add | Add | Pilot both tools, membership changes and one saved/opening consumer before fleet retirement. |

These settlements follow the cited contracts and implementation behaviour, not the number of reviewers supporting a position. Astra leaves availability-validation ordering as an owner choice; Sol recommends filtering before physical validation. The proposed model adopts that order while failing unresolved naming metadata explicitly. Naming, compatibility and authority remain owner decisions.

---

## Rollout plan

### Capture after the decisions

Create the proposed `territory-selection` Project in Arcadia, within [[knowledge-islands-model|Knowledge Islands model]], with Kris as lead and no invented target date. Link its accepted Decision Record. The Project describes the finite shared outcome; each repository's ordinary record owns priority, readiness, execution and acceptance. Do not copy record status into a second tracker.

Capture the following bounded outcomes through `ki-next` only after Kris's decisions:

1. **Harness - establish the shared contract and migrate audit predicates.** Own the portable selector and retirement semantics, configuration checks, command applicability requirements and Paperclip coordination boundary. Preserve existing enforcement severity while replacing Agora-based predicates. Establish this contract before its dependent CLI deliveries; retire the old skill only after all consumers are verified.
2. **tools-ki - deliver the resolver and machine roots pilot.** Reuse canonical territorial parsing, add the agreed selectors to supported repository operations, expose a complete machine-readable roots result, update diagnostics and completion, and prove failure boundaries in disposable fixtures. Include an applicability matrix for commands that reject selection or require exactly one repository.
3. **tools-mgit - consume and prove the same selection contract.** Add the agreed flags and prefix behaviour, deliver the chosen glob transition, migrate saved locations with preview and failed-refresh preservation, and prove standalone operation without ki. This record depends on the tools-ki interface being verified.
4. **Consumer owners - migrate opening, context and coordination consumers.** Inventory each active consumer with its owner, old identity use, replacement, evidence and rollback. Cover target opening/observation, context and acquisition producers, approved Paperclip bindings and shared-report ownership. Use repository-owned handoffs; do not provision companies or execute live changes under design authority.
5. **Arcadia and each adopting territory - reconcile and retire declarations.** Update local governance and membership references, remove duplicate rosters only after their consumer evidence passes, and preserve historic identifiers. Arcadia's approval does not itself authorise another territory's edits.

The trade-policy Project remains separate. Record a blocking relationship only if its parser work becomes a genuine prerequisite; otherwise use the existing canonical parser and let the two Projects proceed independently.

### Pilot and waves

The first delivery is the tools-ki resolver pilot after the shared contract is accepted. Follow it serially with the mgit caller and saved-location pilot. Use a disposable two-member territory plus an unregistered standalone Git repository. Cover a renamed Capital key, a repository key different from its directory name, spaces in roots, literal and repeated prefixes, case, empty prefixes, metacharacters, selected and excluded unavailable roots, missing registration, duplicate identity, invalid Capital declarations and no matches.

Then add and remove a member: explicit selection changes immediately, saved snapshot execution retains its prior entries without ki, successful registration refreshes them, and a failed refresh preserves the old manifest. Prove one opening or saved-location consumer and verify that audit severity remains unchanged. Reconcile Arcadia's real selection read-only before any declaration is removed.

Write the pilot's lessons into each later wave's brief. Only independent Ready records with an explicit grant can enter a `ki-batch` wave. Consumer deliveries precede declaration and skill retirement; other territories enter through their own approvals. Project completion is Kris's decision after the finite outcome is evidenced.

---

## Decisions

1. **Project scope.** Options: a dedicated Territory selection and Agora retirement Project; broaden Territories and trades; or retain separate Agora governance. **Recommendation:** a dedicated `territory-selection` Project in Knowledge Islands model, deriving the current selections from territory membership and retiring duplicate Agora governance after migration. Retain existing explicit and workspace composition without introducing a replacement named-group system.
2. **Territory handle.** Options: the Capital's local registry key; a newly declared short territorial code; or the readable territory name. **Recommendation:** reuse the Capital registry key, as qualified Project references already do. Show the readable name and canonical identity in discovery; do not infer a mapping by changing case or reuse `kis` as an undocumented alias.
3. **Prefix domain.** Options: selected repository directory names throughout; registry keys for KI selection with directory names for standalone mgit; or a new portable selection-name declaration. **Recommendation:** directory-name prefixes throughout, before worktree expansion, to keep the same rule available without ki. Names are case-sensitive, prefixes are literal and non-empty, and repetition means OR. Keep registry keys and canonical identities available for display and validation, not interchangeable with names. The pilot must cover key/name differences and nested repository layouts.
4. **Scope defaults and combinations.** Options: a filter alone narrows the tool's current default set; it selects the current territory; or it selects the whole estate. **Recommendation:** preserve each current default and narrow it. Territory and estate selectors are mutually exclusive; filters compose with the selected scope, and existing explicit-path selection retains its tool-owned applicability. No implicit escalation to the estate.
5. **Incomplete and empty selections.** Options: fail operational selection; skip unavailable members with warnings; or add an explicit partial-execution mode. **Recommendation:** fail unavailable selected members and no matches, validate scope and naming metadata before filtering, and validate physical availability afterwards. An excluded known root does not block execution. Do not add partial execution in this Project; inspection may explain missing members without presenting a partial result as a completed operation.
6. **Compatibility and saved state.** Options: an explicit cut-over; a bounded legacy-mode window; or permanent selector aliases and mixed prefix/glob interpretation. **Recommendation:** one documented cut-over after caller parity is proven, no permanent Agora aliases and no syntax guessing. Preserve mgit's existing path-glob capability as a separately named `--path-filter` option, with fixtures defining any combination with prefix filters. Preview and map saved Agora locations to territories, preserve offline snapshots and failed-refresh behaviour, and retain historical context/acquisition identifiers as provenance. If Kris prefers removing path-glob support, record that as an explicit incompatible change.
7. **Pilot and order.** Options: tools-ki fixtures alone; a serial two-tool and saved-consumer pilot followed by Arcadia read-only reconciliation; or fleet migration immediately. **Recommendation:** the serial two-tool pilot above, with the shared contract first and consumer/audit evidence before retirement. No parallel wave before its lessons have been incorporated.
8. **Authority after the decisions.** Options: approve design and capture only; authorise planning and local pilot delivery; or authorise the complete named rollout subject to pilot gates. **Recommendation:** approve the design, create the Project and capture its records, then authorise planning and local pilot delivery in the harness, tools-ki and tools-mgit to `awaiting-review`. Later waves, other territories and live company changes require their named authority. Proposed push scope: none; prune scope: none; release scope: none. Kris must state the actual grant in his own words; this recommendation is not a grant.

---

## Changes after review

- Both reviews' point 5 narrowed the parity claim to explicit KI selection while retaining tool eligibility and standalone execution.
- Astra's point 6 and Sol's additional fact made audit-severity preservation a retirement gate.
- Astra's roots fact check added complete-result guarantees to the machine interface.
- Both reviews' points 4 and 6 added an explicit old-glob transition and saved-manifest freshness contract.
- Sol's points 1 and 2 supplied the proposed metadata/filter/physical-validation order; Astra's point 2 kept the unresolved choice visible.
- Both reviews' point 8 expanded the pilot from resolver tests to a real two-tool caller, membership change and saved/opening consumer.
- The orchestrator recommends directory-name prefix matching as one rule available without ki. This is a proposed settlement of the reviews' naming question for Kris, not an independently established preference.

[selection]: ../../../../../tools-ki/src/core/repository/selection.ts
[mgit]: ../../../../../tools-mgit/bin/mgit
[configuration]: ../../../../../ki-agentic-harness/skills/keystone/ki-repo/references/standards-configuration.md
[roadmap-context]: ../../../../../ki-agentic-harness/skills/change-management/ki-work-roadmap/scripts/rubric/contexts/project-registry.ts
[profiles]: ../../../../../tools-ki/src/core/agora/profiles.ts
[roots]: ../../../../../tools-ki/src/commands/agora/roots.ts
[projects]: ../../../../../ki-agentic-harness/skills/change-management/ki-work/references/standards-project-registry.md
[work-registry]: ../../../../../tools-ki/src/core/work/registry.ts
