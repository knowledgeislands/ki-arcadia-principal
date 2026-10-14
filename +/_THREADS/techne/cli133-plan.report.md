# [Techne](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/techne.md) › [Agent host](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/agent-host/agent-host.md) › cli133-plan

**Run report at 00:00 BST · last mark 23:22 BST**

---

## Done

- [KI-TOOL-KI-CLI-133](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-133-retired-reports-come-back.md) is Ready, committed and pushed to `main` as `6736178` (record only). `ki repo audit --skill ki-work-roadmap` and rumdl pass.
- **Reproduced** against the installed `ki`, in a throwaway repo under `/tmp` with `KI_STATE_HOME` pointed at a temporary directory (since removed; no real run, thread folder or checkout touched). `ki agent decide` and `ki agent close` both re-copy a retired report as an untracked file whenever the state folder still holds a copy. `launch`, `queue` and `new` do not.
- **Build:** the installed `ki` runs tools-ki's working-tree source (`bun .../src/main.ts`), so it is HEAD and behaves identically.
- **Root cause:** `adoptStateFiles` treats "present in the thread folder" as "delivered", so a retired report looks undelivered. The 55 state copies were left over from hand-copying before the launcher became the writer; the later `decide` calls adopted them.
- **Plan:** adopt a state file only if Git has never held that path in the thread folder (history or index). The skipped state copy stays and is archived with the run. No new state in `thread.json`. Tests cover `decide`, `close`, `launch`, `queue` and `new` leaving a retired report retired, a new report still delivered, and the legacy migration unchanged. Docs touched: guide, man page, `man/ki.commands.json`, changelog. Known limit: a shallow clone without the history would re-adopt.
- No other sessions' files were touched; the tree was clean throughout.

## In Progress

Nothing. No source change has been made.

## Queries

### CLI-133-DELIVER

**Context:** [KI-TOOL-KI-CLI-133](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-133-retired-reports-come-back.md) is Ready with the Git-history skip rule above, a small change in `src/core/agent/thread.ts` plus tests and documentation.

**Query:** Do you give the go-ahead to deliver KI-TOOL-KI-CLI-133 now?

**Options:**

a) (recommended) Deliver now with the Git-history skip rule, through `ki-implement`, stopping at Awaiting review without pushing or releasing. b) Deliver, but record adopted names in `thread.json` instead (does not cover the 55 legacy copies). c) Hold it in Ready for now.

```text
CLI-133-DELIVER

a) Deliver now with the Git-history skip rule, through ki-implement, stopping at Awaiting review without pushing or releasing.
```
