# Brief: Knowledge Islands estate factorisation review

Status: open review brief

Prepared: 2026-09-19

Updated: 2026-09-20

## Review protocol

Review the whole Knowledge Islands estate independently. Do not treat the current repository layout, the six-authority model, or the options in this brief as conclusions that must be preserved.

Save each response beside this brief as:

```text
knowledge-islands-factorisation-brief-review-<model>.md
```

Use a lowercase, hyphenated model identifier, for example `gpt-6-astra`. Keep one model's response in each file. State the model, review date, evidence inspected, assumptions, and material uncertainties at the top. A later synthesis should be saved as `knowledge-islands-factorisation-brief-review-consolidated.md`; reviewers should not read that synthesis or one another's responses before completing an independent pass.

## Maintainer direction after the initial reviews

The following constraints were confirmed on 2026-09-20 and should govern subsequent synthesis:

- Consolidate `mcp-housekeeping-chatgpt` and `mcp-housekeeping-codex` into one OpenAI-family MCP capable of serving both ChatGPT and Codex on the same machine. The current preferred name is `mcp-housekeeping-openai`, with separate ChatGPT and Codex adapters. Keep the combined repository private during the merge; visibility can be reviewed independently afterwards.
- Do not create estate-wide KIPs, KIS documents, schemas, or comparable portable specifications before Knowledge Islands reaches overall V1. Use repository-local decisions, contracts, tests, and compatibility evidence in the meantime. `ki-specifications` is not an active delivery target for this factorisation work.

These are maintainer constraints, not conclusions inferred by a reviewing model. Preserve the independent reviews as originally written where they predate this direction.

## The question

Does Knowledge Islands have the right factorisation across ideas, authority, executable behaviour, source repositories, release and installation units, projections, and runtime or security boundaries?

Recommend a target structure for the estate, not merely a tidier repository list. Challenge the framing where the evidence warrants it and give a clear recommendation rather than only surveying possibilities.

The original prompt considered duplication across MCP repositories. That remains an important worked case, especially for security controls, but it is now one test of the wider operating model.

## Outcomes we want

The target should support:

- a coherent path from learning and decisions through repository-local contracts, implementation, verification, publication, and operational use;
- one intelligible authority for each concept, contract, executable behaviour, and mutable state;
- independently understandable and replaceable parts without unnecessary cross-repository ceremony;
- explicit dependency and projection directions, with generated or vendored copies attributable to their source;
- replaceable providers, runtimes, and execution tiers without silently moving policy ownership;
- a maintenance burden one person working with agents can sustain indefinitely;
- security boundaries based on permissions and isolation, not repository layout alone; and
- enough concurrency for agentic work without treating every operational convenience as an architectural law.

Repository count is not itself the objective. Fewer repositories can increase coupling and larger blast radii; more repositories can increase drift and coordination cost.

## Separate the decisions

Reviewers must distinguish these five decisions. They may align in a particular case, but should not be presumed identical:

1. **Conceptual or normative authority:** where a principle, engineering practice, portable contract, or public claim becomes canonical.
2. **Executable ownership:** which product owns behaviour, policy enforcement, lifecycle state, and compatibility.
3. **Source organisation:** which code and documents share a Git repository, history, governance contract, and review boundary.
4. **Distribution and installation:** what is versioned, released, installed, projected, or deployed together.
5. **Runtime and security:** what shares credentials, permissions, process lifetime, network access, failure domain, and isolation tier.

Also distinguish membership and routing from ownership. An Agora home can coordinate members without becoming the authority for all member behaviour.

## Verified estate baseline

The review set contains 22 repositories:

- 21 repositories in the `knowledgeislands` GitHub organisation; and
- `krisb/dotfiles`, an external-organisation operational dependency declared in the `ki-all` and `ki-fnd` Agoras and commonly checked out as `chezmoi`.

The Agentic Harness owns the `ki-all`, `ki-fnd`, and `ki-mcps` Agora homes. Agora membership describes a reciprocal working relationship; it does not transfer authority to the home.

A local `worktrees/` directory is a checkout mechanism, not another product or repository in the factorisation model.

### Six currently declared authorities

`GDR-KI-FUNDAMENTALS-001` currently assigns six primary authorities. Reviewers should evaluate this model rather than assume it is complete or correct.

