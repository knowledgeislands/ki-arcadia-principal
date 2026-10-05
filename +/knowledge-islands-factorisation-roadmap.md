# Knowledge Islands factorisation roadmap - remaining work

- Status: residual coordination roadmap, not an adopted delivery record
- Prepared: 2026-09-20
- Trimmed: 2026-10-05 to remaining work only

## Purpose

This is what remains of the estate factorisation roadmap that came out of the 2026-09-20 brief and reviews. Completed phases and the source papers have been removed; the full original is in Git history (`git log -- "+/knowledge-islands-factorisation-roadmap.md"`). The responsibility model, routing map and decisions it proposed now live in `GDR-KI-FUNDAMENTALS-001`, so they are not repeated here.

Nothing here is Ready. To act on an item, capture or select a work record in the owning repository.

## Done

| Item | Delivered by |
| --- | --- |
| FND-1 - re-verify the evidence baseline | `KI-ARCADIA-GOV-009` (accepted, pruned 2026-09-26) |
| FND-2 - amend and distribute `GDR-KI-FUNDAMENTALS-001` | `KI-ARCADIA-ECO-001` (accepted, pruned 2026-09-26) |
| Rehome the estate Agoras | `KI-ARCADIA-ECO-002` (accepted, pruned 2026-09-26) |
| MCP and tools roadmap backlog dispositions | `KI-ARCADIA-ECO-003` and `ECO-004` (accepted, pruned 2026-10-04) |
| Retire `ki-plugins` | `KI-ARCADIA-ECO-010` (accepted, pruned) |
| Consolidate and retire Techne Principal | `KI-ARCADIA-ECO-007` and `ECO-008` (accepted, pruned 2026-10-04/05) |

Two of these changed the target estate. `ki-techne-principal` and `ki-plugins` are retired, so every reference to them below is moot: Arcadia now owns Techne engineering knowledge, and there is no plugin projection to check.

## Remaining at a glance

Status observed read-only on 2026-10-05.

| Item | Status | Evidence |
| --- | --- | --- |
| FND-3 - repository structure vocabulary | Mostly done | All 21 local `knowledgeislands` checkouts declare `repo_type`; no checked estate structure register found |
| FND-4 - repair documentary and configuration drift | Partly moot, unverified | The `ki-plugins` and Techne Principal items went with those retirements; the rest have not been rechecked |
| FND-5 - ownership seams and dissemination | No evidence found | - |
| MCP-1 - MCP access and audit policy | Open | Harness MCP standards exist, but no policy fixtures |
| MCP-2 - black-box conformance suite | Open | No suite found in the Harness |
| MCP-3 - baseline the MCPs | Partial | Shared-code inventory of 2026-09-24 in `ki-repo-mcp` `standards-mcp-shared-code.md`; no conformance results |
| OAI-1 - merge Codex into `mcp-housekeeping-chatgpt` | Partial | `src/tools/codex` exists in ChatGPT, but `mcp-housekeeping-codex` is not archived and was still committed to on 2026-10-05 |
| MCP-4 to MCP-7 - shared MCP implementation | Open | Gated on MCP-3 |
| PROJ-1 - projection register | Open | Smaller now that `ki-plugins` is retired |
| OPS-1 - inventory active bindings and builds | Open | - |
| DIST-1 - verify tool distribution | Open | Tap formulae exist for `ki`, `mgit`, `rig`, `git-almanac` and `techne` |
| ALIGN-1 - one alignment item per repository | Open | Waiting on FND-3, FND-5 and OAI-1 |
| EVAL-1 and EVAL-2 - measure and reconsider | Open | Waiting on ALIGN-1 |

## Phase 1 - Remaining estate contract

### FND-3 - Standardise repository structure vocabulary

**What it is.** Make the repository model mechanically explicit in the Agentic Harness standards. Retain exactly two base structures, Project and Knowledge Base; treat specialised `ki-repo-*` skills as composable structural overlays; reserve adapter for replaceable implementation, hosting, provider, runtime, or work-tracker bindings; and reserve estate role for authority and routing recorded in the shared fundamentals record.

