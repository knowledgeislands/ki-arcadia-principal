# Knowledge Islands factorisation roadmap

Status: consolidated coordination roadmap, not yet an adopted delivery record

Prepared: 2026-09-20

Updated: 2026-09-20 after routing and pre-V1 direction

## Purpose

This roadmap consolidates the estate-wide factorisation brief, the independent GPT-6 Astra and Fable reviews, the Codex synthesis, the dated Fable addendum, and subsequent maintainer direction.

It explains each proposed change, why it is justified, where it belongs, what it produces, and how completion can be demonstrated. It does not replace the forward-work queue in any repository. Before implementation, each owning repository must capture or adopt its part through its configured work adapter, with reciprocal handoffs where another repository is affected.

The source set is:

- [the estate factorisation brief](knowledge-islands-factorisation-brief.md);
- [the GPT-6 Astra review](knowledge-islands-factorisation-brief-review-gpt-6-astra.md);
- [the Fable review and dated addendum](knowledge-islands-factorisation-brief-review-fable.md); and
- [the Codex synthesis position](knowledge-islands-factorisation-brief-review-codex.md).

## Source precedence

Where the source reviews conflict, use this order:

1. Maintainer direction recorded on 2026-09-20.
2. The dated addendum to the Fable review and the Codex synthesis, where they incorporate that direction.
3. The original independent Astra and Fable reviews as evidence and alternative reasoning.
4. The original brief where it has not been corrected by later evidence.

The independent reviews remain unchanged historical inputs. A withdrawn recommendation is not revived merely because it still appears in an earlier section.

## Decisions already made

The following are inputs to the roadmap rather than open design questions:

- Merge `mcp-housekeeping-chatgpt` and `mcp-housekeeping-codex` into `mcp-housekeeping-openai`.
- Support ChatGPT and Codex concurrently through separate adapters in the same server.
- Keep `mcp-housekeeping-openai` private through the merge and review visibility separately afterwards.
- Keep `mcp-housekeeping-claude` separate.
- Create no estate-wide KIP, KIS, schema, or comparable portable specification before overall Knowledge Islands V1.
- Keep `ki-specifications` as a dormant scaffold during this work.
- Amend existing decision records in place rather than creating successor records merely to carry clarified or expanded scope.
- Amend `GDR-KI-FUNDAMENTALS-001` in place as the estate responsibility, routing, and repository-boundary record, then distribute the coherent shared record across the estate.
- Originate estate-wide shared initiatives in Arcadia Principal and disseminate implementation work to the owning repositories.
- Give every surviving repository its own bounded roadmap item to reconcile with the shared fundamentals record, applicable Agentic Harness skills, current repository standards, and relevant standards emerging from this factorisation work.
- Test common MCP behaviour before extracting and rolling out shared implementation.
- Retain every other repository boundary unless measured evidence justifies a later change.
- Treat the V0.x estate as pre-live: establish the intended target directly without legacy compatibility, migration, or rollback machinery.

## Target estate

After the OpenAI merge, the review estate contains 21 repositories: 20 in the Knowledge Islands organisation plus external `krisb/dotfiles`.

The target remains federated:

- Arcadia owns philosophy, the conceptual model, shared estate governance, and the canonical initiative record for work that spans repositories.
- Techne Principal owns engineering discipline and architecture.
- The Agentic Harness owns reusable capability semantics and repository-local shared MCP controls.
- `tools-ki` owns generic host mechanics and the public `ki` command surface.
- Techne Tools owns controller and execution-fabric implementation.
- Each product repository owns its product behaviour, provider policy, and lifecycle state.
- Website, Plugins, Homebrew, and installed payloads remain attributable publication, projection, distribution, or deployment surfaces.
- Dotfiles owns personal machine binding and registration state; native providers own their own mutable state.
- Specifications remains reserved for possible post-V1 portable contracts and receives no current factorisation work beyond a faithful shared fundamentals projection.

These responsibilities and their routing rules belong in `GDR-KI-FUNDAMENTALS-001`, not only in this roadmap. The roadmap explains how to enact the target; the shared fundamentals record tells every repository where a future question or initiative belongs.

## Delivery principles

### Decision records

