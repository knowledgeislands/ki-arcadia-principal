---
tags:
  - card/note
  - topic/knowledge-management
  - topic/ai
  - source/claude
status: current - April 2026
purpose: Document how Claude's auto-memory is structured for this Knowledge Island - file conventions, canonical vs auxiliary classes, and the KI ↔ memory mapping
author: Written with Claude
memory_file: reference_{ki_prefix}_key_notes.md
---

# Memory Architecture

## Overview

How Claude's auto-memory is structured for this island. For the underlying three-tier model and residency principles, see [[Pillars/Knowledge Islands/Governance/Conventions/Residency/Residency|Residency]]. This note covers the implementation: file conventions, the two classes of memory file, and the full KI ↔ memory mapping for this KI.

---

## How Auto-Memory Works

Claude's auto-memory is a Claude Code feature - see [How Claude remembers your project](https://code.claude.com/docs/en/memory) for the canonical reference. It is a file-based persistence layer that lets Claude accumulate knowledge across sessions. Claude decides what is worth saving; it does not write something every session. Cowork builds on this with its own conventions: the `.auto-memory/` directory at the workspace root, and typed frontmatter on individual memory files.

Two files are always in play:

- **`MEMORY.md`** - the index. The first 200 lines (or 25KI, whichever comes first) are loaded automatically at the start of every session. One line per memory file; tells Claude what files exist and what each contains. Must be accurate and concise - content past the 200-line threshold is not loaded at session start.
- **Individual memory files** - not loaded at startup. Read on demand when the index entry suggests they're relevant to the current task.

Memory files use a typed frontmatter structure:

```yaml
---
name: Descriptive name
description: One-line hook used to judge relevance
type: user | project | feedback | reference
---
```