- `ki-arcadia-principal` owns the philosophy and conceptual model of Knowledge Islands.
- `ki-techne-principal` owns engineering discipline and architecture.
- `ki-agentic-harness` owns reusable agent capabilities and compatible harness semantics, including skills, agents, hooks, MCP semantics, and evaluations. It does not own the public `ki` executable or originate normative portable contracts.
- `tools-ki` owns the `ki` executable platform: installation, inventory, activation, repository resolution, registered native operations, reports, migrations, and public command grammar.
- `ki-specifications` is the declared future home for normative portable contracts such as KIPs, KIS documents, and schemas. It is not an active delivery surface before overall V1 and should receive no factorisation output from this review.
- `ki-website` owns the autonomous public publication layer. It vendors source-labelled material but does not acquire the source's authority.

Cross-repository work is currently treated as choreography rather than central orchestration: each receiving repository owns its priority, plan, execution, and commit history.

## Repository inventory

The descriptions below are a starting map, not a claim that every present boundary is justified.

### Principal, contract, harness, CLI, and publication repositories

- `ki-arcadia-principal`: canonical living knowledge base for philosophy, model, governance reasoning, and knowledge practice. Its historical material also records older boundary choices.
- `ki-techne-principal`: canonical engineering island for architecture, engineering practice, and the execution-fabric model.
- `ki-agentic-harness`: canonical source for reusable skills, agents, hooks, evaluations, and compatible harness semantics. It installs or projects capabilities into host environments.
- `tools-ki`: source and release home of the `ki` CLI and the executable repository platform.
- `ki-specifications`: reserved standards and governance layer for future portable contracts. It remains outside current delivery until overall V1.
- `ki-website`: independently deployable public presentation of selected, source-labelled Knowledge Islands material.

### Product and general tool repositories

- `ki-techne-harness`: Bun/Turborepo product monorepo for personal-controller and execution-fabric tooling, including controller, bootstrap, Kubernetes resources, AWS proof infrastructure, and operational scripts. Techne Principal retains architecture authority; Techne Harness owns implementation, verification, packaging, bootstrap, deployment, and provider adapters.
- `tools-mgit`: shell CLI for running commands across multiple Git repositories.
- `tools-rig`: declarative working-setup catalogue and provider materialisation tool. It defers native manifests and state to systems such as Homebrew and chezmoi.
- `tools-git-almanac`: local Git history inspection and reporting CLI.

Techne Harness is direct evidence that the estate does not require one package or executable per repository.

### MCP server repositories

- `mcp-m365`: Microsoft 365 adapter for Outlook, OneDrive, and related Microsoft Graph services.
- `mcp-gsuite`: Google workspace adapter, principally Drive and Sheets.
- `mcp-git-audit`: Git estate inspection with narrowly controlled remote mutation operations.
- `mcp-ki-kb-fs`: path-confined filesystem access to named knowledge bases.
- `mcp-ki-kb-notion-mirror`: Markdown-to-Notion mirror with source-note URL updates.
- `mcp-acquire-whatsapp`: faithful, read-only WhatsApp acquisition adapter with inspectable filesystem checkpoints.
- `mcp-housekeeping-claude`: inspection of Claude Desktop, Cowork, Claude Code, and related local state.
- `mcp-housekeeping-chatgpt`: inspection of ChatGPT local state.
- `mcp-housekeeping-codex`: inspection of Codex local state.

`mcp-housekeeping-chatgpt`, `mcp-housekeeping-codex`, and `mcp-acquire-whatsapp` are private at the time of review. `mcp-housekeeping-claude` is public. Visibility remains a separate decision from product consolidation.

### Projection, distribution, and user-environment repositories

- `ki-plugins`: generated, lossy Cowork and Claude plugin marketplace projection of Agentic Harness skills and agents. It is not an independent content authority. MCPs are omitted because of current runtime-portability constraints.
- `homebrew-tap`: Homebrew formula delivery for separately versioned command-line tools. It is a distribution repository, not a primary authority.
- `krisb/dotfiles`: user and machine environment projection and binding outside the Knowledge Islands organisation. It selects and registers compatible payloads but should not silently become their semantic source.

Installed harness state, MCPorter configuration, runtime plugin projections, controller task environments, cloud infrastructure, and local working copies are also part of the operational system. Treat them as deployments, dependencies, or projections unless evidence justifies a new canonical authority.

## Existing execution and projection directions

The intended broad flow is:

```text
Arcadia concepts -----> Techne engineering -----> implementation evidence
       |                       |                         |
       +-----------------------+---------------------> Specifications

Harness capability source -----> installed host capabilities
          |                     -> ki-plugins projection
          |                     -> compatible MCP and hook behaviour
          +<-------------------- tools-ki host mechanics

tools and MCP source -----------> local builds, tags, or archives
          |                     -> Homebrew or MCPorter installation
          +---------------------> runtime processes and task environments

selected authoritative material -> Website publication
environment declarations --------> dotfiles and provider-specific state
```

