# [Platform foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md) › [tools-burndown](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/tools-burndown.md) › triage-plan

**Run report at 02:29 BST · last mark none**

---

## Done

I adopted eight records and planned eight. Four are now Ready: [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md), [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md), [KI-TOOL-KI-CLI-135](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-135-reused-agent-name-overwrites.md) and [KI-TOOL-KI-CLI-138](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-138-warn-unknown-record-fields.md). The rest are planned as far as they can go and stay draft, each with its exact blocker written into the record. Everything is committed locally in tools-ki and nothing is pushed (see PUSH-ORDER).

**Adopted** under Kris's TRIAGE-ADOPT answer a), in commit `46392f1a`:

- [KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md), [KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md), [KI-TOOL-KI-CLI-135](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-135-reused-agent-name-overwrites.md), [KI-TOOL-KI-CLI-136](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-136-errors-suggest-fixes.md), [KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md) and [KI-TOOL-KI-CLI-138](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-138-warn-unknown-record-fields.md): deliver / Next under tools-burndown.
- [KI-TOOL-KI-CLI-139](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-139-ebu-sources-sync.md): deliver / Next under knowledge-acquisition, and nothing more.
- [KI-TOOL-KI-CLI-140](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-140-git-hygiene-estate-audit.md): deliver / Next under tools-burndown, because the Project's Scope lists it inside the burn-to-zero. It is not planned yet: it waits on the ki-git rubric dependency named in the record.

**Ready, in recommended delivery order and grouped by shared code area:**

1. **Agent launcher** (`src/core/agent/`), delivered one after another because these records share `runs.ts`:
   1. The link printer from [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md) (`ki link`, a separate module). The record already says it goes first. Commit `5f1349e5`.
   2. [KI-TOOL-KI-CLI-135](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-135-reused-agent-name-overwrites.md): a taken agent name is refused with a `<name>-<n>` suggestion, and `--relaunch` keeps the earlier packet in `<name>.prev-<n>/`. Commit `b36b3312`.
   3. [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md): `events.jsonl`, and `wait --next` returns results in the order they happened, which fixes the 13 October ordering bug. It also adds fixed `milestone:`, `blocked:` and `failed:` status lines, which [KI-HARNESS-GOV-175](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md) will then write up. It reads [KI-TOOL-KI-CLI-135](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-135-reused-agent-name-overwrites.md)'s `prev` folders, so it comes after that record. Commit `22584053`.
   4. The rest of [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md): `status` with no run listing live threads, `decide --class`, `send`, the dispatch test for the Codex marker, and bare-letter replies. The inbox moves to the state folder because the thread folder may now hold only `decisions.md` and reports. The links to the pruned [KI-TOOL-KI-CLI-124 (pruned)](https://github.com/knowledgeislands/tools-ki/blob/9c4c0c0ef55feac893e869b886e87639ece9d791/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md) now use the pruned-link form. Commit `5f1349e5`.
2. **Work-record model** (`src/core/work/`), which can run alongside group 1:
   - [KI-TOOL-KI-CLI-138](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-138-warn-unknown-record-fields.md): `ki repo roadmap` warns on unknown front-matter fields in KB Streams records. The harness checker's field list has landed on ki-agentic-harness origin/main `05ee5b1f`, so its agreement is settled. A pinned contract test keeps the two lists in step. Commit `bb446bb0`.

[KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md) and [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md) stay in the ways-of-working Project, as OWNER-LANE set; tools-burndown only does the writing for them.

**Planned but still draft, each with its blocker written into the record:**

- **Store and errors:**
  - [KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md) waits for [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) to be accepted (STORE-REPAIR). It now includes 136's store reporting: the fix commands, path inference and a `ki doctor` store check.
  - [KI-TOOL-KI-CLI-136](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-136-errors-suggest-fixes.md) waits for [KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md). It keeps the macOS privacy-denial handling, a structured `next:` hint on errors and the remaining friction fixes.
  - Both records are in commit `a17afa7e`.
- **Agent launcher:**
  - [KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md) needs Kris to choose the temporary folder location (TMP-HOME). Its harness pair record also has an identifier collision (GOV-195-COLLISION). Commit `0f61dd83`.
  - [KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md) has its marker and report-path fixes settled. The new authority grant needs Kris's choice and a new harness asset (FOOTER-GRANTS). Commit `a57617f0`.

**Left alone, as briefed:** [KI-TOOL-KI-CLI-125](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-125-ki-release-contract.md) (on hold), [KI-TOOL-KI-CLI-128](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-128-granola-retention-safeguards.md), and [KI-TOOL-KI-CLI-139](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-139-ebu-sources-sync.md) beyond its adoption.

**Checks:**

- `ki repo audit --skill ki-work-roadmap` passed (15/15) and `rumdl` was clean after every commit. The pre-commit hook passed each time; nothing used `--no-verify`.
- The full `ki repo audit` still fails on one pre-existing finding unrelated to this work: DEPS-1, `@types/node` 26.6.3 → 26.6.4. It is already tracked under DEPS-1-TYPES-NODE.

## In Progress

Nothing is running. The eight new commits, `46392f1a` to `5f1349e5`, are local on tools-ki `main` and wait on PUSH-ORDER.

## Queries

### PUSH-ORDER - push tools-ki main with two other runs' commits beneath mine

**Context:** tools-ki `main` is 10 commits ahead of origin after a fresh `git fetch`. My eight planning commits sit on top of two commits from other runs that were never pushed:

- `f0f21922` moves [KI-TOOL-KI-CLI-130](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-130-skill-generated-surfaces.md) to Awaiting review (CLI-130-ACCEPT);
- `b4043e7a` is the [KI-TOOL-KI-CLI-133](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-133-retired-reports-come-back.md) fix (ACCEPT-133).

A fast-forward push of my commits would also push theirs. The brief allows me to push only my own, so nothing is pushed. Pushing does not accept either record.

**Query:** May the thread push tools-ki `main` fast-forward, including `f0f21922` and `b4043e7a`?

**Options:**

a) (recommended) Let the thread push tools-ki `main` fast-forward to origin at its next resting point, including the other runs' `f0f21922` and `b4043e7a`. Acceptance of [KI-TOOL-KI-CLI-130](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-130-skill-generated-surfaces.md) and [KI-TOOL-KI-CLI-133](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-133-retired-reports-come-back.md) stays a separate decision. b) Hold the push until [KI-TOOL-KI-CLI-130](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-130-skill-generated-surfaces.md) and [KI-TOOL-KI-CLI-133](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-133-retired-reports-come-back.md) are accepted.

