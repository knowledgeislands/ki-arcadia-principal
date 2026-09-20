# Knowledge Islands fundamentals amendment plan

Status: FND-2 preparation for review; no amendment authorised

Campaign: `KI-ARCADIA-GOV-009`

## Outcome

Rewrite `GDR-KI-FUNDAMENTALS-001` in place so it is the shared estate responsibility, routing, and repository-boundary record. Arcadia Principal remains the authoring source. The initial campaign updates the existing six projections; broader post-merge distribution belongs to ALIGN-1 after each receiving repository can accept the record through its own governance.

This plan does not create a successor decision, a portable specification, or an estate-wide implementation authority. It applies the `ki-decision-records` skill's living-record standard: a decision is a concise present-state record, while delivery detail and history remain in roadmap records and Git.

## Why the amendment belongs here

The current record already owns the relationship between Arcadia, Techne Principal, Agentic Harness, `tools-ki`, Specifications, and Website. The proposed change broadens and corrects that same decision: it separates conceptual authority from executable ownership, names the other estate surfaces, supplies repository-boundary presumptions, and defines how Arcadia-originated initiatives route to local owners.

Creating another Decision Record would leave two competing answers to “where does this belong?”. Updating the shared record preserves one durable routing authority while Git retains the earlier state.

## Resolved Harness and MCP boundary

Executable MCP servers are products, not Agentic Harness capability members. Their source, schemas, provider policy, trust boundary, build, release, and lifecycle remain in independently governed `mcp-*` repositories. The Harness contains no MCP server implementation today: its `mcp/` path is an empty shelf, the installed payload excludes MCP products, and the current host recognises only `skill` as a published capability kind.

The Harness continues to publish reusable capabilities that govern or support MCP products: the `ki-repo-mcp` standard and rubric, binding semantics, token policy, and black-box conformance assets. An MCP repository continues to declare the Harness so those skills resolve; that dependency does not make its product a Harness member.

The empty MCP shelf and five-part Harness-source claim should be removed through receiver-owned Harness work. Shared production-library code is not placed in the Harness by default. MCP-3 must first show that conformance alone is insufficient and that a separately governed shared source satisfies R1 or R2.

Arcadia becomes the home of `ki-all`, `ki-fnd`, and `ki-mcps` because they are estate coordination Agoras. Membership expresses reciprocal participation in a working set; it transfers no source, product, release, priority, implementation, or acceptance authority. Rehome the MCP group after OAI-1 so the retiring Codex repository is never repointed.

### Harness receiver change

The later Harness-owned implementation record should amend the current surfaces in place rather than add successor decisions or compatibility aliases:

- `SDR-KI-HARNESS-001` and `ADR-KI-HARNESS-001` clarify the four source shelves: skills, subagents, evals, and hooks;
- `ADR-KI-HARNESS-002` and the compatible-Harness publication decision remove MCP products from the future Harness capability and projection model;
- the Harness README, `.ki.toml` description, `package.json` description, orientation, repository specification, and `ki-repo-harness` standard use the same boundary;
- the `ki-repo-harness` rubric, `HARNESS_PARTS` implementation, tests, exemplars, and generated publications enforce the four-shelf source layout;
- the empty `mcp/README.md` and directory are removed;
- `KI-HARNESS-RTP-002` is rerouted to the product, binding, and distribution owners rather than treating reachability as a Harness product responsibility; and
- KI Plugins is regenerated so its projection no longer describes MCP products as a deferred Harness shelf.

The change must retain `ki-repo-mcp`, the binding skills, MCP behavioural evals, and the declarations through which MCP repositories consume Harness governance. Removing those would confuse “not a Harness product” with “not governed by Harness capabilities”.

## Decision-record constraints

The amendment must:

- retain ID `GDR-KI-FUNDAMENTALS-001`, title, `status: current`, decision type, and `shared_record: true`;
- advance `date` to the delivery date because the field is the record's current as-of date;
- rewrite Context, Decision, and Consequences in present tense as if authored today;
- contain no amendment history, changelog, supersession chain, roadmap state, or TODO;
- keep decision-owned frontmatter and the complete body identical under the Harness projector;
- allow only the existing KB `note_type` as receiver-local frontmatter; and
- identify Arcadia as the canonical authoring source in shared prose and local index glosses, not through an unknown `canonical` field.

## Initial projection set

FND-2 should update these six current projections in one coordinated campaign:

- Arcadia Principal: `Admin/Governance/Decisions/GDR-KI-FUNDAMENTALS-001-knowledge-islands-ecosystem-fundamentals.md`;
- Techne Principal: `Admin/Governance/Decisions/GDR-KI-FUNDAMENTALS-001-knowledge-islands-ecosystem-fundamentals.md`;
- Agentic Harness: `docs/decisions/GDR-KI-FUNDAMENTALS-001-knowledge-islands-ecosystem-fundamentals.md`;
- `tools-ki`: `docs/decisions/GDR-KI-FUNDAMENTALS-001-knowledge-islands-ecosystem-fundamentals.md`;
- KI Specifications: `docs/decisions/GDR-KI-FUNDAMENTALS-001-knowledge-islands-ecosystem-fundamentals.md`; and
- KI Website: `docs/decisions/GDR-KI-FUNDAMENTALS-001-knowledge-islands-ecosystem-fundamentals.md`.

