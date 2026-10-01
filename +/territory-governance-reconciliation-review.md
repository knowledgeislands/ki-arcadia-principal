---
note_type: review
status: draft
author: AI-assisted
observed_at: 2026-10-01T19:37:14Z
updated: 2026-10-01T21:54:20Z
---

# Territory governance reconciliation review

## Purpose and authority

This dated review records the evidence behind the territory-first sequence. The human subsequently approved the direction and supervised rollout using lower-cost workers. Current authority and delivered evidence are in [Territory and island governance](../Streams/Roadmap/KI-ARCADIA-MOD-002-island-concepts.md), now awaiting review; this document is not a second execution plan.

The obsolete empty Housekeeping scaffold was removed with Git recovery and the Streams preflight now passes. The governing concept, Charter, Known Lands, strategic decision and Contribution Process have been reconciled. The sections below retain the original proposal and observations as review evidence; consult those canonical sources for current meaning.

Techné knowledge consolidation uses its separate preservation manifest and delivery plan. Its held work, branches, independent implementation products and execution hold remain unchanged by the conceptual delivery. Detailed exchange remains in the harness's [inter-territory intake](https://github.com/knowledgeislands/ki-agentic-harness/blob/main/docs/roadmap/KI-HARNESS-GOV-122-design-inter-territory-exchange.md). The private estate census remains with its owner outside this public repository.

## Proposed principles

### Territories and their Capitals

A territory is a governed collection of islands with one territorial principal. The principal holds the Capital role and maintains the territory's Charter, membership, and shared governance. Repository structure, subject expertise, governance role, and executable product ownership are separate dimensions. A specialist knowledge base can be an island without being another territorial principal. A product repository can be an island without acquiring the Knowledge Base structure.

Use Knowledge Islands as the working territory name and Arcadia as its Capital, subject to reconciling the current Charter's use of Arcadia as the territory name. The local registry resolves canonical repository identities to checkouts and stores; it does not assign jurisdiction. Paperclip company affiliation is an explicit coordination binding to an already governed territory. A disagreement among those declarations is a finding, not permission for one source to overwrite another.

### Known Lands and signposting

A Capital's Known Lands has two distinguishable relationships: islands governed within its territory, and external lands it knows about. The internal inventory is authoritative for the territory. External entries describe the local island's relationship to another authority and cite that authority without claiming jurisdiction over it.

Preserve the useful island-relative signposting already explored in the Island concepts record. Any island can maintain a narrower chart for topics, queries, captures, and work; a person's home island can chart the wider world available to that person. Principal status is not a prerequisite for knowing about neighbours. Agora working sets remain a separate projection that can include external lands.

A public territory publishes its own structure and reusable knowledge classifications. It need not publish identities or relationships belonging to a private consumer. Physical checkout and source-store locations remain machine-local registry information.

### Internal routing and boundary exchange

Territorial membership permits shared governance and routing conventions; it does not erase repository-specific access, canonical acceptance, or release boundaries. The existing phrase equating a territory with entirely unrestricted internal flow needs qualification. Different audiences or protected source material can exist within one territory.

Distinguish consuming published knowledge, offering a contribution, transferring restricted knowledge, and requesting another island's work. A receiving territory can privately declare that it follows and adopts public KI knowledge without KI keeping a reciprocal consumer list. The existing Contribution Process's known-version, receiver-chosen pull is a useful precedent. A contribution back to KI has its own intake and acceptance. Restricted exchanges require the participating owners' explicit rules in a location appropriate to their audience.

Territory policy defines which classes may enter or leave and for what purpose. Island-level routing identifies the concrete source and destination where needed. A shared person, company, checkout, or Agora does not itself establish either permission. A route is a governed relationship independent of its eventual transport; no physical bridge metaphor is required.

### Marking knowledge

Agree the meaning before choosing frontmatter keys. A reader should be able to determine an item's owning island and territory, subject and kind, intended audience, lifecycle state, source and revision, and whether it is original, a reference, or an adopted adaptation. Inherit territory identity from governance where possible rather than copying it into every note. Record item-specific provenance and exceptions explicitly.

Classification and permission have different jobs: a topic identifies subject matter; an audience classification informs exchange policy; a source reference preserves provenance. Visibility of a repository does not prove that every linked source store may be read or redistributed. The review must define how classification changes and derived material retain their provenance.

### Observatory reader

