---
tags:
  - card/note
  - topic/knowledge-islands
status: current - April 2026
author: Written with Claude
---

# Knowledge Islands

## Overview

Knowledge Islands is a conceptual model for organising knowledge. It is informed by [Zettelkasten][zettelkasten] and [PARA Method][para] and greatly enhanced in its possibilities by LLM AI (such as Claude, ChatGPT, Gemini) and its evolvement in a pattern widely known as [Karpathy LLM Wiki][karpathy-llm-wiki].

In Knowledge Islands, knowledge is treated as a natural, evolving system - islands are discrete bodies of knowledge, archipelagos are groups of islands governed together under the same rules of access, contribution, and change.

Arcadia is the Knowledge Island of Knowledge Islands - a legendary utopia in the form of an archipelago that holds the canonical definition and governance model for the entire Knowledge Islands concept. Every other archipelago that adopts the model derives its baseline from Arcadia. The governance model is portable: three patterns are defined - council, single-governor, and joint-governor - and each island's specific realisation lives in its own [[Knowledge Capital]]. Every person interacting with an island holds a standing within it: a **Citizen** has full standing and is eligible for council membership; a **Visitor** may contribute informally but holds no formal standing.

If you are new to Knowledge Islands, start with [[Reading Order]] rather than diving into the sections below — it traces a path through the content that builds the model up step by step, so nothing arrives without context.

---

## Concept

[[Concept]] is the full conceptual model. It defines what knowledge is - distinct from information and from wisdom - and how it matures through continuous cycles of capture, connection, and reflection. It maps the geography of an island: the Capital and its Library (the canonical record, organised into Calendar, Pillars, and Resources) and Streams (knowledge in motion); the Harbour as the port of entry; and the territory and archipelago structures that govern how islands relate. It defines agents - human and artificial - and the jurisdictional model of Citizen, Visitor, and Council Member. The model is portable: Arcadia holds the canonical definition; any archipelago may adopt it and derive its own realisation.

---

## Conventions

[[Knowledge Islands/Conventions/Conventions|Conventions]] defines the shared language for the entire island: note format and structure, frontmatter properties and tags, folder layout, routing rules, and the enforced boundary between Pillars and Resources. Conventions are not stylistic preferences - they are the mechanism through which notes remain consistent enough to be processed by both human and AI agents without ambiguity.

Two sub-areas carry the most weight. [[Notes]] defines what a note is and how it is written - including the specialised types (collection cards, meeting notes, session digests, activity notes) that extend the base format. [[Library]] defines where notes live - the top-level folder structure, routing rules, index note conventions, and the Pillars/Resources boundary.

---

## Processes

[[Knowledge Islands/Processes/Processes|Processes]] holds the formal mechanisms through which knowledge changes are made and ratified. The [[Knowledge Islands/Processes/Enactment Process|Enactment Process]] is the internal gate: nothing enters Pillars or Resources except through council ratification of a formal proposal. The [[Contribution Process]] is the external boundary: how knowledge developed in other archipelagos can be proposed as a canonical addition to the Knowledge Islands model in Arcadia, and how inbound and outbound patterns work at that boundary.

---

## Activities

[[Knowledge Islands/Activities/Activities|Activities]] documents the ongoing work that keeps the island structurally sound, content-healthy, and aligned with connected services. Activities divide into two kinds: scheduled automations (time-driven, running without human initiation - daily briefings, email triage, Linear sync, and periodic health checks) and conversational activities (chat-triggered, human-in-the-loop - inbox reviews, status sweeps, wikilink audits). Together they implement the maintenance cycle that prevents the island from drifting from the world it reflects.

The prompts that drive scheduled activities live in [[Claude/Activities/Activities|Tools/Claude/Activities]]. A layered model that separates what an activity does from how it is prompted is documented in [[Authoring Activities]].

---

## Agents

[[Knowledge Islands/Agents/Agents|Agents]] is the operating layer: who and what acts on the island, at what level of capability, and under what patterns. An agent is anything that reads, writes, or reasons over island content - human or AI. Agents divide into human operation (editorial judgement, manual curation, final authority on ratification) and agentic AI operation (routine processing, automation, and AI-specific behavioural patterns). The two modes are complementary rather than competing.

The distinction between Agents and Tools is deliberate: Agents covers how each agent operates; Tools covers how each tool is configured and connected. A given AI system appears in both - once for operating conventions, once for connection setup.

---

## Tools

[[Knowledge Islands/Tools/Tools|Tools]] is the configuration layer: the editors, AI systems, task managers, and connected services through which agents act on the island. Each tool sub-folder documents its connection setup, operating conventions, and any tool-specific lessons. Tools connect to external services primarily through MCP (Model Context Protocol) servers, which give Claude direct access to email, calendar, issue tracking, and other services without requiring manual relay by the human agent.

The tool layer and the agent layer are kept separate by design. Tool notes cover the what and how of connection; agent notes cover the patterns and constraints of operation. Neither duplicates the other.

---

## Knowledge Capitals

Every general concept defined in [[Knowledge Islands]] may have a corresponding specific realisation in [[Knowledge Capital]]. Knowledge Islands holds the portable, island-agnostic definition; Knowledge Capital holds Arcadia's instance — this island's council, citizenship records, integration configuration, routing overrides, and identity.

---

## Related Topics

- [[Pillars/Pillars|Pillars]] - the Library's top-level index; Knowledge Islands is one of its Pillar domains
- [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]] - Arcadia's island-specific instance of everything defined here

[zettelkasten]: https://zettelkasten.de/introduction/
[para]: https://fortelabs.com/blog/para/
[karpathy-llm-wiki]: https://gist.github.com/karpathy/442a6bf555914893e9891c11519de94f
