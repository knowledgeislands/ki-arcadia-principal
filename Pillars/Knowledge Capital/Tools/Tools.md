---
tags:
  - card/note
  - topic/knowledge-islands
status: current - April 2026
author: Written with Claude
---

# Tools

## Overview

This folder holds the island-specific configuration for the tools and infrastructure that Arcadia runs on. Generic tool patterns - the categories of tools, how MCP connections work, the roles of Obsidian and Cowork - are defined in [[Knowledge Islands/Governance/Tools/Tools]] under Knowledge Islands. What lives here is the concrete detail for this island: which external services are actually connected and under which MCP identifiers, and where on the filesystem the island's stores physically live.

---

## Integrations

[[Integrations|Integrations]] lists the external tools connected to Arcadia, with their MCP tool prefixes. It is the island-specific lookup for anything that varies by island - which email MCP to use, which task list to write to, which calendar to read. Arcadia's current integration surface is intentionally minimal (the `+/` inbox folder via the filesystem; no external calendar, task, or issue tracker is configured), but the note is the correct place to record connections as they are introduced. Activity prompts reference this note to resolve their platform-specific configuration rather than hardcoding service identifiers.

---

## Physical Locations

[[Physical Locations|Physical Locations]] documents the three filesystem paths that make up Arcadia's physical footprint: the text store (Git repository in Obsidian), the binary store (not yet defined), and the Cowork working folder used for temporary session outputs. Having these in one place means that any process that needs to know where to read, write, or cache content can find the canonical path here rather than relying on convention or memory.

---

## Related Topics

- [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]] - parent index
- [[Pillars/Knowledge Islands/Governance/Tools/Tools|Tools]] - generic tool index this island follows
