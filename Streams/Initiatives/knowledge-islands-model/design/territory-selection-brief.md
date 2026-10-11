# Territory selection and Agora retirement: brief

**Owner:** Kris Brown - **Owning repository:** knowledgeislands/ki-arcadia-principal - **Date:** 2026-10-07

## Problem

Territories now own governed repository membership, while the locally declared Agoras repeat the same membership lists. Agoras also supply repository selection, client opening and context identities, and Paperclip governance uses them to establish company scope and the home of shared reports. Removing the duplicate rosters therefore requires a shared selection contract and a migration of their consumers, rather than deleting one configuration table.

Kris wants this work handled as a Project through the new design loop. Arcadia owns the cross-cutting design; the harness, `tools-ki`, `tools-mgit`, environment tooling and participating territories retain ownership of their implementations and declarations. This brief and the subsequent reviews are proposals, not changes to adopted governance or executable behaviour. No work record or Project registry entry has been created for this subject.

---

## Owner's proposal

Kris's proposal in this thread, verbatim:

<!-- rumdl-disable MD064 -->

> ok - so under the new approach, this is a project.  We need to roll out a bunch of changes for it.  things I like are:
>
> - `-f, --filter` for filtering by prefix
> - `-t, --territory` for replacing `--agora`
> - `--estate` for all
>
> we should support this in mgit and ki in the same way
>
> I'm not sure how the new projects and all that kind of stuff works, but it'd be good to do this that way.

<!-- rumdl-enable MD064 -->

