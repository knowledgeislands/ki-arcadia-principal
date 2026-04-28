---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: current - April 2026
purpose: Index for the Frontmatter area - YAML properties and tag taxonomy that apply across all notes
author: Written with Claude
memory_file: project_{kb_prefix}_note_format.md
---

# Frontmatter

## Overview

All notes carry YAML frontmatter - structured metadata that governs how notes are classified, filtered, and surfaced. Two components make up the frontmatter convention: the set of standard properties carried by every note, and the tag taxonomy that classifies notes by type, topic, and source.

Both are defined as a superset across all islands. Island-specific extensions and overrides live in [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]].

---

## Properties

Standard YAML properties carried by every note are defined in [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Frontmatter/Properties|Properties]]. These include `status`, `purpose`, `author`, and optional fields such as `creator`, `memory_file`, and `day_type`.

---

## Tags

The tag taxonomy used across the island - covering card types, calendar note types, topics, source markers, and date stamps - is defined in [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Frontmatter/Tags|Tags]]. Tags follow a hierarchical `namespace/value` pattern. Not every tag will be relevant to every KB; the taxonomy is a superset.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Notes|Notes]] - parent index
- [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Frontmatter/Properties|Properties]] - standard frontmatter fields
- [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Frontmatter/Tags|Tags]] - tag taxonomy
