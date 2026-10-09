---
note_type: admin/governance/convention
tags:
  - card/note
  - topic/knowledge-islands
status: current - April 2026
author: Written with Claude
memory_file: reference_{ki_prefix}_key_notes.md
---

# Integrations

## Overview

External tools connected to Arcadia. Arcadia's integration surface is minimal - it is a knowledge repository and framework custodian, not an operational system.

Activity prompts reference this note to resolve platform-specific configuration - MCP tool prefixes, inbox paths, service identifiers - rather than hardcoding values. When an integration changes, updating this note is sufficient.

---

## Tools

| Purpose | Tool                                    | MCP Tool Prefix |
| ------- | --------------------------------------- | --------------- |
| Inbox   | `+/` folder - exclude `+/_Voice Notes/` | (filesystem)    |

No external calendar, task, issue, or email integrations are currently configured for Arcadia. Integrations are added here as they are introduced.

GitHub Apps and automated identities acting on `knowledgeislands` repositories, including the `ki-tools-release-bot` release chain, are organisation infrastructure rather than Arcadia integrations and are recorded in [[GitHub Apps]].
