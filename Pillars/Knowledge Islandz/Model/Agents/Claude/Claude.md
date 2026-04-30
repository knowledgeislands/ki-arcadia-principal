---
tags:
  - card/note
  - topic/ai
  - topic/knowledge-islands
  - source/claude
status: current - April 2026
author: Written with Claude
---

# Claude

## Overview

The Claude agent layer — how Claude operates as an agent within the island. This covers Claude's operating modes, behavioural constraints, and memory model, viewed as an agent rather than as a configured tool. Claude is the current implementation of the general [[Agentic AI]] patterns documented in this island's operating layer.

For Cowork integration specifics — connection type, token economics, platform configuration layers, and live artifacts — see [[Tools/Claude/Claude|Tools → Claude]].

---

## Operating Modes

Claude operates in five modes that define its structured repertoire for knowledge work — each maps a type of intent to a defined sequence of actions. The skill name and trigger phrases are defined in [[Charter]].

### Load Island Context

`CLAUDE.md` is loaded automatically as project context — it is the complete authority on island structure, note format, routing rules, tagging conventions, pre-flight checks, and British English. No explicit read is required. Follow it precisely for all operations.

When an operation needs integration configuration (MCP tools, project IDs, calendar sources), read the relevant note from `Pillars/Knowledge Capital/` — do not hardcode tool identifiers or project IDs. See [[Knowledge Capital]] for the full index.

### Determine Mode

Infer the mode from the request, or ask if unclear:

#### Mode A: Save — write a new note

1. Read [[Mistakes and Lessons]] as pre-flight check before writing
2. Identify content; determine folder using the routing rules in CLAUDE.md
3. Propose filename (title case, spaces, `.md`)
4. Draft note using `Pillars/Knowledge Islands/Tools/Obsidian/Templates/Note - General.md`; include `source/claude` tag in frontmatter
5. Confirm, then write

#### Mode B: Update — enrich an existing note

1. Read [[Mistakes and Lessons]] as pre-flight check before writing
2. Find and read the existing note
3. Draft merged version — enrich, don't replace
4. Confirm, then write

#### Mode C: Query — answer from island content

1. Search and read relevant notes
2. Answer citing `[[Note Name]]`
3. If the question can't be answered from the island, capture the researched answer as a new note (Mode A), linking to related notes

#### Mode D: Extract — distil a conversation

1. Identify distinct reusable knowledge from the conversation
2. Propose title, folder, and draft for each piece
3. Confirm, then write approved notes

#### Mode E: Digest — session digest

1. Create a sibling Calendar note (`YYYY-MM-DD Session - [Topic].md`) following the Session Digests format in CLAUDE.md. Reference it from today's daily note by wikilink — do not write digest content inline into the daily note
2. If today's daily note doesn't exist, create it first using `Pillars/Knowledge Islands/Tools/Obsidian/Templates/Calendar - Daily.md`
3. Session notes are temporary — see CLAUDE.md (Session Digests section) for the full lifecycle: once a note's content has been extracted to Pillars or Streams, delete the session note

---

## Behavioural Constraints

Behavioural expectations for Claude when working with this island. These apply regardless of who is using the island — they are not personal style preferences but operating conventions for the AI layer.

### What Claude Should Do

- Use British English in every response, without exception
- Keep sentences short to medium; use em-dashes for pauses and asides
- Lead with the point; explain the reasoning after, not before
- Use concrete examples over abstract characterisation
- Be honest about uncertainty rather than softening or hedging excessively
- Use lists and tables only when the content genuinely calls for them; default to prose
- Match the register of the context — shorter and plainer for notes, more structured for professional output
- End paragraphs and sections with a landing sentence, not a trailing qualifier

### What Claude Should Avoid

- "Certainly", "Absolutely", "Of course", "I'd be happy to" — AI filler phrases
- Restating the user's request before answering it
- Summarising what was just said at the end of a response
- Bullet-listing things that should be in prose
- Corporate or formal language where plain language serves
- Excessive warmth-signalling (effusive praise, enthusiasm for the task)
- American spellings (analyze, color, recognize, etc.)
- Long, winding compound sentences with multiple subordinate clauses
- Starting every response with the same opener (e.g. "Great question!")
- Phrases that frame honesty or transparency as a deliberate act — "to be honest", "I should be transparent", "I'll be candid" — these imply the alternative and unnecessarily anthropomorphise. State things directly.

---

## Memory

How Claude's auto-memory is structured for this island. For the underlying three-tier model and residency principles, see [[Residency]]. This section covers the implementation: file conventions, the two classes of memory file, and the full island ↔ memory mapping.

### How Auto-Memory Works

Claude's auto-memory is a Claude Code feature — see [How Claude remembers your project][claude-memory] for the canonical reference. It is a file-based persistence layer that lets Claude accumulate knowledge across sessions. Claude decides what is worth saving; it does not write something every session. Cowork builds on this with its own conventions: the `.auto-memory/` directory at the workspace root, and typed frontmatter on individual memory files.

Two files are always in play:

- **`MEMORY.md`** — the index. The first 200 lines (or 25KB, whichever comes first) are loaded automatically at the start of every session. One line per memory file; tells Claude what files exist and what each contains. Must be accurate and concise — content past the 200-line threshold is not loaded at session start.
- **Individual memory files** — not loaded at startup. Read on demand when the index entry suggests they're relevant to the current task.

Memory files use a typed frontmatter structure:

```yaml
---
name: Descriptive name
description: One-line hook used to judge relevance
type: user | project | feedback | reference
---
```

The `type` field is a Cowork convention — not part of the base Claude Code auto-memory spec. The four allowed values:

