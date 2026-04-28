---
tags:
  - card/note
  - topic/productivity
  - topic/knowledge-management
status: current - April 2026
purpose: Capture future improvements and tools to investigate for Knowledge Islands
author: Mixed
---

# Future Improvements

## Overview

A running list of tools, integrations, and improvements worth investigating for Knowledge Islands.

---

## Agent and Memory Improvements

### Semantic retrieval (RAG)

Currently relying on keyword/filename search and selective reading. Worth investigating once island size makes this feel slow. Options: Smart Connections Obsidian plugin, or a local vector store (Chroma/Qdrant). No urgency yet.

### Subagent routing by task type

For background and batch tasks (inbox processing, nightly review), route to a lighter model rather than Sonnet. Reduces cost and preserves the larger model budget for reasoning-heavy work. More relevant if moving to API-based access than current Cowork usage.

### Session check-in ritual

an explicit start-of-session command that loads context, reviews outstanding items, and primes Claude before work begins. A lightweight `/check-in` pattern would make session startup more consistent. Could be implemented as a second island skill mode or a Cowork skill.

### Preference capture (`/teach` pattern)

a formalised way to record preferences and conventions mid-session without manually editing `CLAUDE.md`. A `teach` mode on the island skill could write a new entry to a `Preferences.md` file and optionally update `CLAUDE.md`.

### Proactive meeting prep heartbeat

A frequent check (every 15-30 minutes during working hours) that detects an imminent meeting and automatically sends a prep brief pulling from prior meeting notes (via the configured Meetings integration) and Calendar context. Could be a scheduled task running during working hours (e.g. `*/15 9-18 * * 1-5`) that checks for imminent meetings and only acts when one is found.

### Email intelligence in morning briefing

Extend the morning briefing task to include a nightly scan of the email inbox via the configured email MCP (see [[Pillars/Knowledge Islands/Governance/KB Specifics/Integrations|KB Specifics → Integrations]]). Distil active threads into a 3-5 line awareness layer: what conversations are live, what needs attention, what can wait.

### Nightly repository organiser

A post-hoc pass that reviews notes written that day and: adds missing wikilinks to existing repository notes, fills in YAML tags that were omitted, and flags notes with `draft` status for follow-up. Likely a separate scheduled task running at 1-2am.

### Decay-aware draft review

Notes in `draft` status not touched in 30+ days are candidates for archiving, deletion, or promotion to `current`. Extending the threshold to 60 days would surface long-stale content more urgently.

### Pre-invocation check for scheduled tasks

Before committing full LLM inference in a cron task, run a cheap pre-check: is there anything to act on? A lightweight gate could return early on quiet days, saving significant tokens.

### Typed wikilinks as vault convention

Current repository wikilinks are untyped: `[[Note Name]]`. Adding a `- relation_type [[Target]]` list before standard `[[Related Note]]` entries makes the knowledge graph semantically queryable. Most useful in `Streams/` where dependency and implementation relationships matter.

### Observation-style fact tagging

Structuring key facts within notes as categorised list items: `- [decision] Chose X over Y because Z` or `- [risk] Dependency on external API`. Enables targeted retrieval without reading full note prose.

---

## Calendar Templates (Bullet Journal)

The Calendar templates (Daily, Weekly, Monthly) are currently minimal placeholders. They should be redesigned around the Bullet Journal methodology by Ryder Carroll - specifically the rapid logging system, migration process, and collections concept. Research from official Bullet Journal sources and adapt to Obsidian's structure before updating the templates.

Reference: [bulletjournal.com](https://bulletjournal.com) / Ryder Carroll's original method.

---

## Tooling

- Integration with [n8n](https://n8n.io/)
- Looking into [hex](https://hex.tech/)
- [caveman](https://github.com/JuliusBrussee/caveman)

---

## MCPs

- <https://mcpservers.org/>
- <https://mcplane.com/>
- <https://apps.apple.com/us/app/mcp-dock/id6748305262?mt=12>
- <https://gofastmcp.com/getting-started/welcome>

---

## Related Topics

- [[Streams/Future/Future|Future]] - parent stream index
- [[Concept|Methodology]] - originated from the methodology note
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Claude|Claude]] - integration patterns relevant to several improvements
