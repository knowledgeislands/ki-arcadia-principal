# [Knowledge Islands](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Charter.md) › State of play › query-review

**Run report at 01:03 BST · last mark 16:14 BST**

---

## Done

I checked all 17 open queries against the current state on sol and changed nothing. I read the checkpoints, decisions logs and run reports of the live threads, the Git state of the 22 Knowledge Islands checkouts and the chezmoi source, `mgit` and `ki` help, the `ki-git` rubric, and the public SSH key fingerprints. Limitations: `git fetch --prune` refreshed the remote-tracking refs, and that was all it touched. As the task asked, `gh pr list` ran read-only against GitHub, although the general rule in the brief forbids GitHub calls. STASH-DROP can only be checked on terra.

| Query | Still current | What changed | Confidence | Reversible | Kris present | Proposed owner |
| --- | --- | --- | --- | --- | --- | --- |
| FW-DECLARE-NOW | Yes | `dot_config/rig/conf.d/private_45-firewall.toml` is still missing from the chezmoi source, and Git has never held it. Rig: chezmoi's checkpoint has not been resumed since it was reinstated: it still reads `state: drained`, and FW-DECLARE, SEAT-BIND, SEAT-HOSTS and PAPERCLIP-OFF have not been started. sol runs Rig 0.6.3+dev, so the 0.6.0 condition is met. | High for the source commit | Yes, but connection-critical at apply time | Only for the terra firewall steps | Message to Rig: chezmoi, wave 2 (see CHEZMOI-RESUME) |
| SSH-SPARE-KEY | Yes, and more urgent | Terra went key-only at about 00:29 BST. [KB-DOTFILES-UE-088](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-088-ssh-alias-for-sol.md) records the verified apply, so passwords are now refused there. sol still accepts passwords, with no drop-in yet. Each Mac trusts only the one RSA 2048 key (`SHA256:CrQT…UQkdk`), and there is no spare. `Host terra` is now in the managed SSH config, which settles SSH-TERRA-ALIAS. | High | Yes, but connection-critical | Yes, at both Macs | Kris by hand, before the sol key-only apply. Rig: chezmoi records the fingerprint |
| ESTATE-MAP-OBSERVATORY | Yes | The [Command centre](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/command-centre.md) Project note still does not mention the Estate Map. | High | Yes; internal | No | This thread's run, wave 1 |
| STASH-DROP | Partly overtaken | The ref and the stash are gone from sol's ki-principal checkout. Everything they held is on main. Terra could not be checked from here. | High | Yes in effect (the content is on main) | No | This thread, at its next session on terra, wave 1 |
| THREADS-CHECKINS | Partly overtaken | Nobody has taken it up by name. KI Model: ways-of-working's REPORTING-FORMS draft ([reporting-forms report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/reporting-forms.report.md)) covers part of it: plain conversational replies, and the heartbeat and turn budget kept to coordinating threads. That draft is waiting on FORMS-AGREE. | Medium | Yes; internal | Yes (a conversation) | Message to ways-of-working: fold it into FORMS-AGREE, wave 2 |
| CHURN-REMEDIES | Partly acted on | Ways-of-working adopted THREADS-CONTENT, THREADS-TMP-HOME, THREADS-TELL and THREADS-CLEAR at 22:31 BST on 15 October, which covers remedies 3 and 5. The `ki-pmo` change for them, `c068e4be`, is in ki-agentic-harness but not pushed. [KI-HARNESS-GOV-195](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-195-thread-folder-closed-list.md) and [KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md) carry them. Remedies 1 (reports out of Git), 2 (commit once per mark) and 4 (leftover sweep at a hold) are not started. | High | Yes; internal | No | Message to ways-of-working, wave 1 |
| OLD-THREAD-FOLDERS | Partly overtaken | Under THREADS-CLEAR each owning thread clears its own folder at its next mark. `mac-studio-bootstrap/` is now `mac-studio-setup/`, which holds 63 tracked files: `adobe-remove.sh`, five favicon files and two untracked dry-run logs. `tools-burndown/` (35 files, 5 reports with a Queries section) and `pilot-test1/` (1 file) have no live owner. | High | Yes (Git history); internal | No | This thread's run for the two orphaned folders. Message to Rig: mac-studio-setup for its own folder. Wave 1 |
| STALE-BRANCHES | Yes | Fully merged: chezmoi `agent/add-hermes-agent` and `origin/phase7-sweep`. Patch-equivalent to main: harness `automation/ki-v0.10.0`. Superseded but unique: harness `automation/ki-v0.10.2` (pin `v0.10.2`; main pins `v0.10.4`), both `automation/tool-release-ki-*` branches in apps-knowledgeislands.info, and homebrew-tap `automation/formula-ki-v0.8.0`. Unique and unproven: tools-ki `fix/granola-retention-20261014` (3 commits; [KI-TOOL-KI-CLI-128](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-128-granola-retention-safeguards.md) is still in draft) and `paperclip/aligned-20260926/KIS-46…` (1 commit). Two of these branches back open PRs (see STALE-PRS). | High for the merged and patch-equivalent branches; medium for the rest | No; outward | No; approval only | This thread's run, wave 2 |
| UNPUSHED-COMMITS | Overtaken, but recurring | The original three repositories are now level with origin. There are new stacks. ki-agentic-harness `main` is 4 ahead: `628762e7` from Rig: mac-studio-setup, beneath three of ways-of-working's own, which is its OTHER-PUSH. chezmoi `main` is 5 ahead: `bd04386` and `120069f` from mac-studio-setup, `554c2cd` and `1c43872` from another session, and a merge commit `0123ab1`, which is its PUSH-STACK. | High | No; outward | No; approval only | Answered through OTHER-PUSH and PUSH-STACK in those threads, wave 2 |
| STAGING-LEFTOVERS | Yes | ki-principal `-/KI-ARCADIA-MOD-001-reading-order.html`, `-/_CONTEXT/chatgpt/` and `-/_DIGESTS/` are all still there. So are apps-knowledgeislands.info `+/brand-visuals-from-arcadia/` and `+/_LEGACY_HANDOFFS/`. kw-website still does not ignore `tmp/`. The runtime state folder is now `~/.local/state/ki/agents/mac-studio-setup/`, with 455 files. On sol it also holds that thread's machine-local `decisions.md`. | High for the staging areas and the ignore; medium for the state folder | Yes (Git history, tarball); internal | No | This thread's run for the staging areas and the ignore. Message to Rig: mac-studio-setup for its state folder. Wave 1 |
| SRC-BADGE | Yes | The SRC badge is still in all 10 `docs/diagrams/skill-area-*.html` files on harness main. No record carries it. | High | Yes; internal | No | Message to ways-of-working, wave 1 |
| AUTOMATION-BRANCHES | Yes, folded into STALE-BRANCHES | `ki-v0.10.0` is patch-equivalent to main. `ki-v0.10.2` backs open PR #27. | High | No; outward | No; approval only | With STALE-BRANCHES, wave 2 |
| FRONTMATTER-STATE | Overtaken in the standard | `ki-pmo` (`2007749e`, pushed) now says "checkpoint frontmatter keeps `state: active`" and keeps status in the pick-up block, which is option a). Eight checkpoints still read `state: drained`: state-of-play, command-centre, observatory, baseline-rollout, estate-factorisation, registry-removal, rig.chezmoi and techne.agent-host. | High | Yes; internal | No | This thread's run, wave 1 |
| DESIGN-HOME | Changed | `2007749e` graduated the restart-model note into `ki-pmo`, so option a)'s trigger ("deletes it when it graduates") has fired. The note is still in `Streams/Projects/ways-of-working/design/`. | High | Yes; internal | No | Message to ways-of-working, wave 1 |
| TOOLS-PROJECT | Yes | tools-ki has 13 open records. Six already belong to Projects: four to ways-of-working, one to agent-host and one to knowledge-acquisition. Seven have no Project: [KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md), [KI-TOOL-KI-CLI-133](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-133-retired-reports-come-back.md) (ready), [KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md), [KI-TOOL-KI-CLI-135](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-135-reused-agent-name-overwrites.md), [KI-TOOL-KI-CLI-136](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-136-errors-suggest-fixes.md), [KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md) and [KI-TOOL-KI-CLI-138](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-138-warn-unknown-record-fields.md). Three of those seven came from ways-of-working decisions. tools-mgit and tools-git-almanac have no open records. ki-agentic-harness has no CLI-shaped open record; the only one without a Project is [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md), which is about moving threads. No existing Project covers the seven. `tools-burndown/` has no checkpoint and no Project note. | Medium: the scope is small and mostly tools-ki | Yes; internal | No; one decision | This thread's run creates the Project note once Kris confirms the scope, wave 2 |
| REPO-GIT-HYGIENE | Yes | `mgit` has no branch or PR report. Its `sync` pushes commits that are ahead, and `doctor`, `diag` and `repair` cover only configuration. `ki repo audit --skill ki-git` passes on tools-ki with one mechanical criterion and seven judgment criteria. The only mechanical criterion is RUBRIC-1, the catalogue check. BRANCH-2 covers linked worktrees only, and nothing in the rubric checks remote branches or open PRs. There are 2 open PRs across the Knowledge Islands repositories: apps-knowledgeislands.info #23 (`automation/tool-release-ki-v0.8.1`, 7 October) and ki-agentic-harness #27 (`automation/ki-v0.10.2`, 14 October). Every other repository has none. The paperclip fork was not counted. | Medium: it needs design and new records | Yes for the records; fleet-wide runs are outward | No; one decision | The new tools Project, with the `ki-git` part handed to the harness, wave 2 |

