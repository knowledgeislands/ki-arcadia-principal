---
tags:
  - card/stream
  - topic/knowledge-islands
  - topic/ai
status: draft - April 2026
purpose: Understand and improve the token economics of island AI operations - prompt efficiency, context design, caching, and tooling
priority: low
dependencies: []
author: Written with Claude
---

# Token Economics

## Overview

A stream to understand and improve how tokens are spent across all island AI operations. Token cost is a meaningful constraint: wasteful prompts inflate cost and exhaust context budgets faster; well-designed prompts do more with less. This covers three areas: scheduled task prompt design, interactive session efficiency, and tooling that assists with token measurement or reduction.

---

## Governance

This stream follows the [[Pillars/Knowledge Islands/Governance/Processes/Enactment Process|Enactment Process]].

---

## Inputs

| Type     | Detail                                                                    |
| -------- | ------------------------------------------------------------------------- |
| Document | Existing scheduled task prompts in `Tools/Claude/Activities/`             |
| Document | [[Pillars/Knowledge Islands/Governance/Activities/Authoring Activities|Authoring Activities]] - prompt authoring conventions |

---

## Outputs

| Type     | Detail                                                                           |
| -------- | -------------------------------------------------------------------------------- |
| Artefact | Convention note under `Pillars/Knowledge Islands/Governance/` (destination TBD) |

---

## Checklist

- [ ] Create token economics convention note at `Pillars/Knowledge Islands/Governance/` (path TBD once scope is resolved)
- [ ] Document findings as guidance in the relevant Layer 5 prompts

---

## Open Questions

- Should this produce a standalone convention note, or guidance embedded directly in task prompts?
- What is the right granularity — general principles, or prompt-by-prompt annotations?

---

## Design

### Scheduled task prompt efficiency

1. How to write scheduled task prompts that are lean (minimal token usage)
2. Which context to include vs. exclude — what the model actually needs vs. what is habitually included
3. Pre-invocation gate pattern: run a cheap check before committing full inference; return early on quiet days
4. Caching strategies and prompt structure conventions to maximise cache hits

### Interactive session efficiency

1. Context window discipline — what to load, when to summarise, when to start fresh
2. Tool call batching — reducing round-trips by issuing independent calls in parallel
3. Memory file design — keeping memory files lean so they load quickly without diluting context

### Tooling

1. **[caveman](https://github.com/JuliusBrussee/caveman)** — Investigate as a token-efficiency or prompt analysis tool; assess whether it provides useful visibility into token usage or prompt structure

---

## Related Topics

- [[Streams/Future/Future|Future]] - parent stream index
- [[Pillars/Knowledge Islands/Governance/Activities/Authoring Activities|Authoring Activities]] - prompt authoring conventions this stream will extend
- [[Streams/Future/Scheduled Automations/Scheduled Automations|Scheduled Automations]] - the automation suite whose prompts are a primary target
