# Knowledge Islands fundamentals amendment plan

Status: FND-2 preparation for review; no amendment authorised

Campaign: `KI-ARCADIA-GOV-009`

## Outcome

Rewrite `GDR-KI-FUNDAMENTALS-001` in place so it is the shared estate responsibility, routing, and repository-boundary record. Arcadia Principal remains the authoring source. The initial campaign updates the existing six projections; broader post-merge distribution belongs to ALIGN-1 after each receiving repository can accept the record through its own governance.

This plan does not create a successor decision, a portable specification, or an estate-wide implementation authority. It applies the `ki-decision-records` skill's living-record standard: a decision is a concise present-state record, while delivery detail and history remain in roadmap records and Git.

## Why the amendment belongs here

The current record already owns the relationship between Arcadia, Techne Principal, Agentic Harness, `tools-ki`, Specifications, and Website. The proposed change broadens and corrects that same decision: it separates conceptual authority from executable ownership, names the other estate surfaces, supplies repository-boundary presumptions, and defines how Arcadia-originated initiatives route to local owners.

Creating another Decision Record would leave two competing answers to “where does this belong?”. Updating the shared record preserves one durable routing authority while Git retains the earlier state.

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

## Proposed Decision

### Responsibility and routing

The Decision should route work as follows:

- **Arcadia Principal** owns philosophy, the conceptual model, shared estate governance, and the canonical initiative record for estate-wide work.
- **Techne Principal** owns engineering discipline and architecture.
- **Agentic Harness** owns reusable capability semantics, governance standards, shared repository-local MCP controls, and conformance behaviour. It does not own product MCP implementations.
- **`tools-ki`** owns generic repository host mechanics and the public `ki` command grammar.
- **Techne Tools** owns controller and execution-fabric implementation, packaging, deployment, and provider adapters.
- **Each tool or MCP product repository** owns its executable behaviour, provider policy, compatibility, lifecycle state, tests, and release artefact.
- **KI Website** owns public editorial publication without acquiring source authority.
- **KI Plugins** owns generated runtime packaging and projection without acquiring Harness semantics.
- **Homebrew Tap** owns formula acceptance and command-line distribution without acquiring product behaviour.
- **Dotfiles** owns personal environment declarations, binding selection, and runtime registrations.
- **Native providers** own their own mutable native state.
- **KI Specifications** has no active route before overall V1. Activation requires an explicit later decision.

This routing distinguishes who explains a concept, who implements it, who distributes it, and who mutates runtime state. A repository may participate in several routes without those responsibilities collapsing into one authority.

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

### Shared projection

The Decision should name Arcadia's copy as the canonical authoring source and the other copies as exact shared projections under the Harness projector. KB projections may add only the receiver-local `note_type` field.

## Proposed Consequences

The Consequences should make clear that:

- work routes to an executable owner separately from conceptual authority;
- Specifications cannot become a pre-V1 delivery dependency;
- dotfiles and native providers retain different state ownership;
- an Arcadia initiative does not let Arcadia accept work on a receiving repository's behalf;
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

Arcadia's current `ki-trades` declaration does not provide estate-wide work routes. The first campaign should therefore use the repository-local choreography already authorised by the participating repositories and record the resulting local links in the Arcadia campaign. FND-4 should decide whether a broader formal work-route declaration is needed.

## Post-merge extension through ALIGN-1

The later target is the 20 surviving Knowledge Islands repositories plus `krisb/dotfiles`. Do not install the amended projection in the retiring `mcp-housekeeping-codex` repository.

Beyond the initial six:

- nine surviving repositories already have Decision Record collections and can receive the shared record through local alignment: WhatsApp, Git Audit, Google Workspace, Claude housekeeping, KI KB filesystem, Notion mirror, Microsoft 365, Git Almanac, and Rig;
- dotfiles also has a conforming Decision Record collection and can carry the normal projection;
- Homebrew Tap, KI Plugins, Techne Tools, and `tools-mgit` need a local Decision Records collection before accepting a shared foreign-scope record; and
- the renamed OpenAI housekeeping repository inherits ChatGPT's skill declaration but needs its collection established as part of its post-merge alignment.

KI Plugins additionally needs a valid work adapter, stable repository code, and issue ledger before any local item can be issued. Any pointer instead of a full projection is an explicit repository-contract exception; it is not inferred from missing infrastructure.

## Review decisions required

Before implementation, review and approve:

- the proposed responsibility wording and whether Techne Tools' packaging/deployment wording is at the right altitude;
- the six-copy initial receiving set;
- present-state date handling and the absence of amendment history;
- the Arcadia source statement and local index-gloss approach;
- the R1/R2/R3 wording and explicit-exception rule; and
- creation of the separate implementation record and five receiver-owned work records.
