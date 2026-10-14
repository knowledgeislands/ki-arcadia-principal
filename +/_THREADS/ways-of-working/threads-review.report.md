# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › threads-review

**Run report at 23:45 BST · last mark 23:22 BST**

---

## Done

This was a read-only review. Kris raised it as THREADS-TMP: "There seems to be a lot of files created in there. There's things like screenshots that are taken. A lot of them are very temporary based stuff. Temporary things should be in the tmp folder so they are not tracked by git. Maybe we need to be clearer about what kinds of things are in threads and what kinds of things are temporary." I edited nothing except this report.

- **Inventory.** Five repositories have a `+/_THREADS/` folder. Nothing else in the workspaces does.

| Repository | Folders | Reports | Decisions logs | Briefs | Screenshots and images | Scratch and other |
| --- | --- | --- | --- | --- | --- | --- |
| ki-principal | 10 | 84 tracked, 7 untracked | 8 tracked | 1 tracked | 0 | 3 JSON evidence files and 1 `historical-decisions.md`, all tracked (tools-burndown) |
| ki-agentic-harness | 1 (skill-reviews) | 3 untracked | 1 untracked | 3 untracked | 36 PNG, untracked | 5 `.ts` screenshot and dump scripts and 8 old HTML renders under `scratch/`, untracked; 11 MB in total |
| hnr-principal | 4 | 30 tracked | 4 tracked | 3 tracked | 0 | 17 working Markdown files (drafts, registers, ledgers, pack index) and 1 JSON manifest, all tracked (fourth-white-paper) |
| 5g-emerge-phase2 | 1 | 6 untracked | 0 | 0 | 0 | 0 |
| personal/acquire | 1 (acquire-intake) | 10 tracked | 1 tracked | 0 | 0 | a `binary-probe/` folder with 2 Python files and a README, tracked |

- **What writes each kind.**
  - Reports: background agents, at the path `ki agent` gives them. `threadFolder()` is in [thread.ts](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/src/core/agent/thread.ts).
  - Decisions logs: the coordinating thread.
  - Briefs: the coordinating thread. No standard gives them a home.
  - Screenshots and scratch: agents following their coordinator's brief. [brief-area-layout.md](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/+/_THREADS/skill-reviews/brief-area-layout.md) told the agent to write PNGs "into `.../+/_THREADS/skill-reviews/screens/` (untracked scratch is fine; do not commit PNGs)".
  - The tools-burndown JSON and historical file: commit `7e3f69c5`, "preserve run knowledge".
  - The fourth-white-paper drafts: hnr-principal commit `17dddc7`, "prepare evidence and circulation drafts".
  - The acquire probe: personal/acquire commit `ef0deb3`.
  - The state folder `~/.local/state/ki/agents/` already holds scratch. Six runs have improvised `<name>-work/` folders, and the folder holds 194 PNG and 402 HTML files. The launcher creates neither.
- **What the standards say today.**
  - The ki-delegation [run packet](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md) names exactly two kinds of knowledge file for the thread folder: `decisions.md` and `<name>.report.md`. Runtime files stay in the state folder, under Kris's settlement: "tracked +/_THREADS/<thread>/ for the decisions log and agent reports; state folder keeps runtime only." The standard says nothing about briefs, scratch, screenshots or a temporary location.
  - [ki-pmo](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/references/standards-pmo.md) makes the folder tracked and adds the tidying rule, which removes only answered reports.
  - ki-repo's [repository standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/keystone/ki-repo/references/standards-repository.md) already reserves `tmp/` at any depth for "disposable local output: build previews, scratch renders, and anything else safe to delete". Nothing under `tmp/` is ever tracked. The same standard keeps `+/` for temporary inputs awaiting further work.
  - ki-repo-kb says nothing about `+/_THREADS`.
- **.gitignore.** All five repositories carry the managed `tmp/` rule, which applies at any depth. So `<repo>/tmp/<run>/` is ignored, and so is `+/_THREADS/<run>/tmp/`. Nothing ignores `screens/` or `scratch/`.
- **Commit.** This report is committed and pushed with this run. The commit result is in the run's final message, because a report cannot name its own commit.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- The untracked reports are commit lag, not temporary files. That is 7 in ki-principal and 6 in 5g-emerge-phase2. Their owning threads commit them under the existing rule, "threads need to know that they need to commit their work under +/_THREAD/".
- The skill-reviews folder in ki-agentic-harness is wholly untracked, including its `decisions.md`. Its three agents report `DONE`. Under the existing rule its log and reports should be committed, whatever is decided below.

## Queries

### THREADS-CONTENT - what may live in a thread folder

**Context:** The standard lists only `decisions.md` and `<name>.report.md`. In practice, thread folders also hold briefs, screenshots, scripts, HTML renders, JSON evidence, white-paper drafts and a probe program. Some is tracked and some is not. A closed list makes the rule checkable. A brief's lasting content is already in the decisions log and the launched prompt. Evidence a report relies on belongs in the report, a commit or a work record.

**Query:** Should a thread folder hold a closed list of `decisions.md` and `<name>.report.md` only, with everything else living elsewhere?

**Options:**

