# Agent host: new workspace layout and repository names — owner report

Authority: Decision 43 (REBUILD), 2026-10-13. Local only; no AWS, SSH, Tailscale or host action.

## Done

- **Commit `bd2c0b1`** in `ki-techne-harness` (`main`, local, not pushed): `fix(agent-host): mirror the Mac's territory workspace layout and renamed repositories`.
  - The current list comes from the Mac's checkouts and `ki registry list`. There are 20 Knowledge Islands repositories, all present. Two were renamed: `apps-observatory` → `apps-observatory.local` and `ki-website` → `apps-knowledgeislands.info`. None were dropped and none were added. `paperclip` and `kw-website` sit in the folder but were never in the host list, so they stay out.
  - `host/repositories.txt` now uses `knowledge-islands/<repo>` paths, the renamed origins and a new header that describes the `~/workspaces/<territory>/<repository>` layout.
  - The workspace default is now `~/workspaces` (it was `~/workspaces/kit`) in `setup.sh`, `host/converge.sh`, `host/status.sh` and `recipes/agent-host/recipe.toml`. The recipe's repository-list summary now reads `<territory>/<repository>`.
  - `converge.sh` now looks for the local harness checkout at `knowledge-islands/ki-agentic-harness`.
  - The operator guide `docs/guides/operator/agent-host.md` has the new parameter default and layout sentence.
  - The test fixtures in `tooling/checks/agent-host-workspace.sh` and `agent-host-aws-scripts.sh` use the new layout.
  - `host/profile-check.py` needed no change: it takes the workspace as an argument. The recipe name `agent-host` and the host name vega are unchanged.
- **Checks**
  - `bun run test` passes, with mise's Python 3.12.13 first on `PATH`. It covers the dependency layout, typecheck, the workspace, AWS-script, record-identifier and recipe checks, and the local CloudFormation validation.
  - The pre-commit gates pass (lint-staged and syncpack).
  - `ki repo audit`: PASS=16 WARN=2 FAIL=0. Both warnings were there before this change and are unrelated: the KI version is pinned inline in `ci.yml`, and there is no `.githooks/pre-commit`.

## Before the rebuild: what Kris must change outside this repository

Nothing is required. To check:

1. **chezmoi binding** (`dot_config/techne/hosts/agent-host.toml`): it sets no workspace, so the new recipe default `~/workspaces` applies. Leave it that way. If you ever add a workspace setting, use `~/workspaces`, not `~/workspaces/kit`.
2. **cheztoi payload** (`scripts/cheztoi-render --host vega`): it already keeps everything under `workspaces/` out of the payload, which matches the new root. So your chezmoi-managed `~/workspaces/<territory>/.mgit.toml` files will not reach the host. Re-render the payload only if it is older than your last chezmoi change.
3. Optional: the Zed SSH entry in `dot_config/zed/private_settings.json` opens `/home/techne`. You could add `/home/techne/workspaces/knowledge-islands` as a project path.
4. Push `bd2c0b1` from this Mac before the rebuild, because the host's setup copies the scripts from your checkout.

One caution: the change assumes a fresh host. If setup were run against the existing vega instead, it would clone the repositories again under `~/workspaces/knowledge-islands`. Status would then report the old `~/workspaces/kit` checkouts as unknown, undeclared repositories. The destroy/rebuild flow's at-risk check still covers any unpushed work on the old host.

## In progress

Nothing.

## Pending handoff

- `ki-techne-harness`, Mac, `main`: `bd2c0b1` is not pushed.

## Outstanding queries

None.

```text
Needs: none
```
