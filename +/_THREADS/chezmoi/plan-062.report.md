# DOTFILES-UE-062 planning report

Record: [/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-062-measure-the-live-apply.md](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-062-measure-the-live-apply.md)

## Done

- DOTFILES-UE-062 released from Hold into Now under Decision 28 and planned to Ready as an attended runbook: prepare, baseline, resource apply, full apply, record, with expected prompts, a port 3100 watch command, rollback and the evidence folder. Commit `75eb658` (local, not pushed).
- What the read-only checks found: the `failed=5` no longer appears in Rig's apply history (all 145 targets exit 0; a tools apply on 2026-10-04 succeeded). All ten launchd agents are loaded. `rig doctor` reports `findings=0` and `rig status --problems` reports 0 of 225. Port 3100 is listening. `chezmoi-status-partial` shows 271 of 275 targets in sync; the other four need 1Password.
- The risk that remains: a resource apply restarts every launchd service, even healthy ones. That covers Paperclip, the mcporter daemon and bridge, and Observatory. This path has never been watched since the RIG-CORE-031 fix.
- DOTFILES-UE-075 overlap: it relabels the profiles but keeps the laptop's selection unchanged. 062 should not wait for it and should run first, because it gives 075 a clean baseline. 062 must not run between 075's source edits and its laptop `chezmoi apply`; the baseline `chezmoi diff` step catches this.
- Checks: `ki repo audit --repo .` FAIL=0, WARN=2 (both already there: no committed pre-commit hook, and territory registry unavailable). `node --test tests/*.test.mjs` 174 passed, 0 failed, 2 skipped. `rumdl check .` clean.

## Needs Kris

- **Session length:** about 90 minutes. That is 15 for preparation and baseline, 10 for the resource apply, up to 60 for the full apply (mostly unattended Homebrew; the last tools apply took 78 minutes) and 10 to record.
- **Before you start:**
  - Laptop on mains and network.
  - Stop every Claude Code, Codex and `ki agent` session; their MCP tools drop when mcporter restarts.
  - Have the admin password or Touch ID ready for Homebrew `sudo` prompts.
  - Unlock 1Password for `chezmoi diff`.
- **What you will see:**
  - The Dock restarts.
  - macOS may show "Background Items Added" notifications.
  - Port 3100 will drop briefly twice.
  - A cask reinstall may ask for a password.
  - No App Store sign-in is expected.
- **Not this record, but worth a look:**
  - This morning's `rig upgrade` failed on `tailscale` (`exit:1`) and listed nine casks as interactive-required.
  - The WhatsApp spool-refresh job keeps exiting 1 because its count summary is unavailable. That is DOTFILES-UE-035's hold condition.
- **Decision 28 was taken as approval** to release this record from Hold and mark it Ready. If you meant planning only, set it back to `draft`.
