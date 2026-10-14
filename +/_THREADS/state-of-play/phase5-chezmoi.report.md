# Phase 5b — chezmoi and machine configuration for the estate reshape

Branch `estate-reshape` in `~/.local/share/chezmoi`: commit `fc5ee7d` (`chore(estate): follow the estate reshape into territory folders`), pushed to `origin/estate-reshape`. Not merged and not applied. `main` has not changed.

## Done

- Every old checkout path and renamed GitHub identity in the chezmoi source now points at its `path_to`/`to` from `Estate Targets.json`.
- The mgit tree now has one manifest per territory plus a root manifest. The old manifests are deleted, and their targets are listed in `.chezmoiremove`.
- The VS Code workspaces named after renamed repositories are renamed, and their old targets are listed in `.chezmoiremove`.
- Wrote the post-apply rewrite script `src/phase6-rewrite-unmanaged.py` and ran it in preview only.
- Saved the redacted diff to `phase5-chezmoi-diff.txt` (2,390 lines). It contains only path and identity changes.
- Checks:
  - `node --test tests/*.test.mjs`: 209 pass, 0 fail, 3 skipped.
  - `rumdl check .`: clean.
  - `ki repo audit --repo .`: FAIL=0, WARN=4. The two migration warnings are explained under Needs the owner, item 5.
  - `rig doctor` before: 55 findings, all already present. The after-count can only be taken after the apply (see Needs the owner, item 4).

## Failed

Nothing.

## Needs the owner

1. **Apply only after every move has landed.**
   - The converge dry run skipped 7 repositories as busy: apps-observatory, ki-principal, tools-ki, hnr-principal, site-midnight.ninja, personal-principal and va-principal.
   - `.chezmoiremove` deletes `~/workspaces/hnr/kis/kit-hnr/.mgit.toml`. If kit-hnr is still at its old path when you apply, its symlink manifest is lost there. The copy at the new path is kept.
2. **`~/workspaces/hnr/5g-emerge/5g-emerge-testbed-website` is an empty folder that is not in the targets.**
   - Its trusted-folder entry and `kis-5g-emerge-testbed-website.code-workspace` still point at the old path. I left them unchanged.
   - Decide whether to retire both. If they are retired, `~/workspaces/hnr` can go after the moves.
3. **`MCP_KI_KB_FS_KNOWLEDGE_BASES` keeps its old knowledge-base IDs**, such as `ki-arcadia-principal`, `kit-hnr` and `kit-principal`. Only their paths changed.
   - Renaming the IDs would change the knowledge-base names agents use in `kit-mcp-ki-kb-fs`, so I left that for you to decide.
4. **`rig doctor` baseline: 55 findings, already present before this change.**
   - 54 are `application-metadata-invalid` from the Homebrew provider: one environmental fault affecting every cask, not something this change caused.
   - 1 is `dock.workstation` blocked by spark-desktop.
   - The `conf.d` change can only be measured after the apply, because rig reads the rendered target. Compare the count in phase 6a.
5. **Two audit warnings clear only after converge updates the registry:**
   - TERR-3: the capital is now `krisb/personal-principal`.
   - ITEM-2: roadmap references now name territory `ki-principal`. The same warning already existed on `main` under the old name.

## Files changed, by kind

