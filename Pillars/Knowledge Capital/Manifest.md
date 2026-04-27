---
tags:
  - card/note
  - topic/knowledge-islands
status: current - April 2026
purpose: Authoritative declaration of Arcadia's adoption positions, enabled activities, connected tools, and active agent configuration
author: Written with Claude
---

# Manifest

## Overview

Arcadia's operational manifest — the authoritative declaration of what this island has adopted, enabled, and connected. An activity group, integration, or agent configuration not listed here has no defined position and is therefore non-conformant. The [[Pillars/Knowledge Islands/Governance/Activities/Constitutional/Conformance|Conformance Check]] uses this note as its source of truth.

Constitutional elements (Identity, Manifest, Conformance) are not listed in the adoption table — they are pre-adoptive and not subject to the adoption framework.

The Manifest is updated whenever an adoption decision changes, an activity is enabled or disabled, or an integration is connected or disconnected.

---

## Activity Groups

Adoption positions for all non-constitutional activity groups defined in the Knowledge Islands framework. Every group must carry an explicit position — `adopted` or `vetoed`. A vetoed group must have a corresponding stub in the Knowledge Capital acknowledging the decision.

| Group | Position | Knowledge Capital |
| --- | --- | --- |
| Maintenance | adopted | — |
| Briefings | adopted | — |
| Email | vetoed | [[Pillars/Knowledge Capital/Email/Email\|Email]] |
| Linear | vetoed | [[Pillars/Knowledge Capital/Linear Workspace\|Linear Workspace]] |

---

## Scheduled Activities

Active scheduled automations within adopted groups. An activity listed here is enabled and deployed to the scheduler. An activity defined in the KB but not listed here is not running.

| Activity | Group | Day Type | Time | Status |
| --- | --- | --- | --- | --- |
| [[Pillars/Knowledge Islands/Governance/Activities/Constitutional/Conformance\|Conformance]] | Constitutional | work-day | 04:30 | enabled |
| [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Scheduled Task Audit\|Scheduled Task Audit]] | Maintenance | work-day | 05:00 | enabled |
| [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Health Check\|Health Check]] | Maintenance | Monday work-day | 08:00 | enabled |
| [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Knowledge Rebuild\|Knowledge Rebuild]] | Maintenance | Wednesday work-day | 07:00 | enabled |
| [[Pillars/Knowledge Islands/Governance/Activities/Briefings/Morning Briefing\|Morning Briefing]] | Briefings | work-day | 06:00 | enabled |

Day types are defined in [[Pillars/Knowledge Capital/Activities/Schedule|Schedule]].

---

## Conversational Activities

Active conversational activities within adopted groups. Trigger phrases are the canonical activation strings.

| Activity | Group | Trigger | Status |
| --- | --- | --- | --- |
| [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Inbox Review\|Inbox Review]] | Maintenance | _"kb inbox review"_ | enabled |
| [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Asset Audit\|Asset Audit]] | Maintenance | _"kb asset audit"_ | enabled |
| [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Status Review\|Status Review]] | Maintenance | _"kb status review"_ | enabled |
| [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Structural Audit\|Structural Audit]] | Maintenance | _"kb structural audit"_ | enabled |
| [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Wikilink Review\|Wikilink Review]] | Maintenance | _"kb wikilink review"_ | enabled |
| [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/KB Convergence Check\|KB Convergence Check]] | Maintenance | _"kb convergence check"_ | enabled |

---

## Tools

Active integrations. See [[Pillars/Knowledge Capital/Tools/Integrations|Integrations]] for MCP prefix detail.

| Purpose | Tool | Status |
| --- | --- | --- |
| Inbox | `+/` folder (filesystem) | connected |

---

## Agents

| Element | Value |
| --- | --- |
| KB skill | `pkb` |
| Memory configuration | Auto-memory at `.auto-memory/` in the Cowork workspace; indexed at `MEMORY.md` |

---

## Related Topics

- [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]] - parent index
- [[Pillars/Knowledge Islands/Governance/Activities/Constitutional/Conformance|Conformance]] - the activity that validates this note
- [[Pillars/Knowledge Capital/Activities/Schedule|Schedule]] - day-type taxonomy used by scheduled activities
- [[Pillars/Knowledge Capital/Tools/Integrations|Integrations]] - full integration detail including MCP prefixes
