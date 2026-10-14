# ~/.local/state audit (read-only) - 2026-10-09

Authority: state-of-play Decision 32. Nothing was deleted, moved or changed. About 1.2 GB can be reclaimed.

## Overview

| Folder | Size | What it is | Still needed? | Proposal |
| --- | --- | --- | --- | --- |
| `claude-bg/territory-selection-codex-20261007-2133/worktrees` | 758 MB | Four Git worktrees (Arcadia, harness, tools-ki, tools-mgit) left by the 7 Oct territory-selection Codex run. They are still registered in those repositories. | No. All four are clean, and their branches are merged or already in `origin/main`. | DEL-1 |
| `claude-bg/territory-selection-codex-20261007-2133` (rest) | ~330 MB | The same run's v0.9.0 release artefacts (signed tarballs, an immutable install, a 199 MB scratch data folder) and logs. | No. tools-ki has since shipped v0.10.0. | DEL-2 |
| `claude-bg/gov-020`, `techne`, `tower-split`, `delegation-brief.md`, `adopt-arcadia` (empty) | 14 MB | Old run folders from before `ki agent`, the retirement note, and an empty folder made today. | No. The runs are finished, and the gov-020 and techne decisions logs were carried into `ki/agents`. | DEL-3 |
| `ki/mcp-acquire-whatsapp/spool-onedrive-backup-20260930` | 143 MB | The safety copy taken on 30 Sep when the spool moved off OneDrive. | No. Every file in it is also in the live spool, which has been in use since 30 Sep. | DEL-4 |
| `ki/mcp-acquire-whatsapp/spool` and `auth` | 147 MB | The live WhatsApp spool and its sign-in data. | Yes | KEEP-1 |
| `tower-save-nudge/learning` | 115 MB | Two "Gem learning" screen recordings from 8 Oct, made by the Tower Save Nudge app (kit-midnight.ninja). | Only while being reviewed. Growth is limited by the app to 100 MB per recording and 200 MB in total, and it deletes recordings older than 7 days when it starts. | KEEP-2 |
| `ki/agents/state-of-play`, `chezmoi`, `techne`, `mac-studio-bootstrap`, `island-model-and-tending`, `5g-emerge-phase2`, `5g-emerge-phase3` | 11 MB | Live Project thread run folders | Yes (threads open; `checklist` and `sweep-approvals` running now) | KEEP-3, FIX-2 |
| `ki/agents/gov-020` | 2.3 MB | Finished GOV-020 run | No. Its 9 decisions are recorded elsewhere: the checkpoint naming and label rules are in the `ki-checkpoint` skill and in the checkpoint files, the release-bot and pin decisions are in KI-HARNESS-GOV-161 (done), and the rest were one-off actions. | DEL-5 |
| `ki/agents/territory-selection` | 5.4 MB | Finished. The Project was closed and its checkpoint removed on 8 Oct. | No. One leftover status file, `closure`, never reached DONE, but the closure is complete. | DEL-5 |
| `ki/agents/territory-selection-codex-20261007-2133` | 0 | A link pointing into `claude-bg` | No | DEL-2 |
| `ki/agents/gov144-smoke`, `gov144-smoke-1791446770` | 40 KB | Smoke tests of `ki agent` from 7 and 8 Oct | No | DEL-5 |
| `ki/state-of-play` | 1.1 MB | The first state-of-play run folder (6–8 Oct), from before `ki/agents`. Its one handoff note has already been used. | No | DEL-5 |
| everything else | < 2 MB | Small MCP, tool and scheduler state | Yes | none |

## What still writes to claude-bg

Nothing writes there automatically. `ki agent`, the `ki-delegation` skill, chezmoi, LaunchAgents and the shell setup contain no reference to `claude-bg`. The only mention is the line in chezmoi's `.chezmoiremove` that retired `bin/claude-bg`.

Today's `claude-bg/adopt-arcadia` was created by the adopt-arcadia background agent itself. It picked `~/.local/state/claude-bg/adopt-arcadia/wt` as its worktree folder, removed the worktree afterwards, and left the empty folder behind. The agent had to improvise because the background-run standard (`ki-agentic-harness`, `skills/governance/ki-delegation/references/standards-background-runs.md`, under Coordination › Isolation) says only "each use their own Git worktree". It does not say where the worktree goes or who removes it. The original rule ("isolated worktrees beneath the runtime-owned run, outside estate roots") is territory-selection-codex Decision 3, and that rule exists only in the decisions log inside `claude-bg`. Worktree locations are already scattered: `claude-bg/...`, `~/workspaces/kit/.worktrees/arcadia-sweep`, and `ki-arcadia-principal.wt-checklist`.

