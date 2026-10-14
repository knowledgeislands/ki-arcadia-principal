# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › skills-map

**Run report at 20:51 BST · last mark 18:56 BST**

---

## Done

- Read the working model from its sources, not memory: the [ki-pmo](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/SKILL.md) and [ki-delegation](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/SKILL.md) standards and rubrics, the authority footers, [ki-checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-checkpoint/SKILL.md), [ki-recap](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-recap/SKILL.md), the ki-work family, [ki-git](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-git/SKILL.md), [ki-decision-records](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-decision-records/SKILL.md), [ki-repo-kb](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/repo-structure/ki-repo-kb/SKILL.md), the coordinator hook, the output style, `.ki.toml`, the pre-commit stub, this thread's checkpoint and decisions log, and the record states in three repositories. Nothing was edited.
- The study follows in five parts: overview, units, flows, diagram, seams and overlaps. Queries for simplifications are in the Queries section.
- The brief's Scope says "Read-only ... commit nothing" while its body asks for a commit and a fast-forward push, and the authority footer forbids any remote call. Read as: write the report, attempt a local explicit-path commit of this file only, no fetch, pull or push. The commit was refused by the gate; the outcome is under In Progress.
- The ki-principal commit gate currently fails on a file outside this thread, `Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md` (STREAM-9), so a commit here is blocked by the whole-tree audit. Not bypassed.

### Overview

Kris sends a message to a coordinating thread. The thread, under ki-pmo, logs any decision in Kris's words in the thread folder's decisions log, updates its checkpoint, and writes a brief for a detached background agent under ki-delegation, quoting the decision and ending with one authority footer. It launches the agent with `ki agent`, which runs it in its own session with runtime files under the state folder, and the thread waits only through a detached waiter. The agent works in a worktree or a primary checkout, follows ki-git for explicit-path commits, moves a work record through the ki-work-roadmap lifecycle, and ends by writing a run report in the owner-report shape into the thread folder and `DONE` into its status file. The thread reads the report, gives Kris a Summary with Done, In Progress and Queries and a stacked reply block, and commits the thread folder. Kris answers, usually by sending the reply block back; the thread logs the answer and launches the next agent, which pushes if its tier allows and moves the record to done through ki-accept. At a mark the thread classifies decisions into their durable homes (a Decision Record, a skill, the checkpoint or the record) and tidies the thread folder. At Project close the thread promotes what remains, removes its checkpoint, commits and pushes the thread folder, deletes it, and closes the run.

### Units

One row per unit. "Owns" is what only it may define; "does not own" is the nearest thing it might be mistaken for; "hands to" is who takes over at its edge.