Their current official projection hash is:

```text
2a3ecbc42fc0931dd8360bf6f662872e2dadf31433515ffb86d16cfa8c6bd0b6
```

The implementation review packet should record the replacement hash and every accepted receiver revision.

## Proposed Context

The Context should explain that one repository boundary currently carries several dimensions which must be assessed separately:

- conceptual or normative authority;
- executable ownership;
- source organisation;
- distribution; and
- runtime security and mutable state.

It should state that conceptual authority alone does not require a separate source repository. It should also state that KI Specifications is dormant for portable contracts before overall V1, so no current work may treat a new KIP, KIS, schema, or conformance contract as a prerequisite.

The final wording should organise those concerns into five independent factorisation dimensions:

1. repository structure;
2. authority and responsibility, with conceptual authority distinct from executable and source ownership;
3. projection and distribution;
4. runtime binding and mutable state; and
5. repository-boundary justification.

A change in one dimension must not imply a change in another.

## Proposed Decision

### Responsibility and routing

The Decision should route work as follows:

- **Arcadia Principal** owns philosophy, the conceptual model, shared estate governance, the canonical initiative record for estate-wide work, and the estate coordination Agoras.
- **Techne Principal** owns engineering discipline and architecture.
- **Agentic Harness** owns the reusable agent-facing capabilities it publishes, together with generic MCP governance, binding semantics, token policy, and black-box conformance assets. It does not own executable MCP products or server source merely because it governs or tests them.
- **Repository structure standards** are reusable Agentic Harness governance capabilities; each repository owns its local declarations, implementation, conformance, and accepted exceptions.
- **`tools-ki`** owns generic repository host mechanics and the public `ki` command grammar.
- **`ki-techne-tools`** owns the Techne execution-harness applications, controller and execution-fabric implementation, runtime packaging, deployment, and provider adapters.
- **`tools-techne`** owns the independently released Techne operator CLI once its source and KI repository contract are established; until then it is a reserved target, not a governed authority.
- **Each tool or MCP product repository** owns its executable source, product behaviour, provider policy, schemas, trust boundary, compatibility, tests, build identity, release artefact, and lifecycle state.
- **KI Website** owns public editorial publication without acquiring source authority.
- **KI Plugins** owns generated runtime packaging and projection without acquiring Harness semantics.
- **Homebrew Tap** owns formula acceptance and command-line distribution without acquiring product behaviour.
- **Dotfiles** owns personal environment declarations, binding selection, and runtime registrations.
- **Native providers** own their own mutable native state.
- **KI Specifications** has no active route before overall V1. Activation requires an explicit later decision.

This routing distinguishes who explains a concept, who implements it, who distributes it, and who mutates runtime state. A repository may participate in several routes without those responsibilities collapsing into one authority.

### Repository structure and estate roles

The Decision should establish two mutually exclusive base structures: Project and Knowledge Base. Structural overlays are composable repository-local shapes declared by specialised `ki-repo-*` skills. Adapters are replaceable implementation, hosting, provider, runtime, or work-tracker bindings. Estate roles are concern-scoped authority and routing responsibilities established by this Decision.

These categories must not substitute for one another:

- a base structure or overlay is not authority proof;
- a principal-KB overlay is not the source of Arcadia or Techne's authority;
- the compatible agentic-Harness overlay does not own every product that consumes Harness governance;
- the Techne execution harness is a product role in `ki-techne-tools`, not the compatible agentic-Harness structure;
- MCP product, standalone CLI, Website, plugin, Homebrew, Specifications, and chezmoi shapes remain overlays on a Project base; and
- `ki-engineering` and code presence are cross-cutting implementation concerns, not another base structure.

The target register should cover all 22 post-OpenAI repositories: two principal Knowledge Bases; the agentic Harness; eight MCP products; five standalone CLI repositories including `tools-techne`; `ki-techne-tools`; Website; Plugins; Homebrew; Specifications; and dotfiles. `tools-techne` remains explicitly pending until its source and universal repository contract exist. No reusable execution-harness overlay should be invented for the single `ki-techne-tools` case.

The enforceable V0.x repository standard should make `repo_type = "project" | "kb"` explicit, with exactly one matching primary structure declaration. That mechanical change remains receiver-owned Harness and repository alignment work rather than Decision Record implementation detail.

### Repository-boundary presumptions

The Decision should establish three strong presumptions:

- **R1 — independent acceptance and release.** The content is accepted, versioned, and consumed as its own unit.
- **R2 — distinct trust boundary.** Visibility, licence, credentials, personal data, or failure containment differ materially.
- **R3 — host mandate.** A consuming platform requires a distinct repository, root layout, or deployment location.

