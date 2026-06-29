---
tags:
  - card/note
  - topic/mcp
  - topic/ai
  - topic/knowledge-islands
source: claude
status: current - June 2026
---

# Claude Housekeeping

MCP server that audits the filesystem areas where Claude applications accumulate state on macOS. Source: `mcp-claude-housekeeping`
(Knowledge Islands workspace).

## Tools

**Audit**

`housekeeping_session_audit` — list and summarise Claude Desktop and Cowork sessions under `~/Library/Application Support/Claude/`.

`housekeeping_settings_audit` — report on files under `~/.claude/` (settings, memory, skills, plans).

`housekeeping_vscode_audit` — list Claude chat sessions stored by the VS Code extension.

## Notes

Read-only by design — the server surfaces state for review but does not delete or modify files. Useful for understanding session
accumulation and deciding what to archive or prune manually.