While the estate remains V0.x, replace the implicit ordinary `repository` default with explicit `repo_type = "project" | "kb"` and one matching primary declaration. Update the current repository standard, configuration standard, rubric, examples, and project or KB structural skills in place. Do not create compatibility aliases or a third generic “code”, “product”, “principal”, or “harness” base type.

**Why it is justified.** The current sources alternate between `repository` and Project, while “principal”, “harness”, “tools”, “projection”, and “code repository” are also used as authority, product, distribution, or implementation descriptions. That ambiguity can make a local directory shape look like authority. The live split between the compatible agentic Harness, the singular Techne execution harness, `ki-techne-harness`, and the new standalone `tools-techne` makes the distinction operational rather than editorial.

**Owner and scope.** Arcadia owns the estate vocabulary and target register through FND-2. The Agentic Harness owns the enforceable repository standards. Each repository owns its later declaration change through ALIGN-1. `tools-techne` and `apps-observatory` participate as ordinary governed Project receivers.

**Deliverables.** Amended Harness standards and current decisions where they already own structure composition; explicit base declarations; updated coverage and cardinality tests; a checked estate structure register; and clear terminology distinguishing agentic capability Harness from Techne execution harness.

**Completion gate.** Every governed repository declares exactly one base structure, detected overlays agree with declared skills, no structural overlay is cited as authority proof, and the register accounts for all 23 post-merge repositories.

**Dependencies.** FND-2 supplies estate roles and routing. It may proceed alongside drift repair after the FND-1 inventory correction.

### FND-4 - Repair confirmed documentary and configuration drift

**Confirmed during FND-1.** The repair set now includes `ki-plugins` lacking a declared work adapter, `repo_code`, and roadmap ledger; Techne Principal's `OPS` ledger high-water mark remaining at 008 while `TECHNE-OPS-009` exists; dotfiles roadmap-shape failures in `DOTFILES-UE-026` and `DOTFILES-UE-028`; and the Harness Decision Records audit reporting a non-canonical filename for `ADR-KI-HARNESS-SKILLS-009`. These findings remain repository-owned and do not authorise correction inside FND-1.

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

### FND-5 - Record ownership seams and Arcadia-led dissemination

Arcadia's current `ki-trades` declaration exports knowledge only, and only to Harness, Website, Specifications, and Techne Principal. The dissemination design must therefore distinguish a declared work-trade route from a direct repository-local handoff under the existing cross-repository choreography; it must not present the current knowledge routes as an estate-wide work transport.

This phase also removes the empty MCP source shelf from the Harness model and amends the current Harness purpose, layout, publication, repository-specification, rubric, and orientation surfaces in place. `KI-ARCADIA-ECO-002` rehomes `ki-all`, `ki-fnd`, and the new `ki-tools` directly; OAI-1 rehomes `ki-mcps` after the OpenAI merge. Every Agora member retains independent consent, and MCP products continue to consume the Harness's `ki-repo-mcp` governance skill without becoming Harness-owned products.

**What it is.** Amend the current local governance documents that describe the three difficult interfaces:

- Harness semantics versus `tools-ki` host mechanics;
- repository work state versus `ki-techne-harness` controller execution state; and
- Rig catalogue intent versus dotfiles bindings, `ki` activation, application bootstrap, infrastructure deployment, and provider state.

Also define the Arcadia initiative pattern for multi-repository changes: shared outcome, exact receiving set, route to each owner, per-repository state, evidence, and finish/defer/abandon disposition.

**Why it is justified.** Separate repositories do not make these interfaces independent. Harness rubric modules execute inside `ki`; controller work eventually integrates into repository-owned Git state; and several tools can plausibly claim to "bootstrap" a machine. Without explicit write ownership, the estate can create competing state even when its repository layout looks tidy. The reviews also found several partially completed estate initiatives with no mechanism proving completion.

**Owner and scope.** Arcadia owns the shared initiative and routing record. Harness and `tools-ki` jointly evidence the first seam; Techne Principal, `ki-techne-harness`, and `tools-ki` the second; Rig and dotfiles the third. Update suitable current records in place. Create a new decision only if no existing record can honestly carry it and the maintainer approves it.

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