## Decisions logs not yet consolidated

- **territory-selection-codex Decision 3** (where worktrees go) exists only in `claude-bg`. FIX-1 covers it. Its other decisions are either in ADR-KI-ARCADIA-002 or finished.
- **chezmoi Decisions 24–33** are newer than `rig.chezmoi.md`, which was updated 14:10Z. The ones still in force are 26 (secrets-hygiene records), 31 (claude-swap auto-switch as a managed background service, with its launchd exception), 32 (scope of DOTFILES-UE-062) and 33 (recategorise by recreating and archiving). They are the largest gap.
- **techne Decisions 31–32** and **mac-studio-bootstrap Decision 20** are newer than their checkpoints. They are mostly one-off acceptances, apart from techne 32: "avoid roadmap IDs in references".
- state-of-play, island-model-and-tending, 5g-emerge-phase2 and 5g-emerge-phase3 (in kit-hnr's checkpoints) are consolidated, apart from today's state-of-play Decisions 31–32, which this run and capture-sweep-2 are carrying.

## Proposals

- **DEL-1** - Remove the four territory-selection-codex worktrees properly with `git worktree remove`, in ki-agentic-harness, ki-arcadia-principal, tools-ki and tools-mgit, then delete their four `territory-selection-codex-20261007-2133/*` branches. Do not just delete the folder: that would leave dangling worktree entries in four repositories. Recommend: **approve** (758 MB).
- **DEL-2** - Then delete the rest of `claude-bg/territory-selection-codex-20261007-2133` and the `ki/agents/territory-selection-codex-20261007-2133` link. Recommend: **approve after FIX-1 is captured** (~330 MB).
- **DEL-3** - Delete the rest of `claude-bg`: `gov-020`, `techne`, `tower-split`, `delegation-brief.md` and `adopt-arcadia`. Recommend: **approve** (14 MB). Optionally also remove the two Claude project-history folders named after `claude-bg` paths under `~/.claude/projects`.
- **DEL-4** - Delete `ki/mcp-acquire-whatsapp/spool-onedrive-backup-20260930`. Every file in it is also in the live spool. Recommend: **approve** (143 MB).
- **DEL-5** - Delete the finished run folders: `ki/agents/gov-020`, `ki/agents/territory-selection`, both `gov144-smoke*`, and `ki/state-of-play`. Recommend: **approve** (~9 MB). This is the first use of the retention rule from Decision 32.
- **FIX-1** - Make the standard name where background-run worktrees go and who removes them. Suggested wording: "under the run folder `~/.local/state/ki/agents/<run>/worktrees/<repo>`, removed with `git worktree remove` and the branch deleted once merged, before the run reports DONE". Optionally `ki agent` could provide a helper for this. Where: `ki-agentic-harness`, as a new KI-HARNESS-GOV record via `ki-next`, best folded into the Decision 32 run-folder retention rule already parked with the ways-of-working Project. If the helper is wanted, add a paired tools-ki KI-TOOL-CLI record. No record created. Recommend: **approve capture**.
- **FIX-2** - Ask the chezmoi thread to update `rig.chezmoi.md` with Decisions 24–33, and the techne thread to record Decision 32. Recommend: **approve**.
- **FIX-3** - The old OneDrive WhatsApp folder is still granted trust in the live `~/.claude/settings.json` and `~/.codex/config.toml`, even though the folder no longer exists. This is a leftover from the 30 Sep move. Route it to the chezmoi thread for tidying. Recommend: **approve** (low priority).
- **KEEP-1** - Keep the live WhatsApp spool and `auth`.
- **KEEP-2** - Keep `tower-save-nudge`. Its growth is limited (200 MB in total, 7-day expiry). Delete the two 8 Oct recordings by hand once reviewed if you want the space back sooner.
- **KEEP-3** - Keep the live Project thread run folders until their threads close and consolidate.

## Done

- Audited all of `~/.local/state`, about 1.5 GB. About 1.2 GB can be reclaimed safely (DEL-1 to DEL-5).
- Found what writes to `claude-bg`: background agents choose worktree paths themselves because the standard names no location (FIX-1). No tool or scheduled job writes there.
- WhatsApp backup: it is a safety copy from the 30 Sep move off OneDrive and is fully contained in the live spool, so it is safe to remove.
- tower-save-nudge: app recordings with built-in size and age limits.

## Failed

- None. No commits were made, as this was a read-only task.

## Needs the owner

- Approve or decline DEL-1 to DEL-5, FIX-1 to FIX-3, and KEEP-1 to KEEP-3, in a batch.
