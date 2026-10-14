# paperclip-capture - Paperclip approach captured, terra service stopped - since the run began - resting

Run under the state-of-play master thread. Project: [paperclip-capture-and-rebuild](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/paperclip-capture-and-rebuild/paperclip-capture-and-rebuild.md), Initiative: [Techne](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/techne.md). Authority: Kris's 2026-10-14 Paperclip decision ("I want to recreate it with the same approach but fresh"), logged in [decisions.md](/Users/krisbrown/.local/state/ki/agents/state-of-play/decisions.md).

## What has been done

- **Project reshaped.** The Project is renamed from `paperclip-bootstrap-and-recovery` to [paperclip-capture-and-rebuild](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/paperclip-capture-and-rebuild/paperclip-capture-and-rebuild.md) and now uses the folder shape. Its outcome reads: approach captured, terra service stopped, fresh rebuild designed once the ways-of-working model settles. It has four phase sections: Capture, Shut down, Design and Rebuild. The old constraints, naming themes and ideas are folded into the lessons note and the Design questions. Inbound links are fixed in `Projects.md`, `agent-host`, `delta-evaluation`, `baseline-rollout`, and the path list in [KI-PRINCIPAL-ECO-014](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md). No records were added.
- **Design note written.** [paperclip-rebuild-structure](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/paperclip-capture-and-rebuild/design/paperclip-rebuild-structure.md) is in the Project's new `design/` folder, which has its own index. It records every company and code, the projects per repository, the 19 agents with their roles, reporting lines, remits, models, heartbeats and skills, the 6 routines, and the shared adapter settings. It also says what to keep and what to change. It contains no secrets and no issue content.
- **Pillars note written.** [Paperclip Operating Lessons](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Pillars/Engineering Practice/Operating Model/Paperclip Operating Lessons.md>) went in under the Enactment Process, with your instruction standing in for a record. It covers the timeline, the approach, 12 failures with their lessons (including the stale-path lesson behind the agents drift), what worked, and where the evidence lives. It is indexed from [Operating Model](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Pillars/Engineering Practice/Operating Model/Operating Model.md>).
- **Lesson logged.** The stale-path lesson is now a row in [Mistakes and Lessons](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Operations/Mistakes and Lessons.md>); that note's convention fits it.
- **Approach exported outside Git.** Knowledge Islands Principal declares a `sources` store in `.ki.toml`, so the export went to OneDrive `sources-knowledge-islands/paperclip/2026-10-approach/` (568 KB, 47 files). Per company it holds the 19 agent instruction bundles copied exactly, plus agent, project and routine configuration with a README. Environment values were left out (only the key names are kept), and so were run state, issues, comments, runs, any database backup and any cold copy.
- **chezmoi change made, committed and pushed** as `4d07f9c` in the chezmoi source. `service.paperclip` is now `stopped` with start policy `manual`, `port.paperclip` is `on-demand`, and `tool.paperclip-agents` has `profiles = []`. I reviewed it with `chezmoi diff` and applied only `50-services.toml` and `55-ports.toml`. The push also carried another thread's unpushed commit `319f6ae` (the ki-coordinator output-style link). The repository has no hooks or checks to run; the push was a fast-forward.
- **Paperclip stopped and verified.** I ran a dry run of `rig apply --target service:paperclip --scope resources`, then the apply itself. launchd no longer has the job loaded, nothing listens on 3100 or 54329, and no Paperclip process runs. No untargeted `rig apply` was run.
- **Switch rehearsed.** I set the live declaration to `running` and applied the same target. Health came back `ok` on the same commit (`2c4ac3a`), with all 7 companies listed. Then I restored the declaration from chezmoi, applied again, and the stop verified as above. This proves the declaration path works both ways: Rig can stop and start the service from the declaration alone, the stop survives a targeted apply, and the data on disk still boots. It does not prove anything about restoring data, since no backup was taken. One limitation: my first try at restoring the file was refused by chezmoi's overwrite prompt, so Paperclip restarted once more before I forced the restore and stopped it. The final state is stopped.
- **Island committed, not pushed.** Knowledge Islands Principal commit `9a82921` is made. Its pull and rebase are blocked by another thread's uncommitted `+/_THREADS/ways-of-working/decisions.md`, which I left alone. See PAPERCLIP-PUSH.
- **Nothing deleted.** Candidates for a later decision:

  | Item | Size |
  | --- | --- |
  | `~/.paperclip/instances/default` (whole instance) | 7.4 GB |
  | of which hourly database backups, `data/backups` | 6.6 GB |
  | of which database, `db` | 379 MB |
  | of which company homes and run logs | 302 MB and 159 MB |
  | `~/.paperclip/cli/installs/npm` (npm rollback payload) | 1.4 GB |
  | `~/.paperclip/cli/installs/fork` (active fork install) | 2.8 GB |
  | `~/.paperclip/repairs` (alias and repair evidence) | 1 MB |
  | Fork checkout `~/workspaces/knowledge-islands/paperclip` | 3.8 GB |
  | `paperclip/aligned-20260926/*` branches: `hnr-principal` 6, `hnr-agentic-harness` 2, `hnr-shared` 1, `tools-ki` 1 | 10 local, each with a remote copy |
  | Service log `~/Library/Logs/uk.me.kris.rig.paperclip.log` | 3.5 MB |
  | chezmoi-owned `paperclip-setup`, `paperclip-reconcile`, `paperclip-check-repairs`, `~/.config/paperclip/*` and the operations guide | small |

