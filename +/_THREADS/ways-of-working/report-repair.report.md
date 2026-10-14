# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › report-repair

**Run report at 23:37 BST · last mark 23:26 BST**

---

## Done

- **This thread's reports are relinked.** This was done under Kris's "REPORT-REPAIR - approve: an agent relinks this thread's own reports once the gate is unblocked". Four reports had record identifiers that were bare or pointed at stale links: `eco014-close`, `harness-accept`, `mark` and `sync-telemetry`. In those four, every full identifier now links to its local file by absolute path. A pruned record now links to GitHub at the parent of its prune commit, for example [KI-HARNESS-GOV-193 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/c092431687d3542e55058cecd545e816a1dbadcf/docs/roadmap/KI-HARNESS-GOV-193-area-diagrams-with-html.md) and [KI-TOOL-KI-CLI-132 (pruned)](https://github.com/knowledgeislands/tools-ki/blob/9fe5811469cda1464e9ed43585374bbc8a14f0d8/docs/roadmap/KI-TOOL-KI-CLI-132-launcher-only-thread-writer.md). Old links to deleted local files were rewritten in the pruned form. `inception-type` has no identifiers. I resolved every target from the checkouts and their Git history and invented no link. I left short forms alone where they appear inside quoted words, namely Kris's "so GOV-193 is done" and a quoted commit subject. Commit: `924a89e5` in ki-principal. The commit gate passed, scoped to the 4 staged paths.
- **PMO-7 is raised to failure level.** This was done under Kris's "LINK-LEVEL - keep the link check at warning; raise it to failure once this thread's reports are repaired". The change is in `skills/change-management/ki-pmo/scripts/rubric/items/threads.ts`. `ki dev skill rubric ki-pmo --write` and `ki dev skill generate ki-pmo --write` both report that the generated surfaces are already in sync, because `rubric.md` does not print the level. Commit: `8a453bcd` in ki-agentic-harness, and its commit gate passed.
- **Harness checks:** `bun run test` passed (1188 tests, 0 failures), and `bunx tsc --noEmit` is clean. `ki repo audit --skill ki-pmo` fails with 4 PMO-7 findings. All four are in `+/_THREADS/skill-reviews/` (`area-layout`, `functional-pass` and `regroup`), the untracked reports of Kris's layout session. They point at the pruned [KI-HARNESS-GOV-193 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/c092431687d3542e55058cecd545e816a1dbadcf/docs/roadmap/KI-HARNESS-GOV-193-area-diagrams-with-html.md). I did not touch them.
- **ki-principal checks:** `bunx tsc --noEmit` is clean. `bun run test` cannot run because ki-principal has no `test` script. `ki repo audit --skill ki-pmo` now fails with 64 PMO-7 findings. They come from other threads' reports: baseline-rollout, chezmoi, knowledge-acquisition, mac-studio-bootstrap, pilot-test1, state-of-play, techne and tools-burndown. There are also 3 ki-checkpoint findings on other threads' checkpoints. The only ways-of-working finding is in `principal-links.report.md`, a dirty file from another session (see below). This failure does not block commits: the commit gate selects only the `ki-repo-kb` skills and scopes its verdict to staged paths.
- **Limitation, checkpoint not relinked.** The brief asks for the checkpoint to be relinked but also says "Do not edit any checkpoint". I left it untouched. See CHECKPOINT-LINKS.

## In Progress

Nothing is running.

- **Not pushed (ki-principal).** `origin/main..HEAD` is `95e4dc9c` (another session: "docs(ways-of-working): describe the skill map, area diagrams and thread model"), then my `924a89e5`, then `19eef4a6` (another session: "docs(threads): link the pruned record in the principal-links report"). Origin has not moved. A fast-forward push of mine would carry `95e4dc9c`, so I held it. `git pull --rebase` also refuses to run while other sessions have dirty files in the shared tree.
- **Not pushed (ki-agentic-harness).** My `8a453bcd` sits on top of seven commits I did not make. Three of them are Kris's layout work (`a830b6ed`, `58d41ccc` and `9a495773`), and four belong to harness-accept (`c0924316`, `b7f35cdf`, `5ec6ad28` and `8f400524`), so I held the push. The [KI-HARNESS-GOV-193 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/c092431687d3542e55058cecd545e816a1dbadcf/docs/roadmap/KI-HARNESS-GOV-193-area-diagrams-with-html.md) link will resolve on GitHub only after that push.
- **Dirty from another session, left alone:** `+/_THREADS/ways-of-working/principal-links.report.md` in ki-principal. The many dirty `docs/diagrams/` and `skills/repo-structure/ki-repo-harness/` paths in ki-agentic-harness belong to Kris's layout session.

Outstanding - no action requested now

- The rubric flags 64 PMO-7 findings across other threads' reports in ki-principal. Each thread owns repairing its own reports; this is in PMO-7-BACKLOG below.

## Queries

### CHECKPOINT-LINKS - relink the ways-of-working checkpoint

**Context:** The brief asked for the checkpoint to be relinked but also barred any checkpoint edit, so I left it alone. The [ways-of-working checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md) leaves seven identifiers unlinked:

- [KI-PRINCIPAL-ECO-014](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md)
- [KI-HARNESS-GOV-193 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/c092431687d3542e55058cecd545e816a1dbadcf/docs/roadmap/KI-HARNESS-GOV-193-area-diagrams-with-html.md)
- [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md)
- [KI-TOOL-KI-CLI-132 (pruned)](https://github.com/knowledgeislands/tools-ki/blob/9fe5811469cda1464e9ed43585374bbc8a14f0d8/docs/roadmap/KI-TOOL-KI-CLI-132-launcher-only-thread-writer.md)
- [KI-HARNESS-GOV-192 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/73f43a1b08d7a0ef4b8d0853b1b6a6752d508bee/docs/roadmap/KI-HARNESS-GOV-192-scoped-gate-verdict.md)
- [KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md)
- [KI-TOOL-KI-CLI-130](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-130-skill-generated-surfaces.md)

It also has two stale local links, to GOV-193 and CLI-132. The PMO-7 rubric does not read checkpoints, so this does not fail the audit.

**Query:** Should the checkpoint be relinked, and by whom?

**Options:** a) (recommended) The ways-of-working thread relinks its own checkpoint at its next mark, using the targets above. b) Leave the checkpoint as it is until the next full rewrite.

