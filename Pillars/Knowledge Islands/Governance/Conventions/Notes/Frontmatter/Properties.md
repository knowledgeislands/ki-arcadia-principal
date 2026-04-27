---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: current - April 2026
purpose: Standard YAML frontmatter properties for all notes — required fields, optional fields, and their permitted values
author: Written with Claude
memory_file: project_{kb_prefix}_note_format.md
---

# Properties

## Overview

Every note carries a YAML frontmatter block. The properties below apply to all `card/note` type notes. Collection cards (`card/person`, `card/org`, etc.) use relevant custom properties instead — see [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Frontmatter/Tags|Tags]] for the full card taxonomy.

All fields except `creator` are required. Frontmatter must be YAML properties — not inline bullet points.

---

## Standard Properties

| Property      | Values / Format                                                                                                                                                                 |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `status`      | `draft - Month YYYY` / `current - Month YYYY` / `archive - Month YYYY` / `outdated - Month YYYY`                                                                                |
| `purpose`     | One-line description of what the note is for                                                                                                                                    |
| `author`      | `Manual` / `Written with Claude` / `Mixed` - always the note's author, not the subject's                                                                                        |
| `creator`     | Optional - the author of the external work being referenced, e.g. `creator: "[[Author Name]]"`                                                                                  |
| `memory_file` | Optional - filename(s) of the auto-memory file(s) that mirror this note (e.g. `reference_{kb_prefix}_key_notes.md`). Use a YAML list when multiple files apply.                 |
| `day_type`    | Calendar daily notes only - `work-day`, `bank-holiday`, `annual-leave`, or `weekend`. Set by Morning Briefing automation; see [[Pillars/Knowledge Capital/Schedule\|Schedule]]. |

---

## Status Values

`outdated` signals that a note has not been reviewed and should be verified before being relied on — typically applied to bulk-added notes or notes that have not kept pace with changes elsewhere. It is distinct from `archive`, which is a deliberate retirement of content that is no longer relevant.

| Value       | Meaning                                                                    |
| ----------- | -------------------------------------------------------------------------- |
| `draft`     | Work in progress - content may be incomplete                               |
| `current`   | Reviewed and up to date                                                    |
| `outdated`  | Not reviewed - verify before relying on it                                 |
| `archive`   | Deliberately retired - content is no longer relevant but preserved for reference |

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Frontmatter/Frontmatter|Frontmatter]] - parent index
- [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Frontmatter/Tags|Tags]] - tag taxonomy
