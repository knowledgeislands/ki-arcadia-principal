# Knowledge Islands factorisation review: GPT-6 Astra

Model: `gpt-6-astra`

Review date: 2026-09-19

Status: independent recommendation, not an adopted decision

Brief: `knowledge-islands-factorisation-brief.md`

Evidence inspected: the brief; Arcadia's shared fundamentals and historical governance records; repository declarations across the 21 Knowledge Islands repositories; Techne Principal, Techne Tools, Rig, Specifications, and Plugins READMEs; the Harness MCP shelf, governance boundary matrix, acquisition and shared-module decisions; the CLI compatible-harness decision; all nine MCP dependency manifests; selected audit-logging implementations; and the dotfiles README.

This was an architectural review, not a complete code, deployment, permission, or security audit.

## 1. Executive recommendation

Keep the current 22 repository boundaries for now. Make ownership and compatibility concrete, remove selected MCP implementation duplication through controlled vendoring, and improve the provenance of projections. There is insufficient evidence that repository consolidation would recover its migration cost.

The existing six-authority model is coherent as a map of concerns but incomplete as an ownership register. Extend the register to recognise product behaviour and deployment state. Techne Tools owns controller implementation; each tool or MCP owns its product behaviour; operators and native providers own deployment-specific state. These do not require additional philosophical authorities or new governance repositories.

Make four changes:

1. Define explicit compatibility and write-ownership contracts for Harness/CLI, CLI/controller, and Rig/dotfiles/bootstrap.
2. Establish a narrow canonical MCP implementation kit in the Harness, initially for access classification, annotation semantics, and audit sanitisation. Vendor pinned, attributable copies into MCP repositories. Keep SDK-specific bindings and provider policy separate.
3. Classify every generated, installed, and published copy by source, transformation, version, editability, and drift check.
4. Measure coordination cost before considering product consolidation. Treat the housekeeping servers as a candidate requiring evidence, not an approved merger.

The no-change baseline is to retain all repositories and add shared behavioural tests, compatibility reporting, and documentation corrections without extracting code. It is cheaper initially. The recommended extraction earns its additional cost only if it removes repeated control changes without widening runtime authority or forcing synchronised releases.

## 2. Facts, assumptions, and uncertainties

The inventory correctly contains 21 Knowledge Islands repositories plus `krisb/dotfiles`. My initial working count of sibling repositories was mistaken; the brief's final count is correct.

The six-authority decision exists. Techne Tools already uses a product monorepo. Plugins is a generated projection. The inspected Specifications README lists both current KIS documents as Draft. Eight MCP manifests use SDK v1 and Git Audit uses v2. That version split alone establishes neither a defect nor a stalled migration.

Current Claude audit sanitisation treats top-level `content` specially and removes URL user information recursively. M365 applies a larger top-level field set. This confirms meaningful implementation variation but does not establish which calls disclose sensitive values. Truncating a serialised argument into a preview is not, by itself, a confidentiality control. Review logging policy before extracting it.

Assumptions: one maintainer remains the principal operator; current deployment and visibility boundaries have practical value; most MCP users consume local builds; and the aim is sustainable personal infrastructure rather than externally supported products.

Missing evidence includes change frequency and co-change history, time spent propagating fixes, actual deployed versions, effective permissions, projection reproducibility, licence compatibility for shared code, consumer usage, incident history, and the cost of existing coordination. GitHub visibility and deployment claims in the brief were not independently reverified. No live credentials, private source payloads, or production state were inspected.

## 3. Target authority and ownership matrix

| Concern | Canonical owner | Boundary |
| --- | --- | --- |
| KI purpose and knowledge lifecycle | Arcadia Principal | Conceptual and governance meaning |
| Engineering architecture and criteria | Techne Principal | Practice and architecture |
| Accepted portable contracts | Specifications | Accepted or Active contracts bind |
| Reusable capability semantics | Agentic Harness | Capability behaviour, adapters, and rubrics |
| Generic capability host and `ki` grammar | `tools-ki` | Resolution, validation, execution, and reporting |
| Controller and execution-fabric implementation | Techne Tools | Admission, attempts, supervision, and integration |
| Individual tool and MCP behaviour | Its implementation repository | Product logic and compatibility |
| Shared MCP control implementation | Harness MCP kit | Generic mechanics only |
| Public editorial prose and routes | Website | Publication does not transfer source authority |
| Personal environment declarations | Dotfiles and private Rig configuration | Local intent, not portable semantics |
| Native installation and runtime state | Relevant provider or deployed application | Explicit writer per state object |
| Generated plugin and publication copies | Named generator/source relationship | Destination has no upstream authority |

The shared MCP kit belongs in the Harness because its proposed contents implement reusable capability mechanics, not because every executable belongs there. Provider-specific redaction metadata, allowed paths, credentials, and tool classifications remain with their servers and deployment declarations. If the kit grows into general application infrastructure, reassess its home.

For work execution, distinguish the repository work record from execution attempts. The chosen repository work adapter owns intended work and review status. The controller owns attempts, leases, retry state, expiry, and cleanup evidence. Its result integration calls the repository's defined operations with recorded authority; it does not maintain a competing authoritative backlog.

