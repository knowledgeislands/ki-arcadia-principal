<!-- markdownlint-disable-file MD041 -->

---

---

---

# [Platform foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md) › [Tools burndown](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/tools-burndown.md) › ki-principal-notes

**Run report at 02:04 BST · last mark none**

---

## Done

- **Step 1, Project note (`f88ce00`).** [Tools burndown](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/tools-burndown.md) now matches the inventory report's drift list:
  - [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) reads awaiting-review, released in `v0.10.5` and pinned, with only Verify 4 and acceptance left.
  - The revisions line now gives `tools-ki` at `f133faf0`, level with `origin/main`, and the harness at local `b4875ac1`, 4 commits ahead of `origin/main` `45bbaea6`. It also says `tools-mgit` has had no change since `v0.17.0`.
  - [KI-TOOL-KI-CLI-140](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-140-git-hygiene-estate-audit.md) is added to the inventory.
  - [KI-TOOL-KI-CLI-139](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-139-ebu-sources-sync.md) now has a local link, and the stale "two commits behind" sentence is gone.
  - Scope now lists the four coupled harness records: [KI-HARNESS-GOV-175](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md), [KI-HARNESS-GOV-195](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-195-thread-folder-closed-list.md), [KI-HARNESS-GOV-170](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-170-keep-resolution-targets-local.md) and [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md).
  - Scope also records three answers as Kris's overnight approval applied them. OWNER-LANE: tools-burndown is the single `tools-ki` writer, and the owning threads keep priority and acceptance input. RELEASE-CONTRACT: [KI-TOOL-KI-CLI-125](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-125-ki-release-contract.md) stays on Hold with the agent-host Project and is left out of both the burn-to-zero and the `ki` release gate. MGIT-RELEASE: an `mgit` release is cut only if `mgit` changes land, so otherwise `v0.17.0` stands.
  - **Limitation:** the frontmatter `outcome` line still says "every record closed, merged or rejected". The [KI-TOOL-KI-CLI-125](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-125-ki-release-contract.md) exception is written under Scope, not in the outcome line itself.
- **Step 2, OWNER-LANE messages (`ad0b78b`).** Both checkpoints were clean, and each got one dated line in its Messages from Master block:
  - [ways-of-working checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md): [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md), [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md), [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md), [KI-TOOL-KI-CLI-130](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-130-skill-generated-surfaces.md) and [KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md).
  - [knowledge-acquisition checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.knowledge-acquisition.md): [KI-TOOL-KI-CLI-128](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-128-granola-retention-safeguards.md) and [KI-TOOL-KI-CLI-139](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-139-ebu-sources-sync.md).
  - Nothing else in either file was changed.
- **Step 3, staging leftovers (`2f458df`).** Two of the three items were confirmed and removed by explicit path:
  - `-/KI-ARCADIA-MOD-001-reading-order.html` was a historical snapshot of the delivered and pruned MOD-001, moved to outbound in `ee71d10` with no live links. Its durable home is pushed `origin/main` history: [last revision](https://github.com/knowledgeislands/ki-principal/blob/6ca5269592d7ae795299e421c232faa104fb55b6/-/KI-ARCADIA-MOD-001-reading-order.html).
  - `-/_CONTEXT/chatgpt/README.md` (the folder's only file) is superseded by `krisb/acquire` `context/chatgpt/knowledge-islands/README.md`. That copy is committed and on `origin/main` there, and it was reviewed on 2026-10-12, later than this one's 2026-10-06. The personal-principal pointer says not to keep a second export. Nothing in ki-principal outside the thread reports referred to it. [Last revision](https://github.com/knowledgeislands/ki-principal/blob/6ca5269592d7ae795299e421c232faa104fb55b6/-/_CONTEXT/chatgpt/README.md).
  - `-/_DIGESTS/` was left in place. It holds no digests, only its `README.md` and `.gitkeep`. That README says it "remains as the capability boundary", and `-/Outbound.md` lists it as the session-digest staging area. It is a declared scaffold rather than a leftover, so see DIGESTS-SCAFFOLD.
  - `+/_THREADS/desk-kit/` was not touched.
- **Checks:** each commit passed the repository's commit hooks with no bypass. Only my own paths were staged, and nothing was pushed.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- ki-principal `main` is 15 commits ahead of `origin/main`: these three plus other sessions' stacked commits. Pushing is left to Kris.
- `+/_THREADS/desk-kit/setup-note.report.md` is still untracked. It belongs to another session and was left alone.
- The rest of STAGING-LEFTOVERS is outside this run's ki-principal part. That covers the apps-knowledgeislands.info `+/` items, the kw-website `tmp/` ignore and the agent state folder tidy.

## Queries

### DIGESTS-SCAFFOLD - keep or retire the empty `-/_DIGESTS/` scaffold

**Context:** STAGING-LEFTOVERS listed `-/_DIGESTS/` as an unused scaffold from June. It holds no digests. Its `README.md` says it "remains as the capability boundary" while `ki-repo-kb` is declared, and `-/Outbound.md` documents it as where session digests are staged. Removing it would leave `-/Outbound.md` out of step with the folder, and it would go against the `ki-repo-kb` digest convention.

**Query:** Should `-/_DIGESTS/` stay as the declared session-digest scaffold?

**Options:** a) (recommended) Keep it. It is a declared capability boundary, not a leftover, and STAGING-LEFTOVERS is closed for ki-principal. b) Retire it: remove `-/_DIGESTS/` and its row in `-/Outbound.md` under an Enactment record, and change the `ki-repo-kb` convention to match.

```text
DIGESTS-SCAFFOLD

Keep -/_DIGESTS/ in ki-principal as the declared session-digest scaffold that -/Outbound.md documents; treat STAGING-LEFTOVERS as closed for ki-principal.
```

```text
╭─ run report · 2026-10-16T01:04:42Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued in this run
- [waiting] DIGESTS-SCAFFOLD
- [unpushed] ki-principal main, 15 ahead including other sessions' commits
- [uncommitted] ki-principal-notes.report.md, left for the thread to commit