| Type        | Purpose                                                        | Typical island knowledge                                                     |
| ----------- | -------------------------------------------------------------- | ---------------------------------------------------------------------------- |
| `user`      | Who the user is — role, preferences, working style             | Communication style, personal preferences, profile                           |
| `project`   | Ongoing work context — decisions, structure, configuration     | Island structure, note format, tag taxonomy, volatile implementation details |
| `feedback`  | Corrections and validated approaches — what to repeat or avoid | Operational rules, file operation lessons, recurring corrections             |
| `reference` | Pointers to where information lives in external systems        | Activity schedules, integration config, paths to canonical notes             |

The filename convention is `{type}_{scope_prefix}_{descriptor}.md`, where `scope_prefix` is one of:

| Scope prefix                                                   | Meaning                                                      | Example                                |
| -------------------------------------------------------------- | ------------------------------------------------------------ | -------------------------------------- |
| Knowledge Island identifier (e.g. `arcadia-principal`)         | Specific to this Knowledge Island                            | `feedback_{island-name}_operations.md` |
| User identifier (e.g. `kit`)                                   | Specific to this user                                        | `user_kit_profile.md`                  |
| `any`                                                          | Cross-context — applies to any Knowledge Island or session   | `feedback_any_claude_behaviour.md`     |

The prefix distinguishes files from multiple islands sharing the same `.auto-memory/` directory, and signals whether a rule is island-specific or universally applicable.

### Two Classes of Memory File

**Canonical files** are managed exclusively by [[Knowledge Rebuild]]. They are rewritten from the island on a regular schedule. Do not edit them manually between rebuilds — changes will be overwritten. The five canonical files are:

| File                                 | Source island notes                                                          |
| ------------------------------------ | ---------------------------------------------------------------------------- |
| `user_{user_prefix}_profile.md`      | Identity + Communication Style                                               |
| `project_{ki_prefix}_structure.md`   | Island Structure + Routing Rules + Knowledge Residency                       |
| `project_{ki_prefix}_note_format.md` | Notes/Format + Notes/Frontmatter                                             |
| `feedback_{ki_prefix}_operations.md` | Mistakes and Lessons + Activities                                            |
| `reference_{ki_prefix}_key_notes.md` | Identity + Activities + Integrations + Claude.md + Memory Architecture       |

**Auxiliary files** are created ad-hoc during sessions when Claude saves something worth preserving. They persist between rebuilds and are never overwritten by Knowledge Rebuild. They accumulate until promoted to the island or explicitly pruned. See [[Residency]] for promotion criteria and lifecycle.

### Island ↔ Memory Mapping

_The table below uses `{ki_prefix}` and `{user_prefix}` placeholders — substitute the actual values from [[Charter]] when reading for a specific island. [[Knowledge Rebuild]] uses this table during its gap analysis to validate that every listed file exists in `.auto-memory/` and that every file in `.auto-memory/` is documented here._

| Island Note | Memory File | Class | Notes |
| --- | --- | --- | --- |
| `Island Structure.md`<br>`Routing Rules.md`<br>`Knowledge Residency.md` | `project_{ki_prefix}_structure.md` | Canonical | Three island notes merged; Routing Rules adds three-domain model; Knowledge Residency adds residency tiers and lifecycle |
| `Notes/Notes.md`<br>`Notes/Frontmatter/Frontmatter.md` | `project_{ki_prefix}_note_format.md` | Canonical | Two island notes merged; island has worked examples memory omits |
| `Mistakes and Lessons.md` | `feedback_{ki_prefix}_operations.md` | Canonical | M&L has full incident table; memory distils to actionable rules; also draws from Activities |
| `Activities.md`<br>`Identity.md`<br>`Integrations.md`<br>`Claude.md`<br>`Memory Architecture.md` | `reference_{ki_prefix}_key_notes.md` | Canonical | Five island sources merged; Memory Architecture contributes mapping table and rebuild specification |
| `Communication Style.md`<br>`Identity.md` | `user_{user_prefix}_profile.md` | Canonical | Communication Style covers the user's voice and habits; Identity contributes role and operating context |
| `Mistakes and Lessons.md` | `feedback_{ki_prefix}_notion_tag_updates.md` | Auxiliary (island) | M&L has general rule; memory adds implementation detail not in island |
| `Mistakes and Lessons.md` | `feedback_{ki_prefix}_multi_column.md` | Auxiliary (island) | M&L has general rule; memory adds syntax example not in island |
| `Mistakes and Lessons.md` | `feedback_any_context_limit_warning.md` | Auxiliary (any) | Closely aligned |
| `Claude Behaviour.md` | `feedback_any_claude_behaviour.md` | Auxiliary (any) | Claude behavioural constraints; `any_` scope preserves cross-island applicability |
| _(ad-hoc — no island source)_ | `reference_{ki_prefix}_deep_memory.md` | Auxiliary (island) | Pointers to island locations assembled from session context — not tied to a single island note |
| `Enactment Process.md` | `feedback_{ki_prefix}_enactment_process.md` | Auxiliary (island) | Working rules and proposal patterns; park-and-resume detail is memory-appropriate |
| _(ad-hoc — no island source)_ | `feedback_{ki_prefix}_scheduled_task_push_timing.md` | Auxiliary (island) | Prompt push timing rules; core rule now covered by canonical operations file — candidate for deletion |
| _(ad-hoc — no island source)_ | `feedback_{ki_prefix}_theme_note_titles.md` | Auxiliary (island) | Email theme note title conventions; ad-hoc, no island source note yet |
| _(ad-hoc — no island source)_ | `feedback_any_task_naming.md` | Auxiliary (any) | TodoList task naming conventions (project tag prefixes); general, not island-specific |

---

[claude-memory]: https://code.claude.com/docs/en/memory
