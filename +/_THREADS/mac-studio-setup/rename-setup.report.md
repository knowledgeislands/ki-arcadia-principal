# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio setup](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › rename-setup

**Run report at 22:43 BST · last mark 17:47 BST**

---

## Done

- **Renamed in Knowledge Islands Principal** by `git mv`, in the commit `docs(streams): rename mac-studio-bootstrap to mac-studio-setup` that also carries this report:
  - the Project folder is now `Streams/Projects/mac-studio-setup/`, with index note `mac-studio-setup.md`, `slug: mac-studio-setup`, `title: Mac Studio setup` and H1 `# Mac Studio setup`;
  - the checkpoint is now [rig.mac-studio-setup](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.mac-studio-setup.md), with `thread: rig.mac-studio-setup`, `label: 'Rig: mac-studio-setup'` and H1. Its Thread working rules now name runs `mac-studio-setup`, the log `~/.local/state/ki/agents/mac-studio-setup/decisions.md` and reports in `+/_THREADS/mac-studio-setup/`. The Objective link now reads "Mac Studio setup", and the hosts-note and Project-note links point to the new paths. The history, the mark and every decision are unchanged;
  - the thread folder is now `+/_THREADS/mac-studio-setup/`.
- **Live notes, names and links updated:** [Rig Initiative](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md), [Projects](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/Projects.md) (heading `## Mac Studio setup` and link), [Host network](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/host-network.md), [Paperclip capture and rebuild](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/paperclip-capture-and-rebuild/paperclip-capture-and-rebuild.md), and the Project's `design/design.md`, `design/hosts.md` and `design/decisions-in-force.md`. The Project note and decisions-in-force now give the decisions-log path as `~/.local/state/ki/agents/mac-studio-setup/decisions.md`, which assumes the thread moves the state folder as planned.
- **Link targets only, prose untouched**, verified by a back-substitution check that leaves each file byte-identical to `HEAD` apart from link targets:
  - checkpoints: `_state-of-play.md` and `platform-foundations.estate-factorisation.md`;
  - other threads: `chezmoi/mark-tidy.report.md`, `chezmoi/pmo-adopt2.report.md`, and in `tools-burndown/`: `commit-thread.report.md`, `next-worker.brief.md`, `rebootstrap-oct14.report.md`, `rebootstrap-rules-correct.report.md`, `resume-accountability.report.md`, `resume-stock.report.md` and `rig-close.report.md`;
  - `Streams/Projects/ways-of-working/design/change-management-report.md`, where a wikilink became `[[mac-studio-setup|mac-studio-bootstrap]]`;
  - in the moved thread folder: `adobe-script`, `adobe-sweep`, `apply-check`, `apps-resume`, `chezmoi-fix`, `desk-resume`, `dock-records`, `favicons`, `gate-fix`, `gh-desktop`, `ghd-followup`, `handoff-sol`, `hostkey-check`, `ki-tolerance`, `local-push`, `mark-1449`, `mas-model`, `mas-resume`, `migrate-mas`, `provider-resume`, `push-check`, `query-check`, `readonly-checks`, `registry-bind`, `remit-done`, `rig-diff`, `rig-guide`, `rust-order`, `site-sync`, `sol-chores`, `sol-clt`, `sol-fix`, `sol-headroom`, `sol-push`, `sol-ready`, `sol-remove`, `ssh-keyonly`, `stray-reports`, `terra-read`, `terra-ssh`, `thread-move-rule`, `tool-records`, `ue086-rest`, `ue086-walk`, `ue091-adopt` and `upgrade-lock` (`.report.md`). The remaining files in the folder were moved without changes.
  - `Calendar/` had no references.