Update a current decision record in place when the change clarifies, completes, or extends its existing decision. Preserve its identifier, original date, and current status, and add a dated amendment note explaining what changed and why.

Do not create a successor merely to avoid editing a shared record. Create a new decision only when a genuinely new decision has no honest existing home, and only after explicit approval.

### Repository boundaries

Use Fable's three boundary reasons as strong, testable presumptions:

- **R1 - independent acceptance or release:** the content is accepted, versioned, or consumed as its own unit.
- **R2 - distinct trust boundary:** visibility, licence, credentials, personal data, or failure containment differ materially.
- **R3 - host mandate:** a consuming platform requires a distinct repository, root layout, or deployment location.

These are not an exhaustive mechanical rule. Independent governance, audience, change coupling, cognitive scope, and historical continuity may justify an explicit exception. Conceptual authority alone does not automatically require a separate source repository.

### Cross-repository campaigns

Arcadia Principal is the home and campaign owner for every estate-wide shared initiative. Its canonical initiative record states the outcome, exact participating repositories, routing, current disposition, evidence, and completion condition. Work is then disseminated to the receiving repositories through local records or handoffs. Each receiving repository still owns its implementation, verification, commits, and acceptance.

This is directional governance, not central implementation ownership: Arcadia decides and tracks the shared estate outcome, while the repository named by the fundamentals routing record decides how its part is delivered.

### Pre-V1 directness

Knowledge Islands is at V0.x. This roadmap therefore does not require backwards compatibility, dual-running old and new structures, legacy state migration, compatibility redirects, or rollback exercises. Delivery establishes and verifies the intended target directly. Ordinary care still applies to unrelated user data and Git history, but pre-V1 structural work should not acquire release-grade migration ceremony before there is a V1 contract to preserve.

## Roadmap summary

The intended order is:

1. Re-verify the point-in-time evidence.
2. Amend and distribute the shared fundamentals record.
3. Repair confirmed documentation and configuration drift.
4. Record the difficult ownership seams and Arcadia-led dissemination mechanism.
5. Decide the repository-local MCP access and audit policy.
6. Build and run the behavioural MCP conformance suite.
7. Merge the ChatGPT and Codex MCPs.
8. Pilot the narrow shared MCP kit.
9. Roll the kit out incrementally if the pilot succeeds.
10. Make projections, deployments, and releases observable.
11. Complete a repository-local alignment item in every surviving repository.
12. Measure the result and revisit deferred structural choices at explicit gates.

## Phase 1 - Establish the estate contract

### FND-1 - Re-verify the evidence baseline

**What it is.** Re-run the small set of measurements on which the roadmap depends before changing source: repository inventory and visibility, MCP dependency versions, current test coverage, common-file hashes, dotfiles registrations, current CI pins, projection freshness, and the state of `ki-specifications`.

**Why it is justified.** The reviews were produced against moving repositories. Fable already found facts that changed during review: Specifications was reset to an empty scaffold, the Codex MCP had no deployment footprint, `annotations.ts` had nine distinct hashes rather than eight, and Claude housekeeping was public while the OpenAI pair was private. A roadmap should not turn a dated observation into an implementation instruction without confirming it.

**Owner and scope.** Arcadia owns the coordination record. Evidence is read from all 22 pre-merge repositories, without modifying them.

**Deliverables.** Produce a dated evidence appendix or campaign report recording the measured values, source revisions, and any changes from the reviews.

**Completion gate.** Every fact used to justify FND-2, MCP-1, or OAI-1 is either re-confirmed or explicitly corrected. Unverified claims are labelled as assumptions rather than silently retained.

### FND-2 - Amend and distribute `GDR-KI-FUNDAMENTALS-001`

**What it is.** Amend the existing shared fundamentals record in place. Keep its identifier, original date, and current status, and add a dated 2026-09-20 amendment history. Arcadia remains the canonical source.

The amendment should add or clarify:

- the five distinct factorisation decisions: conceptual or normative authority, executable ownership, source organisation, distribution, and runtime security;
- executable ownership as a class distinct from conceptual authority;
- product repositories as owners of product behaviour, compatibility, and lifecycle state;
- dotfiles as owner of personal environment binding and registration, with native providers owning native mutable state;
- `ki-specifications` as dormant until overall V1;
- R1, R2, and R3 as strong repository-boundary presumptions, with explicit secondary considerations rather than an exhaustive mechanical rule;
- authority alone not creating a repository boundary;
- the distinction between Agora membership, dependency routing, campaign coordination, and ownership;
- Arcadia Principal as the origin and campaign home for estate-wide shared initiatives;
- the requirement for a named receiving owner and completion condition for each disseminated part;
- a responsibility and routing map covering every repository class in the target estate; and
- corrected descriptions of the Harness, MCP servers, Homebrew tap, and other surfaces where the current record overstates or misstates ownership.

The responsibility and routing map should answer at least:

- philosophy, conceptual model, shared governance, or estate-wide initiative -> Arcadia Principal;
- engineering discipline or architecture -> Techne Principal;
- reusable agent capability semantics -> Agentic Harness;
- generic CLI hosting, repository mechanics, or public `ki` grammar -> `tools-ki`;
- controller or execution-fabric implementation -> Techne Tools;
- product behaviour or provider policy -> the product repository;
- public editorial publication -> Website;
- generated runtime packaging -> Plugins or the named projection repository;
- command-line distribution -> the product release plus Homebrew tap;
- personal environment binding and registration -> dotfiles;
- native mutable state -> the native provider; and
- portable specifications -> no active route before V1, then `ki-specifications` only if explicitly activated.

**Why it is justified.** These rules apply across the whole estate, not only the six current primary authorities. Housing responsibilities, routing, and boundary tests in one shared fundamentals record gives every repository the same answer to "where does this belong?" and gives Arcadia a coherent basis for disseminating shared work. Amending in place avoids competing old and new artefacts, preserves the record's history, and matches the maintainer's preference for updating existing decisions.

**Owner and scope.** Arcadia authors the canonical amendment. The six existing projections are updated in one coordinated pass. The target is then extended to all 21 Knowledge Islands organisation repositories. `krisb/dotfiles` should carry the same attributed projection unless its own repository contract requires a durable canonical pointer instead; any exception must be recorded, not inferred.

**Deliverables.** Update the canonical record, add source and canonical markers, project it to the agreed estate set, and provide a byte-identity or semantic-equivalence check appropriate to each repository path.

**Completion gate.** The amendment is review-approved, every declared projection identifies Arcadia as canonical, all copies pass the shared-record check, and no repository presents an older copy as current.

**Dependency.** FND-1.

### FND-3 - Repair confirmed documentary and configuration drift

**What it is.** Correct the small factual and cross-reference errors exposed by the reviews, after FND-1 confirms they still exist.

Candidate corrections include:

- the `ki-plugins` projection ADR citation and generator script name;
- stale repository names in Harness MCP standards;
- `mcp-ki-kb-fs` naming residue;
- stale acquisition command names;
- historical Arcadia Techne material that could be mistaken for current engineering authority;
- stale CI `KI_VERSION` pins;
- projection provenance claims that currently lack a check; and
- the brief's corrected visibility and hash counts, already updated in the consolidated input.

**Why it is justified.** These are low-risk defects that make later ownership work harder to assess. Correct names and references improve navigation without committing the estate to a structural redesign.

**Owner and scope.** Each affected repository owns its correction. The Arcadia initiative record groups them for completion reporting but does not combine their commits.

**Deliverables.** One focused, verified commit per affected repository, or a recorded finding that the issue was already resolved.

**Completion gate.** Every confirmed drift item is fixed, dismissed with evidence, or assigned to a separate local record. No correction introduces an estate-wide specification.

**Dependency.** FND-1. This may run alongside FND-2 after the evidence report is stable.

### FND-4 - Record ownership seams and Arcadia-led dissemination

**What it is.** Amend the current local governance documents that describe the three difficult interfaces:

- Harness semantics versus `tools-ki` host mechanics;
- repository work state versus Techne Tools controller execution state; and
- Rig catalogue intent versus dotfiles bindings, `ki` activation, application bootstrap, infrastructure deployment, and provider state.

Also define the Arcadia initiative pattern for multi-repository changes: shared outcome, exact receiving set, route to each owner, per-repository state, evidence, and finish/defer/abandon disposition.

