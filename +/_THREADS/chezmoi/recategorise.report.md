# recategorise: 1Password items moved to the right category

**Done**

- **Recreated 9 items as API Credential in Rig**, keeping the same titles. Each copied value was checked against the original by hash and matches. No value was printed or stored. The items are Claude Kitteth API Key, HNR M365 Client Id & Secret, Linear API Key, mcp-acquire-whatsapp, Notion Access Token, Personal GSuite Client Id & Secret, project-rend, Telegram Kitteth Bot and Telegram Valle Armonia Bot.
  - The main secret is now in the `credential` field. `username` and any extra fields (the five `TELEGRAM_*` and `GITHUB_APP_*` fields on Valle Armonia) keep their labels.
  - The `^recategorise` tag is gone. No item had other tags or notes. Web addresses were carried across.
- **Wi-Fi (Matt's) was not recreated.** Its network name and password match the Wireless Router item that already exists in Rig. Its `admin` field also equals that password. I archived the Login copy in Personal - Kris.
- **chezmoi was repointed and committed** in `13fbb71 fix(mcp): repoint 1Password references to recategorised API Credential items`. That commit changes 7 references in `.chezmoidata/mcp-servers.yaml`, covering HNR M365, Personal GSuite, Notion, mcp-acquire-whatsapp and project-rend. Each now points at the new item ID and the `credential` field.
  - I refreshed the cache for the new IDs and expired the old ones.
  - `chezmoi status` and `chezmoi diff --exclude scripts` produce byte-identical output before and after, so no value changed.
- **All 10 originals were archived** with `op item delete --archive`. Nothing was permanently deleted. 1Password reports each one as archived.
- **Checks:**
  - `ki repo audit` passes with 2 warnings, both about another repository's registry.
  - `rumdl check` is clean.
  - Node tests: 203 of 204 passed on the first run. The one failure was caused by my session's strict file-permission setting. It passes when re-run normally (20 of 20).
- **Records:** every change is in [vault-apply.log.md](/Users/krisbrown/.local/state/ki/agents/chezmoi/vault-apply.log.md). The before and after metadata is in [recategorise.detail.md](/Users/krisbrown/.local/state/ki/agents/chezmoi/recategorise.detail.md) (mode 600, no values).
- 1Password asked for approval once. The temporary files that held values have been deleted, and nothing was pushed.

**Failed**

- Nothing.

**Needs Kris**

1. **One reference outside chezmoi, not edited:** `mcp-acquire-whatsapp/docs/guides/operator/operating-the-server.md:68` reads `op://Personal/mcp-acquire-whatsapp/auth-key`. It names the vault and field by name, and both are now wrong: the item is in Rig, and the field is now called `credential`. It was already broken before this run, because the item was never in `Personal`. It should read `op://Rig/mcp-acquire-whatsapp/credential`.
2. **Telegram Valle Armonia Bot:** its secrets are in five custom fields stored as plain text, not concealed. I kept them as they were and left `credential` empty, because there is no single main secret. You may want to mark those fields concealed in the app.
3. No other references to the old IDs or titles were found in `~/.config`, `~/bin`, `~/.local/bin` or the workspace repositories.
