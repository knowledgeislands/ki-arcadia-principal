# [Techne](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/techne.md) › [Agent host](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/agent-host/agent-host.md) › recopy-defect

**Run report at 23:25 BST · last mark 23:22 BST**

---

## Done

- Captured and adopted [KI-TOOL-KI-CLI-133](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-133-retired-reports-come-back.md) in tools-ki: `kind: deliver`, horizon `now`, status `draft`, citing Kris's Decision 65 words as adoption and priority evidence. It carries the defect, reproduction, candidate fixes and acceptance checks.
- The copy code is `adoptStateFiles` in `src/core/agent/thread.ts`. It skips a file only if the thread folder still holds it, so a retired report is copied again. It runs from `appendDecision` (`ki agent decide`) and `gateLines` in `src/core/agent/close.ts` (`ki agent close`). `launchAgent` in `src/core/agent/runs.ts` does not call it.
- Commits, pushed to origin `main`: `5c688df` reserve number, `5804765` capture, `9717954` adopt. `ki repo audit --skill ki-work-roadmap` and rumdl pass. No other files were touched; the tree was clean.

## In Progress

Nothing running. The record awaits planning with `ki-plan`.

## Queries

**Context:** At HEAD (`0fcc593`) the source does not re-copy on `launch`, and it deletes each state copy as it moves it. You saw a re-copy after `launch` and the state folder still holding reports, so the installed `ki` (0.10.4, a local runner) may differ from HEAD, or `decide` or `close` ran in between. The record's first step settles this.

**Query:** Should the record be planned now, with the first step being to reproduce against the installed `ki`?

**Options:**

a) (recommended) Plan KI-TOOL-KI-CLI-133 now with `ki-plan`. b) Leave it in Now unplanned.

Reply block:

```text
Q1: a) Plan KI-TOOL-KI-CLI-133 now with ki-plan.
```
