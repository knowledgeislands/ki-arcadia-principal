---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: draft - April 2026
author: Written with Claude
---

# Structure

## Overview

An island has geography - both natural and constructed. The streams run through the landscape; the harbour opens onto the sea; the library is built at the heart of the capital. Each zone has a different character: some feel organic, shaped by flow and movement; others feel institutional, shaped by governance and permanence. Both are of the place.

Structure is where those geographic conventions are specified. Each zone has its own section covering its internal organisation, routing rules, and governing logic.

### Physical Stores

Each island realises its knowledge through one or more physical stores:

| Store | Purpose | Structure |
| --- | --- | --- |
| **Text store** | Markdown notes - version-controlled, git-backed, human-readable | Canonical island folder structure |
| **Binary store** | Large binary files - images, PDFs, exports, attachments | Mirrors text store exactly |
| **Working space** | Temporary area used by tools and agents; ephemeral | None required |

The text and binary stores must share an identical folder structure so that files are co-located by topic regardless of which store they live in. When creating or referencing a binary asset, save it to the binary store under the same relative subfolder as the corresponding note.

Git is the source of truth for canonical knowledge. The working space is ephemeral - nothing in it is canonical until committed to a store.

### Governance Infrastructure

The governance infrastructure belongs to the principal island and serves the entire archipelago. It is not a store - it is the operational layer through which knowledge is managed and evolved:

| Infrastructure | Purpose |
| --- | --- |
| **Cowork project** | The parliament - where proposals are reviewed, sessions are run, and archipelago-wide decisions made |
| **Working folder** | The yard - temporary scratch space for in-progress work; discarded once committed or abandoned |

Specific paths for each island are defined in its Knowledge Capital.

---

## Library

The Library is the canonical record - version-controlled, governed, and the single source of truth for all ratified knowledge. It contains three zones: Calendar (time-bound notes), Pillars (internal knowledge owned by the island), and Resources (external reference material). Nothing enters the Library except through the governance process.

### Top-Level Folders

| Folder      | Purpose                                                                             |
| ----------- | ----------------------------------------------------------------------------------- |
| `Calendar`  | Time-based notes - daily notes, meeting notes, and periodic reviews                 |
| `Pillars`   | Internal knowledge - philosophies, methodologies, approaches                        |
| `Resources` | External knowledge - things that exist independently                                |
| `Streams`   | Status tracking for projects and workstreams - durable knowledge belongs in Pillars |
| `Admin`     | Base-agnostic governance and operations - present but minimal (see note below)      |
| `+`         | Inbox - unsorted captures awaiting filing (inbound staging, not a zone)             |
| `-`         | Outbound staging - produced artefacts leaving the island; present but minimal       |

`Admin` and `-` are introduced minimally to align with the canonical Knowledge Islands model (five zones - `Calendar`, `Pillars`, `Resources`, `Streams`, `Admin` - flanked by the inbound `+` and outbound `-` staging areas). For now this island's governance remains in [[Knowledge Capital]] and session digests remain sibling `Calendar` notes; migrating governance into [[Admin]] and digest output into `-` is deliberate future work, tracked but not yet done.

`Pillars` and `Resources` share subfolder names by design. For example, `Pillars/Finance` covers internal finances; `Resources/Finance` covers general finance knowledge such as banking regulations.

Streams notes track current status, progress, and next steps - they are not knowledge stores. When a stream produces durable knowledge, it is extracted to the relevant Pillars note; the stream note links to it.

`Calendar` contains several note types. Daily notes, meeting notes, session digests, and the monthly index are filed in the month folder and referenced from the daily note by wikilink; the daily note does not duplicate their content. Weekly notes are filed separately in a per-year `YYYY By Week/` folder alongside the month folders.