The Observatory should support territory to island to collection to knowledge-item navigation, with readable note detail, search, and links across the chart. Show containment separately from external references, adopted knowledge, and exchange relationships. A graph supplements the reader; understanding a note must not require operating a graph.

The first knowledge-reading increment should identify scope and freshness, render Markdown and the adopted KB link conventions, and explain missing or inaccessible destinations. Begin with governed text and explicitly permitted metadata. Do not automatically expose external store contents, absolute paths, private identities, or embedded remote resources to a public projection. A declared but locally unavailable island remains known, with availability shown separately.

The Observatory already offers read-only Instruments and an in-place Decision Record reader. A general knowledge reader extends those foundations. Its existing Bridge names command operations; territory routes need not acquire the same name. Editing and automated ingestion are separate later product decisions.

## Evidence of drift

- The [territory concept](<../Pillars/Philosophy/Introduction/Concept/Territories and Archipelagos/Territories and Archipelagos.md>) gives each territory one principal and leaves Customs and Routes unfinished. [Arcadia's Charter](<../Admin/Governance/Charter.md>) calls its territory Arcadia, while current coordination and Agora declarations encompass the Knowledge Islands ecosystem.
- [Arcadia's Known Lands](<../Admin/Governance/Known Lands.md>) describes a canonical ecosystem map but lists only Arcadia and the website, with obsolete local paths. The owner declaration in `.ki.toml` has a much larger working set; that set is evidence for reconciliation, not a substitute for a governed territorial inventory.
- [Island concepts](../Streams/Roadmap/KI-ARCADIA-MOD-002-island-concepts.md) contains valuable signposting design but still describes reciprocal Agora declarations and some obsolete source paths. Reconcile it in place rather than treating the older proposal as current law.
- [The Enactment Process](<../Admin/Operations/Processes/Enactment Process.md>) and `AGENTS.md` still describe recurring definitions under `Streams/Housekeeping/`; the current shared Streams standard places them in the configured Activity collection. The retained Arcadia area contains an index note and needs a reviewed disposition rather than automatic deletion.
- The shared KB skill explicitly requires wikilinks for KB note content. The general authoring Markdown reference says never to use wikilinks without stating that KB exception. The intended division is suggested elsewhere, but the applicable documents need one clear precedence rule before a reader or bulk link migration is designed.
- The current KB frontmatter standard separates note kind, topical tags, lifecycle state, and `updated`/human `reviewed` timestamps. Older model notes still teach `card/*` classification and dated `status` strings as the universal convention. Reconcile the teaching material, templates, validators, and migration policy before adding territory or exchange markings to that already mixed vocabulary.
- Techné's README and Known Lands still describe an active normative role for KI Specifications and a six-authority model. The current shared fundamentals record makes Specifications dormant before overall V1 and names broader ecosystem ownership. These explanatory surfaces lag their cited decision.
- Structural checks prove a limited floor. The principal skill explicitly checks the presence of governance surfaces without establishing territorial identity or authority. Passing that check does not prove that Known Lands is complete or that its claims agree with the Charter and live declarations.

## Techné consolidation assessment

The preferred design is to retain Techné as an engineering discipline within Arcadia, with an Engineering Practice pillar, and retain two implementation repositories: `ki-techne-harness` for controller and execution-fabric applications, operations, runtime payloads, infrastructure, and provider adapters; `tools-techne` for the operator command, diagnostics, installation, and release artifacts.

[ADR-TECHNE-003](https://github.com/knowledgeislands/ki-techne-principal/blob/main/Admin/Governance/Decisions/ADR-TECHNE-003-techne-implementation-ownership.md) gives the implementation split a concrete reason: harness applications and the operator tool are independently versioned products. Moving engineering knowledge into Arcadia does not remove that reason. The CLI currently documents checkout installation and no public release; this review makes no distribution or publication change.

The inspected Techné primary checkout has one Engineering Practice pillar with 23 files, six Decision Records including the shared fundamentals copy, three retained open roadmap records, and a knowledge-package manifest. Two branches are not merged into local `main`, and five worktrees including the primary checkout remain registered. Its programme hold applies across all three Techné repositories. The review inspected these as retained evidence and performed no integration or resumption.

Consolidation is preferable if the engineering material shares Arcadia's audience, stewardship, and acceptance boundary. Before deciding, inspect every retained category and any outstanding branch changes for a materially independent boundary. Merely removing the word principal would resolve the role ambiguity but would preserve the separate knowledge store and its maintenance burden; retain that option only if the evidence justifies it.

The migration proposal must account for:

1. Canonical pillar notes, indexes, memory navigation, diagrams, Resources and Calendar material, staging material, and the manifest. Distinguish reusable engineering principles that belong in Arcadia from implementation-specific guidance that belongs with a product.
2. Decision provenance and references. Preserve original identifiers and history evidence or publish an explicit old-to-new mapping; do not silently rename decision scopes to make them pass a destination audit. Reconcile the shared fundamentals record at its authoring source and all current projections.
3. The three open work records, issue-ledger high-water marks, task associations, retained candidate commits, and worktrees. Owner-approved transfer must preserve original identity and held or waiting state without accepting incomplete work. Resolve destination validator constraints before moving records.
4. The programme hold and its owner. The current hold is anchored in Techné Principal and referenced by the harness and CLI; a consolidation must preserve a durable authority for it before retiring that source. Consolidation is not resumption of remote implementation or infrastructure work.
5. Incoming references from the website's project catalogue and source labels, agent orientations, governance notes, Agoras, trade routes, registry entries, and coordination projects. Use a source-to-destination manifest and verify each consumer before any retirement.
6. A reversible cutover. Copy or migrate accepted content with provenance, validate the destination, update consumers through their owners, and retain the old repository as a readable historical source until retirement is explicitly approved. No deletion, remote archival, redirect publication, or service change is implied by this assessment.

## Revised delivery sequence

### 1. Establish territory authority and the drift baseline

Reconcile the Charter, Known Lands, current repository identities, and company association in each territory. The private estate census identifies the local instances; public standards describe only the general model and public KI instance. Confirm each territorial principal, resolve Arcadia's territory naming, and separate governed membership from external signposting. Repair the blocking Streams prerequisite through a bounded local disposition, then shape the existing Island concepts record.

The review result is one agreed authority model, a per-territory discrepancy register with owners, and an explicit scope for Techné consolidation. Membership disagreement remains visible until an owner resolves it. Do not synchronise company bindings from Agora membership automatically.

### 2. Settle knowledge classification and exchange semantics

Work through a public upstream adopted by a private consumer, a restricted collaboration between two territories, and an internal handoff between islands with different audiences. Specify ownership, classification, provenance, admission, adoption, update discovery, withdrawal, and missing-destination behaviour. Decide where internal routing and restricted agreements are recorded without adding private consumer identities to public repositories.

The review result is a small vocabulary and worked examples, with audience and ownership for each declaration. Determine whether reusable shared governance belongs in the harness while each territory's adopted policy remains in its Capital. Defer TOML and machine schema changes until these meanings are agreed.

### 3. Define the read-only knowledge experience

Use those examples to describe chart navigation, note reading, provenance inspection, search, link resolution, and unavailable islands. Compare against the existing Observatory instruments and the Island visualisation proposal. Establish which metadata the stable `ki` contract supplies and which presentation belongs to the Observatory.

The review result is a bounded reader specification and representative fixtures. Verify that a public KI-only checkout works independently and that a private combined view can display additional relationships without publishing them.

### 4. Reconcile standards, migrate approved knowledge, and derive tooling work

Update the shared conceptual authority first, then the reusable principal, KB, Streams, authoring, and exchange contracts. Amend living decisions in place where they own the same concern and reconcile their projections. Apply each territory's Charter, Known Lands, conformance, navigation, and local process corrections through its own approved records. Execute Techné consolidation only against its reviewed manifest and preservation evidence.

Then capture independently executable receiver work for `tools-ki`, Observatory, website publication, company bindings, Agoras, and trade-route migration. The harness's existing exchange intake remains the route for reusable trade governance and must reconcile the earlier estate-wide intake assumptions. Product owners retain implementation and acceptance authority.

The completion test is agreement across governed notes, declarations, runtime resolution, and reader evidence, with deliberate differences explained. No public artifact may depend on the existence of an unrelated private consumer. Every moved knowledge item and work record must retain a valid provenance route, and every active or held responsibility must still have an owner.

## Review decisions

The next conceptual review should settle the territorial-principal rule and authoritative Known Lands membership, the preferred absorption of Techné knowledge into Arcadia, the inheritance model for knowledge markings, and ownership of public consumption versus restricted exchange. Exact metadata keys, migration commands, work-item transfer identities, and UI implementation belong to the subsequent scoped plans. The present record does not mark those plans Ready or alter existing holds.
