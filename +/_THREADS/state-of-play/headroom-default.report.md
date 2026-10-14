# Headroom default profile removal

Authority: Decision 153.

## Done

- Removed Headroom's crash-looping `default` profile. `headroom install remove --profile default` booted out `com.headroom.default` and deleted its plist. It then stopped short because `init-user` still answers on the shared health URL, so I deleted `~/.headroom/deploy/default/` by hand, including the roughly 110 MB `runner.log`. The backups of the plist, both manifests and the scripts are in `backups/headroom-default/`.
- `init-user` is still healthy on `127.0.0.1:8787` (PID 6462, `headroom install status` shows it running and healthy), and Claude Code requests are still being saved through it.
- Nothing in chezmoi or Rig recreates `default`. The Claude Code hooks pin `--profile init-user`, and Rig only installs the CLI and reserves the port.
- Updated the Headroom guide and [KB-DOTFILES-UE-087](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-087-manage-headroom-profile-arguments.md), which is now narrowed to declaring `init-user`'s arguments. Commit `09efbfd` is pushed fast-forward to `krisb/dotfiles` `main`.
- Checks: `ki repo audit` passed with 0 FAIL and 3 WARN that were already there; `node --test` passed 215, failed 0, with 2 not run; `rumdl check .` was clean.
