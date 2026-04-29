---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: draft - April 2026
author: Written with Claude
---

# Notes

## Overview

A note is the written form of a piece of knowledge on the island. Every decision, connection, reference, and observation that reaches the Library does so as a note. The structure of a note is not a formatting convention — it is the mechanism through which knowledge is validated, contextualised, and made durable.

Notes are written in Markdown. This is a fundamental requirement of the model — not a tooling preference. Markdown sits at the sweet spot between human-readable and machine-readable: legible as plain text without rendering, processable by AI agents without conversion, diffable, version-controllable, and portable across editors and systems. Any tool that reads or writes to the island must work with Markdown files directly.

Three convention areas govern notes. Format defines the physical structure: what sections every note carries, how they are arranged, how content within them is written, and how notes link to each other and embed assets. Frontmatter governs the YAML metadata block — the properties and tag taxonomy that classify and surface notes. Types extend the base format for specific purposes: collection cards, meeting notes, and session digests each bring their own structural rules.

---

## Format

The physical structure of a note — its sections, heading conventions, footer rules, table formatting, markdown norms, and wikilink and image conventions — is defined in [[Format]]. All notes follow this structure; type-specific variations are always additions or overrides, never replacements.

---

## Frontmatter

Every note carries a YAML frontmatter block. Frontmatter has two parts: [[Properties]] defines the standard fields (`status`, `author`, and optional fields), and [[Tags]] defines the hierarchical tag taxonomy used across all notes. Both are a superset — not every property or tag applies to every island.

Island-specific extensions and overrides live in Knowledge Capital.

---

## Types

The base format applies to all notes. Four specialised structures extend it for specific purposes.

[[Collection Card]] is a lighter format for reference entries — people, organisations, concepts — and for index notes. Uses `card/*` tags and typically has fewer body sections than a full note.

[[Meeting Note]] defines the structure for recording meetings: a themed body with optional Key Decisions, Open Items, and Action Items sub-sections per theme, plus required attendee and transcript fields in the Overview.

[[Session Digest]] defines the structure for AI-assisted work session summaries, including the five standard sections and the note's temporary lifecycle — session digests are deleted once their content has been extracted to the appropriate Pillars or Streams notes.

[[Activity Note]] defines the structure for activity notes: required sections (Overview, Trigger, Outcome), the optional Prompt section, and the sync discipline for keeping island notes and scheduled tasks aligned.
