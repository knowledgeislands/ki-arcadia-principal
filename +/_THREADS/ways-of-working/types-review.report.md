# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › types-review

**Run report at 23:46 BST · last mark 23:22 BST**

---

## Done

- **Read-only review finished.** It answers Kris's INCEPTION-TYPE follow-up, as received on 2026-10-14: "I'd like to discuss the whole project: life cycle and a potential type field. Do we have different types as well for roadmap items? And what about initiatives? So I think any of these kind of comparable concepts across the hierarchy of initiatives, projects, and roadmap items I want to have a review of." Sources: the ki-principal Streams notes; the harness skills `ki-work` (Project registry), `ki-work-roadmap`, `ki-repo-kb-streams`, `ki-repo-kb-activities`, `ki-work-recurring`, `ki-pmo` and `ki-checkpoint`, with their rubric scripts; the tools-ki work code; and ki-specifications. Nothing else was edited.
- **Short answer.** Roadmap records already have types: `kind` (`deliver`, `decide`, `investigate`, `audit`) and `purpose` (seven values). Projects and Initiatives have no type, kind, stage, horizon or priority field. They carry only `lifecycle`, a `lead` and their parent link. Activities have a `realization` (how the Activity runs) but no kind. The gaps are in what each level's lifecycle means and in what gets checked, not in a missing type field.
- **Comparison table.** Each cell gives the value set and where it is defined. The last column says what enforces it.

| Attribute | Initiative | Project | Roadmap record | Activity | Enforced by |
|---|---|---|---|---|---|
| Lifecycle | `lifecycle`: `active`, `paused`, `retired`. Never completes. [Registry standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-work/references/standards-project-registry.md) | `lifecycle`: `planned`, `active`, `paused`, `completed`, `cancelled`. Closing needs a close-out assessment. Same standard | `status`: `triage`, `draft`, `ready`, `in-progress`, `awaiting-review`, `done`, `cancelled`. [Work-item format](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-work-roadmap/references/standards-work-item-format.md) | `status`: `active`, `paused`, `retired`. [Activities standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/repo-structure/ki-repo-kb-activities/references/standards-activities.md) | Record `status`: the [roadmap rubric](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-work-roadmap/scripts/rubric/contexts/roadmap-evidence.ts) (ITEM-2) and [tools-ki items.ts](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/src/core/work/items.ts). Activity `status`: the [activities rubric](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/repo-structure/ki-repo-kb-activities/scripts/rubric/items/activities.ts). Project and Initiative `lifecycle`: no value check anywhere† |
| Terminal ending | `retired` | `completed` or `cancelled`, after a prose close-out assessment | `done`, or `cancelled` with a `resolution` (`obsolete`, `rejected`, `duplicate`, `merged`, `superseded`) | `retired` | `resolution`: the roadmap rubric. Close-out: the [close-out check](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/repo-structure/ki-repo-kb-streams/scripts/rubric/contexts/closeout.ts) |
| Type or kind | none | none | `kind`: `deliver`, `decide`, `investigate`, `audit`. Required once adopted; recurring runs default to `audit` | `realization`: `slash-command`, `scheduled-task`, `conversational`, `manual`, `workflow` (how it runs, not what it is) | `kind`: the roadmap rubric and tools-ki. A missing `kind` only warns |
| Purpose | none | none | `purpose` (optional): `capability`, `corrective`, `debt`, `governance`, `learning`, `adoption`, `upkeep` | Used in ki-principal (`purpose: upkeep`). Defined only for the `housekeeping` template in the [recurring-work standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-work-recurring/references/standards-recurring-work.md), not in the Activities standard | The roadmap rubric and tools-ki |
| Stage | none | none. The proposed evaluation stage would rest on `planned` plus an Outcome worded as a decision | No field. "Stage" means a status-and-horizon combination, under Detail by stage | none | n/a |
| Horizon | none | none (`target` date only) | `horizon`: `now`, `next`, `soon`, `future`, `hold`, with a `hold` mapping giving the reason, release condition and review date. [Roadmap standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-work-roadmap/references/standards-repository-roadmaps.md) | `spawn_horizon`, inside `housekeeping` only | Roadmap rubric (status-and-horizon table) and tools-ki |
| Priority | none | none | **Not defined anywhere.** Horizon is the order. Yet [KI-PRINCIPAL-MOD-006](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-MOD-006-knowledge-acquisition-lifecycle.md) and [KI-PRINCIPAL-MOD-008](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-MOD-008-whole-philosophy-coherence-review.md) carry `priority: medium` | none | tools-ki rejects unknown fields in a project roadmap but silently passes them in KB Streams‡ |
| Area | none | none | `area`: a fixed issuing namespace (`ECO`, `EXT`, `GOV`, `MOD`, `OPS` in [.ki.toml](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/.ki.toml)), immutable, explicitly not a group | none | Roadmap rubric and `_ISSUES.md` ledger |
| Component | none | none | `component` (optional), from `.ki.toml` `components` | Used in ki-principal (`component: operations`). Defined only for `housekeeping` | Roadmap rubric |
| Owner | `lead` | `lead` | none. The owning repository is the owner (implied by the identifier) | `author` only | No check |
| Parent | none (top) | `initiative` | `project`, or `initiative` for projectless work. Naming both is redundant; a contradiction fails | `initiative`, required when active. Runs inherit it and never name a Project | Upward links: the [Streams check](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/repo-structure/ki-repo-kb-streams/scripts/rubric/contexts/streams.ts). Slug resolution: [tools-ki registry.ts](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/src/core/work/registry.ts) and the roadmap rubric (unknown slug warns) |
| Statement | `direction` | `outcome` | `title` (four words at most) plus a `## Goal` section | Body | `## Goal`: the roadmap rubric |

