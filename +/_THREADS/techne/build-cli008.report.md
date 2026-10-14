# Build KI-TOOL-TECHNE-CLI-008 (host patching fields): report

## Done

- Re-grounded: no drift. tools-techne `src/` unchanged since adoption; ki-techne-harness clean at `11adc5d`, with the recipe, exit map and seven nullable `updates` fields as planned.
- `293a6c1` docs(roadmap): Decision 42 recorded in the Discussion; record moved to Ready with `baseline_ref` 4a59790cbf285b256178ec75d19dd249df40513f. The tools-burndown `run-ki.py` note is marked as applying to that finished run only.
- `bbaaac0` feat(host): optional `reboot_window` (HH:MM) and `livepatch` (boolean) binding fields, an optional recipe `[status]` declaration, and an advisory `workspace.updates` projection in `host status --json` (single host and `--all`). Text output, schemas, state and exit decisions are unchanged. Adds 12 stubbed `runCli` tests and updates the guide, manual and changelog.
- Record [KI-TOOL-TECHNE-CLI-008](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-008-host-patching-fields.md) is now awaiting-review at horizon Now, with its full Review packet.
- Checks: `bun run test` 101/101; `test:coverage` 100% on all four measures; `self:typecheck`, `build`, `self:release:test`, `ki:tools:lint-man`, `biome check .`, `rumdl check .` and `git diff --check` all pass; `mandoc -Tlint` clean. The `ki-work`, `ki-work-roadmap`, `ki-authoring` and `ki-repo-tools` audits pass. `ki-engineering` and the full audit have 0 failures and only the two existing warnings (inline CI KI_VERSION; no `.githooks/pre-commit`).
- No remote action: no AWS, SSH, Tailscale, Ubuntu Pro, host script, fetch or push. No other repository was touched.

## Failed

- None.

## Needs the owner

- Review and accept KI-TOOL-TECHNE-CLI-008 through `ki-accept`. Live verification still waits for the owner-led vega rebuild.
- Push is pending: tools-techne `main` on this Mac has 2 unpushed commits (`293a6c1`, `bbaaac0`).
