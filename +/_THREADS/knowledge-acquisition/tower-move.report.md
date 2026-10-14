# tower-move report

Authority: Kris's decision of 2026-10-14 to move The Tower Game's 15 conversations to personal. Record: [KI-HARNESS-OPS-005](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md), still `in-progress`.

## What has been done

- **Packages moved.** The 15 packages carrying The Tower Game's project identifier `g-p-69ff7f83be248191a5cae112d3ff706f` now sit under `captures/personal/chatgpt/account-export-2026-09-22/` in `krisb/acquire`. I found them by that identifier, not by title, and moved them with `git mv`.
- **Evidence unchanged.** Every file in the 15 packages has the same Git blob hash before and after the move, so package contents, source hashes and checksums are byte-identical.
- **Routing metadata updated.** The receiver checkpoint `.acquire/chatgpt/account-export-2026-09-22/checkpoint.json` now binds the project to `personal`, with `routing: bound`. Each of the 15 conversation entries has its new territory and receiver path. A new `receiver_moves` entry records the date and Kris's decision in words.
- **Converter binding updated.** The converter's binding line now also names `personal`, so a re-run would not send the packages back to `_review`. I counted this as routing metadata that names the receiver.
- **Work record updated.** KI-HARNESS-OPS-005 now binds The Tower Game to `personal`. It is no longer in the provisional list, which now holds only Spirituality and Equal Remedy, and a dated checkpoint records the move and the decision.
- **Checks, all passed:**
  - 6 unprojected conversations remain in `_review`, and none of them carries The Tower Game's identifier;
  - 15 Tower Game packages are in `personal`, and none was left behind;
  - all 334 packages verify against their checksums from a clean clone;
  - total staged is still 334: personal 100, legal 102, humans-not-robots 66, knowledge-islands 55, equal-remedy 5, `_review` 6;
  - every checkpoint receiver path exists;
  - `rumdl` is clean on the changed record, and the harness commit gate passed.
- **Commits, pushed fast-forward to `origin/main`:**
  - acquire `fc1f152`: routes The Tower Game ChatGPT conversations to personal;
  - ki-agentic-harness `7ac2b4de`: binds The Tower Game to personal in KI-HARNESS-OPS-005.
- **Clean-up.** My temporary worktrees and branches are removed. No provider call was made. Personal - Spirituality and every other package are unchanged. Nothing was written to ki-principal except this report.

## What is in progress

Nothing is running.

I left both primary checkouts alone. They need reconciling before anyone pushes from them:

- acquire `main` is 13 ahead of `origin/main` and 1 behind it (`fc1f152`).
- ki-agentic-harness `main` is 3 behind `origin/main` and has uncommitted edits from another session.

## Outstanding queries

- **Needs-TOWER-RECORDS** - Each moved package's own record still says `territory_key: _review` and `routing: unresolved` in its front matter. That record is checksummed acquisition evidence, so I left it unchanged as instructed. The checkpoint is now the routing authority. Is that acceptable, or should the 15 packages be regenerated as new evidence, with new hashes, carrying `personal`?

```text
Needs-TOWER-RECORDS: keep checkpoint as authority | regenerate packages
```
