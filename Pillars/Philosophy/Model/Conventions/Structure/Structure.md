---
note_type: pillars/index
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: current - October 2026
author: Mixed
---

# Structure

## Overview

An island has geography - both natural and constructed. The streams run through the landscape; the harbour opens onto the sea; the library is built at the heart of the capital. Each zone has a different character: some feel organic, shaped by flow and movement; others feel institutional, shaped by governance and permanence. Both are of the place.

Structure is where those geographic conventions are specified. Each zone has its own section covering its internal organisation, routing rules, and governing logic.

### Physical Stores

A Knowledge Base declares its notes store and any additional source-store roles in tracked configuration. Product islands use their applicable repository contract rather than acquiring this folder layout.

| Store | Purpose | Authority |
| --- | --- | --- |
| **Notes store** | Governed Markdown knowledge | Repository history and canonical-change process |
| **Optional sources store** | Material unsuitable for Git | Explicit declared need and source access policy |
| **Working space** | Temporary work by people or tools | No canonical standing |

An external source store is opt-in, not inferred from the repository name. The local registry resolves physical checkout and source-store locations; portable governance and citations use canonical identities or declared store aliases. Source access and publication remain separate decisions.

### Governance Infrastructure

The Capital holds shared governance for its territory. Each island retains its own source permissions, canonical acceptance and product responsibilities. An archipelago groups islands by shared character and does not independently confer jurisdiction.

Collaboration tools, companies and working sets implement the owners' chosen processes. They do not appoint a Capital or grant cross-repository authority. Temporary working folders likewise confer no canonical standing.

Governed identity and policy belong in Admin; machine-specific paths belong in the local registry.

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
| `Admin`     | Local governance and operations      |
| `+`         | Inbox - unsorted captures awaiting filing (inbound staging, not a zone)             |
| `-`         | Outbound staging - produced artefacts leaving the island; present but minimal       |

The five Knowledge Base zones are `Calendar`, `Pillars`, `Resources`, `Streams` and `Admin`, with inbound `+` and outbound `-` staging. Arcadia's governance lives in Admin, not a separate Knowledge Capital folder. Calendar records and outbound artifacts follow their own note-type and process owners; a shared staging convention does not authorise relocating existing records.

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

† **Weekly note purpose** - weekly note filed in the year's `YYYY By Week/` sibling folder (e.g. `Calendar/2026/2026 By Week/2026 W14.md`).

### Routing Rules

When creating or filing a note, route to the most specific matching folder:

1. **Meeting note** → `Calendar/YYYY/YYYY-MM MonthName/YYYY-MM-DD [Meeting Name].md`; reference from the corresponding daily note
2. **Session digest** → `Calendar/YYYY/YYYY-MM MonthName/YYYY-MM-DD Session - [Topic].md`; reference from the corresponding daily note
3. **Internal knowledge on a topic** → `Pillars/[Topic]/[Title].md`
4. **External knowledge on a topic** → `Resources/[Topic]/[Title].md`
5. **Finite forward work** → `Streams/Roadmap/[ID]-[slug].md`
6. **Recurring obligation** → the configured Activity collection, currently `Admin/Operations/Activities/`; opted-in housekeeping Activities create ordinary roadmap runs
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

Streams carry knowledge in motion: finite forward work, runs of recurring obligations, and their review evidence. They are not part of the Library; their content is not canonical. Work matures through an approved record, stabilises into `Admin/`, `Pillars/`, or `Resources/`, and its reviewed record is retained until explicitly pruned.

`Streams/Roadmap/` holds flat finite work records and its allocation ledger. Recurring obligations are defined as Activity notes in the configured collection; `ki-repo-kb-activities` owns their shape and `ki-work-housekeeping` owns opted-in cadence and run evidence. A record's horizon and lifecycle are frontmatter metadata, not navigation folders. The full Streams structure and routing are canonical in `ki-repo-kb-streams`; see [[Processes/Enactment Process/Enactment Process|Enactment Process]] for the local governance framing.

---

## Harbour

> [!todo] Harbour The Harbour is the port of entry - where incoming material arrives before being assessed and routed inward. Nothing flows directly from the Harbour into the Library; all material is assessed first, relevant content routed to the right Stream or zone, the rest discarded. The Harbour's structural conventions are not yet fully specified.

---

## Routes and Customs

> [!todo] Routes and Customs Routes are the explicit pathways and relationships between zones and between islands. Customs is the jurisdictional layer at each boundary, controlling what passes between territories. Both need fuller specification as the model develops.
