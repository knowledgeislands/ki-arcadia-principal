---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: current - April 2026
author: Written with Claude
memory_file: project_{ki_prefix}_structure.md
---

# Library

## Overview

The Library is the canonical record of the island - version-controlled, governed, and the single source of truth for all ratified knowledge. This note covers its internal structure: the top-level folders, how notes are routed to the right place, the boundary between Pillars and Resources, and the index note conventions that hold the hierarchy together.

---

## Physical Locations

The Knowledge Islands model - island types, archipelago structure, and governance infrastructure - is defined canonically in [[Knowledge Islands]]. This section covers only the physical stores: where notes and assets live on disk.

**Stores (all islands, including islets):**

| Location     | Purpose                                                 | Structure                     |
| ------------ | ------------------------------------------------------- | ----------------------------- |
| Text store   | Markdown notes - version-controlled                     | Canonical KI folder structure |
| Binary store | Large binary files - images, PDFs, exports, attachments | Mirrors text store exactly    |

The text and binary stores must share an identical folder structure so that files are colocated by topic regardless of which store they live in.

When creating or referencing a binary asset, save it to the binary store under the same relative subfolder as the corresponding note. Wikilinks in notes use vault-relative paths - the mirrored structure ensures colocation without any special handling.

Specific paths for this island are defined in [[Physical Locations]].

---

## Top-Level Folders

| Folder      | Purpose                                                                             |
| ----------- | ----------------------------------------------------------------------------------- |
| `Calendar`  | Time-based notes - daily notes, meeting notes, and periodic reviews                 |
| `Pillars`   | Internal knowledge - philosophies, methodologies, approaches                        |
| `Resources` | External knowledge - things that exist independently                                |
| `Streams`   | Status tracking for projects and workstreams - durable knowledge belongs in Pillars |
| `+`         | Inbox - unsorted captures awaiting filing                                           |

`Pillars` and `Resources` share subfolder names by design. For example, `Pillars/Finance` covers internal / private personal finances; `Resources/Finance` covers general finance knowledge such as banking regulations.

Streams notes track current status, progress, and next steps - they are not knowledge stores. When a stream produces durable knowledge, it is extracted to the relevant Pillars note; the stream note links to it. Path structure, focus levels, and category conventions are defined in [[Structure]].

`Calendar` contains several note types. Daily notes, meeting notes, session digests, and the monthly index are filed in the month folder and referenced from the daily note by wikilink; the daily note does not duplicate their content. Weekly notes are filed separately in a per-year `YYYY By Week/` folder alongside the month folders.

| Note type      | Path pattern                    | Purpose                                                                                                        |
| -------------- | ------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| Daily note     | `YYYY-MM-DD DayName.md`         | The anchor for the day - links out to all other Calendar notes for that date                                   |
| Meeting note   | `YYYY-MM-DD Meeting Name.md`    | Record of a specific meeting - one note per meeting                                                            |
| Session digest | `YYYY-MM-DD Session - Topic.md` | Summary of a substantive AI-assisted work session                                                              |
| Monthly index  | `YYYY-MM MonthName.md`          | Index note for the month - same name as the containing folder                                                  |
| Weekly note    | `YYYY WXX.md`                   | Weekly note filed in the year's `YYYY By Week/` sibling folder (e.g. `Calendar/2026/2026 By Week/2026 W14.md`) |

---

## Routing Rules

When creating or filing a note, route to the most specific matching folder:

1. **Meeting note** → `Calendar/YYYY/YYYY-MM MonthName/YYYY-MM-DD [Meeting Name].md`; reference from the corresponding daily note
2. **Session digest** → `Calendar/YYYY/YYYY-MM MonthName/YYYY-MM-DD Session - [Topic].md`; reference from the corresponding daily note
3. **Internal knowledge on a topic** → `Pillars/[Topic]/[Title].md`
4. **External knowledge on a topic** → `Resources/[Topic]/[Title].md`
5. **Active project** → `Streams/Active/[Stream]/[Title].md`
6. **Background stream** → `Streams/Background/[Title].md`
7. **Concluded project** → `Streams/Settled/[Title].md`
8. **Unsure** → `+/[Title].md` (inbox, to be filed)

`+/_Voice Notes/` is managed entirely by the voicenotes-sync plugin - do not write Claude-generated content there.

When updating an existing note: read it first, then merge new content in, preserving structure and enriching rather than replacing.

---

## Pillars/Resources Boundary (strictly enforced)

- `Pillars` notes contain internal / private knowledge - things that should not need to exist outside of the island
- `Resources` notes contain external knowledge - things that exist independently of this island but add value by being synthesised in it
- Links between Pillars and Resources are **bidirectional** where relevant
- If a Resources note has accumulated internal knowledge, that knowledge belongs in a new or existing Pillars note that references the Resources one

---

## Streams/Pillars Convention

Streams notes are status trackers, not knowledge stores.

- **In a Stream note:** current status, progress updates, decisions made within the stream, next steps, blockers, and links to relevant Pillars notes
- **In Pillars:** technical findings, architectural knowledge, reusable methodologies, designs, and approaches that outlive the stream

When a stream produces lasting insight, extract it to the relevant Pillars note and link back from the stream. A stream note that accumulates deep technical content is a signal that content needs to move.

Streams that conclude (`Settled`) should have their durable knowledge already in Pillars. The settled note becomes a record of what was done and where the knowledge now lives.

---

## Index Notes (strictly enforced)

Every folder must have an **index note** with the same name as the folder (e.g. `Productivity/Productivity.md`). The index note:

- Acts as the entry point and overview for that folder
- Uses the collection card format (`card/note`) rather than the full Note template
- Does **not** duplicate content - it contextualises and points

**What an index note is not:** a nav menu. A list of sub-note names with one-line descriptions tells the reader nothing they could not learn from the folder structure itself. An index note earns its place by explaining what each sub-area contains, why it exists, and how it relates to the others - substantively enough that a reader can decide whether to follow a link without having to open it.

**What an index note is:** a miniature overview of the subtree. The body should have a prose **Overview** section that explains the folder's purpose and how its contents fit together, followed by one named H2 section per direct child - not a `## Contents` list. Each child section introduces that sub-note or sub-folder in two to four sentences: what it covers, what problem it solves or what role it plays, and what a reader will find there. `## Contents` lists are a fallback for children that genuinely cannot be contextualised in prose, and only at depth 1.

When creating a new folder, create its index note at the same time. When auditing an existing folder, verify its index note exists and is substantive - not a nav menu.

**Calendar folder exception:** Time-based Calendar folders (year, month, week) use date-prefixed periodic notes as their effective entry points (e.g. `2026-03 March.md` within `2026-03 March/`). These do not require a separate same-named index file. Year folders are the exception - they require a `YYYY.md` index (e.g. `2026.md`) listing their month and week sub-folders, since no single periodic note covers the whole year.

**`+` inbox exception:** The `+` folder is the inbox for unsorted captures awaiting filing. It is not a structured notes area and is exempt from the index note rule. Files in `+` should be routed to their correct location as soon as their destination is known.

---

## Related Topics

- [[Pillars/Knowledge Islands/Conventions/Structure/Structure|Structure]] - parent index
- [[Pillars/Knowledge Islands/Knowledge Islands|Knowledge Islands]] - island types, archipelago model, and governance infrastructure