**Why it is justified.** Separate repositories do not make these interfaces independent. Harness rubric modules execute inside `ki`; controller work eventually integrates into repository-owned Git state; and several tools can plausibly claim to "bootstrap" a machine. Without explicit write ownership, the estate can create competing state even when its repository layout looks tidy. The reviews also found several partially completed estate initiatives with no mechanism proving completion.

**Owner and scope.** Arcadia owns the shared initiative and routing record. Harness and `tools-ki` jointly evidence the first seam; Techne Principal, Techne Tools, and `tools-ki` the second; Rig and dotfiles the third. Update suitable current records in place. Create a new decision only if no existing record can honestly carry it and the maintainer approves it.

**Deliverables.** Ownership statements, compatibility or state diagrams where useful, and a reusable Arcadia-to-repository dissemination checklist referenced by FND-2.

**Completion gate.** Every mutable state named in the reviews has one writer, every cross-boundary call has an owner for semantics and mechanics, and a representative Arcadia initiative can be routed to local repository work and tracked to an unambiguous terminal disposition.

**Dependency.** FND-2 provides the shared vocabulary.

## Phase 2 - Establish MCP policy and behavioural evidence

### MCP-1 - Decide the repository-local access and audit policy

**What it is.** Decide the desired common MCP policy before writing a suite that could accidentally canonise one existing copy. Record the policy locally in the Agentic Harness by amending the existing MCP guidance and suitable current Harness decision records.

The policy must define:

- access levels, ranking, defaults, and fail-safe treatment of missing or malformed annotations;
- whether registration, invocation, or both enforce the gate;
- the canonical annotation meanings and which presets are genuinely common;
- mandatory audit-event fields and modes;
- generic sanitisation rules for nested values, arrays, errors, and URL credentials;
- the boundary between generic sanitisation and provider-specific redaction fields;
- rotation and failure behaviour; and
- which settings remain server-owned configuration.

**Why it is justified.** The nine implementations disagree, especially around redaction. That disagreement is not evidence that one copy is correct. Fable's original test-first ordering was revised after Astra identified the gap: policy is a decision, not a fact recoverable from hashes. A conformance suite can only be meaningful once the desired behaviour is explicit.

**Owner and scope.** The Agentic Harness owns the repository-local common policy. Each MCP retains its provider policy and configuration. Nothing is promoted into `ki-specifications` before V1.

**Deliverables.** Updated Harness MCP guidance, policy fixtures or examples, and a mapping from each current MCP to the policy decisions it must configure locally.

**Completion gate.** Every testable rule has an unambiguous expected result, provider-specific variations are named, and no rule depends on an unpublished estate-wide specification.

**Dependencies.** FND-2 and FND-4.

### MCP-2 - Build the black-box conformance suite

**What it is.** Build an SDK-neutral suite in the Agentic Harness that launches a built MCP server over stdio and tests observable behaviour rather than source shape.

The initial suite should cover:

- access-level derivation and rank ordering;
- denied registration and invocation;
- missing and malformed annotations;
- common annotation values;
- audit-event shape;
- declared provider redaction fields;
- nested secrets, arrays, error objects, and URL credentials;
- failed calls and fail-safe logging;
- log rotation; and
- configuration precedence.

**Why it is justified.** Four MCP repositories were reported to lack an access-gate unit test, while the repository rubric checked only that a file existed. This is the clearest demonstrated defect in the review: the estate has copied security controls without an estate-level way to prove equivalent behaviour. A black-box suite remains useful whether code stays duplicated, becomes vendored, or later moves into a workspace.

**Owner and scope.** The Harness owns the suite and its policy fixtures. Each MCP owns the adapter required to launch its built server and the result of running the suite.

**Deliverables.** Test harness, server launch contract, deterministic fixtures without personal data, and machine-readable result format.

**Completion gate.** The suite runs against at least one SDK v1 server and `mcp-git-audit` on SDK v2, and a deliberately failing fixture proves the suite detects a policy breach.

**Dependency.** MCP-1.

### MCP-3 - Baseline all nine pre-merge MCPs

**What it is.** Run the suite and supporting source inventory against all nine current MCP repositories before merging or vendoring. Classify each difference as a common invariant, provider policy, SDK adaptation, deliberate product behaviour, or defect.

