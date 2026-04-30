---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
  - topic/ai
  - topic/automation
status: current - April 2026
author: Written with Claude
---

# Agentic AI

## Overview

The AI operating layer - patterns and conventions that govern how AI agents work within the island, independent of any specific tool. Content here applies across AI tools; anything Claude-specific lives under [[Agents/Claude/Claude|Agents/Claude]].

This is Layer 3 of the [[Authoring Guidelines|five-layer content model]]: Activity-agnostic, Island-agnostic, Agent-agnostic.

---

## AI Automation Patterns

[[AI Automation Patterns]] documents the reusable design patterns for AI-driven productivity automations: the execution/change ratio principle (prefer reading and reporting over writing), the JSON5 cache pattern for reducing redundant MCP fetches, the live artifact baseline and two-mechanic update protocol, parallel MCP fetch for latency reduction, and the rolling time window convention. Any AI agent implementing an island activity should draw on these patterns rather than re-deriving them from scratch.

---

## What Lives Here

Content belongs in this folder when it:

- Describes how AI agents should behave when operating within a Knowledge Island - regardless of which AI tool is doing the work
- Captures structural patterns for automations, scheduled tasks, or agent workflows that are not specific to Claude
- Generalises from a specific activity or tool to a reusable convention

Content does **not** belong here when it:

- Is specific to Claude's implementation (→ [[Agents/Claude/Claude|Agents/Claude]])
- Describes how a particular tool is configured or connected (→ [[Knowledge Islands/Model/Tools/Tools]])
- Is tied to a specific activity's logic or prompt (→ [[Claude/Activities/Activities|Tools/Claude/Activities]])
