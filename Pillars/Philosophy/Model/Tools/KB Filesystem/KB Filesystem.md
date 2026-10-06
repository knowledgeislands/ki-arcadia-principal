---
note_type: pillars/index
tags:
  - card/note
  - topic/mcp
  - topic/knowledge-management
  - topic/knowledge-islands
source: claude
status: current - October 2026
---

# KB Filesystem

MCP server that gives a model read and write access to one or more local knowledge-base directories. Source: `mcp-ki-kb-fs`. The authoritative tool catalogue is the [mcp-ki-kb-fs README](https://github.com/knowledgeislands/mcp-ki-kb-fs#readme).

## Tools

**Reading** - `kb_list` lists notes and folders, `kb_read` reads a note, `kb_search` retrieves bounded snippets from a prepared index, and `kb_config` reports the declared bases.

**Writing** - `kb_rename` and `kb_folder_create` need the `write` level; `kb_write` and `kb_delete` need the `destructive` level. A tool above the configured level is never registered.

## Notes

One registration serves many bases: the environment declares alias-to-path pairs and every call names its `kb` alias. Paths are validated in two layers, lexical normalisation and a `realpath` check, so a call cannot escape its base or reach a sibling base. Only content under the base's declared Knowledge Islands zones and staging areas is reachable. The access levels nest - `read` (the default), `write` and `destructive` - so a registration given a lower level cannot see the higher tools. Writes and search outcomes are recorded as a local JSONL audit log.

The server enforces path, zone and access safety, not note conventions: frontmatter, routing, tags and links are not validated at write time and are checked by `ki repo audit` instead.
