---
type: admin/governance/decision
decision_type: strategy
status: current - June 2026
author: Written with Claude
decision_depends_on: ['SDR-KI-ARCADIA-001', 'SDR-KI-ARCADIA-003', 'SDR-KI-ARCADIA-005']
---

# SDR-KI-ARCADIA-006: Agents in the Knowledge Islands Model

**Status:** Accepted

**Date:** 2026-06-25

## Context

The Knowledge Islands model describes a knowledge cycle: knowledge is created, curated, and used by actors who interact with the island. SDR-KI-ARCADIA-003 established the governance of an island. SDR-KI-ARCADIA-005 introduced standing (Visitor, Citizen, Council) as the vocabulary for who may act on an island. Neither DR defined what types of agent participate in the cycle or how they differ in role, capability, and constraint.

In practice, Arcadia is worked by a combination of the island owner acting through editors and chat interfaces, Claude operating as an agentic AI with read/write access to the repository, and other tools with narrower bounded roles. The distinction between these agent types matters for governance: what an agent may propose, how it reads configuration, and what authority it may exercise are all agent-specific.

## Decision

### Agent types

Three types of agent participate in the Knowledge Islands cycle:

| Type                  | Role in the cycle                                             | Interface                              |
| --------------------- | ------------------------------------------------------------- | -------------------------------------- |
| **Human**             | Judgment, meaning-making, editorial authority                 | Documents, editors, chat, review       |
| **Artificial (tool)** | Capture, connection, curation                                 | Protocols, APIs, MCP tools             |
| **Agentic AI**        | Autonomous processing, structured output, scheduled execution | Skill prompts, tool calls, file writes |

The distinction between human and AI is not structural - both can edit a file - but semantic: humans determine what knowledge is valuable and decide what the island should contain. Artificial agents and agentic AIs execute reliably against patterns; they do not originate editorial judgement. The island's authoritativeness comes from human authorship at its root, even when AI produces the draft or the automation produces the update.

### Human agents

A human agent navigates, curates, and makes editorial judgements. They read notes to understand the island, propose changes through the Enactment Process, and ratify or reject proposals as a council member. Human agents interact through documents (editors, Obsidian) and conversational interfaces (Claude Code chat, other AI chat tools). The island's model explicitly records what a human agent can and cannot delegate to an AI agent.

### Agentic AI agents

An agentic AI is an AI system operating with enough autonomy to take multi-step actions - writing files, calling tools, executing plans across a session - without step-by-step human instruction. On a Knowledge Island, an agentic AI may:

- Read all island content.
- Write drafts and propose changes (as Citizens).
- Execute activity automations within the scope of their prompt.
- Update the auto-memory layer under explicit charter.

An agentic AI may not ratify a proposal (Council is a human role), originate a DR without human review, or take destructive git actions without per-command instruction.

The **Agentic Patterns** note in the Model layer captures the structural design patterns for agentic activity: the live artifact baseline protocol, the parallel MCP latency reduction pattern, the cache pattern for reducing redundant fetches, and the window convention. These are activity-agnostic and island-agnostic: any agentic AI operating on any island should apply them.

### Named AI agents in Arcadia

Arcadia recognises two named AI agents: **Claude** and **ChatGPT**. Each has its own note in the `Agents/` folder covering operating conventions, memory architecture, and behavioural constraints specific to that agent. The Claude note is the most complete, because Claude is the primary agentic AI for Arcadia. The ChatGPT note exists for tasks Claude performs less well (certain long-form analysis and structured reasoning patterns).

Named agent notes are separate from tool notes (`Model/Tools/`): a tool note covers a platform integration (MCP server, API connection); an agent note covers how a specific AI entity operates on the island.

### Standing and governance

Agent standing (Visitor / Citizen / Council) applies to all agent types, human and AI alike. The mapping:

| Agent                | Typical standing | Notes                                 |
| -------------------- | ---------------- | ------------------------------------- |
| Human (island owner) | Council          | Full governance authority             |
| Human (contributor)  | Citizen          | Proposal rights; no ratification      |
| Claude (agentic)     | Citizen          | Proposes; does not ratify             |
| Other AI tools       | Visitor          | Read and suggest; no formal proposals |

An AI agent operates as a Citizen when it is acting under a skill prompt that grants it proposal authority for a defined scope. Outside that scope, it defaults to Visitor standing.

## Consequences

- The island model explicitly names three agent types: human, artificial (tool), and agentic AI. The distinction is semantic, not structural.
- Humans hold exclusive authority over editorial judgement, proposal ratification, and destructive operations.
- Agentic AIs operating as Citizens must be acting under an explicit skill prompt that scopes their authority.
- The Agentic Patterns note captures the canonical design patterns for AI-driven activity on the island.
- New named AI agents (e.g. a future reasoning model replacing ChatGPT) require a new agent note in `Model/Agents/`.

## References

- [SDR-KI-ARCADIA-001: Knowledge Islands - The Strategy](SDR-KI-ARCADIA-001-knowledge-islands-strategy.md)
- [SDR-KI-ARCADIA-003: The Governance of an Island](SDR-KI-ARCADIA-003-the-governance-of-an-island.md)
- [SDR-KI-ARCADIA-005: Territories, Archipelagos, and the Constitutional Layer](SDR-KI-ARCADIA-005-territories-archipelagos-constitutional-layer.md)
- [Agents - Concept](../../../Pillars/Philosophy/Introduction/Concept/Agents/Agents.md)
- [Who Acts on the Island](../../../Pillars/Philosophy/Model/Agents/Who%20Acts%20on%20the%20Island.md)
- [Agentic AI](../../../Pillars/Philosophy/Model/Agents/Agentic%20AI/Agentic%20AI.md)
