# Owner report: CLOSED-THREADS correction

Thread: KI Model ways-of-working Project thread (Initiative knowledge-islands-model). Repository: `ki-principal`. Date: 2026-10-14.

## 1 What has been done

Kris's answer to `CLOSED-THREADS`, "No, they're not closed, they're both being worked on.", is now recorded and every statement calling the `chezmoi` or `mac-studio-bootstrap` thread closed is corrected.

- **Report corrected.** The Durability and ownership section of [change-management-report.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-report.md) said "Techne, chezmoi and mac-studio-bootstrap are closed, so their logs may already be gone." It now says the chezmoi and mac-studio-bootstrap threads are open and being worked on, quoting Kris's words, that their logs stay and are swept for citations only, and that the Techne run has no checkpoint of its own. That was the only such statement in the report; the decisions file and `design.md` made no closed claim of their own.
- **Decision recorded.** [change-management-decisions.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-decisions.md) gains entry 31, `CLOSED-THREADS`, under "Decisions on durability, naming and the hook": both threads open and active, Kris's words quoted, run folders not swept and reconciled only from their own threads when they close, no decision number. The section's intro notes the extra 2026-10-14 answer.
- **Pre-existing defect fixed in the same file.** Entry 30 (`EXTRACT-PIN` / `EXPORT-ROUTE`) was fused mid-word into entry 29's line ("was accepte30."), which made the commit hook reject the ordered list. The word is completed, entry 30 has its own line, and the list now runs 29, 30, 31. Second commit.
- **Roadmap record adjusted.** [KI-PRINCIPAL-ECO-014](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md) no longer says the two runs "move to that list if Kris confirms their threads closed"; it says they stay among the 17 live folders, quoting Kris, and the Boundary names them under "Not the live runs", with any reconcile happening only from their own threads when they close. Counts unchanged: 17 live, 8 reconcile-then-archive. `updated_at` bumped.
- **Local inventory updated, not committed.** `/Users/krisbrown/.local/state/ki/agents/ways-of-working/run-close.inventory.md`: both runs are `keep (live)` as active threads, not on the mechanical test alone; the note about moving them to reconcile-then-archive is replaced by Kris's answer; the `mac-studio-bootstrap` log is noted as staying since its thread is active.
- **Not touched.** Neither thread's checkpoint, neither run folder, `Admin`, `Pillars`, `Resources`. The untracked `+/diagrams/` folder belongs to another session and was left alone.

Commits on `main`, pushed fast-forward to `origin` after `git pull --rebase` (no incoming changes):

- `b6d4efa` docs(design): record that the chezmoi and mac-studio-bootstrap threads are open
- `1bc8c43` docs(design): split the fused ACCEPT-177 and EXTRACT-PIN entries

Checks: the pre-commit hook (`rumdl check --fix` and the KI repo audit) passed on both commits; the audit's two WARNs (close-out assessments for the `paperclip-bootstrap-and-recovery` and `website` Projects) are pre-existing and unrelated. Working tree clean apart from `+/diagrams/`.

## 2 What is in progress

Nothing running. Outstanding, no action requested now:

- Retained decision: the `chezmoi` and `mac-studio-bootstrap` run folders are out of the KI-PRINCIPAL-ECO-014 sweep; their reconcile belongs to their own threads at close.
- Verification limitation: the Techne thread's status was not asked and is not asserted either way; the report now says only that the Techne run has no checkpoint of its own.

## 3 Outstanding queries

None.

```text
No queries - nothing to reply to.
```
