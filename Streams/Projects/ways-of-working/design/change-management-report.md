# Change management: merged report

**Brief:** [[change-management-brief]] · **Reviews:** [[change-management-review-fable]] (Fable, Claude) and [[change-management-review-astra]] (Astra, Codex) · **Date:** 2026-10-13 · **Amended:** 2026-10-13 under Decision 10 (models, environment and naming)

Paths follow the brief's convention: relative to `~/workspaces/knowledge-islands/`, with `skills/` meaning `ki-agentic-harness/skills/`. "Decision N" means the ways-of-working run's decisions log; "master Decision N" means the territory master thread's log. Every dispute below was settled by reading the cited source on 2026-10-13, not by counting the two reviews. Where Kris's recorded words bear on a point, they win.

## Summary

The way Kris runs change in the Knowledge Islands territory is sound; its rules are just in the wrong places. The fix is to give each idea one home and one name:

- **Work** says what a record, a Project and an Initiative are and how one record moves. It already exists (`ki-work`, the adapters, `ki-next`, `ki-plan`, `ki-implement`, `ki-accept`, `ki-batch`) and changes least. It keeps the Project registry, and gains one table that defines the three "what for" words: an Initiative's direction, a Project's outcome, a record's goal.
- **PMO** is new, as `ki-pmo`: how the master thread and the Project threads work with Kris. Everything about threads moves here out of `ki-delegation`: openers, the cap and queue, Needs tags, directions, the mark and the roll-up since it. Every Capital declares it.
- **Delegation** (`ki-delegation`) keeps the whole background-run contract from prompt to report, on both the caller's and the worker's side, plus packets. It loses the thread material and gains clearer gates: a run finishing is not the same as succeeding.
- **Continuity** (`ki-checkpoint`) stays the generic checkpoint format with its checker. Openers are generated from the thread name, never stored; the mark becomes a structured field later, once its evidence rule is written.
- **The design loop** keeps its five stages; a record may return to it when a costly choice turns out to be unmade. Its reviews and merge run on the highest-level model of each of two runtimes, every merged report states the models and runtimes used, and the loop says how it degrades when an environment offers less (Decision 10). Its name is retested under Kris's rule that a skill name conveys its purpose at a glance: `ki-shape` fails, and decision `NAMES` carries the candidates that pass.
- **Model policy** (`ki-tokenomics`) owns the purposes (`fast`, `standard`, `reasoning`, `frontier`); `ki` owns the per-runtime binding from purpose to model, and binds `frontier` to the highest-level model each runtime offers.

The `ki` commands get one rule: `ki repo` acts on a selection, `ki territory` describes a territory, `ki registry` registers checkouts, `ki agent` runs agents. Two duplicates fold away and two views are added: Projects and threads. "Territory" stays as the word. The coordinator runs on `standard` at low effort by default today, and the pilot trials `fast` at low effort against a written gate, in line with Kris's lean. The pilot is one record: move the thread material into `ki-pmo` without changing its meaning, and prove a fresh session can re-bootstrap from the repository alone. Eight decisions are for Kris; the rest is settled on evidence. Models and environment, below, says who produced each stage and what that means for confidence.

**The test of comprehension.** A new thread reads `ki-pmo`, then `ki-delegation`. A new repository reads `ki-work` and its adapter. Nobody reads `ki-checkpoint` to learn how to coordinate.

## Models and environment

Decision 10 asks every merged report to state which models and runtimes were considered and used. This loop considered the two runtimes `ki agent launch --runtime` offers, `claude` and `codex`, and on each the highest-level model available on 2026-10-13, as Decision 5 named them: Fable (`claude-fable-5-1`) through Claude Code and Astra (`gpt-6-astra`) through Codex. No other model was weighed for a review or the merge. The brief ran on the Claude Code default of the day because it was launched before the launcher could be told a model.

| Stage | Model | Runtime | Effort | Evidence |
| --- | --- | --- | --- | --- |
| Brief | Claude Opus 5.5 | Claude Code | default | Runtime default of the day † |
| Review by Fable | Claude Fable 5.1 | Claude Code | high | Launch record; the review's header |
| Review by Astra | Astra | Codex | high | Launch record; the Codex session header in the run log |
| Merge | Claude Fable 5.1 | Claude Code | max | Launch record |
| Amendment under Decision 10 | Claude Fable 5.1 | Claude Code | max | Launch record |

† The brief run started at 04:07 local, before `ki agent launch` gained `--model` and `--effort` at 04:11 (`tools-ki` commit `4a4f970`), so the launcher recorded no model. The coordinating thread reports Claude Opus 5.5 at default effort, which matches the model radar's adopted Claude Code route.

What the mix implies for confidence:

- **The two reviews are independent in model, vendor and runtime**, the strongest independence the loop can buy today. Where the Agreement and difference table shows both reviews agreeing, the agreement crosses vendors. Where they differ, the settlement cites a source, never a vote.
- **The merge is not independent of the Fable review.** It ran on the same model and runtime at higher effort. The table shows no systematic lean: the merge sided with Astra against Fable on points 10, 12 and 22, with Fable against Astra on points 2, 13 and 28, and re-read every cited source rather than either review's reading of it. The residual risk is a blind spot shared by the two Fable sessions, which only a merge on the other runtime would test; Kris's decisions are the check on that.
- **The brief ran one tier down at default effort.** That is acceptable because the reviews fact-check the brief by design; Corrections to the brief lists what they caught. A brief on the highest-level model would have fewer corrections, not a different model.
- **One runtime did the brief, one review, the merge and this amendment; the other did one review.** Nothing in the loop ran on a third model, and no Codex session read the merged report before Kris did.
- **Provenance was partly reconstructed.** The launcher recorded no model for the brief, and the Astra review's header names the runtime but not the model or effort. The rules in the Design loop unit close both gaps: each review's header and each report's Models and environment section state model, runtime and effort.

## Corrections to the brief

Both reviews fact-checked the brief; every correction below was re-checked against its source.

