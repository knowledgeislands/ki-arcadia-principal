# Build TECHNE-TOOLS-OPS-022 — report

**Done**

- TECHNE-TOOLS-OPS-022 ([record](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-022-agent-host-os-patching.md)) is built and at `awaiting-review` (not accepted). Commits, local only and not pushed:
  - `ac30788` feat(agent-host): patch the host OS and report pending updates
  - `38be9a5` docs(roadmap): move TECHNE-TOOLS-OPS-022 to awaiting-review
  - `977abc9` docs(roadmap): record the open live step on TECHNE-TOOLS-OPS-022
- What changed:
  - The recipe declares the patching model, with an optional daily reboot window and opt-in Livepatch.
  - The AWS boot script installs security-only automatic updates and never restarts the host by default.
  - Status and its JSON report pending and security updates, a required reboot and Livepatch. Outcome and exit status are unchanged.
  - The login banner shows a required reboot and security updates that have been pending for more than a day.
  - The operator guide has a new Patching and restart section.
  - Withdraw now also deletes the Ubuntu Pro token.
- Checks: `bun run test` passes, including all offline checks and shellcheck.
- Live, read-only: status from this checkout reported the host `clean` (exit 0), with 34 pending updates, 12 of them security, no reboot required and Livepatch disabled. No push was needed for this.

**Failed**

- `ki repo audit` fails one rule (ITEM-3): an awaiting-review record must have every step ticked. The live-verification step (setup plus the banner) is deliberately left open, because setup writes to the host and this run was not authorised to do that. The two audit warnings, the CI version pin and the missing committed pre-commit hook, predate this work.

**Needs the owner**

- Push the three commits above when you are ready. Then run setup on the agent host to install the new banner and status, and tick the live step, or move it to a follow-up record before acceptance.
- The host has 12 standard security updates pending, including a kernel. The unattended-upgrades log is root-only, so it is unclear whether they are held back by phasing or the unattended run is failing. Once setup is run, the banner will warn after a day if they persist.
- Once TECHNE-TOOL-CLI-008 adds `reboot_window` and `livepatch` to the binding schema, set `reboot_window = "04:00"` in your binding (Decision 28). A window or Livepatch reaches a host only at its next build.
- For Livepatch, store your Ubuntu Pro token as `/ki/techne/agent-host/ubuntu-pro-token` (SecureString) before that build.
