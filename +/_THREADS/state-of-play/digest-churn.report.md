# [Knowledge Islands](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Charter.md) › State of play › digest-churn

**Run report at 22:14 BST · last mark 16:14 BST**

---

## Done

- **Earlier remarks found and folded in.** Kris's SOL-FIRST-CHURN request is in the [state-of-play decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/decisions.md) and the [state-of-play checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/_state-of-play.md). The rules that cause the churn come from the [ways-of-working decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/decisions.md): DECISION-HOME (13 October: run reports and decisions logs are tracked under `+/_THREADS/<thread>/`) and THREAD-TIDY (14 October: answered reports are deleted at each mark). No separate churn query was found in another thread or in the agent inboxes, and there are no `inbox.md` files on this machine. `+/_Voice Notes/` does not exist in this checkout.
- **Churn measured** across 23 repositories: the 22 under `~/workspaces/knowledge-islands/` plus the chezmoi source. The window is 24 September to 15 October 2026, all branches, commits authored by Kris (agent commits included). A bookkeeping-only commit is one that touches nothing but thread folders, checkpoints, decisions logs, run reports, `+/_BATCHES/` or `Calendar/`.

| Measure | ki-principal | Other 22 repos | All |
| --- | --- | --- | --- |
| Commits | 896 | 3,550 | 4,446 |
| Bookkeeping-only commits | 412 (46%) | 99 (2.8%) | 511 (11.5%) |
| Lines added / removed by them | 33,485 / 20,037 | 112,110† / 1,058 | 145,595 / 21,095 |
| Bookkeeping files created | 511 | 100 | 611 |
| ...of which deleted again in the window | 362 (71%) | 36 | 398 |
| Run reports deleted from `+/_THREADS/` | 411 | - | - |
| Busiest day | 14 Oct: 150 of 199 commits | - | - |

† 111,000 of these lines are skill-review scratch HTML that a thread committed to `ki-agentic-harness` `+/_THREADS/skill-reviews/` and later removed.

- **What causes it.** Thread bookkeeping causes it. Session and Calendar digests do not: `Calendar/` had 1 commit in the window, and `-/_DIGESTS/` has not been touched since June. By commit type: `docs(checkpoint[s])` 285, `docs(threads)` 120, and `+/_BATCHES/` run artefacts 81 (the 2-9% in chezmoi, `tools-rig`, `apps-observatory.local`, `tools-ki` and the `mcp-*` repositories). Four rules produce nearly all of it:
  1. Every background run commits its report to the tracked thread folder (DECISION-HOME).
  2. The thread commits and pushes its checkpoint and folder at every owner report and resting point.
  3. Each owner decision is logged and committed in the turn it arrives. "record" is the leading verb in 136 checkpoint and thread commits.
  4. THREAD-TIDY then deletes most of those reports at the next mark.

  The result is a create, commit, push, delete cycle: 71% of the bookkeeping files created in ki-principal were deleted again within three weeks.
- **Busiest threads**, counted as file touches in bookkeeping-only commits (folder plus checkpoint): State of play 391, KI Model: ways-of-working 295, Techné 168, Rig: mac-studio-bootstrap 119, Rig: chezmoi 114, tools-burndown 57, skill-reviews (harness) 56, Acquire: knowledge-acquisition 60.
- **Leftovers found.** There are no stashes and no worktrees in any of the 23 repositories. The other leftovers are listed under Queries.
- **Ranked remedies.** Each is a thread-model rule, so each goes to KI Model: ways-of-working ([Project](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md)):
  1. **Run reports stay out of Git unless they carry an open query.** A run writes its report to the state folder `~/.local/state/ki/agents/<thread>/`. Only a report with an open query is copied into `+/_THREADS/`, and its outcome goes to the checkpoint or a record. This narrows DECISION-HOME and makes most THREAD-TIDY deletions unnecessary. It belongs in the `ki-delegation` background-run standard and the `ki-pmo` thread working rules. Expected cut: most of the 120 `docs(threads)` commits and the 411 report deletions.
  2. **Commit the checkpoint and decisions log once per mark or resting point, not once per turn or decision.** The decision is still written into the log in the turn it arrives, but it is committed in batches. This belongs in `ki-pmo` and `ki-checkpoint`. Expected cut: most of the 285 checkpoint commits.
  3. **Batch run artefacts live in `tmp/` or state, with only the outcome in the record.** This belongs in `ki-batch`; ways-of-working routes it to the KI Agentic Harness. Expected cut: 81 commits spread over 10 repositories.
  4. **A leftover sweep at every hold or drain.** It covers unpushed commits, stale branches, stray untracked files, spent runtime files in the agent state folders, and `tmp/` coverage. This belongs in the `ki-pmo` hold procedure and in `ki agent`, where the pruning would be a `tools-ki` handoff.
  5. **Kris's `tmp/` rule written down.** It goes into the `ki-repo` managed ignore block and the `ki-delegation` brief rules. `tmp/` is ignored everywhere except `kw-website`.
