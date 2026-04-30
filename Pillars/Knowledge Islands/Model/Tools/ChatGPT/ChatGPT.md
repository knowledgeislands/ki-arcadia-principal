---
tags:
  - card/note
  - topic/ai
  - topic/productivity
  - topic/knowledge-management
  - source/claude
status: draft - April 2026
author: Written with Claude
---

# ChatGPT

## Overview

This note documents how ChatGPT integrates with the island - primarily as a query and drafting tool, using the island as persistent context loaded into a custom GPT or Project. The integration is read-heavy: ChatGPT draws on island content to inform responses, with outputs routed back into the island as new or updated notes via manual review.

---

## How It Works

The integration relies on island content being made available as context:

- **Custom GPT / Project instructions** - key context files (structure, conventions, routing rules) are loaded into the system prompt or attached as knowledge files, giving ChatGPT an understanding of the domain and working practices
- **Manual routing** - outputs from ChatGPT sessions that contain reusable knowledge are reviewed and written into the island following the standard [[Notes]] and routing rules in [[Structure]]

---

## Scope and Limitations

Unlike the [[Claude]] integration, ChatGPT does not have direct file access to the island. The integration is therefore:

- **Read** - island content informs ChatGPT responses via loaded context
- **Write** - only through manual extraction and routing; no automated note writing
