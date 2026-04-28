# CLAUDE

This repository is the island - a structured repository of knowledge, comprising of folders and Markdown files.

IMPORTANT: Load this file at the start of any session involving the island.

## Approach

Full specification in [[Concept]]. Summary:

- **Goal**: Build a canonical, living record of knowledge such that the island informs decisions, onboarding, tooling, and AI interactions
- **Continual Improvement**: Outputs from interactions should feed back into the island, creating a cycle of improvement
- **Structure**: Interconnected notes using `[[wikilinks]]`, frontmatter tags, and a loose Zettelkasten approach. Quality over quantity
- **Tone**: Structured and direct, with depth where warranted. Not corporate or flowery
- **Language**: British English throughout - spellings, idioms, and phrasing

## Library Structure

Full specification in [[Structure]]. Summary:

- 4 top-level folders: `Calendar` (daily notes, meeting notes, session digests, and periodic reviews), `Pillars` (internal knowledge - methodology, approach, and domain-specific reference), `Resources` (external reference - things that exist independently), `Streams` (status tracking for projects and workstreams - durable knowledge belongs in Pillars)
- `Pillars` and `Resources` share subfolder names by design - e.g. `Pillars/Finance` holds internal knowledge; `Resources/Finance` holds general reference
- `Streams` sub-folders by priority: `Active`, `Background`, `Dormant`, `Future`, `Settled` (concluded)
- Calendar note types - daily notes, meeting notes, session digests, and the monthly index are all siblings in the same month folder, each referenced from the daily note by wikilink; the daily note does not duplicate their content. Weekly notes are filed separately in a per-year `YYYY By Week/` folder:
  - Daily notes: `Calendar/YYYY/YYYY-MM MonthName/YYYY-MM-DD DayName.md`
  - Meeting notes: `Calendar/YYYY/YYYY-MM MonthName/YYYY-MM-DD Meeting Name.md` - one note per meeting
  - Session digests: `Calendar/YYYY/YYYY-MM MonthName/YYYY-MM-DD Session - Topic.md` - one note per AI work session
  - Monthly index: `Calendar/YYYY/YYYY-MM MonthName/YYYY-MM MonthName.md` - same name as the folder; index note for the month
  - Weekly notes: `Calendar/YYYY/YYYY By Week/YYYY WXX.md` - all weeks for a year collected in one sibling folder (e.g. `Calendar/2026/2026 By Week/2026 W14.md`); the folder has its own index note (`YYYY By Week.md`)

### Pillars/Resources boundary (strictly enforced)

The general principle: `Pillars` holds internal knowledge owned by the KB; `Resources` holds external reference material that exists independently. Methodology or internal content found in Resources belongs in Pillars. The canonical boundary definition is in [[Pillars/Knowledge Islands/Governance/Conventions/Structure/Library/Library|Library]] under "Pillars/Resources Boundary".

### Index Notes (strictly enforced)

Every folder must have an index note with the same name (e.g. `Productivity/Productivity.md`). It uses `card/note` format and does not duplicate content - it contextualises and points. Create it when creating the folder.

**Structure:** A prose `## Overview` section explaining the folder's purpose and how its contents fit together, followed by one named H2 section per direct child. Each child section introduces the sub-note or sub-folder in two to four substantive sentences - what it covers, why it exists, what a reader will find. A `## Contents` list is a last resort for children that cannot be contextualised in prose.

**Anti-pattern:** A list of sub-note names with one-line descriptions is a nav menu - it tells the reader nothing they could not learn from the folder structure itself. Index notes must be richer than this.

**Calendar exception:** Year folders require a `YYYY.md` index. Month and week folders use their date-prefixed periodic notes as entry points - no separate index note is needed.

**`+` folder exception:** The `+` folder is the inbox for unsorted captures awaiting filing and is exempt from the index note rule. Its subfolders do not require index notes. Do not use it as an asset store - images and diagrams belong in the same folder as the note they support.

## Knowledge Management Workflow

At the heart of the knowledge management is a cycle of continuous improvement / learning.

### Pre-Flight Checks

Operational rules and known pitfalls are captured in auto-memory (`feedback_{kb_prefix}_operations.md` and related files) - no separate file read is required at session start. If an error occurs during a session, log it in [[Mistakes and Lessons]], apply the fix, update the relevant memory file, and record the resolved lesson in the table.

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

Full note format specification in [[Notes]]. Key rules:

