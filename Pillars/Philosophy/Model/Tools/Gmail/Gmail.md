---
note_type: pillars/index
tags:
  - card/note
  - topic/mcp
  - topic/email
  - topic/google
source: claude
status: current - October 2026
---

# Gmail

Gmail is reached through the Google Workspace MCP server, `mcp-gsuite`, which connects Claude to Gmail, Calendar, Drive and Sheets on one shared client, scope set and access gate. Gmail is its deepest surface. The authoritative tool catalogue is the [mcp-gsuite README](https://github.com/knowledgeislands/mcp-gsuite#readme).

## Tools

**Reading** - the `gsuite_email_*` read tools search messages and threads with Gmail query syntax, read full messages and attachments, and list labels, filters, drafts and mailbox history.

**Organisation** - write-level tools add or remove labels, mark messages read or unread, archive, batch-relabel and manage user labels and future-mail filters. Trash is recoverable; permanent deletion is deliberately not exposed.

**Drafting** - draft tools create, update and list drafts, including replies and attachments. No send tool exists: drafts are reviewed and sent by the user in Gmail.

**Other Workspace surfaces** - `gsuite_calendar_*`, `gsuite_drive_*` and Sheets tools share the same gate, with `gsuite_about` and `gsuite_auth_*` as meta tools.

## Notes

Tool registration is gated by access level (`read`, `write` or `destructive`), and the default `read` level cannot mutate anything. Outbound mail always passes through human review.
