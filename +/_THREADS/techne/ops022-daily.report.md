# TECHNE-TOOLS-OPS-022 daily reboot window — report

## Done

- ki-techne-harness `e8e1849`: [TECHNE-TOOLS-OPS-022](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-022-agent-host-os-patching.md) now uses a daily local `HH:MM` window in the host time zone (Kris: `04:00`). I updated the model, the AWS, owned-Linux and macOS paths, the recipe-manifest validation, the stack-check Verify line, Decision 6 (amended by Decision 27), and added an Alternatives entry. The record is still `draft`.
- I kept the custom `ki-agent-host-reboot` timer, which now runs daily (`OnCalendar=*-*-* 04:00:00`), instead of switching to the native unattended-upgrades reboot. The native route reboots only when a reboot is required. But `Automatic-Reboot-Time` makes unattended-upgrades schedule `shutdown -r` when its run ends (around 06:00–07:00), and `Automatic-Reboot-WithUsers` is checked at that moment too. So it checks for logged-in users about 21 hours before the 04:00 reboot, and anyone who logs in during that gap would be cut off.
- tools-techne `104d149`: [TECHNE-TOOL-CLI-008](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-techne/docs/roadmap/TECHNE-TOOL-CLI-008-host-patching-fields.md) now describes `reboot_window` as a daily `HH:MM` with no weekday. Its status is unchanged: it was `triage`, not `draft`.
- `ki repo audit` passed in both repositories with FAIL=0 and WARN=2. Both warnings existed before this change (the CI-1 KI_VERSION pin and the HOOK-1 pre-commit gate).

## Needs the owner

- I could not check the unattended-upgrades documentation live, because this run allowed no network calls. The native-reboot finding comes from the upstream behaviour I know. Confirm it if you want the native route reconsidered.
- One option I left in the Alternatives entry without adopting it: move `apt-daily-upgrade.timer` to the window and reboot immediately. That would make the native route nearly safe, but it also moves when upgrades run.
- To proceed, approve TECHNE-TOOLS-OPS-022 as Ready.
