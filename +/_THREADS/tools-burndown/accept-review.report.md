# [Platform foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md) › [tools-burndown](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/tools-burndown.md) › accept-review

**Run report at 21:54 BST · last mark 01:34 BST**

---

## Done

I reviewed all seven records under ACCEPT-WAVE. This run reports findings only. I made no edits, commits or status changes, and wrote nothing in tools-ki.

Five records are clean and ready for `ki-accept`. Two need a decision from you first.

| Record | Verdict | What decides it |
| --- | --- | --- |
| [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) | Clean, ready | The hosted CI run now meets Verify 4 (below) |
| [KI-TOOL-KI-CLI-130](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-130-skill-generated-surfaces.md) | Clean, ready | One minor note, not blocking |
| [KI-TOOL-KI-CLI-133](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-133-retired-reports-come-back.md) | Clean, ready | None |
| [KI-TOOL-KI-CLI-135](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-135-reused-agent-name-overwrites.md) | Clean, ready | The shared DEPS-1 failure only † |
| [KI-TOOL-KI-CLI-138](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-138-warn-unknown-record-fields.md) | Clean, ready | The shared DEPS-1 failure only † |
| [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md) | Not clean until you decide | EVENTS-REPLAY |
| [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md) | Not clean until you decide | LIVE-CHECKS |

† Verify asks for a clean `ki repo audit --repo .`. The one failure left is DEPS-1, `@types/node` 26.6.3 → 26.6.4. It applies to 123, 127, 135 and 138 alike, and it predates all of them. The `deps-types-node` run is already waiting for this review to finish, so I raise no query for it.

**Gates.** I ran them once, on a scratch clone of local `main` at `70ba0d4a` in `/tmp`:

- `bun run test:coverage` passed 74 files and 1212 tests, at 100% for statements, branches, functions and lines.
- `bunx tsc --noEmit -p .` was clean.
- `bunx biome check .` exited 0, with 26 warnings and 14 infos.
- `bunx knip` exited 0, with four configuration hints.
- `mandoc -T lint man/ki.1` was clean.

**`ki repo audit`.** On the clone, the only real failure is DEPS-1. The other failures come from running in a scratch clone: FILES-2, RUNTIMES-2, REPO-REG-1, and DESIGN-2 from the symlinked `node_modules`.

On the live checkout the audit also fails. MD-mech and ITEM-1 fail on the conflict markers in [KI-TOOL-KI-CLI-139](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-139-ebu-sources-sync.md), left by the stale rebase below.

**KI-TOOL-KI-CLI-126 on hosted CI.** The latest ki-principal CI run on `main` is [38964350437](https://github.com/knowledgeislands/ki-principal/actions/runs/38964350437), at `69b46a9`, 20:43 UTC.

- "Install released KI" passed. It installed the verified `v0.10.5`. `ki repo repair` printed `! Store: sources store is unavailable on this host (not bound)` and ended `result: healthy` and `RESULT=PASS`.
- The `ki repo audit --repo .` step then ran and failed on audit findings alone: FAIL=183 across PMO-7, STREAM-9 and NOTE-1a, with no repair or store error.

That is exactly what Verify 4 asks for. The review section of the record still says the hosted run was not checked, so `ki-accept` should cite this run.

**Code findings.** Every acceptance criterion has its evidence, apart from what is listed here:

- **KI-TOOL-KI-CLI-130, minor and not blocking.** `safeRelativePath` and `diskState` (`src/core/harness/development/generation.ts:18-31`) check only the last part of a path. So a symlinked folder inside the Harness could point a surface outside the root. The generator is the developer's own Harness code, so the risk is low.
- **KI-TOOL-KI-CLI-135, minor.** `setAside` (`src/core/agent/runs.ts`, the `git status --porcelain` call) ignores Git's exit code. If Git fails, relaunch goes ahead instead of refusing. Not blocking.
- **KI-TOOL-KI-CLI-123: the replay you asked me to weigh.** See EVENTS-REPLAY. The first time `deriveEvents` reads a run that existed before `events.jsonl` (`src/core/agent/events.ts:148-189`), it emits a `done` for every finished agent. It also emits a `needs-owner` for every query heading in every report, including queries already answered. The tools-burndown run shows it:
  - At 01:49 UTC, 21 old events were written in one pass, from `inventory` to `triage-plan`, among them answered tags such as OWNER-LANE and STORE-REPAIR.
  - The `events.seen` cursor is at 2, so 19 old events are still queued ahead of any new one.

  Decision 5 accepts that "a run in flight at upgrade returns its earlier finishes once more". It does not mention answered queries replaying. There is also a gap it does not cover: if a thread has retired a report and no state copy is left, the first read gives `failed: no report` for that finished agent (`events.ts:169-174`). This is a one-off cost for each run that predates the change. New runs are not affected.
- **KI-TOOL-KI-CLI-127.** Two live Verify checks were not run: the Codex launch, which needs the network, and `ki agent send ways-of-working "probe"`, which would write into another live run. I ran the link printer's live check, read-only, from the reviewed source:
  - `KI-TOOL-KI-CLI-127` printed its absolute-path link.
  - `KI-TOOL-KI-CLI-124` and `KI-TOOL-KI-CLI-132` printed `(pruned)` links at the parent of the prune commit.
  - `KI-NOWHERE-XYZ-1` exited 1 with a reason.

**Blocks every acceptance: the tools-ki checkout is still in the stale rebase.** This is PUSH-REBASE in the [push-tools-ki](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/tools-burndown/push-tools-ki.report.md) report: a rebase onto `c058981a`, stopped at 08:51 BST on a conflict. While it stays open, two things follow:

- **The installed `ki` is running old code.** It runs the working tree, and that tree lacks the code for 123, 127, 135 and 138. There is no `src/core/agent/events.ts`, `ki link` is unknown, and there is no `--relaunch`. The tools-burndown events log has had nothing new since 02:23 UTC, and `ki agent wait --next` is back on the old name-order logic.
- **`ki-accept` would commit onto the rebase's detached HEAD.** In that tree, 123, 127, 135 and 138 are still at `draft`.

So `ki-accept` should run only after PUSH-REBASE has put `main` back in the checkout.

## In Progress

Nothing is running. I made no edits in tools-ki or ki-principal apart from this report and the status file. The only things written outside them are the scratch clone and logs under `/tmp`.

## Queries

### ACCEPT-CLEAN - accept the five clean records

**Context:** KI-TOOL-KI-CLI-126, KI-TOOL-KI-CLI-130, KI-TOOL-KI-CLI-133, KI-TOOL-KI-CLI-135 and KI-TOOL-KI-CLI-138 have every criterion met, apart from the shared DEPS-1 audit failure. That failure predates them, and the `deps-types-node` run is handling it. The tools-ki checkout is still in the stale rebase.

**Query:** When and how should these five be accepted?

**Options:**

a) (recommended) Once PUSH-REBASE has put `main` back in the tools-ki checkout, accept KI-TOOL-KI-CLI-126, KI-TOOL-KI-CLI-130, KI-TOOL-KI-CLI-133, KI-TOOL-KI-CLI-135 and KI-TOOL-KI-CLI-138 through `ki-accept`, accepting the pre-existing DEPS-1 audit failure. KI-TOOL-KI-CLI-126 cites hosted CI run 38964350437 as its Verify 4 evidence.

