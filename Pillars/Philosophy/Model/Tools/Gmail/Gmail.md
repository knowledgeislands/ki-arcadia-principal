---
tags:
  - card/note
  - topic/mcp
  - topic/email
  - topic/google
source: claude
status: current - June 2026
---

# Gmail

MCP server that connects Claude to Gmail via the Google Gmail API. Source: `mcp-gmail` (Knowledge Islands workspace).

## Tools

**Reading**

`gmail_search_threads` — search threads using Gmail query syntax. `gmail_get_thread` — read a full thread by ID. `gmail_list_labels` — list all labels in the mailbox.

**Organisation**

`gmail_label_message`, `gmail_unlabel_message` — add or remove labels. `gmail_apply_sensitive_message_label` — apply TRASH or SPAM to a message or thread.

**Drafting** (never sends)

`gmail_create_draft` — create a draft reply or new message. No send tool is exposed; drafts must be reviewed and sent by the user in Gmail.

## Notes

Destructive operations (trash, spam) require elevated access level. No send capability is exposed by design — outbound mail always passes through human review.
