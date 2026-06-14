---
type: stream-proposal
tags:
  - topic/knowledge-islands
  - topic/ai
status: draft
priority: low
dependencies: []
author: Written with Claude
---

# Agent and Session Improvements Proposal

## Overview

Ideas for improving how Claude operates within the island - both deeper AI capabilities (retrieval, model routing) and the session-level interaction patterns that make work feel consistent and low-friction.

---

## Governance

This stream follows the [[Knowledge Islands/Model/Processes/Enactment Process|Enactment Process]].

---

## Checklist

- [ ] **Semantic retrieval (RAG)** - Currently relying on keyword/filename search and selective reading. Worth investigating once island size makes this feel slow. Options: Smart Connections Obsidian plugin, or a local vector store (Chroma/Qdrant). No urgency until the island grows significantly.
- [ ] **Subagent routing by task type** - For background and batch tasks (inbox processing, nightly review), route to a lighter model rather than Sonnet. Reduces cost and preserves the larger model budget for reasoning-heavy work. More relevant if moving to API-based access than current Cowork usage.
- [ ] **Session check-in ritual** - An explicit start-of-session command that loads context, reviews outstanding items, and primes Claude before work begins. A lightweight `/check-in` pattern would make session startup more consistent. Could be a second island skill mode or a Cowork skill.
- [ ] **Preference capture (`/teach` pattern)** - A formalised way to record preferences and conventions mid-session without manually editing `CLAUDE.md`. A `teach` mode on the island skill could write a new entry to a `Preferences.md` file and optionally update `CLAUDE.md`.

## Governance

This stream adheres to the [[Enactment Process]]. Content reaches `Pillars/` or `Resources/` only on user approval of a `ready` proposal.
