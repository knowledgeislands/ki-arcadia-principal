# state-cleanup report

Authority: state-of-play Decision 34 (DEL-1 to DEL-5, approved 2026-10-10). No commits and no pushes were made. No remote calls were made: branch checks used the local `origin/main` refs.

`du -sh ~/.local/state`: **1.5G before, 421M after** (about 1.1 GB reclaimed).

## Done

- **DEL-1 (758 MB):** Removed the four territory-selection-codex worktrees and deleted their local branches. All four were clean apart from ignored build output.
  - ki-agentic-harness `…/harness` (8b1a0592), tools-ki `…/ki` (b019e10) and tools-mgit `…/mgit` (ee3f905) were ancestors of `origin/main`.
  - ki-arcadia-principal `…/arcadia-retirement-d1d59dbd` (e8f8d68) was not an ancestor, but `git cherry` showed that its one commit is patch-equivalent to a commit already in `origin/main`.
  - None of the four had a remote-tracking branch, so no remote branch was deleted.
- **DEL-2 (~330 MB):** Deleted the rest of `claude-bg/territory-selection-codex-20261007-2133` (1.1G including worktrees) and the `ki/agents/territory-selection-codex-20261007-2133` link.
- **DEL-3 (~13 MB):** Deleted `claude-bg/{gov-020 (11M), techne (2.1M), tower-split (24K), delegation-brief.md, adopt-arcadia (empty)}`, then removed `~/.local/state/claude-bg`, which was empty. `~/.claude/projects` was not touched.
- **DEL-5 (~8.8 MB):** Deleted `ki/agents/{gov-020 (2.3M), territory-selection (5.4M), gov144-smoke (20K), gov144-smoke-1791446770 (20K)}` and `ki/state-of-play` (1.1M).
- Ran `git worktree prune` in all four repositories. None of them lists a territory-selection worktree any more.

## Failed

- **DEL-4 not done (143 MB kept):** `ki/mcp-acquire-whatsapp/spool-onedrive-backup-20260930` failed the required name-and-size check. The live `spool` and `auth` were not touched.
  - All 24,279 backup files exist by name in the live spool (24,516 files). No names are missing.
  - 13 files differ in size, and the live copy is larger in every case:
    - two `Chats/*/2026-09-30.md` day files: the backup copy is an exact prefix of the live copy, so messages were appended
    - the root `README.md` and nine per-chat `README.md` indexes: these were regenerated with updated dates and message counts
    - `.meta/presentation.json`: this was regenerated with a new generation and source sequence
  - My reading is that the live spool supersedes the backup and no data exists only in the backup. The brief required matching sizes, though, so I held the deletion rather than guess.

## Needs Kris

- Decide on DEL-4: approve deleting the backup despite the 13 superseded index and day files described above, or keep it. To delete it: `rm -rf ~/.local/state/ki/mcp-acquire-whatsapp/spool-onedrive-backup-20260930`.