- **Read-only throughout.** I changed nothing in any repository. My scratch scripts are under the ignored `tmp/digest-churn/` in ki-principal. The only commit is this report (identifier under In Progress).

## In Progress

- This report is committed locally as `docs(threads): add the digest-churn run report`, by explicit path, and is **not pushed**. Local `main` also carries two unpushed commits from another session (`a91113d` and `15dd380`, the adobe-remove script and its run report), and `origin/main` is two commits ahead. The stack is not only mine, so pushing waits for the state-of-play thread or the owning session to rebase and push.
- The state-of-play `hold-branches` run is folding the `hold/2026-10-15/*` branches in ki-principal and `ki-agentic-harness`. This report leaves those branches to it.

Outstanding - no action requested now

- The checkout has an uncommitted `+/_THREADS/state-of-play/decisions.md`, which belongs to the thread and was not touched.
- `paperclip` carries 1,027 remote refs from its upstream fork. These are upstream's and need nothing.

## Queries

### CHURN-REMEDIES - hand the five ranked remedies to ways-of-working

**Context:** Thread bookkeeping is 46% of ki-principal's commits, and 71% of the files it creates are deleted again. Remedies 1 and 2 above would remove most of it. They change the thread model, so they belong to KI Model: ways-of-working, which is held.

**Query:** Should the five remedies go to ways-of-working as its first work when it is reinstated?

**Options:**

a) (recommended) Hand remedies 1-5 to KI Model: ways-of-working as one change at its reinstatement, with remedies 1 and 2 first and this report as the evidence.

b) Apply remedy 2 alone now as an interim practice in every thread, and hand the rest over later.

### OLD-THREAD-FOLDERS - tidy thread folders that THREAD-TIDY has not reached

**Context:** `+/_THREADS/tools-burndown/` holds 35 files, including JSON evidence and a brief, and has no checkpoint. Only 5 of its reports carry a Queries section. `+/_THREADS/pilot-test1/` holds one answered pilot report. `mac-studio-bootstrap` holds 56 files, including favicon PNG and SVG files and an untracked `adobe-remove.sh`, and `chezmoi` holds 14. THREAD-TIDY has not run on any of them since the hold.

**Query:** May the closed folders be tidied now, and the live ones at their next mark?

**Options:**

a) (recommended) A background run deletes, by explicit path, the `pilot-test1` folder and every answered report, evidence and brief file in `tools-burndown`, keeping its `decisions.md` and `historical-decisions.md`. It moves `adobe-remove.sh` and the favicon files to `tmp/`. Rig: chezmoi and Rig: mac-studio-bootstrap apply THREAD-TIDY at their next mark.

b) Leave every folder to its owning thread's next mark.

### STALE-BRANCHES - delete old release and work branches

**Context:** Several branches look spent:

- Release automation branches on `origin`: `automation/tool-release-ki-v0.8.1` and `v0.10.0` in `apps-knowledgeislands.info`, `automation/formula-ki-v0.8.0` in `homebrew-tap`, and `automation/ki-v0.10.0` and `v0.10.2` in `ki-agentic-harness`, dated 7-14 October.
- In `tools-ki`: `origin/fix/granola-retention-20261014` and `origin/paperclip/aligned-20260926/KIS-46...` (27 September).
- In chezmoi: local `agent/add-hermes-agent` (18 July) and `origin/phase7-sweep` (12 October).

`origin/rig-public-by-default` in chezmoi is from today and is left alone. Deleting a remote branch is outward-facing.

**Query:** May branches that are fully merged or superseded be deleted?

**Options:**

a) (recommended) A background run checks each branch listed here. It deletes, locally and on `origin`, those whose commits are all on `main` or whose release has shipped, and reports the rest back as a query.

b) Keep them all for now.

### UNPUSHED-COMMITS - three repositories ahead of origin

**Context:** These commits were made today and are ahead of `origin`. They are probably Rig: mac-studio-bootstrap work, whose checkpoint is the only one still `active`:

- `apps-observatory.local`: 1 commit (Observatory tab icon).
- `tools-ki`: 2 commits ([KI-TOOL-KI-CLI-136](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-136-errors-suggest-fixes.md) reservation and capture).
- `tools-rig`: 3 commits ([KI-TOOL-RIG-CORE-059](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-059-mac-app-store-provider.md) and the Mac App Store provider).

I did not push them, because they are not this run's commits.

**Query:** Who pushes them?

**Options:**

a) (recommended) Rig: mac-studio-bootstrap confirms they are its commits and pushes them fast-forward at its next resting point. State of play checks that they have landed.

b) Kris pushes them by hand.

### STAGING-LEFTOVERS - old material in staging areas, runtime state and ignores

**Context:** The following material is left over:

- ki-principal `-/` still holds `KI-ARCADIA-MOD-001-reading-order.html`, which uses an old name, and `-/_CONTEXT/chatgpt/`. `-/_DIGESTS/` is an unused scaffold from June.
- `apps-knowledgeislands.info` `+/` holds 25 `brand-visuals-from-arcadia` files and `_LEGACY_HANDOFFS`, last touched 12 October.
- `~/.local/state/ki/agents/mac-studio-bootstrap/` holds 424 spent runtime files.
- `kw-website` does not ignore `tmp/`.

**Query:** May this material be cleared?

**Options:**

a) (recommended) A background run checks that each item has a durable home or is superseded, then deletes it by explicit path. It archives the spent runtime files older than the last mark into a dated tarball in the state folder, and conforms `kw-website`'s ignore block through `ki repo` so that `tmp/` is ignored.

b) Clear only the runtime files and the `kw-website` ignore, and leave the staging areas to their islands.

```text
CHURN-REMEDIES

Hand remedies 1-5 from the digest-churn report to KI Model: ways-of-working as one change at its reinstatement, remedies 1 (run reports stay out of Git unless they carry an open query) and 2 (commit checkpoint and decisions log once per mark or resting point) first, with /Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/digest-churn.report.md as the evidence.

---

OLD-THREAD-FOLDERS

A background run deletes by explicit path +/_THREADS/pilot-test1/ and every answered report, evidence and brief file in +/_THREADS/tools-burndown/, keeping decisions.md and historical-decisions.md, and moves +/_THREADS/mac-studio-bootstrap/adobe-remove.sh and the favicon files to tmp/; Rig: chezmoi and Rig: mac-studio-bootstrap apply THREAD-TIDY at their next mark.

---

STALE-BRANCHES

A background run checks each branch in the STALE-BRANCHES query (automation/* release branches in apps-knowledgeislands.info, homebrew-tap and ki-agentic-harness; tools-ki fix/granola-retention-20261014 and paperclip/aligned-20260926/KIS-46...; chezmoi agent/add-hermes-agent and phase7-sweep), deletes locally and on origin those fully on main or whose release shipped, and reports the rest as a query; origin/rig-public-by-default is left alone.

---

UNPUSHED-COMMITS

Rig: mac-studio-bootstrap confirms the unpushed commits in apps-observatory.local (1), tools-ki (2) and tools-rig (3) are its own and pushes them fast-forward at its next resting point; State of play checks they have landed.

---

STAGING-LEFTOVERS

A background run checks each item in the STAGING-LEFTOVERS query has a durable home or is superseded and deletes it by explicit path (ki-principal -/KI-ARCADIA-MOD-001-reading-order.html, -/_CONTEXT/chatgpt/, -/_DIGESTS/; apps-knowledgeislands.info +/brand-visuals-from-arcadia/ and +/_LEGACY_HANDOFFS/), archives spent runtime files in ~/.local/state/ki/agents/mac-studio-bootstrap/ older than the last mark into a dated tarball there, and conforms kw-website's ignore block through ki repo so tmp/ is ignored.
```

```text
╭─ run report · 2026-10-15T21:14:55Z ──────────────╮
│                                                  │
│  █▀▀▄ █  █ █▀▀▀ █  █   · thread busy             │
│  █▀▀▄ █  █ ▀▀▀█  ▀█▀   · running or queued work  │
│  █▄▄▀ █▄▄█ ▄▄▄█   █    · lines below say which   │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [running] hold-branches - fold or discard the hold/2026-10-15 branches
- [waiting] CHURN-REMEDIES
- [waiting] OLD-THREAD-FOLDERS
- [waiting] STALE-BRANCHES
- [waiting] UNPUSHED-COMMITS
- [waiting] STAGING-LEFTOVERS
- [unpushed] ki-principal main: this report plus two other-session commits; origin two ahead
- [uncommitted] state-of-play decisions.md, the thread's own