**Dependencies.** FND-2 and FND-5.

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

### OAI-1 - Merge ChatGPT and Codex into `mcp-housekeeping-chatgpt`

**What it is.** Keep the existing `mcp-housekeeping-chatgpt` repository, merge the Codex source into it under a clear adapter boundary, and expose both adapters from one server. ChatGPT is the receiving repository; no third repository is created.

The product contract is:

- ChatGPT and Codex may both be present on one machine;
- each root is detected independently;
- each adapter has independent availability diagnostics and configuration;
- absence or failure of one adapter does not prevent the other from operating;
- both remain faithful, read-only acquisition surfaces;
- source-specific checkpoint and provenance schemas remain distinguishable; and
- the repository remains private while the combined target is established.

**Why it is justified.** The two repositories have the same visibility, version, supported runtime family, four-operation read-only outcome, and near-identical project scaffolding. Codex has no current registration, CI, release, or installed-state footprint, while ChatGPT is the deployed base. The merge therefore removes one maintenance boundary without combining different trust classes or disrupting an installed Codex service. ChatGPT is the product-family name; Codex remains the explicit adapter name.

**Owner and scope.** The existing `mcp-housekeeping-chatgpt` repository remains the operational base. `mcp-housekeeping-codex` contributes its adapter and any useful source history. Dotfiles registrations change directly to the target name after the combined server passes its gates. The Harness-owned `ki-mcps` Agora is coordination rather than product ownership; after the merge, move the surviving MCP coordination group to Arcadia in one coordinated declaration change rather than repointing the retiring Codex member.

**Deliverables.** Combined ChatGPT-family repository, ChatGPT and Codex adapter boundaries, concurrent-operation tests, independent failure tests, updated private repository metadata, registrations, and Agora membership, followed by retirement of the absorbed Codex repository.

**Completion gate.** Both adapters pass MCP-2 independently and together, the target repository has the final ChatGPT-family identity everywhere, current machine binding points only to the target, and the old Codex repository is retired. No compatibility alias or rollback demonstration is required.

**Dependencies.** MCP-3 and clean working trees in both source repositories.

## Phase 4 - Pilot shared MCP implementation

### MCP-4 - Decide and pilot a narrow shared MCP implementation source

**What it is.** Decide whether the common mechanics proven by MCP-3 justify a single implementation source at all. If they do, establish an explicitly governed source boundary outside the Agentic Harness and pilot only access derivation, generic gate mechanics, common annotation validation, and audit-event or sanitisation mechanics with provider policy injected. The source must exclude credentials, provider-specific redaction fields, allowed paths, scopes, server identity, SDK bindings, and product logic.

**Why it is justified.** The current estate has one conceptual security surface implemented nine times, but behavioural conformance may remove the risk without creating another source owner. This evidence gate avoids treating shared implementation code as a Harness capability or creating a new repository merely because files look similar. If extraction is justified, one reviewed source can reduce semantic edits while provider policy remains local.

**Owner and scope.** The Agentic Harness owns policy, fixtures, and the black-box conformance suite, not the shared implementation source. Arcadia coordinates the ownership decision. Any extracted source receives an explicit owner justified by R1 and R2; it does not default to Harness, `tools-ki`, or `ki-techne-harness`. Each MCP retains product ownership and acceptance. This creates no pre-V1 portable specification.

**Deliverables.** A recorded extract-or-retain decision. If extraction is justified: canonical modules, an explicit source owner, a manifest containing source revision and hashes, a configuration interface, unit tests, a provenance header, and sync and verification commands for the local pilot.

**Completion gate.** Either conformance alone is retained with evidence that a shared source is unnecessary, or every extracted line is justified by MCP-3 as common behaviour, the source owner is explicit, every variation is injected or left local, and no module imports an MCP SDK version.

**Dependency.** MCP-3.

### MCP-5 - Pilot controlled copies in SDK v1 and v2 consumers

**What it is.** If MCP-4 approves extraction, materialise pinned ordinary-file copies into one representative SDK v1 server and `mcp-git-audit` on SDK v2. Each consumer records the selected source revision, hashes, supported interface, configuration inputs, and prohibition on local edits.

