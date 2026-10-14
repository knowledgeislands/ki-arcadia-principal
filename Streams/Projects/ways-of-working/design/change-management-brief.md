# Change management: brief

**Owner:** Kris Brown - **Owning repository:** knowledgeislands/ki-principal - **Date:** 2026-10-13

**Subject:** the change-management model of the Knowledge Islands territory, designed in the [[ways-of-working|Ways of working]] Project under the [[knowledge-islands-model|Knowledge Islands model]] Initiative.

All paths below are relative to `~/workspaces/knowledge-islands/` unless they start with `~`. The harness skills are under `ki-agentic-harness/skills/`, shortened to `skills/`. "Decision N" without a qualifier means the ways-of-working run's decisions log, `~/.local/state/ki/agents/ways-of-working/decisions.md`; "master Decision N" means the territory master thread's log, `~/.local/state/ki/agents/state-of-play/decisions.md`. Both logs are machine-local; everything a reviewer needs from them is quoted here.

## Problem

Kris now runs change management through a territory master thread, a few Project threads, detached background agents, checkpoints, decisions logs, marks, Needs tags, the Project registry, roadmap records and the `ki` commands. The practice works, but it evolved one decision at a time rather than being planned, so its rules sit wherever they first landed:

- The thread unit - master and Project threads, openers, bootstrap, the mark, Needs, parking - lives inside `ki-delegation`, a skill whose job is background runs and delegation packets.
- The mark and the opener describe a thread's state but are kept partly in `ki-checkpoint` and partly in `ki-delegation`.
- Initiatives, Projects and records each state their purpose under a different word (direction, outcome, goal), defined in two different skills.
- `ki-design-loop`, the loop being used for this design, sits in `change-management` with a name that collides with the harness `design` area.
- The `ki` command surface grew three overlapping ways to select a set of repositories, and has no view of Projects or threads.
- The default model and reasoning effort for a coordinating thread is stated in two skills with no decision behind its level.

The cost is comprehension: a new thread, a reviewer or Kris must read several skills to learn one way of working, and drift between them goes unnoticed (see the drift facts below). The aim, in Kris's words on 2026-10-13, is "something simpler to understand" (quoted in full under Decisions below).

The brief covers eight areas, set by the coordinating thread from Kris's decisions:

1. The whole `change-management` skill area plus `governance/ki-delegation`, `governance/ki-checkpoint` and `environment/ki-tokenomics`: what each owns, overlaps and misplacements.
2. A new `ki-pmo` (Project Management Office) skill for the thread unit.
3. Checkpoints, sessions, the mark and recoverability, including a checkpoint `opener`.
4. Initiatives, Projects and work records: definitions and goals at every level.
5. `ki-design-loop`: its name, area and place.
6. The `ki` command surface: evolution, naming and a territory-level view.
7. The default model and reasoning effort for coordinating threads.
8. The Knowledge Islands model scope absorbed from the [[command-centre]] Project.

## Owner's proposal

Kris's decisions in the ways-of-working run, verbatim. Decisions 4 to 8 are the proposal; 1 to 3 are the earlier context. Decision 9 records push and hand-off housekeeping only.

