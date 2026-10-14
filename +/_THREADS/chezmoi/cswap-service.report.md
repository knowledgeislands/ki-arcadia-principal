# Claude Swap auto-switch service: report

Record: [DOTFILES-UE-081](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-081-claude-swap-auto-switch-service.md), now **Awaiting review**.

Commits (local, not pushed): `4635ba4` reserves DOTFILES-UE-081; `3241b68` adds the record as Ready; `5f8e616` adds the service, tests, guides and review packet.

## Done

- The approved exception is recorded in DOTFILES-UE-081 on UE-075's pattern: Decision 31 quoted word for word, the reason and boundary, and the service declared in Rig.
- Rig service `claude-swap-auto` (`uk.me.kris.rig.claude-swap-auto`) runs `~/.local/bin/cswap auto --strategy consume-first` in loop mode. It restarts if it stops (KeepAlive), starts at login, and logs to `~/Library/Logs/uk.me.kris.rig.claude-swap-auto.log`, which the existing log rotation covers.
- It is in the `core` and `services` profiles, like the other services every machine runs. Claude Swap itself is in `core`.
- There is no start script. Only mcporter needs one, and the loop mode runs fine under launchd.
- The menu-bar option was not used: it needs an extra (`rumps`) that isn't installed, and it would write a plist Rig doesn't own.
- No Claude Swap settings or accounts were changed. The strategy is passed on the command line.
- Updated the catalogue tests and two guides: `ai-multi-account.md` and `operational-resources.md`.
- Checks:
  - Rig dry run with `--target service:claude-swap-auto`: planned=1.
  - Tests: 182 pass, 2 skipped, 0 fail.
  - `rumdl`: clean.
  - `ki repo audit`: FAIL=0, WARN=2, same as before.
  - `rig doctor` on a rendered copy: 1 finding before, 2 after. The new finding is the service showing as `missing` until you apply it. The existing one is the laptop Dock order still waiting from UE-075.
- Nothing was loaded or applied, and the temporary files are deleted.

## Needs Kris

- **Review, then switch it on** (the full steps are in the record's Review section):
  1. `chezmoi diff`, then `chezmoi apply`.
  2. `rig apply --dry-run --scope resources --target service:claude-swap-auto`, then the same command without `--dry-run`.
  3. Check it with `launchctl print "gui/$(id -u)/uk.me.kris.rig.claude-swap-auto"` and by reading the log.
- **Keychain access is still untested**, because the brief ruled out `launchctl`. If the log shows Keychain errors after you switch it on, stop the service.
- **Check against ADR-DOTFILES-007.** The ADR says account switching is not a way around provider limits, and automatic switching near a limit comes close to that line. I left the ADR unchanged because your approval covers this.
- **Accept** DOTFILES-UE-081 when you're happy with it.