† [registry.ts](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/src/core/work/registry.ts) copies a Project's `lifecycle` into views without checking it. The [close-out check](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/repo-structure/ki-repo-kb-streams/scripts/rubric/contexts/closeout.ts) counts only `active` and `paused` as open and `completed` and `cancelled` as closed, so it never looks at a `planned` Project or a misspelt value. No check reads Initiative `lifecycle`, `lead`, `outcome`, `direction` or `target`. ‡ [items.ts](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/src/core/work/items.ts) throws "unsupported or repeated field" only for the `roadmap` adapter. In KB Streams an unknown key is skipped without a warning.

- **Threads.** A thread's type (conversational, coordination or state-of-play) is defined in the [ki-pmo standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/references/standards-pmo.md) but not recorded anywhere. A checkpoint carries `type: ki-checkpoint` and `state: active` ([checkpoint standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-checkpoint/references/standards-checkpoints.md)), so this is a fifth lifecycle word set. ki-specifications has its own KIP lifecycle (`Draft`, `Review`, `Accepted`, `Implemented`, `Superseded`, `Withdrawn`) in its [specification process](/Users/krisbrown/workspaces/knowledge-islands/ki-specifications/docs/specification-process.md). That governs specification documents, not work, and has no bearing on this hierarchy.
- **How `kind` and `purpose` are used across the estate.** `deliver` dominates: 3 of 4 adopted harness records, all 8 tools-ki records, 5 of the 6 typed tools-rig records, and both Techne repositories. There is one `investigate` (tools-rig) and one `audit` (KI-PRINCIPAL-MOD-008). No record anywhere uses `decide`. The RECORD-THRESHOLD decision explains why. Kris set it on 2026-10-14: "a record only for a product or standard change needing acceptance; operational work runs on the decisions log, brief and report". Under that rule, decisions and investigations mostly live in Projects and thread logs, not in records.
- **Inconsistencies and gaps.**
  1. _`planned` is overloaded and the exemplar does not fit it._ The four `planned` Projects are delivery work that has not started: [command-centre](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/command-centre.md), [skill-refresh](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/skill-refresh.md), [specification-review](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/specification-review.md) and [trades-revamp](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/trades-revamp.md). The one Project whose Outcome is a decision, [delta-evaluation](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/delta-evaluation.md), is `paused`, not `planned`. With `planned` alone, no checker or view can tell an evaluation Project from a delivery Project that has not started.
  2. _Lifecycle values are not checked at the registry levels._ A misspelt Project or Initiative `lifecycle` passes every check. A `planned` Project never shows in the close-out report, so a forgotten evaluation Project would go unnoticed except through the state-of-play 30-day review the areas proposal suggests.
  3. _Pausing is unequal._ A held record must state why, its release condition and a review date. A `paused` Project needs none of these. Four Projects are paused: delta-evaluation, [roadmap-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/roadmap-model.md), [specifications](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/specifications.md) and [website](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/website.md).
  4. _`priority` is an undefined field_ on two KB records, and it passes only because the KB adapter is more lenient than the project-roadmap adapter.
  5. _Activity fields go beyond their standard._ ki-principal Activities carry `purpose` and `component` (for example [Briefings Activity](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Operations/Activities/Briefings Activity.md>)). The Activities standard defines only `status`, `realization`, `author` and `initiative`.
  6. _The [Streams index note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Streams.md) contradicts the registry standard._ It says a Project note carries "outcome, health, current decision, next step and the open records that belong to it" and that an Initiative note carries "a dated Review". The standard forbids health and status sections, record lists and dated reviews. The [Projects index](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/Projects.md) is correct.
  7. _"Area" means two things._ A record's `area` is an immutable issuing namespace. The AREAS-PATTERN and NEW-AREAS queries use "area" for a topic held as an evaluation Project.
  8. _Owner is uneven._ Initiatives and Projects have a `lead`. Records have no assignee by design, because the repository owns them. Activities have no owner, only an `author`.