> **Decision 1 (2026-10-13)**
>
> - QUEUE: yes - open the ways-of-working Project thread now, ahead of the master's queue order.
>
> **Decision 2 (2026-10-13)**
>
> - WT-RULE: yes - add to ki-delegation the background-run worktree location (~/.local/state/ki/agents/<run>/worktrees/<repo>, removed with git worktree remove and branch deleted once merged, before DONE) and run-folder retention (archive or delete the run folder once the thread or run closes and its decisions are consolidated into durable owners). No new record.
>
> **Decision 3 (2026-10-13)**
>
> - COORD-MODEL: yes in principle - the main thread should be a coordinator, not do the reasoning. Coordinating threads run lean and hand heavy reasoning to background agents; model-purpose detail goes to ki-tokenomics.
>
> **Decision 4 (2026-10-13)**
>
> - SPLIT/SKILL-REVIEW: yes - a separate skill for the threads unit, working name ki-pmo (Project Management Office) rather than ki-threads. Fold into one structural review of the change-management model: checkpoints, sessions, recoverability and where the mark belongs (possibly ki-checkpoint becomes the threads/sessions skill); the checkpoint opener; Initiative and Project definitions, with goals at every level (Initiative direction, Project outcome, record goal), possibly as a bounded list; and ki territory. The current structure evolved rather than was planned; aim for something simpler to understand.
>
> **Decision 5 (2026-10-13)**
>
> - Review method and scope: run ki-design-loop, but the review covers change management as a whole including ki-design-loop itself; decide the new structure given how it has evolved - changes are welcome. Reviews use higher-reasoning models on both runtimes, Fable (Claude) and Astra (ChatGPT/Codex), with a higher-reasoning consolidation merging the two. The coordinating thread, whether Claude or ChatGPT based, must be able to dispatch to both and amalgamate the results. command-centre's KI-model scope is absorbed into this design; command-centre keeps cross-territory alignment and the state-of-play view. Applicability: every principal knowledge base adopts the PMO skill; every repository adopts the roadmap skill.
>
> **Decision 6 (2026-10-13)**
>
> - Handoffs to other threads: a handoff counts as done only when Kris expressly says so. Until then the thread keeps it under Needs, revised into one current consolidated message, rather than issuing numbered second messages.
>
> **Decision 7 (2026-10-13)**
>
> - PLAN and AGENT-MODEL: yes. Add model and effort options to ki agent directly, no tools-ki record, no release. The design also assesses the ki command surface - how it has evolved recently, especially at sub-command level (ki agent, ki repo, ki territory) - and naming, including whether 'territory' is too much of a mouthful versus a shorter word that better represents the concept; short forms like repo, not repository.
>
> **Decision 8 (2026-10-13)**
>
> - COORD-WORDING folds into PLAN: the design looks strongly at the default session or thread model. Kris leans to a lower, less-reasoning model handling things in a mechanical handoff fashion with reasoning deferred to background agents and helpers, possibly as the general approach - or the right balance of model level and reasoning level. The ki-tokenomics coordination wording stands until the design decides.

