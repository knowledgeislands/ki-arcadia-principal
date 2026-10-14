# Headroom apply command — owner report

## Done

- **Cause found.** Headroom is a `uv tool` install (PyPI `headroom-ai` v0.40.0) linked at `/Users/krisbrown/.local/bin/headroom`. `~/.local/bin` is added to `PATH` only by the Zsh login profile (`dot_zprofile.d/99_path`); a fresh login shell resolves `headroom` correctly, so the failing terminal was one that skipped `.zprofile` (for example an editor's integrated terminal or a non-login shell). The full path works everywhere.
- **Setting not yet live.** `~/.headroom/deploy/init-user/manifest.json` (`base_env`, updated 2026-10-13 02:08 UTC) and `run-headroom.sh` do not carry `HEADROOM_COMPRESS_USER_MESSAGES`, and the running proxy (PID 6462) has no such variable in its environment. The other three `--env` values are present.
- **Guide fixed** — [docs/guides/tools/headroom.md](/Users/krisbrown/.local/share/chezmoi/docs/guides/tools/headroom.md): the command now uses `"$HOME/.local/bin/headroom"`, says to run it from an unrouted terminal because applying restarts the proxy, explains the `PATH` cause and gives the `base_env` check. Commit `56a52b6` in chezmoi, pushed fast-forward to `origin/main`. No `chezmoi apply`. `rumdl` clean; `ki repo audit` fails on a pre-existing, unrelated finding (`declared skill ki-work-housekeeping is provided by no declared harness`).

## In progress

Nothing.

## Needs the owner

**[HEADROOM-APPLY]** Paste this into a plain terminal that is not routed through Headroom (for example Terminal.app, not a Claude Code or Codex session):

```sh
"$HOME/.local/bin/headroom" install apply \
  --preset persistent-task \
  --runtime python \
  --scope provider \
  --providers manual \
  --profile init-user \
  --port 8787 \
  --backend anthropic \
  --mode token \
  --no-telemetry \
  --code-aware \
  --env HEADROOM_OUTPUT_SHAPER=1 \
  --env HEADROOM_EFFORT_ROUTER=1 \
  --env HEADROOM_VERBOSITY_AUTOTUNE=1 \
  --env HEADROOM_COMPRESS_USER_MESSAGES=0
```

What it restarts: it tears down the existing `init-user` deployment (boots out `com.headroom.init-user`, stops the proxy on `127.0.0.1:8787`), rewrites the manifest, scripts and plist, then starts it again and waits for readiness. Every Claude Code and Codex session routed through the proxy, including the master thread and any background agents, will lose in-flight requests for a few seconds; best done when no agent is mid-run.

Confirm it worked:

```sh
jq .base_env.HEADROOM_COMPRESS_USER_MESSAGES ~/.headroom/deploy/init-user/manifest.json   # "0"
grep COMPRESS_USER ~/.headroom/deploy/init-user/run-headroom.sh
ps eww -p "$(lsof -tnP -iTCP:8787 -sTCP:LISTEN)" | tr ' ' '\n' | grep COMPRESS_USER
"$HOME/.local/bin/headroom" install status --profile init-user
jq '{scope, tool_envs, mutations}' ~/.headroom/deploy/init-user/manifest.json             # provider, {}, []
```

Recommendation: run it now from Terminal.app, then reply with the result.

```text
HEADROOM-APPLY: ran / not yet — <output of the checks if anything looks wrong>
```