R1, R2, and R3 are not an exhaustive mechanical test. Independent governance, audience, change coupling, cognitive scope, or historical continuity may justify a recorded exception. Conceptual authority alone does not establish a repository boundary.

### Estate-wide initiatives

The Decision should state that Arcadia originates and tracks estate-wide initiatives. Its initiative record names:

- the shared outcome;
- exact participating repositories;
- the route to each owner;
- evidence and current disposition; and
- the completion condition.

Every receiving repository retains ownership of its local work record, implementation, verification, commit, and acceptance. Arcadia's campaign role is directional governance and completion tracking, not central implementation authority.

The estate Agoras are Arcadia-owned coordination declarations. A member independently consents to participation, and membership grants no source ownership, product membership, priority, work-routing, release, or acceptance authority.

### Shared projection

The Decision should name Arcadia's copy as the canonical authoring source and the other copies as exact shared projections under the Harness projector. KB projections may add only the receiver-local `note_type` field.

## Proposed Consequences

The Consequences should make clear that:

- repository structure, estate role, projection, runtime ownership, and boundary evidence remain independently attributable;
- every governed repository declares one base structure while structural overlays compose without granting authority;
- work routes to an executable owner separately from conceptual authority;
- Specifications cannot become a pre-V1 delivery dependency;
- dotfiles and native providers retain different state ownership;
- an Arcadia initiative does not let Arcadia accept work on a receiving repository's behalf;
- Agora membership coordinates independently governed repositories without making their products Harness capabilities or Arcadia-owned implementations;
- shared MCP production code receives no Harness home by default and is extracted only after behavioural evidence identifies a separately governable unit;
- a repository boundary is retained, created, or reconsidered against R1, R2, R3, and any explicit exception; and
- projections and distribution surfaces remain attributable to their source without becoming parallel authorities.

## Distribution and acceptance sequence

After the amendment text and six-repository receiving set are approved:

1. Create a separate Arcadia implementation record because `KI-ARCADIA-GOV-009` deliberately stops at evidence and planning.
2. Prepare the Arcadia present-state rewrite and its Decisions index gloss.
3. Run the Decision Records, authoring, and KB Streams audits in Arcadia.
4. Produce the official Harness projection hash for the reviewed body.
5. Create receiver-owned local records or direct handoffs in the other five repositories under their configured work adapters.
6. Each receiver installs the exact projection, updates its local index gloss, runs its local audits, and records its accepted revision.
7. Arcadia observes all six accepted revisions and verifies semantic identity fail-closed.
8. Record any receiver blocker explicitly; do not mark the campaign complete on the receiver's behalf.

Arcadia's current `ki-trades` declaration does not provide estate-wide work routes. The first campaign should therefore use the repository-local choreography already authorised by the participating repositories and record the resulting local links in the Arcadia campaign. FND-5 should decide whether a broader formal work-route declaration is needed.

## Post-merge extension through ALIGN-1

The later target is the 21 surviving Knowledge Islands repositories plus `krisb/dotfiles`. Do not install the amended projection in the retiring `mcp-housekeeping-codex` repository.

Beyond the initial six:

- nine surviving repositories already have Decision Record collections and can receive the shared record through local alignment: WhatsApp, Git Audit, Google Workspace, Claude housekeeping, KI KB filesystem, Notion mirror, Microsoft 365, Git Almanac, and Rig;
- dotfiles also has a conforming Decision Record collection and can carry the normal projection;
- Homebrew Tap, KI Plugins, `ki-techne-tools`, and `tools-mgit` need a local Decision Records collection before accepting a shared foreign-scope record; and
- the renamed OpenAI housekeeping repository inherits ChatGPT's skill declaration but needs its collection established as part of its post-merge alignment.

`tools-techne` needs the universal KI repository contract, stable repository code, work adapter, source and release identity, and a Decision Records collection before accepting a projection or ALIGN-1 item.

KI Plugins additionally needs a valid work adapter, stable repository code, and issue ledger before any local item can be issued. Any pointer instead of a full projection is an explicit repository-contract exception; it is not inferred from missing infrastructure.

## Review decisions required

Before implementation, review and approve:

- the five-dimension factorisation model, two-base structure vocabulary, target 22-repository register, and direct V0.x move to explicit `repo_type = "project" | "kb"`;
- the classification of executable MCPs as independently owned products rather than Harness capability members;
- removal of the empty Harness MCP source shelf and rehoming of the three estate Agoras to Arcadia through receiver-owned work;
- the proposed responsibility wording and whether `ki-techne-tools` packaging/deployment wording is at the right altitude;
- the six-copy initial receiving set;
- present-state date handling and the absence of amendment history;
- the Arcadia source statement and local index-gloss approach;
- the R1/R2/R3 wording and explicit-exception rule; and
- creation of the separate implementation record and five receiver-owned work records.
