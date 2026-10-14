# rename-agent-host3 report

Decision 30 applied: `direct-host` is now `agent-host` in code, paths, configuration, tests, guides and open records. Nothing remote was touched, nothing pushed, and `chezmoi apply` was not run.

## Done

- **ki-techne-harness** `db399b8` refactor(recipes): rename the direct-host recipe to agent-host. `recipes/direct-host/` → `recipes/agent-host/`; manifest `name`, Rig profile `agent-host`, provider `agent-host-pins`, host marker `recipe = "agent-host"`, setup/status/converge/provision/stop/destroy, checks and fixture, operator guide, TECHNE-TOOLS-OPS-015/016/018/019/020/021/022. `converge.sh` now also removes the old `~/.local/share/rig/providers/direct-host-pins` (the one deliberate remaining use of the old name in code). Checks: `bun run test` passed (controller tests, shellcheck, workspace, AWS-script and manifest checks). `ki repo audit`: FAIL=1, the same before and after the change (TECHNE-TOOLS-OPS-022 ITEM-3: its open live-verification step is unticked while awaiting review).
- **tools-techne** `cc25a2c` refactor(tests): call the harness recipe agent-host. Fixture renamed to `src/tests/fixtures/agent-host.recipe.toml`, `cli.test.ts`, user guide, TECHNE-TOOL-CLI-007/008. No CLI code change: `techne` takes recipe names from the harness manifests. Checks: vitest 89/89 passed, `tsc` clean, `ki repo audit` FAIL=0 WARN=2 (unchanged).
- **chezmoi** `3e9e207` refactor(techne): bind agent-host to the agent-host recipe. `dot_config/techne/hosts/agent-host.toml` now `recipe = "agent-host"`; `tests/techne-config.test.mjs`, Zed guide, DOTFILES-UE-072/073. Checks: `node --test` 202 passed, 2 skipped, 0 failed; rumdl clean; `ki repo audit` FAIL=0 WARN=2 (unchanged).
- **ki-arcadia-principal** `a9e502d` docs(agent-host): call the harness recipe agent-host. Project note, Techne Programme Hold policy (one wording line), Engineering Practice MEMORY, `techne.agent-host` checkpoint (item 6 answered, next step 2 now the push). `ki repo audit` FAIL=0 WARN=3 (unchanged).
- **No match**: ki-specifications, tools-ki, tools-rig, ki-website.

### Left as they are

- Accepted Decision Records (status current) in ki-arcadia-principal: ADR-KI-ARCADIA-003, ADR-KI-ARCADIA-006, GDR-KI-ARCADIA-004, ODR-KI-ARCADIA-001.
- No done or pruned record mentioned the name.
- Deliberate remaining mentions: the checkpoint's Decision 30 line ("chose `agent-host` to replace `direct-host`"); the tools-techne fixture provenance line (vendored from `b37b16c recipes/direct-host/recipe.toml`, since renamed); the `converge.sh` cleanup of the old provider file.
- Not this name: ki-agentic-harness `ki-repo-harness` rubric and `claude.ts` say "direct host commands/execution" (a runtime running commands directly), and the recipe's `runtime = "direct"` field is a runtime kind. Neither was changed.

### What changes live at the next setup

- Rendered binding `~/.config/techne/hosts/agent-host.toml` on the Mac changes only on `chezmoi apply`, to `recipe = "agent-host"`. `techne` fails with "unknown recipe direct-host" if the harness checkout is pulled without that apply, and with "unknown recipe agent-host" if the apply comes first. Pull the harness and apply chezmoi together.
- On the host, setup/converge: `~/.config/rig/rig.toml` gets profile `agent-host` and provider `agent-host-pins`; `~/.local/share/rig/providers/agent-host-pins` is installed and `direct-host-pins` removed; `~/.config/ki/host-marker` becomes `recipe = "agent-host"`; `~/.claude/rules/ki-agent-host.md` and `~/.codex/AGENTS.md` get the rewritten wording. Status runs `rig status --profile agent-host`.
- No change: SSM parameters (already `/ki/techne/agent-host`), the stack, tags, instance and the binding name `agent-host`. tools-ki does not read the marker's recipe value.

## Failed

- Nothing failed. The harness audit failure was already there (TECHNE-TOOLS-OPS-022 awaiting live verification).

## Needs the owner

- Push in this order: 1. ki-techne-harness `db399b8`; 2. tools-techne `cc25a2c`; 3. chezmoi `3e9e207`; 4. ki-arcadia-principal `a9e502d`. Then pull the harness and run `chezmoi apply` together before the next `techne` use.
- No uncommitted changes from other sessions were found or skipped.
