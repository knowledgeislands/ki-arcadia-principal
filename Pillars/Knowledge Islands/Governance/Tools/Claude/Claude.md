---
tags:
  - card/note
  - topic/ai
  - topic/productivity
  - topic/knowledge-management
  - source/claude
status: current - April 2026
purpose: Document how Claude is configured as a tool — Cowork connection, token economics, memory, and the activity prompt layer
author: Written with Claude
---

# Claude

## Overview

This note documents the Claude tool layer — how Cowork connects Claude to the island, the token economics of the integration, and the prompt library for activities. How Claude operates as an agent (five modes, behavioural constraints, memory architecture) is documented in [[Pillars/Knowledge Islands/Governance/Agents/Claude/Claude|Agents/Claude]].

---

## How It Works

The integration relies on three components:

- **[[CLAUDE]]** (repository root) - the master context file loaded automatically at the start of any island session. Contains the folder structure, note format, tagging conventions, routing rules, and the British English requirement.
- **island skill** - an installed Cowork skill that provides five operating modes (save, update, query, extract, digest). The skill name and trigger phrases are defined in [[Pillars/Knowledge Capital/Identity|Identity]].
- **[[Note - General]]** (`Templates/Note - General.md`) - the standard note template for new notes.

---

## Operating Modes

Claude operates in five modes (Save, Update, Query, Extract, Digest) defined in [[Pillars/Knowledge Islands/Governance/Agents/Claude/Island Skill|Island Skill]]. The prompt that drives them is the island skill installed in Cowork — configured in [[Pillars/Knowledge Capital/Identity|Identity]].

All Claude-generated notes carry the `source/claude` tag. Routing is defined canonically in [[Structure]].

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

## Cowork Configuration Layers

[[Pillars/Knowledge Islands/Governance/Tools/Claude/Cowork Configuration Layers|Cowork Configuration Layers]] documents the four layers through which Claude receives preferences and rules in a Cowork session: the system prompt, the Cowork project instructions box, the island skill, and the CLAUDE.md context file. Understanding which layer each type of instruction belongs in prevents duplication and keeps the configuration coherent as the island evolves.

---

## Mistakes and Lessons

[[Pillars/Knowledge Islands/Governance/Tools/Claude/Mistakes and Lessons|Mistakes and Lessons]] is the human-readable incident register for Claude sessions — documented errors, their resolutions, and the lessons extracted from them. All resolved lessons are extracted to auto-memory files so they are active in every session without a file read; this note is the audit trail, not the operational source.

---

## Live Artifacts

[[Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Live Artifacts|Live Artifacts]] is the canonical home for Cowork live-artifact HTML pages — self-contained dashboards that persist in the Cowork sidebar and re-fetch data from MCP tools on each open. Each artifact is represented by a recipe note (design decisions, reusable prompt, updating instructions) and a colocated HTML backup of the approved version.

---

## Activities

[[Pillars/Knowledge Islands/Governance/Tools/Claude/Activities/Activities|Activities]] is the Layer 5 prompt library — the executable prompts that drive scheduled and conversational activities, organised into one subfolder per activity group (Email, Maintenance, Briefings, Linear). What each activity does and why is documented at Layer 1 under [[Pillars/Knowledge Islands/Governance/Activities/Activities|Activities]].

---

## Further Reading

- [[CLAUDE|CLAUDE]] - top-level context file loaded by Claude at session start
- [[Pillars/Knowledge Islands/Concept/Concept|Concept]] - the conceptual model this integration supports

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Tools/Tools|Tools]] - parent index
- [[Pillars/Productivity/Tools/Obsidian|Obsidian]] - primary interface used alongside the Claude integration
