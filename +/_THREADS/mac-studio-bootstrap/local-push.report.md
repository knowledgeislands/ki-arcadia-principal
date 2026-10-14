# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) › local-push

**Run report at 00:52 BST · last mark 17:47 BST**

---

## Done

- chezmoi: only `098309e` (KB-DOTFILES-UE-091 planning trigger) was ahead and nothing was behind, so the fast-forward pull had nothing to do. `rumdl check .` passed with 88 files clean. `node --test` ran 243 tests: 239 passed and 2 failed. The failures are `tests/ki-self-skill.test.mjs` and "the real source's isolated exit 40 reaches the wrapper reporter". Both also fail on a clean worktree of origin/main, and the commit changes only one roadmap document, so they existed before it. Pushed `5548280..098309e` to `main`. `dot_gitconfig` is still modified, unstaged and untouched.
- tools-rig: only `db5ae29` and `608eba9` (KI-TOOL-RIG-CORE-057) were ahead and nothing was behind. Every check in the Develop Rig gate passed except one warning from `ki repo audit`. That warning is HOOK-1 (no committed pre-commit hook), which was there before. The other results: shellcheck passed, the `bash -n` syntax check passed, `assemble-rig --check` passed, `benchmark-rig` stayed within budget, `smoke-native-providers` passed, bats passed 544 of 544, and `mandoc` lint and `git diff --check` were both clean. When I came to push, `origin/main` was already at `608eba9`. The reflog records a push from this checkout at 00:48 BST that did not come from this run, probably a concurrent session. So this run pushed nothing to tools-rig. Both repositories are now level with origin.

## In Progress

Nothing.

## Queries

None.

```text
╭─ run report · 2026-10-14T23:52:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · no queries              │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] local-push finished, nothing running from this run
- [uncommitted] this report; `dot_gitconfig` in chezmoi (not this run's)
- [unpushed] thread folder

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