- **Evaluation stage and AREAS-PATTERN.** They are the same proposal. The evaluation-stage pattern is section 1 of the state-of-play [areas-proposal report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/areas-proposal.report.md): a `planned` Project whose Outcome is a decision, with ideas in Notes or `design/`, no records and no thread. It opens only when three threshold conditions hold, at most one per Initiative and three across the territory, and it then graduates to `active` or folds. AREAS-PATTERN is the open query asking Kris to make that a rule. No decisions log records an answer to it yet.
- **Where INCEPTION-TYPE fits.** Kris answered on 2026-10-14: "treat an inception Project as the evaluation-stage pattern, not a new type, with a ChatGPT seed-and-return loop owned by knowledge-acquisition, and settle it together with AREAS-PATTERN". So inception is already settled as _not a type_. It is the evaluation stage plus a loop that knowledge-acquisition owns, and it depends on AREAS-PATTERN. This review finds one gap that decision leaves: under `planned` the stage cannot be seen (gaps 1 and 2). EVAL-STAGE below closes it with a lifecycle value rather than a type, so INCEPTION-TYPE still holds.
- **Proposed model, in one paragraph.** Keep three independent axes, each with one owner and one level:
  - _Lifecycle_ exists at every level, in that level's own words. Every value is checked, and the evaluation stage is one of the Project values.
  - _Kind and purpose_ stay record-only. A Project's kind would only repeat its Outcome, and Initiatives are four directions.
  - _Horizon_ stays record-only and is the only priority signal. Cross-Project priority stays with the state-of-play thread.
  - `area` stays an issuing namespace, and `component` a repository vocabulary. Activities formally take `purpose` and `component` so that the runs they spawn inherit them.

  The queries below put each piece to Kris.
- **Committed, not pushed.** This report is the only file changed. It is committed by explicit path through a private index as `ef5deac9`, and this status line is a follow-up commit; the scoped commit gate passed (FAIL=0). `git pull --rebase` refused because of other threads' uncommitted changes, but a fresh fetch shows origin/main is an ancestor of HEAD, so a push would be a fast-forward. It would also carry nine commits from other runs that sit beneath mine, from `924a89e5` to `7e9cc770`, so I did not push.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- This report's commits wait to be pushed with the nine other-thread commits beneath them, under the thread's open PUSH-CARRY query in the [report-repair report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/report-repair.report.md).
- AREAS-PATTERN, NEW-AREAS and OBS-MERGE remain open in the state-of-play thread's [areas-proposal report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/areas-proposal.report.md). EVAL-STAGE below is meant to be answered with AREAS-PATTERN, as INCEPTION-TYPE asks.
- Thread type is not recorded on checkpoints. That is fine while a checkpoint's name shows its type, and needs nothing now.
- The ChatGPT seed-and-return loop belongs to [knowledge-acquisition](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/knowledge-acquisition.md) under INCEPTION-TYPE and is outside this review.

## Queries

### EVAL-STAGE - How an evaluation Project shows itself

