# AGENTS.md - Arcadia Principal

This is the runtime-neutral working convention for Arcadia Principal.

## Territorial authority

Arcadia is the Capital of the Knowledge Islands territory. [Charter](Admin/Governance/Charter.md) declares its authority and [Known Lands](<Admin/Governance/Known Lands.md>) owns the internal inventory and external signposting. Registry resolution, Agora working sets and Paperclip companies confer no jurisdiction or cross-repository write authority. Each island retains its source access, canonical acceptance and product ownership.

Arcadia owns Techné's canonical [Engineering Practice](<Pillars/Engineering Practice/Engineering Practice.md>) and engineering decisions. The former `ki-techne-principal` knowledge tree is retained noncanonical evidence and the location of its unchanged held work; `ki-techne-harness` and `tools-techne` retain separate implementation ownership.

## Techné programme hold

The [Techne Programme Hold](<Admin/Governance/Policies/Techne Programme Hold.md>) remains in force across the retained source, harness and CLI. Read it before any Techné work. Knowledge consolidation and the human's source-Enactment exception are scoped documentary authority changes, not permission for branch integration, new implementation, remote rollout or programme resumption.

## Progress and commits

- Give concise progress updates at meaningful checkpoints and at least every few minutes during sustained work.
- Commit only a completed, verified unit of work. Stage explicit paths for that unit and do not combine it with unrelated working-tree changes.
- If a unit cannot yet be verified, report the checkpoint and leave it uncommitted until its verification is complete.

## Cross-repository choreography

- Arcadia Principal, the KI Agentic Harness, `tools-ki`, KI Specifications, and the KI Website may add a concrete handoff item to one another's Stream or roadmap. The receiving repository owns its priority, plan, and execution.
- Record the originating repository and item, then state whether the handoff `blocks` or is `blocked by` the local item. Keep the relationship reciprocal where both items exist.
- Prefer independently executable, non-blocking work. Mark an item as blocking only when it is a genuine prerequisite; otherwise let the receiving repository schedule it in its own horizon.

This repository is the island - a structured repository of knowledge, comprising of folders and Markdown files.

## Approach

Full specification in [[Introduction/Introduction|Introduction]]. Summary:

- **Goal**: Build a canonical, living record of knowledge such that the island informs decisions, onboarding, tooling, and AI interactions
- **Continual Improvement**: Outputs from interactions should feed back into the island, creating a cycle of improvement
- **Structure**: Interconnected notes using `[[wikilinks]]`, frontmatter tags, and a loose Zettelkasten approach. Quality over quantity
- **Tone**: Structured and direct, with depth where warranted. Not corporate or flowery
- **Language**: British English throughout - spellings, idioms, and phrasing
- **Punctuation**: ASCII hyphens only (`-`) - no em-dashes (—) or en-dashes (–) anywhere in island content

## Library Structure

Full specification in [[Structure]]. Summary:

