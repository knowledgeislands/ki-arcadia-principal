# Agent host Ubuntu updates: stopped before any change

Stopped at step 2: the `techne` user has no passwordless sudo (`sudo -n true` → "a password is required"). Nothing was updated, and the host was not rebooted. The operator guide says this is by design: `techne` is "a non-root user without `sudo`" (docs/guides/operator/agent-host.md, line 19).

## Done

- Before-state recorded over SSH: kernel 7.0.0-1012-aws; up 1 day 10:30; Tailscale self 100.123.162.21 (ki-techne-agent-host); `tailscaled` enabled and active.
- Pending: 26 upgradable packages (the MOTD cache says 32). `/var/run/reboot-required` has been present since 8 Oct 06:21 for linux-image-7.0.0-1013-aws, linux-base and libc6.
- Upgradable packages: linux-aws, linux-image-aws, linux-headers-aws, linux-tools-common, libc6, apparmor, base-files, dmidecode, krb5 libraries, netplan, python3-apt, ubuntu-release-upgrader-core, and others.
- `status.sh` returned exit 0: REPOSITORIES=21, AT_RISK=0, UNKNOWN=0, OUTCOME=clean. All pins are present. The GitHub token expires on 2027-01-05 (87 days). The Tailscale key does not expire.

## Failed

- Updates and reboot not done: there is no passwordless sudo, and I did not try to obtain a password.

## Needs the owner

- To apply updates, choose one route:
  - Run the commands interactively as a user with sudo; Tailscale SSH might admit such a user if the tailnet policy allows it.
  - Grant a narrow NOPASSWD sudo rule. That changes the host's security model and is outside this run's authority.
  - Patch and reboot through AWS, for example with SSM Patch Manager or a rebuild, which picks up the new AMI and boot script.
- No commits made. No remote calls beyond read-only SSH to this one host.