- **`ki agent` model and effort options "being added"** - already landed: `ki agent launch` and `ki agent queue` take `--model <model>` (passed through verbatim) and `--effort low|medium|high|xhigh|max`, in `tools-ki` commit `4a4f970` of 2026-10-13, unreleased. The `ki` on the path is the local runner, so "installed `ki` is 0.10.1" means the checkout's `main`. Purpose resolution is not implemented (both reviews; `ki agent launch --help`).
- **Drift 4, the stale Project-note path** - resolved two minutes after the brief's commit; the ways-of-working checkpoint links `Streams/Projects/ways-of-working/ways-of-working.md` (both reviews).
- **"About 38 references in 17 harness files"** - 24 occurrences of `ki-design-loop` in 13 files of the harness source today, excluding installed payloads and the catalogue (Fable; `grep` over `skills/`, `docs/`, `README.md`).
- **Checkpoint "exactly six frontmatter fields"** - six field names, of which `label` is recommended and five are required; a missing label is a WARN (Astra; `standards-checkpoints.md` Thread label, Exact record form).
- **"Every repository adopts the roadmap skill" needs reinterpreting** - it does not. The repository-roadmap standard already lets a Knowledge Base declare `[skills.ki-work-roadmap]` alongside `[skills.ki-repo-kb-streams]` for the shared record model, issuing and components, without selecting the project `roadmap` adapter, and `ki-principal/.ki.toml` does exactly that today (Astra; `standards-repository-roadmaps.md` line 7, `ki-principal/.ki.toml` lines 113 to 135).
- **Three overlapping selection nouns** - four command groups carry the five selectors: `ki repo`, `ki registry`, `ki territory show|open|audit|inspect|roots` and `ki repo roadmap list -t`. And `ki registry list` rejects the selectors its parent advertises with a grammar error (Fable; Astra; `tools-ki/src/commands/registry/list.ts` line 20).
- **"No view of Projects or threads"** - too absolute: `ki repo roadmap list --by project|initiative` resolves membership and shows Project lifecycle. It omits Projects with no selected record, so it is not a portfolio view (Astra; `tools-ki/src/commands/repo/roadmap.ts`).
- **"The Work unit is already sound"** - qualified. `ki-repo-kb-streams` still exposes ITERATE, PROPOSE, READY and ROLLOUT modes beside the lifecycle process skills, and its working rule "No `ready` while a prerequisite is below `done`" contradicts the work-item format, where `blocked_by` is discharged when the needed thing exists, not when its record closes (Astra; `ki-repo-kb-streams/SKILL.md` lines 75 to 98; `standards-work-item-format.md` line 77).
- **Folder-form registry notes** - two standards disagree: the registry standard allows the folder form only while the note holds a `design/` folder, while the design-loop standard says "the folder note stays where it is" after the design folder is deleted (Astra; `standards-project-registry.md` Location; `standards-design-loop.md` Artefact home).
- **A fifth drift** - the `rig.chezmoi` checkpoint coordinates a repository, not a Project: its Objective names the Rig Initiative and its records sit in the secrets-hygiene Project. The "one named estate area" escape is in live use (Fable; `+/_CHECKPOINTS/rig.chezmoi.md`).
- **A sixth drift** - the master checkpoint lists eight active threads against master Decision 19's cap of three plus the master (Astra; `_state-of-play.md` Active threads).
- **A seventh drift** - the Knowledge Islands model and Rig Initiative notes name Projects in `## Notes` (`[[ways-of-working]]`, `[[command-centre]]`, `[[mac-studio-bootstrap]]`) although the registry standard says an Initiative note "names no Project or record"; the Streams checker tests Initiative notes for record identifiers and `## Update` sections, not for Project mentions, so practice and the checker are looser than the prose (Astra; `standards-project-registry.md` Links point upwards).
- **The harness decision records already misdescribe `ki-delegation`** - `ADR-KI-HARNESS-SKILLS-005` and `ADR-KI-HARNESS-SKILLS-006` call it "the optional governance standard for a durable delegation packet"; the background-run contract and thread material post-date both. `ADR-006` also defines `governance` as holding "durable authority standards, including checkpoints" and `change-management` as "the adapter selector, tracker adapters, lifecycle standards, and the short lifecycle processes", which names neither a coordinating-thread practice nor a design loop (Fable; `docs/decisions/`).
- **`ki-tokenomics` drifts from its own standard** - the skill body says a coordinating thread "runs on a fast, low-effort model"; its standard says `fast`, "or `standard` where `fast` is too weak" (Fable; `ki-tokenomics/SKILL.md` line 42; `standards-tokenomics.md` line 19).
- **The lowest authority tier is not read-only** - `--rules none` permits local commits and forbids every remote call, while the standard's Coordination section says "pull with `--ff-only` before committing"; the two conflict for a `none` run. And the launcher's footer extraction takes the first `## Rules` in the asset, which is inside the intro sentence "appends this file from `## Rules` onwards", so every prompt carries a stray fragment; this run's own prompt shows it (Astra; `assets/rules-none.md`; `standards-background-runs.md` line 107; `tools-ki/src/core/agent/runs.ts` line 101).
- **Record classification is optional** - `project` is optional and `initiative` is for projectless records only, so no rule requires every record to name one (Astra; `standards-work-item-format.md` lines 95 to 103).
- **Labels cannot be derived** - master Decision 143's short forms (`Fnd:`, `KI Model:`) come from no registry field, so the label rule `<Initiative title>: <project>` is unenforceable as written (Fable; `_state-of-play.md` Thread labels).
- **The master's history is in a non-durable place** - earlier master history "is rolled up in `thread-history.md` in the run folder", and Decision 2 makes the run folder something to archive or delete once its decisions are consolidated (Fable; `_state-of-play.md` Current state).
- **`ki-work-housekeeping` rename cost** - the skill is declared in six `.ki.toml` files (`ki-agentic-harness`, `legal-principal`, `apps-midnight.ninja`, `apps-rig.midnight.ninja`, `apps-tower.midnight.ninja` and the chezmoi source), each with its own table; Fable counted five and missed the chezmoi declaration (`grep` across workspaces).

## Model

Six units of comprehension. Each is named, bounded, and says what it hands to the others. Where the reviews saw the subject differently, the unit below is the combined reading, with the evidence that settled it.

### Work: what the work is

**Owns.** `ki-work` as selector and shared vocabulary; the adapters `ki-work-roadmap` (the shared record model, declared by every repository), `ki-repo-kb-streams` (placement, zone routing, Enactment and audit for a Knowledge Base), `ki-work-github-issues` and `ki-work-linear` (configuration-only today, with no process executor); the process skills `ki-next`, `ki-plan`, `ki-implement`, `ki-accept` and `ki-batch`; `ki-work-housekeeping` for recurring work; and the Project registry standard with its goal table.

**Boundary.** Everything a record, a Project or an Initiative is, and one record's life in one repository. Nothing about how a thread behaves.