- Before writing any changes, confirm with the user first
- Tag conventions: [[Frontmatter/Tags|Tags]]
- Frontmatter must include `status`, `purpose`, and `author` as YAML properties
  - `status`: `draft - Month YYYY`, `current - Month YYYY`, `outdated - Month YYYY`, or `archive - Month YYYY`
  - `author`: `Manual`, `Written with Claude`, or `Mixed`
- Sections separated by `---`; body uses H2 headings; omit empty footer sections
- Prefer `[[wikilinks]]` over repeating content

### Session Digests

At the close of any substantive session, offer to write a session digest as a sibling Calendar note alongside today's daily note - the same pattern as meeting notes. File at `Calendar/YYYY/YYYY-MM MonthName/YYYY-MM-DD Session - Topic.md`, then reference it from the daily note by wikilink. The session digest's Related Topics must also link back to the daily note. Include: **Context** (what the session was about and why it was needed), **Decisions**, **Facts Learned**, **Related Projects**, **Keywords**.

If a daily note has no sessions, omit the `### Sessions` section entirely - do not leave a placeholder.

Session notes are temporary. Once a session's content has been extracted to the appropriate Pillars or Streams notes, delete the session note - it has no long-term value as a standalone calendar artefact. The test: if the note were deleted today, would any knowledge be lost? If not, delete it.

### Routing Rules for Notes

Full rules in [[Structure]]. Key reminders: do not write to `+/_Voice Notes/` - this folder is managed by the voicenotes-sync plugin. When updating an existing note, read it first and merge in, preserving structure.

See [[Routing Rules]] for any additional routing rules specific to this island.

## KB Specifics (strictly enforced)

All values specific to this island - identity parameters, task prefix, skill triggers, schedule configuration, integration details, and physical paths - live in `Pillars/Knowledge Capital/`. The [[Pillars/Knowledge Capital/Charter|Charter]] is the primary reference: it holds the identity parameters and the full adoption and activity roster. Deeper configuration lives in the corresponding `Pillars/Knowledge Capital/Governance/` subfolders (Activities for schedule config, Tools for integrations, Agents for agent config).

**Automations and skills must read their configuration from these notes at runtime, not hardcode values.** This keeps prompts portable across islands and ensures a single source of truth. When an integration changes (e.g. a new TickTick list, a different calendar), update the relevant KC note - the automations will pick up the change on their next run.

## Key Meta Notes

| Note                                                                              | Path                                                                                |
| --------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| [[Pillars/Knowledge Capital/Charter\|Charter]]                                    | `Pillars/Knowledge Capital/Charter.md`                                              |
| [[Pillars/Knowledge Capital/Knowledge Capital\|Knowledge Capital]]                | `Pillars/Knowledge Capital/Knowledge Capital.md`                                    |
| [[Pillars/Knowledge Islands/Governance/Governance\|Governance]]                   | `Pillars/Knowledge Islands/Governance/Governance.md`                                |
| [[Pillars/Knowledge Islands/Concept/Concept\|Concept]]                            | `Pillars/Knowledge Islands/Concept/Concept.md`                                      |
| [[Pillars/Knowledge Islands/Governance/Conventions/Structure/Structure\|Structure]] | `Pillars/Knowledge Islands/Governance/Conventions/Structure/Structure.md`           |
| [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Notes\|Notes]]           | `Pillars/Knowledge Islands/Governance/Conventions/Notes/Notes.md`                   |
| [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Frontmatter/Frontmatter\|Frontmatter]] | `Pillars/Knowledge Islands/Governance/Conventions/Notes/Frontmatter/Frontmatter.md` |
| [[Pillars/Knowledge Islands/Governance/Activities/Activities\|Activities]]        | `Pillars/Knowledge Islands/Governance/Activities/Activities.md`                     |
| [[Pillars/Knowledge Islands/Governance/Agents/Agents\|Agents]]                    | `Pillars/Knowledge Islands/Governance/Agents/Agents.md`                             |
| [[Pillars/Knowledge Islands/Governance/Tools/Tools\|Tools]]                       | `Pillars/Knowledge Islands/Governance/Tools/Tools.md`                               |
| [[Pillars/Knowledge Islands/Governance/Tools/Claude/Claude\|Claude]]              | `Pillars/Knowledge Islands/Governance/Tools/Claude/Claude.md`                       |
| [[Pillars/Knowledge Islands/Governance/Tools/Claude/Mistakes and Lessons\|Mistakes and Lessons]] | `Pillars/Knowledge Islands/Governance/Tools/Claude/Mistakes and Lessons.md`         |
| [[CLAUDE]]                                                                        | `CLAUDE.md`                                                                         |
