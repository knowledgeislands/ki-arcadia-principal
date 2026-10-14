# Agent-host setup rerun with --pull: TECHNE-TOOLS-OPS-014

Authority: Decision 18. On 2026-10-08 I ran this from the Mac over SSH to `ki-techne-agent-host`, which is `techne` on Tailscale:

- `bash operations/aws/agent-host/setup.sh --pull`
- `operations/aws/agent-host/status.sh` in text mode and with `--json`
- read-only SSH checks: `rig status --profile direct-host`, the tools' `--version` output, the files' presence, and the banner in a fresh interactive login shell

I made no AWS or Tailscale change, touched no other machine and attempted no fix on the host. No secrets appeared in any output.

## Done

- **Setup passed.** It exited 0 with `CHANGES=22 SKIPPED=0 WARNINGS=0 FAILURES=0`. All 21 checkouts fast-forwarded and the skill projections were refreshed. No checkout was dirty or diverged.
- **Repositories: pass.** Text and JSON status both exited 0 with `REPOSITORIES=21 AT_RISK=0 UNKNOWN=0 OUTCOME=clean`. The JSON `problems` list was empty.
- **Pins: pass, no drift on the host.** `rig status --profile direct-host` reported `present=7 missing=0 drifted=0`. The versions on the host are mise 2026.10.4, Bun 1.4.2, Node 24.21.0, Codex 0.161.0, Claude Code 2.1.293 (pin minimum 2.1.285), ki 0.9.0 and Rig 0.4.0.
- **Expiry cache and banner: pass.** The status run wrote `~/.cache/ki-agent-host/expiry` with `checked`, `github 2027-01-05`, `tailscale -` and an empty `drift` value. The banner printed nothing at login, which is correct: no expiry is within 14 days, there is no drift and the check is fresh. I also ran the host's own `banner.sh` against a synthetic cache in a temporary directory on the Mac. It printed the stale-check, near-expiry, drift and never-checked lines as intended.
- **Host instructions: pass.** `~/.claude/rules/ki-agent-host.md` and `~/.codex/AGENTS.md` exist and are identical, both rendered from `recipes/direct-host/host-instructions.md`.
- **Host marker: pass.** `~/.config/ki/host-marker` exists and declares `recipe = "direct-host"`.
- **Expiry dates:**
  - GitHub token: 2027-01-05.
  - Tailscale node key: does not expire (key expiry is disabled).
- **Drift:** none on the host. The status report's workstation section, which is a signal only, flags the Mac's own `ki` as drifted: the Mac has 0.10.0 and the pin is 0.9.0. This explains the drift. It concerns the Mac, not the host.
- **Roadmap:** I added a dated paragraph to the "First live run" note in TECHNE-TOOLS-OPS-014. Commit `445caa4 docs(roadmap): record the --pull rerun of TECHNE-TOOLS-OPS-014` is local only, and the pre-commit checks passed. The record's status is unchanged and the record is not accepted. Nothing was pushed.

## Failed

- None.

## Needs the owner

- **Review and accept TECHNE-TOOLS-OPS-014** if you are satisfied. It is still Awaiting review.
- **Decide on the `ki` pin.** The Mac runs ki 0.10.0 and the recipe pins 0.9.0. Either bump the pin in `recipes/direct-host/rig.toml` and rerun setup, or accept the drift.
- **Optional harness improvement, from the first run (no patch committed).** When `ki repo --estate repair` fails, `converge.sh` could suggest rerunning with `--pull`. Alternatively, the guide could recommend `--pull` for every rerun. This run found no new defect.
- Local `main` is now two commits ahead of origin (`e3b36a1`, `445caa4`). Neither is pushed.