- 4 top-level folders: `Calendar` (daily notes, meeting notes, session digests, and periodic reviews), `Pillars` (internal knowledge - methodology, approach, and domain-specific reference), `Resources` (external reference - things that exist independently), `Streams` (status tracking for projects and workstreams - durable knowledge belongs in Pillars)
- `Admin` and `-` (outbound) are canonical zones - `Admin` holds governance (`Admin/Governance/`: charter, known lands, conventions, decisions, note templates, policies) and operations (`Admin/Operations/`: activities, processes, live artifacts, skills) - migrated from Knowledge Capital per GDR-KI-ARCADIA-002; `-` is outbound staging. `Admin` is gated through the Enactment Process alongside `Pillars` and `Resources` - changes route through a proposal. [[Admin/MEMORY|MEMORY]] is the root memory index of active Admin content
- `Pillars` and `Resources` share subfolder names by design - e.g. `Pillars/Finance` holds internal knowledge; `Resources/Finance` holds general reference
- `Streams` is an operational container: `Streams/Roadmap/` holds flat finite work records. Recurring obligations are Activity notes in the configured collection, currently `Admin/Operations/Activities/`; opted-in housekeeping Activities produce ordinary roadmap runs. A work record's horizon and lifecycle are frontmatter metadata, never a folder path.
- Calendar note types - daily notes, meeting notes, session digests, and the monthly index are all siblings in the same month folder, each referenced from the daily note by wikilink; the daily note does not duplicate their content. Weekly notes are filed separately in a per-year `YYYY By Week/` folder:
  - Daily notes: `Calendar/YYYY/YYYY-MM MonthName/YYYY-MM-DD DayName.md`
  - Meeting notes: `Calendar/YYYY/YYYY-MM MonthName/YYYY-MM-DD Meeting Name.md` - one note per meeting
  - Session digests: `Calendar/YYYY/YYYY-MM MonthName/YYYY-MM-DD Session - Topic.md` - one note per AI work session
  - Monthly index: `Calendar/YYYY/YYYY-MM MonthName/YYYY-MM MonthName.md` - same name as the folder; index note for the month
  - Weekly notes: `Calendar/YYYY/YYYY By Week/YYYY WXX.md` - all weeks for a year collected in one sibling folder (e.g. `Calendar/2026/2026 By Week/2026 W14.md`); the folder has its own index note (`YYYY By Week.md`)

### Pillars/Resources boundary (strictly enforced)

The general principle: `Pillars` holds internal knowledge owned by the Knowledge Island; `Resources` holds external reference material that exists independently. Methodology or internal content found in Resources belongs in Pillars. The canonical boundary definition is in [[Pillars/Philosophy/Model/Conventions/Structure/Library/Library|Library]] under "Pillars/Resources Boundary".

### Changing canonical content (strictly enforced)

Substantive changes to a canonical zone (`Admin`, `Pillars`, `Resources`) go through the **Enactment Process**: create or advance the relevant record in `Streams/Roadmap/` and use the shared change-management lifecycle - do not edit `Admin`/`Pillars`/`Resources` directly. When starting such work, load `ki-repo-kb-streams` and the relevant shared change-management skill. The lifecycle is `draft` -> `ready` -> `in-progress` -> `awaiting-review` -> `done`. See the [local Enactment Process](<Admin/Operations/Processes/Enactment Process.md>). Exempt: trivial typo/formatting fixes, `Calendar/` entries, and `+/` triage.

### Index Notes (strictly enforced)

Every folder must have an index note with the same name (e.g. `Productivity/Productivity.md`). Its `note_type` follows the `ki-repo-kb` index taxonomy and it does not duplicate content - it contextualises and points. Create it when creating the folder.

**Structure:** A prose `## Overview` section explaining the folder's purpose and how its contents fit together, followed by one named H2 section per direct child. Each child section introduces the sub-note or sub-folder in two to four substantive sentences - what it covers, why it exists, what a reader will find. A `## Contents` list is a last resort for children that cannot be contextualised in prose.

**Anti-pattern:** A list of sub-note names with one-line descriptions is a nav menu - it tells the reader nothing they could not learn from the folder structure itself. Index notes must be richer than this.

**Calendar exception:** Year folders require a `YYYY.md` index. Month and week folders use their date-prefixed periodic notes as entry points - no separate index note is needed.

**`+` folder exception:** The `+` folder is the inbox for unsorted captures awaiting filing and is exempt from the index note rule. Its subfolders do not require index notes. Do not use it as an asset store - images and diagrams belong in the same folder as the note they support.

**`-` folder exception:** The `-` folder is outbound staging (the counterpart to `+`) and is likewise exempt from the same-name index rule - both are staging areas, not zones. [[Outbound]] documents it; it does not need a `-.md` index.

## Knowledge Management Workflow

At the heart of the knowledge management is a cycle of continuous improvement / learning.

### Pre-Flight Checks

Operational rules and known pitfalls are captured in auto-memory (`feedback_{ki_prefix}_operations.md` and related files) - no separate file read is required at session start. If an error occurs during a session, log it in [[Mistakes and Lessons]], apply the fix, update the relevant memory file, and record the resolved lesson in the table.

