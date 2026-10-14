# Agent host restart (Decision 36(1))

**Done**

- Before: kernel 7.0.0-1013-aws, up 1 day 1:13, reboot flagged since 2026-10-10 06:45 UTC for linux-image-7.0.0-1014-aws and linux-base; status outcome clean, 22 pending updates, 0 security.
- Stopped the host through AWS with the operator profile (stop.sh), confirmed stopped, then started it with `techne host start --host agent-host`.
- After: back on SSH over Tailscale within about 10 seconds of start; kernel 7.0.0-1014-aws, freshly booted, no reboot-required flag or package list.
- Status (text and JSON) after: outcome clean, 21 of 21 repositories clean, no problems, host pins all present, profile drift empty; updates block shows reboot not required, 22 pending, 0 security, Livepatch disabled.
- Login banner prints nothing at all now, so nothing about a reboot.
- No other remote changes, no commits, no secrets printed.

**Needs the owner**

- Nothing. Signal only: this Mac drifts from the recipe pins for rig, mise and codex (the host itself matches); that is the separate pin-raise item (Decision 36(4)).
