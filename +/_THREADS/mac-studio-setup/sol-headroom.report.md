# sol-headroom - why Claude Code on sol gets ECONNREFUSED - resting

Run under thread `mac-studio-bootstrap`, read-only, 2026-10-14.

## Workaround first

Claude Code on sol is being sent to the Headroom proxy at `127.0.0.1:8787`, and there is no proxy running there. Do one of the following at sol.

**Fastest: run Claude without Headroom, in this terminal only:**

```sh
env -u ANTHROPIC_BASE_URL claude
```

This goes straight to Anthropic. It changes nothing on disk. For the whole terminal, use `unset ANTHROPIC_BASE_URL` and then `claude`. A new terminal brings the setting back.

**Or bring Headroom up on sol properly. This takes a few seconds and is the same set-up terra has.** Run it from a plain Terminal window, not from inside Claude:

```sh
"$HOME/.local/bin/headroom" install apply \
  --preset persistent-task --runtime python --scope provider --providers manual \
  --profile init-user --port 8787 --backend anthropic --mode token \
  --no-telemetry --code-aware \
  --env HEADROOM_OUTPUT_SHAPER=1 --env HEADROOM_EFFORT_ROUTER=1 \
  --env HEADROOM_VERBOSITY_AUTOTUNE=1 --env HEADROOM_COMPRESS_USER_MESSAGES=0
```

Check it with `lsof -nP -iTCP:8787 -sTCP:LISTEN` and `"$HOME/.local/bin/headroom" doctor`, then start `claude` as usual.

Undo: `"$HOME/.local/bin/headroom" install remove --profile init-user`. If that hangs, delete `~/Library/LaunchAgents/com.headroom.init-user.plist` and `~/.headroom/deploy/init-user/` by hand, as the chezmoi Headroom guide describes. While the proxy is down, `env -u ANTHROPIC_BASE_URL claude` still works.

## What has been done

- **terra, the working reference.**
  - Rig installs the Headroom program through `uv` (`[tool.headroom]`, `headroom-ai[all]`, in chezmoi's `dot_config/rig/conf.d/private_15-command-line.toml`). The installed version is 0.40.0.
  - The proxy's always-on part is Headroom's own deployment: the launchd job `com.headroom.init-user` (`~/Library/LaunchAgents/com.headroom.init-user.plist`) runs `~/.headroom/deploy/init-user/ensure-headroom.sh` at login and every 5 minutes. That script starts the proxy on 8787, which is up now.
  - Someone created that deployment once, by hand, with `headroom install apply`, following `docs/guides/tools/headroom.md` in chezmoi. chezmoi ignores `~/.headroom`, and neither chezmoi nor Rig declares the deployment.
  - chezmoi points Claude at the proxy in two places: `.chezmoidata/claude-settings.json`, which sets `ANTHROPIC_BASE_URL` and the `headroom init hook ensure` hooks and is patched into `~/.claude/settings.json`, and `dot_zsh/50_headroom`, which exports `ANTHROPIC_BASE_URL` in every interactive Zsh.
- **sol, what is there.** The Headroom program is installed, working and the same version, 0.40.0. Its link from this morning is fine. `python3` and `uv` are present, and the Command Line Tools path is set.
- **sol, what is missing.**
  - There is no `~/.headroom` folder at all, so there is no deployment, no launchd plist, no job loaded and nothing on 8787. There are no Headroom logs either, because it has never run.
  - chezmoi has already applied `~/.zsh/50_headroom` on sol, so every interactive terminal exports `ANTHROPIC_BASE_URL=http://127.0.0.1:8787/p/claude-code`. That is what sends Claude to a closed port and causes the ECONNREFUSED error.
  - sol's `~/.claude/settings.json` is still out of step with chezmoi (`chezmoi status` shows `MM`). It has no `env` block and no Headroom hooks yet, so the hooks would not have started anything. Even once applied, they only keep an existing deployment running and would not create one.
- **Cause.** This is a declaration gap shared by chezmoi and Rig. The machine-independent routing, set by chezmoi, reached sol. The per-machine proxy deployment did not, because it exists only as a manual step in a guide. Rig installs the program but not the deployment. chezmoi routes clients to the proxy but does not check that the proxy exists.
- **Read-only.** Nothing was started, loaded, installed or edited on either machine. No secrets were read. There are no commits.

## What is in progress

Nothing is running.

### Outstanding - no action requested now

- sol's `~/.claude/settings.json` has a pending chezmoi change (`MM`). Review it with `chezmoi diff ~/.claude/settings.json` before the bootstrap's next `chezmoi apply`. Once applied, Claude itself also routes through Headroom, so the proxy must be up first.
- terra's guide notes that `proxy_args` in the deployment manifest is managed by neither chezmoi nor Rig. The roadmap record [KB-DOTFILES-UE-087](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-087-manage-headroom-profile-arguments.md) (`/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-087-manage-headroom-profile-arguments.md`) is adjacent to the gap below.

## Outstanding queries

### HEADROOM-NOW - get Claude working on sol

**Summary:** Nothing is listening on 8787 on sol, because the Headroom deployment was never created there. The terminal still routes Claude to it. **Need from you:** Choose at sol whether to run Claude unrouted or to create the deployment now. **Recommendation:** Run the `headroom install apply` command above from a plain Terminal, check that 8787 is listening, then start `claude`. Use `env -u ANTHROPIC_BASE_URL claude` if it fails.

### HEADROOM-DECLARE - close the declaration gap

**Summary:** The Headroom deployment is a manual step in a guide, so a new machine gets routing without a proxy. **Need from you:** Approval to capture a chezmoi roadmap record for the gap. **Recommendation:** Capture a record in chezmoi for a declared, idempotent Headroom deployment step, either a `run_onchange` script from the guide's command or a Rig operational resource. Have `dot_zsh/50_headroom` export `ANTHROPIC_BASE_URL` only when the deployment exists, so a machine without the proxy falls back to direct.

```text
HEADROOM-NOW - I ran the headroom install apply command at sol from a plain Terminal; confirm 8787 is listening and Claude works
HEADROOM-DECLARE - capture a chezmoi roadmap record to declare the Headroom init-user deployment (run_onchange or Rig resource) and guard dot_zsh/50_headroom on the deployment existing
```