**Proposed first wave:** high confidence, reversible, internal, and no Kris needed. These items go in this order:

1. This thread's run on ki-principal, chained because the items share the checkout. It sets `state: active` on the eight drained checkpoints (FRONTMATTER-STATE). It adds the Estate Map idea to the Command centre Notes (ESTATE-MAP-OBSERVATORY). It deletes `pilot-test1/` and the answered tools-burndown files, keeping `decisions.md` and `historical-decisions.md` (OLD-THREAD-FOLDERS, orphaned part). It clears the ki-principal `-/` leftovers once each has a durable home (STAGING-LEFTOVERS).
2. In parallel, this thread's run on kw-website conforms the `tmp/` ignore. On apps-knowledgeislands.info it clears `+/brand-visuals-from-arcadia/` and `+/_LEGACY_HANDOFFS/` once their durable home is checked (STAGING-LEFTOVERS).
3. One message to KI Model: ways-of-working, covering CHURN-REMEDIES (remedies 1, 2 and 4, since 3 and 5 are covered), SRC-BADGE (capture with `ki-next`) and DESIGN-HOME (delete the graduated restart-model note).
4. One message to Rig: mac-studio-setup to clear its own thread folder under THREADS-CLEAR and archive its spent runtime files, keeping its `decisions.md`.
5. STASH-DROP at this thread's next session on terra.