**Why it is justified.** Two deliberately different consumers test whether the kit is genuinely SDK-neutral and whether controlled copies preserve independent builds. A pilot avoids prematurely adding MCP-specific materialisation behaviour to `tools-ki`.

**Owner and scope.** The selected shared-source repository owns canonical code and copy identity. Harness owns behavioural conformance. Each pilot MCP owns its adaptation commit and local tests.

**Deliverables.** Two consumer adoptions, conformance results, drift detection, and a short assessment of update effort and failure modes.

**Completion gate.** Both consumers build without runtime dependency on another KI repository, pass their own tests and MCP-2, and detect deliberate local drift.

**Dependency.** MCP-4. It may follow OAI-1 so the later rollout has eight consumers rather than nine.

### MCP-6 - Decide materialisation ownership

**What it is.** After the pilot, decide whether sync and verification remain source-local or become generic mechanics executed through `ki repo conform` and `ki repo audit`.

**Why it is justified.** `tools-ki` owns generic host mechanics, but it should not gain MCP-specific layout knowledge simply because it can write files. The pilot provides the missing evidence: whether materialisation is reusable host behaviour or still an MCP-specific experiment.

**Owner and scope.** The selected source owner defines canonical content and copy identity. Harness defines behavioural conformance. `tools-ki` owns any approved generic execution, transactions, and reporting.

**Deliverables.** An in-place update to the relevant existing ownership records, plus either a retained source-local mechanism or a narrowly generic `ki` operation.

**Completion gate.** The chosen owner follows the Harness/CLI seam from FND-5, supports offline and pinned operation, and does not introduce a public registry or hidden cross-repository runtime dependency.

**Dependency.** MCP-5.

### MCP-7 - Adopt any approved kit across remaining MCPs

**What it is.** If MCP-4 approves extraction and MCP-5 proves the pilot, apply the kit to the remaining MCP consumers one repository at a time. A temporary mixed state is visible implementation sequencing, not a supported legacy configuration. If MCP-4 retains conformance-only governance, record that no kit adoption is required.

**Why it is justified.** Independent adoption preserves repository acceptance while removing repeated semantic maintenance. Requiring simultaneous adoption would recreate the release coupling the current layout was designed to avoid.

**Owner and scope.** Arcadia owns the shared adoption initiative. Each MCP repository owns its adoption, while the Arcadia record tracks revisions and unresolved consumers.

**Deliverables.** Either one focused consumer commit per repository with green local and conformance tests, updated manifest evidence, and an unresolved-consumer report; or the reviewed conformance-only decision showing that no consumer source adoption is required.

**Completion gate.** Every intended consumer has adopted, explicitly deferred, or rejected the kit with a documented reason, or MCP-4 has accepted the conformance-only outcome. Confirmed security fixes have an adoption deadline and no silent stragglers.

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

**Dependencies.** FND-5. Run after OAI-1 so the inventory reflects the combined registration.

### DIST-1 - Verify immutable tool distribution

**What it is.** Validate that Homebrew formulae and website release updates trace to immutable release inputs and that current installation and upgrade remain testable for `ki`, `mgit`, `rig`, and Git Almanac.

**Why it is justified.** Source repository and distribution unit are deliberately separate. That boundary is useful only if a formula can be traced to an immutable artefact and the installed input can be identified.

**Owner and scope.** Each tool owns its release artefact; `homebrew-tap` owns formula acceptance; Website owns its release presentation.

**Deliverables.** Formula provenance checks and representative install and upgrade tests.

**Completion gate.** Each formula resolves to a verifiable immutable input and installs the intended current tool.

**Dependency.** FND-5. This work is independent of the MCP kit.

## Phase 6 - Consolidate every repository with the resulting standards

### ALIGN-1 - Create and complete one local alignment item per repository

`ki-plugins` cannot receive its item until it declares a valid work adapter, stable repository code, and issue ledger. Dotfiles can receive a new conforming item through its existing adapter, but its pre-existing roadmap failures remain separately owned and must not be hidden by ALIGN-1.

