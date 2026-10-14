# Build TECHNE-TOOLS-OPS-015 (resumed run build-015b) - report

Record: `ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-015-agent-host-workstation-pilot.md`, now `awaiting-review` (not accepted).

Commits, local only, not pushed:

- `ki-techne-harness`: `9e1de9c` (earlier run) feat(agent-host): apply the binding owner's profile payload and shell; `854e12f` fix(agent-host): report personal tools as changed only when Rig changed them; `d0d0fcd` docs(roadmap): move TECHNE-TOOLS-OPS-015 to awaiting-review (also writes the pilot's Rig lessons into TECHNE-TOOLS-OPS-016 and TECHNE-TOOLS-OPS-018); `712a8a5` docs(roadmap): complete the TECHNE-TOOLS-OPS-015 review section.
- `~/.local/share/chezmoi`: `5cc2829` docs(roadmap): record the harness validator result in DOTFILES-UE-073.

Checks: `bun run test` passes (all offline agent-host checks). `ki repo audit` in `ki-techne-harness`: FAIL=1 WARN=2 - the two warnings are the baseline; the one failure is TECHNE-TOOLS-OPS-022's open live Step, present before this run. In `chezmoi`: FAIL=0 WARN=2 (baseline).

## Done

- Finished the earlier run's half-done fix: setup no longer claims the personal tools changed on every run.
- The vega bundle passes the harness's validator, and doctored copies (Mac path, secret, custom provider, wrong host) are each refused. Recorded in both records.
- Ran setup on the agent host with the bundle: no changes needed, status clean with no personal-tool drift; mgit is installed through Rig; new sessions open in zsh with Kris's prompt; plain commands still run in bash with the tools; the host versions of the Claude and Codex instructions are in place; the no-handoff file escape hatch works (tested, then removed).
- No unpushed commits were needed for the live trial: setup sends the local scripts over SSH.

## Failed

- Nothing failed in this record. The repository audit still fails on TECHNE-TOOLS-OPS-022, whose live step is open; that belongs to that record's run.

## Needs the owner

- Review and accept TECHNE-TOOLS-OPS-015 and DOTFILES-UE-073 together.
- Push both repositories when ready (`ki-techne-harness` is 14 commits ahead; chezmoi has this run's commit plus build-073's).
- Note for review: the validator does not yet stop a personal bundle from installing a personal-configuration tool such as chezmoi through Rig; for now, the owner's allowlist is the only safeguard. Recorded under Outstanding concerns.
- `target_host` stays out of the bundle until the host is renamed vega.