a) (recommended) Closed list: `decisions.md` and `<name>.report.md` only. A brief lives in the state folder beside the prompt it becomes. Work products go to their owning home (Project folder, `-/` or a record). Temporary output goes to the temporary location.

b) Also allow `<name>.brief.md`, tracked, so that a brief survives loss of the state folder.

c) Allow any Markdown file, and exclude only binaries and generated files.

### THREADS-TMP-HOME - where temporary output goes

**Context:** Kris said "Temporary things should be in the tmp folder so they are not tracked by git." ki-repo already reserves an ignored `tmp/` in every repository for disposable output. That location suits screenshots the owner looks at in the checkout. The state folder is outside every repository, is not backed up, and already holds improvised `<name>-work/` folders. An agent in a worktree should use the primary checkout's `tmp/`, so that its output survives removal of the worktree until the run closes.

**Query:** Where should a run's temporary output go?

**Options:**

a) (recommended) `<primary checkout>/tmp/<run>/<name>/` in the repository the agent works in, ignored by the existing rule and deleted when the run closes. Machine-only runtime scratch that the owner never looks at may stay in the state folder as `<name>.work/`.

b) The state folder only, as `~/.local/state/ki/agents/<run>/<name>.work/`.

c) `+/_THREADS/<run>/tmp/`, which the existing any-depth rule already ignores.

### THREADS-TELL - how agents and the launcher are told

**Context:** Briefs are where temporary output got routed into the thread folder, so the rule must reach every brief and prompt. Changing the ki-delegation and ki-pmo standards needs Kris's acceptance, so it opens a record in ki-agentic-harness. A launcher change opens a record in tools-ki. The ki-pmo rubric already scans thread folders for reports, which makes a mechanical check cheap.

**Query:** How should the rule be carried to agents and the launcher?

**Options:**

a) (recommended) Open one ki-agentic-harness record that does three things:

1. Add the closed list and a "Temporary files" row to the ki-delegation run packet.
2. Add one line to the `run-prompt.md` authority footer: "Temporary output goes to `<repo>/tmp/<run>/<name>/`; the thread folder takes only your report."
3. Add a ki-pmo rubric item that flags any other file under `+/_THREADS/<run>/`.

Open one tools-ki record for `ki agent launch` to create `tmp/<run>/<name>/` and write its path into the progress protocol. `ki agent close` would remove that folder.

b) Change the standards text and the prompt footer only, with no rubric check and no launcher change.

### THREADS-CLEAR - clearing existing temporary files

**Context:** Each thread folder belongs to its thread, and the tidying rule lets a thread tidy only its own folder. The material to clear is:

- the untracked `screens/` and `scratch/` in skill-reviews (11 MB);
- the tracked JSON evidence, brief and historical file in tools-burndown;
- 17 tracked drafts and registers, a brief set and a manifest in hnr-principal's fourth-white-paper;
- the tracked `binary-probe/` in acquire-intake.

Tracked files leave Git history behind when removed. Untracked ones do not, so they need a check that nothing in them is wanted.

**Query:** How should the existing non-conforming files be cleared?

**Options:**

a) (recommended) Each owning thread clears its own folder at its next mark, as an extension of the tidying rule:

1. Move untracked scratch to `<repo>/tmp/<run>/`.
2. Home each tracked work product to its owning place, such as the fourth-white-paper Project folder or the acquire repository's code, or `git rm` it by explicit path once a report or commit holds what it showed.
3. Move briefs to the state folder.

The ways-of-working thread sends each thread the instruction through its inbox.

b) One sweep agent per repository now, with the owning thread's agreement in each case.

```text
THREADS-CONTENT

Adopt a closed list for +/_THREADS/<run>/: decisions.md and <name>.report.md only; briefs live in the state folder beside their prompt, work products go to their owning home, and temporary output goes to the temporary location.

---

THREADS-TMP-HOME

Temporary run output goes to <primary checkout>/tmp/<run>/<name>/ in the repository the agent works in, ignored by the existing tmp/ rule and deleted at run close; machine-only runtime scratch may stay in the state folder as <name>.work/.

---

THREADS-TELL

Open one ki-agentic-harness record to add the closed list and a Temporary files row to the ki-delegation run packet, add the line "Temporary output goes to <repo>/tmp/<run>/<name>/; the thread folder takes only your report." to the run-prompt.md authority footer, and add a ki-pmo rubric item flagging any other file under +/_THREADS/<run>/; and one tools-ki record for ki agent launch to create tmp/<run>/<name>/ and name it in the progress protocol, with ki agent close removing it.

---

THREADS-CLEAR

Each owning thread clears its own +/_THREADS/<run>/ at its next mark: untracked scratch moves to <repo>/tmp/<run>/, tracked work products are homed or removed by explicit git rm once a report or commit holds them, and briefs move to the state folder; ways-of-working sends each thread (skill-reviews, tools-burndown, fourth-white-paper, acquire-intake) the instruction through its inbox.
```

```text
╭─ run report · 2026-10-14T22:45:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued from this run
- [waiting] THREADS-CONTENT
- [waiting] THREADS-TMP-HOME
- [waiting] THREADS-TELL
- [waiting] THREADS-CLEAR

```text
Resume ways-of-working under current ki-pmo and ki-delegation since 23:22 BST: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
