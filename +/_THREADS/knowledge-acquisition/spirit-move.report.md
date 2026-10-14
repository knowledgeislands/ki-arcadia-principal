# spirit-move report

Authority: Kris, 2026-10-14, SPIRIT: "Move all 18 Personal - Spirituality conversations to sacred-inquiry as one project, one package per conversation, on Haiku; Sacred Inquiry's receiver may return the relationship conversation to personal later; update KI-HARNESS-OPS-005's binding." Also TOWER-RECORDS: "Keep acquire's routing checkpoint as the routing authority" - do not edit package files.

## What has been done

- **Packages moved.** The 18 packages carrying Personal - Spirituality's project identifier `g-p-67fc427d557881918931a1408952701a` now sit under `captures/sacred-inquiry/chatgpt/account-export-2026-09-22/` in `krisb/acquire`. I found them by that identifier, not by title, and moved them with `git mv`.
- **Evidence unchanged.** Every file in the 18 packages has the same Git blob hash before and after the move, so package contents, source hashes and checksums are byte-identical.
- **Routing metadata updated.** The receiver checkpoint `.acquire/chatgpt/account-export-2026-09-22/checkpoint.json` now binds the project to `sacred-inquiry`, with `routing: bound`. Each of the 18 conversation entries has its new territory and receiver path. A new `receiver_moves` entry records the date and Kris's decision in words.
- **Converter binding updated.** The converter's binding now also names `sacred-inquiry`, so a re-run would not send the packages back to `personal`.
- **Work record updated.** KI-HARNESS-OPS-005 now binds Personal - Spirituality to `sacred-inquiry`. It is no longer in the provisional list, which now holds only Equal Remedy, and a dated checkpoint records the move and the decision.
- **Checks, all passed:**
  - 18 Spirituality packages are in `sacred-inquiry`, and none was left behind in `personal`;
  - 6 unprojected conversations remain in `_review`, unchanged;
  - all 334 packages verify against their checksums from a clean clone;
  - total staged is still 334: personal 82 (was 100), sacred-inquiry 18 (new), legal 102, humans-not-robots 66, knowledge-islands 55, equal-remedy 5, `_review` 6;
  - every checkpoint receiver path exists;
  - the harness commit passed its linting gate.
- **Commits, pushed fast-forward to `origin/main`:**
  - acquire `9431269`: routes Personal - Spirituality to sacred-inquiry;
  - ki-agentic-harness `17747064`: binds Personal - Spirituality to sacred-inquiry in KI-HARNESS-OPS-005.
- **Clean-up.** My temporary worktrees are removed. No provider call was made. Every other package is unchanged. Nothing was written to ki-principal except this report.

## What is in progress

Nothing is running.

I left both primary checkouts alone. They remain unaffected:

- acquire `main` is 1 ahead of `origin/main` (the commit just pushed).
- ki-agentic-harness `main` is unaffected by this work.

## Outstanding queries

None. The move is complete and verified.

---

```text
Needs: (none)
```
