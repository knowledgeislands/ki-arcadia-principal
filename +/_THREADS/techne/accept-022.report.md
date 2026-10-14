# TECHNE-TOOLS-OPS-022 — finish, accept, prune

## Done

- Ran setup on the agent host. It succeeded with 18 changes and no failures or warnings. It completed the `direct-host` to `agent-host` rename: it rewrote the Rig pins as `agent-host-pins` and removed the old `direct-host-pins` provider. It also installed the new login banner, fast-forwarded 11 clean repositories, and refreshed the host rules, the Codex `AGENTS.md` and the host marker. The profile payload stayed as it was, because none was sent.
- Verified the live step. Status showed the `updates` block: 34 pending, 12 security, no reboot required, Livepatch disabled, outcome clean, exit 0.
- No reboot is currently required. The host runs the 7.0.0-1013 kernel and has no reboot flag. A new login loaded the banner, which correctly printed nothing. The reboot and security-updates lines were each checked against temporary test state on the host and printed as designed.
- Recorded the evidence in Review, ticked the step and accepted the record as done.
- Commit `37144f2` (`docs(roadmap): accept TECHNE-TOOLS-OPS-022`) is pushed to origin by fast-forward. `ki repo audit` passed with 0 failures and the 2 warnings already known (CI-1 and HOOK-1).

## Failed

- Did not prune TECHNE-TOOLS-OPS-022, so the done record is kept. In `tools-techne`, `docs/roadmap/TECHNE-TOOL-CLI-008-host-patching-fields.md` (lines 21 and 34) links to the record's `blob/main` URL, and pruning would break those links. The prune procedure says to keep the record when a reference in another repository cannot be fixed within the run's authority, and this run may not edit or push `tools-techne`.

## Needs the owner

- To allow the prune, approve one of these:
  - a `tools-techne` commit that points both links to the pinned copy <https://github.com/knowledgeislands/ki-techne-harness/blob/37144f2fe2b992967e90c58ec96ac7e01e67b88d/docs/roadmap/TECHNE-TOOLS-OPS-022-agent-host-os-patching.md>, then rerun the prune;
  - or prune now and accept that the two links will break.
- `tools-techne` is 1 commit behind origin locally. It was not touched.
- The 1014 kernel, due around 06:50 UTC on 2026-10-10, should set the real reboot flag. After that, restart the host through the provider's stop and start.
