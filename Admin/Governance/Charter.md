---
tags:
  - card/note
  - topic/knowledge-islands
status: current - April 2026
author: Written with Claude
---

# Charter

## Overview

Arcadia's island charter - the authoritative declaration of what this island is and what it has adopted. It has two parts that change at
different rates. The **Identity** section is static: these parameters define the island and do not change without a constitutional
amendment. The operational sections below it change as activities are enabled or disabled, integrations connected, and agent configuration
updated.

The [[Philosophy/Activities/Constitutional/Conformance|Conformance Check]] uses this note as its source of truth. Agents starting cold and
humans checking operational state both read it first.

---

## Identity

Fixed parameters that distinguish this Knowledge Island. Automations and skill prompts read from here rather than hardcoding values.

| Parameter              | Value                                                                                                               |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Territory name**     | Arcadia                                                                                                             |
| **Island name**        | Arcadia Principal                                                                                                   |
| **Repository folder**  | `arcadia-principal`                                                                                                 |
| **Skill name**         | `arcadia-principal`                                                                                                 |
| **Skill triggers**     | "save to Arcadia", "add to Arcadia", "search Arcadia", "what does Arcadia say about", "update the Arcadia notes on" |
| **Task ID prefix**     | `arcadia-principal-`                                                                                                |
| **Auto-memory prefix** | `arcadia-principal`                                                                                                 |
| **User prefix**        | `kit`                                                                                                               |

---

## Activity Groups

Adoption positions for all non-constitutional activity groups. Every group must carry an explicit position - `adopted` or `vetoed`. A vetoed
group must have a corresponding stub in `Admin/` acknowledging the decision. Constitutional activities (Charter, Conformance) are not listed
here - they are pre-adoptive.

| Group     | Position | Activity Definition                                           |
| --------- | -------- | ------------------------------------------------------------- |
| Tending   | adopted  | [[Admin/Operations/Activities/Tending Activity\|Tending]]     |
| Briefings | adopted  | [[Admin/Operations/Activities/Briefings Activity\|Briefings]] |
| Email     | vetoed   | [[Admin/Operations/Activities/Email Activity\|Email]]         |
| Linear    | vetoed   | [[Admin/Operations/Activities/Linear Activity\|Linear]]       |

---

## Scheduled Activities

Active scheduled automations within adopted groups. An activity listed here is enabled and deployed to the scheduler. An activity defined in
the island but not listed here is not running.

| Activity                                                             | Group          | Day Type           | Time  | Status  |
| -------------------------------------------------------------------- | -------------- | ------------------ | ----- | ------- |
| [[Philosophy/Activities/Constitutional/Conformance]]                 | Constitutional | work-day           | 04:30 | enabled |
| [[Scheduled Task Audit]]                                             | Tending        | work-day           | 05:00 | enabled |
| [[Health Check]]                                                     | Tending        | Monday work-day    | 08:00 | enabled |
| [[Knowledge Rebuild]]                                                | Tending        | Wednesday work-day | 07:00 | enabled |
| [[Admin/Operations/Activities/Briefings Activity\|Morning Briefing]] | Briefings      | work-day           | 06:00 | enabled |

Day types are defined in [[Schedule|Schedule]].

---

## Conversational Activities

Active conversational activities within adopted groups. Trigger phrases are the canonical activation strings.

| Activity                                                                       | Group   | Trigger                  | Status  |
| ------------------------------------------------------------------------------ | ------- | ------------------------ | ------- |
| [[Inbox Review]]                                                               | Tending | _"ki inbox review"_      | enabled |
| [[Asset Audit]]                                                                | Tending | _"ki asset audit"_       | enabled |
| [[Status Review]]                                                              | Tending | _"ki status review"_     | enabled |
| [[Structural Audit]]                                                           | Tending | _"ki structural audit"_  | enabled |
| [[Wikilink Review]]                                                            | Tending | _"ki wikilink review"_   | enabled |
| [[Pillars/Philosophy/Activities/Tending/Convergence Check\|Convergence Check]] | Tending | _"ki convergence check"_ | enabled |

---

## Tools

Active integrations. See [[Admin Conventions/Integrations|Integrations]] for MCP prefix detail.

| Purpose | Tool                     | Status    |
| ------- | ------------------------ | --------- |
| Inbox   | `+/` folder (filesystem) | connected |

---

## Agents

| Element              | Value                                                                          |
| -------------------- | ------------------------------------------------------------------------------ |
| Memory configuration | Auto-memory at `.auto-memory/` in the Cowork workspace; indexed at `MEMORY.md` |
