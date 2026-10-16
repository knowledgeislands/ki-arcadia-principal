# [Platform foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md) › [tools-burndown](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/tools-burndown.md) › git-hygiene

**Run report at 01:34 BST · last mark none**

---

## Done

- **mgit gap analysis.** `mgit` 0.17.0 has no report of open PRs, merged or stale branches, stashes or untracked files. Ahead and behind appear only inside `mgit sync`, which pulls and then pushes any commits that are ahead. `mgit worktree list` and `mgit worktree status` cover worktrees, showing their branch, any prunable or locked state, and whether each is clean or dirty. `doctor`, `diag` and `repair` cover configuration only. `ki repo` already accepts the same `--estate`, `--territory`, `--principals` and `--filter` selectors, so the fleet-wide selection exists on both sides.
- **Fleet survey.** I ran a read-only survey across the 50 repositories in `mgit --estate`, using local refs only with no fetch and no GitHub API call. Remote-tracking refs were fresh, under an hour old, in most repositories, but were 13 to 14 hours old in legal-principal and 5g-emerge-phase3. No repository has a stash or a linked worktree. kw-website, hnr-backend, hnr-frontend and hnr-shared are not in the mgit estate. Per-query facts are under Queries.
- **Triage record.** I captured [KI-TOOL-KI-CLI-140](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-140-git-hygiene-estate-audit.md), "Git hygiene estate audit", as `status: triage`. It cites the mgit gap analysis and is the only new record. It went in as two tools-ki commits: `6b63959d` reserves the number in the ledger and `f133faf0` captures the record. The scoped `ki repo audit` passes; its one failure is the existing ki-engineering DEPS-1 finding, which is outside this change. Hooks passed. Both commits are pushed fast-forward to `origin/main`.
- **Rubric routing.** I added one REPO-GIT-HYGIENE handoff line to the Messages block of the [ways-of-working checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md). It asks that thread to add the PR and branch clean-down criteria to the `ki-git` rubric. It is committed locally as ki-principal `ddbecda` and is **not pushed**, because nine commits from other sessions of this thread and state-of-play sit beneath it (`433826e` to `097b789`).
- Nothing was deleted, pruned or dropped, locally or remotely.

## In Progress

Nothing.

## Queries

### STALE-BRANCHES

**Context:** All three of these branches are fully contained in `main`: the chezmoi local branch `agent/add-hermes-agent` (89 days old, upstream gone), chezmoi `origin/phase7-sweep`, and ki-principal `origin/hold/2026-10-15/working-state`, which is patch-equivalent to `main`. Each of the following still has commits that are not on `main`:

| Repository | Remote branch | Commits not on `main` | Age (days) |
| --- | --- | --- | --- |
| chezmoi | `rig-public-by-default` | 1 | 0 |
| tools-ki | `fix/granola-retention-20261014`, with [KI-TOOL-KI-CLI-128](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-128-granola-retention-safeguards.md) still a draft | 3 | 1 |
| tools-ki | `paperclip/aligned-20260926/KIS-46-…` | 1 | 18 |
| legal-principal | `command-center-v1` | 21 | 86 |
| legal-principal | `rescue/cc-001-exec` | 12 | 86 |
| 5g-emerge-phase3 | `site-foundation` | 2 | 11 |
| hnr-agentic-harness | `paperclip/…/HNR-30-…` | 2 | 18 |
| hnr-agentic-harness | `paperclip/…/HUM-21-…` | 2 | 19 |
| hnr-principal | `paperclip/…/HNR-15-…` | 4 | 4 |
| hnr-principal | `paperclip/…/HNR-49-…` | 1 | 4 |
| infoschematics | `worktree-agent-abd13720a30e3e0ad` | 3 | 4 |
| apps-vallearmonia.com | `rescue/VA-9-…` | 1 | 14 |
| apps-vallearmonia.com | `rescue/va-web-gov-003-reconcile-va-7` | 8 | 14 |
| apps-vallearmonia.com | nine `seed/*` branches, one from Kris and eight from Mark Howarth | 1 or 2 each | 66 to 73 |
| va-principal | `rescue/va-principal-gov-003-…-va-6` | 1 of 2 not equivalent | 14 |
| va-principal | `task/va-6-company-operations` | 1 | 11 |

**Query:** Which stale branches may be deleted now?

**Options:**

a) (recommended) This thread's run deletes the three fully merged branches: chezmoi's local `agent/add-hermes-agent`, and on `origin` chezmoi's `phase7-sweep` and ki-principal's `hold/2026-10-15/working-state`. Every branch that still has commits not on `main` stays until its territory owner decides, with the Paperclip and rescue branches going to their territory threads. b) Delete only the local chezmoi branch and keep every remote branch for now. c) Keep them all until [KI-TOOL-KI-CLI-140](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-140-git-hygiene-estate-audit.md) lands.

### AUTOMATION-BRANCHES

**Context:** The estate has no `dependabot/*` or `renovate/*` branches; hnr-frontend, which is outside the estate, has seven `dependabot/*` branches. Five `automation/*` release branches remain. ki-agentic-harness `automation/ki-v0.10.0` is patch-equivalent to `main`. Four are superseded but still carry one unique commit each: ki-agentic-harness `automation/ki-v0.10.2` (pins `v0.10.2`, while main pins `v0.10.4`), apps-knowledgeislands.info `automation/tool-release-ki-v0.10.0` and `automation/tool-release-ki-v0.8.1`, and homebrew-tap `automation/formula-ki-v0.8.0`. According to the state-of-play query review, `ki-v0.10.2` backs ki-agentic-harness PR #27 and `tool-release-ki-v0.8.1` backs apps-knowledgeislands.info PR #23. This run did not re-check PRs, because it made no GitHub call.

