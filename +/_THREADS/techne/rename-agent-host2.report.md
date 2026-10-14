# rename-agent-host2 report

## Done

- Nothing was changed. No files edited, no commits.
- A read-only survey of `direct-host` uses was completed. It is below, ready for the next run.

## Failed

- Wait gate never opened. `naming2.status` still ends `19:20 BST - waiting for build-015b to finish`. Its process (pid in `naming2.pid`) is gone; `naming2.log` says it ended its turn and handed the wait to a background watcher. `build-015b` wrote DONE at 19:28, but nothing resumed naming2. I waited until about 19:52, then stopped and am reporting rather than guessing.

## Needs the owner

- Relaunch or finish `naming2`, or confirm this rename may go ahead without it. Then relaunch this run (`rename-agent-host2`). naming2 touches the same area: TECHNE-TOOLS-OPS-015 and Arcadia's `+/_CHECKPOINTS/techne.agent-host.md`.

## Survey (for the relaunch)

- **ki-techne-harness** (26 files):
  - Rename `recipes/direct-host/` to `recipes/agent-host/` (recipe.toml `name`, the rig.toml profile `direct-host`, the provider `direct-host-pins`, rig-pins.sh, host-instructions.md).
  - Update `operations/aws/agent-host/*` (setup, provision, destroy, stop, status, host/converge.sh, host/status.sh), `tooling/checks/*` (controller.sh, recipe-manifest.{sh,py}, recipe-pins.py, agent-host-stack.rb, agent-host-workspace.sh, fixtures/agent-host.binding.toml), `docs/guides/operator/agent-host.md`, and the open records TECHNE-TOOLS-OPS-015/016/018/019/020/021/022.
  - Another session has uncommitted edits in TECHNE-TOOLS-OPS-015, `host/converge.sh` and `tooling/checks/agent-host-workspace.sh`. The relaunch must check whether those are committed first.
- **tools-techne** (5 files): `docs/guides/user/agent-host.md`, `src/tests/fixtures/direct-host.recipe.toml` (vendored copy of the harness recipe; rename it and re-vendor), `src/tests/cli.test.ts`, and the open records TECHNE-TOOL-CLI-007/008. No `direct-host` literal in `src/` outside tests: the recipe name comes from the harness manifest.
- **ki-arcadia-principal**:
  - To edit: Project note `Streams/Projects/agent-host/agent-host.md`, `+/_CHECKPOINTS/techne.agent-host.md`, `Pillars/Engineering Practice/MEMORY.md`, and the Policy `Techne Programme Hold.md` (a policy, not a DR; check it).
  - Leave as they are (accepted DRs): ADR-KI-ARCADIA-003, ADR-KI-ARCADIA-006, GDR-KI-ARCADIA-004, ODR-KI-ARCADIA-001.
  - `ki-arcadia-principal-prep-threads` (a separate checkout) also matches. It is out of scope; leave it.
- **chezmoi**: `dot_config/techne/hosts/agent-host.toml` (`recipe = "direct-host"`), `tests/techne-config.test.mjs`, open record DOTFILES-UE-072. DOTFILES-UE-073 (awaiting-review) only mentions "direct-download"; no change needed.
- **ki-agentic-harness**: "direct host execution/commands" in the ki-repo-harness rubric is a different meaning. Leave it.
- **No match**: ki-specifications, tools-ki, tools-rig, ki-website.
- **Live effects at the next setup**:
  - The binding's `recipe` value must change in the harness, tools-techne and chezmoi together.
  - On the host, `~/.config/ki/host-marker` becomes `recipe = "agent-host"`, and the Rig profile in `~/.config/rig/rig.toml` becomes `agent-host`.
  - The provider file `~/.local/share/rig/providers/direct-host-pins` is superseded by `agent-host-pins`; the old file stays unless converge removes it.
  - SSM parameters already use `/ki/techne/agent-host`, so nothing changes there.
  - tools-ki does not read the marker's recipe value.