| Kind | Files |
| --- | --- |
| chezmoi data | `.chezmoidata/trusted-folders.yaml` (paths, entries re-sorted), `.chezmoidata/mcp-servers.yaml` (server paths, KB paths, triage roots; `MCP_GIT_AUDIT_SAFE_ROOTS` now lists the territory folders, `~/workspaces/_external` and chezmoi) |
| KI config | `dot_config/ki/config.toml` (`[locals]` harness paths, `[repositories].paths`, kept sorted); `.ki.toml` capital → `krisb/personal-principal`. No territory roots or Capitals are declared in `config.toml`. |
| Rig | `dot_config/rig/conf.d/private_50-services.toml`: three `working-directory` entries (observatory, WhatsApp spool, 5G testbed) |
| LaunchAgent wrappers | `bin/scheduled/executable_rig-acquire-whatsapp-spool-refresh`, `executable_rig-testbed-5g-emerge-sources-refresh` (default repository paths). The plists are rendered by rig from `50-services`; there is no plist source in chezmoi. |
| Paperclip | `dot_config/paperclip/desired-state.json`: agent `cwd`s, with grouping folders mapped to their territory; `tests/paperclip-reconcile.test.mjs` updated to match |
| Tests and documents | `tests/scheduled-emerge-session.test.mjs`, `docs/guides/tools/paperclip.md`, `workspaces/chatgpt-codex/Projects/Kit/README.md`, 7 `docs/roadmap/DOTFILES-UE-*` items (`ki-arcadia-principal/…` → `ki-principal/…`; one tools-rig link) |
| VS Code | every affected `workspaces/vscode/*.code-workspace` path rewritten. 12 renamed: dafacts-website→er-site-dafacts, er-research→er-principal, ki-arcadia-principal→ki-principal, kit-hnr→hnr-principal, kit-kris.me.uk→site-kris.me.uk, kit-legal→legal-principal, kit-midnight.ninja→site-midnight.ninja, kit-principal→personal-principal, kit-techmedix→tmx-principal, mark-markhowarth.com→va-site-markhowarth.com, vallearmonia-principal→va-principal, vallearmonia-website→va-site-vallearmonia.com |
| Ignore and remove rules | `.chezmoiignore`: the hnr, kit and knowledge-wayfinder blocks are replaced by one block per territory, plus an hnr-principal manifest exception. `.chezmoiremove`: a dated block for the 14 old `.mgit.toml` targets and the 12 old workspace files. |

These are deliberately unchanged:

- `dot_codex/modify_private_config.toml.tmpl` still prunes the historic kit-pkb trust grant.
- The dated history entries in `.chezmoiremove` stay as they are.

## mgit restructure

- **Root.** `workspaces/dot_mgit.toml` stays in schema 1 grouped style. Its members are the territory folders: equal-remedy, humans-not-robots, knowledge-islands, legal, personal, sacred-inquiry, techmedix and valle-armonia.
- **Territory manifests.** Each `workspaces/<territory>/dot_mgit.toml` uses the direct-member format that `mgit register` writes today (`kind`, `locations = ["local"]`, `[members."<repo>"]`). The tools-mgit guide treats schema 1 grouped manifests as legacy-readable only. Members are generated from the targets, with each `source` set to the new GitHub identity:
  - equal-remedy: 3 members.
  - humans-not-robots: 12 members, including infoschematics and hnr-benchmarks.
  - knowledge-islands: 22 members, including kw-website and paperclip.
  - legal, techmedix: 1 member each.
  - personal: 4 members, including acquire.
  - valle-armonia: 3 members.
  - sacred-inquiry: 1 member, si-principal, which is not cloned yet. `mgit repair` there would clone it.
- **HNR Principal.** The symlink manifest moved from `workspaces/hnr/kis/kit-hnr/` to `workspaces/humans-not-robots/hnr-principal/`. Its `../hnr-shared/…` symlinks still resolve, because hnr-shared is a sibling there too.
- **Removed manifests.** The old manifests are deleted from the source, and their targets are listed in `.chezmoiremove`. chezmoi deletes a target only when it is listed there; a deleted source alone leaves the file behind. The old ignore blocks are dropped so that no ignore rule shields these targets from removal. The current `chezmoi diff` already shows each old `.mgit.toml` as a deletion.
- **`_external`.** No manifest was created, because no target repository lives under `_external`.

## Files outside the source, and how the script covers them

All four files are chezmoi-managed, but as additive bindings. The apply adds the new entries, and nothing removes the old ones.

| File | Binding | After apply | Script action |
| --- | --- | --- | --- |
| `~/.mcporter/mcporter.json` | fully rendered template | correct | expected clean (no-op) |
| `~/.claude/settings.json` | `modify_`, union-merges `additionalDirectories` | old and new directories both present | rewrite and drop duplicates |
| `~/.codex/config.toml` | `modify_`, merges `[projects.*]` and MCP | old `[projects."<old>"]` tables remain | rename keys; if the new key already exists, merge any extra fields into it and drop the old table (tomlkit, formatting kept) |
| `~/.claude.json` | `modify_`, manages MCP only | `projects` still keyed by old paths | rename keys, merging into an existing new key when present |
| Symlinks: `~/.local/share/ki/harnesses/*/*`, `~/.claude/skills/*`, `~/.agents/skills/*`, `~/.codex/skills/*`, chezmoi's gitignored `.claude/skills/*` and `.agents/skills/*` | not managed | point at the old ki-agentic-harness or hnr-agentic-harness paths | retargeted in place. The preview found 56 links. |

