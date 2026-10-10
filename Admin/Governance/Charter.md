---
note_type: admin/governance/policy
tags:
  - card/note
  - topic/knowledge-islands
status: current - October 2026
author: Mixed
---

# Charter

## Overview

Arcadia's island charter - the authoritative declaration of what this island is and what it has adopted. It has two parts that change at different rates. The **Identity** section is static: these parameters define the island and do not change without a constitutional amendment. The operational sections below it change as activities are enabled or disabled, integrations connected, and agent configuration updated.

The [[Philosophy/Activities/Constitutional/Conformance|Conformance Check]] uses this note as its source of truth. Agents starting cold and humans checking operational state both read it first.

---

## Identity

Fixed parameters that distinguish this Knowledge Island. Automations and skill prompts read from here rather than hardcoding values.

| Parameter | Value |
| --- | --- |
| **Territory name** | Knowledge Islands |
| **Capital** | Arcadia |
| **Canonical repository** | `knowledgeislands/ki-arcadia-principal` |
| **Island name** | Arcadia Principal |
| **Repository folder** | `ki-arcadia-principal` |
| **Skill name** | `arcadia-principal` |
| **Skill triggers** | "save to Arcadia", "add to Arcadia", "search Arcadia", "what does Arcadia say about", "update the Arcadia notes on" |
| **Task ID prefix** | `arcadia-principal-` |
| **Auto-memory prefix** | `arcadia-principal` |
| **User prefix** | `kit` |

---

## Territorial authority

Arcadia is the sole Capital of the Knowledge Islands territory. Its canonical repository identity is [knowledgeislands/ki-arcadia-principal](https://github.com/knowledgeislands/ki-arcadia-principal). [[Known Lands]] records the authoritative internal inventory and distinguishes external signposting.

The Capital holds shared territorial governance. Each member island retains its subject or product ownership, source access rules, canonical acceptance and repository-owned delivery authority. A specialist engineering island or an implementation product does not become another territorial principal.

Other territories may reference or adopt the public KI model under their own authority. Arcadia's authorship grants no jurisdiction over those consumers and does not require them to disclose private membership or adoption.

Arcadia also holds the territory's trade-route policy. Its `.ki.toml` declares the territory name and members in `territory_name` and `territory_members` under `[skills.ki-repo]` and the only permitted trade channels, standing knowledge-intake grants and knowledge subtypes in `[skills.ki-trades.territory]`. Every repository names its Capital in `[skills.ki-repo].capital`, and members carry no route tables of their own. A route grants visibility of a deliberate handoff only: the source still owns what it submits, and the receiver still owns receipt, disposition and acceptance. No route grants peer write, scheduling, implementation, publication, automatic acquisition or acceptance. Policy changes follow the Enactment Process. [[GDR-KI-ARCADIA-003-capital-governed-trade-routes|GDR-KI-ARCADIA-003]] records the decision.

Repository selection derives from the Capital's ordered `territory_members`, including Arcadia, with `territory_prefix = "ki"` as the short handle. KI and mgit support `-t ki`, `--estate` and literal, case-sensitive directory-name prefix filters through `-f`. The registry resolves canonical identities to machine-local locations, and a Paperclip company coordinates admitted work with organisation code `KIS`. None establishes territorial membership, permission or cross-repository write authority. Reconcile any disagreement with this Charter and Known Lands through the accountable owners.

Arcadia owns the Techné engineering discipline in [[Engineering Practice/Engineering Practice|Engineering Practice]], including canonical architecture, operating models, technology posture and engineering decision criteria. The former `knowledgeislands/ki-techne-principal` knowledge tree was retired on 4 October 2026 and is archived read-only as historical evidence; it holds no live work and is not another Capital or canonical engineering owner. The [[Techne Programme Hold]] restricts remote running and remote-environment management across the harness and CLI while local engineering continues under repository standards. Knowledge adoption and source retirement do not themselves integrate candidates or alter services.

---

## Activity Groups

Adoption positions for all non-constitutional activity groups. Every group must carry an explicit position - `adopted` or `vetoed`. A vetoed group's Activity Definition note, `Admin/Operations/Activities/<Group> Activity.md`, must explicitly acknowledge the veto. Constitutional activities (Charter, Conformance) are not listed here - they are pre-adoptive.

| Group     | Position | Activity Definition                                           |
| --------- | -------- | ------------------------------------------------------------- |
| Tending   | adopted  | [[Admin/Operations/Activities/Tending Activity\|Tending]]     |
| Briefings | adopted  | [[Admin/Operations/Activities/Briefings Activity\|Briefings]] |
| Email     | vetoed   | [[Admin/Operations/Activities/Email Activity\|Email]]         |
| Linear    | vetoed   | [[Admin/Operations/Activities/Linear Activity\|Linear]]       |

---

## Scheduled Activities

Active scheduled automations within adopted groups. An activity listed here is enabled and deployed to the scheduler. An activity defined in the island but not listed here is not running.

| Activity | Group | Day Type | Time | Status |
| --- | --- | --- | --- | --- |
| [[Philosophy/Activities/Constitutional/Conformance]] | Constitutional | work-day | 04:30 | enabled |
| [[Model/Activities/Tending/Health Check\|Health Check]] | Tending | Monday work-day | 08:00 | enabled |
| [[Model/Activities/Tending/Knowledge Rebuild\|Knowledge Rebuild]] | Tending | Wednesday work-day | 07:00 | enabled |
| [Morning Briefing](<../Operations/Activities/Briefings Activity.md>) | Briefings | work-day | 06:00 | enabled |

Day types are defined in the [activity schedule](<../Operations/Activities/Schedule.md>).

---

## Conversational Activities

Active conversational activities within adopted groups. Trigger phrases are the canonical activation strings.

| Activity | Group | Trigger | Status |
| --- | --- | --- | --- |
| [[Inbox Review]] | Tending | _"ki inbox review"_ | enabled |
| [[Asset Audit]] | Tending | _"ki asset audit"_ | enabled |
| [[Status Review]] | Tending | _"ki status review"_ | enabled |
| [[Structural Audit]] | Tending | _"ki structural audit"_ | enabled |
| [[Wikilink Review]] | Tending | _"ki wikilink review"_ | enabled |
| [[Model/Activities/Tending/Convergence Check\|Convergence Check]] | Tending | _"ki convergence check"_ | enabled |

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