Kris subsequently held this thread until the harness had captured the design loop as a skill, then explicitly invoked [`ki-design-loop`](https://github.com/knowledgeislands/ki-agentic-harness/blob/e1c6243e514d4bd5cd43585540b229e58cc4c4ca/skills/change-management/ki-design-loop/SKILL.md) to start the design. The earlier discussion explored retiring duplicate Agora rosters, deriving territory-wide selections and decoupling Paperclip admission from Agora membership. Those are candidate design choices for review; the selector spellings and prefix intent above are the owner's stated preferences. The earlier question about the default scope of a filter alone has not been answered.

---

## Established facts

- **Territorial authority and membership already exist.** Arcadia's [[Governance/Charter|Charter]] separates territorial governance, registry resolution, Agora working sets and Paperclip coordination. [[Known Lands]] explains membership, repository ownership and external signposting. The machine-readable roster is `[skills.ki-repo.territory]`; each repository names its Capital through `[skills.ki-repo].capital`. Arcadia evidence revision: `21472a52eb879166a7c652dc5e78238b1fe8d20f`.
- **The locally declared membership overlap is complete.** A read-only parsed inspection on 2026-10-07 found 41 registered checkouts, all readable, and seven Agoras. Including each implicit owner, their memberships are: `kis` 21, `hnr` 8, `personal` 4, `equalremedy` 3, `vallearmonia` 3, `legal` 1 and `techmedix` 1. Each exactly matches its Capital's territorial roster; every `includes` array is empty. This observation concerns the inspected local registry, not every possible KI installation or consumer. Arcadia's two rosters can be compared directly in `.ki.toml` at the revision above.
- **Agora has a broader supported shape than its observed use.** Multiple memberships, inclusion of another group and plain-Git repository inclusions are supported, with one-level expansion and no permission grant. Its identifier also keys ChatGPT context and acquisition paths. See the [Agora standard](../../../../../ki-agentic-harness/skills/governance/ki-agora/references/standards-agora.md), especially purpose, inclusion and identifier sections.
- **Paperclip is separately bound but coupled to Agora.** Its standard gives each participating repository one `organisation_code`, while permitting several Agora memberships. Company bootstrap nevertheless binds an Agora and home repository, checks membership for admission, and defaults shared-report ownership to that home. See the [Paperclip coordination standard](../../../../../ki-agentic-harness/skills/agentic-systems/ki-agent-coordination-paperclip/references/standards-agent-coordination-paperclip.md), organisation identity and recurring-activity sections. These are repository governance facts; no live Paperclip instance was inspected in this design pass.
- **`ki` currently selects through Agora, estate or explicit repositories.** Its selector rejects combinations of `--repo`, `--agora` and `--estate`; without one, it uses the current mgit manifest when available or the current repository. It rejects an empty selection. See [repository selection](../../../../../tools-ki/src/core/repository/selection.ts) and the [command selector type](../../../../../tools-ki/src/commands/repo/selection.ts), inspected at `13e046a723f6387ba829fe2b7a79825a2f455ac6`.
- **`mgit` already has a filter with different semantics.** It offers `-a, --agora`, `--estate` and repeatable `-f, --filter` glob patterns. Filtering narrows the final repository set by path, with multiple patterns combined as alternatives. Its KI selection calls `ki agora roots --null`; saved manifest locations also name Agoras. See [mgit](../../../../../tools-mgit/bin/mgit), help, KI-root resolution, `filter_match`, argument parsing and final-set filtering, inspected at `50d658973f7918a811d0e51199f1933c56c65db7`.
- **mgit has a standalone execution boundary.** [Its repository instructions](../../../../../tools-mgit/AGENTS.md) retain pure Bash and Git as its runtime dependencies. KI integration is optional; ordinary commands can read generated workspace entries without invoking `ki`. Identical selector intent therefore does not establish that every local mgit operation must require a KI installation.
- **Project and work ownership are distinct.** The [Project registry standard](../../../../../ki-agentic-harness/skills/change-management/ki-work/references/standards-project-registry.md) places the shared Project in the territory Capital and preserves each record's repository authority. [[trades-revamp]] currently has a separate, narrower outcome: simplify trade policy without changing its grants and retire `map_bonus`. This design need not silently expand that Project.

The harness standards were inspected at `11416cde3bd0bf4933ff61d76b6421666effc78c`.

---

## Reflection

1. **Derive the default territorial selection from the Capital's roster.** Retire the duplicate authored Agora memberships once their consumers have migrated. The current inventory does not justify introducing another maintained group taxonomy; preserve a route for a future saved working set only if a concrete use case needs it.
2. **Keep membership, local availability and authority distinct.** A territory selects its declared members and the estate selects all registered repositories. Registry resolution finds their local checkouts; selection never adds jurisdiction, source access, trade rights or delivery authority. The design must settle unavailable members, invalid declarations and partial results explicitly.
3. **Use the owner's selector spellings in both tools.** `-t, --territory` replaces Agora selection, `--estate` selects the registered estate, and `-f, --filter` expresses prefix filtering. A Capital's local registry key is an existing unambiguous territory handle; Agora slugs and readable territory names are not automatically equivalent to it. The exact handle and prefix domain still need an owner decision.
4. **A filter should narrow an established scope and never silently widen it.** Literal, case-sensitive prefixes of repository registry keys are a candidate contract. Defaults for filter-only invocation, repetition, combinations with explicit paths, empty prefixes, shell metacharacters, no matches and unregistered plain-Git repositories must be settled before delivery. Preserve ordinary command defaults unless the owner explicitly chooses a change; do not infer a current-territory or whole-estate default from the flag preference alone.
5. **Share the contract and resolution boundary without imposing a new distribution model.** Let `ki` own canonical identity and territory resolution, with an explicit machine-readable roots interface that mgit can call for KI selectors. Keep mgit usable for ordinary Bash/Git workflows. Define equivalent observable selection and errors in both tools, and test their parity at that boundary; do not add a registry package or a new mandatory runtime.
6. **Treat retirement as a consumer migration.** Cover CLI selectors and completions, mgit saved locations and generated entries, environment/client opening, acquisition/context identifiers, governance declarations and Paperclip bindings. Shared-report ownership should be explicit rather than derived from an opening profile. Historic captures and source provenance must remain locatable. Decide whether any compatibility window is required; aliases and path rewrites are not assumed.
7. **Keep one finite Project and repository-owned delivery records.** A candidate Project is Territory selection and Agora retirement, within [[knowledge-islands-model|Knowledge Islands model]]. Its outcome is matching selector behaviour in ki and mgit, migrated consumers, and one maintained territorial membership roster per territory. The existing trade-policy Project remains independently deliverable. The loop itself creates no work records; its accepted decisions later supply the capture and planning context.
8. **Pilot before fleet migration or parallel delivery.** First prove the resolution and caller contract on a bounded territory, including renamed handles, filters, no-match behaviour and unavailable roots, then update consumers and declarations in an agreed order. The report should propose the pilot, rollout waves and a precise authority grant for Kris to decide. Starting this design authorises its supporting artefacts and reviews, not implementation, company changes, acceptance, push, prune or release.
