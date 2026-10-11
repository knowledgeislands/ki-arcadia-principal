# Territory selection and Agora retirement: review by GPT-6.1 Sol

**Reviewer:** GPT-6.1 Sol - **Date:** 2026-10-07 - **Read-only:** yes

## Own view

Territorial membership can replace the seven duplicated local Agora rosters. The difficult part is preserving useful selection behaviour while separating governed membership, machine availability and saved workspace contents. Matching flag names will not establish matching behaviour by themselves.

I recommend a shared contract for explicit KI selection, retained standalone mgit behaviour, and a deliberate migration of its existing path filter. The pilot should prove both tools against the same evidence and demonstrate what happens when membership changes after a workspace manifest is generated. Retirement should follow consumer verification, including governance checks that currently derive their scope from Agora declarations.

This view was formed without reading another review.

---

## Fact check

The implementation revisions match the brief: tools-ki `13e046a723f6387ba829fe2b7a79825a2f455ac6`, tools-mgit `50d658973f7918a811d0e51199f1933c56c65db7`, and the harness `11416cde3bd0bf4933ff61d76b6421666effc78c`.

- **Membership and authority - confirmed.** [[Governance/Charter|Charter]] and [[Known Lands]] distinguish territorial membership, local resolution and repository authority. Arcadia's [configuration](../../../../.ki.toml) holds both rosters. My parsed inspection of the local registry and registered declarations reproduced the brief's counts, all seven exact roster matches and empty inclusion arrays. Every declared territorial member also names the corresponding Capital. This proves the inspected installation, not universal redundancy.
- **Agora's broader shape - confirmed.** The [Agora standard](../../../../../ki-agentic-harness/skills/governance/ki-agora/references/standards-agora.md) supports overlapping membership, one-level inclusions and separately associated plain-Git references. It also assigns the identifier to context and acquisition paths. Consequently, replacing the current rosters does not automatically replace every supported working-set use.
- **Paperclip coupling - confirmed.** The [coordination standard](../../../../../ki-agentic-harness/skills/agentic-systems/ki-agent-coordination-paperclip/references/standards-agent-coordination-paperclip.md), organisation identity and recurring-activity sections, separately declares company ownership while requiring verified Agora membership and a home binding. Shared-report ownership defaults to that home. No live company state was inspected.
- **ki selection - confirmed, with an applicability qualification.** [Selection](../../../../../tools-ki/src/core/repository/selection.ts) rejects mixed primary selectors and empty results, honours a current workspace manifest, and otherwise discovers the current KI repository. Workspace resolution can omit plain-Git members. [Initialisation](../../../../../tools-ki/src/commands/repo/init.ts) rejects selectors; [store mutation](../../../../../tools-ki/src/commands/repo/store.ts) requires exactly one selected repository.
- **mgit filtering and standalone operation - confirmed.** [mgit](../../../../../tools-mgit/bin/mgit), `filter_match` and final-set filtering, matches display paths using alternative glob patterns after repository expansion. Its [instructions](../../../../../tools-mgit/AGENTS.md) retain Bash and Git dependencies. Its [tests](../../../../../tools-mgit/tests/mgit.bats), named selector and saved-location cases, explicitly verify exact KI roots, failure before execution, and continued manifest use when the resolver fails.
- **Project ownership - confirmed.** The [registry standard](../../../../../ki-agentic-harness/skills/change-management/ki-work/references/standards-project-registry.md) preserves repository authority. [[trades-revamp]] has the narrower outcome described. Its proposed shorthand for territorial member identities is still undecided, so the new selector must consume canonical parsed identities rather than assume one permanent authored representation.
- **Existing territory handles - additional evidence.** [Work registry resolution](../../../../../tools-ki/src/core/work/registry.ts), `territoryRoot` and `loadTerritoryRegistry`, already interprets a qualified territory as the registered Capital's key. This supports reusing that handle for local CLI lookup.
- **Retirement affects audit behaviour - missing from the brief.** The [configuration standard](../../../../../ki-agentic-harness/skills/keystone/ki-repo/references/standards-configuration.md), layout rules, uses the KIS Agora declaration to determine whether configuration-layout findings fail or warn. Removing the declaration without migrating this rule changes enforcement.

---

## Points

