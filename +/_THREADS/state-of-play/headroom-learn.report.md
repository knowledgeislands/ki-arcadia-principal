# Headroom: remove --learn from the default profile

## Done

- `--learn` is removed from the Headroom `default` profile. Its arguments are not set in chezmoi or Rig: the plist runs `run-headroom.sh`, which reads `proxy_args` from `~/.headroom/deploy/default/manifest.json`. That manifest was edited in place, so no target needed `chezmoi apply`. I reloaded `com.headroom.default` with `launchctl bootout` and `bootstrap`. Its proxy started without `--learn` (pid 99159).
- I captured the ownership gap, and the problems below, as a triage item: [KB-DOTFILES-UE-087](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-087-manage-headroom-profile-arguments.md).
- I updated [docs/guides/tools/headroom.md](/Users/krisbrown/.local/share/chezmoi/docs/guides/tools/headroom.md): it now says not to use `--learn` and where profile arguments live. Commit 56a71cb is pushed to `origin/main` as a fast-forward. Checks: `ki repo audit` passed with no failures and 3 warnings; `node --test` passed all 215 tests; `rumdl` found nothing.
- Tracked `CLAUDE.md` files in `~/workspaces` that still contain Headroom-learned blocks (not edited; for their owning threads):
  - `humans-not-robots/hnr-backend/CLAUDE.md`
  - `humans-not-robots/hnr-principal/CLAUDE.md`
  - `humans-not-robots/5g-emerge-phase2/CLAUDE.md` (hand-corrected block)
  - `knowledge-islands/apps-knowledgeislands.info/CLAUDE.md`
  - `knowledge-islands/ki-agentic-harness/CLAUDE.md`
  - `legal/legal-principal/CLAUDE.md`, plus its seven worktrees under `legal/.wt-legal/`: `acquire-reconcile`, `fr-costs-sje`, `fr-d11-mps`, `sar-york-lado`, `sarah-brief`, `sarah-catchup` and `sarah-pack`

## Failed

- `launchctl print` cannot show the job staying up. `com.headroom.default` was already crash-looping (522 runs) before this change. Every start exits at once with `--intercept-tool-results is not available in the current rollout channel (stable)`. Even if it started, it could not bind the port, because the `init-user` profile already serves `127.0.0.1:8787`, and that proxy runs without `--learn`. No running Headroom proxy uses `--learn`.

## Needs Kris

- Decide whether to keep the `default` profile at all, given that `init-user` serves the port, and if so how to end its crash loop. `runner.log` is about 110 MB and still growing. See [KB-DOTFILES-UE-087](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-087-manage-headroom-profile-arguments.md).
- A future `headroom install apply` for `default` could restore `--learn` until that item is done.