**Why it is justified.** A pre-merge baseline preserves evidence about ChatGPT and Codex independently and prevents the merge from hiding a discrepancy. It also determines whether the proposed shared kit is actually common enough to justify extraction.

**Owner and scope.** Arcadia owns and coordinates the shared MCP initiative; every MCP repository owns its result and any local defect fix.

**Deliverables.** Compatibility matrix, provider-policy map, confirmed defect list, and dated source/deployment revisions.

**Completion gate.** All nine repositories have a result or a documented reason they cannot yet run. Confirmed defects are fixed locally or recorded as explicit blockers before shared implementation is extracted.

**Dependency.** MCP-2.

## Phase 3 - Consolidate the OpenAI housekeeping product

### OAI-1 - Merge ChatGPT and Codex into `mcp-housekeeping-openai`

**What it is.** Rename the existing ChatGPT repository to `mcp-housekeeping-openai`, merge the Codex source into it under a clear adapter boundary, and expose both adapters from one server. ChatGPT is the receiving repository; no third repository is created.

The product contract is:

- ChatGPT and Codex may both be present on one machine;
- each root is detected independently;
- each adapter has independent availability diagnostics and configuration;
- absence or failure of one adapter does not prevent the other from operating;
- both remain faithful, read-only acquisition surfaces;
- source-specific checkpoint and provenance schemas remain distinguishable; and
- the repository remains private while the combined target is established.

**Why it is justified.** The two repositories have the same visibility, version, supported runtime family, four-operation read-only outcome, and near-identical project scaffolding. Codex has no current registration, CI, release, or installed-state footprint, while ChatGPT is the deployed base. The merge therefore removes one maintenance boundary without combining different trust classes or disrupting an installed Codex service. `openai` is the smallest brand name that honestly covers both products; `chatgpt` would misdescribe Codex.

**Owner and scope.** `mcp-housekeeping-chatgpt` is renamed and remains the operational base. `mcp-housekeeping-codex` contributes its adapter and any useful source history. Harness Agora membership and dotfiles registrations are changed directly to the target name after the combined server passes its gates.

**Deliverables.** Renamed combined repository, ChatGPT and Codex adapter boundaries, concurrent-operation tests, independent failure tests, updated private repository metadata, registrations, and Agora membership, followed by retirement of the absorbed Codex repository.

**Completion gate.** Both adapters pass MCP-2 independently and together, the target repository has the final OpenAI identity everywhere, current machine binding points only to the target, and the old Codex repository is retired. No compatibility alias or rollback demonstration is required.

**Dependencies.** MCP-3 and clean working trees in both source repositories.

## Phase 4 - Pilot shared MCP implementation

### MCP-4 - Create the narrow Harness MCP kit

**What it is.** Extract only the common mechanics proven by MCP-3 into a small Harness-owned source set. Likely candidates are access derivation, generic gate mechanics, common annotation validation, and audit-event or sanitisation mechanics with provider policy injected.

The kit must exclude credentials, provider-specific redaction fields, allowed paths, scopes, server identity, SDK bindings, and product logic.

**Why it is justified.** The current estate has one conceptual security surface implemented nine times. A single reviewed source reduces semantic edits from one per server to one canonical edit plus controlled consumer updates. Keeping provider policy outside the kit avoids erasing legitimate differences or expanding Harness authority into product behaviour.

**Owner and scope.** The Agentic Harness owns source and unit tests. The policy remains repository-local and creates no pre-V1 portable specification.

**Deliverables.** Canonical modules, manifest containing source revision and hashes, configuration interface, unit tests, provenance header, and explicit sync and verification commands local to the pilot.

**Completion gate.** Every extracted line is justified by MCP-3 as common behaviour, every variation is injected or left local, and no module imports an MCP SDK version.

**Dependency.** MCP-3.

### MCP-5 - Pilot controlled copies in SDK v1 and v2 consumers

**What it is.** Materialise pinned ordinary-file copies into one representative SDK v1 server and `mcp-git-audit` on SDK v2. Each consumer records the Harness revision, hashes, supported interface, configuration inputs, and prohibition on local edits.

**Why it is justified.** Two deliberately different consumers test whether the kit is genuinely SDK-neutral and whether controlled copies preserve independent builds. A pilot avoids prematurely adding MCP-specific materialisation behaviour to `tools-ki`.