### Querying

- When a question is asked that may be answered from the island:
  - Search for relevant notes (by filename and content)
  - Read the relevant files
  - Answer grounded in the read knowledge, citing the note(s) with `[[Note Name]]`
  - If the conversation reveals something new and worth keeping, offer to save it
- If the question cannot be answered from the island:
  - Capture the answer as a new note, following the routing rules below
  - Link it to relevant existing notes where possible

### Updating the island

The `ki-repo-kb` skill owns note metadata and internal links; instrument-specific record skills own their additional fields. Local authoring and routing pointers:

- Before writing any changes, confirm with the user first
- Tag conventions: [[Frontmatter/Tags|Tags]]
- `note_type` classifies note kind and tags describe subject. `updated` and human `reviewed` timestamps describe freshness; `author` records authorship. A note's lifecycle or state, where applicable, follows its owning note type rather than a universal dated `status` vocabulary. Work, Activity, Decision Record and trade metadata follow their owning skills.
- Sections separated by `---`; body uses H2 headings
- `ki-repo-kb` owns links between Knowledge Base notes: use shortest-unique `[[wikilinks]]`, including table cells, and escape an alias separator as `\|` in a cell. This scoped rule takes precedence over general `ki-authoring` relative-link guidance. Repository orientation and other house documents use descriptive relative Markdown links; cross-repository provenance uses canonical source references and a known revision. The applicable note or record skill owns metadata.

### Session Digests

At the close of any substantive session, offer to write a session digest as a sibling Calendar note alongside today's daily note - the same pattern as meeting notes. File at `Calendar/YYYY/YYYY-MM MonthName/YYYY-MM-DD Session - Topic.md`, then reference it from the daily note by wikilink. Include: **Context** (what the session was about and why it was needed), **Decisions**, **Facts Learned**, **Related Projects**, **Keywords**.

If a daily note has no sessions, omit the `### Sessions` section entirely - do not leave a placeholder.

Session notes are temporary. Once a session's content has been extracted to the appropriate Pillars or Streams notes, delete the session note - it has no long-term value as a standalone calendar artefact. The test: if the note were deleted today, would any knowledge be lost? If not, delete it.

### Routing Rules for Notes

Full rules in [[Structure]]. Key reminders: do not write to `+/_Voice Notes/` - this folder is managed by the voicenotes-sync plugin. When updating an existing note, read it first and merge in, preserving structure.

See [[Routing Rules]] for any additional routing rules specific to this island.

## Knowledge Island Specifics (strictly enforced)

Public island identity, task prefix, skill triggers, schedules and adopted integration policy live in `Admin/Governance/`. The local registry owns physical checkout and source-store paths; private runtime identities and credentials stay outside public governance. The [[Admin/Governance/Charter|Charter]] is the primary reference: it holds the identity parameters and the full adoption and activity roster. Integration and platform configuration lives in [[Admin/Governance/Conventions/Admin Conventions/Integrations|Integrations]] under `Admin/Governance/Conventions/Admin Conventions/`.

**Automations and skills must read their configuration from these notes at runtime, not hardcode values.** This keeps prompts portable across islands and ensures a single source of truth. When an integration changes, update the relevant `Admin/Governance/Conventions/` note - the automations will pick up the change on their next run.

## Decision Records

Significant structural decisions about this island are recorded as Decision Records (DRs) in `Admin/Governance/Decisions/`. Each `decision_type` has its own prefix: `GDR-` (governance), `ADR-` (architecture), `KDR-` (knowledge), `SDR-` (strategy), `PDR-` (product), `DDR-` (data), `XDR-` (security), `ODR-` (operations), `RDR-` (research). Serials are per decision-type prefix within the `KI-ARCADIA` scope. Create a DR when an Enactment Process proposal produces a `Decision` output that warrants a standalone permanent record -- structural choices, adoption of tools or formats, cross-repo boundaries. Routine content additions do not need a DR. The `ki-decision-records` skill governs the format. The index is `Admin/Governance/Decisions/Decisions.md`.
