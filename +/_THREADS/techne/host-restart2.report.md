# Agent host restart (second attempt): report

## Done

- **Restart worked.** The host was stopped with `stop.sh` and started with `techne host start --host agent-host`, both using the operator profile `knowledge-islands-techne-agent-host`. The stop printed no warning because the status was clean. It stopped at 16:25:01 BST, started at 16:25:29 BST, and answered SSH on the first try at 16:25:34 BST.
- **Kernel:** it was `7.0.0-1012-aws` (up 1 day 19 hours) and is now `7.0.0-1013-aws` (up 0 minutes).
- **Reboot flag cleared:** `/var/run/reboot-required` is gone. It had been set since 8 October 06:21 UTC for `linux-image-7.0.0-1013-aws`, `linux-base` and `libc6`. `tailscaled` is active.
- **Automatic updates:** unattended-upgrades is already installing security updates.
  - `20auto-upgrades` turns on the daily package-list update and the daily unattended upgrade.
  - The allowed origins are the release, `-security`, ESM apps security and ESM infra security. `-updates` is not in the list.
  - The `unattended-upgrades` service, `apt-daily.timer` and `apt-daily-upgrade.timer` are all enabled.
  - `Automatic-Reboot` is commented out, so it is off. This is why kernel updates wait for a manual reboot.
  - The unattended-upgrades log can only be read by root. The first report confirmed the daily runs from `/var/log/apt/history.log`.
- **Upgradable packages:** 30 can be upgraded, not 26.
  - 6 of them are security updates: `linux-aws`, `linux-image-aws` and `linux-headers-aws` (kernel 7.0.0-1014), `linux-tools-common`, `libarchive13t64` and `libxml2`.
  - The other 24 are non-security, from `noble-updates` and the Tailscale repository.
  - So the remaining updates are not all non-security. The 6 security ones should install in the next unattended run, around 06:00–07:00 UTC on 10 October. Kernel 1014 will then set the reboot flag again.
- **Livepatch:** `canonical-livepatch` is not installed, and `pro status` says the machine is not attached to Ubuntu Pro.
- **Repositories, before and after:** `status.sh` reports `REPOSITORIES=21 AT_RISK=0 UNKNOWN=0 OUTCOME=clean` both times.
  - `--json` after the restart gives `techne/host-workspace/v1` with outcome `clean`, host `ki-techne-agent-host` / `i-0332d9ea05c2e929d`, nothing at risk and no problems.
  - The GitHub token expires 2027-01-05 (87 days). The Tailscale key does not expire.
- **Drift:** `rig status --profile direct-host` on the host shows all 7 pinned tools present and 0 drifted.
  - The Mac-side check (a signal only) shows `mise` and `codex` drifted on the workstation, not on the host.

## Failed

- Nothing failed.

## Needs the owner

- Decide how kernel security updates should reach the host. There are two options:
  - enable `Unattended-Upgrade::Automatic-Reboot` with a reboot time;
  - attach Ubuntu Pro and turn on Livepatch.

  Without one of them, kernel 1014 (due tomorrow morning) will need another manual reboot.
- Optional: bring `mise` and `codex` on the Mac back to their pins.

No commits were made. Nothing changed on the host apart from the stop and start.
