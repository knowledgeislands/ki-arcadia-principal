# Roadmap batches 1 and 2 - report

Authority: Decision 102 (the brief cited Decision 103; Decision 105 corrects this).

**Done**

- Batch 1: [KI-OBS-APP-041](/Users/krisbrown/workspaces/knowledge-islands/apps-observatory/docs/roadmap/KI-OBS-APP-041-adopt-territory-selection.md) closed as done in apps-observatory, commit `920669c`, pushed.
- Batch 1: [KI-TECHNE-OPS-017](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-017-zsh-shell-at-rebuild.md) closed as done, commit `ace606e`, pushed. The same commit clears the stale `blocked_by: [TECHNE-TOOLS-OPS-015]`. The record lives in **ki-techne-harness**, not tools-techne as the brief said; the identifier matches only that one file. Its `## Done` note defers the live rebuild, the AWS checks and the chezmoi `vega` values to the agent-host hold.
- `KI-TOOL-CLI-120` left untouched for closure: it is still `awaiting-review`.
- Batch 2: `KI-TOOL-CLI-119` pruned in tools-ki, commit `f1f426f` (prune only), pushed. Before that, commit `9fefd63` repaired the only surviving reference, a relative link in `KI-TOOL-CLI-120`'s Context, to cite `KI-TOOL-CLI-119` by identifier and commits (`311c762`, `24d9fd9`). The repair changes that one sentence and `updated_at`. Nothing else in 120 changed.
- Batch 2: `KI-MGIT-CLI-016` pruned in tools-mgit, commit `8fbf3db` (prune only), pushed.
- Before each change, each record was in the state the proposal assumed: 041 and 017 were `awaiting-review`, and 119 and 016 were committed as `done` with no trade link. A reference search across all of `~/workspaces` found only the 120 link.
- `KI-HARNESS-GOV-173` reservation: this is not an orphan or an in-flight run. It was the real record "Design system standard". It was reserved in `a3a5d292` and created with the `ki-design-system` standard in `bc231293`, both on 2026-10-11. It was then closed in `42c6b3d4` and pruned in `c2ba2854` on the same day. `skills/design/ki-design-system/references/sources.md` still cites it as a bare historical identifier. The reservation is correct and needs no change; nothing was changed.
- Checks: the `ki-work-roadmap` audit passed (15/15) in all four repositories. The `ki-authoring` audit passed (5/5) in apps-observatory, ki-techne-harness and tools-ki. `git diff --check` passed. Commit hooks passed, with no `--no-verify`. Every push was a fast-forward, and each repository is level with `origin/main`.

**Failed**

- None.

**Needs Kris**

- Note on `KI-OBS-APP-041`: its own review packet recommended HOLD until the full repository audit is clean. That audit still has the CI-1 and HOOK-1 warnings, the repository's estate-wide ones. The record's own Verify audits pass, and the proposal disclosed the warnings, so it was closed under Decision 102. The proposed fix for those warnings (hook binding and the pin receiver) still waits on your decision.
- Review and decide `KI-TOOL-CLI-120`. Its text changed only as described above.