Dotfiles is both an external consumer of Knowledge Islands capabilities and the canonical source of personal environment declarations. Calling it merely a projection would erase legitimate local ownership.

## 4. Target estate map

```text
Arcadia concepts -> Techne engineering -> product implementations
        |                 |                    |
        +-----------------+-- evidence --------+-> Specifications
                                                     |
                                      accepted contracts constrain
                                                     |
Harness capabilities + compatibility manifest <-> tools-ki host
        |                         |
        |                         +-> repository work/import operations
        +-> installed payloads
        +-> runtime-specific projections
        +-> generated ki-plugins
        +-> pinned MCP kit copies -> independent MCP builds/processes

Techne Tools controller -> isolated task environments
        |                         |
        +-> leases/attempts       +-> evidence/results
        +-> authorised integration through repository operations

Tool source -> versioned archives -> homebrew-tap -> installations

Rig catalogue + dotfiles source -> provider-specific declarations
                               -> native provider state

Selected canonical material -> attributed website copies -> publication
Operational evidence -> owning repository -> proposed practice/contracts
```

An edge needs a named contract and version only where incompatibility matters. Avoid introducing an estate-wide release train merely to document these relationships.

## 5. Repository-by-repository disposition

| Repository | Disposition |
| --- | --- |
| `ki-arcadia-principal` | Keep; clarify current versus historical engineering authority |
| `ki-techne-principal` | Keep; own architecture, not executable lifecycle state |
| `ki-agentic-harness` | Keep; add a narrow canonical MCP kit and compatibility evidence |
| `tools-ki` | Keep; retain the generic host and repository operations |
| `ki-specifications` | Keep; promote contracts after demonstrated implementation evidence |
| `ki-website` | Keep; make publication provenance and source updates checkable |
| `ki-techne-tools` | Keep the product monorepo; own controller/fabric implementation |
| `tools-mgit` | Keep as a utility; Agora membership need not imply normative foundation |
| `tools-rig` | Keep as a setup product; preserve provider-native authority |
| `tools-git-almanac` | Keep; distinct offline reporting product |
| `mcp-m365` | Keep; consume the kit without sharing credentials or process |
| `mcp-gsuite` | Keep; retain provider-specific scopes and integration behaviour |
| `mcp-git-audit` | Keep; maintain explicit mutation and path controls |
| `mcp-ki-kb-fs` | Keep; preserve filesystem confinement and KB-facing contract |
| `mcp-ki-kb-notion-mirror` | Keep; preserve publication/update transaction semantics |
| `mcp-acquire-whatsapp` | Keep; retain source-specific acquisition and private boundary |
| `mcp-housekeeping-claude` | Keep pending evidence; separate acquisition from legacy mutation |
| `mcp-housekeeping-chatgpt` | Keep pending evidence; preserve provider adaptation |
| `mcp-housekeeping-codex` | Keep pending evidence; preserve provider adaptation |
| `ki-plugins` | Generate and retain while its marketplace/discovery surface is used |
| `homebrew-tap` | Keep as a delivery projection; validate immutable release inputs |
| `krisb/dotfiles` | Keep external; own personal declarations and environment rendering |

No repository should be archived or merged on the present evidence. This does not mean every boundary has been proven optimal.

## 6. Worked scenarios

### Add an acquisition provider

Implement the faithful adapter in its product repository, add a Harness guidance adapter where needed, and add the `tools-ki` import binding. Change Arcadia only if the knowledge lifecycle changes; change Specifications only if a portable contract needs revision. Test faithful reads, provenance, unavailable-source behaviour, and import idempotency. Install the provider explicitly. Source access and destination writes retain their separate authority. Roll back by disabling the binding and reverting the import implementation without deleting acquired provenance.

### Change an MCP access or logging invariant

Change the Harness kit and adversarial behavioural fixtures. Update a portable specification only where an applicable contract exists or standardisation is justified. Vendor the candidate revision into one v1 and the v2 server first, then the remaining consumers. Server policy metadata stays local. Tests must exercise denied calls, registration and invocation, nested sensitive values, error paths, and log output. Deploy each server under its own authority; retain the previous build and vendored revision for rollback. A confirmed security fix needs an explicit adoption deadline and unresolved-consumer report.

### Add a runtime adapter

Add the adapter to the Harness and regenerate only its relevant projections. Test equivalent portable semantics and identify unsupported runtime features explicitly. Update `tools-ki` only if a generic installation or activation capability is missing. Dotfiles selects the new runtime binding. Rollback restores the previous installed adapter and projection manifest.

### Promote a portable contract

Capture implementation evidence, disagreements, and migration examples in Specifications. Review a Draft contract against more than the original implementation before activation. Conforming implementations declare the supported contract version and run its fixtures. Activation follows the Specifications governance process. Rollback preserves the previous contract and records supersession or withdrawal rather than silently rewriting history.

### Run unattended controller work