**Hand-offs.** Receives captures from PMO and the design loop through `ki-next`. Exposes records, lifecycle and registry entries to the `ki` views. The registry resolves Project and Initiative slugs for every repository in the territory. A worker's report returns to the lifecycle; it never advances a record by itself.

**Why the registry stays here.** The brief proposed moving the registry standard to `ki-pmo` because only a Capital holds a registry and only coordinating threads act on it. The second premise is false: the rubric that enforces the standard is `ki-work-roadmap/scripts/rubric/contexts/project-registry.ts`, the Streams checker reports close-out due, work-item validation and `--by project` grouping read it, and Project leads own close-out, all without a thread. A standard belongs with its checker and its consumers, so the registry stays in `ki-work`; `ki-pmo` is its principal actor and links to it. "Portfolio" is the top of the Work hierarchy, not a seventh unit.

**Changes.**

- One record format with two placements. `ki-work` says plainly that `ki-work-roadmap` owns the record model for both `docs/roadmap/` and `Streams/Roadmap/`, with `ki-repo-kb-streams` owning the Knowledge Base container, and that Decision 5's "every repository adopts the roadmap skill" is met by declaring `ki-work-roadmap` everywhere. No skill merge.
- `ki-repo-kb-streams` retires its duplicate ITERATE, PROPOSE, READY and ROLLOUT entry points in favour of the lifecycle process skills, and aligns its dependency wording with the work-item format's build-order rule.
- Batch is three layers of one concern, documented together: `ki-batch` (the process) names `ki repo batch prepare|validate|run|close` as its mechanics, and `ki-work` keeps owning the `+/_BATCHES/README.md` scaffold, because the `ki-work` declaration is what activates the scaffold, and `ADR-KI-HARNESS-SKILLS-014` makes every process skill invocation-only, so `ki-batch` is never declared and cannot activate or own it.
- The registry standard gains the goal table below, an optional bounded aims list in `## Direction` (decision `AIMS`), an optional short `label` field on the Initiative note so that labels and openers can be derived, permanent acceptance of either note form (file or folder) so a note never moves back after a design folder is deleted, and permission to mention a Project in `## Notes` prose for scope orientation while still forbidding membership lists, record identifiers and status.
- `ki-pulse` moves to `acquire`: it is a process skill that "retains no standing state", holds no standard and triages signals, while `ADR-006` defines `governance` as durable authority standards. The radars stay in `governance`.

### PMO: who drives the work

**Owns.** New governance skill `ki-pmo` in `change-management`, `declaration-only`, declared by every Capital (Decision 5): the coordinating thread as a unit. The territory master thread and its Project threads; the cap and the ordered queue; seeding a Project checkpoint; openers and bootstrap as behaviour; directions from the master; the owner-facing reporting practices (banner, Summary, resting point, structured questions, wording), adopting the owner report and its Needs tags from their canonical owner, today the Reporting section of the [`ki-delegation` background-run standard](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md>), which moves with the rest of the thread material rather than being restated; handoffs under Decision 6 (a handoff stays under Needs as one consolidated message until Kris says it is done); parking tangents; linking records; keeping primary checkouts current; the mark as behaviour and the roll-up since the mark; what a coordinating thread writes into its checkpoint; the coordinator's purpose and the level its escalations require, by reference to Model policy; and the five-word glossary below.

**Boundary.** Coordinating with the owner. Never delivery, never a run's mechanics, never the checkpoint's schema, never the registry's schema. Territorial membership or a Project tag grants no write or acceptance authority in another repository.

**Hand-offs.** Dispatches through Delegation and reads its reports; persists through Continuity; captures through Work; invokes the design loop; hands its definitions table to command centre, which keeps the cross-territory crosswalk and the state-of-play view.

**Rules settled on evidence.**

- A Project thread coordinates exactly one Project. An Initiative's continuing upkeep is delegated from the master, not given a thread of its own, and no Project is invented to give continuing work a thread (decision `THREAD-SCOPE` reconciles the live `rig.chezmoi` thread).
- The cap is Kris's: three Project threads plus the master (master Decision 19). "Active" means allocated coordination attention, not the existence of a checkpoint or a process; the master's list of eight is reconciled to the cap in the rollout.
- One designated writer per checkpoint: the master may seed an unopened Project checkpoint; once opened, the Project thread owns its updates, and directions from the master go through the `From the master thread` section with a stale-read check, never a simultaneous edit.
- The opener is derived, never stored: `Re-bootstrap as the <project> project thread under ki-delegation.` is the final dot-separated component of the thread name plus fixed text, and `ki` prints it. The master's label-based opener ends with this rule.
- The label is `<Initiative label or title>: <project>`, derived from the registry once the Initiative note carries its optional short label, so master Decision 143's `Fnd:` and `KI Model:` stand and become checkable. Labels remain presentation only.
- The run-folder history is not durable (Decision 2). A thread's checkpoint carries current state; anything durable is consolidated into Decision Records, notes or records at each mark; a roll-up covers the decisions log, reports and Git since the mark and says so when reports are gone.
- The refresh rule compares the checkpoint's `ki-pmo read at <revision>` with `git log -1 -- skills/change-management/ki-pmo`, so a thread stops checking the wrong skill for changes.
- A coordinator escalates per decision, not per thread: any choice needing analysis, any prompt for ambiguous work and any merge of disputed reports goes to a `reasoning` or `frontier` background agent, as this design did. An escalation uses the highest-level model the environment offers, and independent reviews with a merge use the highest-level model on each of at least two runtimes, today Fable through Claude Code and Astra through Codex; the coordinator dispatches to both and amalgamates the results whichever runtime it runs on itself (Decisions 5 and 10). The coordinator's own lean default is untouched (decision `COORD-DEFAULT`).

**Rubric.** Thin and complementary to `ki-checkpoint`'s: a Capital has `_state-of-play.md` and no other repository does; each coordinating checkpoint's label matches the registry; the active list is within the cap.

**Glossary (five words, one owner each).** A **session** is one runtime conversation (PMO). A **thread** is a durable, human-named line of coordination that outlives sessions and is rebuilt from its checkpoint (PMO). A **run** is one `ki agent` run folder with its decisions log (Delegation); in PMO's scope "run" never means a `ki-work-housekeeping` recurring-work run or a `ki repo batch` run, which are named in full. A **worker** is one bounded background execution assignment (Delegation). An **agent** is any acting model, including an in-session subagent, which the run standard already distinguishes from a background agent (Delegation).

