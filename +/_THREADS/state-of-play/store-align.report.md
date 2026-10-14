# store-align report

Authority: state-of-play Decision 50 (Kris, 2026-10-11). Started after `estate-config.status` reached DONE.

## Done

- **Renamed** (`mv -n`, same volume, no target existed; no content copied or deleted), all under `~/Library/CloudStorage/OneDrive-Personal/`: `sources-er-research` → `sources-equal-remedy`, `sources-kit-hnr` → `sources-humans-not-robots`, `sources-kit-legal` → `sources-legal`, `sources-kit-principal` → `sources-personal`, `sources-kit-techmedix` → `sources-techmedix`, `sources-vallearmonia-principal` → `sources-valle-armonia`. Created an empty `sources-knowledge-islands`.
- **Rebound** with `ki repo store unbind sources --write` then `ki repo store bind sources <new> --write` for all six Capitals. Arcadia: added `"sources"` to `store_roles` in `ki-arcadia-principal/.ki.toml` (commit `50689c1`, pushed; repository audit PASS, FAIL=0 with 3 existing STREAM-10 warnings). No `Resources` template was added: only er-research declares one, and the audit does not require it. Then bound it. Verified: `ki repo --repo <capital> store list` shows all seven bound to the new paths. `ki repo --estate store scan` reports UNDECLARED=0 DIAGNOSTICS=0 (exit 0). `registry.toml` holds no old paths.
- **chezmoi** (`4fa0836`, pushed fast-forward): `ki vscode sync --write` regenerated `.chezmoidata/trusted-folders.yaml` and seven `workspaces/vscode/kis-*.code-workspace` files (six renamed paths, plus the new Arcadia store in `kis-ki-arcadia-principal`). Workspace files keep their `kis-<repo>` names. I reviewed `chezmoi diff`: it only added the seven new grants and workspace entries. I then ran `chezmoi apply` on just those ten targets (`~/.claude/settings.json`, `~/.codex/config.toml`, `claude_desktop_config.json`, seven workspaces). Afterwards `chezmoi diff` was empty for them.
- **Old grants removed from live configs by direct edit.** All three are chezmoi-managed through merge-only `modify_` renderers, which by design never revoke a grant (see the header of `trusted-folders.yaml`). So I removed the six old path strings directly from `~/.claude/settings.json` `permissions.additionalDirectories`, `~/.codex/config.toml` `[projects."…"]` tables, and Claude Desktop `preferences.localAgentModeTrustedFolders`. Formatting was preserved, and `chezmoi diff` stays empty.
- **Repository references** (worktrees from fresh `origin/main`, explicit paths, pushed fast-forward):

  | Repository | Commit | Files |
  | --- | --- | --- |
  | kit-hnr | `e81ff6b` | 3 |
  | hnr-shared | `039e855` | 1 |
  | kit-techmedix | `d9b309f` | 48 |
  | vallearmonia-principal | `0894e9e` | 2 |
  | kit-legal | `e0b0707f` | 23 |
  | ki-agentic-harness | `5b14f8cf` | 1 |
  | kit-principal | `83a003d` | 9 |
  | er-research | `cabd779` | 2 |

  All commit hooks passed (rc 0, no `--no-verify`). Primaries fast-forwarded: hnr-shared, kit-techmedix, kit-legal, ki-agentic-harness, kit-principal, er-research and ki-arcadia-principal. vallearmonia-principal's primary was not touched. All `-store` worktrees and `store-align/*` branches have been removed.
- **No old references found** in `~/.claude.json`, `~/.config/` (including ki and MCP configs) or LaunchAgents. No mcporter or launchd change is needed.

## Failed

- None.

## Needs Kris

- **kit-hnr primary not fast-forwarded:** it is ahead of origin by one commit that is not mine (`d81fead docs(checkpoints): record the 11 October source refresh`). Its owner should push or rebase it. It sits on top of `e81ff6b`.
- **Deliberately left with the old names (historical or other threads' records); decide if any should change:**
  - kit-hnr: `+/_CHECKPOINTS/hnr-principal-consolidation.md`, `+/hnr-principal/README.md`, `+/hnr-principal/source-manifest.json`
  - kit-techmedix: `-/TMX-CO-005/Attachment Hash Review.csv`, `-/TMX-CO-005/Attachment Inventory.csv`
  - kit-legal: `+/_RESUME/[P1] FR Techmedix Response.md`, `-/_LOGS/Tending Digest Sweep Activity Log.md`
  - Decision records: vallearmonia-principal `GDR-VA-PRINCIPAL-002`, kit-principal `DDR-KIT-001` (the latter gives an operational path that is now stale)
  - kit-acquire capture `captures/kis/2026-10-10-observatory/source-and-image-manifest.md`
  - No `+/_Voice Notes/` hits.
- **Pre-existing drift left out of the chezmoi commit:** `ki vscode sync` also wanted to add `kis-kit-acquire.code-workspace` and a `kit-acquire` trust entry (chatgpt-codex). Run `ki vscode sync --write` when that is wanted.
- **Old paths still held by apps (not edited):**
  - Claude Desktop `preferences.remoteFolderConsentMemory` and three `remoteChatFolderGrants` sessions still name `sources-kit-legal`. Re-grant the folder in those chats, or let Desktop prune them.
  - The Zed stable workspace DB has one recent-workspace entry with an old path. Reopen it from the new path.
  - Codex session history (~359 files) mentions old names. It is history only.
  - Any open Claude Code, Codex, VS Code or Cowork session that mounted an old folder must be reopened.
  - Unrelated stale grants found in passing: `sources-vallearmonia-website` and `sources-kit-midnight.ninja` in the live Claude, Codex and Desktop configs.
- **tools-ki decision:** `ki repo store create sources` still derives `sources-<repository-basename>` (REPO-OPS spec). `ki repo store scan` likewise only looks for basename-named folders, so it can no longer detect undeclared territory-named stores. Recommend changing both to derive `sources-<territory handle>` (from `territory_prefix`) for Capitals, keeping basename for non-Capitals. This needs a tools-ki work record and your approval.