| Point | Mark | Reason and evidence |
| --- | --- | --- |
| 1 | Agree | Observed rosters duplicate territorial membership; preserve command defaults separately. |
| 2 | Add | Define filtering versus availability validation, and distinguish missing registration from missing checkout. |
| 3 | Add | Capital keys already resolve qualified work references; flag reuse needs a filter migration decision. |
| 4 | Add | Choose a prefix domain that works for standalone mgit, not only registered repositories. |
| 5 | Differ | Universal selection parity exceeds current applicability; scope parity to the shared KI boundary. |
| 6 | Add | Audit-scope rules and manifest freshness are retirement dependencies, not merely documentation updates. |
| 7 | Agree | One finite Project fits; repository records retain their own priority and acceptance. |
| 8 | Add | Prove a real two-tool consumer path and membership-change behaviour before expanding rollout. |
| - | Add | Include a command applicability matrix and evidence-based retirement exit criteria. |

**Points 1 and 2.** Deriving a requested territory from its Capital's roster is sensible; it does not imply that invocation without a selector should expand to that territory. For explicit selection, recommend resolving and validating the Capital, identifying the declared scope, applying filters, then validating selected checkout availability before execution. A missing selected member should fail the operational selection; an unavailable member excluded by the filter should not block it. Malformed membership remains a declaration error. Kris must decide whether an explicit partial-results mode is useful; silent omission should not be the default. The current [inventory resolver](../../../../../tools-ki/src/core/agora/repository-inventory.ts) and Agora resolution distinguish whole-estate validation from targeted member failures, providing a concrete starting point.

**Points 3 and 4.** Recommend the existing Capital registry key for local territory lookup, with discovery output showing its readable territory name and canonical Capital identity. A key rename must have a documented effect on saved locations and qualified work references.

The filter domain needs an explicit choice. Registry keys are available for KI selection but absent for unregistered standalone repositories; checkout basenames are available everywhere but can differ from those keys. They happen to match throughout this local inventory, which masks the distinction. Test a deliberately different key and checkout basename. Also decide repeated-prefix OR semantics, case sensitivity, empty-prefix rejection, literal metacharacters and zero-match failure.

Reassigning mgit's existing filter changes established glob behaviour. Recommend an explicit migration that retains path-glob capability under a separately named option, with a bounded compatibility policy chosen by Kris. Avoid guessing whether a supplied value means a prefix or a glob: that makes literal metacharacters and existing scripts ambiguous.

**Point 5.** I differ from unqualified equivalence of observable selection and errors. The evidence above shows different repository eligibility and command applicability, while mgit can run without KI. Define parity for explicit territory and estate selection over registered KI repositories, including prefix interpretation, ordering, duplicate handling, selected-member failures and empty results. Preserve documented standalone semantics elsewhere.

Let ki apply identity-based filtering before emitting roots. A root-only stream cannot give mgit registry keys reliably. Retain buffered NUL-delimited output and failure before Git execution; specify diagnostics on stderr and a stable non-zero failure contract. No shared package or additional mandatory runtime is needed.

**Point 6.** A saved manifest is a generated snapshot, whereas an explicit territory selector resolves current membership. These should remain visibly different behaviours. Recommend retaining offline snapshot execution, refreshing membership through registration, and documenting that freshness boundary. Deleting an Agora declaration must wait until its saved locations can refresh through the replacement resolver. Separately migrate audit-scope rules, company admission/home bindings, opening projections and identifier-based acquisition paths. Historic identifiers can remain provenance without remaining executable selectors.

**Points 7 and 8.** Keep the trade-policy Project separate, while recording a genuine dependency if its member-identity parser changes the resolver interface.

Recommend a small bounded pilot with two tools and disposable fixtures: renamed Capital key, differing checkout basename, literal prefixes, repeated filters, spaces in roots, unavailable selected and excluded members, missing registration, no matches, and resolver failure before execution. Then change membership, show explicit selection updating immediately, show the saved manifest retaining its snapshot without KI, and prove refresh and failed-refresh preservation. Include one migrated opening or saved-location consumer; resolver fixtures alone do not prove retirement.

Before fleet rollout, require a consumer inventory with owners, migrated behaviour and verification evidence. Kris retains the choices over prefix domain, filter compatibility, default scope, partial results, pilot territory and any delivery authority. This review grants none.
