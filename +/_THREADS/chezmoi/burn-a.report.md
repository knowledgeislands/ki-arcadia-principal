<!-- rumdl-disable-file MD041 -->
# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [chezmoi](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/chezmoi.md) › burn-a

**Run report at 00:50 BST · last mark 23:11 BST**

---

## Done

- **KB-DOTFILES-UE-082:** commit `97c69fb` (plus `0e9cf6e`, which keeps an open review step the audit requires). `mcp-servers-json` now resolves a bare command with `lookPath`; a missing tool omits that server with a `warnf` and the apply completes. New test renders one present and one absent command. Other `output` calls are only the `op_cache` lookups and the hooks manifest hash.
- **KB-DOTFILES-UE-086 A8:** commit `f8cf28b`. Declared `tool.adobe-photoshop` and `tool.adobe-creative-cloud` (studio, artefact-only) and gave `tool.davinci-resolve` the `mas` route `571213070`; the studio test now expects the four tools. A8 is **not ticked**: see query 1. Photoshop's path `/Applications/Adobe Photoshop 2026/Adobe Photoshop 2026.app` is the Adobe convention, not read from `sol`; Creative Cloud's path was confirmed on this Mac.
- **KB-DOTFILES-UE-077 (read-only):** all `op://` references resolve. The nine references name five distinct items in one vault, all found. `~/.cache/op-cache` holds 5 files, exactly the five referenced items: no stale entries. `bin/chezmoi/op_cache` is a script, not a cache. Nothing changed, no value read.
- **Checks:** `node --test tests/*.test.mjs` 238 tests, 236 pass, 0 fail (2 not counted as pass). `ki repo audit --repo .` PASS=19 WARN=2 FAIL=0 (warnings: ADR-003 history section, no `.githooks/pre-commit`, both existing). `rumdl check .` clean. `rig doctor` ran once before the edits (findings=0); it reads the applied catalogue, so it cannot see source changes until an apply, which I did not run. Nothing pushed; no lock files.

## In Progress

Nothing is running.

## Queries

**1. Keynote, Numbers and Pages.** **Context:** they are already declared in `core`, catalogue-only, under a comment saying `mas` cannot resolve iWork ADAM IDs; the A8 text asks for App Store installs with ids from `mas list` on `sol`, which I cannot read. **Query:** how should A8 finish? **Options:** a) (recommended) Keep them catalogue-only and tick A8; the iWork apps ship with the Mac. b) Add `mas` routes (Keynote 409183694, Numbers 409203825, Pages 409201541) after checking `mas list` on `sol`.

```text
Reply:
1. a) Keep Keynote, Numbers and Pages catalogue-only and tick A8.
```

```text
╭─ run report · 2026-10-15T23:50:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] resume: reply to the query above.