| Unit | Owns | Does not own | Hands to |
|---|---|---|---|
| [ki-pmo](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/SKILL.md) | How a coordinating thread behaves: the three hard rules, the five-call turn budget, thread types (conversational, coordination, state-of-play), the owner report heading and footer banner, marks and recaps, decision classes and their homes, re-anchoring after compaction, red-x recovery, Project close, committing and tidying the thread folder. Owns the text of the coordinator hook and the output style. | The run packet, prompt shape and authority tiers (ki-delegation). The checkpoint form (ki-checkpoint). The record lifecycle (ki-work-roadmap). | ki-delegation for every launch and for the report shape; ki-checkpoint for UPDATE and REMOVE; ki-recap for recap composition; ki-git through the agents it launches. |
| [ki-delegation](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/SKILL.md) | Detached background runs: the run packet split into runtime files under `~/.local/state/ki/agents/<run>/` and knowledge files under `+/_THREADS/<run>/`, the prompt shape, the four authority tiers and their footers, the decisions log rules, coordination (DONE gates, worktrees, fast-forward-only pulls), the run queue, monitoring, the owner-report shape, and durable delegation packets. | Thread conduct, marks and banners (ki-pmo). Cross-repository contracts (ki-trades, kept distinct by [ADR-KI-HARNESS-SKILLS-005](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/decisions/ADR-KI-HARNESS-SKILLS-005-delegation-and-trades-are-distinct-capabilities.md)). | `ki agent` as its reference launcher; ki-pmo for how the thread uses the reports; ki-decision-records, a skill or the checkpoint for consolidating in-force decisions. |
| `ki agent` in tools-ki (not a skill) | The launcher: `launch`, `queue`, `dispatch`, `wait`, `watch`, `status`, `decide`, `reconcile`, `close`, `new`; the runtime files; the run marker that silences the hook inside an agent. | The knowledge files: the standard says the thread copies the log and reports into `+/_THREADS/<run>/` by hand until the launcher writes them. | The thread (ki-pmo) at every status change; the shell for the agent's work. |
| [ki-checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-checkpoint/SKILL.md) | One active record per thread under `+/_CHECKPOINTS/`, naming (`<initiative>.<project>` or `_state-of-play`), label, the exact section form, and UPDATE, RESUME and REMOVE as agent procedures. Reconstruction, not continuity. | Being a decision log. Being a recap. Being a host command. | ki-pmo reads it at bootstrap and re-anchoring; ki-recap composes `checkpoint <thread>` on top of UPDATE; ki-work's registry is where its label must resolve. |
| [ki-recap](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-recap/SKILL.md) | The ordinary session recap: summarise, list outstanding work, harvest learnings. The `checkpoint <thread>` composition. | In a coordinating thread, the recap itself: it hands Summary, Recap and Full summary to the ki-pmo report forms. Closing records. Writing checkpoints on its own. | ki-pmo for the forms; ki-checkpoint for the write; ki-authoring for knowledge promotion. |
| [ki-work](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-work/SKILL.md) | Choosing the roadmap adapter for a repository, and the Project registry under `Streams/Projects/` and `Streams/Initiatives/` in the Capital, including the close-out assessment. | The record form (its adapters). Thread conduct. | ki-work-roadmap or ki-repo-kb-streams for records; ki-pmo reads the registry for the report heading and rubric item PMO-2. |
| [ki-work-roadmap](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-work-roadmap/SKILL.md) and [ki-repo-kb-streams](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/repo-structure/ki-repo-kb-streams/SKILL.md) | The record itself: flat files under `docs/roadmap/` or `Streams/Roadmap/`, the `_ISSUES.md` ledger, and the lifecycle triage or draft, ready, in-progress, awaiting-review, done or cancelled. | Who does the work or when. | ki-next, ki-plan, ki-implement, ki-accept for each transition. |
| [ki-next](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-next/SKILL.md) | Capturing, adopting and selecting work: a record exists in triage or draft. | Shaping it to Ready. | ki-plan. |
| [ki-plan](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-plan/SKILL.md) | Shaping a record to Ready with scope, evidence and acceptance. | Doing the work. | ki-implement. |
| [ki-implement](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-implement/SKILL.md) | Taking a Ready record to Awaiting review with evidence. | Accepting its own work. | ki-accept. |
| [ki-accept](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-accept/SKILL.md) | Closure, cancellation and the prune commit `chore(roadmap): prune <N> done work record(s)`. | Launching the work. | Git history, which holds the pruned record at its last revision. |
| [ki-batch](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-batch/SKILL.md) | A bounded authority envelope for several records at once. | The envelope's contents. | The ki-work family inside the envelope. |
| [ki-decision-records](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-decision-records/SKILL.md) | Typed, living Decision Records under `Admin/Governance/Decisions/` in a knowledge base or `docs/decisions/` in a code repository; amend before creating. | The working decisions log in the thread folder (ki-delegation). | ki-authoring for the form; ki-pmo's Rule class promotes into it. |
| [ki-git](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-git/SKILL.md) | Commit and hygiene policy: explicit staging, touched-path tracking, the serialised write window, stale-lock guard semantics, the four working approaches. | Hook content (ki-engineering) and hook existence (ki-repo), split by [ADR-KI-HARNESS-SKILLS-017](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/decisions/ADR-KI-HARNESS-SKILLS-017-commit-gate-existence-and-content-are-owned-separately.md). | ki-engineering and ki-repo at the hook; every agent and thread that commits. |
| [ki-engineering](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-engineering/SKILL.md) | TypeScript and Bun, the Husky and Commitlint binding, and the content of the `.githooks/pre-commit` stub. | Whether a hook must exist. | ki-repo for existence; the pre-commit gate at every commit. |
| [ki-repo](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/keystone/ki-repo/SKILL.md) | Repository shape and declarations in `.ki.toml`, and that a commit gate exists (HOOK-1, HOOK-2). | What the gate checks. | ki-engineering for the stub; ki-repo-kb for the knowledge-base gate. |
| [ki-repo-kb](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/repo-structure/ki-repo-kb/SKILL.md) | The five zones and the `+` and `-` staging areas; the Enactment gate that nothing reaches Admin, Pillars or Resources except through approved forward work, set by [SDR-KI-PRINCIPAL-004](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Decisions/SDR-KI-PRINCIPAL-004-the-enactment-process.md); GATE-1, that the committed pre-commit runs `ki repo audit` check-only and never conform. | The content of threads, checkpoints or records that live in `+`. | ki-repo-kb-streams for records; the gate for every commit in a knowledge base. |
| [ki-authoring](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-authoring/SKILL.md) | Markdown and TOML form and durable knowledge placement. | What the knowledge says. | Every unit that writes a document. |
| [ki-skills](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/keystone/ki-skills/SKILL.md) | The skill contract, dependencies and the generated rubric publication that turns a standard into audit items. | Any one skill's content. | `ki repo audit` for each rubric. |
| [ki-trades](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-trades/SKILL.md) | The cross-repository contract where the receiving repository holds priority and acceptance. | Delegation within one owner's control. | ki-delegation when the trade is done by a background agent. |
| Coordinator hook (not a skill) | Nothing of its own: injects the ki-pmo rules on every owner message and the re-anchoring pointer after compaction, keyed on `[skills.ki-pmo]` in `.ki.toml`, silent inside a `ki agent` run. | Its own binding: chezmoi writes it into `~/.claude/settings.json`. | The thread. |
| Output style (not a skill) | Nothing of its own: restates the ki-pmo rules, report shape and banner for Claude Code, selected by `outputStyle` in `.claude/settings.json`. | Its own binding: chezmoi manages it. | The thread. |

