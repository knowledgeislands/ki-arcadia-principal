# Territory selection and Agora retirement: review by GPT-6 Astra

**Reviewer:** GPT-6 Astra · **Date:** 2026-10-07 · **Read-only:** yes

## Own view

Territorial membership is the right source for governed selection. The inspected duplication supports retiring the seven local Agora rosters, provided their other functions receive explicit replacements. I formed this view independently without reading another review.

The difficult boundary is identity: territorial membership uses canonical repository identities, proposed filters use local registry keys, mgit also operates on unregistered Git repositories, and historical contexts use stable Agora identifiers. These cannot become one namespace merely by replacing a flag.

I recommend retaining the proposed spellings, preserving each tool's existing default scope, and agreeing parity for explicit KI selections. The report should separately decide standalone filtering, migration of existing glob filters, incomplete-result handling and historical identifiers. These remain recommendations for Kris.

---

## Fact check

- **Territorial ownership and roster duplication are confirmed.** I independently parsed the local registry and all registered declarations. The inspection reproduced the brief's 41 readable checkouts, seven memberships, individual counts and empty inclusion arrays. [[Governance/Charter|Charter]] and [[Known Lands]] support the authority distinction. One implementation detail matters: territorial membership explicitly includes the Capital; Agora membership adds its owner implicitly. A migration must preserve this difference without duplicating or omitting the Capital.

- **Territory handles already have an adopted consumer.** The [Project registry standard][projects] specifies the Capital's local registry key for qualified Project and Initiative references. The brief correctly distinguishes this from Agora identifiers and readable names. Choosing another selector handle would require an explicit relationship to that existing contract. Machine-local keys should not automatically become durable acquisition identifiers.

- **The `ki` selector account is accurate but needs a command boundary.** These options belong to `ki repo`; the [command registration][ki-command] currently has neither the proposed short flags nor a filter. [Selection][ki-selection] rejects mixed scope selectors and empty selections. Its default manifest handling skips non-KI repositories with reporting, whereas explicit repository paths require KI declarations.

- **mgit's filter description is accurate and represents an incompatible change.** [The implementation][mgit] matches shell globs against the whole display path or a trailing path component; repeated filters are alternatives. Filtering happens after discovery and before worktree expansion. A filtered-empty ordinary listing or generic Git command currently succeeds without executing anything. Prefix filtering and failure on no matches therefore both change observable behaviour.

- **Current tools do not consume identical Agora populations.** [The resolver][resolution] supplies `ki repo` with registered members and registered inclusions. [Profile resolution][profiles] can additionally supply associated unregistered Git repositories to `ki agora roots`, which mgit calls. Missing reference associations become diagnostics, but [the roots command][roots] neither emits those diagnostics nor fails because they exist. mgit's buffering prevents execution after a non-zero resolver exit; it cannot detect omissions hidden behind a successful response.