**Owner and scope.** Harness owns the sync source and verification. Each pilot MCP owns its adaptation commit and local tests.

**Deliverables.** Two consumer adoptions, conformance results, drift detection, and a short assessment of update effort and failure modes.

**Completion gate.** Both consumers build without runtime dependency on another KI repository, pass their own tests and MCP-2, and detect deliberate local drift.

**Dependency.** MCP-4. It may follow OAI-1 so the later rollout has eight consumers rather than nine.

### MCP-6 - Decide materialisation ownership

**What it is.** After the pilot, decide whether sync and verification remain Harness-local or become generic mechanics executed through `ki repo conform` and `ki repo audit`.

**Why it is justified.** `tools-ki` owns generic host mechanics, but it should not gain MCP-specific layout knowledge simply because it can write files. The pilot provides the missing evidence: whether materialisation is reusable host behaviour or still an MCP-specific experiment.

**Owner and scope.** Harness defines what content and checks mean. `tools-ki` owns any approved generic execution, transactions, and reporting.

**Deliverables.** An in-place update to the relevant existing ownership records, plus either a retained Harness-local mechanism or a narrowly generic `ki` operation.

**Completion gate.** The chosen owner follows the Harness/CLI seam from FND-4, supports offline and pinned operation, and does not introduce a public registry or hidden cross-repository runtime dependency.

**Dependency.** MCP-5.

### MCP-7 - Adopt the kit across the remaining MCPs

**What it is.** Apply the proven kit to the remaining MCP consumers one repository at a time. A temporary mixed state is visible implementation sequencing, not a supported legacy configuration.

**Why it is justified.** Independent adoption preserves repository acceptance while removing repeated semantic maintenance. Requiring simultaneous adoption would recreate the release coupling the current layout was designed to avoid.

**Owner and scope.** Arcadia owns the shared adoption initiative. Each MCP repository owns its adoption, while the Arcadia record tracks revisions and unresolved consumers.

**Deliverables.** One focused consumer commit per repository, green local and conformance tests, updated manifest evidence, and an unresolved-consumer report.

**Completion gate.** Every intended consumer has adopted, explicitly deferred, or rejected the kit with a documented reason. Confirmed security fixes have an adoption deadline and no silent stragglers.

**Dependency.** MCP-6.

## Phase 5 - Make copies and running systems observable

### PROJ-1 - Establish a projection register and checks

**What it is.** Catalogue every important copy relationship: `ki-plugins`, installed Harness payloads, website source copies, shared fundamentals records, dotfiles-rendered configuration, and vendored MCP kit files.

For each relationship record source, transformation, revision, editability, regeneration mechanism, drift check, and owner.

**Why it is justified.** The reviews found a stale plugin projection and incorrect cross-repository references. Generated, vendored, installed, and editorial copies have different rules; calling them all projections without recording those rules hides drift and accidental authority transfer.

**Owner and scope.** Each source repository owns its projection recipe. Destination repositories own deployment and local validation, not upstream semantics.

**Deliverables.** Projection register, reproducible `ki-plugins` check, website provenance check, shared-record check, and MCP kit manifest check.

**Completion gate.** Every listed copy is classified as faithful or lossy, pinned or floating, editable or prohibited, and checked or explicitly unchecked with justification.

**Dependencies.** FND-2 and MCP-5 for their respective projection types.

### OPS-1 - Inventory active bindings and builds

**What it is.** Record every active MCP binding and installed KI tool instance: source repository, revision or build digest, launch path, configuration source, effective permission boundary, and restart mechanism.

**Why it is justified.** MCPs currently run from absolute `dist` paths in working checkouts. The active version may therefore be whatever was last built locally rather than the current source or a named release. Both reviews identify this as a larger operational risk than repository count because source improvements cannot update an unidentified process.

**Owner and scope.** Dotfiles owns registrations and launch bindings. Each product repository supplies build identity and compatibility information. Native runtime providers own process state.

**Deliverables.** Machine-readable binding and build inventory, diagnostic command or report, stale-build detection, and documented restart procedure.

**Completion gate.** Every registered MCP and installed tool can answer "what is running, from which source, and with which configuration?"

**Dependencies.** FND-4. Run after OAI-1 so the inventory reflects the combined registration.