Earlier master-thread decisions that shaped the current rules, as summarised in the ways-of-working checkpoint (`ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md`): the master thread does only project management and each Project thread works only its own Project's records (Kris on 2026-10-09 in the master run: 'the master state-of-play thread does no specific work from now on - only project management and discussion around it. All real work is routed to Project threads', with the routing of each tangent to its Project thread the same day); marks are per thread, one at a time, kept in the checkpoint, with `ki-delegation` owning the roll-up and `ki-recap` staying the single-session summary (Kris's MARK design decision of 2026-10-09 in the master run: 'marks are per thread only ... One mark per thread, replaced when a new one is struck (kept in the checkpoint; Git holds history)'); active Project threads are capped at three plus the master, which queues the rest and prepares their checkpoints (Kris on 2026-10-09 in the master run: 'at most three Project threads active at once, plus the master'); thread rules belong in skills, not personal preferences (Kris's three 2026-10-09 decisions in the master run that tangent capture, the linking rule and the reporting improvements are defined 'in skills, not personal preferences').

## Established facts

### The skill areas today

- `skills/change-management/` holds thirteen skills: `ki-accept`, `ki-batch`, `ki-design-loop`, `ki-implement`, `ki-next`, `ki-plan`, `ki-pulse`, `ki-recap`, `ki-work`, `ki-work-github-issues`, `ki-work-housekeeping`, `ki-work-linear` and `ki-work-roadmap` - directory listing of `skills/change-management/`.
- Process skills apply the record lifecycle: `ki-next` captures, selects, adopts, promotes, defers, holds and releases; `ki-plan` readies Now or Next drafts; `ki-implement` delivers one Ready record to Awaiting review; `ki-accept` closes, cancels or prunes with human approval; `ki-batch` runs one bounded authority envelope over an exact set of Ready records - each skill's `description` in its `SKILL.md`.
- `ki-work` is a governance selector: it chooses one forward-work adapter per repository (`roadmap`, `kb-streams`, `github-issues` or `linear`) and owns the shared lifecycle vocabulary - `skills/change-management/ki-work/SKILL.md`, `references/standards-change-management-adapters.md`.
- The `roadmap` adapter is valid only for `repo_type = "project"` and resolves to `ki-work-roadmap`; `kb-streams` is valid only for `repo_type = "kb"` and resolves to `ki-repo-kb-streams`, which lives in `skills/repo-structure/`, not `change-management` - `skills/change-management/ki-work/references/standards-change-management-adapters.md`.
- The Project and Initiative registry standard is a reference of `ki-work`, although only a territory Capital holds a registry - `skills/change-management/ki-work/references/standards-project-registry.md` (Scope, Location).
- `ki-work-housekeeping` governs recurring-work identity, cadence and run evidence; the similarly named `ki-housekeeping-claude` and `ki-housekeeping-chatgpt` in `skills/environment/` clean runtime state - their `SKILL.md` descriptions.
- `ki-pulse` captures links or scans public sources and triages signals into read, watch, act or discard; durable landscape posture belongs to `ki-agentic-radar` and `ki-model-radar` in `skills/governance/` - `skills/change-management/ki-pulse/SKILL.md`.
- `ki-recap` summarises one live session and offers an explicit `checkpoint <thread>` composition that feeds `ki-checkpoint`'s UPDATE without owning it - `skills/change-management/ki-recap/SKILL.md` lines 10, 43 and 49.
- `ki-batch` is a process skill; `ki repo batch` is a separate command that "manages canonical local batch authority records"; `ki-work` CONFORM may create the batch scaffold - `ki-batch/SKILL.md`, `ki repo --help`, `ki-work/SKILL.md` Mode CONFORM.
- Applicability differs across the thread-related skills: `ki-delegation` and `ki-tokenomics` are `declaration-only`, `ki-checkpoint` is `detected`, `ki-design-loop` and `ki-recap` are `invocation-only` - each `SKILL.md` frontmatter.

### Threads, delegation and checkpoints

- `ki-delegation` owns two contracts: background runs and delegation packets. Its background-run standard, 263 lines, also carries the coordinating-thread material: Reporting practices for coordinating threads (Needs tags, banner, Summary, resting point), Project threads, Territory master thread (registry, cap, seeding, run naming), Opening a thread, Bootstrap, Directions from the master thread, and Thread working rules (recap since the mark, parking tangents, linking records, keeping primary checkouts current, refreshing this guidance) - roughly lines 128 to 253 - `skills/governance/ki-delegation/SKILL.md`, `references/standards-background-runs.md`.
- The same standard's Coordinator responsiveness says a coordinating thread "hands substantive reasoning, analysis and drafting to background agents" and "runs on the lighter model purpose `ki-tokenomics` recommends for coordination", while the skill's own boundary says it does not "choose a model" - `standards-background-runs.md` lines 37 to 43, `SKILL.md`.
- `ki-tokenomics` Model purpose names `fast`, `standard`, `reasoning` and `frontier` as purposes, not provider names, and says a coordinating thread "should run on `fast`, or `standard` where `fast` is too weak to follow the run contract reliably, at low reasoning effort", reserving `reasoning` and `frontier` for background agents; it "adds no `preferred_model_type` value" - `skills/environment/ki-tokenomics/references/standards-tokenomics.md` lines 15 to 19.
- Thread guidance refresh is tied to the skill's path: a thread compares `git log -1 --format=%h -- skills/governance/ki-delegation` with the revision noted as `ki-delegation read at <revision>` in its checkpoint - `standards-background-runs.md` Refreshing this guidance.
- A checkpoint is one file `+/_CHECKPOINTS/<thread>.md` with exactly six frontmatter fields (`type`, `thread`, `label`, `state`, `created_at`, `updated_at`) and exactly six H2 sections (Objective, Current state, Decisions made, Files touched, Open questions, Next step). It has no `opener` or `mark` field - `skills/governance/ki-checkpoint/references/standards-checkpoints.md` Exact record form.
- The mark is kept as prose in a checkpoint's `Current state` (`Mark: <UTC timestamp>, decisions log at Decision <N>`), defined by `ki-delegation`, not `ki-checkpoint` - `standards-background-runs.md` Recap since the mark.
- Parked tangents live in `Open questions` as dated lines, defined by `ki-delegation` and cross-referenced from `ki-checkpoint` - `standards-background-runs.md` Parking tangents; `standards-checkpoints.md` Exact record form.
- Checkpoints for Project threads are named `<initiative>.<project>`, the master `_state-of-play`; RESUME resolves an opener's Project name to the single `*.<project>.md`; "the label never takes part in resolution" - `standards-checkpoints.md` Project-thread naming, Resume lifecycle.
- The label form is `<Initiative title>: <project>` - `standards-checkpoints.md` Thread label.
- The registry standard calls `ki-checkpoint` "only for ephemeral thread reconstruction" - `standards-project-registry.md` Validation.
- Openers are given as text templates in the delegation standard; the one-line form is `Re-bootstrap as the <project> project thread under ki-delegation.` - `standards-background-runs.md` Opening a thread, Bootstrap.
- `ki-recap` (one session) and "recap since the mark" (a thread since its mark) share the word recap but "share no format or procedure" - `standards-background-runs.md` Recap since the mark.
- Coordinating-thread Needs items carry stable mnemonic tags, never numbers; Kris added on 2026-10-13 that 'a handoff counts as done only when Kris expressly says so. Until then the thread keeps it under Needs, revised into one current consolidated message' - `standards-background-runs.md` Reporting; the ways-of-working decisions log of 2026-10-13.

### Drift between the rules and current practice

- The master thread's opener is `Re-bootstrap as the <label> thread under ki-delegation.`, using the label, while the standard's opener uses the Project name and resolution never uses the label - `ki-principal/+/_CHECKPOINTS/_state-of-play.md` Threads line; `standards-checkpoints.md` Resume lifecycle.
- The ways-of-working checkpoint is to change its label to `KI Model: ways-of-working` (Kris's label rule of 2026-10-12 in the master run: "'Fnd:' for Platform Foundations, 'KI Model:' for Knowledge Islands Model"), which is not `<Initiative title>: <project>` for the Initiative titled "Knowledge Islands model" - `ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md` Current state; `ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md`.
- The standard caps active Project threads at "three or four"; Kris's cap of 2026-10-09 in the master run is 'at most three Project threads active at once, plus the master' - `standards-background-runs.md` Territory master thread; ways-of-working checkpoint Decisions made.
- The ways-of-working checkpoint links the Project note at its old path `Streams/Projects/ways-of-working.md`; this brief's commit moved it to `Streams/Projects/ways-of-working/ways-of-working.md` and did not edit the checkpoint - ways-of-working checkpoint Objective.

### Initiatives, Projects and records

- An Initiative is "a long-lived direction that never finishes", with frontmatter `direction` and a body of `## Direction` and `## Notes`; lifecycle `active`, `paused` or `retired` - `standards-project-registry.md` Initiative note.
- A Project is "a finite outcome with a lead, a target, and a lifecycle", with frontmatter `outcome` and a body of `## Outcome` and `## Notes`; lifecycle `planned`, `active`, `paused`, `completed` or `cancelled`, closed only after a close-out assessment by the lead - `standards-project-registry.md` Project note, Close-out assessment.
- A work record has a mandatory `## Goal`, "the plain-language user or system outcome the work should achieve"; it names its `project`, or its `initiative` when it has no Project - `skills/change-management/ki-work-roadmap/references/standards-work-item-format.md` Body, Frontmatter.
- Links point upwards only; `ki` views derive downward lists - `standards-project-registry.md` Links point upwards.
- "Project" as a registry entry and `repo_type = "project"` as a repository shape share a word; the standard says they "never share a namespace" - `standards-project-registry.md` Scope.
- A Project thread may coordinate "exactly one Project, or one named estate area" - `standards-background-runs.md` Project threads.
- A registry note may take a folder form only while it holds a `design/` folder - `standards-project-registry.md` Location.

### ki-design-loop

- `ki-design-loop` is a process skill in `change-management`, invocation-only, with five stages (brief, independent reviews, merged report, decisions, rollout), artefacts committed in a `design/` folder and deleted after consolidation - `skills/change-management/ki-design-loop/SKILL.md`, `references/standards-design-loop.md`.
- It was recorded from the roadmap-model design run of 7 October 2026 - `ki-design-loop/references/sources.md`.
- A harness skills review (2026-10-13), recorded as "one perspective rather than a decision", keeps the harness `design` area for `ki-design-system` and `ki-design-inspiration`, calls `ki-design-loop` a project-management-office iteration loop whose name overlaps them, suggests a rename saying iteration and project governance, a check on its area, and batching the rename (about 38 references in 17 harness files, plus installed payloads and the catalogue) - `ki-principal/Streams/Projects/ways-of-working/ways-of-working.md` Notes.
- Reviews on two runtimes are already dispatchable: `ki agent launch --runtime` accepts `claude` or `codex` - `ki agent launch --help`.

### The ki command surface

- Installed `ki` is 0.10.1, with top-level commands including `agent`, `estate`, `registry`, `repo` and `territory` - `ki --help`.
- `ki agent`: `decide`, `dispatch`, `launch`, `new`, `queue`, `status`, `wait`, `watch`. `launch` takes `--runtime`, `--add-dir`, `--rules none|push|prune|release` and `--wait-for`; model and effort options are being added by the `agent-model` run under Kris's 2026-10-13 decision to 'add model and effort options to ki agent directly, no tools-ki record, no release' - `ki agent --help`, `ki agent launch --help`.
- `ki repo` selects repositories with `--repo`, `-t, --territory`, `-f, --filter`, `--estate` and `--principals`, and has `audit`, `batch`, `conform`, `diag`, `educate`, `init`, `open`, `repair`, `roadmap`, `skill`, `store`, `trade` and `upgrade` - `ki repo --help`.
- `ki territory` has `audit`, `inspect`, `list`, `open`, `roots` and `show`; `show` repeats the `-t`, `--estate`, `--principals` and `-f` selectors of `ki repo`, and `open` exists under both nouns - `ki territory --help`, `ki territory show --help`.
- `ki registry` (`add`, `list`, `remove`) manages machine-local registration and `ki estate` reshapes checkouts to a manifest - `ki --help`, `ki registry --help`.
- `ki repo roadmap list` already aggregates across a selection and groups `--by project|initiative|area` from the Project registry - `ki repo roadmap list --help`.
- Territory handles gained Capital aliases on 2026-10-12 (commit "feat(territory): add Capital aliases and name Capital stores by territory handle"); the aliases in use are kb, ki, lgl, hnr, va, si, tmx and er - `tools-ki` Git log; `ki-principal/+/_CHECKPOINTS/_state-of-play.md` Estate.
- The territory inventory is called Known Lands in governance - `ki-principal/Admin/Governance/Known Lands.md`, root `AGENTS.md`.

### Command centre and the Knowledge Islands model

- The command-centre Project aligns the estate's coordination concepts into one vocabulary and one read-only view; it found three attention taxonomies (HNR Council Attention, legal-principal headlines, Observatory Beacon), legal-principal Item kinds (wait, chase, deadline, event, verification) that the roadmap model lacks, `+/_RESUME/` checkpoints in legal-principal as a precursor of `ki-checkpoint`, and the principle that "a command surface is a projection over canonical records, never a second register" - `ki-principal/Streams/Projects/command-centre.md` Notes.
- It proposes an Observatory Instrument over the registry, checkpoints, decisions logs and `ki agent` runs as the cheapest state-of-play pilot - `command-centre.md` Notes.
- Kris's 2026-10-13 decision on review method and scope moves command-centre's Knowledge Islands model scope into this design ('command-centre's KI-model scope is absorbed into this design'); command-centre keeps cross-territory alignment and the state-of-play view.

## Reflection

The reflection is a candidate structure. Each point is one claim; points 1 to 8 name the units, points 9 onward settle questions across them.

**Candidate units**

1. **Work (records).** One unit owns one record's life in one repository: `ki-work` as selector and vocabulary, its adapters (`ki-work-roadmap`, `ki-repo-kb-streams`, `ki-work-github-issues`, `ki-work-linear`), and the lifecycle process skills `ki-next`, `ki-plan`, `ki-implement`, `ki-accept` and `ki-batch`. Boundary: a record and its lifecycle, nothing above a Project slug. Hand-off: it receives captures from PMO and Shape, and exposes status for views. This unit is already sound and changes least.
2. **Portfolio (Initiatives and Projects).** The registry standard moves from `ki-work` to `ki-pmo`, because only a Capital holds a registry and only coordinating threads act on it. Records keep naming their Project upwards, so the Work unit needs only the slug-resolution rule, which stays with `ki-work`. Hand-off: PMO owns the notes; Work resolves slugs; views read both.
3. **PMO (threads).** `ki-pmo` owns the coordinating thread as a unit: the territory master thread, Project threads, the cap and queue, seeding, openers and bootstrap, directions, Summary and resting point, Needs tags and handoffs (under Kris's 2026-10-13 rule that a handoff 'counts as done only when Kris expressly says so'), parking, linking records, keeping primary checkouts current, the roll-up since the mark, and coordinator responsiveness. It is adopted by every principal knowledge base (Kris on 2026-10-13: 'every principal knowledge base adopts the PMO skill'). Boundary: coordinating with Kris; it never runs delivery. Hand-off: it dispatches through Delegation, persists through Continuity and captures through Work.
4. **Delegation (background runs).** `ki-delegation` keeps only what a launched worker needs: detachment, run packet, prompt shape, authority tiers and footers, decisions log, coordination, run queue, monitoring, worker reporting, and delegation packets. Roughly half of the background-run standard moves to `ki-pmo`. Boundary: from prompt to report. Hand-off: PMO writes prompts and reads reports; `ki agent` is the launcher.
5. **Continuity (checkpoints).** `ki-checkpoint` stays the generic, repository-owned snapshot for any named thread, coordinating or not, and is not renamed into the threads skill: it applies to repositories with no PMO, and a snapshot format is a smaller, more stable concept than the coordination practice. It gains two structured, optional frontmatter fields - `opener` and `mark` - so state lives in the schema rather than in prose conventions owned elsewhere. Boundary: the record's shape and lifecycle. Hand-off: PMO defines what a coordinating thread writes; `ki-recap` may supply evidence as today.
6. **Shape (design loop).** The design loop stays a separate invocation-only process skill rather than folding into `ki-pmo`, because it also runs outside Capitals (`docs/design/<subject>/`) and has its own artefacts and stages. It sits beside `ki-pmo` in the same area, invoked by a coordinating thread, and hands its rollout to `ki-next`. It is renamed so that it no longer reads as interface design (see point 13).
7. **Session (recap).** `ki-recap` stays the single-session summary. To end the two-recaps collision, the thread-level form is renamed "roll-up since the mark" in `ki-pmo`, keeping "recap" for one session only.
8. **Model economy (tokenomics).** `ki-tokenomics` owns purposes and their mapping to concrete models and effort; `ki-pmo` states which purpose a coordinating thread uses and `ki-delegation` which purpose a worker prompt declares. Neither restates the mapping.

**Placement and naming**

9. The `change-management` area should hold only the Work, Portfolio, PMO, Shape and Session units. `ki-pulse` is signal intake, not change management, and belongs beside the radars in `governance` or in `acquire`; captures it produces still go through `ki-next`.
10. `ki-work-housekeeping` should be renamed to say recurring work (for example `ki-work-recurring`), because "housekeeping" already names runtime-cleanup skills in `environment`.
11. Kris's 2026-10-13 ruling that "every repository adopts the roadmap skill" should mean every repository declares `ki-work` with an adapter, since `ki-work-roadmap` is invalid for a knowledge base by the adapter standard. The alternative - merging `ki-repo-kb-streams` record rules into `ki-work-roadmap` so one roadmap skill serves both shapes - is simpler to explain and worth the reviewers' view.
12. `ki-batch` (skill), `ki repo batch` (command) and the batch scaffold in `ki-work` are one concept with three homes; the skill should name the command as its mechanics and `ki-work` should stop owning the scaffold.
13. `ki-design-loop` should be renamed for what it does - shaping a subject before any record exists - and candidates should be tested against `ki-plan`'s wording. Candidates: `ki-shape` (reads as a stage before plan; `ki-plan`'s description would drop "Shape"), `ki-deliberate`, `ki-review-loop`. Recommendation: `ki-shape`. The rename rides with the other renames in this design as one harness change.

**Checkpoints, sessions and recoverability**

14. The vocabulary needs four words defined once, in `ki-pmo`: a **session** is one runtime conversation; a **thread** is a durable line of coordination that outlives sessions and is reconstructed from its checkpoint; a **run** is a `ki agent` run folder with its decisions log; an **agent** is one background worker in a run. Today "thread" and "session" are used interchangeably.
15. The mark belongs with the checkpoint as data and with `ki-pmo` as behaviour: `mark: { at: <UTC>, decision: <N> }` in frontmatter, while striking, the roll-up and carry-forward stay in `ki-pmo`.
16. Each checkpoint should carry an `opener` line in frontmatter, written by the master when it seeds the thread, which re-bootstraps the thread when pasted alone. It names the Project, not the label, ending the drift noted above; `ki` can print it (point 22), so it is never retyped.

**Goals at every level**

17. Each level should state one "what for" sentence under one shared word family: Initiative **direction** (never met), Project **outcome** (met once, with a test), record **goal** (met by one change). Keep the three words, because they mark the difference in finiteness, and define them together in one table in `ki-pmo`.
18. An Initiative should carry a bounded list of current aims - at most three to five - each served by one or more Projects, so the Initiative's direction becomes checkable without listing its Projects. A Project's outcome stays one sentence. A record's goal stays one or two sentences.
19. A Project thread should coordinate exactly one Project; the "or one named estate area" escape should go, with such areas registered as Projects or handled by the master.

**The ki command surface**

20. The surface has three selection nouns that overlap - `ki repo` selectors, `ki territory show|open` and `ki registry list` - and two `open` commands. One rule should apply: `ki repo` acts on a selection, `ki territory` describes territories and their governance, `ki registry` manages machine registration. `ki territory open` and `ki territory show`'s repository listing fold into `ki repo open` and `ki repo list`.
21. On naming, "territory" is the governed concept in the Charter, the registry handles and `-t`; renaming the concept costs more than it saves. Recommendation: keep the word in prose and governance, and give the command a short alias. Reviewers should weigh `ki land` (echoing Known Lands) and `ki terr` as the short form.
22. The territory-level view is a projection, never a register, and reads the registry, the roadmaps, checkpoints and `ki agent` runs: `ki territory projects` (Initiatives, their Projects, lifecycle and open-record counts), `ki territory threads` (checkpoints with label, state, mark, opener and running agents), and `ki territory roadmap list|summary` as a thin alias of `ki repo roadmap list|summary -t <handle> --by project`. `ki territory threads --opener <project>` prints a thread's opener.
23. `ki agent` should gain `--model` and `--effort` (Kris's 2026-10-13 decision, in progress: 'add model and effort options to ki agent directly') and accept a purpose (`--purpose fast|standard|reasoning|frontier`) resolved through `ki-tokenomics` `model_tier_bindings`, so prompts and coordinators name purposes, not providers.

**Coordinator model and effort**

24. A coordinating thread's default should be `standard` at low reasoning effort, not `fast`. Its turns are short, but it reads a long contract, judges what to delegate, writes and reads prompts and reports, and is Kris's only interface; a weak coordinator costs more in rework than it saves. `fast` is acceptable once the PMO bookkeeping (opener, mark, roll-up sources, Needs list) is mechanical through `ki` commands.
25. Higher effort is a per-decision escalation, not a thread default: the coordinator hands any choice needing analysis to a `reasoning` background agent and brings back options, as this design does. Design-loop reviews and merges run at `reasoning` or `frontier` on both runtimes (Kris on 2026-10-13: 'Reviews use higher-reasoning models on both runtimes, Fable (Claude) and Astra (ChatGPT/Codex), with a higher-reasoning consolidation merging the two').

**Knowledge Islands model and command centre**

26. This design settles the Knowledge Islands column of command-centre's glossary - master and Project threads, Initiatives and Projects, checkpoints, decisions logs, marks, Needs, runs and agents - and hands it to the command-centre Project as one definitions table. Command centre keeps the cross-territory crosswalk and the state-of-play view, which should be built on the `ki territory` projections in point 22.
27. Needs items are the Knowledge Islands form of legal-principal's decision Items; adopting a small set of Item kinds (decide, wait, chase) as Needs tag classes is worth considering, but belongs to command centre's attention taxonomy, not this design.

**Rollout**

28. The rollout should pilot `ki-pmo` first, by moving the thread material out of `ki-delegation` without changing its meaning, with the checkpoint `opener` and `mark` fields in the same pilot; renames, the command-surface changes and the views follow as later waves, each a record in its owning repository.