### Flows

Opening a thread

1. ki-pmo: the state-of-play thread seeds a checkpoint and an opener for the Project, within the cap of three or four active coordination threads.
2. ki-checkpoint: the new thread resumes from `+/_CHECKPOINTS/<initiative>.<project>.md`, whose label must resolve in the ki-work registry.
3. ki-pmo: the thread reads the standard, notes `ki-pmo read at <revision>` in the checkpoint, runs `ki agent status`, reads its inbox and confirms in one line. The coordinator hook has injected the rules on the first message.
4. ki-delegation: the thread folder `+/_THREADS/<run>/` holds `decisions.md` from the first decision; ki-git commits it by explicit path.

A decision being made and logged

1. ki-pmo: the thread asks a clear-option question through the runtime's structured-question tool, recommendation first.
2. ki-delegation: the answer goes into `decisions.md` in Kris's words with the date, before any work it authorises launches. Kris set on 2026-10-13 that it "should be written about what the decision was or is", and on 2026-10-14 that a number "has no meaning to me because I don't know what the decision was".
3. ki-pmo: at the next mark the thread classifies the entry as Operational, Rule, Standalone or Held and promotes a Rule into its durable home: a skill, a Decision Record under ki-decision-records, or the checkpoint.
4. ki-git: the thread folder is committed and pushed at the report or resting point.

Dispatching an agent and getting its report

1. ki-pmo: the thread writes nothing substantive; it writes a brief.
2. ki-delegation: the brief quotes the decision in Kris's words and date, has numbered steps, a verification step, a report path, the two safety lines, and ends with the lowest sufficient authority footer from `assets/`.
3. `ki agent launch` or `queue`: the agent runs detached with `KI_AGENT_RUN` set, so the hook stays silent; about three run per thread with the rest queued, as Kris set on 2026-10-14 in "CONCURRENCY".
4. ki-git and the ki-work family: the agent works in a worktree or primary checkout, commits by explicit path with the trailer naming its model, and moves its record.
5. ki-delegation: the agent writes `<name>.report.md` in the owner-report shape into the thread folder and `DONE` into its status file; the thread waits only through `ki agent wait --next` or `watch`.
6. ki-pmo: the thread gives timed one-to-two-line updates while work runs and the full Summary only when all dispatched work has finished or on request, as Kris set in "UPDATE-CADENCE".

A record from opening to acceptance and prune

