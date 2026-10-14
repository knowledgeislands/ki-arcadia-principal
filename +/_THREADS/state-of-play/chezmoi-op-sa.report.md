# chezmoi-op-sa report (Decision 131)

## Done

- **op_cache prefers the Rig service account.** `bin/chezmoi/executable_op_cache` uses `OP_SERVICE_ACCOUNT_TOKEN` or, on macOS, the Keychain item `ki-op-service-account-rig`, for the one `op item get`; if the service account can't read the item, or there's no token, it falls back to the desktop app. The 24-hour aligned cache is unchanged. The token is never echoed, logged or cached. `bin/executable_chezmoi_op` needed no change: its `set` writes, which a read-only account can't do. Five tests were added to `tests/op-cache.test.mjs`, and the two existing tests now stub `security` so they never read the real Keychain.
- **Docs.** ADR-KB-DOTFILES-003 gains the section "Amendment 2026-10-12: service account first". `docs/guides/tools/chezmoi.md` gains a "Service account" section covering Keychain setup, rotation, removal, and that Linux hosts are unchanged.
- **Verified live.** I ran `rm -rf ~/.cache/op-cache`, then `chezmoi diff`. It fetched all 5 items through the service account, with no desktop-app call and no diff. I then ran `chezmoi apply` on the four op_cache targets (mcporter.json, ~/.claude.json, Claude Desktop config, Codex config.toml). It made no `op` calls and `chezmoi status` was clean. No cache file contains the token, and the logging wrapper I used was removed.
- **Gate.** `ki repo audit --repo .` reports PASS=18 WARN=3 FAIL=0. The 3 warnings were already there: no committed pre-commit hook, the territory registry is unavailable, and one more. `node --test tests/*.test.mjs` passed 215 with 0 failures; 2 were skipped, and those skips were already there (rig catalogue migration). `rumdl check .` is clean.
- **Commit** `d2515f5` feat(op-cache): read secrets through the Rig service account. Pushed fast-forward to origin/main.

## Inventory: secrets outside the Rig vault used by automation on this Mac

I searched chezmoi sources and `.chezmoidata`, `~/.config`, `~/.mcporter`, `~/Library/LaunchAgents` (including plist EnvironmentVariables), `~/bin`, `~/.local/state/ki`, tools-rig, tools-ki, tools-techne, tools-mgit, tools-git-almanac, all `mcp-*` repositories, the agentic harnesses, ki-techne-harness, and every `*-principal` (Activities, Admin, Live Artifacts, Streams). The search covered `op://`, `op read`, `op item get`, `op run`, `op inject`, `onepasswordRead`/`ItemFields`, `execFile('op')` and the 1Password SDK.

**Result: none.** Every live reference already points at the Rig vault:

| Reference | Vault | Item title | Used by | Unattended? |
| --- | --- | --- | --- | --- |
| `.chezmoidata/mcp-servers.yaml` (ID form) | Rig | project-rend | chezmoi render → MCP configs | render-time only |
| same (ID, 2 refs) | Rig | HNR M365 Client Id & Secret | mcp-m365 via MCP configs | render-time only |
| same (ID, 2 refs) | Rig | Personal GSuite Client Id & Secret | mcp-gsuite | render-time only |
| same (ID) | Rig | Notion Access Token | Notion MCP | render-time only |
| same (ID) | Rig | mcp-acquire-whatsapp | WhatsApp MCP and the launchd spool refresh, which reads the rendered mcporter.json | launchd job (indirect) |
| mcp-acquire-whatsapp operator guide (name form) | Rig | mcp-acquire-whatsapp | manual operator command | no |
| ki-principal "GitHub Apps" convention (name form) | Rig | ki-tools-release-bot private key | manual secret rotation | no |
| ki-binding-chatgpt `render-codex.ts` | refs from mcp-servers.yaml (Rig) | as above | Codex render | render-time only |

The only non-Rig references are documentation examples in `docs/guides/tools/chezmoi.md`: `op://Personal/GitHub PAT/credential` and `onepasswordItemFields "AWS Root" "Personal"`. They are illustrations, not used. Historical Calendar session notes and legal evidence text mention 1Password but aren't automation.

**Items to move to Rig: none needed. ID references to update after a move: none.**

## Needs Kris

- **The Rig vault holds more than automation needs.** The service account, and so every agent holding the token, can read all 47 items in Rig, including non-automation ones such as device items (MacBook Pro 16", 14" M3, Mac Studio (sol), iPad, iPhone 16 Pro), Wi-Fi (Matt's), licences (Alfred, Hazel, Little Snitch, iStat Menus 6, Beyond Compare, Dash), Spaceship, NordLocker, OpenAI, GitHub, Linear API Key, Telegram Kitteth Bot, Claude Kitteth API Key. Recommendation: move the items no automation reads out of Rig, so the token's reach matches its job. None of the five ID references in `.chezmoidata/mcp-servers.yaml` would need changing, because those items stay. Related: [KB-DOTFILES-UE-077](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-077-reorganise-1password-vaults-safely.md).
- **Optional follow-up.** `bin/scheduled/executable_rig-acquire-whatsapp-spool-refresh` says a launchd job can't resolve `op://` at run time. With the Keychain token that's no longer true, but its current approach (reading the rendered mcporter.json) still works. Change it only if you want run-time resolution.
- **Other Macs.** Each other Mac (e.g. `sol`) needs the one-off `security add-generic-password -U -s ki-op-service-account-rig -a "$USER" -w` step from the guide. Until then it falls back to the desktop app, as before.