This diagram describes observed intent, not a verified absence of overlaps. A good review should replace it with a more precise target map.

## Evidence-backed pressure points

### Arcadia, Techne, and Specifications

The estate needs a crisp test for when a concept becomes engineering practice. Before overall V1, engineering contracts and compatibility evidence remain repository-local rather than becoming normative portable specifications. Some older Arcadia records describe technical execution through the Arcadia Techne pillar, while the newer shared fundamentals decision assigns engineering discipline to Techne Principal. Historical context must remain readable without appearing to be current authority.

Routine implementation should not require ceremonial edits across all six authority repositories. Evidence that may eventually justify a portable contract should be retained locally for reconsideration at overall V1.

### Agentic Harness and `tools-ki`

The Harness owns reusable capability semantics while `tools-ki` owns public CLI mechanics and registered native operations. Native harness operations can execute inside the CLI process, so separate repositories do not make compatibility, release, or trust concerns independent.

Review who owns runnable rubric behaviour, compatibility negotiation, capability installation, host-specific mechanics, and failures that cross the boundary.

### Techne Harness and `tools-ki`

Techne Harness owns the personal controller implementation; Techne Principal describes a controller that owns identity, policy, credential brokerage, lifecycle, and result integration while allowing runtimes, task environments, bootstrap, and execution tiers to vary.

Review who owns admission, work identity, authoritative lifecycle state, result integration, retries, leases, execution evidence, and cleanup. Do not move controller architecture into `ki` merely because `ki` already exposes work commands.

### Rig, `ki`, dotfiles, and controller bootstrap

Several systems can plausibly claim to "bootstrap" a machine, repository, controller, or runtime. Assign one owner for each declaration and write target. Distinguish catalogue intent, repository activation, user-environment projection, application bootstrap, infrastructure deployment, and mutable provider state.

### Skills, MCPs, and application logic

Acquisition already has a declared division: Arcadia owns the knowledge lifecycle; skills guide the procedure; source MCP adapters perform faithful reads and checkpoints; and `tools-ki` performs repository-context import. Test whether current packaging and any proposed sharing preserve that division.

### Source authority and copies

The estate uses several kinds of copies: generated projections, source-labelled publication copies, installed skills, shared decision projections, configuration, and possible vendored modules. Classify each as faithful or lossy, version-pinned or floating, independently editable or prohibited from editing, and checked or unchecked for staleness.

`ki-plugins/README.md` currently cites `ADR-KI-HARNESS-005` for its projection relationship, while the current source-versus-projection record is `ADR-KI-HARNESS-002`. This is a small but concrete example of cross-repository documentation drift.

### Governance coverage

The Harness governance-boundary matrix concludes that its four classes have no duplicate owner, but the matrix predates or omits Techne engineering and controller or execution-fabric concerns. Treat that conclusion as scoped evidence, not estate-wide proof.

### Housekeeping products

Provider names alone neither prove one product nor justify three products. Compare user outcome, schemas, permissions, lifecycle, dependency changes, release cadence, and compatibility. Claude still includes legacy housekeeping operations, while acquisition adapters have a faithful read-only contract.

## The MCP duplication case

Nine MCP repositories each contain local variants of common scaffolding. A prior inspection found:

| File | Copies | Distinct contents | Approximate size |
| --- | ---: | ---: | ---: |
| `src/utils/audit-log.ts` | 9 | 9 | 175 to 217 lines |
| `src/utils/annotations.ts` | 9 | 9 | 12 to 80 lines |
| `src/utils/access-level.ts` | 9 | 5 | 52 to 64 lines |
| `src/config/index.ts` | 9 | 9 | 63 to 219 lines |

The evidence needs careful interpretation:

- `access-level.ts` appeared to share one implementation with mostly comment and import differences, but hash divergence alone does not establish different behaviour.
- `audit-log.ts` shared an export surface while varying server identity, redaction fields, and log-rotation details. Those differences may be policy, configuration, or accidental drift.
- `annotations.ts` described a canonical preset set but hand-copied subsets into repositories.
- `config/index.ts` was mostly server-specific apart from the access type and rank map.
- `mcp-git-audit` uses `@modelcontextprotocol/server@2.0.0`; eight others were observed on `@modelcontextprotocol/sdk@^1.30.0`. This proves version divergence, not by itself a failed estate-wide migration.

