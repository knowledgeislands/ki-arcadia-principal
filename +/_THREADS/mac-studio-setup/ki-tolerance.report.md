# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › ki-tolerance

**Run report at 10:38 BST · last mark 17:47 BST**

---

## Done

I captured Kris's KI-STORE-TOLERANCE request (decision 106) as one triage record in tools-ki: [KI-TOOL-KI-CLI-136 Errors suggest fixes](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-136-errors-suggest-fixes.md). It quotes Kris's words and covers all three parts of the request. I did not implement anything.

- **Commits, local only, not pushed.** `4b99032c` reserves the number in the issue ledger, as the repository requires. `9eb3b0a4` adds the record. Both passed the commit hooks. The scoped `ki repo audit --paths` passed with `FAIL=0 WARN=0` for the record. The whole-tree audit still shows one failure, the known `DEPS-1` item that [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) already records, and nothing from this run.
- **What the survey found, cited by file and line in the record:**
  - **Unbound stores.** `store list` prints `sources: unbound` with no next step. `ki doctor` has no store check at all, which is why it said `healthy` on sol while eight stores were unbound. `repair` and `open` already warn, but they only point to `store list`. `ki` already knows the conventional `OneDrive-Personal/sources-<name>` folder name, yet it never offers that folder for a declared store that has no binding.
  - **Privacy denials.** `ki` throws away the "Operation not permitted" error in three places (the store check, the OneDrive root check and the estate symlink scan). A denied folder therefore looks missing or empty, which is how terra-read went wrong.
  - **General rule.** Every `ki` error prints as just `ki: error: <message>`. There is no field for a suggested next command, and the product-engineering standard has no rule asking for one.
- **registry-bind's Friction section** is folded in as all seven items, including the hidden `--repo` help, the unexplained `not …` lines, the preview that leaves out the file path, the missing undo hint, the unexplained word "direct", and folder names that cannot be worked out from a repository's code.
- **Overlap.** The record's boundary leaves the host-absent store states to [KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md) and repair's warning to [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md). Planning has to decide the order between them.

## In Progress

Nothing is running. This report is uncommitted, in the state folder and the thread folder.

## Queries

None. Adopting, prioritising and planning [KI-TOOL-KI-CLI-136](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-136-errors-suggest-fixes.md) belong to tools-ki under `ki-next` and `ki-plan` whenever Kris chooses. The record lists three questions for planning: where a folder hint would live, how the "every error suggests a fix" rule is enforced, and whether to split the record.

```text
╭─ run report · 2026-10-15T09:38:25Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · KI-TOOL-KI-CLI-136      │
│  █  █ █▄▄▄ ▄▄▄█   █    · 0 queries               │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] ki-tolerance finished; nothing running from this run
- [unpushed] tools-ki main on sol: 4b99032c, 9eb3b0a4
- [uncommitted] this report (state folder and thread folder)

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
