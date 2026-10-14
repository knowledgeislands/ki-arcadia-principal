# no-connectors report (2026-10-11)

Authority: state-of-play Decision 52.

## Done

- Added `disableClaudeAiConnectors: true` (with comment) to `.chezmoidata/claude.yaml`, added the key to `CLAUDE_CODE_CORE_KEYS` in `bin/chezmoi/executable_json`, and extended the settings-fragment test in `tests/chezmoi-json.test.mjs` to replace an existing `false` with `true`. The modify template passes the whole `claude:` map, so it needed no change.
- Checks: `node --test tests/chezmoi-json.test.mjs` 5/5 pass; full suite 212 tests, 210 pass, 0 fail, 2 skipped; `ki repo audit --repo .` PASS=19 WARN=2 FAIL=0 (both warnings are existing ones in ki-agentic-harness: no committed pre-commit hook, and an unregistered territory handle); `rumdl check .` clean.
- `chezmoi diff ~/.claude/settings.json` showed only the new key. Applied that file alone; `jq .disableClaudeAiConnectors ~/.claude/settings.json` returns `true`, and a second diff is empty.
- Commit `6c32b8c` `feat(claude): disable claude.ai connector loading in Claude Code`, staged by explicit path, pushed fast-forward to `origin/main` (4fa0836..6c32b8c). The unrelated `workspaces/kit/personal/dot_mgit.toml` change was left uncommitted. No git lock files remain.
- Override check, with no changes made. Nothing on this machine re-enables connectors:
  - No managed settings: no `/Library/Application Support/ClaudeCode/`, `/etc/claude-code`, `~/.claude/managed-settings.json` or `com.anthropic.claudecode` defaults domain.
  - `~/.claude/settings.local.json` does not exist, and `~/.claude.json` contains neither key.
  - `ENABLE_CLAUDEAI_MCP_SERVERS` is not set in the shell environment, launchd (`launchctl getenv`), zsh startup files, or `env` in `settings.json`.
  - None of the 43 project `.claude/settings*.json` files under `~/workspaces` or the chezmoi source mention `disableClaudeAiConnectors` or `ENABLE_CLAUDEAI_MCP_SERVERS`.

## Failed

- Nothing.

## Needs Kris

- Restart any open Claude Code sessions. The setting is read only at startup, and this run's own session still loaded the connectors.
- The Mac Studio needs `git pull` in `~/.local/share/chezmoi`, then `chezmoi apply ~/.claude/settings.json` or a full `chezmoi apply`. Review the diff there first.
- Not checked: managed or organisation policy on claude.ai itself, which is off-machine, and any repository outside `~/workspaces` and the chezmoi source.