Ask for behavioural and contract tests before equating byte identity with correctness. Security-sensitive behaviour such as access gating, annotation semantics, and audit redaction should have one authoritative definition or a demonstrably equivalent conformance contract.

Each MCP currently builds locally and runs without an internal published package dependency. That reduces shared release coupling and is a defensible property, but duplicated controls can drift silently.

The Agentic Harness has an empty `mcp/` shelf whose README records possible future Bun workspace consolidation. It is an option, not an approved decision or proof that the Harness should own all MCP source.

`ADR-KI-HARNESS-SKILLS-012` supplies a precedent for vendoring self-contained compile-time skill modules through `ki-shared-modules` and `ki-shared-dependencies`. It explicitly is not a general shared runtime-library design.

## Structural option families

Evaluate at least these families consistently. Hybrid answers are welcome, but name the governing rule rather than choosing boundaries ad hoc.

### Retain repository boundaries and strengthen contracts

Keep independent sources and releases while adding shared behavioural specifications, conformance suites, compatibility matrices, and drift reporting. Accept some implementation duplication where it buys useful independence.

### Canonical source with vendored copies

Choose an authority for selected modules, inject explicit server configuration, vendor ordinary local copies, and fail audits when generated or vendored content drifts. Avoid runtime dependency resolution, but define promotion, override, rollback, and provenance rules.

### Version-pinned shared source dependency

Consume a shared package by Git ref or another reversible private mechanism. This creates a true source owner and explicit consumer versions without public registry publication, but adds tagging, update, and compatibility work.

### Selective product consolidation

Merge only repositories that represent one product with aligned users, permissions, schemas, cadence, and lifecycle. The ChatGPT and Codex adapters are now a confirmed consolidation target under `mcp-housekeeping-openai`; `mcp-housekeeping-claude` remains separate.

### Broader monorepo consolidation

Consider an MCP workspace, a Harness workspace, Techne Harness, or another product home. Explain authority, subtree governance, release units, visibility, permissions, CI scope, and worktree practices. Do not assume a monorepo implies one release or one active writer.

### Reduce or rebuild projections

Keep generated or publication repositories only where their independent deployment, permissions, discovery, or host requirements justify them. Require deterministic rebuilds and provenance where possible; archive projections that no longer serve a distinct runtime.

## Constraints and corrections

Any recommendation must engage with these constraints, but may challenge their implications:

1. **No public package registry by default.** Public publication is effectively irreversible, adds account and credential administration, inserts a third party into builds, and can imply an unwanted support posture. Vendoring, Git refs, workspaces, release assets, and local paths remain available. This preference does not mean no shared dependency, release discipline, or external service is permitted.
2. **Shared-tree safety matters.** The current practice normally allows one writer per working tree. This is collision avoidance, not a security boundary or an argument that a repository can have only one concurrent writer. Separate worktrees allow parallel work in one repository.
3. **Per-repository governance exists.** Each repository declares its contract in `.ki.toml` or `.ki-config.toml` and can be audited with `ki repo audit`. Consolidation must provide an honest replacement for differing subtree concerns rather than erasing them.
4. **Distribution units can differ from source units.** Homebrew currently expects per-tool versioned archives. Scoped tags, larger archives, or changed formula construction have costs to assess; they do not make consolidation impossible.
5. **Runtime isolation is a separate design.** `ADR-TECHNE-001` distinguishes attached interactive, persistent supervised, and unattended isolated execution. Git repositories and worktrees do not provide runtime or credential isolation.
6. **Authority history must survive.** Refactoring should preserve decision provenance and distinguish superseded historical structures from current authority.
7. **Generated projections are not canonical.** A projection may be independently deployed without gaining authority over its source material.
8. **Private and host-local components need explicit treatment.** Filesystem access, personal data, secrets, visibility, and provider permissions may justify boundaries that source reuse alone would not.
9. **Do not assume repository count is bad.** Justify each keep, merge, split, move, generation, or archive decision with operational consequences.
10. **No estate-wide specifications before overall V1.** Keep contracts, decisions, tests, and compatibility evidence in their owning implementation or governance repository. Do not propose new KIPs, KIS documents, or portable schemas as part of this work.

## Change scenarios the target must survive

Work each scenario through the proposed target. Name every authoritative edit, generated output, implementation change, test, release or install effect, approval boundary, and rollback point.

