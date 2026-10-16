# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio setup](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › site-extlinks

**Run report at 21:36 BST · last mark 21:34 BST (run start)**

---

## Done

- On rig.midnight.ninja, every tool link with the external-link arrow now opens in a new tab, in all three views (Table, Sections, Gallery). The arrow comes from one shared macro, the tool-name link in `apps/site-rig/src/_includes/partials/rig-macros.njk`, and the fix is there. The guides have no arrow, so their links are unchanged, as are internal links.
- A new test in `apps/site-rig/tests/site.test.ts` checks every link with the arrow on every published page. It failed before the fix and passes now.
- The typecheck passes, and `bun run test` passes in full: 24 site tests and 5 boundary tests.
- Commit `90b7509` (`fix(site-rig): open tool links marked external in a new tab`) is pushed to `krisb/apps-rig.midnight.ninja` `main`. Nothing new had arrived upstream, so no rebase was needed. Local `HEAD` and `origin/main` are the same.
- The live site is confirmed. `/build.json` reports commit `90b7509`, and all 546 tool links on the homepage carry `target="_blank" rel="noopener noreferrer"`.

## In Progress

Nothing.

## Queries

None.

```text
╭─ run report · 2026-10-16T20:36:21Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [pushed] apps-rig.midnight.ninja main: 90b7509, live

```text
Resume Rig › Mac Studio setup under current ki-pmo and ki-delegation since 21:36 BST: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
