---
note_type: pillars/note
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: current - April 2026
author: Written with Claude
---

# Who Acts on the Island

## Overview

The operating layer: who and what acts on the island, and how. An agent is anything that reads, writes, or reasons over island content - human or AI. This chapter documents the operating conventions for each agent type: how it works within the island, what it can and cannot do, and what patterns govern its behaviour.

The tools agents use are documented separately in [[Model/Tools/Tools|Tools]]. The distinction matters: `Agents/` covers operating behaviour; `Tools/` covers configuration and connection. Neither chapter carries notes for a specific AI runtime: the shared conventions live in [[Agentic AI]], and anything specific to one runtime lives in the skill that realises it.

Agents divide into two broad modes: **human operation** (manual curation, navigation, and editorial judgement) and **agentic AI operation** (automated or semi-automated processing, with varying levels of write access and autonomy). These modes are complementary - AI agents handle routine, repeatable work; humans handle judgement calls, ratification, and governance.

---

## Human

The Human agent note covers how a person navigates, curates, and governs the island - the manual operations that AI agents cannot or should not perform, and the editorial judgements that require human authority. It defines the human role within the island's operating model.

## Agentic AI

The Agentic AI note covers the patterns and constraints for automated AI operation on the island, including write access levels, review requirements, and the categories of work appropriate for autonomous processing. It also documents the AI Automation Patterns reference used across agentic activity design.