The `type` field is a Cowork convention - not part of the base [Claude Code auto-memory](https://code.claude.com/docs/en/memory) spec. The four allowed values:

| Type        | Purpose                                                        | Typical KI knowledge                                                     |
| ----------- | -------------------------------------------------------------- | ------------------------------------------------------------------------ |
| `user`      | Who the user is - role, preferences, working style             | Communication style, personal preferences, profile                       |
| `project`   | Ongoing work context - decisions, structure, configuration     | KI structure, note format, tag taxonomy, volatile implementation details |
| `feedback`  | Corrections and validated approaches - what to repeat or avoid | Operational rules, file operation lessons, recurring corrections         |
| `reference` | Pointers to where information lives in external systems        | Activity schedules, integration config, paths to canonical notes         |

The filename convention is `{type}_{scope_prefix}_{descriptor}.md`, where `scope_prefix` is one of:

| Scope prefix                                           | Meaning                                                    | Example                                                |
| ------------------------------------------------------ | ---------------------------------------------------------- | ------------------------------------------------------ |
| Knowledge Island identifier (e.g. `arcadia-principal`) | Specific to this Knowledge Island                          | `feedback_{island-name}_operations.md` |
| User identifier (e.g. `kit`)                           | Specific to this user                                      | `user_kit_profile.md`                                  |
| `any`                                                  | Cross-context - applies to any Knowledge Island or session | `feedback_any_claude_behaviour.md`                     |

The prefix distinguishes files from multiple KIs sharing the same `.auto-memory/` directory, and signals whether a rule is KI-specific or universally applicable.

---

## Two Classes of Memory File

**Canonical files** are managed exclusively by [[Pillars/Knowledge Islands/Governance/Activities/Tending/Knowledge Rebuild|Knowledge Rebuild]]. They are rewritten from the KI on a regular schedule. Do not edit them manually between rebuilds - changes will be overwritten. The five canonical files are:

| File                                 | Source KI notes                                                           |
| ------------------------------------ | ------------------------------------------------------------------------- |
| `user_{user_prefix}_profile.md`      | KI Identity + Communication Style                                         |
| `project_{ki_prefix}_structure.md`   | Island Structure + Routing Rules + Knowledge Residency                    |
| `project_{ki_prefix}_note_format.md` | Notes/Format + Notes/Frontmatter                                          |
| `feedback_{ki_prefix}_operations.md` | Mistakes and Lessons + Activities                                         |
| `reference_{ki_prefix}_key_notes.md` | KI Identity + Activities + Integrations + Claude.md + Memory Architecture |

**Auxiliary files** are created ad-hoc during sessions when Claude saves something worth preserving. They persist between rebuilds and are never overwritten by Knowledge Rebuild. They accumulate until promoted to the KI or explicitly pruned. See [[Pillars/Knowledge Islands/Governance/Conventions/Residency/Residency|Residency]] for promotion criteria and lifecycle.

---

## KI ↔ Memory Mapping

_The table below uses `{ki_prefix}` and `{user_prefix}` placeholders - substitute the actual values from [[Pillars/Knowledge Capital/Charter|Charter]] when reading for a specific KI. [[Pillars/Knowledge Islands/Governance/Activities/Tending/Knowledge Rebuild|Knowledge Rebuild]] uses this table during its gap analysis to validate that every listed file exists in `.auto-memory/` and that every file in `.auto-memory/` is documented here._

| KI Note | Memory File | Class | Notes |
| --- | --- | --- | --- |
| `Island Structure.md`<br>`Routing Rules.md`<br>`Knowledge Residency.md` | `project_{ki_prefix}_structure.md` | Canonical | Three KI notes merged; Routing Rules adds three-domain model; Knowledge Residency adds residency tiers and lifecycle |
| `Notes/Notes.md`<br>`Notes/Frontmatter/Frontmatter.md` | `project_{ki_prefix}_note_format.md` | Canonical | Two KI notes merged; KI has worked examples memory omits |
| `Mistakes and Lessons.md` | `feedback_{ki_prefix}_operations.md` | Canonical | M&L has full incident table; memory distils to actionable rules; also draws from Activities |
| `Activities.md`<br>`KI Identity.md`<br>`Integrations.md`<br>`Claude.md`<br>`Memory Architecture.md` | `reference_{ki_prefix}_key_notes.md` | Canonical | Five KI sources merged; Memory Architecture contributes mapping table and rebuild specification |
| `Communication Style.md`<br>`KI Identity.md` | `user_{user_prefix}_profile.md` | Canonical | Communication Style covers the user's voice and habits; KI Identity contributes role and operating context |
| `Mistakes and Lessons.md` | `feedback_{ki_prefix}_notion_tag_updates.md` | Auxiliary (KI) | M&L has general rule; memory adds implementation detail not in KI |
| `Mistakes and Lessons.md` | `feedback_{ki_prefix}_multi_column.md` | Auxiliary (KI) | M&L has general rule; memory adds syntax example not in KI |
| `Mistakes and Lessons.md` | `feedback_any_context_limit_warning.md` | Auxiliary (any) | Closely aligned |
| `Claude Behaviour.md` | `feedback_any_claude_behaviour.md` | Auxiliary (any) | Claude behavioural constraints; `any_` scope preserves cross-KI applicability |
| _(ad-hoc - no KI source)_ | `reference_{ki_prefix}_deep_memory.md` | Auxiliary (KI) | Pointers to KI locations assembled from session context - not tied to a single KI note |
| `Enactment Process.md` | `feedback_{ki_prefix}_enactment_process.md` | Auxiliary (KI) | Working rules and proposal patterns; park-and-resume detail is memory-appropriate |
| _(ad-hoc - no KI source)_ | `feedback_{ki_prefix}_scheduled_task_push_timing.md` | Auxiliary (KI) | Prompt push timing rules; core rule now covered by canonical operations file - candidate for deletion |
| _(ad-hoc - no KI source)_ | `feedback_{ki_prefix}_theme_note_titles.md` | Auxiliary (KI) | Email theme note title conventions; ad-hoc, no KI source note yet |
| _(ad-hoc - no KI source)_ | `feedback_any_task_naming.md` | Auxiliary (any) | TodoList task naming conventions (project tag prefixes); general, not KI-specific |

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Agents/Claude/Claude|Claude]] - parent index
- [[Pillars/Knowledge Islands/Governance/Conventions/Residency/Residency|Residency]] - the three-tier model and residency principles this architecture implements
- [[Pillars/Knowledge Islands/Governance/Activities/Tending/Knowledge Rebuild|Knowledge Rebuild]] - the scheduled task that maintains the canonical memory layer
- [[Pillars/Knowledge Capital/Charter|Charter]] - source of `ki_prefix` and `user_prefix` values