b) Wait until `deps-types-node` has cleared DEPS-1, then accept the five.

c) Accept only KI-TOOL-KI-CLI-126, KI-TOOL-KI-CLI-130 and KI-TOOL-KI-CLI-133 for now.

### EVENTS-REPLAY - how KI-TOOL-KI-CLI-123 treats runs older than the change

**Context:** The first time a run that predates the change is read, it replays every past finish and every past query heading, answered or not. For tools-burndown that left 19 old events queued ahead of the cursor. A finished agent whose report the thread has since retired also reads as `failed: no report`. Decision 5 accepted replaying earlier finishes, but not answered queries or retired reports. This happens once for each older run. New runs are unaffected.

**Query:** Should KI-TOOL-KI-CLI-123 be accepted as it is?

**Options:**

a) (recommended) Accept KI-TOOL-KI-CLI-123 through `ki-accept` with the one-off replay as a known limitation in its review. Capture a triage record so that the first read of an older run marks past agents as already seen, with no replayed queries and no `failed: no report` for retired reports. Once the code is back in the live checkout, the tools-burndown coordinator moves its `events.seen` cursor past event 21.

b) Send KI-TOOL-KI-CLI-123 back for that fix before accepting it.

c) Accept it as it is, with no follow-up record.

### LIVE-CHECKS - the two live checks KI-TOOL-KI-CLI-127 did not run

**Context:** Every KI-TOOL-KI-CLI-127 check is covered by contract tests, and I confirmed the link printer live. Two live checks were not run: a real `--runtime codex` launch, which needs the network, and a real `ki agent send ways-of-working "probe"`, which writes into another live run.

**Query:** Can those two checks be waived?

**Options:**

a) (recommended) Waive the two live checks on the contract-test evidence, and accept KI-TOOL-KI-CLI-127 through `ki-accept` once PUSH-REBASE has put `main` back.

b) Authorise a run to do the Codex launch and the send to a run you name, then accept.

c) Run the two checks yourself, then accept.

```text
ACCEPT-CLEAN

Once PUSH-REBASE has put main back in the tools-ki checkout, accept KI-TOOL-KI-CLI-126, KI-TOOL-KI-CLI-130, KI-TOOL-KI-CLI-133, KI-TOOL-KI-CLI-135 and KI-TOOL-KI-CLI-138 through ki-accept, accepting the pre-existing DEPS-1 audit failure, with KI-TOOL-KI-CLI-126 citing hosted CI run 38964350437 as its Verify 4 evidence.

EVENTS-REPLAY

Accept KI-TOOL-KI-CLI-123 through ki-accept with the one-off replay as a known limitation in its review, capture a triage record so that the first read of an older run marks past agents as already seen (no replayed queries, no failed: no report for retired reports), and once the code is back in the live checkout have the tools-burndown coordinator move its events.seen cursor past event 21.

LIVE-CHECKS

Waive KI-TOOL-KI-CLI-127's two live checks (the Codex launch and the send to a real run) on the contract-test evidence, and accept it through ki-accept once PUSH-REBASE has put main back.
```

```text
╭─ run report · 2026-10-16T20:54:00Z ─────────────────────╮
│                                                         │
│  █▀▀▄ █▀▀█ █▄ █ █▀▀▀   · run accept-review finished     │
│  █  █ █  █ █ ▀█ █▀▀    · 5 clean, 2 need a decision     │
│  █▄▄▀ █▄▄█ █  █ █▄▄▄   · nothing running here           │
│                                                         │
╰─────────────────────────────────────────────────────────╯
```

- [done] accept-review: 126, 130, 133, 135 and 138 clean; 123 and 127 need a decision
- [waiting] ACCEPT-CLEAN
- [waiting] EVENTS-REPLAY
- [waiting] LIVE-CHECKS
- [waiting] PUSH-REBASE (carried from push-tools-ki; blocks every acceptance)
- [hold] deps-types-node: waiting for this review to finish
- [unpushed] tools-ki `main` `f0f21922`..`70ba0d4a` (22 commits, 9 behind origin)

Resume line: `Resume Fnd: tools-burndown under current ki-pmo and ki-delegation since 2026-10-16T20:54:00Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.`
