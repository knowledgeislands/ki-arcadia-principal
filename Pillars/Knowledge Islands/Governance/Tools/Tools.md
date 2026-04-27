---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: current - April 2026
purpose: Index of tools connected to the island — what each does, how it connects, and where its configuration lives
author: Written with Claude
---

# Tools

## Overview

The tools that agents use to interact with the island and with connected services. Each tool has its own sub-folder documenting its connection configuration, operating conventions, and any lessons specific to working with it.

`Tools/` is the configuration layer — it covers how each tool is set up and connected. How agents use those tools to act on the island is a separate concern: operating behaviour lives in [[Pillars/Knowledge Islands/Governance/Agents/Agents|Agents]]. For AI tools in particular, both layers exist: a tool note for the connection, and an agent note for the operating conventions. Neither duplicates the other.

Tools are connected via MCP (Model Context Protocol) servers where available. MCP gives Claude direct access to external services — email, calendar, task management, issue tracking — without requiring the human to relay information manually. The [[Pillars/Knowledge Capital/Tools/Integrations|Integrations]] note in Knowledge Capital holds the island-specific connection identifiers and configuration for each MCP server.

---

## Obsidian

The primary editor and visualisation environment. [[Pillars/Knowledge Islands/Governance/Tools/Obsidian/Obsidian|Obsidian]] covers vault configuration, the Templater plugin, and the full index of note scaffolding templates. The human agent works almost exclusively through Obsidian; the AI agents interact with the underlying Markdown files directly rather than through Obsidian.

---

## Claude

The primary AI tool, connected via Cowork. [[Pillars/Knowledge Islands/Governance/Tools/Claude/Claude|Claude]] documents the Cowork configuration layer: the MCP connection, token economics of the integration, and the activity prompt library at `Tools/Claude/Activities/`. How Claude operates as an agent — its five modes, behavioural constraints, and memory architecture — is in [[Pillars/Knowledge Islands/Governance/Agents/Claude/Claude|Agents/Claude]].

---

## ChatGPT

A secondary AI tool used for read-heavy sessions. [[Pillars/Knowledge Islands/Governance/Tools/ChatGPT/ChatGPT|ChatGPT]] covers the context-loading pattern and the manual note routing convention used in place of direct write access. It has no MCP connection to the island.

---

## Linear

The issue and project management integration. [[Pillars/Knowledge Islands/Governance/Tools/Linear/Linear|Linear]] covers the MCP connection, the scope boundary between Linear and the KB (what lives in Linear vs what belongs in Streams), and the browser-based interaction patterns used when the MCP is insufficient.

---

## Microsoft 365

The M365 integration covering Outlook, OneDrive, and Power Automate. [[Pillars/Knowledge Islands/Governance/Tools/Microsoft 365/Microsoft 365|Microsoft 365]] covers the M365 MCP server, which connects to the Microsoft Graph API, and the operating conventions for reading email, managing files in OneDrive, and triggering Power Automate flows from Claude sessions.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Governance|Governance]] - parent index
- [[Pillars/Knowledge Islands/Governance/Agents/Agents|Agents]] - the operating layer that uses these tools
- [[Pillars/Knowledge Capital/Tools/Integrations|Integrations]] - island-specific connection identifiers and MCP configuration for each tool