**Context:** Kris settled INCEPTION-TYPE as "the evaluation-stage pattern, not a new type". The pattern currently rests on `lifecycle: planned` plus an Outcome worded as a decision. But `planned` already means "delivery not started" for four Projects, and the only real evaluation Project, delta-evaluation, is `paused`. No checker or view can tell the two apart. The close-out check ignores `planned`, so an evaluation Project is never reviewed automatically. A distinct lifecycle value names a stage, not a type, so it keeps to INCEPTION-TYPE, and it lets the checker enforce the pattern's rules: no records, the cap, and a staleness warning.

**Query:** Should the evaluation stage become its own Project `lifecycle` value instead of reusing `planned`?

**Options:**

a) (recommended) Add `evaluating` as the first Project lifecycle value, before `planned`, in the `ki-work` Project registry standard. It graduates to `planned` or `active`, or folds to `cancelled` after a close-out assessment. The Streams checker warns when a record names an `evaluating` Project and when the AREAS-PATTERN cap is exceeded. Move delta-evaluation to `evaluating`. Ways-of-working carries the change when AREAS-PATTERN is answered.

b) Keep `planned` with a decision-worded Outcome, as the areas proposal's option a) has it, and rely on the state-of-play review at each mark.

c) Add a Project `kind` field (`deliver` or `decide`), mirroring records. This reopens INCEPTION-TYPE.

### TYPE-FIELD - No type field above roadmap records

**Context:** Records already have `kind` and `purpose`. Across the estate nearly all records are `deliver`, and `decide` is never used, because RECORD-THRESHOLD sends decisions and investigations to Projects and thread logs. A Project's Outcome already says what sort of result it seeks. With EVAL-STAGE, its lifecycle would also show whether it is deciding or delivering. Initiatives are four long-lived directions with nothing for a type to sort.

**Query:** Should Projects and Initiatives stay without a type, kind or purpose field, with `kind` and `purpose` staying record-only?

**Options:**

a) (recommended) Yes. No type field on Projects or Initiatives. Add a short crosswalk to the `ki-work` Project registry standard naming the comparable attributes at each level (lifecycle, kind, purpose, horizon, area, component, lead, parent) and the one level that owns each.

b) Add an optional `purpose` to Projects using the record vocabulary, so views can group Projects as capability, upkeep and so on.

### REGISTRY-CHECK - Check registry and Activity values

**Context:** Record `status`, `kind`, `purpose`, `horizon` and `area` are all checked. Project and Initiative `lifecycle`, `lead`, `outcome` and `direction` are not, so a typo passes and drops out of the close-out report. ki-principal Activities carry `purpose` and `component`, which the Activities standard does not define.

**Query:** Should the Streams checker check registry frontmatter, and should the Activities standard adopt `purpose` and `component`?

**Options:**

a) (recommended) Yes to both. The `ki-repo-kb-streams` rubric fails an unknown Project or Initiative `lifecycle` and a missing `lead`, `outcome` or `direction`. The `ki-repo-kb-activities` standard adds optional `purpose` and `component` with the record vocabularies, and spawned runs inherit them. These are harness changes under the paused [roadmap-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/roadmap-model.md) Project, whose Outcome is that "the roadmap checker enforces it".

b) Check registry values only, and remove `purpose` and `component` from the Activity notes instead.

### PAUSE-CONDITION - A paused Project says why and until when

**Context:** A held record must give why it is held, its release condition and a review date. A `paused` Project needs none of these, and four are paused (delta-evaluation, roadmap-model, specifications, website) with nothing machine-readable saying what would restart them.

**Query:** Should a paused Project state its release condition and review date?

**Options:**

a) (recommended) Yes, in prose: a paused Project's `## Notes` opens with one line giving the release condition and a review date. The state-of-play thread reviews it at the next mark after that date. No new frontmatter.

b) Add a `hold`-style mapping (`reason`, `condition`, `review`) to Project frontmatter, checked like a record's.

### PRIORITY-FIELD - The undefined `priority` field

**Context:** No standard defines `priority`. Horizon is the selection order, and each owning repository keeps its own priority authority. KI-PRINCIPAL-MOD-006 and KI-PRINCIPAL-MOD-008 carry `priority: medium` all the same. The project-roadmap adapter would fail it, but the KB Streams adapter skips unknown keys silently.

**Query:** Should `priority` be removed and the KB adapter warn on unknown record fields?