- **Side effect.** Running `python3` made the mise shim install Python 3.15.0. This came from the toolchain another thread already pinned; I changed nothing to cause it.

## What is in progress

Nothing is running.

Outstanding - no action requested now:

- The HOLD, CODES and NAMING questions from the reshape proposal are open questions in the Project's Design phase, which waits on the [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) model.
- The `ki repo audit` STREAM-10 warning on the reshaped Project, which has no open records, is expected under the roadmap focus. The audit's other failures are in other threads' files.

## Outstanding queries

### PAPERCLIP-PUSH - Push the Knowledge Islands Principal commit

- **Summary:** `9a82921` sits on local main above two other threads' unpushed commits, `7e5759b` and `430a9ed`, and two commits behind origin. Two things block the rebase: the ways-of-working thread's uncommitted `+/_THREADS/ways-of-working/decisions.md`, and untracked `+/_THREADS/chezmoi/` files, one of which is identical to an incoming file.
- **Need from you:** Ask for a push once that thread has committed.
- **Recommendation:** When the ways-of-working thread has committed its decisions file, launch a short run to pull with rebase and push fast-forward.

### CMDLINE-APPLY - Apply the command-line Rig file

- **Summary:** The live `~/.config/rig/conf.d/15-command-line.toml` is not applied because it also carries another thread's committed but unapplied mise toolchain change (`06857f5`: actionlint, Zig, Python, uv). Until it is applied, `tool.paperclip-agents` stays in the live laptop profile, and `rig doctor` keeps two Paperclip findings: the agents tool is reported unknown, and the 2026-10-12 apply failure is still on record.
- **Need from you:** Have the chezmoi thread apply that file together with its toolchain change.
- **Recommendation:** The chezmoi thread applies `15-command-line.toml` when it rolls out the toolchain change; the Paperclip findings then clear.

### PAPERCLIP-CHECKPOINT - Retire the old Paperclip checkpoint

- **Summary:** `+/_CHECKPOINTS/techne.paperclip-bootstrap-and-recovery.md` now names a Project that no longer exists (ki-pmo PMO-2 warning). It belongs to another thread, so I did not touch it.
- **Need from you:** Choose whether the master thread retires or renames it.
- **Recommendation:** The master thread retires it, because this Project needs no live thread until the Design phase opens.

### PAPERCLIP-CLEANUP - What to delete now

- **Summary:** About 12 GB under `~/.paperclip`, plus the fork checkout and 10 agent branches, are listed above. You have said you want no history or database backup.
- **Need from you:** Confirm what goes now.
- **Recommendation:** Delete the hourly backups (6.6 GB) and the npm rollback payload (1.4 GB) now. Keep the rest of the instance and the fork install until the fresh rebuild runs. Decide the 10 `paperclip/aligned-*` branches, local and remote, in the same later sweep.

```text
PAPERCLIP-PUSH - Once the ways-of-working thread commits its decisions file, launch a short run to pull --rebase and push ki-principal 9a82921 fast-forward.
CMDLINE-APPLY - Chezmoi thread: apply ~/.config/rig/conf.d/15-command-line.toml with the 06857f5 toolchain rollout, then confirm rig doctor shows no Paperclip findings.
PAPERCLIP-CHECKPOINT - Master thread: retire +/_CHECKPOINTS/techne.paperclip-bootstrap-and-recovery.md; the paperclip-capture-and-rebuild Project needs no live thread until Design opens.
PAPERCLIP-CLEANUP - Delete ~/.paperclip/instances/default/data/backups and ~/.paperclip/cli/installs/npm now; keep the rest until the fresh rebuild runs, then decide the paperclip/aligned-* branches.
```