| Note type | Path pattern | Purpose |
| --- | --- | --- |
| Daily note | `YYYY-MM-DD DayName.md` | The anchor for the day - links out to all other Calendar notes for that date |
| Meeting note | `YYYY-MM-DD Meeting Name.md` | Record of a specific meeting - one note per meeting |
| Session digest | `YYYY-MM-DD Session - Topic.md` | Summary of a substantive AI-assisted work session |
| Monthly index | `YYYY-MM MonthName.md` | Index note for the month - same name as the containing folder |
| Weekly note | `YYYY WXX.md` | Weekly note filed in the year's `YYYY By Week/` sibling folder † |

† **Weekly note purpose** — weekly note filed in the year's `YYYY By Week/` sibling folder (e.g. `Calendar/2026/2026 By Week/2026 W14.md`).

### Routing Rules

When creating or filing a note, route to the most specific matching folder:

1. **Meeting note** → `Calendar/YYYY/YYYY-MM MonthName/YYYY-MM-DD [Meeting Name].md`; reference from the corresponding daily note
2. **Session digest** → `Calendar/YYYY/YYYY-MM MonthName/YYYY-MM-DD Session - [Topic].md`; reference from the corresponding daily note
3. **Internal knowledge on a topic** → `Pillars/[Topic]/[Title].md`
4. **External knowledge on a topic** → `Resources/[Topic]/[Title].md`
5. **Finite forward work** → `Streams/Roadmap/[ID]-[slug].md`
6. **Recurring obligation** → `Streams/Housekeeping/[Name] Housekeeping.md`
7. **Unsure** → `+/[Title].md` (inbox, to be filed)

When updating an existing note: read it first, then merge new content in, preserving structure and enriching rather than replacing.

### Pillars/Resources Boundary

- `Pillars` notes contain internal knowledge - things that should not need to exist outside of the island
- `Resources` notes contain external knowledge - things that exist independently of this island but add value by being synthesised in it
- Links between Pillars and Resources are **bidirectional** where relevant
- If a Resources note has accumulated internal knowledge, that knowledge belongs in a new or existing Pillars note that references the Resources one

### Streams/Pillars Convention

Streams notes are status trackers, not knowledge stores.

- **In a Stream note:** current status, progress updates, decisions made within the stream, next steps, blockers, and links to relevant Pillars notes
- **In Pillars:** technical findings, architectural knowledge, reusable methodologies, designs, and approaches that outlive the stream

When a stream produces lasting insight, extract it to the relevant Pillars note and link back from the stream. A stream note that accumulates deep technical content is a signal that content needs to move.

Completed roadmap records should have their durable knowledge already in Pillars. The `done` record is retained as review evidence until its owner explicitly selects it for pruning.

### Pillars/Resources Folder Notes

Every folder in Pillars and Resources must have a note with the same name as the folder (e.g. `Productivity/Productivity.md`). The folder note:

- Acts as the entry point and overview for that folder / subtree
- Does **not** duplicate content - it can however summarise, contextualise and point

Folder notes may act as a narrative guide for the subtree.

When creating a new folder, create its folder note at the same time.

---

## Streams

Streams carry knowledge in motion: finite forward work, recurring obligations, and their review evidence. They are not part of the Library; their content is not canonical. Work matures through an approved record, stabilises into `Admin/`, `Pillars/`, or `Resources/`, and its reviewed record is retained until explicitly pruned.

`Streams/Roadmap/` holds flat finite work records and its allocation ledger. `Streams/Housekeeping/` holds recurring-work templates. A record's horizon and lifecycle are frontmatter metadata, not navigation folders. The full Streams structure and routing are canonical in `ki-repo-kb-streams`; see [[Enactment Process]] for the local governance framing.

---

## Harbour

> [!todo] Harbour The Harbour is the port of entry - where incoming material arrives before being assessed and routed inward. Nothing flows directly from the Harbour into the Library; all material is assessed first, relevant content routed to the right Stream or zone, the rest discarded. The Harbour's structural conventions are not yet fully specified.

---

## Routes and Customs

> [!todo] Routes and Customs Routes are the explicit pathways and relationships between zones and between islands. Customs is the jurisdictional layer at each boundary, controlling what passes between territories. Both need fuller specification as the model develops.
