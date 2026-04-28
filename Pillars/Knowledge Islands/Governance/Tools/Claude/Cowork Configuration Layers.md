---
tags:
  - card/note
  - topic/ai
  - topic/productivity
  - topic/knowledge-management
  - source/claude
status: current - April 2026
author: Written with Claude
---

# Cowork Configuration Layers

## Overview

Claude receives preferences, rules, and context through four distinct layers, each with different activation conditions and reliability characteristics. Understanding which layer carries a given rule determines how reliably it fires and whether it needs to be moved closer to the always-on end of the spectrum.

---

## The Four Layers

| Layer                                   | Always active?                           | Scope               |
| --------------------------------------- | ---------------------------------------- | ------------------- |
| System prompt (`user_preferences`)      | Yes - every session                      | Global              |
| Cowork project instructions box         | Yes - every session in the project       | Project             |
| Auto-memory (`MEMORY.md` index + files) | Index always; files on demand            | Global              |
| `CLAUDE.md` files                       | Only when the relevant folder is mounted | Repo/folder         |
| Skills                                  | Only when invoked                        | Per-session, opt-in |

### System prompt

The `user_preferences` block is injected by Cowork into every session. Currently carries: British English, structured output preference (markdown, formal briefs, diagrams, slide decks), TypeScript expertise, and creativity + practicality as a design value. These apply from message one with no action needed.

### Cowork project instructions box

A free-text field in the Cowork project settings, loaded for every session in that project. The right place for operating context and universal rules that should be always-on but are not (or should not be) part of the global system prompt. More specific than `user_preferences`, less transient than auto-memory.

See [[#Recommended Content for the Instructions Box]] below.

### Auto-memory

The `MEMORY.md` index is injected as a `system-reminder` every session. Individual memory files are read on demand when a topic surfaces. This means:

- Rules in memory files are **conditionally applied** - they fire when memory is consulted, not unconditionally.
- Strong universal rules (e.g. language framing preferences) that live only in memory files may not fire on short or narrow sessions.
- Rules worth making invariant should be moved to the system prompt or the instructions box.

### `CLAUDE.md` files

Repo-specific instruction files loaded automatically when Claude operates within that folder. Precise and reliable _within context_, but invisible when working outside the repo. The Knowledge Island `CLAUDE.md` carries detailed Knowledge Islands conventions; the repository `CLAUDE.md` carries repository-specific rules.

### Skills

Skills carry their own embedded instructions and are activated per-session when invoked. Good for specialised workflows; not suitable for universal behavioural rules.

---

## Recommended Content for the Instructions Box

The following categories belong in the Cowork project instructions box - rules that should be universally active but are either absent from `user_preferences` or currently buried in auto-memory files.

**Operating context** - a brief description of the organisation, user's role, the key repositories, and the domain model - read from [[Charter]] and [[Knowledge Capital]]. Without this, Claude infers context from conversation rather than knowing it from the start.

**Language framing** - the no-anthropomorphism rule (state things directly; do not frame honesty or directness as a choice). Currently in an auto-memory file; should be always-on.

**Output format defaults** - more specific than the current `user_preferences` entry. Markdown for notes and briefs, `docx` for formal deliverables, avoid prose-list hybrids in favour of either proper lists or flowing paragraphs.

**KI as default knowledge store** - an offer to save substantive outputs to the island at session end. Currently embedded in the KI `CLAUDE.md` and only active when that vault is mounted. Appropriate as a project-level default.

**Primary codebase stack context** - for ad-hoc code questions outside the main code repository. Specific to this KI - the relevant `CLAUDE.md` in the code repository carries this, but is invisible in sessions where that folder is not mounted. A brief summary in the instructions box keeps it always-on. See [[Charter]] for the repository name.

---

## Tending

When a preference or rule is added to auto-memory, ask: should this be always-on? If yes, move it to the instructions box. Auto-memory is appropriate for facts about ongoing work and validated approaches that accumulate over time - not for invariant behavioural rules.

If the instructions box grows large, review for content that belongs in `user_preferences` (truly global) or in a specific `CLAUDE.md` (folder-scoped).

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Claude|Claude]] - parent index
- [[CLAUDE|CLAUDE]] - the repository-level instruction file for KI sessions
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Mistakes and Lessons|Mistakes and Lessons]] - operational error log; a companion to understanding how Claude operates in practice
