# prep-062b report: scoped DOTFILES-UE-062 apply script

## Done

- Script ready: `~/.local/state/ki/agents/chezmoi/apply-062/run-062.sh` (executable). The earlier prep-062 run left nothing behind, so this one started from scratch.
- Dry mode passed: `DRY=1` exited 0 and its output is in `apply-062/dry.log`. The `laptop` profile resolved. There are 44 resource targets and 210 targets for the full apply. The scoped plan reads `planned=190 failed=0 skipped=20`, which is the 203 planned entries minus the 13 excluded ones. Nothing excluded comes back in as a dependency, and no skills are included.
- Checks: `bash -n` passed and `shellcheck` is clean. For the record edit, `rumdl` is clean and `ki repo audit` returned PASS=19 WARN=2 FAIL=0. Both warnings were already there and are not from this change.
- Commit `0036636`: adds a "Scoped run, 2026-10-09" note to [DOTFILES-UE-062](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-062-measure-the-live-apply.md). It records the exclusions and what they leave unmeasured.
- Nothing on the machine was changed: no `chezmoi apply`, no real `rig apply` and no `launchctl` changes.

## Command for Kris

First stop or let finish any session you don't want to lose. Then run this in your own terminal:

```sh
bash ~/.local/state/ki/agents/chezmoi/apply-062/run-062.sh
```

Allow about 90 minutes. Homebrew may ask for your password during the full apply. The script stops before the full apply if the resource apply does not end with `failed=0`, or if port 3100 has not answered within 90 seconds. Evidence and `run.log` go into the same folder. The last line of `run.log` is the one-line summary.

## Excluded

- **chezmoi:** `~/.claude`, `~/.claude.json`, `~/.codex`, `~/.mcporter`, `~/bin/launchd/mcporter_*` and `~/bin/mcporter-*` (19 entries). Two scripts are also left out: `run_onchange_after_patch_claude_code_hooks.mjs` and `run_onchange_after_patch_codexbar_config.sh`, because they patch Claude Code and CodexBar. chezmoi's `--exclude` only filters by entry type, not by path. So the script names each of the other 258 entries explicitly and passes `--recursive=false`.
- **Rig tools:** `claude`, `claude-code`, `codex`, `codexbar`, `codex-multi-auth`, `claude-swap`, `mcporter`, `skills-cli`.
- **Rig services:** `mcporter-daemon`, `mcporter-http-bridge`, `claude-swap-auto`.
- **Rig skills:** all of them (`archify`, `caveman`).
- Paperclip stays in.
- Target forms used: bare ids for tools, and `service:`, `scheduled-job:`, `setting:` and `dock:` prefixes for resources. In the `laptop` profile the Dock is still `dock:workstation`.

## Needs Kris

- Run the command above when you are ready.
- Running chezmoi prints "config file template has changed, run chezmoi init". The run still works with it. Running `chezmoi init` later is your call.
- Because the targets are listed explicitly, stale resources are not retired, and the mcporter stall (DOTFILES-UE-065) is not tested. The record notes both.
