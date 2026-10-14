# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › diagrams-tidy

**Run report at 22:35 BST · last mark 22:35 BST**

---

## Done

- By 22:33 BST, before this run started, the untracked `+/diagrams/` folder had already been removed from `ki-agentic-harness`, so there was nothing to commit or delete. `+/diagrams/skill-map/mark.toml` was gone with it. No `mark.toml` exists anywhere in the repository, and none of its tools or skills reads or writes one, so this run cannot recover it or tell which session removed it.
- Classification: everything the tools write under `+/diagrams/` can be rebuilt. `build-html.ts` writes `+/diagrams/<slug>/<slug>.html` and `+/diagrams/<slug>/build/`, and the ki-repo-harness skill-map and skill-area contexts read from the same place. The [ki-diagrams standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-diagrams/references/standards-diagrams.md) says builds are "rebuilt locally under `+/diagrams/<slug>/` and never committed", and the educate mode says "Keep `+/diagrams/` out of version control". The durable forms are committed under `docs/diagrams/`. Under `commit_html = true` ([KI-HARNESS-GOV-193](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-193-area-diagrams-with-html.md)), each diagram's HTML is copied there.
- Commit `fcad8a1e` (`chore(gitignore): ignore local diagram builds under +/diagrams`) adds `+/diagrams/` to the unmanaged, repository-specific section of `.gitignore`. That folder is the narrowest path that covers every build output, and no managed ignore block owns it. Pre-commit hooks passed. `git pull --rebase` was a no-op, `origin/main..HEAD` contained only this commit, and the push was fast-forward to `origin/main`. The working tree is clean. The remote reported its usual "Required status check build is expected" bypass notice.
- I used no `--no-verify` and no force-push, and I left no other files dirty. Everything was staged by explicit path.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- Another session recorded `mark.toml` but it was not in the folder when this run started. If that agent's mark-tidy work still needs it, that agent will have to write it again. Note that the new ignore covers all of `+/diagrams/`, so any future state file there stays out of Git.

## Queries

No outstanding queries

```text
No reply needed.
```

```text
╭─ run report · 2026-10-14T21:35:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [committed] ki-agentic-harness `fcad8a1e`, pushed