1. ki-next: an agent captures the record in triage or draft under ki-work-roadmap or ki-repo-kb-streams.
2. ki-plan: an agent shapes it to Ready; the thread records Kris's approval before launching.
3. ki-implement: an agent takes it to Awaiting review with evidence and, if its tier is `push`, pushes.
4. ki-accept: an agent with the `prune` tier closes it and prunes with `chore(roadmap): prune <N> done work record(s)`.
5. ki-pmo and rubric item PMO-7: every later report links the record as `<ID> (pruned)` to GitHub at its last revision, as [KI-HARNESS-GOV-188 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/0a116e4b/docs/roadmap/KI-HARNESS-GOV-188-report-record-links.md) set.

Compaction and re-anchoring

1. The coordinator hook, on `SessionStart` with source `compact`, injects the pointer to the ki-pmo re-anchoring section.
2. ki-pmo: the thread re-reads the standard and its checkpoint in full, runs `ki agent status`, reads its inbox, confirms in one line and answers in owner-report form. Re-anchoring moves no mark.
3. ki-checkpoint: the checkpoint is the reconstruction source; the decisions log and the reports in the thread folder, or Git history for tidied ones, supply the detail.

Reaching rest

1. ki-pmo: when nothing is running or queued the thread gives a Summary with the REST footer banner, the bracketed-state list and the resume line in its own text block.
2. ki-git: the checkpoint and thread folder are committed and pushed by explicit path.
3. ki-recap, if asked: in a coordinating thread it hands the recap to the ki-pmo forms rather than running its own three legs.

Project close

1. ki-pmo: promote the decisions still only in the log into their homes.
2. ki-pmo and ki-work: resolve the design folder and write the Project's close-out assessment in the registry note.
3. ki-checkpoint: REMOVE the checkpoint.
4. ki-pmo, ki-git and `ki agent close`: tidy, commit and push the thread folder, delete it, close the run with the strict gate or the `--reconciled` waiver, as Kris settled with "keep the close gate strict with the reconciled waiver". The DONE frame appears once.

### Diagram

```text
 Kris ──message──▶ COORDINATING THREAD (ki-pmo)
                    │ logs decision in Kris's words  (ki-delegation: decisions.md)
                    │ updates checkpoint             (ki-checkpoint: +/_CHECKPOINTS/)
                    │ writes brief + authority footer (ki-delegation: assets/rules-<tier>.md)
                    ▼
             ki agent launch / queue ──▶ DETACHED AGENT (own session, KI_AGENT_RUN set)
                    │                        │ work in worktree or checkout   (ki-git)
                    │ wait --next / watch     │ record: next → plan → implement → accept
                    │                        │         (ki-work-roadmap / ki-repo-kb-streams)
                    │                        │ commit gate: ki repo audit (GATE-1)
                    │                        ▼
                    ◀── <name>.report.md in +/_THREADS/<run>/ + DONE in status file
                    │
                    ▼
 Kris ◀──Summary: Done / In Progress / Queries + reply block + banner (ki-pmo shape,
         ki-delegation owner report; hook + output style restate it)
                    │
          mark ─────┼──▶ classify → Decision Record (ki-decision-records)
                    │                        → skill, checkpoint or record
                    │    tidy thread folder (Git history keeps the rest)
                    ▼
          Project close ──▶ promote, close-out note (ki-work), checkpoint REMOVE,
                           push + delete thread folder, ki agent close
```

### Seams and overlaps

Where two or more places state the same rule, and what actually enforces it.