### PUSH-CARRY - push commits that carry other sessions' work

**Context:** In ki-principal, my `924a89e5` sits between two commits from other sessions: `95e4dc9c` below it and `19eef4a6` above it. In ki-agentic-harness, my `8a453bcd` sits on Kris's layout commits `a830b6ed`, `58d41ccc` and `9a495773` and on harness-accept's `c0924316`, `b7f35cdf`, `5ec6ad28` and `8f400524`. Origin has not moved in either repository, so both pushes would be fast-forward. Neither can go without carrying commits I did not make.

**Query:** May both repositories be pushed fast-forward, carrying those commits?

**Options:** a) (recommended) Push ki-principal `main` fast-forward now, carrying `95e4dc9c` and `19eef4a6`. Push ki-agentic-harness `main` fast-forward once the layout session confirms its commits are ready. b) Hold both pushes until each owning session pushes its own commits.

### PMO-7-BACKLOG - other threads' reports now fail PMO-7

**Context:** At failure level, `ki repo audit --skill ki-pmo` on ki-principal reports 64 PMO-7 findings across eight other threads' report folders. On the harness it reports 4, in Kris's `skill-reviews` reports. Commits are not blocked, because the commit gate scopes to staged paths and does not select ki-pmo, but the full audit stays red until those threads repair their reports.

**Query:** How should the other threads' unlinked reports be repaired?

**Options:** a) (recommended) Each thread relinks or deletes its own reports at its next mark under the thread-tidy rule, and the state-of-play thread tells each one so. b) Launch one sweep agent to relink every thread's reports in ki-principal.

```text
CHECKPOINT-LINKS

The ways-of-working thread relinks its own checkpoint at its next mark: KI-PRINCIPAL-ECO-014, KI-TOOL-KI-CLI-126, KI-TOOL-KI-CLI-130 and KI-TOOL-KI-CLI-131 to their local files, and KI-HARNESS-GOV-192, KI-HARNESS-GOV-193 and KI-TOOL-KI-CLI-132 as pruned GitHub links at the parent of their prune commits, as listed in report-repair.report.md.

---

PUSH-CARRY

Push ki-principal main fast-forward now, carrying 95e4dc9c and 19eef4a6 with report-repair's 924a89e5; push ki-agentic-harness main fast-forward, carrying a830b6ed, 58d41ccc, 9a495773, c0924316, b7f35cdf, 5ec6ad28 and 8f400524 with report-repair's 8a453bcd, once the layout session confirms its commits are ready.

---

PMO-7-BACKLOG

Each thread relinks or deletes its own reports at its next mark under the thread-tidy rule, and the state-of-play thread tells each one so.
```

```text
╭─ run report · 2026-10-14T22:37:36Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] CHECKPOINT-LINKS
- [waiting] PUSH-CARRY
- [waiting] PMO-7-BACKLOG
- [unpushed] ki-principal 924a89e5 and ki-agentic-harness 8a453bcd, held for PUSH-CARRY

```text
Resume ways-of-working under current ki-pmo and ki-delegation since 23:26 BST: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
