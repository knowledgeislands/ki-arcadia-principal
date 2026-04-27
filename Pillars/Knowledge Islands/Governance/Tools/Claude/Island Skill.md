---
tags:
  - card/note
  - topic/productivity
  - topic/knowledge-management
  - topic/ai
  - topic/automation
  - source/claude
status: current - April 2026
purpose: island skill reference note
author: Written with Claude
---

# Island Skill

## Overview

This defines the island Cowork skill for interacting with the island. The skill name and trigger phrases are defined in [[Pillars/Knowledge Capital/Identity|Identity]]. It provides structured operating modes for saving new notes, updating existing notes, querying information, extracting reusable knowledge from conversations, and writing session digests.

All operations follow the routing rules and conventions in [[CLAUDE]].

---

## Step 1 - Load island Context

`CLAUDE.md` is loaded automatically as project context - it is the complete authority on island structure, note format, routing rules, tagging conventions, pre-flight checks, and British English. No explicit read is required. Follow it precisely for all operations.

When an operation needs integration configuration (MCP tools, project IDs, calendar sources), read the relevant note from `Pillars/Knowledge Capital/` - do not hardcode tool identifiers or project IDs. See [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]] for the full index.

---

## Step 2 - Determine Mode

Infer the mode from the request, or ask if unclear:

### Mode A: SAVE - write a new note

1. Read [[Mistakes and Lessons]] as pre-flight check before writing
2. Identify content; determine folder using the routing rules in CLAUDE.md
3. Propose filename (title case, spaces, `.md`)
4. Draft note using `Pillars/Productivity/Templates/Note - General.md`; include `source/claude` tag in frontmatter
5. Confirm, then write

### Mode B: UPDATE - enrich an existing note

1. Read [[Mistakes and Lessons]] as pre-flight check before writing
2. Find and read the existing note
3. Draft merged version - enrich, don't replace
4. Confirm, then write

### Mode C: QUERY - answer from island content

1. Search and read relevant notes
2. Answer citing `[[Note Name]]`
3. If the question can't be answered from the island, capture the researched answer as a new note (Mode A), linking to related notes

### Mode D: EXTRACT - distil a conversation

1. Identify distinct reusable knowledge from the conversation
2. Propose title, folder, and draft for each piece
3. Confirm, then write approved notes

### Mode E: DIGEST - session digest

1. Create a sibling Calendar note (`YYYY-MM-DD Session - [Topic].md`) following the Session Digests format in CLAUDE.md. Reference it from today's daily note by wikilink - do not write digest content inline into the daily note
2. If today's daily note doesn't exist, create it first using `Pillars/Productivity/Templates/Calendar - Daily.md`
3. Session notes are temporary - see CLAUDE.md (Session Digests section) for the full lifecycle: once a note's content has been extracted to Pillars or Streams, delete the session note

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Claude|Claude]] - parent index
- [[Pillars/Knowledge Islands/Governance/Activities/Activities|Activities]] - the scheduled tasks that use this skill
