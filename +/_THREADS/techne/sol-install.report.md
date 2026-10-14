# sol-install report — 2026-10-08 17:03 CEST

Authority: Decision 16 in `decisions.md`. Remote calls were limited to SSH to `krisbrown@100.90.130.74` and the downloads Homebrew made on `sol`. No sudo, `chezmoi apply`, `rig apply`, `chezmoi init` or `ki bootstrap` was run, and no Tailscale or system setting was touched. No commits.

## Done

- **Survey (read-only):** `sol.local`, macOS 26.5.2, Homebrew 7.0.8. It has 8 taps, the same set as this Mac. `knowledgeislands/tap` and the other 7 taps are **untrusted** on `sol`, while on this Mac `knowledgeislands/tap` is trusted. `op` 2.38.1 and `/Applications/1Password.app` are present. chezmoi is initialised, with its source at `~/.local/share/chezmoi`, a clean `main` at `d152e10`, and `chezmoi.yaml` plus state db present. `mas` and `~/bin/chezmoi-status-partial` are missing.
- **Installs:** The brief said `ki` and `mgit` were not installed, but both were, at old versions.
  - `rig` was newly installed at 0.4.0.
  - `mgit` was upgraded from 0.8.1 to 0.16.0.
  - `ki` was reinstalled at 0.9.0. Its old keg was labelled version "64" but reported 0.2.13, and Homebrew ranked "64" above 0.9.0, so `brew upgrade` skipped it.
  - None of the three asked for a password or sudo. Homebrew installed from the untrusted tap and only printed a tap-trust warning.
- **Verify:** On `sol`, `ki --version` gives 0.9.0, `rig --version` gives rig 0.4.0 and `mgit --version` gives mgit 0.16.0. SSH still worked at the end. Temporary files in `/tmp` were removed.
- **`rig status`, read-only, profile `default`:** 59 of 225 entries need attention (tools 40, skills 2, resources 15, ports 2).
  - **23 tools missing:** beyond-compare, codexbar, daisydisk, displaylink, dockutil, ghostty, git-almanac, gitbutler, gitup, insta360-studio, launchcontrol, mas, nordvpn, obscura, obsidian, ollama, onedrive, processspy, rumdl, slack, ticktick, wifi-explorer, zoom.
  - **9 unavailable**, including actions, amazon-kindle and apple-configurator.
  - **Services and resources:** 6 scheduled jobs (rig-update, rotate-logs, workstation-health, good-morning and 2 refresh jobs) are not installed or are unhealthy, and the mcporter daemon and bridge are not running.
  - **macOS defaults:** 4 are not at the declared value: dock minimise effect and target, dock tile size, and Finder view style.
- **`chezmoi diff` preview (summary only, no contents read).** It was scoped with `--recursive=false` and left out the four targets that hold 1Password secrets (`.claude.json`, Claude Desktop config, `.mcporter/mcporter.json`, `.codex/config.toml`). It covered 324 targets and found 172 files with changes, about 17.1k changed lines.
  - **`workspaces/`:** 60 to add, 28 to delete, 2 delete-then-add, 1 modified. These are mostly VS Code workspace files.
  - **`bin/`:** 28 to add, 18 to delete, 2 modified. This includes the missing `chezmoi-status-partial` and `op_cache` helpers.
  - **Shell:** `.zsh/` has 23 to add, 9 to delete and 3 modified. `.zprofile.d/` has 4 to add, and `.zshrc` and `.zprofile` are modified.
  - **`.ssh/config` is modified.** This is the client config on `sol`, not `sshd`, so it should not affect inbound SSH, but review it.
  - **Other:** VS Code user settings are modified, `.paperclip/` has 3 to add, and 2 run scripts (`patch_codexbar_config.sh`, `patch_claude_code_hooks.mjs`) would run.
  - chezmoi warns that the config file template has changed and asks for `chezmoi init`.

## Failed

- **`rig apply --dry-run` failed in preflight (exit 2):** `provider 'homebrew' executable is unavailable: mas`. There is no full Rig plan until `mas` is installed.
- **Full `chezmoi status` and `chezmoi diff` cannot render the 1Password-backed MCP template.** The template needs `~/bin/chezmoi/op_cache`, which is missing on `sol`, and an unlocked 1Password, so those four targets were not previewed.

## Needs Kris

1. **SSH-with-password:** Decide whether to trust the tap: `brew trust --tap knowledgeislands/tap`. It is trusted on this Mac; review the other 7 untrusted taps separately. No sudo is needed and it needs no password; it is listed here because tap trust is a supply-chain decision.
2. **SSH-with-password:** Run `brew install mas`, then `rig apply --dry-run` to get the full Rig plan. `mas` itself needs no sudo; it was outside this brief.
3. **Screen Sharing:** Unlock the 1Password app and enable CLI integration so `op` works on `sol`. This needs a GUI prompt.
4. **Screen Sharing:** Run `chezmoi init` to regenerate the config. It may prompt for values. Then review the full `chezmoi diff`, especially `.ssh/config`, the 28 `workspaces/` and 18 `bin/` deletions, and the two run scripts. After that, run `chezmoi apply`. Its run scripts and secret templates may raise 1Password and macOS prompts.
5. **Screen Sharing:** Run `rig apply` after reviewing the dry run. Cask installs (slack, zoom, obsidian, displaylink, onedrive and others) may ask for an admin password or macOS approval. The Mac App Store must be signed in.
6. **Screen Sharing:** Run `ki bootstrap`, then `ki doctor`, once 1Password and chezmoi are in place.
7. Optional, Screen Sharing: Homebrew warns that a newer Command Line Tools release is available. Updating needs Software Update or sudo.