Techne Tools admits an attempt against a work record, immutable baseline, and bounded authority. It owns lease, retry, and credential lifetime; the environment owns disposable execution state. The agent returns changes and evidence. Integration uses repository operations under the recorded authority and review gate. Test duplicate delivery, expired leases, interrupted cleanup, and conflicting integration. Stop or rollback revokes admission and credentials, preserves evidence, and avoids automatic reversal of already accepted external effects.

### Publish a changed concept

Enact the conceptual change in Arcadia. Website updates its attributed source copy and editorial explanation. Update Techne or Harness only when the change affects their responsibilities; conceptual prose need not trigger every runtime projection. Validate links and provenance, then publish through the Website's deployment authority. Rollback selects the previous publication snapshot; it does not overwrite canonical history.

### Change a tool's release shape

Change the tool's build/archive contract and the matching Homebrew formula. Test installation, upgrade, and rollback from immutable artefacts. Obtain release/publishing authority separately from editing the implementation. Preserve prior artefacts and formula references. Neither Harness nor philosophy changes merely because the archive layout changes.

### Retire a provider or projection

Remove active selection and installation through the owning host or provider, then deprecate its advertised capability. Verify no running consumer still depends on it. Preserve source history and provenance; handle retained personal data under an explicit retention decision. Archive a repository only after these checks. Rollback restores the previous installation and manifest, not an undocumented copy.

## 7. Migration

First record the current ownership and write-target map, deployed versions, and repeatable maintenance costs. Correct stale citations and mark superseded authority descriptions through the appropriate governance process. Continue ordinary product work.

Next establish Harness/CLI compatibility fixtures and controller/work-record state boundaries. Make these additive so existing installations remain valid.

Then pilot the MCP kit with one v1 server and Git Audit v2. Extract only behaviour already understood and tested. Use a manifest recording source revision, files, digest, and supported interface. Keep ordinary local files, an explicit update operation, and deliberate consumer commits. Do not overload the existing compile-time skill-module mechanism without a separate design decision.

After the pilot, migrate remaining consumers incrementally. A pending consumer remains independently buildable. Each migration can revert to its prior local implementation.

Finally inventory projection recipes and drift checks. Review consolidation after several representative cross-cutting changes provide measurable evidence.

Amend the shared fundamentals record only to clarify genuinely shared ownership. Extend the governance boundary matrix to include Techne and controllers. Add a dedicated MCP sharing decision. Preserve the current narrow scope of `ADR-KI-HARNESS-SKILLS-012`. Update stale projection references. Do not supersede unrelated records to achieve documentary symmetry.

## 8. Costs and risks

Track the number of manually edited implementations per invariant change, consumer adoption delay, maintainer and agent time spent on propagation, compatibility failures, projection drift, CI duration, and rollback time.

The kit should reduce nine manual control implementations to one canonical change plus nine reviewed updates. It does not eliminate consumer validation. Its main risk is correlated defects; staged adoption and independent contract tests matter more than source identity.

Keeping repositories retains navigation and update overhead. It preserves current visibility, install, and release boundaries, but those boundaries do not provide runtime isolation. Worktrees provide concurrency; leases and explicit integration authority address conflicting work.

A public Harness cannot absorb private implementation material indiscriminately. Review licence compatibility and sanitise test fixtures before sharing code.

At twice the current scale, automated compatibility and adoption reporting becomes more valuable. Doubling counts alone does not establish that a monorepo is cheaper.

The largest missing question is whether every deployed instance can be identified, updated, and rolled back. Source organisation improvements cannot compensate for unknown running versions.

## 9. Rejected alternatives

An MCP monorepo is the strongest competitor: it makes shared changes atomic and can reduce repeated CI configuration. It loses for now because common change cadence, visibility compatibility, and deployment coupling are unproven. Independent runtime processes would still be necessary.

Moving all MCPs into the Harness confuses reusable mechanics with provider products and would expand its release and maintenance surface substantially.

Moving them into Techne Tools would make the controller product a general infrastructure container without a demonstrated ownership reason.

Merging the three housekeeping repositories immediately assumes that provider-specific acquisition and legacy housekeeping share a product lifecycle. The evidence does not yet support that assumption.

Keeping uncontrolled copies indefinitely preserves build independence but leaves cross-cutting corrections difficult to account for. Controlled duplication is defensible; unattributed drift is not.

## 10. Decision reversers

Choose a product workspace when measured changes repeatedly require simultaneous edits across the same repositories, their permissions and visibility align, and a migration pilot demonstrates lower total maintenance cost.

Choose a dedicated shared-code repository if the MCP kit gains substantial non-Harness consumers or a materially independent release lifecycle.

Prefer a pinned Git dependency over vendoring if propagation repeatedly misses agreed deadlines and dependency installation is demonstrably more reliable than controlled copying.

Merge housekeeping providers if they converge on one user-facing product, contract, permission model, and coordinated release cadence. Keep provider packages and processes separable even then.

Remove a generated repository when its host supports direct source delivery and no independent discovery, deployment, or permission boundary remains.

Revisit the six-authority structure if ordinary changes repeatedly require conceptual approval across several repositories without changing distinct authoritative concerns. That would indicate either duplicated authority or unnecessarily broad change procedures.
