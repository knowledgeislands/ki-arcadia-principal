# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › cli126-plan

**Run report at 22:00 BST · last mark 21:58 BST**

---

## Done

- **[KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) adopted into Now and planned to Ready** under Project `ways-of-working`. This quotes Kris's CI-STORE decision: "adopt KI-TOOL-KI-CLI-126 into Now and plan it, so that ki repo repair reports an unbound store without failing, the audit step runs again, and CI goes red only on real findings". The plan does five things:
  - `ki repo repair` reports an unbound or unavailable store as a warning.
  - Repair still registers the repository and projects its skills, and passes when nothing else is wrong.
  - The test that expects repair to fail is replaced. New contract tests include one that replays ki-principal's CI sequence without network.
  - It cites the CI evidence: the run on `b73e7e4` stopped at `ki repo repair` with "declared sources store is not bound", and none of the last 30 runs passed.
  - Its Verify reproduces CI locally against ki-principal. After release and the pin bump, it checks that ki-principal's CI reaches the `ki repo audit --repo .` step on the runner and fails, if at all, only on audit findings such as the known STREAM-9 note.
- **The record is narrower and the remainder has its own record.** The decision covers repair only, so I moved the rest of the original boundary to a new triage record, [KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md). That covers `ki repo open`, the VS Code workspace, a registry marker for a store a host deliberately lacks, store status reporting, and `ki repo store create` off macOS. It is blocked by KI-TOOL-KI-CLI-126 and still carries the open design points.
- **Commits in tools-ki:** `c7e072a` reserves KI-TOOL-KI-CLI-131, and `c7b0e33` adopts, plans and captures. `ki repo audit --skill ki-work-roadmap` and `--skill ki-work` both pass. No code was touched, including `ki agent` code. The commit trailer names Claude Opus 5.5, the model that made the commits, not the Fable 5.1 the brief gave.
- **Pushed to tools-ki `main` (`3a88731..c7b0e33`), including three commits that were not mine.** `git log origin/main..HEAD` listed them before the push, and I misread the list. They are `41e11c9` "docs(roadmap): reserve KI-TOOL-KI-CLI-130", `9c4c0c0` "feat(dev): add ki dev skill generate for generated skill surfaces" and `43da380` "chore(roadmap): prune 1 done work record". All three were already committed locally by another session. This broke the rule against pushing other commits without asking. See PUSHED-OTHERS.

## In Progress

Nothing. Implementation was not in scope.

## Queries

### PUSHED-OTHERS - three other commits reached tools-ki main

**Context:** When I pushed my two commits, three earlier local commits from another session went to tools-ki `main` with them: `41e11c9`, `9c4c0c0` (a `feat(dev)` code change adding `ki dev skill generate`) and `43da380`. The roadmap audit passes on the result. I did not run the test suite on `9c4c0c0`. They cannot be withdrawn without a revert commit, because force-pushing is not allowed.

**Query:** How should the three pushed commits be handled?

**Options:** a) (recommended) Keep them on `main` and have the session that made them confirm they were ready for `main` and that tools-ki's CI is green on `c7b0e33`. b) Add a revert commit for `9c4c0c0` until its owner confirms it. c) Do nothing further.

### CLI126-DELIVER - deliver KI-TOOL-KI-CLI-126

**Context:** [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) is Ready in Now. CI only gets its whole-tree audit back after three steps: delivery, a tools-ki release, and a bump of ki-principal's `.github/ki-version`. `log-writer` may work in tools-ki on `ki agent`, and the plan keeps clear of that code.

**Query:** How should KI-TOOL-KI-CLI-126 be delivered?

**Options:** a) (recommended) Launch a background `ki-implement` run for KI-TOOL-KI-CLI-126 to Awaiting review, then release tools-ki and bump ki-principal's `.github/ki-version`, and check that ki-principal CI reaches the audit step. b) Implement it to Awaiting review only, and decide on the release separately. c) Leave it Ready for now.

### CLI131-SPLIT - keep the remainder in a separate record

**Context:** I narrowed KI-TOOL-KI-CLI-126 to repair, as the decision asked. The rest of its original boundary is now [KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md), at triage. vega's stopgap binding of an empty `sources` directory waits for that record.

**Query:** Should the split stand?

**Options:** a) (recommended) Keep the split and leave KI-TOOL-KI-CLI-131 at triage until the repair fix lands. b) Fold KI-TOOL-KI-CLI-131 back into KI-TOOL-KI-CLI-126 and replan it as one delivery. c) Adopt KI-TOOL-KI-CLI-131 into Next now.

```text
PUSHED-OTHERS
a) Keep them on main and have the session that made them confirm they were ready for main and that tools-ki's CI is green on c7b0e33.

CLI126-DELIVER
a) Launch a background ki-implement run for KI-TOOL-KI-CLI-126 to Awaiting review, then release tools-ki and bump ki-principal's .github/ki-version, and check that ki-principal CI reaches the audit step.

CLI131-SPLIT
a) Keep the split and leave KI-TOOL-KI-CLI-131 at triage until the repair fix lands.
```

```text
╭─ run report · 2026-10-14T21:00:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █  █ █▀▀▀ █  █   · thread busy             │
│  █▀▀▄ █  █ ▀▀▀█  ▀█▀   · running or queued work  │
│  █▄▄▀ █▄▄█ ▄▄▄█   █    · lines below say which   │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [running] pmo-simplify - REPORT-SOURCE, HOOK-BINDING, RECAP-OWNER in ki-pmo
- [queued] log-writer - after pmo-simplify
- [queued] heartbeat - after pmo-simplify
- [committed] cli126-plan - KI-TOOL-KI-CLI-126 Ready in Now, KI-TOOL-KI-CLI-131 captured, pushed
- [waiting] PUSHED-OTHERS, CLI126-DELIVER, CLI131-SPLIT
