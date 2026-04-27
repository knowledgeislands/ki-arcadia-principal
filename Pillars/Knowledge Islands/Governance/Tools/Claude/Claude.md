---
tags:
  - card/note
  - topic/ai
  - topic/productivity
  - topic/knowledge-management
  - source/claude
status: current - April 2026
purpose: Document how Claude integrates with the island, including operating modes and routing rules
author: Written with Claude
---

# Claude

## Overview

This note documents how Claude integrates with the island - both as a tool for querying existing knowledge and as a source of new notes to be captured into it. The integration is bidirectional: the island informs Claude, and Claude outputs are routed back into the island.

---

## How It Works

The integration relies on three components:

- **[[CLAUDE]]** (repository root) - the master context file loaded automatically at the start of any island session. Contains the folder structure, note format, tagging conventions, routing rules, and the British English requirement.
- **island skill** - an installed Cowork skill that provides five operating modes (save, update, query, extract, digest). The skill name and trigger phrases are defined in [[Pillars/Knowledge Capital/Identity|Identity]].
- **[[Note - General]]** (`Templates/Note - General.md`) - the standard note template for new notes.

---

## Five Modes

**Save** - create a new note from a Claude conversation. Claude determines the correct folder using the routing rules in [[CLAUDE]], drafts the note in island format, and confirms before writing.

**Update** - enrich an existing note. Claude reads the current file first, then merges new content in without replacing existing structure.

**Query** - answer a question from island content. Claude searches and reads relevant notes, then responds citing `[[Note Name]]` sources. If the answer can't be found in the island, it captures the answer as a new note and links it to related notes.

**Extract** - distil a whole conversation. Claude reviews the session, identifies distinct reusable knowledge, proposes titles and destination folders for each piece, and writes the approved ones.

**Digest** - write a session digest into today's daily Calendar note. Structured fields: Context, Decisions, Facts Learned, Related Projects, Keywords.

---

## Routing Rules

Routing is defined canonically in [[Structure]]. All Claude-generated notes carry the `source/claude` tag.

---

## Token Economics

Every context file loaded costs tokens. The integration is designed to minimise overhead without losing operating capability. Approximate sizes:

| File                        | ~Tokens    | Bytes  | Loaded when            |
| --------------------------- | ---------- | ------ | ---------------------- |
| KB Skill SKILL.md           | ~400       | -      | Every KB skill session |
| CLAUDE.md                   | ~2,250     | ~9,000 | Every KB skill session |
| **Total (writing session)** | **~2,650** |        |                        |

Mistakes and Lessons was previously loaded as a pre-flight check (~1,770 tokens, 7,082 bytes) on every writing session. All resolved lessons are now extracted to auto-memory files and are active in every session without a file read - saving ~1,770 tokens per writing session. [[Mistakes and Lessons]] is retained as a human-readable incident register only.

### Design rules keeping costs down

- **[[CLAUDE]] is the sole routing authority** - the skill defers to it rather than duplicating rules, so there is one file to read, not two.
- **Lessons live in auto-memory** - all resolved lessons from [[Mistakes and Lessons]] are extracted to the relevant `feedback_*` memory files. The lessons are active in every session at zero marginal cost; the KB note is a human-readable register, not a machine-read file.
- **[[CLAUDE]] folder table is two columns only** - verbose routing logic lives in the Routing Rules section, not duplicated in the table.

### Maintenance triggers

Flag for review if:

- [[CLAUDE]] grows above ~10,000 bytes (~2,500 tokens). Audit for redundant or over-explained sections. _(Currently ~9,000 bytes - approaching threshold.)_
- The auto-memory operations file (`feedback_{kb_prefix}_operations.md` - prefix from [[Pillars/Knowledge Capital/Identity|Identity]]) grows unwieldy. Check whether any rules can be tightened or consolidated - it is loaded every session.
- A new permanent section is added to [[CLAUDE]] - reconsider whether it is actually needed at load time or could be lazily read only when relevant.

---

## Memory

Claude's memory across sessions operates at two levels: **auto-memory** (built-in, automatic) and **deep memory** (structured, via skill).

### Auto-memory

Auto-memory is a built-in Cowork feature. Claude automatically saves facts worth preserving between conversations into `.auto-memory/` at the session root - outside the island vault, in the Cowork workspace. An index file (`MEMORY.md`) is loaded at the start of every session; individual memory files are read on demand.

Four types of memory are stored:

| Type        | Purpose                                                        |
| ----------- | -------------------------------------------------------------- |
| `user`      | Who the user is - role, preferences, working style             |
| `project`   | Ongoing work context - decisions, deadlines, motivations       |
| `feedback`  | Corrections and validated approaches - what to repeat or avoid |
| `reference` | Pointers to where information lives in external systems        |

Auto-memory is managed by Claude automatically. Explicit instructions ("remember this", "forget that") are honoured immediately.

### `/productivity:memory-management` skill

The `productivity:memory-management` skill provides a structured **deep memory** layer - a decoder ring for workplace shorthand, nicknames, acronyms, and project codenames. Its default architecture is:

- `CLAUDE.md` as a hot cache (~30 people, ~30 terms, active projects)
- `memory/` directory for full-depth storage: `glossary.md`, `people/`, `projects/`, `context/`

**KB routing convention:** the `memory/` directory is a skill convention, not an island convention. If a `memory/` folder is created during a session, it should be treated as a staging area, not a permanent home. Consult [[Pillars/Knowledge Capital/Routing Rules|Routing Rules]] for the correct destination paths in this KB, then migrate content and remove the folder.

---

## Contents

- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Memory Architecture|Memory Architecture]] - auto-memory file conventions, canonical vs auxiliary classes, and the KB↔memory mapping for this KB
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Claude Behaviour|Claude Behaviour]] - behavioural constraints for Claude: what to do and avoid, regardless of who is using the KB
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Cowork Configuration Layers|Cowork Configuration Layers]] - the four layers through which Claude receives preferences and rules, and what belongs in the Cowork project instructions box
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Mistakes and Lessons|Mistakes and Lessons]] - documented errors, resolutions, and lessons learned from Claude island sessions
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Island Skill|Island Skill]] - the Cowork skill that provides the five operating modes
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/AI Automation Patterns|AI Automation Patterns]] - design patterns for recurring AI automations, including the execution/change frequency caching principle
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Live Artifacts|Live Artifacts]] - reusable prompts and design notes for Cowork live-artifact HTML pages

---

## Further Reading

- [[CLAUDE|CLAUDE]] - top-level context file loaded by Claude at session start
- [[Concept|Methodology]] - overall Knowledge Management methodology this integration supports

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Tools/Tools|Tools]] - parent index
- [[Pillars/Productivity/Tools/Obsidian|Obsidian]] - primary interface used alongside the Claude integration
