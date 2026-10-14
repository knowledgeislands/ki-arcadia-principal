# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) › push-check

**Run report at 20:41 BST · last mark 17:47 BST**

---

## Done

Run on sol, locally, under Decision 74 (PUSH-CHECK, Kris's "keep goimng please"). Two of the four repositories are pushed and now level with origin. tools-ki is not pushed: it has a record-number clash. chezmoi had nothing to push. Nothing else was touched: no force-push, no `--no-verify`, no apply, and no secrets read.

| Repository | Local commits | Rebase | Gate | Pushed |
| --- | --- | --- | --- | --- |
| chezmoi | none (already level with `origin/main` at `2fbcca1`) | not needed | not run | nothing to push |
| tools-rig | `98420fc`, `1506d47`, `b7cf6b3` (tool-records: KI-TOOL-RIG-CORE-054/055 captured, KI-TOOL-RIG-CORE-042 promoted) | not needed (not behind) | passes† | `c650bfe..b7cf6b3` |
| ki-agentic-harness | `4eaa1905`, `3ea44f8f`, `dfe1a197` (rig-guide and remit-done: KI-HARNESS-GOV-189 amendments) | rebased cleanly onto 6 origin commits, now `928a39c2`, `0401f21c`, `0b66f900` | passes‡ | `d881b031..0b66f900` |
| tools-ki | `a4bb37bf`, `8b6bc803` (tool-records: KI-TOOL-KI-CLI-128/129) | **stalled rebase found; record-number clash** | not run | **no** |

† tools-rig: `rumdl check` and `git diff --check` are clean on the 4 changed roadmap files. `ki repo audit` reports 8 RUNTIMES-2 failures in `.ki.toml` and 1 HOOK-1 warning. A detached copy of `origin/main` has the same findings plus one more, so the local commits add none.
‡ ki-agentic-harness: `rumdl check` and `git diff --check` are clean on the one changed file, `docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md`. `ki repo audit` fails TSC-1, KNIP-2, CAP-2 (`skills/README.md`) and 8 × RUNTIMES-2. `origin/main` has the same failure lines, so they already exist there and the docs-only local commits add none.

Each local commit was matched to a report in this thread's run folder: [tool-records](tool-records.report.md), [rig-guide](rig-guide.report.md) and [remit-done](remit-done.report.md).

## In Progress

Nothing is running. tools-ki is left exactly as I found it, part-way through a rebase (see TOOLS-KI-CLASH).

## Queries

### TOOLS-KI-CLASH - tools-ki record numbers clash with origin

**Context:** At 18:54 BST, an earlier session that is no longer running started a `git pull` that rebases sol's tools-ki `main`. That pull stopped on a conflict in `docs/roadmap/_ISSUES.md` and was left unfinished. Since then, `origin/main` has also gained `3c316fcb`. Origin had already issued **KI-TOOL-KI-CLI-128** as `KI-TOOL-KI-CLI-128-granola-retention-safeguards.md` (Kris, `3019c394`, 15:25 BST). sol's local commits reserve and capture KI-TOOL-KI-CLI-128 (launch footer follows brief) and KI-TOOL-KI-CLI-129 (reused agent name overwrites). These are tool-records' K2 and K3. The brief says to renumber nothing silently, so I did not abort, resolve or push. The two local commits are safe on `main` (`8b6bc803`).

**Query:** How should sol's two tools-ki records be numbered so they can be pushed?

**Options:**
a) (recommended) An agent on sol aborts the stalled rebase, which restores `main` to `8b6bc803`, then pulls with rebase. It renumbers the two local records to KI-TOOL-KI-CLI-129 and KI-TOOL-KI-CLI-130: ledger reserved through 130, files renamed, ids and links updated. It runs the tools-ki gate and pushes fast-forward only.
b) Abort the stalled rebase only and leave tools-ki unpushed until terra's session settles the numbering.
c) Leave it as it is for Kris to resolve by hand at sol.

```text
TOOLS-KI-CLASH - a) an agent on sol aborts the stalled tools-ki rebase (main back to 8b6bc803), pulls with rebase, renumbers sol's two records to KI-TOOL-KI-CLI-129 and KI-TOOL-KI-CLI-130 (ledger through 130, files renamed, ids and links updated), runs the tools-ki gate and pushes fast-forward only
```

```text
╭─ run report · 2026-10-14T19:41:08Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] TOOLS-KI-CLASH
- [uncommitted] checkpoint
- [unpushed] thread folder

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