**Query:** May the superseded release automation branches and their PRs be cleared?

**Options:**

a) (recommended) This thread's run closes apps-knowledgeislands.info #23 and ki-agentic-harness #27 with the comment "superseded by a later release", then deletes all five `automation/*` branches on `origin`. b) Delete only `automation/ki-v0.10.0`, which is patch-equivalent to `main`, and leave the PRs open. c) Leave them until [KI-TOOL-KI-CLI-140](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-140-git-hygiene-estate-audit.md) defines the rule.

### UNPUSHED-COMMITS

**Context:** Three `main` branches are ahead of `origin`, none with this run's commits apart from ki-principal `ddbecda`:

- chezmoi is ahead 5 and behind 3, so it has diverged. Its commits are `bd04386` and `120069f` from mac-studio-setup, `554c2cd` and `1c43872` from another session, and the merge `0123ab1`.
- ki-agentic-harness is ahead 4: `628762e7` from mac-studio-setup beneath three of ways-of-working's own. This is OTHER-PUSH.
- ki-principal is ahead 10: nine commits from this thread and state-of-play, from `433826e` to `097b789`, then this run's `ddbecda`.

Ten checkouts are only behind: acquire 1, apps-knowledgeislands.info 1, homebrew-tap 1, legal-principal 2, 5g-emerge-phase2 7, va-principal 1, si-principal 2, tmx-principal 4 and er-principal 3. `mgit sync` would also push any commits that are ahead, so it is not a safe way to catch these up while stacks belong to other sessions.

**Query:** Who pushes each stack, and how are the behind checkouts levelled?

**Options:**

a) (recommended) This thread pushes ki-principal's ten commits fast-forward at its next resting point, mine included. Rig: chezmoi reconciles chezmoi's divergence and pushes. ways-of-working answers OTHER-PUSH for ki-agentic-harness. The checkouts that are only behind are levelled with `mgit --estate pull --ff-only`, not `mgit sync`. b) Kris pushes each stack by hand.

### STAGING-LEFTOVERS

**Context:** These leftovers are all still present, even though the first wave assigned them:

- ki-principal: `-/KI-ARCADIA-MOD-001-reading-order.html`, `-/_CONTEXT/chatgpt/` and `-/_DIGESTS/`, plus the untracked `+/_THREADS/desk-kit/setup-note.report.md`.
- apps-knowledgeislands.info: `+/brand-visuals-from-arcadia/` and `+/_LEGACY_HANDOFFS/`.
- kw-website does not ignore `tmp/`, though no `tmp/` folder exists today.
- `~/.local/state/ki/agents/mac-studio-setup/` holds 455 files.

No repository in the estate has a stash or linked worktree, and no other repository has uncommitted staging-area changes.

**Query:** Who clears the remaining staging leftovers?

**Options:**

a) (recommended) This thread's next run clears the ki-principal `-/` and apps-knowledgeislands.info `+/` leftovers by explicit path, each only once its durable home is confirmed, and adds `tmp/` to the kw-website `.gitignore`. desk-kit commits or removes its own untracked report, and Rig: mac-studio-setup tidies its own state folder. b) Leave them to the first-wave run's owner to finish.

```text
STALE-BRANCHES: a) This thread's run deletes the three fully merged branches: chezmoi's local `agent/add-hermes-agent`, and on `origin` chezmoi's `phase7-sweep` and ki-principal's `hold/2026-10-15/working-state`. Every branch that still has commits not on `main` stays until its territory owner decides, with the Paperclip and rescue branches going to their territory threads.
AUTOMATION-BRANCHES: a) This thread's run closes apps-knowledgeislands.info #23 and ki-agentic-harness #27 with the comment "superseded by a later release", then deletes all five `automation/*` branches on `origin`.
UNPUSHED-COMMITS: a) This thread pushes ki-principal's ten commits fast-forward at its next resting point, mine included. Rig: chezmoi reconciles chezmoi's divergence and pushes. ways-of-working answers OTHER-PUSH for ki-agentic-harness. The checkouts that are only behind are levelled with `mgit --estate pull --ff-only`, not `mgit sync`.
STAGING-LEFTOVERS: a) This thread's next run clears the ki-principal `-/` and apps-knowledgeislands.info `+/` leftovers by explicit path, each only once its durable home is confirmed, and adds `tmp/` to the kw-website `.gitignore`. desk-kit commits or removes its own untracked report, and Rig: mac-studio-setup tidies its own state folder.
```

```text
╭─ run report · 2026-10-16T00:34:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] STALE-BRANCHES
- [waiting] AUTOMATION-BRANCHES
- [waiting] UNPUSHED-COMMITS
- [waiting] STAGING-LEFTOVERS
- [unpushed] ki-principal `ddbecda` (ways-of-working handoff line) above nine other-session commits

Resume line: `Resume Fnd: tools-burndown under current ki-pmo and ki-delegation since 2026-10-16T00:05:00Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.`
