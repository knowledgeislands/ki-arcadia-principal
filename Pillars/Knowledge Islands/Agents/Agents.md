---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: current - April 2026
author: Written with Claude
---

# Agents

## Overview

The operating layer: who and what acts on the island, and how. An agent is anything that reads, writes, or reasons over island content - human or AI. This folder documents the operating conventions for each agent type: how it works within the island, what it can and cannot do, and what patterns govern its behaviour.

The tools agents use are documented separately in [[Knowledge Islands/Tools/Tools]]. The distinction matters: `Agents/` covers operating behaviour; `Tools/` covers configuration and connection. A given AI system appears in both - once for how it acts, once for how it is set up.

Agents divide into two broad modes: **human operation** (manual curation, navigation, and editorial judgement) and **agentic AI operation** (automated or semi-automated processing, with varying levels of write access and autonomy). These modes are complementary - AI agents handle routine, repeatable work; humans handle judgement calls, ratification, and governance.

---

## Human

[[Human]] covers the manual operation of the island - editing notes, navigating the vault, reviewing AI-generated content, and exercising the editorial judgement that automated agents cannot. Obsidian is the primary interface; the human agent is the final authority on what enters canonical knowledge.

---

## Agentic AI

[[Agentic AI]] covers the general patterns that apply across all AI agents operating within a Knowledge Island - independent of which tool is doing the work. This is Layer 3 of the [[Authoring Activities|five-layer model]]: caching strategies, parallel MCP fetch, rolling time windows, and the live artifact lifecycle. Any AI agent implementing an island activity should draw on these patterns rather than re-deriving them from scratch.

---

## Claude

[[Agents/Claude/Claude]] is the primary agentic AI for this island. It has direct write access, runs scheduled automations, maintains persistent memory across sessions, and operates across five modes (Save, Update, Query, Extract, Digest). This folder documents Claude's island-specific operating conventions - its behavioural constraints, the five modes, and the memory architecture - at Layer 4 of the five-layer model. Claude-specific tool configuration (Cowork connection, token economics, prompt library) lives in [[Tools/Claude/Claude|Tools/Claude]].

---

## ChatGPT

[[Agents/ChatGPT/ChatGPT]] operates as a read-heavy participant rather than a full agent. Context is loaded manually by the user; outputs are routed into the island by the user rather than by the model directly. It runs no scheduled automations and has no direct write access. It is documented here for structural consistency - if it is ever given direct write access or scheduled tasks, this note expands into a full agent layer.

---

## Related Topics

- [[Pillars/Knowledge Islands/Knowledge Islands|Knowledge Islands]] - parent index
- [[Pillars/Knowledge Islands/Tools/Tools|Tools]] - configuration layer for the tools agents use
- [[Pillars/Knowledge Islands/Activities/Authoring Activities|Authoring Activities]] - the five-layer model that defines where agent content belongs