- **chezmoi** (`~/.local/share/chezmoi`): local commit `bd04386`, not pushed (`main` is 1 ahead, and that commit is the only one). [KB-DOTFILES-UE-076](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-076-always-run-latest-source.md) now has `project: knowledge-islands/mac-studio-setup`, and [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) links to two reports at their new thread-folder paths. The commit hook passed.
- **tools-rig**: local commit `0f1aff0`, not pushed. Link targets were fixed in [KI-TOOL-RIG-CORE-054](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-054-command-line-tools-check.md) (Project note), [KI-TOOL-RIG-CORE-057](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-057-github-desktop-repository-list.md) (gh-desktop report) and [KI-TOOL-RIG-CORE-059](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-059-mac-app-store-provider.md) (mas-model report). `main` is 4 ahead: this commit sits on three earlier unpushed ones, `a9570bb`, `67328f4` and `b5011d5`, from the mas-provider work.
- **Checks:**
  - `rg -n 'mac-studio-bootstrap'` in ki-principal now finds only history: prose in dated reports, decisions logs, other checkpoints, [GDR-KI-PRINCIPAL-004](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Decisions/GDR-KI-PRINCIPAL-004-standing-agent-host-exemption-from-the-techne-programme-hold.md), [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) and [KI-PRINCIPAL-ECO-014 (pruned)](https://github.com/knowledgeislands/ki-principal/blob/5c1f2279cfe0627d25becae76a6ce81ed8cf397d/Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md); wikilink aliases that keep the old words; and links into the machine-local state folder.
  - On sol this checkout has no `core.hooksPath`, so the Husky gate does not run. I ran its steps by hand:
    - `rumdl check` on the 73 changed Markdown files gives 90 findings against 88 at `HEAD`. Both extra findings are in another session's `+/_THREADS/ways-of-working/cli-release.report.md`, which is excluded from this commit.
    - A scoped `ki repo audit --paths` compared against a `HEAD` worktree shows no new failure. Its one new warning is STREAM-10 (no open records) on `mac-studio-setup`. At `HEAD` it did not fire for the old name, probably because the live run folder `~/.local/state/ki/agents/mac-studio-bootstrap/` still exists. It should clear when the thread moves that folder.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- **State folder, left on purpose.** `~/.local/state/ki/agents/mac-studio-bootstrap/` was not touched. Links in history reports to files in it (in `desk-resume` and `query-check`, among others) still use the old path, as does `tools-rig` [KI-TOOL-RIG-CORE-058](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-058-apply-lock-handler-history.md) (apply-check report). They stop resolving when the thread moves the folder; the content is machine-local run state.
- **Untracked files moved with the folder.** `adobe-remove.sol.20261015-221245.dry-run.log` and `adobe-remove.sol.20261015-221323.dry-run.log` were untracked in the old thread folder. They moved with it and are still untracked and uncommitted.
- **Another session's files.** `+/_THREADS/ways-of-working/cli-release.report.md` is modified, and `pmo-hold.report.md` and `principal-tidy.report.md` are untracked. All three belong to the ways-of-working thread, which another session is editing; they were not touched and are not in this commit.
- **Reported only, as instructed.**
  - tools-ki: [KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md), [KI-TOOL-KI-CLI-135](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-135-reused-agent-name-overwrites.md) and [KI-TOOL-KI-CLI-136](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-136-errors-suggest-fixes.md) name "the mac-studio-bootstrap thread" in prose only.
  - ki-agentic-harness: [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md) has `transferred_from: ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md` and a link to the old Project note, both now broken. `ki-checkpoint` `standards-checkpoints.md` and `ki-delegation` `references/sources.md` use the name as a historical example in prose.
  - apps-rig.midnight.ninja: no references.
- **Unchanged history wording.** chezmoi and tools-rig still say "mac-studio-bootstrap thread" and "Decision N" in their records' prose.

## Queries

### HARNESS-LINK - two broken old-path references in the harness record

**Context:** [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md) in ki-agentic-harness records its origin as `transferred_from: ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md` and links to the same path in its body. Both broke when the Project moved. I listed this without editing because the brief kept ki-agentic-harness read-only. That repository has another session's uncommitted changes in five other files.

**Query:** Should an agent repoint those two references at `mac-studio-setup`?

**Options:**

a) (recommended) an agent changes only the `transferred_from` value and the link target in [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md) to `ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md` and commits that one file locally by explicit path, without pushing

b) leave it for the harness's own thread to fix at its next pass

### LINK-PUSH - push the link commits in chezmoi and tools-rig

**Context:** As briefed, chezmoi `bd04386` and tools-rig `0f1aff0` are committed locally and not pushed. In chezmoi, `bd04386` is the only commit ahead of origin. In tools-rig, `0f1aff0` sits on three other unpushed commits: `a9570bb` (the mas provider, [KI-TOOL-RIG-CORE-059](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-059-mac-app-store-provider.md)), `67328f4` and `b5011d5`.

**Query:** Should these be pushed now?

**Options:**

a) (recommended) push chezmoi `main` now, since `bd04386` is the only commit ahead; leave tools-rig for whoever pushes the mas-provider commits beneath it

b) push both now, including the three mas-provider commits in tools-rig

c) push neither for now

```text
HARNESS-LINK

an agent changes only the transferred_from value and the link target in KI-HARNESS-GOV-189 (ki-agentic-harness) to ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md and commits that one file locally by explicit path, without pushing

---

LINK-PUSH

push chezmoi main now (bd04386 is the only commit ahead); leave tools-rig 0f1aff0 for whoever pushes the mas-provider commits a9570bb, 67328f4 and b5011d5 beneath it
```

```text
╭─ run report · 2026-10-15T21:43:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] rename-setup finished; nothing running from this run
- [waiting] HARNESS-LINK
- [waiting] LINK-PUSH
- [committed] ki-principal rename and this report; pushed only if the stack held this commit alone (see the run's final status line)
- [unpushed] chezmoi bd04386, tools-rig 0f1aff0
- [left over] state folder still at ~/.local/state/ki/agents/mac-studio-bootstrap/, for the thread to move

```text
Resume Rig: mac-studio-setup under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
