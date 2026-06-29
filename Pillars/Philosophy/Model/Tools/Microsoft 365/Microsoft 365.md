---
tags:
  - card/note
  - topic/productivity
  - topic/mcp
  - topic/microsoft-365
  - topic/knowledge-islands
source: claude
status: current - June 2026
---

# Microsoft 365

Microsoft 365 integration via the Knowledge Islands `mcp-m365` server — a bespoke MCP built and maintained in this workspace, published as
`@knowledgeislands/mcp-m365`. It provides full Outlook (email, calendar, folders, rules) and OneDrive coverage via Microsoft Graph, with
standalone OAuth 2.0 handling.

## Tools

**Auth and meta**

| Tool               | Purpose                                                                |
| ------------------ | ---------------------------------------------------------------------- |
| `m365_about`       | Returns server info                                                    |
| `m365_auth_start`  | Initiates the OAuth flow; persists tokens to `~/.mcp-m365-tokens.json` |
| `m365_auth_status` | Checks auth status — presence and scope/expiry metadata only           |

**Email**

| Tool                           | Purpose                                                 |
| ------------------------------ | ------------------------------------------------------- |
| `m365_email_messages_list`     | List recent emails from inbox or a folder               |
| `m365_email_messages_search`   | Search by query and/or date range                       |
| `m365_email_message_get`       | Read email content                                      |
| `m365_email_message_send`      | Send a new email                                        |
| `m365_email_draft_create`      | Save an email draft                                     |
| `m365_email_message_mark_read` | Mark email as read/unread                               |
| `m365_email_message_delete`    | Move to Deleted Items (or hard delete with `permanent`) |
| `m365_email_messages_move`     | Move emails between folders                             |

**Calendar**

| Tool                          | Purpose               |
| ----------------------------- | --------------------- |
| `m365_calendar_events_list`   | List calendar events  |
| `m365_calendar_event_create`  | Create an event       |
| `m365_calendar_event_accept`  | Accept an invitation  |
| `m365_calendar_event_decline` | Decline an invitation |
| `m365_calendar_event_cancel`  | Cancel an event       |
| `m365_calendar_event_delete`  | Delete an event       |

**Folder management**

| Tool                       | Purpose                   |
| -------------------------- | ------------------------- |
| `m365_email_folders_list`  | List mail folders         |
| `m365_email_folder_create` | Create a mail folder      |
| `m365_email_folder_rename` | Rename an existing folder |
| `m365_email_folder_delete` | Delete a folder           |

**Inbox rules**

| Tool                       | Purpose                      |
| -------------------------- | ---------------------------- |
| `m365_email_rules_list`    | List inbox rules             |
| `m365_email_rule_create`   | Create an inbox rule         |
| `m365_email_rules_reorder` | Reorder rule execution order |

**OneDrive**

| Tool                              | Purpose                  |
| --------------------------------- | ------------------------ |
| `m365_onedrive_items_list`        | List files at a path     |
| `m365_onedrive_items_search`      | Search files by query    |
| `m365_onedrive_item_download`     | Get a download URL       |
| `m365_onedrive_item_upload`       | Upload a file under 4 MB |
| `m365_onedrive_item_upload_large` | Chunked upload over 4 MB |
| `m365_onedrive_item_share`        | Create a sharing link    |
| `m365_onedrive_folder_create`     | Create a folder          |
| `m365_onedrive_item_delete`       | Delete a file or folder  |

## Setup

Requires an Azure App Registration with the relevant Microsoft Graph scopes.

1. Register an app in Azure Portal; add `http://localhost:3333/auth/callback` as a redirect URI.
2. Set `MCP_M365_CLIENT_ID` and `MCP_M365_CLIENT_SECRET` in the MCP environment (or `.env.development`).
3. Run the auth server: `bun run ki:server:auth:dev` (listens on `localhost:3333`).
4. Call `m365_auth_start` in Claude — it returns a URL; open it, sign in, and grant consent. Tokens are cached at `~/.mcp-m365-tokens.json`
   and refreshed transparently.

Connection details live in [[Integrations]].