**What it is.** Arcadia issues one bounded forward-work item to every repository in the post-merge target estate through that repository's configured work adapter. The common intent is to reconcile the repository with the shared fundamentals routing record, applicable Agentic Harness governance skills, current repository standards, and the repository-local contracts produced by this factorisation work.

Each local item should assess and, where applicable, conform:

- the repository's declared responsibility and incoming or outgoing routes under `GDR-KI-FUNDAMENTALS-001`;
- its `.ki.toml` or `.ki-config.toml` skill declarations and selected work adapter;
- its explicit Project or Knowledge Base declaration, detected structural overlays, replaceable adapters, and estate role without treating one as proof of another;
- the current versions of the applicable Agentic Harness repository, authoring, engineering, Git, decision, trade, and domain-specific skills;
- applicable standards that emerge from the factorisation campaign, without creating a KI-wide specification before V1;
- the repository's Arcadia-owned Agora home or memberships and reciprocal audit state;
- README and decision-record descriptions of authority, product behaviour, projections, distribution, and runtime state;
- the shared fundamentals projection and its canonical-source marker;
- any applicable MCP policy, conformance, or controlled-copy requirements;
- any applicable projection provenance, deployment identity, or distribution checks;
- obsolete local conventions that duplicate or contradict the shared standards; and
- explicit repository-local exceptions with their justification and owner.

The item is an alignment review, not a demand that every repository adopt every skill. Applicability follows the repository's actual role and the fundamentals routing record. Before overall V1, it must not create or require an estate-wide KIP, KIS, schema, or other portable specification.

**Why it is justified.** Shared factorisation logic has value only when each repository can route work consistently and prove that its local governance matches its role. The reviews found stale names, outdated citations, uneven CI pins, missing behavioural checks, and generated copies without provenance. One local item per repository converts the estate-level design into owned, reviewable repository work instead of relying on a central document and assuming adoption.

**Owner and scope.** Arcadia owns the shared alignment initiative, standard checklist, receiving set, and completion view. The Agentic Harness owns the skills and repository standards being applied. Each receiving repository owns its local record, applicability decisions, changes, verification, and acceptance. `tools-ki` may execute generic audits and conformance but does not decide the repository's responsibility.

**Receiving set.** Issue the item to every surviving repository after OAI-1: the 22 Knowledge Islands organisation repositories plus `krisb/dotfiles`. Do not create an item for the retired `mcp-housekeeping-codex`; its relevant obligations move into `mcp-housekeeping-chatgpt`. `tools-techne` and `apps-observatory` are ordinary governed receivers. `ki-plugins` first needs its separately owned work-adapter, repository-code, and issue-ledger repair.

**Deliverables.** One local roadmap or configured-adapter record per repository, a completed applicability checklist, exact changes or justified no-change findings, verification evidence, and an Arcadia roll-up showing every repository's disposition.

**Completion gate.** Every surviving repository is recorded as aligned, aligned with explicit exceptions, or blocked by a named dependency. No repository is silently omitted, no central campaign marks a repository complete on its behalf, and the Arcadia roll-up matches the local records.

**Dependencies.** FND-2 defines the responsibility and routing baseline; FND-3 defines the structural vocabulary and enforceable declarations. Complete each local item only after the standards applicable to that repository have stabilised; MCP repositories therefore follow MCP-7, projection repositories follow PROJ-1, active bindings follow OPS-1, and tool distribution repositories follow DIST-1.

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

## Out of scope before overall V1

- New estate-wide KIPs, KIS documents, schemas, or portable specifications.
- Legacy compatibility, state migration, rollback plans, or dual-running old and new repository structures before V1.
- Publishing shared packages to a public registry.
- Treating an executable MCP product as a Harness capability member, or moving MCP product source into the Harness or `ki-techne-harness`.
- Treating principal authority, product ownership, publication, distribution, runtime binding, or the word “harness” as a third base repository structure.
- Treating a repository, worktree, or visibility setting as runtime security isolation.
- Replacing every existing decision record with a successor solely because the estate vocabulary changed.
- Making `tools-ki` the controller or owner of product-specific MCP behaviour.
- Making the roadmap itself a second authoritative work tracker.
