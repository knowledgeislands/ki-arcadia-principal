# kb-server report — rename kit-mcp-ki-kb-fs to mcp-ki-kb-fs (Decision 127)

## Done

- **chezmoi `main` `9b35667`, pushed:** the server is renamed in `.chezmoidata/mcp-servers.yaml` and `docs/guides/tools/mcporter.md`. No other template or guide named it. Checks: `ki repo audit` reported PASS=19 WARN=2 FAIL=0 (the warnings were already there: ki-principal is not a registered Capital handle); `node --test` passed 210 of 212 with 0 failures and 2 skipped; `rumdl` found nothing.
- **Applied:** `claude_desktop_config.json` (diff was only the rename) and `~/.mcporter/mcporter.json` with `--force` (the rename plus the key reordering it causes). After the apply, both diffs are empty. `~/.codex/config.toml` and `~/.claude.json` do not carry this server and had no diff.
- **mcporter daemon restarted. Smoke test passed:** `mcporter list` shows `mcp-ki-kb-fs` with 8 tools. Its `kb` enum lists all 11 KBs (ki-principal, apps-knowledgeislands.info, er-principal, hnr-principal, hnr-shared, legal-principal, personal-principal, si-principal, tmx-principal, va-principal, apps-vallearmonia.com), and `kb_config kb=ki-principal` returns that KB's zones.
- **Sweep commits, each pushed fast-forward:**
  - hnr-principal `7aa0fd1` changed 16 files: Live Artifact notes and HTML (Email Pulse, Streams Tracker, Council), activity prompts and Integrations.
  - legal-principal `46a97d3c` changed 17 files: `.claude/commands`, `.claude/settings.json` permissions, AGENTS.md, CLAUDE.md, CLAUDE-CODE.md, Admin conventions and policy, Live Artifacts and the Command Centre Guide.
  - personal-principal `bfa59db` changed 9 files: activity prompts and Integrations.
- **No live references elsewhere:** ki-agentic-harness, hnr-agentic-harness, apps-observatory.local, the other `~/workspaces` repositories, `~/.claude` and `~/.codex`.
- **Left as history on purpose:**
  - Dated Calendar notes: 1 in hnr-principal and 4 in personal-principal.
  - The legal `-/_LOGS` Tending log.
  - personal-principal `Mistakes and Lessons`.
  - The incident and rename-history lines in the HNR Email Pulse and Streams Tracker artifact notes. Their HTML code comments now record both earlier names.
- **Other `kit-mcp-*` servers, not renamed:** `kit-mcp-gsuite`, `kit-mcp-housekeeping-claude`, `kit-mcp-housekeeping-chatgpt`, `kit-mcp-acquire-whatsapp` and `kit-mcp-git-audit`.

## Failed

- Nothing failed.

## Needs the owner

- **Restart Claude Desktop.** It must be quit and reopened to pick up the renamed server.
- **Cowork copies still use the old name.** They need a resync, which the later Cowork clean-up thread will do. Copies with the old name:
  - `~/workspaces/claude-desktop/Artifacts`: hnr-email-pulse, hnr-streams-tracker, legal-activity-status, legal-command-centre and legal-hearing-dashboard, including their `versions/`.
  - `~/workspaces/claude-desktop/Scheduled`: hnr-email-route-drift, hnr-email-route-triage, hnr-granola-sync, hnr-scheduled-task-audit, kit-granola-sync, kit-scheduled-task-audit, legal-tend-digest-sweep and legal-tend-housekeeping.
  - Neither folder is a Git repository, so I did not edit them.
- `~/workspaces/chatgpt-codex/Projects/Knowledge Islands` has two dated 2026-09-09 "Blocked Run" notes that name the old server. They are history and were left alone.
- No unrelated drift turned up in the four targets checked.
