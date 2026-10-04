---
note_type: pillars/index
tags:
  - card/note
  - topic/knowledge-islands
status: current - October 2026
author: Written with Claude
---

# Tools

## Overview

Tools is the last chapter of the Model: having established the conventions, processes, activities and agents of an island, it documents the instruments those agents use to reach the island and the services around it. Each tool has its own subfolder covering how it is connected and configured, the operating conventions specific to it, and any lessons learned working with it. How an agent behaves when it uses a tool is a separate concern documented under Agents, so the Claude and ChatGPT notes here cover the connection and setup rather than the agent's conduct.

Start with [[How Tools Connect]], the narrative chapter note that frames the tool set as a whole and explains how MCP servers give agents direct access to external services. The tools then fall into two groups: third-party tools the island adopts (Obsidian, Claude, ChatGPT, Linear), and MCP servers built within the Knowledge Islands workspace (Microsoft 365, Git Audit, KB Filesystem, Notion Mirror, Gmail and Claude Housekeeping). Island-specific connection identifiers do not live here; they belong to the island's own integrations record.

---

## How Tools Connect

[[How Tools Connect]] is the chapter note for this folder and the place to start. It explains the boundary between a tool note and an agent note, the role of MCP as the connection mechanism, and where island-specific connection details are held. It then walks through each tool in turn, distinguishing adopted third-party tools from the bespoke Knowledge Islands MCP servers.

---

## Obsidian

[[Obsidian]] covers the primary human interface to the island - the editor through which notes are read, written and navigated as a linked graph. It explains how Obsidian relates to the island's conventions: the conventions define what the vault contains, and Obsidian is how they are enacted day to day. The folder also holds the Templater templates that scaffold every calendar and note type, with an index of each template and its purpose.

---

## Claude

[[Tools/Claude/Claude|Claude]] documents Claude as a tool: how Cowork connects it to the island, the token economics of the context files it loads, and how its auto-memory and skill-based memory work. Claude is the most deeply integrated tool, so this is the largest subfolder, holding notes on Cowork configuration, the register of mistakes and lessons from Claude sessions, the live-artifact dashboards, and the library of executable activity prompts. A reader looking for how Claude behaves as an agent should go to [[Agents/Claude/Claude|Claude]] under Agents instead.

---

## ChatGPT

[[Tools/ChatGPT/ChatGPT|ChatGPT]] describes how ChatGPT is used alongside the island as a query and drafting tool, with island context loaded into a custom GPT or Project. It makes the scope plain: ChatGPT has no direct file access, so it reads the island only through loaded context and its outputs return only through manual review and routing. Its agent-side working patterns are covered separately in [[Agents/ChatGPT/ChatGPT|ChatGPT]] under Agents.

---

## Linear

[[Linear]] covers Linear as the issue-tracking and project-management workspace, reached both through its MCP server and through browser interaction. It records the MCP integration that the Linear activities depend on, and practical patterns for driving Linear's dense web interface reliably from a browser agent.

---

## Microsoft 365

[[Microsoft 365]] documents `mcp-m365`, the Knowledge Islands-built MCP server that gives agents Outlook email, calendar, mail-folder and OneDrive access through Microsoft Graph. It is the tool behind the Email and Briefings activities. The note sets out the tool catalogue by surface and the Azure app registration and OAuth steps needed to connect it.

---

## Git Audit

[[Git Audit]] covers `mcp-git-audit`, a fleet inspector that walks a tree of repositories and reports each one's branch, cleanliness, upstream divergence and last commit. It exists to give a single housekeeping view across many repositories without visiting each in turn. The note lists the inspection tool, the optional fetch, pull and push tools gated behind a higher access level, and where the tool stops short of per-repository status.

---

## KB Filesystem

[[KB Filesystem]] documents `mcp-ki-kb-fs`, the programmatic interface for reading and writing one or more knowledge bases through named aliases. Its significance is safety: access is gated by level, and paths are validated server-side so a call cannot escape its base or reach outside the declared zones and staging areas. The note summarises the read and write tools and points to the authoritative catalogue.

---

## Notion Mirror

[[Notion Mirror]] covers `mcp-ki-kb-notion-mirror`, which publishes knowledge-base notes or folder subtrees into Notion and records each resulting page URL back in the note's frontmatter. It exists so people who do not work in the knowledge base can still read it, while the knowledge base remains the source of truth. The note explains the one-directional model and the safeguards around destructive operations.

---

## Gmail

[[Gmail]] describes how Gmail is reached through `mcp-gsuite`, the Google Workspace MCP server that also serves Calendar, Drive and Sheets behind one access gate. It sets out the reading, organisation and drafting capabilities, and the deliberate absence of a send tool so that outbound mail always passes through human review.

---

## Claude Housekeeping

[[Claude Housekeeping]] documents `mcp-housekeeping-claude`, which audits and, where permitted, cleans the state that Claude Desktop, Cowork, Claude Code and the VS Code extension accumulate on macOS. By default it exposes only audits; pruning, deletion and memory-write tools appear only when the operator raises the access level. The note outlines the three surfaces it covers and points to the authoritative tool catalogue.