**Wave 2**, once you have answered: STALE-BRANCHES with AUTOMATION-BRANCHES, HOLD-BRANCH-DROP and STALE-PRS (outward); UNPUSHED-COMMITS through OTHER-PUSH and PUSH-STACK (outward); FW-DECLARE-NOW through CHEZMOI-RESUME; SSH-SPARE-KEY (you, at both Macs); THREADS-CHECKINS with FORMS-AGREE; TOOLS-PROJECT, then REPO-GIT-HYGIENE.

## In Progress

Nothing is running.

- This report is committed by explicit path as `docs(threads): add the query-review run report`. It is pushed fast-forward only if the commits stacked with it are mine alone.

Outstanding - no action requested now

- ki-principal has an untracked `+/_THREADS/desk-kit/setup-note.report.md` from another session, and `mac-studio-setup/` has two untracked adobe dry-run logs. I left both alone.
- Local `main` lags origin by 2 commits in tools-ki and by 1 in each of apps-knowledgeislands.info and homebrew-tap. Nothing is unpushed in any of them.

## Queries

### HOLD-BRANCH-DROP - delete ki-principal `hold/2026-10-15/working-state`

**Context:** The branch was kept only until Rig: mac-studio-setup settled `chezmoi-fix.report.md`. Its one commit is now patch-equivalent to main, because it landed with the mac-studio-setup rename, so nothing on the branch is unique. Deleting a remote branch is outward-facing.

**Query:** May the remote branch be deleted now?

**Options:**

a) (recommended) This thread's run deletes `origin/hold/2026-10-15/working-state` in ki-principal after re-checking with `git cherry` that it is patch-equivalent to main.
b) Keep it until the next hold review.

### CHEZMOI-RESUME - Rig: chezmoi has not picked up its reinstatement