### TMP-HOME - where agents' temporary output goes ([KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md))

**Context:** Two of your decisions disagree on where temporary output goes:

- THREADS-TMP-HOME (15 October): it goes in `<primary checkout>/tmp/<run>/<name>/` in the repository the agent works in, ignored, and deleted when the run closes.
- 16 October, 5G Emerge Phase 3 thread: "screenshots and other scratch output go in the system temp folder, never in a thread folder or repository". This is captured as [KI-HARNESS-GOV-196](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-196-scratch-output-in-temp.md) on ki-agentic-harness origin/main.

[KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md) is otherwise fully planned: one folder per agent, named in the prompt, and removed at close unless it holds tracked files. It needs only the location. The system temp folder also avoids having to check that `tmp/` is ignored in every repository.

**Query:** Which location should `ki agent launch` create for each agent's temporary output?

**Options:**

a) (recommended) Use the system temp folder, `$TMPDIR/ki-agents/<run>/<name>/`, following your 16 October rule. Keep THREADS-TMP-HOME's removal when the run closes. Mark [KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md) Ready on that root. b) Keep THREADS-TMP-HOME's `<primary checkout>/tmp/<run>/<name>/`, with a launch warning when `tmp/` is not ignored, and narrow [KI-HARNESS-GOV-196](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-196-scratch-output-in-temp.md) to screenshots outside agent runs.

### FOOTER-GRANTS - how a launch grants fetch or a machine change ([KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md))

**Context:** No authority tier allows `git fetch` without push, or a local machine change you approved. So the `sol-fix` brief contradicted its own footer, and later briefs carry a "this brief governs" workaround. Two parts of [KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md) are settled and need nothing outside tools-ki: the footer starts at the exact `## Rules` line, and a launch warns when the brief names a different report path.

The record recommends separate grants rather than a fifth tier, because fetch and machine changes are not steps on the publication ladder. The grant text would live in ki-agentic-harness, and no harness record for it exists yet.

**Query:** Which authority shape should [KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md) deliver?

**Options:**

a) (recommended) Separate grants: `--allow fetch` and `--allow machine` beside `--rules <tier>`, each adding a harness-owned `grant-<name>.md` section that overrides only the tier's matching ban. The harness owner opens the ki-delegation record for those two assets, and [KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md) becomes Ready once that is agreed. b) Narrow [KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md) to the marker and report-path fixes so it is Ready now, and capture the authority shape later as its own record. c) A fifth cumulative tier, `local`, covering fetch and approved machine changes without push.

