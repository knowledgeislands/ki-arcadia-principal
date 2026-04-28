---
tags:
  - card/note
  - topic/knowledge-islands
status: current - April 2026
purpose: Arcadia's island charter - identity, adoption positions, enabled activities, connected tools, and active agent configuration
author: Written with Claude
---

# Charter

## Overview

Arcadia's island charter - the authoritative declaration of what this island is and what it has adopted. It has two parts that change at different rates. The **Identity** section is static: these parameters define the island and do not change without a constitutional amendment. The operational sections below it change as activities are enabled or disabled, integrations connected, and agent configuration updated.

The [[Pillars/Knowledge Islands/Governance/Activities/Constitutional/Conformance|Conformance Check]] uses this note as its source of truth. Agents starting cold and humans checking operational state both read it first.

---

## Identity

Fixed parameters that distinguish this island. Automations and skill prompts read from here rather than hardcoding values.

| Parameter              | Value                                                                                                               |
| ---------------------- | ------------------------------------------------------------------------------------------------------------------- |
| **Territory name**     | Arcadia                                                                                                             |
| **Island name**        | Arcadia Principal                                                                                                   |
| **KB name**            | Arcadia Principal                                                                                                   |
| **Repository folder**  | `arcadia-principal`                                                                                                 |
| **Skill name**         | `arcadia-principal`                                                                                                 |
| **Skill triggers**     | "save to Arcadia", "add to Arcadia", "search Arcadia", "what does Arcadia say about", "update the Arcadia notes on" |
| **Task ID prefix**     | `arcadia-principal-`                                                                                                |
| **Auto-memory prefix** | `arcadia-principal`                                                                                                 |
| **User prefix**        | `kit`                                                                                                               |

---

## Activity Groups

Adoption positions for all non-constitutional activity groups. Every group must carry an explicit position - `adopted` or `vetoed`. A vetoed group must have a corresponding stub in the Knowledge Capital acknowledging the decision. Constitutional activities (Charter, Conformance) are not listed here - they are pre-adoptive.

| Group       | Position | Knowledge Capital                                                                        |
| ----------- | -------- | ---------------------------------------------------------------------------------------- |
| Maintenance | adopted  | [[Pillars/Knowledge Capital/Governance/Activities/Maintenance/Maintenance\|Maintenance]] |
| Briefings   | adopted  | [[Pillars/Knowledge Capital/Governance/Activities/Briefings/Briefings\|Briefings]]       |
| Email       | vetoed   | [[Pillars/Knowledge Capital/Governance/Activities/Email/Email\|Email]]                   |
| Linear      | vetoed   | [[Pillars/Knowledge Capital/Governance/Activities/Linear/Linear\|Linear Workspace]]      |

---

## Scheduled Activities

Active scheduled automations within adopted groups. An activity listed here is enabled and deployed to the scheduler. An activity defined in the KB but not listed here is not running.

| Activity                                                                                                   | Group          | Day Type           | Time  | Status  |
| ---------------------------------------------------------------------------------------------------------- | -------------- | ------------------ | ----- | ------- |
| [[Pillars/Knowledge Islands/Governance/Activities/Constitutional/Conformance\|Conformance]]                | Constitutional | work-day           | 04:30 | enabled |
| [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Scheduled Task Audit\|Scheduled Task Audit]] | Maintenance    | work-day           | 05:00 | enabled |
| [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Health Check\|Health Check]]                 | Maintenance    | Monday work-day    | 08:00 | enabled |
| [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Knowledge Rebuild\|Knowledge Rebuild]]       | Maintenance    | Wednesday work-day | 07:00 | enabled |
| [[Pillars/Knowledge Islands/Governance/Activities/Briefings/Morning Briefing\|Morning Briefing]]           | Briefings      | work-day           | 06:00 | enabled |

Day types are defined in [[Schedule|Schedule]].

---

## Conversational Activities

Active conversational activities within adopted groups. Trigger phrases are the canonical activation strings.

| Activity                                                                                                   | Group       | Trigger                  | Status  |
| ---------------------------------------------------------------------------------------------------------- | ----------- | ------------------------ | ------- |
| [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Inbox Review\|Inbox Review]]                 | Maintenance | _"kb inbox review"_      | enabled |
| [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Asset Audit\|Asset Audit]]                   | Maintenance | _"kb asset audit"_       | enabled |
| [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Status Review\|Status Review]]               | Maintenance | _"kb status review"_     | enabled |
| [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Structural Audit\|Structural Audit]]         | Maintenance | _"kb structural audit"_  | enabled |
| [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Wikilink Review\|Wikilink Review]]           | Maintenance | _"kb wikilink review"_   | enabled |
| [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/KB Convergence Check\|KB Convergence Check]] | Maintenance | _"kb convergence check"_ | enabled |

---

## Tools

Active integrations. See [[Integrations|Integrations]] for MCP prefix detail.

| Purpose | Tool                     | Status    |
| ------- | ------------------------ | --------- |
| Inbox   | `+/` folder (filesystem) | connected |

---

## Agents

| Element              | Value                                                                          |
| -------------------- | ------------------------------------------------------------------------------ |
| KB skill             | `arcadia`                                                                      |
| Memory configuration | Auto-memory at `.auto-memory/` in the Cowork workspace; indexed at `MEMORY.md` |

---

## Related Topics

- [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]] - parent index
- [[Pillars/Knowledge Islands/Governance/Activities/Constitutional/Conformance|Conformance]] - the activity that validates this note
- [[Schedule|Schedule]] - day-type taxonomy used by scheduled activities
- [[Integrations|Integrations]] - full integration detail including MCP prefixes
