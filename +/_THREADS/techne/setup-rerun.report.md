# Agent-host setup rerun: first live run of TECHNE-TOOLS-OPS-014

Authority: Decision 18. On 2026-10-08, `bash operations/aws/agent-host/setup.sh` ran from the Mac over SSH to `ki-techne-agent-host`, which resolves to `techne` on Tailscale. It ran without `--pull`, because the guide makes `--pull` optional. No AWS, Tailscale or other-machine call was made, and no fix was attempted on the host.

## Failed

- **Setup exited 1.** The summary was `CHANGES=14 SKIPPED=0 WARNINGS=1 FAILURES=1`. The failing step was `ki repo --estate repair`, which reported: `ki: error: /home/techne/workspaces/kit/knowledgeislands/ki-arcadia-principal/.ki.toml [skills.ki-repo.territory] is retired; move its name and members to [skills.ki-repo].territory_name and [skills.ki-repo].territory_members, then remove the table` It then warned `ki repo --estate diag still reports problems`. No secrets appeared in the output.
- **Local diagnosis.** The host's `ki-arcadia-principal` checkout is stale. On the Mac, `origin/main` already contains `f18360d docs(territory): complete governance selection cut-over`, which removes the retired table. The host never fast-forwarded because the run had no `--pull`. ki 0.9.0 on the host correctly rejects the old file. This is a stale checkout, not a harness script defect.
- Following the stop-on-failure rule, I did **not** run `status.sh` (text or `--json`) or any on-host verification.

## Outcomes, from the setup output only (not independently verified)

- Pins: setup reported mise 2026.10.4, the global mise pins, ki 0.9.0, Rig 0.4.0, `~/.config/rig/rig.toml` and the `direct-host-pins` provider as installed. **Drift: not checked.**
- Expiry cache and banner: `~/.config/ki-agent-host/banner.sh` and `env.sh` were written. The expiry cache is filled only by a status run, so this is **not verified**.
- Host instructions: `~/.claude/rules/ki-agent-host.md`, `~/.codex/AGENTS.md` and `~/.claude/delegation.md` were written. **Not verified.**
- Host marker: `~/.config/ki/host-marker` was written. **Not verified.**
- Repositories at risk: not checked.
- GitHub token and Tailscale key expiry dates: not obtained, because status was not run.

## Done

- Appended a dated "First live run" note under `## Discussion` in TECHNE-TOOLS-OPS-014. Commit `e3b36a1 docs(roadmap): record the first live run of TECHNE-TOOLS-OPS-014`, local only; the hook's rumdl check passed. The record's status is unchanged and the record is not accepted.

## Needs the owner

- **Authorise a rerun with `bash operations/aws/agent-host/setup.sh --pull`.** This is the documented invocation. It fast-forwards clean checkouts, including `ki-arcadia-principal`, and should clear the failure. After that, run `status.sh` and `status.sh --json` and the read-only checks.
- **Optional harness improvement (no patch committed).** Without `--pull`, setup always fails when a checkout falls behind a `ki` schema change. One option is for `converge.sh` to name the likely cause when `ki repo --estate repair` fails, for example by appending `; a checkout may be behind origin, rerun with --pull` to the failure line around line 423. The other is for the guide to recommend `--pull` on every rerun.
