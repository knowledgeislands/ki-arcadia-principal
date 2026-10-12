# AGENTS.md - Knowledge Islands Principal

This is the runtime-neutral working convention for Knowledge Islands Principal, the island: a structured repository of knowledge in folders and Markdown files. The `ki-repo-kb` skill and its overlays declared in `.ki.toml` own the reusable method; this file keeps the island's identity, authority and local choices.

## Territorial authority

Arcadia is the Capital of the Knowledge Islands territory. [Charter](Admin/Governance/Charter.md) declares its authority and [Known Lands](<Admin/Governance/Known Lands.md>) owns the internal inventory and external signposting. Territory-derived repository selection, registry resolution and Paperclip companies confer no jurisdiction or cross-repository write authority. Each island retains its source access, canonical acceptance and product ownership.

Arcadia owns Techné's canonical [Engineering Practice](<Pillars/Engineering Practice/Engineering Practice.md>) and engineering decisions. The former `ki-techne-principal` knowledge tree is retired and archived read-only as historical evidence; it holds no live work. `ki-techne-harness` and `tools-techne` retain separate implementation ownership.

## Techné programme hold

The [Techne Programme Hold](<Admin/Governance/Policies/Techne Programme Hold.md>) restricts remote agent execution and remote-environment management across the harness and CLI. Read it before Techné work. Local implementation, architecture, testing, review and branch integration may continue under each repository's normal authority and declared engineering standards; knowledge consolidation alone does not authorise remote operations or accept candidates.

## Progress and commits

Give concise progress updates at meaningful checkpoints. Commit only a completed, verified unit of work, staged by explicit path under `ki-git`; leave an unverified unit uncommitted and report its checkpoint.

## Cross-repository choreography

Knowledge Islands Principal, the KI Agentic Harness, `tools-ki`, KI Specifications, the KI Website, the Techne Harness and `tools-techne` may add a concrete handoff item to one another's Stream or roadmap. The receiving repository owns its priority, plan and execution. Write the handoff as `ki-work-roadmap` describes for work another repository must deliver, and mark it blocking only when it is a genuine prerequisite.

## Approach

[[Introduction/Introduction|Introduction]] holds the full specification. The island is a canonical, living record that informs decisions, onboarding, tooling and AI interactions, and outputs from interactions feed back into it. Notes are interconnected with `[[wikilinks]]` and tags, in a loose Zettelkasten: quality over quantity.

- **Tone**: structured and direct, with depth where warranted; not corporate or flowery.
- **Language**: British English throughout.
- **Punctuation**: ASCII hyphens (`-`) only; no em-dashes or en-dashes anywhere in island content.

## Library structure

[[Structure]] holds the full specification and `ki-repo-kb` the zone model. Local choices:

- `Admin` holds governance (`Admin/Governance/`) and operations (`Admin/Operations/`), per [[GDR-KI-PRINCIPAL-002-admin-zone-governance-and-operations|GDR-KI-PRINCIPAL-002]]. [[Admin/MEMORY|MEMORY]] is the root memory index.
- `Streams/Roadmap/` holds flat work records; recurring obligations are Activity notes in `Admin/Operations/Activities/`.
- Calendar: daily, meeting and monthly index notes are siblings in `Calendar/YYYY/YYYY-MM MonthName/`, linked from the daily note; weekly notes live in `Calendar/YYYY/YYYY By Week/` with its own index note.

### Pillars/Resources boundary (strictly enforced)

`Pillars` holds internal knowledge owned by the island; `Resources` holds external reference that exists independently. Internal content found in `Resources` belongs in `Pillars`. See [[Pillars/Philosophy/Model/Conventions/Structure/Structure#Library|Library]].

### Changing canonical content (strictly enforced)

Change `Admin`, `Pillars` or `Resources` only through the [Enactment Process](<Admin/Operations/Processes/Enactment Process.md>), with a record in `Streams/Roadmap/` under `ki-repo-kb-streams`. An explicit owner instruction for a bounded change stands in for a record; related changes share one record. Trivial typo or formatting fixes, `Calendar/` entries and `+/` triage are exempt.

### Index notes (strictly enforced)

Every folder has a same-name index note, created with the folder and shaped as `ki-repo-kb` describes under index note shape. Calendar year folders need a `YYYY.md` index; month and week folders use their periodic notes instead. `+` and `-` are staging areas and are exempt ([[Outbound]] documents `-`).

## Knowledge management

`ki-repo-kb` owns querying, saving, updating, linking, metadata and session digests. Local rules:

- Confirm with the user before writing changes.
- Log a session error in [[Mistakes and Lessons]], apply the fix and record the resolved lesson.
- Never write to `+/_Voice Notes/`; the voicenotes-sync plugin manages it.
- [[Routing Rules]] adds island-specific routing to [[Structure]].

## Knowledge Island specifics (strictly enforced)

Public island identity, task prefix, skill triggers, schedules and adopted integration policy live in `Admin/Governance/`, with the [[Admin/Governance/Charter|Charter]] as the primary reference and [[Admin/Governance/Conventions/Admin Conventions/Integrations|Integrations]] for platform configuration. The local registry owns physical checkout and source-store paths; private runtime identities and credentials stay outside public governance. Automations and skills read their configuration from these notes at runtime and never hardcode it.

## Decision records

Decision Records for this island live in `Admin/Governance/Decisions/`, indexed by `Decisions.md`, with serials per type prefix in the `KI-PRINCIPAL` scope. `ki-decision-records` owns format, types and when a decision warrants a record.
