# coord-style: owner report

Run `coord-style`, chezmoi source `/Users/krisbrown/.local/share/chezmoi`, 2026-10-14. Record: [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md); related [KI-HARNESS-GOV-186](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-186-thread-banner-and-prefilled-reply.md).

## Done

- `~/.claude/output-styles/ki-coordinator.md` is deployed as a chezmoi-managed symlink to the harness primary checkout's [ki-coordinator.md](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/output-styles/ki-coordinator.md). The harness file stays canonical, so later harness edits reach Claude Code without a re-apply. This follows the Steps' model of `.chezmoidata/coordinator-hook.yaml`, which also points at the live harness checkout. The deployed file matches the harness file byte for byte (`cmp`).
- Source: [symlink_ki-coordinator.md.tmpl](/Users/krisbrown/.local/share/chezmoi/dot_claude/output-styles/symlink_ki-coordinator.md.tmpl), resolved through `.chezmoi.homeDir` so that it works on any machine.
- New test [claude-output-styles.test.mjs](/Users/krisbrown/.local/share/chezmoi/tests/claude-output-styles.test.mjs) pins the link target and checks that the user-level style stays `Concise`.
- Guide [claude-code.md](/Users/krisbrown/.local/share/chezmoi/docs/guides/tools/claude-code.md), under "Zed presentation and runtime", now describes the deployed style and how a repository selects it.
- `.chezmoidata/claude.yaml` stays at `Concise`. The hook registration and settings are unchanged.
- Local commit `319f6ae` `feat(claude): link the harness ki-coordinator output style`. Not pushed.

### Diff reviewed

`chezmoi diff ~/.claude/output-styles/ki-coordinator.md`:

```text
diff --git a/.claude/output-styles/ki-coordinator.md b/.claude/output-styles/ki-coordinator.md
new file mode 120000
--- /dev/null
+++ b/.claude/output-styles/ki-coordinator.md
@@ -0,0 +1 @@
+/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/output-styles/ki-coordinator.md
```

`chezmoi apply` on the file alone failed because its parent directory did not exist yet. `chezmoi diff --recursive=false ~/.claude/output-styles` showed only the new directory, with mode 40755 and no content. I then ran `chezmoi apply --recursive=false ~/.claude/output-styles ~/.claude/output-styles/ki-coordinator.md`. That directory holds only this file, so nothing outside the authorised target changed. Afterwards, `chezmoi status ~/.claude/output-styles` was clean.

### Checks

- `node --test tests/*.test.mjs`: 230 tests, 228 pass, 0 fail, 2 skipped.
- `ki repo audit --repo .`: PASS=19 WARN=2 FAIL=0. Both warnings were already there and are on paths this run did not touch: BODY-12 on `ADR-KB-DOTFILES-003` (it has an amendment section), and HOOK-1 (no committed `.githooks/pre-commit`).
- `rumdl check .`: no issues in 85 files.
- No `.git/*.lock` was left behind. The other session's uncommitted `dot_config/rig/conf.d/private_40-macos.toml` was not touched.

### Steps completed, KI-PRINCIPAL-ECO-013 "chezmoi source"

- Step 1, deploy the output-style file as a managed file sourced from the harness primary checkout while keeping `claude.yaml` at `Concise`: **done**.
- Step 2, review `chezmoi diff`, apply only the new file, run `node --test`, commit and push fast-forward: **done except the push**, which this brief withheld. Commit `319f6ae` is local on `main` on this machine.
- Chezmoi gate ("`chezmoi diff` shows only the new output-style file; `node --test` passes"): met.

## In progress

Nothing.

## Outstanding queries

- **Needs PUSH**: commit `319f6ae` is unpushed on `main` in `/Users/krisbrown/.local/share/chezmoi` on this machine. Push it to finish Step 2?
- **Needs FORM**: I deployed a symlink, not a rendered copy. It never drifts from the harness, but it dangles on a machine without the harness checkout at `~/workspaces/knowledge-islands/ki-agentic-harness`. The registered hook has the same dependency. Keep the symlink?

```text
PUSH - (a) push 319f6ae now / (b) hold
FORM - (a) keep symlink / (b) switch to a rendered copy
```
