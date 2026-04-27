---
tags:
  - card/note
  - topic/knowledge-islands
status: current - April 2026
purpose: Index note for Arcadia's Knowledge Capital — the island's knowledge of itself; identity, governance instance, and configuration
author: Written with Claude
---

# Knowledge Capital

## Overview

Arcadia's Knowledge Capital is the island's knowledge of itself — its identity, governance, physical locations, vocabulary, and operational configuration. Every island in the Knowledge Islands ecosystem has a [[Knowledge Capital]]; the name is universal, the content is island-specific.

The folder mirrors the five governance areas defined in [[Pillars/Knowledge Islands/Knowledge Islands|Knowledge Islands]]: Conventions, Activities, Agents, Tools, and Governance. Each subfolder holds Arcadia's realisation of the corresponding generic layer — the island-specific configuration that makes abstract patterns concrete.

---

## Identity

[[Pillars/Knowledge Capital/Identity|Identity]] is Arcadia's registration card: the KB name, the Cowork skill name, the task prefix used in TickTick, and the trigger phrases that activate the island's skill. These identifiers are the fixed, rarely-changing facts that distinguish Arcadia from every other island. Automations and skill prompts read from here rather than hardcoding values.

---

## Known Lands

[[Pillars/Knowledge Capital/Known Lands|Known Lands]] is Arcadia's map of all islands and archipelagos it has encountered. As the principal island of its archipelago and the custodian of the Knowledge Islands framework, Arcadia holds the canonical record of the known archipelago. Each entry captures the island's name, role, principal, and relationship to Arcadia.

---

## Governance

The [[Pillars/Knowledge Capital/Governance/Governance|Governance]] folder holds Arcadia's governance instance: the council membership, the Enactment Process for ratifying changes to canonical knowledge, and any governance conventions specific to this island. The generic governance model is defined in [[Pillars/Knowledge Islands/Governance/Governance|Governance]] under Knowledge Islands; what lives here is Arcadia's specific realisation of it.

---

## Conventions

The [[Pillars/Knowledge Capital/Conventions/Conventions|Conventions]] folder holds the island-specific vocabulary and routing rules that supplement the generic KI conventions. The Glossary decodes Knowledge Islands terminology; the Routing Rules records the filing decisions that recur in this island's specific domain structure. Neither note restates generic rules — both record only what is particular to Arcadia.

---

## Activities

The [[Pillars/Knowledge Capital/Activities/Activities|Activities]] folder holds Arcadia's timing configuration for automated activities. Currently this means the Schedule note, which defines the day-type taxonomy (`work-day`, `bank-holiday`, `annual-leave`, `weekend`) that all automations read from daily note frontmatter, and the cron parameters for each automation as they come online.

---

## Agents

The [[Pillars/Knowledge Capital/Agents/Agents|Agents]] folder holds the island-specific material that shapes how AI agents interact with Arcadia. Communication Style gives Claude a reference for Kit's voice so its output feels natural rather than generically helpful. Canonical Meta Notes provides the ordered reading list that Knowledge Rebuild uses to ground an agent in this island's operational context when starting cold.

---

## Tools

The [[Pillars/Knowledge Capital/Tools/Tools|Tools]] folder holds the concrete infrastructure configuration for this island: the Integrations note lists the external services actually connected and their MCP identifiers; Physical Locations records the three filesystem paths — text store, binary store, and Cowork working folder — that make up Arcadia's physical footprint.

---

## Related Topics

- [[Pillars/Pillars|Pillars]] - parent index
- [[Pillars/Knowledge Islands/Knowledge Islands|Knowledge Islands]] - the generic framework this Capital realises
