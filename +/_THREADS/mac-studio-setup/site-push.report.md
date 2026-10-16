# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio setup](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › site-push

**Run report at 23:55 BST · last mark 23:51 BST**

---

## Done

- SITE-ACTUAL: Actual is gone from the software guide (`apps/site-rig/src/guides/software.md`). That left the section with no finance tool, so its heading changed from "Finance, reading, media, and games" to "Reading, media, and games". Nothing links to the old heading. Commit `f858b68`, `docs(guides): remove Actual from the software guide`.
- SITE-SPARK: The Spark line now reads **Spark Desktop** — one mail client on every machine. I used the em dash and full stop the rest of the list uses, not a plain hyphen. Commit `c909493`, `docs(guides): describe Spark Desktop as the one mail client everywhere`.
- SITE-PRIVATE: No change. 1Password, its CLI and Tower are still named in the guide.
- SITE-PUSH: `cef3f96` and `e9503fd` rebased onto `origin/main` (`550a946`) without conflict, becoming `dbefb53` and `c416154`, so there was no need to re-pull the catalogue. Both commits were staged by explicit path, and the pre-commit hook (rumdl) passed on each.
- Checks after the rebase: `bun run self:typecheck` passed. `bun run test` passed: the site has 23 tests and all passed, including 550a946's "never holds a tool Kris restricted from the public view", and the 5 boundary tests also passed. `ki repo audit --repo .` reports 1 FAIL, but it is old and unrelated: the roadmap record [KB-MIDNIGHT-RIG-SITE-001](/Users/krisbrown/workspaces/personal/apps-rig.midnight.ninja/docs/roadmap/KB-MIDNIGHT-RIG-SITE-001-show-hosts-per-tool.md) has no horizon, no `baseline_ref` and the wrong body order. This push did not touch that record. There are also 2 warnings, about a `dev` task in turbo.json and a missing `.githooks/pre-commit`.
- Pushed `550a946..c909493` to `origin/main`, with no force and no hook skipped. The local branch now matches `origin/main`.
- Deploy confirmed live at 23:55 BST, about a minute after the push. On <https://rig.midnight.ninja/guides/software/> the Spark Desktop line and the new heading show and Actual is gone. The bootstrap guide shows the `op vault list` step from `e9503fd`, and the catalogue shows 101 tools.
- Two parts of the brief conflicted. Its appended Rules footer says "never push" and "no remote call", but the task itself names this push and the fetches with your quoted SITE-PUSH decision. I followed the task. It also gave two report paths. This report goes to `+/_THREADS/mac-studio-setup/`, the one the task names, and is not committed.

## In Progress

Nothing is running.

Outstanding - no action requested now

- The roadmap shape failure on [KB-MIDNIGHT-RIG-SITE-001](/Users/krisbrown/workspaces/personal/apps-rig.midnight.ninja/docs/roadmap/KB-MIDNIGHT-RIG-SITE-001-show-hosts-per-tool.md) keeps `ki repo audit` red until that record is brought into shape or accepted.

## Queries

None.

```text
╭─ run report · 2026-10-15T22:55:29Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [pushed] apps-rig.midnight.ninja `main` c909493, live
