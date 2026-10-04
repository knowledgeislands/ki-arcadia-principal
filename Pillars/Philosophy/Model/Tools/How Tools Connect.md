---
note_type: pillars/note
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: current - April 2026
author: Written with Claude
---

# How Tools Connect

## Overview

The tools that agents use to interact with the island and with connected services. Each tool has its own sub-folder documenting its connection configuration, operating conventions, and any lessons specific to working with it.

`Tools/` is the configuration layer - it covers how each tool is set up and connected. How agents use those tools to act on the island is a separate concern: operating behaviour lives in [[Model/Agents/Agents|Agents]]. For AI tools in particular, both layers exist - a tool note for the connection, and an agent note for the operating conventions. Neither duplicates the other.

Tools are connected via MCP (Model Context Protocol) servers where available. MCP gives Claude direct access to external services - email, calendar, task management, issue tracking - without requiring the human to relay information manually. The [[Admin Conventions/Integrations|Integrations]] note in Admin/Governance holds the island-specific connection identifiers and configuration for each MCP server.

---

## Obsidian

Obsidian is the primary interface for browsing and editing island content. The Obsidian note covers plugin configuration, templating conventions, and the vault settings the island depends on. A set of templates covering all calendar and note types is stored here and applied via the Templater plugin.

## Claude

Claude is the primary AI agent and the most deeply integrated tool. The Claude note covers the Cowork setup, the configuration layers for activity prompts, and the live artifact infrastructure. The Activities sub-folder holds all prompt notes - the island-specific prompts that drive each scheduled and conversational activity.

## ChatGPT

The ChatGPT note covers the connection and operating conventions for ChatGPT as a secondary AI tool - the tasks it handles and how it is configured to work alongside Claude without duplicating its role.

## Linear

Linear is the project management workspace. The Linear note covers the MCP connection and the conventions for keeping stream notes aligned with Linear initiatives and projects - the configuration that the Linear Sync activity depends on.

## Microsoft 365

Microsoft 365 is the email and calendar integration. The Microsoft 365 note covers the MCP connection configuration for the Outlook and calendar tools used in the Email and Briefings activities.

---

The following tools are Knowledge Islands-built MCP servers - bespoke capability extensions developed within the Knowledge Islands workspace rather than adopted from third parties. See [[Tool Ecosystem Map]] for how they fit into the broader system.

## Git Audit

Git Audit is the git fleet inspector. The Git Audit note covers the `mcp-git-audit` server, which scans a configured root and returns the state (branch, cleanliness, ahead/behind, last commit) of every repository found - a fleet-wide view without visiting each repo in turn.

## KB Filesystem

KB Filesystem is the programmatic interface to this island's knowledge base. The KB Filesystem note covers the `mcp-ki-kb-fs` server, which exposes access-gated read and write tools over one or more aliased knowledge bases and enforces path safety server-side.

## Notion Mirror

Notion Mirror publishes KB notes into Notion. The Notion Mirror note covers the `mcp-ki-kb-notion-mirror` server, which mirrors individual notes or folder subtrees under a caller-supplied Notion parent and writes the resulting Notion URLs back into each note's frontmatter.

## Gmail

Gmail is the email integration, reached through the Google Workspace server. The Gmail note covers the `mcp-gsuite` server, which provides read, triage, and draft-creation capabilities alongside Calendar, Drive and Sheets. No send tool is exposed - outbound mail passes through human review.

## Claude Housekeeping

Claude Housekeeping audits the filesystem areas where Claude applications accumulate state on macOS. The Claude Housekeeping note covers the `mcp-housekeeping-claude` server, which audits session, memory and storage state across Claude Desktop, Claude Code (`~/.claude/`) and the VS Code extension, with prune tools available only at an elevated access level.
