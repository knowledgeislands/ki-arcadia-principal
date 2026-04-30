---
tags:
  - card/note
  - topic/productivity
  - topic/mcp
  - topic/microsoft-365
  - source/claude
status: current - April 2026
author: Written with Claude
---

# Microsoft 365

## Overview

MCP server that connects Claude to Microsoft 365 services via the Microsoft Graph API and Power Automate API. Covers Outlook (email and calendar), OneDrive, and Power Automate flows.

Source: [ryaker/outlook-mcp][outlook-mcp]

---

## Tools

**Email & Calendar** — `list-emails`, `search-emails`, `read-email`, `send-email`, `mark-as-read`, `list-events`, `create-event`, `accept-event`, `decline-event`, `delete-event`

**Folder Management** — `list-folders`, `create-folder`, `move-emails`

**Rules** — `list-rules`, `create-rule`

**OneDrive** — `onedrive-list`, `onedrive-search`, `onedrive-download`, `onedrive-upload`, `onedrive-upload-large`, `onedrive-share`, `onedrive-create-folder`, `onedrive-delete`

**Power Automate** — `flow-list-environments`, `flow-list`, `flow-run`, `flow-list-runs`, `flow-toggle`

---

## Setup

**Requirements**: Node.js 14.0+, Azure account

1. Clone the repo and run `npm install`
2. Register an app in the Azure Portal (navigate via _More services_ → _App Registrations_) with redirect URI `http://localhost:3333/auth/callback`
3. Configure Claude Desktop — pass credentials as env vars in the MCP server entry (no `.env` file needed):
   - `OUTLOOK_CLIENT_ID`
   - `OUTLOOK_CLIENT_SECRET`
   - `OUTLOOK_TENANT_ID` — find this in Azure Portal → Microsoft Entra ID → Overview → Basic information
   - `USE_TEST_MODE` — set to `"false"` for production
4. Run `npm run auth-server` in a terminal — this starts a local OAuth callback listener on port 3333
5. In Claude (with the MCP now connected), ask it to authenticate with Microsoft 365 — Claude calls the `authenticate` tool, which returns a Microsoft OAuth URL
6. Open the URL in a browser, sign in, and you'll be redirected to `localhost:3333/auth/callback` — tokens are saved automatically to `~/.outlook-mcp-tokens.json`

**Re-authentication**: if tokens expire, delete `~/.outlook-mcp-tokens.json` and repeat steps 5–7. If port 3333 is busy: `npx kill-port 3333`

---

## Notes

- **Azure Portal — App Registrations**: Not visible in the default services list; click _More services_ to find it
- **Finding your Tenant ID**: Go to `portal.azure.com` → it lands on the Microsoft Entra ID Overview page directly (or navigate via _More services_ → _Microsoft Entra ID_ → _Overview_) — Tenant ID is listed under Basic information; add it to the Claude Desktop MCP config as `OUTLOOK_TENANT_ID`
- **Homeshick / dotfiles**: Claude Desktop uses atomic writes and will replace the `claude_desktop_config.json` symlink with a real file — re-symlink after any config change: `homeshick symlink <castle>`

[outlook-mcp]: https://github.com/ryaker/outlook-mcp