**Context:** Rig: chezmoi was reinstated at 22:09 BST on 15 October. Its checkpoint still reads `state: drained`, updated 15:00Z, and its FW-DECLARE, SEAT-BIND, SEAT-HOSTS, PAPERCLIP-OFF and REINSTATE lines have not been started. Your live list names `Chezmoi > misc (sol)`, so it is not clear which session owns this checkpoint. Separately, chezmoi `main` on sol is 5 commits ahead of origin, including a merge commit.

**Query:** Which session carries the Rig: chezmoi checkpoint's messages?

**Options:**

a) (recommended) You paste Rig: chezmoi's resume line into `Chezmoi > misc (sol)`, which then treats `rig.chezmoi.md` as its checkpoint and starts with FW-DECLARE, as the source commit only, with no apply.
b) Open a separate Rig: chezmoi session for it and keep `Chezmoi > misc (sol)` conversational.

### STALE-PRS - close the two stale automation PRs

**Context:** apps-knowledgeislands.info #23 (`automation/tool-release-ki-v0.8.1`, 7 October) and ki-agentic-harness #27 (`automation/ki-v0.10.2`, 14 October) are the only open PRs in the Knowledge Islands repositories. Both are pin or release branches superseded by later releases: ki is now at 0.10.5, and harness main pins `v0.10.4`. Merging #27 would downgrade the pin. Closing a PR is outward-facing.

**Query:** May both PRs be closed, with a one-line reason, before their branches are deleted under STALE-BRANCHES?

**Options:**

a) (recommended) This thread's run closes #23 and #27 with the comment "superseded by a later release", then deletes their branches with the rest of STALE-BRANCHES.
b) Leave the PRs open until REPO-GIT-HYGIENE defines the rule.

### FIRST-WAVE - start the first wave

**Context:** The first wave above covers FRONTMATTER-STATE, ESTATE-MAP-OBSERVATORY, the orphaned part of OLD-THREAD-FOLDERS, STAGING-LEFTOVERS (staging areas and the kw-website ignore), CHURN-REMEDIES, SRC-BADGE, DESIGN-HOME, mac-studio-setup's own tidy and STASH-DROP. Every item is high-confidence, reversible through Git history and internal, and none needs you present. Pushes are fast-forward only, of each run's own commits.

**Query:** May the first wave run in the order proposed?

**Options:**

a) (recommended) Run the first wave as proposed: one chained ki-principal run, one parallel kw-website and apps-knowledgeislands.info run, one message each to ways-of-working and mac-studio-setup, and STASH-DROP at the next terra session.
b) Run only the messages now and hold the deletions for your review.

```text
HOLD-BRANCH-DROP

This thread's run deletes origin/hold/2026-10-15/working-state in ki-principal after re-checking with git cherry that it is patch-equivalent to main.

---

CHEZMOI-RESUME

Kris pastes Rig: chezmoi's resume line into Chezmoi > misc (sol), which treats /Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.chezmoi.md as its checkpoint and starts with FW-DECLARE as a source commit only, with no chezmoi apply or rig apply.

---

STALE-PRS

This thread's run closes apps-knowledgeislands.info #23 and ki-agentic-harness #27 with the comment "superseded by a later release", then deletes their branches with the rest of STALE-BRANCHES.

---

FIRST-WAVE

Run the first wave as the query-review report proposes: one chained ki-principal run (checkpoint frontmatter to state: active on the eight drained checkpoints, the Estate Map idea in the Command centre Notes, delete +/_THREADS/pilot-test1/ and the answered tools-burndown files keeping decisions.md and historical-decisions.md, clear the -/ leftovers once each has a durable home); one parallel run on kw-website (tmp/ ignore through ki repo) and apps-knowledgeislands.info (+/brand-visuals-from-arcadia/ and +/_LEGACY_HANDOFFS/ once homed); one message to KI Model: ways-of-working (CHURN-REMEDIES remedies 1, 2 and 4; SRC-BADGE captured with ki-next; delete the graduated restart-model design note); one message to Rig: mac-studio-setup (clear its thread folder under THREADS-CLEAR and archive spent runtime files, keeping decisions.md); STASH-DROP at the next terra session.
```

```text
╭─ run report · 2026-10-16T00:03:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] HOLD-BRANCH-DROP
- [waiting] CHEZMOI-RESUME
- [waiting] STALE-PRS
- [waiting] FIRST-WAVE
- [committed] this report

```text
Resume Master: state-of-play under current ki-pmo and ki-delegation since 2026-10-15T15:14:39Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
