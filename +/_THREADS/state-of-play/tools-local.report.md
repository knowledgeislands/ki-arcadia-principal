# Make every KI tool work locally; capture DEV-MODE and RIG-LINK on hold (Decision 175)

## Done

I waited until `rig-accept-release` and `rig-cask-fix` had both finished before changing anything. I did not touch their work.

Every KI command-line tool on this Mac now runs. Four run from their checkouts. Rig runs its Homebrew 0.6.2 release, as the brief asked.

| Tool | Before | After | Works |
| --- | --- | --- | --- |
| `ki` | Linked checkout through `~/.local/bin/.ki-local-runner` (Bun runs `src/main.ts`), 0.10.1 | Unchanged | yes: `--version`, `--help`, `man ki` |
| `techne` | Linked checkout through a `~/.local/bin/techne` wrapper (mise Bun), 0.2.0 | Unchanged | yes |
| `mgit` | Linked checkout `~/.local/bin/mgit`, 0.17.0 | Unchanged | yes |
| `git-almanac` | Stale: `~/.local/bin/git-almanac` and its manual link were dangling links to the retired `~/workspaces/kit/knowledgeislands/tools-git-almanac`, so Homebrew 0.2.0 answered | Linked checkout through its own `./install.sh --link` (executable and manual) | yes: `--version`, `--help`, `git almanac`, `man git-almanac` |
| `rig` | Homebrew 0.6.2, with dead `~/.local/bin/rig` and `~/.local/share/man/man1/rig.1` links into the retired `kit/` path in front of it | Homebrew 0.6.2; I removed the two dead links | yes: `--version`, `--help`, `man rig` resolves to Homebrew's page |
| MCP servers (`mcp-*`, 8 repositories) | Have no `install.sh` and nothing on `PATH`. They run from their checkouts' `dist/` under mcporter | Unchanged (mcporter is out of bounds) | The two side CLIs (`mcp-acquire-whatsapp-cli`, `mcp-ki-kb-notion-mirror-publish`) answer `--help` from `dist/` |

- **Rig and the cask fix.** The 0.6.2 release still flags casks as `application-metadata-invalid`. The fix, `671c864`, is on `main`. Linking the checkout (`./install.sh --link`, which gives `0.6.2+dev`) _would_ pick it up. I kept the Homebrew release because it is not broken: only the doctor findings are wrong. The fix reaches Homebrew through the 0.6.3 release that `rig-cask-fix` has already raised.
- **Untouched:** the backup `backups/local-chezmoi/ki.bin`, launchd, mcporter, and `~/.config/ki/config.toml` (`chezmoi diff` is clean). I did not run `rig apply`.
- **How to revert:**
  - `git-almanac`: run `brew link --overwrite git-almanac`, or just remove `~/.local/bin/git-almanac` and `~/.local/share/man/man1/git-almanac.1` and Homebrew 0.2.0 answers again.
  - `rig`: nothing to restore. The removed links pointed at a path that no longer exists.
- **Records captured and held on the tools-rig roadmap.** Both are Kris-requested and held for review on 2026-11-16, alongside the other Rig holds:
  - [KI-TOOL-RIG-CLI-026](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CLI-026-per-tool-development-mode-switch.md) (DEV-MODE): `rig dev local|release <tool|all>`. Each tool keeps `install.sh --link` as its hook, checkouts are found through `ki registry`, and Rig warns when tools that call each other are in mixed modes.
  - [KI-TOOL-RIG-DIST-011](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-DIST-011-stale-terra-rig-link.md) (RIG-LINK): the stale `~/.local/bin/rig` on terra. It is recorded only; terra is untouched, under the Techne Programme Hold.
- **Commits in tools-rig, pushed fast-forward:**
  - `28a788d` reserves the two numbers in the issue ledger.
  - `0106527` adds the two records.
  - `ki repo audit` gives FAIL 0. Its one warning is the existing missing pre-commit hook. No other thread's commits were unpushed beneath mine.

## In progress

Nothing.

## Needs the owner

- **KI-CLI-121-REMINDER:** `ki` runs locally, but `ki agent launch` still fails in local mode until the tools-ki fix for detached re-launch lands. The master keeps using the backup `ki.bin` until then. **Recommendation:** no action here; it is tracked in tools-ki.
- **RIG-063:** this is the same 0.6.3 release query that `rig-cask-fix` raised. Releasing 0.6.3 is the way to get the cask fix into Homebrew. **Recommendation:** answer it there, not twice.

```text
KI-CLI-121-REMINDER: noted
RIG-063: answered in rig-cask-fix
```
