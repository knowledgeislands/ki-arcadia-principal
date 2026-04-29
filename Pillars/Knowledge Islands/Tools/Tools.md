---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: current - April 2026
author: Written with Claude
---

# Tools

## Overview

The tools that agents use to interact with the island and with connected services. Each tool has its own sub-folder documenting its connection configuration, operating conventions, and any lessons specific to working with it.

`Tools/` is the configuration layer - it covers how each tool is set up and connected. How agents use those tools to act on the island is a separate concern: operating behaviour lives in [[Knowledge Islands/Agents/Agents|Agents]]. For AI tools in particular, both layers exist: a tool note for the connection, and an agent note for the operating conventions. Neither duplicates the other.

Tools are connected via MCP (Model Context Protocol) servers where available. MCP gives Claude direct access to external services - email, calendar, task management, issue tracking - without requiring the human to relay information manually. The [[Integrations]] note in Knowledge Capital holds the island-specific connection identifiers and configuration for each MCP server.
