# [Techne](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/techne.md) › [paperclip-capture-and-rebuild](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/paperclip-capture-and-rebuild/paperclip-capture-and-rebuild.md) › paperclip-clean

**Run report at 21:56 BST · last mark 21:47 BST**

---

## Done

Kris said "Clean it all" (PAPERCLIP-CLEANUP, Decision 194), so I deleted the Paperclip leftovers on terra that the [capture report](/Users/krisbrown/.local/state/ki/agents/state-of-play/paperclip-capture.report.md) names. I deleted each one by its explicit path, after checking that no Paperclip process was running and that nothing was listening on ports 3100 or 54329. This freed **about 11.6 GiB** (12,167,436 KB by `du`). Free space on the disk went from 55.5 GB to 67.8 GB.

| Deleted path | Size |
| --- | --- |
| `~/.paperclip/instances/default/data`, which held the hourly backups (6.6 GB) and run logs | 6.7 GiB |
| `~/.paperclip/cli/installs/fork` (fork install) | 2.8 GiB |
| `~/.paperclip/cli/installs/npm` (npm rollback payload) | 1.4 GiB |
| `~/.paperclip/instances/default/db` (embedded Postgres database) | 374 MiB |
| `~/.paperclip/instances/default/companies` (company homes) | 302 MiB |
| `~/Library/Logs/uk.me.kris.rig.paperclip.log` | 3.5 MiB |
| `~/.paperclip/repairs` | 1 MiB |
| `~/.paperclip/instances/default/workspaces` | 132 KiB |
| `~/.paperclip/instances/default/{runtime-services, skills, telemetry}` | 20 KiB |
| `~/.paperclip/instances/default/{locks, logs, runtime-service-logs, worktrees}` (empty) | 0 |

Nothing remote was touched, and nothing was committed, because no repository changed. The rest of `~/.paperclip` now comes to 752 KiB.

## In Progress

Nothing is running.

## Queries

### PAPERCLIP-SECRETS: instance secrets and Git clones left in place

**Context:** The safety rules excluded these items, so they are still in place. The first group is the instance's credentials and configuration: `~/.paperclip/instances/default/secrets/` (`master.key` and `decision-signing.key`), `.env`, `config.json`, and an empty `ai-local-logins/`. The second group is two Git clones under `~/.paperclip/instances/default/projects/` (704 KiB): `dafacts-website` and `er-agentic-harness`. Both are clean and level with `origin/main`. The data these keys encrypted has now been deleted. The third group is small CLI files: `~/.paperclip/cli/{.managed-install, install.json, update-check.json}` and `runtime/mise.toml`. There is also a broken `cli/current` symlink that pointed at the deleted fork install. **Query:** Should the rest of `~/.paperclip` go as well? **Options:** a) (recommended) Delete the whole of `~/.paperclip`. Nothing it encrypted still exists, and the clones are level with their remotes; a fresh rebuild creates new keys. b) Keep the keys until the fresh rebuild runs, and delete everything else. c) Keep it all.

### PAPERCLIP-REPOS: fork checkout and agent branches

**Context:** The safety rules kept me out of Git repositories. The fork checkout at `~/workspaces/knowledge-islands/paperclip` (3.8 GB) is still there. So are the ten `paperclip/aligned-20260926/*` branches, which exist both locally and on the remote: six in `hnr-principal`, two in `hnr-agentic-harness`, one in `hnr-shared` and one in `tools-ki`. **Query:** Should a run with remote authority delete these? **Options:** a) (recommended) Launch one run to check that each branch is merged or not needed, delete the local and remote copies, then remove the fork checkout once it shows nothing unpushed. b) Delete only the local copies now. c) Keep them until the rebuild.

### PAPERCLIP-CHEZMOI: launchd plist and chezmoi-owned Paperclip files

**Context:** `~/Library/LaunchAgents/uk.me.kris.rig.paperclip.plist` is still there, but it is not loaded, and it now points at an install that no longer exists. The chezmoi-owned `paperclip-setup`, `paperclip-reconcile` and `paperclip-check-repairs` are also still in place, along with `~/.config/paperclip/*` and the operations guide. I found one more log that the capture report does not name: `~/Library/Logs/uk.me.kris.paperclip.log` (1 MB, last written 28 September). I left it in place. **Query:** Should the Rig: chezmoi thread retire the Paperclip declarations? **Options:** a) (recommended) Leave a message at the top of the Rig: chezmoi checkpoint: remove the Paperclip service, the plist and the scripts from the chezmoi sources, apply only those targets, and delete the old 1 MB log. b) Keep the declarations, stopped, until the rebuild is designed.

```text
PAPERCLIP-SECRETS - Delete the whole of ~/.paperclip on terra (keys, .env, config.json, the two clean project clones and the CLI stubs).
PAPERCLIP-REPOS - Launch a run to check and then delete the 10 paperclip/aligned-20260926/* branches, local and remote, and then remove ~/workspaces/knowledge-islands/paperclip once it shows nothing unpushed.
PAPERCLIP-CHEZMOI - Leave a message for the Rig: chezmoi thread to remove the Paperclip service, plist and scripts from the chezmoi sources, apply only those targets, and delete ~/Library/Logs/uk.me.kris.paperclip.log.
```

```text
╭─ run report · 2026-10-14T20:56:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] PAPERCLIP-SECRETS
- [waiting] PAPERCLIP-REPOS
- [waiting] PAPERCLIP-CHEZMOI

Resume: reply with the block above, or with your own choice for each tag.
