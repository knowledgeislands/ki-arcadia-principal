# setup-ki010b report (2026-10-09)

Authority: Decision 20. No commits made, nothing pushed; local `main` at 70c3389 (includes 5592aa4, 10ea36b, 2e6308f).

## Done

- `setup.sh --pull`: exit 0. CHANGES=8 SKIPPED=0 WARNINGS=0 FAILURES=0. Changes: ki raised to 0.10.0, Rig pins in `~/.config/rig/rig.toml` updated, and 6 repositories fast-forwarded (ki-agentic-harness, ki-arcadia-principal, ki-techne-harness, tools-ki, tools-mgit, tools-rig).
- Host ki version: `ki --version` reports 0.10.0.
- Drift: none. `rig status --profile direct-host` exit 0: present=7 missing=0 drifted=0 unavailable=0 unknown=0.
- Repositories at risk: none. `status.sh` (text and `--json`) exit 0: REPOSITORIES=21 AT_RISK=0 UNKNOWN=0 OUTCOME=clean; all on main, clean, ahead 0 / behind 0 (as of the last fetch; status does not fetch). GitHub token expires 2027-01-05 (87 days); Tailscale key expiry disabled.
- Banner: silent. A fresh interactive login shell shows only the stock Ubuntu MOTD, with no ki or techne output and no errors.

## Failed

- Nothing.

## Needs the owner

- The Ubuntu MOTD reports "System restart required" and 32 pending updates. Not acted on (out of scope, remote-environment hold).
