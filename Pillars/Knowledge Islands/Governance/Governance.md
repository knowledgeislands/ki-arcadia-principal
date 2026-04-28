---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: current - April 2026
purpose: Index for the Governance subtree - methodology, conventions, processes, agents, tools, and maintenance activities
author: Written with Claude
---

# Governance

## Overview

Governance is the operational layer of the island: how knowledge is structured, how changes are made, who acts and how, and what keeps the system running day to day. It is not about restriction - it is about consistency. A well-governed island produces knowledge that is trustworthy, navigable, and durable across agents and over time.

The subtree is organised into five areas that work together. **Conventions** define the shared language - what a note looks like, how it is tagged, where it lives, and what boundary separates internal from external knowledge. **Processes** are the formal gates - how changes are ratified and how knowledge crosses island boundaries. **Activities** are the ongoing work - the scheduled automations and manual reviews that prevent drift and decay. **Agents** is the operating layer - who and what acts on the island, at what level of capability, and under what patterns. **Tools** is the configuration layer - the editors, AI systems, and connected services through which agents do their work.

Island-specific identity - this island's council, citizenship, integrations, and routing configuration - lives separately in [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]], which is the island-specific realisation of everything defined here.

---

## Conventions

[[Pillars/Knowledge Islands/Governance/Conventions/Conventions|Conventions]] defines the shared language for the entire island: note format and structure, frontmatter properties and tags, folder layout, routing rules, and the enforced boundary between Pillars and Resources. Conventions are not stylistic preferences - they are the mechanism through which notes remain consistent enough to be processed by both human and AI agents without ambiguity.

Two sub-areas carry the most weight. [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Notes|Notes]] defines what a note is and how it is written - including the specialised types (collection cards, meeting notes, session digests, activity notes) that extend the base format. [[Pillars/Knowledge Islands/Governance/Conventions/Structure/Library/Library|Library]] defines where notes live - the top-level folder structure, routing rules, index note conventions, and the Pillars/Resources boundary.

---

## Processes

[[Pillars/Knowledge Islands/Governance/Processes/Processes|Processes]] holds the formal mechanisms through which knowledge changes are made and ratified. Two distinct processes are documented. The [[Pillars/Knowledge Islands/Governance/Processes/Enactment Process|Enactment Process]] is the internal gate: nothing enters Pillars or Resources except through council ratification of a formal proposal. The [[Pillars/Knowledge Islands/Governance/Processes/Contribution Process|Contribution Process]] is the external boundary: how knowledge developed in other archipelagos can be proposed as a canonical addition to the Knowledge Islands model in Arcadia, and how inbound and outbound patterns work at that boundary.

---

## Activities

[[Pillars/Knowledge Islands/Governance/Activities/Activities|Activities]] documents the ongoing work that keeps the island structurally sound, content-healthy, and aligned with connected services. Activities divide into two kinds: scheduled automations (time-driven, running without human initiation - daily briefings, email triage, Linear sync, and periodic health checks) and conversational activities (chat-triggered, human-in-the-loop - inbox reviews, status sweeps, wikilink audits). Together they implement the maintenance cycle that prevents the island from drifting from the world it reflects.

The prompts that drive scheduled activities live at Layer 5 in [[Pillars/Knowledge Islands/Governance/Tools/Claude/Activities/Activities|Tools/Claude/Activities]]. The five-layer model that separates what an activity does from how it is prompted is documented in [[Pillars/Knowledge Islands/Governance/Activities/Authoring Activities|Authoring Activities]].

---

## Agents

[[Pillars/Knowledge Islands/Governance/Agents/Agents|Agents]] is the operating layer: who and what acts on the island, at what level of capability, and under what patterns. An agent is anything that reads, writes, or reasons over island content - human or AI. Agents divide into human operation (editorial judgement, manual curation, final authority on ratification) and agentic AI operation (routine processing, automation, and AI-specific behavioural patterns). The two modes are complementary rather than competing.

The distinction between Agents and Tools is deliberate: Agents covers how each agent operates; Tools covers how each tool is configured and connected. A given AI system appears in both - once for operating conventions, once for connection setup.

---

## Tools

[[Pillars/Knowledge Islands/Governance/Tools/Tools|Tools]] is the configuration layer: the editors, AI systems, task managers, and connected services through which agents act on the island. Each tool sub-folder documents its connection setup, operating conventions, and any tool-specific lessons. Tools connect to external services primarily through MCP (Model Context Protocol) servers, which give Claude direct access to email, calendar, issue tracking, and other services without requiring manual relay by the human agent.

The tool layer and the agent layer are kept separate by design. Tool notes cover the what and how of connection; agent notes cover the patterns and constraints of operation. Neither duplicates the other.

---

## Related Topics

- [[Pillars/Knowledge Islands/Knowledge Islands|Knowledge Islands]] - parent index
- [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]] - island-specific realisation: council, citizenship, integrations, and routing configuration
- [[Pillars/Knowledge Islands/Concept/Concept|Concept]] - the conceptual model; what knowledge is, how it cycles, geographic framework, jurisdiction, and governance authority