- **The standalone and Paperclip boundaries are confirmed.** [mgit's instructions][mgit-instructions] preserve Bash/Git operation without mandatory KI integration. The [Paperclip standard][paperclip] independently declares organisation ownership but still uses Agora membership for admission and the verified home for default shared-report ownership. No live company state was inspected; no migration should infer company bindings or admission from territory membership alone.

- **Project separation is justified.** [[trades-revamp]] has a distinct declared outcome and [[knowledge-islands-model]] is a plausible Initiative. However, that Project's proposed simplification also touches territorial member syntax. The two Projects can remain independently deliverable while sharing the existing territory parser boundary; neither should introduce a competing interpretation.

Cross-repository evidence was inspected at the brief's revisions: harness `11416cde3bd0bf4933ff61d76b6421666effc78c`, tools-ki `13e046a723f6387ba829fe2b7a79825a2f455ac6`, and tools-mgit `50d658973f7918a811d0e51199f1933c56c65db7`.

---

## Points

| Point | Mark | Reason and evidence |
| --- | --- | --- |
| 1 | Agree | Local duplication is verified; retire rosters after replacing their consumers. |
| 2 | Add | Define completeness and validation order, including unavailable members excluded by filters. |
| 3 | Agree | Keep the proposed flags; the existing Project contract favours Capital registry keys. |
| 4 | Add | Decide the glob transition and standalone identity domain explicitly. See †. |
| 5 | Differ | Universal selection/error parity conflicts with existing populations and defaults. See ‡. |
| 6 | Add | Retirement also changes governance-check severity, beyond named opening consumers. See §. |
| 7 | Agree | Keep one finite Project, repository-owned records and the trade Project's separate outcome. |
| 8 | Add | Pilot semantic compatibility and consumer migration before removing declarations. See ¶. |
| - | Add | Separate durable identity from local handles, and define snapshot freshness. See ‖. |

† **Prefix and glob semantics need a deliberate transition.** Preserve the owner's prefix intent for `-f`, but ask Kris whether existing glob use receives a separately named option, a temporary compatibility mode, or an announced removal. Do not infer intent from wildcard characters and switch semantics automatically. A registry-key-only domain cannot cover standalone repositories that have no registry entry. Kris should choose between one portable repository-name domain and explicitly different KI/local domains. If domains differ, document them and test local repositories without `ki` installed. Recommend case-sensitive literal matching, alternative repeated prefixes, rejection of empty prefixes, and unchanged default scope.

‡ **Limit the parity promise to an agreed selection boundary.** [Selection][ki-selection], [resolution][resolution] and [profiles][profiles] establish different existing populations; [mgit][mgit] establishes different defaults and filtered-empty success. Require matching canonical identities, ordering, filtering and completeness outcomes for explicit territory/estate selectors. Keep downstream KI eligibility checks and Git worktree expansion explicit. Agree stable error categories rather than identical wording. Recommend complete resolution before command execution, with partial results available only through an explicit inspection mode. Decide whether filtering excludes an unavailable member before availability validation; either order is defensible, but affects everyday use.

§ **Deleting Agora can silently weaken enforcement.** [Configuration governance][configuration] makes `FILES-10` severity depend on the Capital's `kis` Agora declaration. [Roadmap context][roadmap-context] similarly gates area-definition enforcement through Agora membership. Replace these predicates and associated tests before removing declarations. Preserve the currently governed population unless Kris expressly expands enforcement. The migration inventory should include generated rubrics, configuration-layout rules and bootstrap instructions alongside CLI, client and context consumers.

¶ **Use a pilot that exercises the actual boundaries.** Recommend sequential tools-ki and tools-mgit pilot records using a disposable two-member territory, plus a standalone Git companion. Cover Capital inclusion, renamed local keys, duplicate identities, invalid Capital declarations, unavailable filtered-in and filtered-out members, no matches, literal metacharacters, saved-manifest regeneration and operation without `ki`. Then reconcile Arcadia's real selection read-only. Before fleet rollout, migrate one representative context/opening consumer and prove governance severity remains stable. Record those lessons in subsequent wave briefs. Other territories retain approval of their own changes.

‖ **Treat names and generated files as migration data.** The [Agora standard][agora] gives context/acquisition identifiers independent stability. Preserve old captures and provenance through an explicit mapping; do not rename historical directories merely because a Capital's local key differs. [mgit][mgit] stores Agora locations together with generated repository entries, allowing later commands to use saved membership without live resolution. Specify when those snapshots refresh, how stale membership is detected, and how migration is previewed and reversed. Registry presence, cached inclusion and territorial membership must remain distinguishable.

The merged report should turn these unresolved choices into bounded decisions for Kris, with explicit completion and authority limits. This review grants no implementation, company mutation, acceptance, push, prune or release authority.

[projects]: ../../../../../ki-agentic-harness/skills/change-management/ki-work/references/standards-project-registry.md
[ki-command]: ../../../../../tools-ki/src/commands/repo/index.ts
[ki-selection]: ../../../../../tools-ki/src/core/repository/selection.ts
[resolution]: ../../../../../tools-ki/src/core/agora/resolution.ts
[profiles]: ../../../../../tools-ki/src/core/agora/profiles.ts
[roots]: ../../../../../tools-ki/src/commands/agora/roots.ts
[mgit]: ../../../../../tools-mgit/bin/mgit
[mgit-instructions]: ../../../../../tools-mgit/AGENTS.md
[paperclip]: ../../../../../ki-agentic-harness/skills/agentic-systems/ki-agent-coordination-paperclip/references/standards-agent-coordination-paperclip.md
[configuration]: ../../../../../ki-agentic-harness/skills/keystone/ki-repo/references/standards-configuration.md
[roadmap-context]: ../../../../../ki-agentic-harness/skills/change-management/ki-work-roadmap/scripts/rubric/contexts/project-registry.ts
[agora]: ../../../../../ki-agentic-harness/skills/governance/ki-agora/references/standards-agora.md
