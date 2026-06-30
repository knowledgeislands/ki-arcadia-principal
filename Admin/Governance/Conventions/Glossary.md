---
tags:
  - card/note
  - topic/knowledge-islands
status: current - April 2026
author: Written with Claude
---

# Glossary

## Overview

A reference for Knowledge Islands terminology - concepts, acronyms, and structural terms used across Arcadia and the wider archipelago system.

---

## Core Concepts

| Term                  | Meaning                                                                                                   |
| --------------------- | --------------------------------------------------------------------------------------------------------- |
| Knowledge Island (KI) | A discrete, self-contained body of knowledge - a repository of notes with its own governance and identity |
| Archipelago           | A geographic grouping of islands by proximity or shared natural character; independent of governance†     |
| Principal Island      | The seat of governance for a territory ‡                                                                  |
| Satellite Island      | A governed extension of a territory, ring-fenced for a specific purpose §                                 |
| Islet                 | A small, purpose-specific knowledge area sharing its principal island's governance ¶                      |
| Council               | The governing body of an island using the council model ‖                                                 |
| Custodian             | A council member; a traveller who knows the archipelago and may contribute to its canonical knowledge ††  |
| Known Lands           | A map of known islands held in an island ‡‡                                                               |
| Capital               | The seat of governance for a jurisdiction §§                                                              |

† A territory may contain one or more archipelagos; an archipelago may span multiple territories. The boundary rule (customs vs. free knowledge flow) determines territory; proximity and shared character determine archipelago.

‡ Holds the Capital, the governance infrastructure, and the Cowork project for the whole territory.

§ For example, a different audience or publication target.

¶ Shares governance with its principal island but maintains its own store.

‖ The custodians who ratify, reject, or return proposed changes.

†† Knows the location of the archipelago and is authorised to contribute to its canonical knowledge.

‡‡ Arcadia's is the canonical objective record; each principal's own island holds a personal navigator's chart.

§§ Held by the principal island of a territory. Charter and Council are its required elements, both residing in `Admin/Governance`.

---

## Storage & Infrastructure

| Term                            | Meaning                                                                                               |
| ------------------------------- | ----------------------------------------------------------------------------------------------------- |
| Knowledge Island Storage (KISS) | The physical storage layer of an island ¶¶                                                            |
| Text Store                      | The canonical Markdown repository, version-controlled in git                                          |
| Binary Store                    | External storage for large binary files (PDFs, images, exports) ‖‖                                    |
| Working Space                   | Ephemeral scratch space for AI-assisted session work; not version-controlled; cleared once obsolete   |
| Governance Infrastructure       | The Cowork project and working folder that belong to a principal island and serve the whole territory |

¶¶ Text store (Markdown, git-backed) and binary store (large files).

‖‖ Mirrors the text store folder structure.

---

## Knowledge Organisation

| Term        | Meaning                                                                                   |
| ----------- | ----------------------------------------------------------------------------------------- |
| Pillars     | Internal knowledge owned by the island - foundational concepts, methodology, and approach |
| Resources   | External reference material that exists independently of this island                      |
| Streams     | Status-tracking notes for active work and projects; not a knowledge store                 |
| Calendar    | Time-based notes - daily notes, meeting notes, session digests, and periodic reviews      |
| Ports (`+`) | Inbox for unsorted captures awaiting filing                                               |

---

## Other Planes of Existence

Knowledge Islands is not the only model of knowledge organisation. Other systems - wikis, drives, legacy vaults, corporate intranets - exist as **Planes of Existence**: parallel worlds of knowledge that operate independently of the KI model.

| Term                | Meaning                                                                                                  |
| ------------------- | -------------------------------------------------------------------------------------------------------- |
| Planes of Existence | Other knowledge systems that exist outside the Knowledge Islands model †††                               |
| Legacy Plane        | A predecessor system from which Knowledge Islands content is being or has been migrated; the "old world" |
| Migration           | Bringing knowledge from a Plane of Existence into a Knowledge Island ‡‡‡                                 |

††† For example, Notion, Confluence, Google Drive, SharePoint, legacy Obsidian vaults.

‡‡‡ The content is assessed, restructured, and filed under KI conventions.

---

## Governance & Change

| Term              | Meaning                                                                                                          |
| ----------------- | ---------------------------------------------------------------------------------------------------------------- |
| Enactment Process | The council's operating mechanism - how Streams enact change in the island §§§                                   |
| Contribution      | A proposed change to an island's canonical knowledge, submitted through the Enactment Process for council review |
| Customs           | Boundary rules governing what knowledge may enter or leave an island                                             |
| Ratify            | Council approves a change; it proceeds to rollout                                                                |
| Return            | Council sends a change back to draft for further work, with reasons                                              |
| Reject            | Council definitively rejects a change; terminal outcome, reasons recorded                                        |

---

## Acronyms

| Acronym | Meaning                         |
| ------- | ------------------------------- |
| KI      | Knowledge Island                |
| KIA     | Knowledge Island Archipelago    |
| KIG     | Knowledge Island Governance     |
| KISS    | Knowledge Island Storage System |
