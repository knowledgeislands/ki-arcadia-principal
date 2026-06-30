---
tags:
  - card/note
  - topic/mcp
  - topic/notion
  - topic/knowledge-management
source: claude
status: current - June 2026
---

# Notion Mirror

MCP server that mirrors Knowledge Islands KB notes into Notion, writing the resulting page URLs back into each note's frontmatter. Source: `mcp-kb-notion-mirror` (Knowledge Islands workspace).

## Tools

**Mirroring**

`notion_mirror_note` — mirror a single KB note into Notion under a specified parent page. Writes the Notion URL into the note's `notion-url` frontmatter field.

`notion_mirror_subtree` — mirror all notes under a given KB path into Notion, preserving the folder hierarchy.

## Notes

One-directional: the KB is the source of truth. Notion serves as a human-readable sharing or publication layer. Do not edit mirrored content in Notion directly — changes will be overwritten on the next mirror run.
