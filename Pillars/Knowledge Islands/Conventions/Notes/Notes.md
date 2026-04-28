---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: current - April 2026
author: Written with Claude
memory_file: project_{ki_prefix}_note_format.md
---

# Notes

## Overview

A note is the written form of a piece of knowledge on the island. Every decision, connection, reference, and observation that reaches the Library does so as a note. The structure of a note is not a formatting convention - it is the mechanism through which knowledge is validated, contextualised, and made durable.

Notes are written in Markdown. This is a fundamental requirement of the model - not a tooling preference. Markdown sits at the sweet spot between human-readable and machine-readable: legible as plain text without rendering, processable by AI agents without conversion, diffable, version-controllable, and portable across editors and systems. Any tool that reads or writes to the island must work with Markdown files directly.

Three convention areas govern notes. Format defines the physical structure: what sections every note carries, how they are arranged, how content within them is written, and how notes link to each other and embed assets. Frontmatter governs the YAML metadata block - the properties and tag taxonomy that classify and surface notes. Types extend the base format for specific purposes: collection cards, meeting notes, and session digests each bring their own structural rules.

---

## Format

The physical structure of a note - its sections, heading conventions, footer rules, table formatting, markdown norms, and wikilink and image conventions - is defined in [[Format]]. All notes follow this structure; type-specific variations are always additions or overrides, never replacements.

---

## Frontmatter

Every note carries a YAML frontmatter block. [[Frontmatter]] has two parts: [[Properties]] defines the standard fields (`status`, `author`, and optional fields), and [[Tags]] defines the hierarchical tag taxonomy used across all notes. Both are a superset - not every property or tag applies to every island.

---

## Types

The base format applies to all notes. [[Types]] documents the specialised structures that extend it for specific purposes - collection cards for reference entries and index notes, meeting notes for structured meeting records, and session digests for AI-assisted work session summaries.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Conventions/Conventions|Conventions]] - parent index
- [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Frontmatter/Frontmatter|Frontmatter]] - YAML properties and tag taxonomy
