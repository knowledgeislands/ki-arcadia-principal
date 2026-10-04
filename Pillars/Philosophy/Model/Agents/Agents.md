---
note_type: pillars/index
tags:
  - card/note
  - topic/knowledge-islands
status: current - October 2026
author: Written with Claude
---

# Agents

## Overview

An agent is anything that reads, writes or reasons over island content, whether human or AI. Within the Model act, this chapter documents how each kind of agent behaves on the island: what it does, what it may and may not do, and which conventions govern its work. How a system is configured and connected is a separate concern, covered in [[Tools]]; an AI system can therefore appear in both chapters, once for how it acts and once for how it is set up.

The chapter moves from the general to the specific. Human operation and agentic AI operation are the two broad modes, and they are complementary: AI agents take routine, repeatable work while humans keep judgement, ratification and governance. Individual AI systems then each have their own folder for the conventions that apply only to them.

Start with [[Who Acts on the Island]], the narrative chapter note, before reading about any individual agent.

---

## Who Acts on the Island

[[Who Acts on the Island]] introduces the chapter and defines what counts as an agent. It explains the boundary between the Agents and Tools chapters and frames the division of labour between human and AI operation. It is the place to understand why agents are documented the way they are before turning to any one of them.

---

## Human

[[Agents/Human/Human|Human]] covers what a person does directly on the island: creating and editing notes, curating the inbox, reviewing and approving AI output, and navigating the graph. It sets out the editorial and governance judgements that should remain with people rather than be delegated to AI. Read it to understand the human role in the island's operating model and where it meets the work of AI agents.

---

## Agentic AI

[[Agentic AI]] holds the conventions for AI operation that apply regardless of which AI system does the work. It explains what belongs at this tool-independent level and what should instead live with a specific agent, tool or activity. It also contains [[AI Automation Patterns]], the reusable design patterns any AI agent should draw on when implementing an island activity rather than re-deriving them.

---

## Claude

[[Agents/Claude/Claude|Claude]] documents how Claude operates as an agent on the island, as distinct from how it is configured as a tool. It covers Claude's operating modes for saving, updating, querying, extracting and digesting knowledge, its behavioural constraints, its handling of release targets and live artifacts, and the structure of its auto-memory. As the island's most active AI agent, it is the most detailed note in the chapter.

---

## ChatGPT

[[Agents/ChatGPT/ChatGPT|ChatGPT]] records ChatGPT's current role as a read-heavy assistant without direct write access or scheduled automations. The folder exists so that every AI system the island uses has a consistent presence in this chapter, whether or not it currently acts agentically. It explains when the note would grow into a fuller account alongside Claude, and points to the corresponding tool note for configuration.