### Delegation: how work is run

**Owns.** `ki-delegation` in `governance`, reduced: both sides of the background-run contract, caller and worker. Detachment; the run packet and launch metadata; prompt shape; authority tiers, footers and their precedence; the decisions log; coordination between runs; the run queue; monitoring and gates; worker reporting; result reconciliation; and delegation packets for approved high-risk handoffs.

**Boundary.** From prompt to report. It does not select work, choose a model, accept results, or say how a thread talks to its owner.

**Hand-offs.** PMO writes prompts and reads reports; `ki agent` is the launcher and owns runtime flags; Model policy names the purpose a prompt declares; Work owns lifecycle and acceptance.

**Why both sides stay.** The brief kept "only what a launched worker needs"; Astra showed the caller's obligations (prompt, authority, gates, reconciliation) are what make delegation safe, and Fable's own list already includes prompt shape and monitoring. What leaves is the thread material at lines 128 to 253 of the standard, except worker reporting.

**Changes.**

- Three distinct gates, named: the predecessor finished reporting (`DONE`); the required artefact or verification is sufficient; the next action is authorised. `DONE` gives only the first, so a dependent worker validates what it needs before it proceeds, and a watcher never shows an exited worker as a delivered success.
- Authority precedence: a task's narrower instruction wins over its tier's general footer, so a read-only reviewer is representable under a commit-capable footer; the pull-before-commit rule applies only from the `push` tier upward, resolving the conflict with `--rules none`.
- The run packet description names the launcher's extra files; run names are territory-qualified from the start; the worktree location and run-folder retention rules of Decision 2 are written in.
- `ADR-KI-HARNESS-SKILLS-005` and `-006` are refined in place to describe both contracts and the new area boundary, as the design-loop standard requires for an existing record.
- `tools-ki` fixes the footer extraction to find the `## Rules` heading, not its first mention.

### Continuity: how a thread survives

**Owns.** `ki-checkpoint` in `governance`, unchanged in role: identity, validation, update, resume and removal of a repository-owned checkpoint for any named thread, with a checker. `ki-recap` stays beside it as the single-session summary with its `checkpoint <thread>` composition.

**Boundary.** The record's shape and lifecycle. It works without PMO: every Capital and the harness scaffold it, but a project repository with no master may use it too.

**Hand-offs.** PMO says what a coordinating thread writes; `ki-recap` may supply evidence; `ki` prints openers from it.

**Why it stays generic and keeps its name.** Kris asked whether `ki-checkpoint` should become the threads skill (Decision 4). Both reviews, on the evidence that it is `detected`, owns a scaffold and a rubric, and that a format is smaller and more stable than a practice, say no; the checkpoint is the snapshot, PMO is the practice.

**Changes.**

- No `opener` field (both reviews): stored prose drifts, as the master's `<label>` opener shows.
- One optional structured `mark` in a second wave, after an evidence rule is written: `at` (UTC) and a cursor that names its log as well as its number, for example `ways-of-working#9`. The checkpoint stays self-sufficient because `Decisions made` carries the decisions in force, so recovery never needs the run folder. The closed schema means the rubric changes in the same commit.
- The standard's prohibited-payloads prose stops calling Project and Initiative notes "the durable home of status", matching the registry standard, where status lives in records and each note's `lifecycle`.
- Cross-references to the thread rules re-point from `ki-delegation` to `ki-pmo`.
- Observations stay separate: a checkpoint exists; a thread is allocated; a worker runs on this machine; a worker finished reporting; delivery passed review; a Project closed. A view says "unavailable" for another machine rather than inferring that nothing runs.

### Design loop: how a shape is chosen

**Owns.** `ki-design-loop` in `change-management`, invocation-only, unchanged in its five stages, with its templates gaining the model, runtime and effort lines below; invoked by a coordinating thread or directly in a repository without PMO; its `design/` folder convention and `docs/design/<subject>/` home.

**Boundary.** From an owner's proposal to decisions and a piloted rollout. It writes no record, grants no authority and never chooses for the owner.

**Hand-offs.** Receives a proposal from the owner through PMO; hands rollout records to `ki-next` and readiness to `ki-plan`; a Decision Record only when a decision changes.

**Changes.**

- The entry test becomes "a material design choice is unresolved", not "no record exists yet": an existing record that uncovers a costly unmade choice pauses under its owner and returns to the loop, which neither duplicates the record nor grants authority (Astra).
- Model level (Decision 10). The standard's "no stage requires a particular model, vendor or runtime" becomes a floor rather than a free choice: the reviews and the merge run on the highest-level model each runtime offers, which Model policy binds as `frontier`, on at least two runtimes, so independence is of vendor as well as of session; the brief and the rollout records may run lower. Until the purpose binding exists, the orchestrator passes the model through `ki agent launch --model`, as this loop did.
- Stated provenance (Decision 10). The report template gains a Models and environment section, as above, naming the models and runtimes considered and used for the brief, each review and the merge, with effort and evidence for each and what the mix implies for confidence; the review template's header names model, runtime and effort rather than "model or runtime". A report without the section is incomplete.
- Degradation (Decision 10). Before it dispatches, the loop reads what the environment offers and states any shortfall in the first line of Models and environment. Two runtimes with their highest-level models is the full loop. One runtime with more than one model runs the two reviews on different models of that runtime and the merge on the highest, and marks the report single-runtime. One runtime with one model runs the two reviews as separate fresh sessions on that model and the merge likewise, and marks the report single-model, so each agreement in the table is read as one model's view twice and the owner's decisions carry that caveat. No model at `reasoning` or above is a stop under the standard's Stops. The loop never substitutes silently and never drops a review to fit the environment.
- Paperclip (Decision 10). An agent that runs the loop or a `ki-pmo` merge needs both runtimes with their highest-level models. This report routes that as a recommendation to the owner of `ki-agent-coordination-paperclip`, for its agent requirements, and edits no Paperclip material; it stays under Needs until Kris says the handoff is done (Decision 6). A Paperclip agent with one runtime runs the loop in its degraded form and says so.
- The name is retested under Kris's rule that a skill name conveys its purpose at a glance (Decision 10), in Command surface and naming below. `ki-shape` fails it, as Kris says, and was already ruled out on evidence: `ki-plan`'s description begins "Shape selected Now or Next draft work" and `## Shaping` is a mandatory section of a Soon or draft record. `ki-design-loop` names the activity but not its kind, and beside `ki-design-system` and `ki-design-inspiration` it reads as interface design, which is what the harness skills review saw. Decision `NAMES` carries the candidates that pass; the `design/` folder convention stays whatever the skill is called, because the artefacts are a design.
- The folder-form conflict between the registry and design-loop standards is settled in Work: either note form is permanent.

