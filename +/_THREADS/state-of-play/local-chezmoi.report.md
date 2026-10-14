# Local mode and chezmoi updates: report

## Done

- **chezmoi `main`**, pushed fast-forward: merged `phase7-sweep` (`011cfab`) and committed `ae73787`, which adds the keybinding paragraph (Decision 109) and the `[territories] ranking` (Decision 95). Did not touch `step9-renames`.
- **chezmoi apply**, limited to the intended targets: `~/.claude/CLAUDE.md` and `~/.config/ki/config.toml`. The `phase7-sweep` change renders no target diff. The rest of `chezmoi diff` is a `.gitconfig` difference that was already there and is outside this task, so it is not applied (see Needs Kris).
- **Tools are local.** Both are owned by their own installers (`install.sh`), not chezmoi or Rig, so each was switched with that repo's `./install.sh --link`, an atomic rename or `ln -sfn`. `~/.local/bin` comes before Homebrew on PATH.
  - `~/.local/bin/ki` → `.ki-local-runner` → `bun ~/workspaces/knowledge-islands/tools-ki/src/main.ts`. `ki diag` shows `Installation: local`.
  - `~/.local/bin/mgit` → `~/workspaces/knowledge-islands/tools-mgit/bin/mgit`. The old link pointed at the retired `workspaces/kit/...` path, so `mgit` had been running Homebrew 0.16.0.
  - Man pages are relinked the same way.
- **Harnesses are local.** Only two harnesses are installed, `knowledgeislands/ki-agentic-harness` and `humansnotrobots/hnr-agentic-harness`, and both were already in local mode: `[locals]` is set and the store entries are symlinks to the checkouts. `ki dev local on` confirmed it. `er-agentic-harness` and `ki-techne-harness` are not installed harnesses, so they were left alone.
- **Checks pass:** `ki --version` gives 0.10.1 from local source. `mgit --principals status` works. `ki territory list` shows personal, knowledge-islands, legal, humans-not-robots, valle-armonia, sacred-inquiry, techmedix, equal-remedy. `ki agent status state-of-play` works.

## Failed

- **The ki config writer drops `[territories]`.** `ki dev local on` rewrote `~/.config/ki/config.toml` without the ranking. The cause is the renderer in `tools-ki/src/agents/configuration.ts`, which writes only agents, harnesses, skills, locals and repositories. I restored the file from chezmoi with `chezmoi apply --force`, after confirming that the ranking was the only difference. Any `ki` command that writes the config (dev local on/off, harness install and so on) will drop the ranking again until this is fixed. It is a defect in [KI-TOOL-CLI-120](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-CLI-120-personal-territory-ranking.md), which is awaiting review. It was not fixed here.

## Needs Kris

1. Send [KI-TOOL-CLI-120](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-CLI-120-personal-territory-ranking.md) back for the config-writer fix before accepting it. Until then, run `chezmoi apply ~/.config/ki/config.toml` after any `ki` command that rewrites the config.
2. `.gitconfig` drift: the target's `[filter "lfs"]` block uses tabs, probably from `git lfs install`, while the source uses two spaces. The diff is saved in `local-chezmoi.gitconfig-diff.txt`. Choose whether to apply the source version or re-add the target.
3. Local `ki` now needs `bun` on PATH (mise). A `ki` started from a context without mise's PATH, such as launchd, will fail.

## Revert commands

Each switch is a single file swap. Backups are in `~/.local/state/ki/agents/state-of-play/backups/local-chezmoi/`.

```sh
B=~/.local/state/ki/agents/state-of-play/backups/local-chezmoi
# ki: back to the compiled build (atomic rename)
cp -p "$B/ki.bin" ~/.local/bin/.ki.restore && mv -f ~/.local/bin/.ki.restore ~/.local/bin/ki
cp -p "$B/ki.1" ~/.local/share/man/man1/.ki.1.restore && mv -f ~/.local/share/man/man1/.ki.1.restore ~/.local/share/man/man1/ki.1
#   or the latest signed release: (cd ~/workspaces/knowledge-islands/tools-ki && ./install.sh)
# mgit: back to Homebrew (removing the link exposes /opt/homebrew/bin/mgit)
rm ~/.local/bin/mgit ~/.local/share/man/man1/mgit.1
# harnesses: back to verified archives (then restore the ranking - see Failed)
ki dev local off knowledgeislands/ki-agentic-harness && chezmoi apply --force ~/.config/ki/config.toml
ki dev local off humansnotrobots/hnr-agentic-harness && chezmoi apply --force ~/.config/ki/config.toml
# chezmoi content: revert the commit
git -C ~/.local/share/chezmoi revert ae73787 && chezmoi apply ~/.claude/CLAUDE.md ~/.config/ki/config.toml
```
