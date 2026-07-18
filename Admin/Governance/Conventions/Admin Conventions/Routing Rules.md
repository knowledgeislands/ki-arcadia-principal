---
tags:
  - card/note
  - topic/knowledge-islands
status: current - April 2026
author: Written with Claude
memory_file: project_{ki_prefix}_structure.md
---

# Routing Rules

## Overview

Routing rules specific to this island, supplementing the general conventions in [[Structure]].

---

## Within Pillars and Admin

Notes route to one of three zones depending on whether the content is portable, island-specific governance, or island-specific operations:

| Zone       | Folder                | Concern                                                             | Key question †                        |
| ---------- | --------------------- | ------------------------------------------------------------------- | ------------------------------------- |
| Philosophy | `Pillars/Philosophy/` | The KI concept, architecture, and governance framework              | What is the KI system, generically? ‡ |
| Governance | `Admin/Governance/`   | Arcadia's identity, decisions, conventions, policies, and templates | What defines this island? §           |
| Operations | `Admin/Operations/`   | Arcadia's day-to-day running — activities, processes, skills        | How does this island operate?         |

† **Key question** — the discriminating question for routing a note into each zone.

‡ **Philosophy key question** — what is the Knowledge Islands system and how does it work generically?

§ **Governance key question** — what defines this island and how must it be structured?

Common routing decisions:

- The KI concept, island types, and governance patterns → `Pillars/Philosophy/`
- The Enactment Process (canonical, portable) → `Pillars/Philosophy/Model/Processes/`
- Arcadia's council, charter, known lands → `Admin/Governance/`
- KI conventions, note format, frontmatter (portable) → `Pillars/Philosophy/Model/Conventions/`
- Arcadia's conventions (island-specific) → `Admin/Governance/Conventions/`
- Arcadia's activity definitions → `Admin/Operations/Activities/`

---

## Memory Folder Migration

The `productivity:memory-management` skill stores reference material under `memory/` as a staging convention. When a `memory/` folder appears in a session, treat it as temporary - migrate content to the correct island location and then remove the folder:

- KI terminology and acronyms → [[Glossary|Glossary]]
- Custodian profiles → `Resources/People/`
