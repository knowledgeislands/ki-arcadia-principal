# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio setup](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › thread-tidy

**Run report at 18:20 BST · last mark 17:47 BST**

---

## Done

- **Thread folder tidied** in `fbaf8e3 docs(threads): tidy the mac-studio-setup thread folder`. It is on `origin/main`: another session's push, `e473337` from Ways of working, carried it before my own pull, so I had nothing left to push. The folder now holds six kept reports, this report, and the untracked `core059-prune.report.md` from another run.
- **Kept reports:** gov189-finish (GOV195-DUP), ue086-walk (UE-086 steps 0 to 12), hostkey-check (HOSTKEY-APPLY 6 to 9), ssh-keyonly (key-only walk-through), adobe-script (ADOBE-RUN-SOL, ADOBE-SCRIPT-TERRA and ADOBE-RUN-TERRA, none in the decisions log yet) and launcher-footer (FOOTER-RECORD held). I checked every other report. Its query tags were either in the decisions log or overtaken by later events: SOL-MAS-REMOVE was done at sol's screen, LIGHTROOM-CC was overtaken by ADOBE-OUT, TOOLS-KI-CLASH was settled by PUSH-CHECK and the renumbered tools-ki records, UE091-PUSH's `098309e` is already on chezmoi `origin/main`, and MAS-MIGRATE-ORDER was overtaken by the migrate-mas run. So no other report needed keeping.
- **56 reports deleted** with `git rm`, each by explicit path.
- **Work products homed** with `git mv` in [the Project folder](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md): [adobe-remove.sh](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/adobe-remove.sh) and [favicons-headroom.svg](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/favicons-headroom.svg). The Project note has no file list, so it needed no entry. I deleted the four favicon PNG previews: only the deleted favicons report used them, and the Observatory icon lives in `apps-observatory.local`. The two git-ignored Adobe dry-run logs are now in `~/.local/state/ki/agents/mac-studio-setup/archive/`.
- **Kept reports repointed.** Every adobe-script command now reads `cd ~/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup && ./adobe-remove.sh`, and ue086-walk links the report and the moved script. In launcher-footer, the links to deleted reports point at GitHub at `84e5882`. In gov189-finish, the dead link now goes to the renumbered [KI-HARNESS-GOV-200](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-200-thread-folder-closed-list.md).
- **PMO-7 and NOTE-1a:** `ki repo audit --paths` on the six kept reports and the Project folder passes with FAIL=0. The only warning is the Project's STREAM-10 close-out reminder, outside this brief. All six reports open with their `#` heading and no `---` rules, so NOTE-1a does not apply to them and none needed tools-burndown's `<!-- markdownlint-disable-file MD041 -->` line. The commit gate's own audit also passed on the 68 staged paths. The audit does **not** pass for the folder as a whole. The one failure is `core059-prune.report.md`, which leaves [KI-TOOL-RIG-CORE-059 (pruned)](https://github.com/knowledgeislands/tools-rig/blob/9b4de28918972ec1e5d05a6b084219d77f7f0fb3/docs/roadmap/KI-TOOL-RIG-CORE-059-mac-app-store-provider.md) unlinked. That report belongs to another run and I did not touch it (CORE059-REPORT below).
- **Runtime files archived:** I moved 485 finished-run files (launch records, status, logs, pids, prompts, briefs, queued briefs, dry-run and evidence files, report copies) into `~/.local/state/ki/agents/mac-studio-setup/archive/`. Nothing was deleted. Left in place: `decisions.md`, `inbox.md`, `thread.json`, the dispatcher's `queue.jsonl`, `dispatch.log` and `dispatch.pid` (the dispatcher is not running), and this run's own files. After the move, `ki agent status` lists only this run.
- **HOLD-BRANCH:** the copy on `origin/hold/2026-10-15/working-state` (`5924fcf`) is discarded and the branch is untouched. I told state-of-play with `ki agent decide state-of-play ... --log`, which appended a dated entry to `~/.local/state/ki/agents/state-of-play/inbox.md`. That file did not exist before, so this is its first entry.

