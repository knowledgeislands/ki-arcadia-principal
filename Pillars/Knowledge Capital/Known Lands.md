---
tags:
  - card/note
  - topic/knowledge-islands
status: current - April 2026
purpose: Arcadia's map of all known Knowledge Islands archipelagos - the canonical objective record of islands, their roles, and their repositories
author: Written with Claude
---

# Known Lands

## Overview

The canonical record of all known archipelagos and islands in the Knowledge Islands ecosystem. This is the objective map - it records facts: islands that exist, their roles, their repositories, and their governors. Personal context and individual navigators' charts live in each principal's own KB under the same name.

---

## Arcadia

The foundational archipelago - the Knowledge Island of Knowledge Islands. Arcadia holds the canonical definition, architecture, and governance model for the entire ecosystem. All other archipelagos derive their governance baseline from Arcadia.

| Island              | Role                                                | Repository                           | Local path                                 |
| ------------------- | --------------------------------------------------- | ------------------------------------ | ------------------------------------------ |
| `arcadia-principal` | Principal island; canonical KI source               | `knowledgeislands/arcadia-principal` | `~/kis/knowledgeislands/arcadia-principal` |
| `arcadia-website`   | Satellite; public presence at knowledgeislands.info | `knowledgeislands/arcadia-website`   | `~/kis/knowledgeislands/arcadia-website`   |

**Council:** Kit (Brown) - founding member.

---

## Kit

Kit's personal archipelago. Holds personal knowledge, notes, work in progress, and personal-domain content.

| Island          | Role                                           | Repository            | Local path                  |
| --------------- | ---------------------------------------------- | --------------------- | --------------------------- |
| `kit-principal` | Principal island; personal knowledge and notes | `krisb/kit-principal` | `~/kis/krisb/kit-principal` |
| `kit-legal`     | Satellite; legal cases                         | `krisb/kit-legal`     | `~/kis/krisb/kit-legal`     |

**Governor:** Kit (Brown).

---

## Humans Not Robots (HNR)

Kit's company archipelago. Holds company knowledge, working practices, and operational context for Humans Not Robots.

| Island          | Role                                          | Repository            | Local path                  |
| --------------- | --------------------------------------------- | --------------------- | --------------------------- |
| `hnr-principal` | Principal island; company knowledge and notes | `krisb/hnr-principal` | `~/kis/krisb/hnr-principal` |

**Governor:** Kit (Brown).

---

## Valle Armonia

A joint project archipelago - a community being built in Costa Rica. Governed jointly by multiple collaborators.

| Island                   | Role                                              | Repository                            | Local path                                  |
| ------------------------ | ------------------------------------------------- | ------------------------------------- | ------------------------------------------- |
| `vallearmonia-principal` | Principal island; Valle Armonia project knowledge | `vallearmonia/vallearmonia-principal` | `~/kis/vallearmonia/vallearmonia-principal` |
| `vallearmonia-website`   | Satellite; public presence at vallearmonia.com    | `vallearmonia/vallearmonia-website`   | `~/kis/vallearmonia/vallearmonia-website`   |

**Governors:** Joint. Kit (Brown) is a principal governor.

---

## Legacy

Pre-Knowledge Islands vaults from the old world - the source material from which active archipelagos have been, or are being, built. These are read-only migration sources; they are not governed under the Knowledge Islands model.

| Vault                     | Source of                    | Migration target | Status            |
| ------------------------- | ---------------------------- | ---------------- | ----------------- |
| `personal-knowledge-base` | Personal notes and knowledge | `kit-principal`  | Migrated          |
| `legal-knowledge-base`    | Legal case notes             | `kit-legal`      | In active Streams |
| `hnr-knowledge-base`      | Company knowledge and notes  | `hnr-principal`  | Pending           |

---

## Related Topics

- [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]] - parent index
- [[Pillars/Knowledge Capital/Governance/Governance|Governance]] - Arcadia's council and governance instance