### DIST-1 - Verify immutable tool distribution

**What it is.** Validate that Homebrew formulae and website release updates trace to immutable release inputs and that current installation and upgrade remain testable for `ki`, `mgit`, `rig`, and Git Almanac.

**Why it is justified.** Source repository and distribution unit are deliberately separate. That boundary is useful only if a formula can be traced to an immutable artefact and the installed input can be identified.

**Owner and scope.** Each tool owns its release artefact; `homebrew-tap` owns formula acceptance; Website owns its release presentation.

**Deliverables.** Formula provenance checks and representative install and upgrade tests.

**Completion gate.** Each formula resolves to a verifiable immutable input and installs the intended current tool.

**Dependency.** FND-4. This work is independent of the MCP kit.

## Phase 6 - Consolidate every repository with the resulting standards

### ALIGN-1 - Create and complete one local alignment item per repository

**What it is.** Arcadia issues one bounded forward-work item to every repository in the post-merge target estate through that repository's configured work adapter. The common intent is to reconcile the repository with the shared fundamentals routing record, applicable Agentic Harness governance skills, current repository standards, and the repository-local contracts produced by this factorisation work.

Each local item should assess and, where applicable, conform:

- the repository's declared responsibility and incoming or outgoing routes under `GDR-KI-FUNDAMENTALS-001`;
- its `.ki.toml` or `.ki-config.toml` skill declarations and selected work adapter;
- the current versions of the applicable Agentic Harness repository, authoring, engineering, Git, decision, trade, and domain-specific skills;
- README and decision-record descriptions of authority, product behaviour, projections, distribution, and runtime state;
- the shared fundamentals projection and its canonical-source marker;
- any applicable MCP policy, conformance, or controlled-copy requirements;
- any applicable projection provenance, deployment identity, or distribution checks;
- obsolete local conventions that duplicate or contradict the shared standards; and
- explicit repository-local exceptions with their justification and owner.

The item is an alignment review, not a demand that every repository adopt every skill. Applicability follows the repository's actual role and the fundamentals routing record. Before overall V1, it must not create or require an estate-wide KIP, KIS, schema, or other portable specification.

**Why it is justified.** Shared factorisation logic has value only when each repository can route work consistently and prove that its local governance matches its role. The reviews found stale names, outdated citations, uneven CI pins, missing behavioural checks, and generated copies without provenance. One local item per repository converts the estate-level design into owned, reviewable repository work instead of relying on a central document and assuming adoption.

**Owner and scope.** Arcadia owns the shared alignment initiative, standard checklist, receiving set, and completion view. The Agentic Harness owns the skills and repository standards being applied. Each receiving repository owns its local record, applicability decisions, changes, verification, and acceptance. `tools-ki` may execute generic audits and conformance but does not decide the repository's responsibility.

**Receiving set.** Issue the item to every surviving repository after OAI-1: the 20 Knowledge Islands organisation repositories plus `krisb/dotfiles`. Do not create an item for the retired `mcp-housekeeping-codex`; its relevant obligations move into `mcp-housekeeping-openai`.

**Deliverables.** One local roadmap or configured-adapter record per repository, a completed applicability checklist, exact changes or justified no-change findings, verification evidence, and an Arcadia roll-up showing every repository's disposition.

**Completion gate.** Every surviving repository is recorded as aligned, aligned with explicit exceptions, or blocked by a named dependency. No repository is silently omitted, no central campaign marks a repository complete on its behalf, and the Arcadia roll-up matches the local records.

**Dependencies.** FND-2 defines the responsibility and routing baseline. Complete each local item only after the standards applicable to that repository have stabilised; MCP repositories therefore follow MCP-7, projection repositories follow PROJ-1, active bindings follow OPS-1, and tool distribution repositories follow DIST-1.

## Phase 7 - Measure and reconsider

### EVAL-1 - Measure whether the factorisation is working

**What it is.** Measure several representative cross-cutting changes after the new controls are in use.

Track:

- repositories and semantic implementations touched per change;
- time from canonical fix to final consumer disposition;
- conformance and compatibility failures;
- projection drift;
- CI duration and reliability;
- number of unknown deployed revisions; and
- maintainer or agent effort spent on coordination.