**Options:**

a) (recommended) Remove `priority` from KI-PRINCIPAL-MOD-006 and KI-PRINCIPAL-MOD-008 under Kris's instruction. The KB Streams checker and tools-ki warn on any unknown record field, matching the project-roadmap adapter. Horizon stays the only priority signal.

b) Define an optional `priority` (`high`, `medium`, `low`) in the work-item format for both adapters.

### AREA-WORD - Reserve "area" for issuing namespaces

**Context:** A record's `area` (`ECO`, `GOV`, `MOD` and so on) is an immutable numbering namespace that the standard says "is not a mutable theme or group". The AREAS-PATTERN and NEW-AREAS queries use "area" for a topic held as an evaluation Project, and that will confuse readers and agents.

**Query:** Should "area" be kept for issuing namespaces only, with topics called evaluation Projects?

**Options:**

a) (recommended) Yes. The rule and the reports call them evaluation Projects (or `evaluating` Projects under EVAL-STAGE), and "area" means only the record issuing namespace.

b) Keep both meanings and define the topic sense in the Project registry standard.

### STREAMS-INDEX - Correct the Streams index note

**Context:** [Streams.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Streams.md) says Project notes carry "health, current decision, next step and the open records that belong to it" and that Initiative notes carry "a dated Review". The registry standard forbids both, and the Projects and Initiatives index notes already describe it correctly. This review was read-only, so it changed nothing.

**Query:** Should a small run rewrite the Projects and Initiatives paragraphs of the Streams index note to match the registry standard?

**Options:**

a) (recommended) Yes. Ways-of-working dispatches a one-file run, under this owner instruction, to align the two paragraphs with the Project registry standard and commit by explicit path.

b) Leave it until the paused roadmap-model Project resumes.

```text
EVAL-STAGE

Add `evaluating` as the first Project lifecycle value, before `planned`, in the ki-work Project registry standard: it graduates to `planned` or `active`, or folds to `cancelled` after a close-out assessment; the Streams checker warns when a record names an `evaluating` Project and when the AREAS-PATTERN cap is exceeded; move delta-evaluation to `evaluating`; ways-of-working carries it when AREAS-PATTERN is answered.

---

TYPE-FIELD

No type, kind or purpose field on Projects or Initiatives; `kind` and `purpose` stay record-only. Add a short crosswalk to the ki-work Project registry standard naming the comparable attributes at each level (lifecycle, kind, purpose, horizon, area, component, lead, parent) and the one level that owns each.

---

REGISTRY-CHECK

The ki-repo-kb-streams rubric fails an unknown Project or Initiative `lifecycle` and a missing `lead`, `outcome` or `direction`; the ki-repo-kb-activities standard adds optional `purpose` and `component` with the record vocabularies, inherited by spawned runs; carry both as harness changes under the roadmap-model Project.

---

PAUSE-CONDITION

A paused Project's `## Notes` opens with one line giving its release condition and a review date, and the state-of-play thread reviews it at the next mark after that date; no new frontmatter. Apply it to delta-evaluation, roadmap-model, specifications and website.

---

PRIORITY-FIELD

Remove `priority` from KI-PRINCIPAL-MOD-006 and KI-PRINCIPAL-MOD-008 under my instruction, and have the KB Streams checker and tools-ki warn on any unknown record field, matching the project-roadmap adapter; horizon stays the only priority signal.

---

AREA-WORD

Reserve "area" for the record issuing namespace only; the rule and reports call topic-holding Projects evaluation Projects.

---

STREAMS-INDEX

Dispatch a one-file run, under this instruction, to align the Projects and Initiatives paragraphs of ki-principal's Streams/Streams.md with the Project registry standard (no health, record list or dated review) and commit it by explicit path.
```

```text
╭─ run report · 2026-10-14T22:46:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] EVAL-STAGE
- [waiting] TYPE-FIELD
- [waiting] REGISTRY-CHECK
- [waiting] PAUSE-CONDITION
- [waiting] PRIORITY-FIELD
- [waiting] AREA-WORD
- [waiting] STREAMS-INDEX
- [unpushed] ki-principal ef5deac9 and its follow-up, above nine other-thread commits held for PUSH-CARRY

```text
Resume ways-of-working under current ki-pmo and ki-delegation since 23:22 BST: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