- **The owner-report shape is written in six places.** The ki-pmo standard at `skills/change-management/ki-pmo/references/standards-pmo.md` (Report forms and Banner), the ki-delegation standard at `skills/governance/ki-delegation/references/standards-background-runs.md` (Reporting, Owner report), `output-styles/ki-coordinator.md`, the `line` variable in `hooks/coordinator-reminder.sh`, the prompt skeleton `skills/governance/ki-delegation/assets/run-prompt.md`, and both rubrics (PMO-6 and RUN-4). The frames and heading are held byte-identical between the standard and the output style by the banner test; the rest is held in step only by hand. Each 2026-10-14 change (section names, stacked reply block, tidy rule) had to be made in all six.
- **The hook and output style belong to ki-pmo but are bound by chezmoi.** The standard says ki-pmo owns both lines, yet `ki` writes neither `~/.claude/settings.json` (the hook, from `.chezmoidata/coordinator-hook.yaml`) nor `outputStyle` in `ki-principal/.claude/settings.json`. A repository that declares `[skills.ki-pmo]` on a machine without the chezmoi binding gets no reminder and no style, and nothing audits that.
- **The decisions log has two writers and one reader.** The ki-delegation standard says the thread copies the log and each report into `+/_THREADS/<run>/` by hand "until then", while `ki agent decide` describes itself as appending to the thread's tracked decisions log. Which one writes is unclear from the sources. Kris set the split on 2026-10-14: "tracked +/_THREADS/<thread>/ for decisions log and agent reports; state folder keeps runtime only."
- **Decision citation and the thread-folder commit rule are each stated twice.** The words-not-number rule is in the ki-pmo Decisions section and the ki-delegation Decisions log section; the commit-and-push rule is in ki-pmo Thread working rules and ki-delegation Reporting. Both are judgment items only (PMO-6, RUN-3); no `ki` command checks either.
- **The UPDATE-CADENCE and CONCURRENCY quotes are duplicated verbatim** in the ki-pmo standard, the ki-delegation Reporting and Run queue sections, and the output style.
- **Three homes for a decision.** The checkpoint "is never a decision log" (ki-checkpoint), the decisions log is the working record (ki-delegation), and the durable home is a Decision Record, a skill or the checkpoint (ki-pmo decision classes). The classification at the mark is the only hand-off, and it is unenforced.
- **ki-recap defers to ki-pmo in a coordinating thread.** `ki-recap/SKILL.md` line 18 says it hands the forms over and does not run its three legs. Two skills therefore answer "recap", with the choice decided by whether the repository declares ki-pmo.
- **The commit gate is whole-tree.** `ki-principal/.githooks/pre-commit` runs `ki repo audit --skill ki-repo-kb` over the whole checkout, so another thread's dirty or failing file blocks this thread's commit of its own folder. Today that is `Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md`. [KI-HARNESS-GOV-192](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-192-scoped-gate-verdict.md) (awaiting review) and [KI-TOOL-KI-CLI-129](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-129-staged-audit-verdict.md) (ready) scope the verdict to the staged index.
- **What the machine checks is thin.** Mechanical items are PMO-1, PMO-2, PMO-3 and PMO-7, RUN-1, GATE-1 and the banner test. The three hard rules, the turn budget, the report sections, the log-before-launch rule and the tidy rule are all judgment items, so the hook's reminder is the only thing applying them during a turn.
- **The checkpoint's noted revision drifts.** This thread's checkpoint records `ki-pmo read at b81bcfa3`, while ki-pmo has changed since (the tidy rule landed in the harness at `daa63224`). The rule to re-read "whenever the skill has changed" has no trigger.
- **The design folder has two candidate homes.** The ki-pmo close step "resolve the design folder" covers a folder under the Project note; the knowledge base also has `+/_DESIGN/` as a staging home. The sources do not say which a thread should use.
- **`ki agent close` and ki-accept both finish things, on different objects.** Close archives a run and may delete its runtime files; accept closes a record. The standard says plainly that one is not the other, but a brief that says "close" needs the gloss.
- **Pruned-record linking needs two facts the thread cannot get from one command.** The last revision is the parent of the prune commit, found with `git log --diff-filter=D`, and the path is the file's name at that revision. The output style says "usually the parent of the prune commit"; nothing computes it.
- **[KI-HARNESS-GOV-175](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md) is listed as live.** `docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md` still exists in the harness; the thread's earlier reports may have treated it as pruned.

Related records: [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md) (triage), [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) and [KI-PRINCIPAL-ECO-014](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md) (both in progress), [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md) (draft), [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md) (done), [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md) (draft); pruned: [KI-HARNESS-GOV-180 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/dd5761c6/docs/roadmap/KI-HARNESS-GOV-180-tracked-thread-decisions-home.md), [KI-HARNESS-GOV-185 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/a5584ec8/docs/roadmap/KI-HARNESS-GOV-185-ki-pmo-extraction.md), [KI-HARNESS-GOV-187 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/e60b4e45/docs/roadmap/KI-HARNESS-GOV-187-thread-model-and-banner.md), [KI-HARNESS-GOV-190 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/e60b4e45/docs/roadmap/KI-HARNESS-GOV-190-stacked-reply-block.md).