1. Add a new acquisition provider and import its faithful source material into a knowledge base.
2. Change an access-control or audit-redaction invariant used by every MCP.
3. Add a runtime adapter for an existing harness capability without changing its portable semantics.
4. Evolve a shared behaviour through repository-local contracts and compatibility evidence without creating an estate-wide specification.
5. Run controller work unattended with isolated credentials, retries, leases, evidence, and cleanup.
6. Publish a revised Knowledge Islands concept to the website and update any host projections.
7. Change a tool's release shape while preserving Homebrew installation and rollback.
8. Retire a provider or projection without losing source history or leaving stale installed state.

If a scenario needs edits in many repositories, explain whether that is meaningful separation of authority or incidental coordination overhead.

## Questions to answer

1. Is the six-authority model coherent and complete? If not, which authority should be added, removed, narrowed, or combined?
2. What principle should determine a repository boundary in this estate: authority, product, trust, visibility, release cadence, runtime, or something else?
3. Which present repositories should be kept, merged, split, moved, generated, or archived? Name every disposition.
4. Where should shared MCP security and protocol behaviour be authoritative, and how should consumers prove conformance?
5. Should MCPs stay independent, form one or more product workspaces, live in the Harness, live in Techne Harness, or use another structure?
6. Where exactly is the boundary between Harness capability semantics and `tools-ki` host mechanics?
7. Where exactly is the boundary between `tools-ki` work operations and the Techne Harness controller?
8. Are `tools-mgit` and `tools-rig` genuinely foundational members, general utilities, or candidates for another home?
9. Can `ki-plugins`, website material, installed harness state, shared decisions, and runtime configuration be rebuilt and checked from their sources? Which copies may be edited?
10. Is dotfiles an estate authority, an operational projection, or an external consumer? What does each answer change?
11. Which boundaries are justified by private data, credentials, visibility, or failure containment rather than code organisation?
12. What changes when MCP, tool, provider, and agent counts double?
13. What should remain deliberately duplicated, and what evidence makes that independence real?
14. Which existing decisions or documentation should be superseded if the recommendation is adopted?
15. What important question is still missing from this brief?

## Required response

Return a decision-ready review with these sections:

1. **Executive recommendation:** the target operating model and the few most important changes.
2. **Facts, assumptions, and uncertainties:** separate verified evidence from inference and state missing evidence.
3. **Target authority and ownership matrix:** one owner for each concept, contract, executable behaviour, mutable state, and projection.
4. **Target estate map:** source, dependency, build, projection, distribution, deployment, and feedback directions.
5. **Repository-by-repository disposition:** keep, merge into a named home, split, move, generate, or archive for all 22 repositories.
6. **Worked scenarios:** trace the scenarios above through the proposed structure.
7. **Migration:** ordered stages, compatibility plan, reversible checkpoints, rollback, and how normal work continues during transition.
8. **Costs and risks:** measurable maintenance, release, CI, security, migration, discoverability, and concurrency consequences.
9. **Rejected alternatives:** strongest competing design and why it loses.
10. **Decision reversers:** evidence or scale thresholds that would change the recommendation.

Give a concrete no-change or minimal-change baseline so the proposed restructuring can be compared with the cost of tightening the present model. Prefer explicit contracts and tests over aesthetic symmetry.

## Evidence starting points

Reviewers should inspect current source rather than rely only on this summary. Useful starting points include:

- `ki-arcadia-principal/Admin/Governance/Decisions/GDR-KI-FUNDAMENTALS-001-knowledge-islands-ecosystem-fundamentals.md`
- `ki-techne-principal/Admin/Governance/Decisions/ADR-TECHNE-001-provider-neutral-isolated-agent-execution.md`
- `ki-agentic-harness/docs/decisions/references/governance-boundary-matrix.md`
- `ki-agentic-harness/docs/decisions/ADR-KI-HARNESS-SKILLS-007-provider-neutral-ai-session-acquisition-and-adapter-pairing.md`
- `ki-agentic-harness/docs/decisions/ADR-KI-HARNESS-SKILLS-012-local-copies-for-shared-modules.md`
- `ki-agentic-harness/mcp/README.md`
- `ki-techne-harness/README.md`
- `ki-specifications/README.md`
- `ki-plugins/README.md`
- the `.ki.toml` or `.ki-config.toml` declarations and README in every repository;
- `ki agora show ki-all`, `ki agora show ki-fnd`, and `ki agora show ki-mcps`; and
- the common MCP files and dependency manifests described above.

Where evidence conflicts, identify the conflict and say which source should be authoritative. Do not silently reconcile incompatible records.
