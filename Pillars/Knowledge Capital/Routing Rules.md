---
tags:
  - card/note
  - topic/knowledge-islands
status: current - April 2026
purpose: KB-specific routing rules beyond the generic conventions
author: Written with Claude
memory_file: project_{kb_prefix}_structure.md
---

# Routing Rules

## Overview

Routing rules specific to this island, supplementing the general conventions in [[Pillars/Knowledge Islands/Governance/Conventions/Structure/Structure|Structure]].

---

## Streams/Pillars Boundary

Streams notes track status and next steps only. Technical findings, decisions, and reusable knowledge extracted from stream work belong in Pillars, with the stream note linking to them.

---

## Meeting Notes

Each meeting gets its own Calendar note (`YYYY-MM-DD Meeting Name.md`), filed in the appropriate month folder. Reference it from the daily note via wikilink.

---

## Session Digests

Each AI work session gets its own Calendar note (`YYYY-MM-DD Session - Topic.md`), filed in the appropriate month folder. Reference it from the daily note via wikilink. Do not write session digest content inline into the daily note.

---

## Within Pillars

Arcadia's Pillars are organised into three domains:

| Domain            | Folder                       | Concern                                                        | Key question                                                            |
| ----------------- | ---------------------------- | -------------------------------------------------------------- | ----------------------------------------------------------------------- |
| Knowledge Islands | `Pillars/Knowledge Islands/` | The KI concept, architecture, and governance framework         | What is the Knowledge Islands system and how does it work generically?  |
| Knowledge Capital | `Pillars/Knowledge Capital/` | Arcadia's own identity, governance instance, and configuration | What makes Arcadia itself — how is this island specifically configured? |
| Productivity      | `Pillars/Productivity/`      | Working practices                                              | How does Arcadia's council operate day-to-day?                          |

Common routing decisions:

- The KI concept, island types, and governance patterns → **Knowledge Islands**
- The Enactment Process and Contribution Process (generic) → **Knowledge Islands/Governance/Processes/**
- Arcadia's council membership and governance instance → **Knowledge Capital/Governance/**
- KB conventions, note format, frontmatter, Claude integration → **Knowledge Islands/Knowledge Management/**
- Known Lands, Identity, Physical Locations → **Knowledge Capital/**

---

## Memory Folder Migration

The `productivity:memory-management` skill stores reference material under `memory/` as a staging convention. When a `memory/` folder appears in a session, treat it as temporary — migrate content to the correct KB location and then remove the folder:

- KI terminology and acronyms → [[Pillars/Knowledge Capital/Glossary|Glossary]]
- Custodian profiles → `Resources/People/`

---

## Related Topics

- [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]] - parent index
- [[Pillars/Knowledge Islands/Governance/Conventions/Structure/Structure|Structure]] - general folder structure conventions
