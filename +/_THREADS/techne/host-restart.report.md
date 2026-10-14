# Agent host restart — report

## Done

- I took the before readings on `ki-techne-agent-host` using read-only SSH.
  - Kernel `7.0.0-1012-aws`, up 1 day 19 hours.
  - `/var/run/reboot-required` has been set since 8 October 06:21 UTC. The packages are `linux-image-7.0.0-1013-aws`, `linux-base` and `libc6`.
- Automatic updates are on and working.
  - `20auto-upgrades` enables the daily list update and unattended upgrade.
  - The allowed origins are the release, `-security`, ESM apps security and ESM infra security.
  - Automatic reboot is not set (commented out, so it defaults to off). That is why the host is waiting for a reboot.
  - The `unattended-upgrades` service, `apt-daily.timer` and `apt-daily-upgrade.timer` are all enabled and active.
  - The unattended-upgrades log can only be read by root (permission denied for `techne`). `/var/log/apt/history.log` shows `unattended-upgrade` installing updates every morning at about 06:21 UTC: 8 October (several packages, including the 1013 kernel) and 9 October (`libpng16`).
- 30 packages can be upgraded now, not 26. 6 of them come from `noble-security`:
  - `linux-aws`, `linux-image-aws` and `linux-headers-aws` (kernel 7.0.0-1014);
  - `linux-tools-common`;
  - `libarchive13t64`;
  - `libxml2`.
  - The other 24 are `noble-updates` only (non-security), plus `tailscale` from its own repository.
  - The security items will probably be installed by the next unattended run (10 October, about 06:50 UTC). The kernel will then need another reboot.
- Livepatch: `canonical-livepatch` is not installed. `pro status` says the machine is not attached to an Ubuntu Pro subscription.
- `status.sh` (before): all 21 repositories are clean (`AT_RISK=0 UNKNOWN=0 OUTCOME=clean`). All pins are present. The GitHub token expires 2027-01-05 (87 days). The Tailscale key does not expire. `tailscaled` is active.

## Failed

- I did not restart the host. `aws sts get-caller-identity --profile knowledge-islands-techne-agent-host` failed with "Token has expired and refresh failed". As instructed, I did not try to log in. Nothing was stopped or started, and the host is unchanged and still running.
- No after readings, because the restart did not happen.

## Needs the owner

- Renew the SSO session: `aws sso login --profile knowledge-islands-techne` (or `assume knowledge-islands-techne-agent-host`). Then re-launch this run, or run it yourself:
  - `bash operations/aws/agent-host/stop.sh`
  - `techne host start --host agent-host`
- Think about waiting until after the 10 October ~06:50 UTC unattended run before rebooting. One reboot would then pick up kernel 1014 rather than 1013.
- Decide whether to enable `Unattended-Upgrade::Automatic-Reboot` (with a time) or install Livepatch (needs Ubuntu Pro). Without one of them, kernel security updates sit waiting for a manual reboot.

No commits were made.