## In Progress

Nothing is running.

Outstanding - no action requested now

- The local explicit-path commit of this report was refused twice by the ki-principal gate on the unrelated STREAM-9 failure in `Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md`. The file is left staged and uncommitted for the thread to commit once that note is fixed or the gate is scoped. The gate's formatter also collapsed the option lines on the first attempt; they are now separated by blank lines so they survive it. No fetch, pull or push under the `none` tier.
- The harness is level with its remote as far as the footer allows a check; no pull was made.

## Queries

### REPORT-SOURCE - one source for the owner-report shape

**Context:** The report shape is written in six places and held in step by hand except for the frames, which the banner test guards. Every change this week had to be made six times.

**Query:** Should the ki-pmo standard become the single source, with the hook line, output style and prompt skeleton generated from it by a `ki dev` command and the ki-delegation standard linking rather than restating?

**Options:**

a) (recommended) Yes: generate the hook line, output style and prompt skeleton from the ki-pmo standard and make ki-delegation link to it, with the generated files checked by the existing test.

b) Keep the restatements but add a test that fails when any of the six drifts.

c) Leave as is.

### LOG-WRITER - who writes the decisions log

**Context:** The ki-delegation standard says the thread copies the log and reports into the tracked thread folder by hand for now; `ki agent decide` says it appends to the tracked log. The sources do not agree on which is true today.

**Query:** Should `ki agent decide` and `ki agent` report completion write directly into `+/_THREADS/<run>/`, retiring the hand copy?

**Options:**

a) (recommended) Yes: make the launcher the only writer of the thread folder's log and report files, and delete the "until then" sentence from the standard.

b) Keep the hand copy and remove the claim from `ki agent decide`.

### HOOK-BINDING - who binds the coordinator hook and style

**Context:** ki-pmo owns the hook and style text, but chezmoi binds both into Claude Code settings. A repository that declares ki-pmo on a machine without that binding runs unreminded, and nothing audits it.

**Query:** Should `ki` bind the hook and output style when a repository declares `[skills.ki-pmo]`, or should a rubric item at least check the binding is present?

**Options:**

a) (recommended) Add a mechanical rubric item that the binding is present where ki-pmo is declared, and leave chezmoi as the binder for now.

b) Move the binding into `ki` so declaration alone is enough.

c) Leave as is.

### RECAP-OWNER - one owner for recaps

**Context:** ki-recap hands recaps to ki-pmo in a coordinating thread and runs its own three legs elsewhere. Two skills answer "recap".

**Query:** Should ki-pmo own the coordinating-thread recap outright and ki-recap stop mentioning it, so each skill has one answer?

**Options:**

a) (recommended) Yes: ki-recap keeps the ordinary session recap only, and ki-pmo's standard carries the one sentence saying so.

b) Leave the deferral in ki-recap.

```text
REPORT-SOURCE

Make the ki-pmo standard the single source: generate the hook line, the output style and the prompt skeleton from it with a ki dev command, make the ki-delegation standard link to it rather than restate it, and have the existing banner test check the generated files.

---

LOG-WRITER

Make ki agent the only writer of the thread folder's decisions log and report files, and delete the "until then" hand-copy sentence from the ki-delegation standard.

---

HOOK-BINDING

Add a mechanical rubric item checking the coordinator hook and output style are bound wherever [skills.ki-pmo] is declared, and keep chezmoi as the binder for now.

---

RECAP-OWNER

Give ki-pmo the coordinating-thread recap outright: ki-recap keeps the ordinary session recap only, and the ki-pmo standard carries the one sentence saying so.
```

```text
╭─ run report · 2026-10-14T19:51:10Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] REPORT-SOURCE
- [waiting] LOG-WRITER
- [waiting] HOOK-BINDING
- [waiting] RECAP-OWNER
- [blocked] report commit by the ki-principal gate on an unrelated STREAM-9 failure

```text
Resume Knowledge Islands model: ways-of-working under current ki-pmo and ki-delegation since 18:56 BST: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