**Why it is justified.** Repository consolidation has a real change cost, while repository federation has a real coordination cost. Neither review had enough co-change or elapsed-time evidence to compare them honestly. Measurements allow future decisions to respond to actual work rather than repository aesthetics.

**Owner and scope.** Arcadia owns the shared initiative and estate-level summary; receiving repositories supply their local evidence.

**Deliverables.** Dated evaluation after several representative initiatives and explicit findings against the reconsideration gates below.

**Completion gate.** The estate can state whether controlled copies, conformance, shared initiatives, and projections reduced semantic duplication and incomplete adoption at an acceptable cost.

**Dependencies.** ALIGN-1 and the underlying MCP-7, PROJ-1, and OPS-1 work.

### EVAL-2 - Revisit deferred choices only at their gates

**What it is.** Keep the following choices deferred until named evidence appears:

- **OpenAI repository visibility:** review after combined tests and fixture hygiene are stable. Public source is not a control over local session data.
- **MCP workspace:** reconsider when the public same-SDK population grows materially, subtree governance exists, and measured co-change cost exceeds controlled-copy cost.
- **Git-ref dependency:** reconsider if controlled-copy adoption repeatedly misses agreed deadlines and private dependency resolution proves more reliable.
- **Broader repository consolidation:** reconsider only where trust, lifecycle, user outcome, and co-change evidence align.
- **Portable specifications:** reconsider only at overall V1. Repository-local contracts and evidence remain authoritative until then.
- **Shared fundamentals projection scope:** review whether every repository benefits from a full copy after one or more amendment campaigns; retain a pointer only where a full projection creates more drift than value.

**Why it is justified.** These alternatives are plausible but not currently proven. Explicit gates preserve them as real options without allowing them to distract or silently become commitments.

**Owner and scope.** The repository whose boundary would change owns the decision, informed by the estate-level evidence in Arcadia.

**Completion gate.** A deferred choice is either retained with current evidence, adopted through its local work process, or rejected with a recorded reason. No choice changes merely because a threshold date arrives.

**Dependency.** EVAL-1, except the V1 specification gate, which also requires overall V1.

## Repository disposition

The roadmap's current disposition is:

- Keep Arcadia Principal, Techne Principal, Agentic Harness, `tools-ki`, Specifications, Website, Techne Tools, Plugins, Homebrew tap, `tools-mgit`, `tools-rig`, and Git Almanac.
- Keep `mcp-m365`, `mcp-gsuite`, `mcp-git-audit`, `mcp-ki-kb-fs`, `mcp-ki-kb-notion-mirror`, `mcp-acquire-whatsapp`, and `mcp-housekeeping-claude` as separate products.
- Rename `mcp-housekeeping-chatgpt` to `mcp-housekeeping-openai` and merge `mcp-housekeeping-codex` into it.
- Retire `mcp-housekeeping-codex` after its source has been absorbed into `mcp-housekeeping-openai`; no compatibility redirect is required before V1.
- Keep `krisb/dotfiles` external, with explicit ownership of personal environment bindings.
- Archive, split, or move no other repository under the present evidence.

## Out of scope before overall V1

- New estate-wide KIPs, KIS documents, schemas, or portable specifications.
- Legacy compatibility, state migration, rollback plans, or dual-running old and new repository structures before V1.
- Publishing shared packages to a public registry.
- Moving every MCP into the Harness or Techne Tools.
- Treating a repository, worktree, or visibility setting as runtime security isolation.
- Replacing every existing decision record with a successor solely because the estate vocabulary changed.
- Making `tools-ki` the controller or owner of product-specific MCP behaviour.
- Making the roadmap itself a second authoritative work tracker.

## From roadmap to delivery

This file is a consolidation and coordination source in the inbound `+` area. It does not mark any item Ready or authorise implementation.

When the maintainer chooses a delivery unit:

1. Capture or select the corresponding work record in the owning repository.
2. Add reciprocal handoffs for other affected repositories.
3. Shape the local records to Ready with exact baselines, touched paths, and verification.
4. Run only the approved unit or bounded batch.
5. Return evidence here or to the canonical Arcadia initiative record for later consolidation.

The smallest coherent first delivery is FND-1 and the planning of FND-2. The first implementation campaign should not begin until the exact fundamentals projection set and amendment text have been reviewed.