### GOV-195-COLLISION - two harness records share [KI-HARNESS-GOV-195](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-195-thread-folder-closed-list.md)

**Context:** In ki-agentic-harness, local `main` is 4 commits ahead of origin and 5 behind.

- Another session's unpushed commit `f0f62c02` (with `c068e4be` and `b4875ac1`) uses [KI-HARNESS-GOV-195](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-195-thread-folder-closed-list.md) for "thread-folder closed list", the harness pair of [KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md).
- origin/main already uses [KI-HARNESS-GOV-195](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-195-granola-screenshots-markers.md) for "granola-screenshots-markers" and [KI-HARNESS-GOV-196](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-196-scratch-output-in-temp.md) for "scratch output in temp".

Those commits will clash when that session rebases. They are not mine, so I left them alone. [KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md) describes the pair by subject rather than by number until this is resolved.

**Query:** Who renumbers the local thread-folder record?

**Options:**

a) (recommended) The harness session that owns `f0f62c02` renumbers its thread-folder record to the next free KI-HARNESS-GOV identifier when it rebases onto origin/main, before pushing. tools-burndown then updates [KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md)'s reference. b) Leave it for the next harness pass to find.

### STORE-REPAIR - accept [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) to unblock [KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md) and [KI-TOOL-KI-CLI-136](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-136-errors-suggest-fixes.md)

**Context:** This is the acceptance part of STORE-REPAIR that you kept for yourself. [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) is Awaiting review and released in `v0.10.5`. [KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md) reuses its availability helper, and the roadmap audit will not let a record with an unfinished blocker be Ready. So [KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md), and [KI-TOOL-KI-CLI-136](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-136-errors-suggest-fixes.md) behind it, stay draft until [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) is accepted. Both are otherwise fully planned.

**Query:** Do you accept [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md)?

**Options:**

a) (recommended) Accept [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) with `ki-accept` after reading its Review section. Then let the thread mark [KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md) Ready, and [KI-TOOL-KI-CLI-136](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-136-errors-suggest-fixes.md) once [KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md) is done. b) Ask for changes, named against its Review section, first.

```text
PUSH-ORDER

Let the thread push tools-ki main fast-forward to origin at its next resting point, including the other runs' f0f21922 and b4043e7a; acceptance of KI-TOOL-KI-CLI-130 and KI-TOOL-KI-CLI-133 stays a separate decision.

---

TMP-HOME

Use the system temp folder, $TMPDIR/ki-agents/<run>/<name>/, for agents' temporary output, following the 16 October rule (KI-HARNESS-GOV-196); keep THREADS-TMP-HOME's removal when the run closes, and mark KI-TOOL-KI-CLI-137 (/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md) Ready on that root.

---

FOOTER-GRANTS

Deliver separate grants in KI-TOOL-KI-CLI-134 (/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md): --allow fetch and --allow machine beside --rules <tier>, each adding a harness-owned grant-<name>.md section that overrides only the tier's matching ban; the harness owner opens the ki-delegation record for those two assets, and KI-TOOL-KI-CLI-134 becomes Ready once that is agreed.

---

GOV-195-COLLISION

The ki-agentic-harness session that owns f0f62c02 renumbers its thread-folder record to the next free KI-HARNESS-GOV identifier when it rebases onto origin/main, before pushing; tools-burndown then updates KI-TOOL-KI-CLI-137's reference.

---

STORE-REPAIR

Accept KI-TOOL-KI-CLI-126 (/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) with ki-accept after reading its Review section, then let the thread mark KI-TOOL-KI-CLI-131 Ready, and KI-TOOL-KI-CLI-136 once KI-TOOL-KI-CLI-131 is done.
```

```text
╭─ run report · 2026-10-16T01:29:00Z ─────────────────╮
│                                                     │
│  █▀▀▄ █▀▀█ █▄ █ █▀▀▀   · run triage-plan finished   │
│  █  █ █  █ █ ▀█ █▀▀    · 4 Ready, 5 still draft     │
│  █▄▄▀ █▄▄█ █  █ █▄▄▄   · nothing running here       │
│                                                     │
╰─────────────────────────────────────────────────────╯
```

- [done] triage-plan: [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md), 127, 135 and 138 Ready, 127's link printer first
- [waiting] PUSH-ORDER
- [waiting] TMP-HOME
- [waiting] FOOTER-GRANTS
- [waiting] GOV-195-COLLISION
- [waiting] STORE-REPAIR
- [unpushed] tools-ki `46392f1a`..`5f1349e5`

Resume line: `Resume Fnd: tools-burndown under current ki-pmo and ki-delegation since 2026-10-16T00:05:00Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.`
