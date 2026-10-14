# coord-hook — owner report

Run `ways-of-working`, agent `coord-hook`, under Decisions 15 and 16. Written 2026-10-13.

## What has been done

**The coordinator reminder hook is built, registered on both runtimes, trialled live and pushed.** One script serves Claude Code 2.1.287 and Codex CLI 0.162.1.

- **Hook script.** `ki-agentic-harness/hooks/coordinator-reminder.sh` (commit `1fe7d6c2`, pushed to `origin/main`). It answers `UserPromptSubmit`, and `SessionStart` with the `compact` matcher, with `hookSpecificOutput.additionalContext`. Every failure path exits 0 with no output. Documented in `hooks/README.md`, recorded as HARN-012 in `docs/specs/harness.md`; 11-case `bun` test file beside it.
- **Exact injected line.** Tightened to your Decision 15 words:

  > Coordinator: do not do the work directly; delegate every unit of work to a detached background agent and stay responsive. Answer this message within one short turn. It does not pre-empt work in flight: do not stop or disturb a running agent unless it names one.

- **How "coordinating thread" is detected.** The hook's `cwd` (from the payload), or the Git top level containing it, holds a `+/_CHECKPOINTS/` directory. Capitals and the harness qualify; `tools-ki` does not. No other signal is used.
- **Silence in background agents.** Three signals, any one of which silences the hook: the `KI_AGENT_RUN` marker; `CLAUDE_CODE_PRINT_BG_WAIT_CEILING_MS`, which `ki` 0.10.1 already sets for Claude children; and no controlling terminal anywhere in the hook's process ancestry, which holds for every detached `ki agent` child on both runtimes because they start with stdio ignored in their own session. The ancestry walk is needed because both runtimes spawn hook processes without a terminal even in interactive threads. So the installed `ki` 0.10.1 is already covered without the marker.
- **Background-agent marker.** `tools-ki` commit `bd8563a` (pushed): `ki agent launch` and dispatch both pass through `startRuntime`, which now sets `KI_AGENT_RUN=<run name>` in every child's environment for both runtime adapters; tests assert it. It takes effect when `ki` is next released and installed.
- **Registration through chezmoi** (commits `645a03d` and `62116c8`, pushed). One data file `.chezmoidata/coordinator-hook.yaml` drives both runtimes. The Claude settings binding gained a hook fragment that rewrites only hook groups carrying the hook's command, leaving the headroom and harness-payload hooks untouched. A new `dot_codex/hooks.json.tmpl` renders `~/.codex/hooks.json`, and the Codex config binding merges the hook's trusted hashes under `hooks.state`. `chezmoi diff` was reviewed and `chezmoi apply` run for exactly `~/.claude/settings.json`, `~/.codex/config.toml` and `~/.codex/hooks.json`; nothing else was applied. Live settings now carry the two new groups beside the existing hooks; Codex `hooks/list` reports both entries `trusted`.
- **Pointer note** added to the Coordinator responsiveness section of `ki-delegation`'s background-run standard; `ki repo audit --skill ki-delegation` passes.
- **Trial evidence.**
  - Unit tests: 11/11 pass (Claude and Codex coordinating payloads inject; ordinary repository, `KI_AGENT_RUN`, the ceiling variable and no terminal in the ancestry stay silent; post-compaction `SessionStart` injects; startup, resume and other events stay silent; malformed input fails open).
  - Claude live: `claude -p` from a scratch checkout under `/tmp` holding `+/_CHECKPOINTS/` quoted the full line verbatim, first with a scratch settings file and again with the real registration after apply. The same run with `KI_AGENT_RUN=trial` answered NONE. `claude -p` does run hooks, which the design had left unverified.
  - Codex live: `codex exec` from the same scratch checkout quoted the full line verbatim; the transcript shows it delivered as one developer message tagged `hooks.additional_context`. The `KI_AGENT_RUN=trial` run's transcript contains no such line.
  - Gates: harness `bun run test` 1083 pass, `bunx tsc --noEmit` clean, focused audit PASS, pre-commit hooks ran (lint-staged, ki-skills audit); `tools-ki` vitest 1144 pass, tsc clean; chezmoi `node --test` 224 pass. No `--no-verify`, no force-push.
  - Scratch directory and the trial's Claude project transcripts were removed.
- **Codex findings** that shaped the registration (the design had assumed `~/.codex/hooks/hooks.json`):
  - Codex reads user hooks only from `~/.codex/hooks.json`; `hooks/hooks.json` and a project-level `.codex/hooks.json` were never loaded.
  - Codex runs a hook only once `config.toml` records `hooks.state."<hooks.json path>:<event>:0:0".trusted_hash`, which the TUI `/hooks` browser normally writes. The hash covers the handler entry (command, timeout, matcher), not the script contents, so it is stable across script edits and is recorded in the data file. Using `$HOME/...` as the command keeps the hash machine-independent.
- **Choices made where the design was open.** Command path is the primary harness checkout under `$HOME`, not the retired installer-owned Claude payload (its publisher no longer exists, so adding a fourth hook to that binding was not viable). `UserPromptSubmit` is registered without a matcher on both runtimes. The commit trailer names Claude Fable 5.1, this session's actual runtime, rather than the Opus 5.5 trailer the brief quoted.

## What an open thread must do

Both runtimes read hook registrations when a session starts. A thread opened before the apply, including this run's own parent, will not inject until it restarts; in Claude Code the `/hooks` menu also re-reads settings without a restart. New threads pick it up immediately.

## How to switch it off

Set `enabled: false` in `.chezmoidata/coordinator-hook.yaml` and run `chezmoi apply ~/.claude/settings.json ~/.codex/hooks.json ~/.codex/config.toml`. The registrations are removed from both runtimes; Codex's stale `hooks.state` entries are harmless and can be left. To silence a single thread instead, export `KI_AGENT_RUN=1` before starting it.

## What is in progress

Nothing. The run is complete.

## Outstanding queries

- **Needs: none blocking.** Two notes for your awareness:
  - `chezmoi` has uncommitted changes from another session that I left untouched: `.chezmoidata/mcp-servers.yaml`, `.chezmoitemplates/mcp-servers-json`, `bin/launchd/executable_mcporter_daemon_start`, `bin/executable_mcporter.tmpl`, `tests/mcporter-capacity.test.mjs`. They leave `~/.codex/config.toml` showing a pending mcporter path change in `chezmoi status`; that drift is theirs, not the hook's.
  - The harness push bypassed the branch rules on `main` (pull-request and `build` check) under the repository's solo direct-to-`main` workflow, as the remote reported.

```text
Reply to coord-hook:
- Acknowledged: yes / no
- Restart open coordinating threads now: yes / later
- Keep the hook enabled: yes / set enabled: false
```
