# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › streams-index

**Run report at 22:47 BST · last mark 16:09 BST**

---

## Done

- **STREAMS-INDEX carried.** Kris set this on 15 October: "Dispatch a one-file run to align the Streams index note's two paragraphs with the Project registry standard, committed by explicit path, after REGISTRY-RECORD lands." Kris's instruction stands in for an Enactment record.
- **[Streams index note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Streams.md)**, Projects and Initiatives paragraphs rewritten against the [Project registry standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-work/references/standards-project-registry.md):
  - Projects: a note now carries outcome, lead, target and `lifecycle`, with Outcome and Notes sections. It names the idea-stage Project (a `planned` one whose outcome is its lead's decision). Links point upwards, so a note lists no records and carries no health or update section. This drops the old "health, current decision, next step and the open records".
  - Initiatives: a note now gives its direction and Notes, including its projectless upkeep. It lists neither Projects, records nor Activities and carries no dated review. This drops the old "its Projects ... and a dated Review".
- **Commit** `4fe1331` `docs(streams): align the Streams index with the Project registry standard`, ki-principal `main`, staged by explicit path. `rumdl` is clean, and the note has no en or em dashes.
- **Not pushed.** After `git pull --rebase`, another session's local commit `33433c1` `docs(checkpoints): re-bootstrap knowledge-acquisition and fold in the master's messages` (22:46 BST) sits under mine. Pushing would publish it as well. See STACKED-PUSH.
- **Limitation:** the Idea-stage clause follows the registry-model text, which is still uncommitted in the ki-agentic-harness working tree, waiting on SOL-GATE. The rest matches the standard as committed at `HEAD`.

## In Progress

Nothing is running.

- ki-principal `main` on sol is 2 commits ahead of `origin/main` (`33433c1` from another session, then `4fe1331` from this run). Both wait on STACKED-PUSH.
- This report is written but not committed. The thread commits it with its folder.

Outstanding - no action requested now:

- If registry-model's harness change is dropped or reworded, the idea-stage sentence in the Streams index note needs a matching edit.

## Queries

### STACKED-PUSH - Push ki-principal with another session's commit beneath this one

**Context:** The Streams index commit `4fe1331` is ready on ki-principal `main` on sol. Under it sits `33433c1`, a knowledge-acquisition checkpoint commit made by another session at 22:46 BST. A fast-forward push would publish both commits, and this run may push only its own.

**Query:** Should ki-principal `main` on sol be pushed with both commits?

**Options:**

a) (recommended) Ask the knowledge-acquisition thread to confirm `33433c1`, then push ki-principal `main` on sol fast-forward with both commits.

b) Push both commits now, without asking that thread.

```text
STACKED-PUSH

Ask the knowledge-acquisition thread to confirm 33433c1 (docs(checkpoints): re-bootstrap knowledge-acquisition), then push ki-principal main on sol fast-forward with it and 4fe1331 (docs(streams): align the Streams index with the Project registry standard).
```

```text
╭─ run report · 2026-10-15T21:47:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] STACKED-PUSH
- [unpushed] ki-principal main on sol, 4fe1331 above another session's 33433c1
- [uncommitted] this report, for the thread's folder commit
