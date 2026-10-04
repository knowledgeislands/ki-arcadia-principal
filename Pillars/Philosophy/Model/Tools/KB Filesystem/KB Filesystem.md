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

**Reading** - `kb_list` lists notes and folders and `kb_read` reads a note; `kb_config` reports the declared bases.

**Writing** - `kb_write`, `kb_rename`, `kb_folder_create` and `kb_delete` change content and are registered only when the access level permits.

## Notes

One registration serves many bases: the environment declares alias-to-path pairs and every call names its `kb` alias. Paths are validated in two layers, lexical normalisation and a `realpath` check, so a call cannot escape its base or reach a sibling base. Only content under the base's declared Knowledge Islands zones and staging areas is reachable. The access level defaults to `read`.