## In Progress

Nothing is running from this run.

Outstanding - no action requested now:

- The audit's PMO-9 rule flags hostkey-check, launcher-footer and ssh-keyonly as answered in the decisions log. I kept them because they hold the steps Kris still runs at the screen, as the brief directs. The thread deletes them once those steps are done.
- Other sessions' uncommitted files are untouched: `+/_CHECKPOINTS/rig.mac-studio-setup.md`, `+/_THREADS/chezmoi/decisions.md`, `+/_THREADS/desk-kit/setup-note.report.md` and `+/_THREADS/ways-of-working/restart-consolidate.report.md`.

## Queries

### CORE059-REPORT - Finish the core059-prune report

**Context:** The core059-prune run finished during this tidy. Its report, `+/_THREADS/mac-studio-setup/core059-prune.report.md`, is untracked, and it is the folder's only audit failure: PMO-7 finds KI-TOOL-RIG-CORE-059 unlinked. The record was pruned in tools-rig `1d4db6a`, so its link is [KI-TOOL-RIG-CORE-059 (pruned)](https://github.com/knowledgeislands/tools-rig/blob/9b4de28918972ec1e5d05a6b084219d77f7f0fb3/docs/roadmap/KI-TOOL-RIG-CORE-059-mac-app-store-provider.md). I did not edit it because it is another run's file.

**Query:** Should the thread link that identifier and commit the report?

**Options:**

a) (recommended) At its next resting point the thread links KI-TOOL-RIG-CORE-059 in the report as the pruned GitHub link above, reruns `ki repo audit --paths +/_THREADS/mac-studio-setup`, and commits and pushes the report by explicit path. Then it deletes the report once its outcome is homed.

b) Delete the report unread at the next tidy, leaving Git history without it.

### [GOV195-DUP](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-195-granola-screenshots-markers.md) - Close the duplicate-number query

**Context:** gov189-finish asks how to settle the two records numbered [KI-HARNESS-GOV-195](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-195-granola-screenshots-markers.md). Since then, ki-agentic-harness `ab48fec0` renumbered the thread-folder record to [KI-HARNESS-GOV-200](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-200-thread-folder-closed-list.md), so only one KI-HARNESS-GOV-195 remains and the duplicate is gone.

**Query:** May the thread log GOV195-DUP as resolved by that renumbering and delete gov189-finish?

**Options:**

a) (recommended) Log GOV195-DUP as resolved by ki-agentic-harness `ab48fec0`, which renumbered the record to KI-HARNESS-GOV-200, then delete `gov189-finish.report.md` by explicit path at the next tidy.

b) Keep gov189-finish until Kris has checked the roadmap audit in ki-agentic-harness at first hand.

```text
CORE059-REPORT

At the next resting point the thread links KI-TOOL-RIG-CORE-059 in +/_THREADS/mac-studio-setup/core059-prune.report.md as [KI-TOOL-RIG-CORE-059 (pruned)](https://github.com/knowledgeislands/tools-rig/blob/9b4de28918972ec1e5d05a6b084219d77f7f0fb3/docs/roadmap/KI-TOOL-RIG-CORE-059-mac-app-store-provider.md), reruns ki repo audit --paths +/_THREADS/mac-studio-setup, commits and pushes the report by explicit path, and deletes it once its outcome is homed

---

GOV195-DUP

Log GOV195-DUP as resolved by ki-agentic-harness ab48fec0, which renumbered the thread-folder record to KI-HARNESS-GOV-200, then delete +/_THREADS/mac-studio-setup/gov189-finish.report.md by explicit path at the next tidy
```

```text
╭─ run report · 2026-10-17T17:20:46Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] CORE059-REPORT
- [waiting] GOV195-DUP
- [committed] thread folder tidy, pushed; this report committed with it
- [uncommitted] checkpoint (another session's), core059-prune report (another run's)

```text
Resume Rig: mac-studio-setup under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
