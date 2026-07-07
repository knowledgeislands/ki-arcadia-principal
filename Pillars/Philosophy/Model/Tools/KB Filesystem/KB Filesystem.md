---
tags:
  - card/note
  - topic/mcp
  - topic/knowledge-management
  - topic/knowledge-islands
source: claude
status: current - June 2026
---

# KB Filesystem

MCP server that exposes this island's markdown knowledge base as read/write tools. Source: `mcp-ki-kb-fs` (Knowledge Islands workspace).

## Tools

**Reading**

`kb_note_read` — read a markdown note by path relative to the KB root. Accepts `.md` files only; rejects dotfiles and repo-meta paths.

`kb_note_list` — list notes under a given directory path.

**Writing**

`kb_note_write` — write or overwrite a note. Validates the target path against the configured KB root before writing; the root is injected at server startup, not hard-coded.

## Notes

The primary programmatic interface to ki-arcadia-principal. Path safety is enforced server-side. The Read tool in Claude Code fails silently on paths containing spaces — use `Bash cat "path"` for those.