### Model policy: which model does what

**Owns.** `ki-tokenomics` in `environment`: the four purposes, the coordination purpose, effort recommendations and the repository's `preferred_model_type` and `model_tier_bindings` as policy and reporting.

**Boundary.** Policy, not resolution. It says what purpose a role needs; it does not pick a provider product.

**Hand-offs.** PMO names the coordinator's purpose and Delegation the purpose a prompt declares, each by reference; `ki` resolves a purpose to a model and effort through a user-level binding per runtime; runtime adapters report the effective model.

**Why the binding is the operator's.** `model_tier_bindings` is a repository table of purpose keys to single opaque strings, with no runtime dimension, effort, precedence or validation, so it cannot bind one purpose to a Claude model and a Codex model. Which model serves `reasoning` on this machine is not a property of `ki-principal`. Both reviews reach the same place: a runtime-qualified user-level binding (model and default effort per purpose per runtime, explicit overrides, stop on unknown), with the repository keeping its purpose preference.

**Changes.** The skill body is aligned to its standard; the coordinator default from decision `COORD-DEFAULT` is written once, here; the binding contract is defined before `ki agent --purpose` is added. The binding names, per runtime, the highest-level model that runtime offers as its `frontier` binding, today Fable on Claude Code and Astra on Codex, so the design loop and `ki-pmo` escalations require the level by purpose rather than by product (Decision 10); and it declares which runtimes the environment offers, which is what the loop's degradation rule reads before it dispatches.

### Goal hierarchy

One shared question, "what is this for", with three answers that differ in how they close. The table lives in the registry standard next to the Initiative and Project definitions, and `ki-pmo` links it.

| Level | Word | Meaning | Evidence and closure |
| --- | --- | --- | --- |
| Initiative | direction | A continuing direction and boundary, never met | The lead reviews relevance; pause or retire, never complete |
| Project | outcome | One finite outcome with a test, met once | The lead's close-out assessment against the Outcome, then complete or cancel |
| Record | goal | One bounded change, met by one change | The owning repository's verification and explicit lifecycle closure |

An Initiative may carry an optional bounded list of current aims inside `## Direction`: three to five, naming no Project or record, with no identifiers or completion state, so it reads as direction rather than status (decision `AIMS`). Links point upwards; `ki territory projects` derives the downward view. Classification stays optional, as the work-item format says; making it universal would be a new policy with a migration rule, not a correction.

### Command surface and naming

One rule, settled by both reviews: `ki repo` acts on a selection; `ki territory` describes a territory and its governance; `ki registry` registers checkouts on this machine; `ki estate` reshapes layout; `ki agent` runs agents. The target grammar is a design, not a claim that it exists.

