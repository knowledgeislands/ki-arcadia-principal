# records-019-022 — report

## Done

- TECHNE-TOOLS-OPS-019 no longer carries the `chezmoi cat` removal; TECHNE-TOOLS-OPS-015 owns it. The record states how a binding personalises the recipe (profile payload source and shell). Commit `a3f513c`, ki-techne-harness.
- TECHNE-TOOLS-OPS-022 adopted to Next (`kind: deliver`) and planned. It stays `draft`, waiting for Kris's decisions. Commits `d14c7bc` (adopt and plan) and `5d2297f` (records that the restart failed), ki-techne-harness.
  - Security updates install unattended as root, configured by the image or boot script. Livepatch is opt-in per binding. A host reboots only when needed: in a window the binding chooses, with nobody logged in. With no window, the owner restarts it through the provider's stop/start.
  - `status.sh` (text and JSON) and the login banner report pending updates, security updates, reboot-required with its age, and Livepatch state. The work-safety outcome never changes.
  - The AWS path is the boot script, owned Linux uses systemd, and macOS uses softwareupdate with the FileVault caveat. There is no SSM, no sudo and no rebuild. The current host gets reporting at the next setup and the boot-script settings at the TECHNE-TOOLS-OPS-017 rebuild.
- Arcadia checkpoint `+/_CHECKPOINTS/techne.agent-host.md` updated. TECHNE-TOOLS-OPS-019 is marked answered, TECHNE-TOOLS-OPS-022 as being planned, the restart as failed, and the pilot as approved in principle pending the walkthrough's manifest recommendation. Added the personal-harness parked tangent and bumped `updated_at`. Commit `476affb`, ki-arcadia-principal.
- `ki repo audit`, ki-techne-harness: PASS (FAIL=0, WARN=2). Both warnings predate this run: the CI KI_VERSION pin and no `.githooks/pre-commit`.

## Failed

- `ki repo audit`, ki-arcadia-principal: FAIL=2, in files this run did not touch. STREAM-9 fails on `Streams/Projects/agent-host/agent-host.md`, whose Project note lists DOTFILES-UE-073. It also fails on `Streams/Projects/mac-studio-bootstrap.md`, which another run has left uncommitted. One more warning (STREAM-10) predates this run.

## Needs the owner

TECHNE-TOOLS-OPS-022 needs these decisions before it can be Ready. Recommendations are listed first.

1. Automatic reboot default. Recommended: none. A binding may set a window, and the host reboots in it only when needed and with nobody logged in.
2. Livepatch. Recommended: an opt-in binding field. For the current binding: attach Ubuntu Pro and store its token as a SecureString beside the Tailscale key, yes or no?
3. Unattended scope. Recommended: security updates only. Non-security updates wait for the next build.
4. Status outcome. Recommended: updates and reboot-required never change the outcome or exit code. The alternative is a stale reboot-required, over 7 days, making the outcome non-clean.
5. Current host. Recommended: no rebuild. One provider stop/start after the 2026-10-10 unattended run (about 06:50 UTC) picks up both pending kernels. The AWS restart approved in Decision 24(e) still has to happen: the host-restart run failed on an expired SSO session.
6. Reboot window form. Recommended: a weekday and local time, such as `Sun 04:00`, in the host's time zone.

Also: a paired `tools-techne` record is needed for the new binding fields and the status `updates` member. It is listed as a plan step and has not been handed off yet.
