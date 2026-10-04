---
note_type: pillars/index
tags:
  - card/note
  - topic/mcp
  - topic/ai
  - topic/knowledge-islands
source: claude
status: current - October 2026
---

# Claude Housekeeping

MCP server that audits and, when permitted, cleans the filesystem state Claude applications accumulate on macOS. Source: `mcp-housekeeping-claude`. The authoritative tool catalogue is the [mcp-housekeeping-claude README](https://github.com/knowledgeislands/mcp-housekeeping-claude#readme).

## Tools

Tools follow the `<app>_<resource>_<action>` convention across three surfaces.

**Claude Desktop and Cowork** - `claude_desktop_*` tools summarise storage, sessions, outputs, artifacts, memory, plugins and backups.

**Claude Code** - `claude_code_*` tools report global status, projects, sessions and memory under `~/.claude/`.

**VS Code** - `vscode_*` tools list and summarise Claude chat sessions stored by the VS Code extension.

## Notes

Access is gated: each tool is `read` or `destructive`, and the default `read` level exposes only audits. Prune, delete and memory-write tools are registered only when the operator raises the level. Each audit step is a dedicated tool; the agent orchestrates the checks and writes the report.