**Usage:** `src/phase6-rewrite-unmanaged.py <Estate Targets.json> [--apply]`.

**What it rewrites:**

- Each repository's `path_from` is rewritten to `path_to`, for the path itself and anything beneath it.
- Former grouping folders are rewritten only when they appear as an exact path. For example, `kit/knowledgeislands` becomes `knowledge-islands` and `hnr/kis` becomes `humans-not-robots`.
- `owner/name` identities are rewritten when they stand alone or follow `github.com`.

**What it leaves for review:** bare `~/workspaces/kit` and `~/workspaces/hnr` have no single successor, so the script reports them as residue instead of rewriting them.

**Safety:**

- Without `--apply` it only prints a preview.
- With `--apply` it backs up each file to `state-of-play/backups/phase6-<stamp>/` and logs each old symlink target to `symlinks.tsv`.
- It writes each file atomically, checks that the output parses, and is idempotent.

**Today's preview, taken before the moves:** 60 items. That is 5 changes to `.claude.json`, 46 to `settings.json`, 48 to the Codex config and 13 to `mcporter.json`, plus 56 symlinks. Once the apply has run, the `mcporter.json` changes will no longer be needed.

## Diff summary

The diff is saved at `phase5-chezmoi-diff.txt`, with secret values redacted. It covers these targets:

- `~/.claude/settings.json`, `~/.codex/config.toml`, `~/.mcporter/mcporter.json` and the Claude Desktop config: new MCP and trusted paths.
- `~/.config/ki/config.toml`, `~/.config/paperclip/desired-state.json`, `~/.config/rig/conf.d/50-services.toml` and the two scheduled wrappers.
- The Codex Kit project README.
- 9 new territory `.mgit.toml` files and the root manifest. The 14 old `.mgit.toml` files show as deletions.
- The VS Code workspaces: rewrites, 12 additions and 12 deletions.

I checked every changed line that does not contain a path or GitHub identity. Each is either a re-ordering caused by the re-sorted paths (OneDrive source entries, trailing commas) or the hnr-principal symlink manifest moving to its new path.

## Phase 6a sequence

1. Confirm that `ki estate converge --apply` has moved every target, including the 7 busy skips. `~/workspaces/kit` and `~/workspaces/hnr` should hold only leftovers.
2. Record the before-count: run `rig doctor` and note its findings (55 today).
3. Merge the branch:

   ```sh
   git -C ~/.local/share/chezmoi switch main
   git -C ~/.local/share/chezmoi merge --ff-only estate-reshape
   ```

4. Run `chezmoi diff` and review it. It should match `phase5-chezmoi-diff.txt`, minus anything converge already changed.
5. Run `chezmoi apply`. This deletes the old `.mgit.toml` and workspace targets through `.chezmoiremove`.
6. Preview the rewrite script, then run it:

   ```sh
   ~/.local/state/ki/agents/state-of-play/src/phase6-rewrite-unmanaged.py "<path_to of personal-principal>/Admin/Operations/Live Artifacts/Estate Targets.json"
   ```

   Review the preview, then rerun it with `--apply`. After converge, the targets file lives under `~/workspaces/personal/personal-principal/`. Quit interactive Claude Code and Codex sessions first if you can, because both rewrite `~/.claude.json` and `~/.codex/config.toml` while they run.
7. Restart the services:
   - `rig apply` (or `rig apply --dry-run` first). This re-renders and reloads the LaunchAgents whose working directory changed: observatory, the WhatsApp spool refresh and the 5G testbed sources refresh.
   - Restart the mcporter daemon (`service.mcporter-daemon`) through rig, so that it re-reads `~/.mcporter/mcporter.json`.
   - Restart Claude Desktop so that it picks up its new MCP paths.
   - Reconcile Paperclip, so that the agents get their new `cwd`s.
8. Verify:
   - Run `rig doctor` and compare the count with step 2. Treat any increase as a finding.
   - Run `chezmoi status`. It should be clean.
   - Run `mgit status` from `~/workspaces`.
   - Rerun the script preview. It should report 0 items to change.
   - Check that `ls -la ~/.claude/skills` resolves.
