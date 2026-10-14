# kit-servers report: rename the remaining kit-mcp-* servers (Decision 128)

## Done

- **Final names and reasons:**
  - `kit-mcp-gsuite` → `kb-mcp-gsuite`. It binds one Google OAuth token store, authorised for the personal account that the Kit Week At A Glance artifact and the personal KB use.
  - `kit-mcp-acquire-whatsapp` → `kb-mcp-acquire-whatsapp`. It binds the personal WhatsApp linked device: the auth key and the account scope `kit-personal`.
  - `kit-mcp-housekeeping-claude` → `mcp-housekeeping-claude`. It reads this machine's Claude state and binds no account or credentials. Its path setting is only where it writes reports.
  - `kit-mcp-housekeeping-chatgpt` → `mcp-housekeeping-chatgpt`. It reads this machine's ChatGPT and Codex state and binds no account or credentials.
  - `kit-mcp-git-audit` → `mcp-git-audit`. It covers the whole estate and binds no credentials.
- **chezmoi `8d92702`, pushed:** `.chezmoidata/mcp-servers.yaml`, `docs/guides/tools/mcporter.md` and the WhatsApp spool-refresh wrapper's default server. The Codex fragment binding only adds tables, so it would have left the old `kit-mcp-housekeeping-chatgpt` table in place. It now removes that stale table, following the existing precedent for retiring stale entries. Checks: `ki repo audit` PASS=19 WARN=2 FAIL=0 (the warnings were already there); `node --test` 210 passed, 0 failed, 2 skipped; `rumdl` clean.
- **Applied:** `~/.codex/config.toml`, `~/.mcporter/mcporter.json` (with `--force`), `claude_desktop_config.json` and `~/bin/scheduled/rig-acquire-whatsapp-spool-refresh`. Each diff was only the renames plus key reordering. All four are now clean, and no live config contains `kit-mcp-*` for these servers.
- **mcporter daemon restarted. Smoke test passed for all five:**
  - `kb-mcp-gsuite`: 46 tools; `gsuite_auth_status` reports authenticated.
  - `mcp-housekeeping-claude`: 27 tools; `claude_desktop_plugins_inventory` works.
  - `mcp-housekeeping-chatgpt`: 8 tools; `chatgpt_sessions_discover` works.
  - `kb-mcp-acquire-whatsapp`: 19 tools; `whatsapp_acquisition_status` reports it is configured and disconnected.
  - `mcp-git-audit`: 13 tools; `git_repo_detail` works.
- **Server repositories, pushed fast-forward.** Changes: the `ki:generate:client` server ID, and the generated client/types where present.
  - mcp-gsuite `78737c4`
  - mcp-housekeeping-claude `110c9fc`
  - mcp-housekeeping-chatgpt `408b804`
  - mcp-acquire-whatsapp `822b01e` (also its two operator guides)
  - mcp-git-audit `54ce6c5`

  No package or bin name used `kit-`, so none was renamed. Gate in each repository: `tsc --noEmit`, `bun run test`, `test:coverage` and `build` all passed (608, 357, 77, 832 and 247 tests). `ki repo audit` showed FAIL=0 everywhere except mcp-housekeeping-chatgpt (see Failed).
- **Sweep, pushed fast-forward:**
  - apps-observatory.local `12a0075`: the default git-audit server and its tests. Typecheck, tests (1124 passed), build and audit (FAIL=0) all passed.
  - personal-principal `f161cc8`: the Kit Git Repo Audit live-artifact note and HTML.
  - legal-principal `45aa6a4f`: the `.claude/settings.json` git-audit permissions and LGL-PRINCIPAL-EVD-001.
  - apps-tower.midnight.ninja `3a200a0`: the self-tower-game Sheets reference.
- **Left alone as history:**
  - The 2026-07-30 session note and Mistakes and Lessons in personal-principal.
  - The legal-principal `-/_LOGS`.
  - ADR-KI-MCP-WA-005.
  - The mcp-gsuite recorded fixture, a captured transcript.
  - KB-DOTFILES-UE-077's incident note.
  - Codex archived sessions and app state.
- **Not in scope and left in place:** the WhatsApp spool account scope ID `kit-personal` is a data identifier, not a server ID; changing it would re-key the spool. `kit-mcp-gmail` (a retired server) remains in legal-principal `.claude/settings.json` and chezmoi `.chezmoiignore`.

## Failed

- None. `ki repo audit` on mcp-housekeeping-chatgpt reports FAIL=4 with or without this change. The failures are `"private": true` in package.json (PKG-1), and no topics and secret scanning off on GitHub (TOPICS-1, SEC-1). Fixing them needs a package-posture or GitHub policy decision, so I did not touch them.

## Needs Kris

- **Restart the Observatory service** (`uk.me.kris.rig.observatory`). It is still running the old default server ID, so its git-audit evidence fails until it restarts. I made no service change.
- **Update two Claude Desktop artifacts, which are not in Git:** `~/workspaces/claude-desktop/Artifacts/kit-git-repo-tracker` (`mcp__kit-mcp-git-audit__*`) and `kit-week-at-a-glance` (`kit-mcp-gsuite`). Neither was edited or deployed.
- **Decide** on mcp-housekeeping-chatgpt's existing audit failures, and whether to remove the stale `kit-mcp-gmail` permissions.