- **`ki repo`** keeps its selectors and gains `list` (absorbing `ki territory show`'s repository listing) and absorbs `ki territory open` into `ki repo open`, preserving territorial ordering, the owner root and declared-store inclusion through one selection and opening contract. It gains `checkpoint list` and `checkpoint opener <project>`, which work in any repository that declares `ki-checkpoint`, with no Capital required.
- **`ki territory`** keeps `list`, `audit`, `roots` and `inspect`, loses `show` and `open`, and gains the two projections: `projects` (Initiatives and Projects from the registry, including those with no record, with lifecycle and open-record counts) and `threads` (checkpoints with label, state, mark and the running agents of this machine only, saying so). Both are projections over canonical records, never a second register; both offer machine-readable output with source coverage before Observatory consumes them. No `ki territory roadmap` alias: `ki repo roadmap list -t <handle> --by project` already expresses the scope (decision `VIEWS` confirms the home).
- **`ki registry`** keeps `add`, `list` and `remove` and advertises only the selectors its commands accept.
- **`ki agent`** keeps `launch`, `queue` and the monitoring vocabulary with `--runtime`, `--model` and `--effort`; adds `--purpose fast|standard|reasoning|frontier` once the binding contract exists; adds structured status evidence that distinguishes finished reporting from success and acceptance; fixes the footer extraction.
- **Naming.** "Territory" stays as the word in governance, the Charter, handles and `-t`; after the fold it is typed rarely, and `-t <handle>` already carries daily use. A shorter command form is Kris's call (decision `TERRITORY-WORD`): `ki land` is rejected on evidence, because Known Lands covers external signposting as well as governed membership, so it would name the wider thing; `ki terr` is possible as a canonical rename with a bounded transition, never as a permanent second spelling. Short forms like `repo` stay the house pattern.
- **The glance test (Decision 10).** A skill or command name must convey its purpose at a glance; Kris rejects `ki-shape` on it, and every name this report proposes was retested. Skills: `ki-pmo` passes on a well-known acronym, Project Management Office, which its description expands, and is Kris's own working name (Decision 4); the plain-word fallback is `ki-coordination`. `ki-work-recurring` passes, and the test also fails the current `ki-work-housekeeping`, because "housekeeping" says cleanup, which strengthens that rename. `ki-shape` fails: a bare verb naming no subject, besides colliding with `ki-plan`. `ki-deliberate` fails for the same reason and leaves decision `NAMES`. `ki-review-loop`, the brief's third candidate, names the method's shape and borrows "review" from the lifecycle's Awaiting review. `ki-design-loop` half passes: "design" and "loop" name the activity but not that the subject is a Project, Initiative or model, and beside the `design` area it reads as interface design. Candidates that pass: `ki-blueprint`, a plan drawn before anything is built, which says at a glance that it comes before `ki-plan` and collides with no name in the harness, `tools-ki` or the website; and `ki-consult`, seeking independent views before the owner decides, which names the method but can be read as consulting a knowledge base. Commands: `ki repo list`, `ki repo open`, `ki repo checkpoint list|opener`, `ki territory projects`, `ki territory threads` and `ki agent --purpose` each say what they do, `opener` being PMO's word for the line that re-bootstraps a thread; `ki terr` is a spelling that says nothing to a newcomer and `ki land` says Known Lands' wider thing, which settles decision `TERRITORY-WORD` further towards keeping the word.

### Coordinator model and effort

Both reviews agree on the shape and differ only on today's default. The shape: a coordinating thread runs on the lightest purpose that can keep authority, scope, decisions and handoffs straight; reasoning is a per-decision escalation to a background agent; `fast` is where this ends up once `ki` carries the bookkeeping (opener, mark, Needs list, roll-up sources); `standard` is the fallback whenever `fast` drops a constraint. Today the bookkeeping is prose a coordinator must judge, and the coordinator is Kris's only interface, so one missed authority boundary costs more than the tokens saved. Kris leans to the lower model (Decision 8). The merged position is therefore a trial with a gate rather than a switch: `standard` at low effort stays the written default; the pilot's Project thread runs `fast` at low effort against five tests (cold bootstrap, a changed instruction, conflicting reports, a failed predecessor, an unavailable source), judged on missed constraints, owner corrections, delay and total effort rather than coordinator tokens; one missed authority boundary ends the trial on that binding. When the gate passes and the views and mark command exist, `fast` becomes the default (decision `COORD-DEFAULT`).

Concrete bindings are per runtime and Kris's to choose (decision `BINDINGS`). The model radar (`ki-model-radar`, owner decision of 2026-10-06) records Claude Opus 5.5 through Claude Code and GPT-6.1 Sol through Codex as the adopted default routes, lists GPT-6 Luna as a current API model and Claude Haiku 4.5 under a deprecation watch-item, and binds no route to a `ki-tokenomics` purpose. Astra nominates GPT-6 Luna at low effort for the Codex trial with GPT-6.1 Sol as fallback, as a proposal rather than a verified route.

### Command centre hand-off

This design settles the Knowledge Islands column of command centre's glossary: master and Project threads, Initiatives, Projects and records with their three goal words, checkpoints, decisions logs, marks, Needs, runs, workers and agents. It goes to the command-centre Project as one definitions table, which stays under Needs until Kris says the handoff is done (Decision 6). Command centre keeps the cross-territory crosswalk and the state-of-play view, built on `ki territory projects` and `threads`. Whether Needs items correspond to legal-principal's decision Items is an unverified crosswalk for command centre to test, not a finding of this design.

## Agreement and difference

Marks are Fable / Astra against the brief's numbered points. The settlement column names the evidence; detail is in the Model above.

| Point | Reviews | Settlement and evidence |
| --- | --- | --- |
| 1 | Agree / Add | Work changes least, but Astra's Streams findings are real: duplicate modes and the `ready`-below-`done` rule (`ki-repo-kb-streams/SKILL.md` lines 75 to 98) go into the Work wave. |
| 2 | Differ / Add | Registry stays in `ki-work`: its rubric is `ki-work-roadmap/scripts/rubric/contexts/project-registry.ts`, and Astra's own F5 lists non-thread consumers. PMO is the actor, not the owner. |
| 3 | Agree / Add | PMO as described, as a `declaration-only` governance skill with a thin rubric; Astra's single-writer and Capital-only-master rules added. |
| 4 | Agree / Differ | Delegation keeps both sides of the run contract (Astra) and loses the thread material at lines 128 to 253 (Fable); `ADR-005` and `-006` refined in the same change. |
| 5 | Differ / Differ | `ki-checkpoint` stays generic and keeps its name; no `opener` field (both); `mark` only with an evidence rule, in a second wave. |
| 6 | Agree / Add | Separate process skill; Astra's "material unresolved choice" entry test adopted. |
| 7 | Agree / Agree | "Roll-up since the mark" in PMO; "recap" for `ki-recap` only. |
| 8 | Agree / Differ | Not a real dispute: tokenomics owns purposes and policy (Fable), resolution is `ki`'s through a binding contract (Astra, and Fable's point 23). |
| 9 | Differ / Add | `ki-pulse` to `acquire`, not `governance`, on `ADR-006`'s definition of `governance`; `ADR-006`'s `change-management` description widened to name PMO and the loop. |
| 10 | Differ / Agree | Collision real, cost real (six `.ki.toml` tables plus harness, catalogue, website guide). An owner decision, `NAMES`, recommended as a bounded naming wave after the pilot. |
| 11 | Agree, Differ / Differ | No merge (Fable). Decision 5 needs no reinterpretation: a KB may already declare `ki-work-roadmap` beside Streams and `ki-principal` does (`standards-repository-roadmaps.md` line 7). |
| 12 | Agree / Differ | Scaffold stays with `ki-work`: `ki-batch` is invocation-only under `ADR-014`, so it is never declared and cannot activate the scaffold that the `ki-work` declaration activates. Three layers documented together. |
| 13 | Differ / Add | `ki-shape` ruled out on `ki-plan`'s description and the `## Shaping` section, and rejected by Kris under the glance test (Decision 10), which `ki-deliberate` also fails. The candidates that pass, `ki-blueprint` and `ki-consult`, go to `NAMES`. |
| 14 | Agree / Differ | Five words with owners: session and thread in PMO, run, worker and agent in Delegation; agent includes in-session subagents (`standards-background-runs.md` Scope); "run" disambiguated. |
| 15 | Agree / Differ | Structured mark adopted with Astra's condition: the cursor names its log, and the checkpoint stays self-sufficient through `Decisions made`. Second wave. |
| 16 | Differ / Differ | Derive the opener from the thread name; `ki` prints it; nothing stored. |
| 17 | Agree, Differ / Add | Three words kept; one table in the registry standard (Fable's home) with Astra's evidence-and-closure column. |
| 18 | Agree / Differ | Kris said "possibly as a bounded list" (Decision 4): optional, inside `## Direction`, naming no Project, no identifiers or state. `AIMS`. |
| 19 | Agree / Agree | One Project per thread; the escape goes; upkeep is delegated from the master, no fake Projects. `THREAD-SCOPE` reconciles `rig.chezmoi`. |
| 20 | Agree / Add | Fold `territory show|open` into `ki repo list|open`, preserving ordering, owner root and store inclusion (`repo/open.ts`, `territory/index.ts`); fix `ki registry` selector advertising. |
| 21 | Agree / Differ | Keep "territory". `land` rejected on Known Lands' external-lands section; `terr` only as a canonical rename; both fail the glance test (Decision 10). `TERRITORY-WORD`. |
| 22 | Differ / Differ | Views added, no roadmap alias (both). Home differs: `ki territory` fits the point-20 rule because the registry is the territory's; generic checkpoint commands under `ki repo`. `VIEWS`. |
| 23 | Agree, Differ / Differ | `--model` and `--effort` exist (`4a4f970`). `--purpose` after a runtime-qualified user-level binding contract; `model_tier_bindings` stays repository policy. `BINDINGS`. |
| 24 | Agree / Differ | No measured evidence either way. `standard`/low written default, `fast`/low trialled in the pilot against a gate, switch when it passes. `COORD-DEFAULT`. |
| 25 | Agree / Add | Escalation per decision; merges of disputed reports and synthesis escalate too, as this report did, on the highest-level model available and, for reviews with a merge, on two runtimes (Decision 10). |
| 26 | Agree / Agree | One definitions table to command centre; view on the projections. |
| 27 | Agree / Differ | Needs-to-Item is an unverified crosswalk handed to command centre, not an identity. |
| 28 | Differ / Differ | Pilot narrowed to the `ki-pmo` move (Fable) with Astra's cold-reconstruction acceptance test; schema, labels and defaults untouched in the pilot. `PILOT-SCOPE`. |
| Add | Fable | `ADR-005` and `-006` misdescribe `ki-delegation`; refresh rule re-pointed; `_state-of-play.md` Capital-only check; Initiative short-label field; thread history non-durable (Decision 2). All adopted. |
| Add | Astra | Gates, authority precedence, pull-rule conflict, footer defect, run-packet description, territory-qualified run names, Streams reconciliation, folder-form permanence, eight-entry active list, Initiative downward links. All adopted. |

## Rollout plan

Records are captured through `ki-next` from Kris's decisions, each in the repository that owns the change, each citing the decisions in its Context. The pilot is delivered before any wave starts; its lessons are written into each wave's brief.

**Pilot (one record, `ki-agentic-harness`): `ki-pmo` extraction.** Create `ki-pmo` and move the thread material (lines 128 to 253 of the background-run standard, less worker reporting) without changing its meaning; add reciprocal off-ramps in `ki-delegation`, `ki-checkpoint`, `ki-tokenomics` and `ki-recap`; re-point `ki-checkpoint`'s cross-references and the refresh rule; refine `ADR-KI-HARNESS-SKILLS-005` and `-006` in place; widen `ADR-006`'s `change-management` description; write the glossary and the thin rubric. No checkpoint field, label, default model or command changes. Acceptance: with the run folder made unavailable, a fresh session re-bootstraps the master and one Project thread from repository evidence alone, recovers scope, in-force authority, outstanding Needs and the next step, derives the correct opener by hand from the rule, and a generic checkpoint in a repository without PMO still validates.

**Wave A, Work (`ki-agentic-harness`).** Registry standard: goal table, optional aims, Initiative `label` field, permanent note forms, Notes prose mentions. `ki-work`: one record format with two placements; batch's three layers. `ki-repo-kb-streams`: retire duplicate modes, align dependency wording. `ki-pulse` to `acquire`.

**Wave B, Continuity, Model policy and the loop (`ki-agentic-harness`).** `mark` field with its evidence rule and rubric; checkpoint prose on status; `ki-tokenomics` body aligned and the `COORD-DEFAULT` outcome written once; the purpose binding contract defined, with `frontier` bound per runtime to the highest-level model it offers; `ki-design-loop`'s model-level floor, degradation rule, Models and environment section in the report template and model, runtime and effort line in the review template (Decision 10).

**Wave C, Delegation hardening (`ki-agentic-harness`, `tools-ki`).** Gates, authority precedence, pull-rule scope, run-packet description, territory-qualified run names, Decision 2's worktree and retention rules; the footer extraction fix and structured status evidence in `ki agent`.

**Wave D, Command surface (`tools-ki`).** Fold `territory show|open`; `ki repo list` and `checkpoint`; `ki registry` selector contract; `ki territory projects|threads` per `VIEWS`; `ki agent --purpose` per `BINDINGS`; `terr` only if `TERRITORY-WORD` says so.

**Wave E, Names (`ki-agentic-harness`, six declaring repositories, catalogue, website guide).** Whatever `NAMES` approves, as one batch with a bounded compatibility period.

**Wave F, Arcadia (`ki-principal`).** Reconcile the master's active list to the cap; derive labels from the registry; resolve `rig.chezmoi` per `THREAD-SCOPE`; hand the definitions table to command centre under Needs; hand the both-runtimes requirement for agents that run the loop or a `ki-pmo` merge to the owner of `ki-agent-coordination-paperclip` as a recommendation, also under Needs (Decision 10); declare `ki-pmo`; consolidate this design into a Decision Record and delete the design folder.

Authority for each wave is exercised through `ki-batch` or `ki-accept`, quoting the grant in the decisions file.

## Decisions

Each decision has a stable tag for Kris to answer by. The evidence settles everything not listed here.

1. **`PILOT-SCOPE` - How big is the pilot?** Options: (a) the `ki-pmo` move alone, with the cold-reconstruction acceptance test and no schema, label or model change; (b) the full six-unit restructure with the contract conflicts reconciled in one pilot. Recommendation: (a). One failure mode gives clean lessons for the waves, and the design-loop standard asks for one pilot before any parallel wave; the test still proves the recoverability Astra wants.
2. **`COORD-DEFAULT` - What does a coordinating thread run on?** Options: (a) `standard` at low effort as the written default, with the pilot's Project thread trialling `fast` at low effort against the five-test gate, and `fast` becoming the default when the gate passes and the views and mark command exist; (b) `fast` at low effort now with `standard` as fallback; (c) `standard` indefinitely. Recommendation: (a). It honours Kris's lean with a trial today, and protects the one thread Kris talks to until the bookkeeping is mechanical.
3. **`BINDINGS` - Where does purpose-to-model binding live, and what are the trial bindings?** Options: (a) a user-level `ki` binding per runtime (model and default effort per purpose, stop on unknown), with the repository keeping purpose policy; (b) extend the repository's `model_tier_bindings` with a runtime dimension; (c) both, user winning. Recommendation: (a), because the model is the operator's choice on this machine and a repository table cannot hold two runtimes' products. Kris names the trial bindings: Astra proposes GPT-6 Luna at low effort for Codex with GPT-6.1 Sol as fallback; the radar binds no route to a purpose, so the Claude Code `fast` binding is Kris's to pick, with Claude Haiku 4.5 the only lighter Claude model on the radar and under a deprecation watch-item.
4. **`AIMS` - Should an Initiative list its aims?** Options: (a) an optional bounded list of three to five aims inside `## Direction`, naming no Project, with no identifiers or completion state; (b) mandatory aims on every Initiative; (c) no list, direction stays one sentence. Recommendation: (a). It is what "possibly as a bounded list" (Decision 4) asks for, makes a direction checkable without creating a second membership structure, and leaves projectless upkeep untouched.
5. **`THREAD-SCOPE` - One Project per thread, and what happens to `rig.chezmoi`?** Options: (a) remove the "named estate area" escape; a thread is the master or one Project's thread; continuing upkeep is delegated from the master; `rig.chezmoi` folds into the master unless Kris names a finite outcome worth a Project; (b) keep the escape and have the checker tolerate a thread with no Project; (c) register `chezmoi` as a Project regardless. Recommendation: (a). The registry is the only place a thread's scope is checkable, and a Project with no finite outcome would be a fake one.
6. **`NAMES` - Which names change?** Every candidate is tested against Kris's rule that a skill name conveys its purpose at a glance (Decision 10). Options: (a) `ki-pmo` only; (b) `ki-pmo`, and `ki-work-housekeeping` to `ki-work-recurring` as a bounded naming wave after the pilot; (c) also rename `ki-design-loop` in the same wave, to `ki-blueprint` or to `ki-consult`. Recommendation: (c) with `ki-blueprint`. "Housekeeping" says cleanup and "design loop" reads as interface design beside the `design` area, so both current names fail the test a new name must pass. The loop's rename is cheaper than housekeeping's: an invocation-only skill is declared in no repository's `.ki.toml`, so the cost is 24 occurrences in 13 harness files, the `tools-ki` bootstrap list and its tests, the website catalogue and one user-configuration table in the chezmoi source. `ki-blueprint` says a plan drawn before anything is built, which is the loop's place before `ki-plan`, and collides with nothing; `ki-consult` names the method but can read as consulting a knowledge base. `ki-shape` and `ki-deliberate` fail the test and are out. The `design/` folder convention stays whatever the skill is called.
7. **`TERRITORY-WORD` - Is "territory" too much of a mouthful?** Options: (a) keep `ki territory`, with `-t <handle>` carrying daily use and the fold removing `show` and `open`; (b) rename the command to `ki terr` as one approved migration with a bounded transition, keeping "territory" in prose and governance; (c) `ki land`. Recommendation: (a). After the fold the noun is typed rarely, and no shorter word represents the concept better: `land` names Known Lands' wider meaning and is rejected, and `terr` is a spelling rather than a word.
8. **`VIEWS` - Where do the Projects and threads views live?** Options: (a) `ki territory projects|threads`, with `ki repo checkpoint list|opener` for generic checkpoints; (b) `ki repo projects|threads -t <handle>`; (c) a new noun such as `ki pmo`. Recommendation: (a). The registry is the territory's, so the rule "`ki territory` describes a territory" places the portfolio there, and the generic checkpoint commands stay usable without a Capital.

## Changes after review

- **Registry stays in Work**, not PMO (Fable point 2; Astra F5 supplied the non-thread consumers). Portfolio is no longer a unit.
- **No stored opener**; derived from the thread name and printed by `ki` (both reviews, points 5 and 16).
- **The `mark` field moves to a second wave** and gains an evidence rule naming its log (Fable 28; Astra 15).
- **Decision 5's "roadmap skill" read literally**, no reinterpretation and no adapter merge, because a KB may already declare `ki-work-roadmap` beside Streams (Astra F1; Fable 11).
- **Batch scaffold stays with `ki-work`**; the three layers are documented together (Astra 12; `ADR-014`).
- **`ki-pulse` goes to `acquire`**, not `governance` (Fable 9).
- **`ki-shape` dropped**; the loop keeps its name pending `NAMES` (Fable 13); the loop's entry test becomes "a material choice is unresolved" (Astra U5).
- **Aims become optional**, not mandatory, inside `## Direction` (Astra 18; Decision 4's wording).
- **Goal table moves to the registry standard** and gains an evidence-and-closure column (Fable 17; Astra 17).
- **Views lose the roadmap alias** and the running-agents caveat is added; their home is decision `VIEWS` (both, point 22).
- **Purpose binding becomes a user-level per-runtime contract** defined before `--purpose` (Fable 23; Astra F7).
- **Coordinator default becomes a gated trial** rather than a switch either way (Fable 24; Astra 24; Decision 8).
- **Pilot narrowed** to the `ki-pmo` move and given a cold-reconstruction acceptance test (Fable 28; Astra Pilot and hand-offs).
- **Vocabulary grows to five words with owners**, including in-session subagents under "agent" (Astra 14; Fable 14).
- **Added from Fable:** `ADR-005` and `-006` refinement; refresh-rule re-pointing; Initiative short-label field; `_state-of-play.md` Capital-only check; thread history non-durable under Decision 2; the `ki-work-housekeeping` rename cost; the `rig.chezmoi` drift; four selector groups.
- **Added from Astra:** three gates; authority precedence; the pull-rule conflict; the footer defect; run-packet description and territory-qualified run names; Streams duplicate modes and dependency wording; folder-form permanence; the eight-entry active list; Initiative downward links; `ki registry list` rejecting selectors; the single-writer rule; separated observations; optional classification.
- **Point 21 reframed**: "territory" stays, with `land` rejected on Known Lands' evidence and `terr` only as a canonical rename (Astra 21; Fable 21).
- **Models and environment section added** (Decision 10, after the merge): the model, runtime and effort of the brief, each review, the merge and this amendment, with the evidence for each and what the mix implies for confidence.
- **Model level written into the loop and PMO** (Decision 10): reviews and merges on the highest-level model of each of two runtimes, `frontier` bound per runtime to that model, every merged report states what was used, a degradation rule for environments offering one runtime or one model, and the both-runtimes requirement for Paperclip agents routed to the owner of `ki-agent-coordination-paperclip` as a recommendation under Needs.
- **Owner report adopted by reference** (Decision 14, after the merge): Kris's three-section report, with its `Outstanding - no action requested now` placement, per-query Summary, Need from you and Recommendation, copyable reply block and linking rule, was written into the `ki-delegation` Reporting section as the single canonical owner and supersedes the Done / Failed / Needs you shape wherever it was set; PMO adopts that owner rather than restating the format, and the pilot moves it with the thread material.
- **Names retested at a glance** (Decision 10): `ki-shape` and `ki-deliberate` out; `ki-blueprint` and `ki-consult` in; `NAMES` now recommends renaming the loop in the naming wave, reversing the merge's keep; `TERRITORY-WORD` strengthened; every proposed command name passes.
