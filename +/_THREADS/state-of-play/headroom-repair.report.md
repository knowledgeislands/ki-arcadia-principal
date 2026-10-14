# Headroom apply failure: diagnosis and repair script

Background run under the Master: state-of-play thread, Decision 166. I changed nothing on the live system and no repository. The only files I wrote are in this folder.

## Done

### Cause: a slow shutdown, not a respawn

- **The apply ran at 08:49 BST, not 09:28.** Three timestamps agree: the recovery snapshot (`updated_at` 07:49:37Z), the LaunchAgents directory (modified 08:49), and the old proxy, PID 6462, which logged `proxy_shutdown reason=signal` at 08:49:40.57. Kris's 09:28–09:30 shell history is the follow-up diagnosis (`launchctl list`, `headroom doctor`), ending with `headroom proxy` at 09:30:31. That last command is PID 20027. Agent traffic had no proxy from 08:49:40 to 09:30:38, about 41 minutes.
- **Why SIGTERM "did not work":** in headroom-ai 0.40.0, `stop_runtime` sends SIGTERM and then waits only **3 seconds** (30 checks, 0.1 s apart; `install/runtime.py`). The proxy was busy, with several Codex WebSocket sessions still draining. Its graceful shutdown took about 3.1 s, from about 08:49:37.4 to 08:49:40.6, so it missed the deadline by a fraction of a second. No shell hook or second process respawned it. `dot_zsh/50_headroom` only exports variables, and `ensure-headroom.sh` is run only by the launchd task.
- **Why it left nothing running:** `_remove_deployment` (`cli/install.py`) records the stop failure, carries on to `remove_supervisor`, and only then raises an error. That boots out the launchd job and deletes the plist. The manifest stays unchanged and nothing is restored, because the restore step belongs to a later phase that never runs. The old proxy then finished shutting down by itself.

### Current state

- The deployment has no owner: no launchd job, no plist, `runner.pid` empty, and `manifest.json` unchanged from 13 October.
- All traffic depends on PID 20027, which runs in the foreground on `ttys010` under zsh PID 95250. It is not the deployment runtime: it lacks `HEADROOM_DEPLOYMENT_PROFILE`. It also lacks `HEADROOM_COMPRESS_USER_MESSAGES=0`, so user turns are currently being compressed.
- **There is also an active retry loop.** A Claude Code hook (`headroom init hook ensure --profile init-user`, run on every Bash tool call and every session start) only accepts a ready proxy if it is the deployment's own. PID 20027 is not, so each tool call in every session starts a detached `install agent run`. That runner fails immediately because port 8787 is in use (errno 48). Each cycle can delay a Bash call by up to 15 s and adds about 100 lines to the 132 MB `runner.log`. There were spawns every 10–30 s from 09:34 onwards; my own tool calls added to them.

### Headroom defects (not filed upstream)

1. The 3-second stop deadline is shorter than a busy proxy's graceful shutdown, and shorter than the runner's own 10-second terminate grace.
2. A failed owner stop still removes the supervisor, which leaves the deployment with no owner.
3. The hook keeps starting runners that cannot bind while a different healthy proxy holds the port.
4. On macOS, `install apply` for a persistent-task deployment writes the plist but does not load it (`install_supervisor(start=False)`). The launchd job only appears after the next login unless it is bootstrapped by hand. The script does this.

### Repair script

[`headroom-repair.sh`](headroom-repair.sh) is executable, passes `bash -n`, and was tested in `--check` mode against the live state. It reported 8 failed checks, which is expected.

- **`--check`** only verifies and changes nothing. It checks that:
  - `/readyz` answers;
  - the listener is the init-user deployment runtime, with `HEADROOM_COMPRESS_USER_MESSAGES=0` in its environment;
  - its parent is the detached runner, and `runner.pid` matches it;
  - the launchd job and plist are present;
  - the manifest and runner scripts carry the variable.
- **Default mode** does the repair:
  1. Backs up the current files to `headroom-repair-backup/`.
  2. Moves `manifest.json` aside to hold off the hook. This makes the hook do nothing, and makes `install apply` take its fresh-install path, which skips the stop step that failed.
  3. Stops orphan runners.
  4. Shows the port listener and asks before sending it SIGTERM.
  5. Waits up to 90 s for the port to free. It only offers SIGKILL after showing the process and getting a typed `KILL`.
  6. Runs Kris's exact `install apply` command.
  7. Bootstraps the launchd job.
  8. Verifies everything.

  If the deployment is already healthy, it exits without changing anything. If interrupted, re-running it resumes.
- **`--rollback`** restores the deployment from `init-user.recovery.json`, using the original runner scripts and plist. It starts the runtime through the deployment's own `ensure-headroom.sh` and loads launchd.

## In progress

Nothing. The repair is waiting for Kris to run it.

## Needs the owner

- **[Needs: headroom-run-repair]** Run `~/.local/state/ki/agents/state-of-play/headroom-repair.sh` in a new Terminal.app tab, not `ttys010`. Running `--check` first is optional. Recommendation: run it when a 30–90-second break in agent traffic is acceptable.

  What to expect:
  1. Backup and hold-off lines.
  2. A prompt naming PID 20027 (`-zsh` parent, `ttys010`). Answer `y`.
  3. Up to about a minute while it shuts down.
  4. "port 8787 is free".
  5. Headroom's apply output.
  6. "readyz answers".
  7. "launchd job loaded".
  8. Ten `ok` lines, ending "Repaired. The hand-started proxy tab can be closed."

  Any `FAIL` line stops the script with nothing further changed, and points to `--rollback`.
- **[Needs: headroom-defect-route]** The four Headroom defects above are recorded only here. Recommendation: no action now, under Decision 158. Raise them only if the next apply fails again.

```text
headroom-run-repair: ran / failed (paste output) / later
headroom-defect-route: leave / capture
```
