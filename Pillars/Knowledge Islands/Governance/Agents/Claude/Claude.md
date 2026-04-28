---
tags:
  - card/note
  - topic/ai
  - topic/knowledge-islands
  - source/claude
status: current - April 2026
purpose: Index for the Claude agent layer - how Claude operates as an agent within the island, independent of Cowork platform specifics
author: Written with Claude
---

# Claude

## Overview

The Claude agent layer - how Claude operates as an agent within the island. This covers Claude's operating modes, behavioural constraints, and memory model, viewed as an agent rather than as a configured tool. Claude is the current implementation of the general [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/Agentic AI|Agentic AI]] patterns documented in this island's operating layer.

For Cowork integration specifics - connection type, token economics, platform configuration layers, and live artifacts - see [[Pillars/Knowledge Islands/Governance/Tools/Claude/Claude|Tools → Claude]].

---

## Operating Modes

[[Pillars/Knowledge Islands/Governance/Agents/Claude/Island Skill|Island Skill]] defines the five modes through which Claude interacts with the island: Save, Update, Query, Extract, and Digest. These modes are the agent's structured repertoire for knowledge work - each maps a type of intent to a defined sequence of actions.

---

## Behavioural Constraints

[[Pillars/Knowledge Islands/Governance/Agents/Claude/Claude Behaviour|Claude Behaviour]] documents the behavioural expectations for Claude when working with this island - what to do, what to avoid, and what tone and style to maintain. These apply regardless of who is using the KI.

---

## Memory

[[Pillars/Knowledge Islands/Governance/Agents/Claude/Memory Architecture|Memory Architecture]] documents how Claude's auto-memory is structured for this island - file conventions, the two classes of memory file (canonical and auxiliary), and the KI↔memory mapping that [[Pillars/Knowledge Islands/Governance/Activities/Maintenance/Knowledge Rebuild|Knowledge Rebuild]] uses to maintain the canonical layer.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Agents/Agents|Agents]] - parent index
- [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/Agentic AI|Agentic AI]] - the general AI agent patterns this agent implements
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Claude|Tools → Claude]] - Cowork integration, token economics, platform configuration
