---
note_type: streams/design
updated: 2026-10-14T09:41:00Z
author: Written with Claude
---

# Thread types and durable decisions

Design only, for Kris's sanity check before anything is built. It answers Kris's question of 2026-10-14: "What is the terminology that we're using? Is it a thread, a session, or a chat? I think a thread is the right word at this moment in time ... I think we've got three kinds of threads. I think we've got normal threads, we've got coordination threads, and then we've got state of play threads, which effectively are coordination threads of coordination threads ... I think we should formally define the type of thread that we've got. Normal threads could be something like conversational threads as well." And the second half of the same message: "We still need to get to the bottom of what we do about decisions and then being durable knowledge ... This also includes these so-called design folders and what we do with those as they are under a project currently in streams/projects/<project-id>/design."

It builds on what is already settled and changes none of it: the decisions log and agent reports live tracked in `+/_THREADS/<thread>/` ("DECISION-HOME - (b) tracked +/_THREADS/<thread>/ for the decisions log and agent reports; state folder keeps runtime only."), decisions are cited in words ("I actually think we should not necessarily need to put the decision number anywhere. It should be written about what the decision was or is."), and design working material moves to `+/_DESIGN/<subject-slug>/` ("DESIGN-RETENTION - (a) +/_DESIGN/<subject-slug>/ in every repository."). Facts were read on 2026-10-14 at harness `0540aabf`, this island `90f0ca9` and `tools-ki` `a86a63a`.

## 1. Terms

| Term | Definition | Owner | Use it for |
| --- | --- | --- | --- |
| Thread | One named line of work between Kris and an agent that outlives any runtime instance: it has a name, a checkpoint when it spans sessions, and for a coordinating type a run, a tracked thread folder, a mark and a banner. The name is the checkpoint `thread` field; its last segment is the run name. | `ki-checkpoint` (identity), `ki-pmo` once the pilot creates it (how it works) | Every owner-facing sentence: "the ways-of-working thread", "close the thread", "thread AT REST". |
| Session | One runtime instance that carries a thread's turns: a Claude Code or Codex process, a Zed tab, a `claude -p` run. A thread spans sessions across compaction, a red-x recovery or a new day; a session carries at most one thread. A session is named after its thread where the runtime allows. | The runtime; `ki-recap` summarises one session | Runtime facts only: "the session compacted", "a fresh session re-bootstraps from the checkpoint". |
| Chat | Not a Knowledge Islands term. It is the vendor word for a session's transcript in Claude Desktop, ChatGPT and the like. | `ki-housekeeping-claude` and its siblings, when acquiring vendor state | Only when naming the vendor artefact being imported or cleaned. |
| Run | The `ki agent` run a coordinating thread launches its background agents in, named after the thread's last segment and sharing one state folder and one tracked thread folder. | `ki-delegation` | Launcher sentences: "run `ways-of-working`", `ki agent status`. |
| Agent | One detached background worker in a run, with its own prompt, status and report. | `ki-delegation` | "the `banner-mock` agent reported". |

Recommendation: **thread** is the owner-facing term, as Kris proposed; **session** is reserved for the runtime instance; **chat** is never used in island or harness text except for vendor artefacts. The pilot [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) already plans a `ki-pmo` glossary that "defines session, thread, run, worker and agent with one owner each"; this table is its draft, with chat added as the excluded word.

## 2. Three thread types

Kris's three kinds map onto what the `ki-delegation` standard already describes under other names: a thread that does its own work, a Project thread that coordinates one Project, and the territory master thread that coordinates the Project threads. The type names below become the vocabulary; "Project thread" and "master thread" survive only as the role a coordination or state-of-play thread plays.

| | Conversational thread | Coordination thread | State-of-play thread |
| --- | --- | --- | --- |
| Purpose | Do one bounded piece of work with Kris directly: a delivery under `ki-implement`, an audit, a design conversation, triage, a question. The common case. | Coordinate exactly one Project for Kris: dispatch, decide, report, stay responsive. Never does the work itself. | Coordinate the territory's coordination threads: priorities, the thread queue and cap, releases, cross-Project decisions, directions. "Coordination threads of coordination threads", in Kris's words. |
| Delegates | Nothing by default. May hand one long step to a background agent or an in-session subagent, then carries on. | Every unit of substantive work, to detached background agents through `ki agent` in the run named after the Project. | Project work to coordination threads; its own bookkeeping to background agents in the `<territory>-state-of-play` run. |
| Identity | A name only if it spans sessions; then a generic `ki-checkpoint` checkpoint. No run, no thread folder, no mark. | Checkpoint `+/_CHECKPOINTS/<initiative>.<project>.md`, label `<Initiative>: <project>`, run `<project>`, thread folder `+/_THREADS/<project>/`, a mark. | Checkpoint `+/_CHECKPOINTS/_state-of-play.md`, label `Master: state-of-play`, run `<territory>-state-of-play`, thread folder `+/_THREADS/<territory>-state-of-play/`, a mark. |
| Decisions | Go straight to the record they concern, or to the recap's learning route; no decisions log. | Logged in the thread folder in the turn they arrive, quoted; classified at each mark (section 3). | As a coordination thread, plus relays to coordination threads by inbox entry quoting Kris. |
| Opener | None required. | The Project opener from `ki-delegation`; `Re-bootstrap ki-delegation.` thereafter. | The state-of-play opener. |
| Banner during | None. | The `#` banner on every Summary, recap and full summary, and the closing status frame AT REST or NOT AT REST with the resume line, from [thread-banner-and-re-anchoring](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/thread-banner-and-re-anchoring.md). | The same frame, plus the state-of-play view of every thread's state word. |
| Close-out | `ki-recap`: the five-line DONE frame ("thread closed, nothing outstanding, every learning routed") when its three conditions hold, else the Actions list. Session-scoped evidence: `HEAD`, files touched, learning routes. | A final full summary whose frame reads `THREAD CLOSED`, with the conditions in section 2.1; then the thread folder is deleted, the checkpoint retired and the run archived by `ki agent close`. | Rests, never closes, while the territory has work: AT REST is its quiet state. CLOSED only when the territory itself retires. |
| Hooks | None. The coordinator reminder stays silent where no `+/_CHECKPOINTS/` exists (and, after the pilot, where `ki-pmo` is not declared). | Coordinator reminder on every owner message and after compaction. | The same. |

### 2.1 The first type's name

Recommendation: **conversational**, not ad hoc. The property that separates this type from the other two is that its own turns do the work, in conversation with Kris, and `ki-recap` summarises that conversation; "conversational" names that and passes Kris's glance test for names. "Ad hoc" fails it twice: it says unplanned, when a conversational thread is often a planned delivery of a Ready record under `ki-implement`; and it says exceptional, when this is the commonest thread on the machine. "Normal" says nothing at a glance. A conversational thread may be rigorous; what it is not is a coordinator.

### 2.2 Close-out: DONE frame or coordination frame

The `ki-recap` DONE frame attests session-scoped facts: a clean `HEAD` for every touched repository, every learning routed, no Actions. A coordination thread's close attests thread-scoped facts that `ki-recap` cannot see: every in-force decision consolidated, the thread folder committed then deleted, the run archived, the checkpoint retired, the Project note pointing at the outcome. Kris has already chosen that in a coordinating thread `ki-recap` hands to the coordination forms ("RECAP-AWARE - (c) ki-recap detects a coordinating thread and hands to ki-pmo's forms."). So the coordination frame gains a third state word beside NOT AT REST and AT REST:

```text
╭──────────────────────────────────────────────────╮
│  THREAD CLOSED · KI Model: ways-of-working       │
│  every decision has a durable home               │
│  thread folder deleted, run archived             │
╰──────────────────────────────────────────────────╯
   ways-of-working · closed 2026-11-02T16:10Z · checkpoint retired
   outcome: Project note links GDR-KI-PRINCIPAL-003 and the ki-pmo standard
```

CLOSED needs all of AT REST plus: every log entry classified and homed (section 3), `ki agent close` passed its gate, the thread folder and checkpoint removed in the closing commit, and the Project note's `## Notes` linking where the outcome now lives. No resume line follows, because there is nothing to resume; reopening the Project is a new opener from the state-of-play thread. The DONE frame stays `ki-recap`'s and is never rendered by a coordinating thread, so a transcript search for either frame finds one type of close.

## 3. Decision lifecycle: from utterance to durable knowledge

The problem Kris named: "has no meaning to me because I don't know what the decision was ... and I don't know where the list is." The model below has one list per Project, in words, and a home for each decision beyond it.

### 3.1 Stages

| Stage | Where | Written by | When | How it is cited from here on |
| --- | --- | --- | --- | --- |
| Utterance | Kris's message, or the state-of-play thread's relay of it by inbox entry | Kris | The turn it arrives | Quoted verbatim, dated. The thread logs it in that same turn, before anything else, and later quotations are checked against the transcript file. |
| Thread log entry | `+/_THREADS/<project>/decisions.md`, tracked, committed at each mark and when a report lands | The coordination thread, by `ki agent decide` | Same turn | By words and date, with its Needs tag where it has one: "Kris on 2026-10-13: 'DECISION-HOME - (b) tracked +/_THREADS/<thread>/ ...'". The entry's number and timestamp are the launcher's handles only and appear in no prose. |
| Classified entry | The same log, one `home:` line per entry from `ki agent decide --home` or `reconcile` | The coordination thread, at each mark | At each mark, and before a report is accepted | Unchanged; the `home:` line is what `ki agent close` checks. |
| Work record | The record the decision drives: its Context quotes the words, its Steps act on them, its Discussion records the outcome | The thread's planning agent under `ki-plan`; `ki-accept` at close | When the record is captured or planned; confirmed at acceptance | The record's full identifier, linked. The words travel with it, so the record reads cold. |
| Decision Record | `Admin/Governance/Decisions/` in a knowledge base, `docs/decisions/` in a code repository; amended in place where a record owns the concern, new only for a standalone decision | The thread's agent through `ki-decision-records` NEW or an in-place refinement, under a roadmap record or an explicit owner instruction | At record close where the record's Documentation impact names one, or at Project close for anything still homeless | The full identifier, linked, for example [GDR-KI-PRINCIPAL-002](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Decisions/GDR-KI-PRINCIPAL-002-admin-zone-governance-and-operations.md); the record states the decision as it stands and quotes the authority. |
| Enacted knowledge | A skill standard in the harness, root `AGENTS.md`, or a `Pillars` or `Admin` note through the Enactment Process | The repository that owns it, under its own record; this island hands a harness change over as a handoff | When the owning record is accepted | Cited as the rule itself, by note or skill name. The Decision Record holds the rationale; the enacted note need not cite a decision at all. |

### 3.2 Four classes, set at the mark

Every log entry is one of four things, and the class says where it goes. Kris's words support the split: "Not all design decisions need to materialise into decision records, or certainly not their own unique decision records. They may well well supplement existing ones."

- **Operational.** Approves or steers one piece of work: a push, a tidy, an adoption, a release. Home: the work record or commit it drove; where there is none, the log entry is its own home and goes with the thread. Most entries. Examples: `PUSH-STALL`, `DIAGRAMS-TIDY`, `ADOPT-181`.
- **Rule.** Changes how work is done from now on. Home: the skill standard that owns the practice, through a record in the owning repository, or root `AGENTS.md` for a repository-local convention. Examples: `CITE-RULE`, `MARK-RULE`, `QUIET-TOOLS`, the RESTORE-PATH rule.
- **Standalone.** Durable rationale with authority that a reader will need without the thread: a structural or policy choice. Home: a Decision Record, amended in place where one owns the concern. Examples: `DECISION-HOME`, `DESIGN-RETENTION`, `THREAD-SCOPE`, the thread types in this note.
- **Held.** Open, or deferred to a wave. Home: the checkpoint, under its Needs tag, until it resolves into one of the other three. Example: `PAPERCLIP-REQ`.

The coordination thread classifies at each mark and names the home in the log. A standalone entry with no Decision Record yet is carried in the checkpoint's `Current state` as "homeless: `<TAG>`" so the Summary shows it, and the thread proposes the record or refinement to Kris. Nothing is promoted into `Admin`, `Pillars` or a harness standard without the record or the explicit owner instruction the Enactment Process requires.

### 3.3 Who promotes, and when

| Moment | Who | What happens |
| --- | --- | --- |
| The turn a decision arrives | The coordination thread | Logs it in words; launches nothing before it is logged. |
| Each mark | The coordination thread | Classifies every entry since the last mark, writes each `home:`, commits the thread folder, lists homeless standalone entries in the checkpoint. |
| Record acceptance (`ki-accept`) | Kris, on the thread's report | The record's Documentation impact is checked: each rule and standalone entry the record carried has reached its skill, note or Decision Record. |
| Project close | The coordination thread, then Kris | Every entry homed, `ki agent close` passes, the Project note links the outcome, the thread folder and checkpoint go in the closing commit, the CLOSED frame is rendered. |
| Conversational thread | The thread, at recap | A decision goes into the record it works; a decision with no record becomes a routed learning under `ki-recap` step 4 or a `ki-next` triage capture. No log, no classification. |

### 3.4 One list, not two

Today a Project with a design has two lists in words: the thread log and the design loop's `<subject>-decisions.md`. With one thread per Project ("THREAD-SCOPE - One Project per thread: (a) remove the estate-area exception") and the run named after the Project, successive threads of the same Project share `+/_THREADS/<project>/decisions.md`, which is therefore the Project's decisions list for its whole life, tracked, words-first and findable from the checkpoint's `Thread folder:` line. Recommendation: the loop's decisions file stays a stage artefact of `ki-pmo-design`, holding only the answers to that report's tagged decisions, and every one of those answers is also a thread log entry, logged in the turn it arrived. When the design folder is deleted, nothing is lost, because the log already holds the words and the Decision Record holds the standing decision.

## 4. Design notes: what they are and when they graduate

### 4.1 What lives in `design/` today

Three kinds of note share this island's two design folders:

- **Loop artefacts** of `ki-pmo-design`: brief, reviews, merged report, decisions, and the skill graph. The standard calls them "working material, not a record" and deletes the folder in one commit once consolidated.
- **Single design notes** written before a record exists so Kris can sanity-check a model: [thread-banner-and-re-anchoring](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/thread-banner-and-re-anchoring.md), [roadmap-sizing-and-burn-down](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/roadmap-sizing-and-burn-down.md) and this note. No standard describes them; they borrow the folder and a `streams/design` note type that the frontmatter standard does not declare.
- **Audit papers** such as the `agent-host` folder's boundary audit and walkthrough: evidence gathered for an open question.

All three are working material: none is canonical, none is a work record, and each exists to produce something else.

### 4.2 Lifecycle

| Stage | What it means | Who | Trigger |
| --- | --- | --- | --- |
| Draft | Written and committed as produced, marked with thread, run and agent, and time under the working-area mark rule of [KI-HARNESS-GOV-184](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-184-working-area-marks.md). | A background agent of the thread | Kris asks for a design, or a loop stage runs. |
| Under review | Kris reads it; answers arrive as tagged decisions and are logged in words. | Kris, the thread | The sanity check or the report's tagged decisions. |
| Graduated | Each outcome has reached its home: a Ready work record whose Context carries the words it needs; a Decision Record, refined in place or new; a skill standard through the owning repository's record; or an enacted `Pillars` or `Admin` note through the Enactment Process. A dropped idea needs no home. | The thread proposes; Kris's record approval or explicit instruction enacts | The last citing record is Ready, or the Decision Record exists. |
| Deleted | The note or folder is deleted in one commit; Git keeps its history; nothing durable cites it, because the records and Decision Records carry the words themselves. | The thread, on Kris's word | Graduation of every outcome in the note. |

The rule that makes deletion safe: **a work record cites a design note only while the note exists, and by Ready the record's Context quotes what it needs in words.** The roadmap-sizing note's own expectation that its records "cite it" is read that way. A Decision Record never cites a design note, as `ki-pmo-design` already says.

### 4.3 Does design belong under Projects?

No, and Kris has already decided where it goes: "DESIGN-RETENTION - I guess if this is truly a working area, it should be stored in the `+` working area under some kind of design heading in terms of then the durability of it later on." then "DESIGN-RETENTION - (a) +/_DESIGN/<subject-slug>/ in every repository." `Streams` is "knowledge in motion" and its registry notes "link upwards only"; a folder of temporary working papers inside the registry made the Project note move into a folder of its own and gave AUDIT a special case to skip. Recommendation, building on that decision:

- `+/_DESIGN/<subject-slug>/` holds all three kinds in section 4.1, loop artefacts and single notes alike, tracked like `+/_THREADS/`, each file marked under the mark rule, with no index note because `+` is exempt.
- `Streams/Projects/<slug>/design/` and the folder-note form of the Project note are retired: the Project note returns to `Streams/Projects/<slug>.md`, and the Project registry standard loses the folder-form exception.
- The Project note's `## Notes` names the design subject while it exists and links the outcome afterwards, as the registry standard already says.
- The `streams/design` note type is dropped with the move; the mark fields identify the file.
- This island's move is Wave F, and the `ki-pmo-design` standard change is Wave B, as [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) records; neither wave has a record yet, and under the burn-down focus none is captured until Kris says so.

## 5. Unit model

| Unit | What it is | Boundary | Owner | Hand-offs |
| --- | --- | --- | --- | --- |
| Thread | One named line of work outliving any session | Named by its checkpoint; typed as conversational, coordination or state-of-play | `ki-checkpoint` for identity, `ki-pmo` (pilot) for behaviour | A session carries it; `ki-recap` or the coordination forms close it |
| Session | One runtime instance of a thread | Runtime facts only; never the owner-facing unit | The runtime; `ki-recap` | Re-anchoring and the resume line rebuild a thread in a new session |
| Conversational thread | A thread that does its own work with Kris | No run, log, mark or banner; optional generic checkpoint | `ki-recap` for its close; the process skills for its work | Decisions go to the record worked or a routed learning; a long step may go to one background agent |
| Coordination thread | A thread that coordinates one Project | Coordinates, never works; one Project; its own run and thread folder | `ki-pmo` (pilot), `ki-delegation` meanwhile | Receives directions from the state-of-play thread; hands records to repositories; closes with CLOSED |
| State-of-play thread | The coordination thread of the territory's coordination threads | Priorities, queue, cap, releases, cross-Project decisions; no delivery | `ki-pmo` (pilot) | Seeds checkpoints and openers; relays Kris's decisions by inbox entry; rests, never closes |
| Thread close-out | The last message and commit of a thread | DONE frame for conversational; CLOSED frame for coordination; AT REST for state-of-play | `ki-recap` and `ki-pmo` respectively | `ki agent close` gates the coordination close |
| Thread log entry | One owner decision in words, dated, in the tracked thread folder | Logged in the turn it arrives; numbers are launcher handles only | `ki-delegation` (log), `ki agent` (writer) | Classified at the mark; cited by words and date everywhere |
| Decision class | Operational, rule, standalone or held | Set at each mark; names the home | `ki-pmo` (pilot) as a thread working rule | `home:` line read by `ki agent close`; homeless standalone entries surface in the Summary |
| Project decisions list | `+/_THREADS/<project>/decisions.md` for the Project's life | One per Project across its threads; deleted at Project close after consolidation | `ki-delegation`; the coordination thread writes it | The loop's decisions file duplicates nothing it does not also log |
| Decision Record | The standing decision and its rationale | Standalone decisions only; amended in place first | `ki-decision-records` | Linked from the Project note and the records; never cites a design note |
| Enacted knowledge | The rule where readers look for it | Skill standard, `AGENTS.md`, `Pillars` or `Admin` note | The owning repository, through the Enactment Process here | Reached only through a record or an explicit owner instruction |
| Design note | Working material that produces records, a Decision Record or a standard | Never canonical, never cited after it graduates | `ki-pmo-design` for loop artefacts; `ki-pmo` (pilot) for single notes | Lives in `+/_DESIGN/<subject-slug>/` after Wave F; deleted on graduation |

## 6. Pending records this touches

- [KI-HARNESS-GOV-180](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-180-tracked-thread-decisions-home.md): the tracked thread folder and words-and-date citation. This note adds the mark-time classification and the CLOSED frame to the same sections; deliver GOV-180 as planned and carry those into the pilot's `ki-pmo` standard rather than widening GOV-180.
- [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md): `decide --home`, `reconcile` and `close` with the reconcile gate are exactly the mechanics section 3 relies on; the four classes need no new flag, only a convention for the `home:` value ("record", "log" for operational entries with no record, a Decision Record identifier, a skill path, "checkpoint" for held).
- [KI-PRINCIPAL-ECO-014](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md): the citation sweep rewrites the numbered citations this note's design folder still carries, including the sibling banner note; the run-folder sweep applies the classification to closed runs.
- [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md): the `ki-pmo` glossary takes section 1; the thread types, the CLOSED frame and the decision classes are thread working rules the pilot's standard should carry; the `ki-recap` off-ramp decides which close-out renders; Wave F's Decision Record and design-folder move are where sections 3 and 4 land for this island.
- [KI-HARNESS-GOV-184](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-184-working-area-marks.md): marks on `+/_DESIGN/` notes replace the undeclared `streams/design` note type.
- [KI-PRINCIPAL-ECO-012](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-012-notification-strategy-for-delegated-work.md): a thread reaching CLOSED is a fifth event beside the four the banner note names.
- Not yet captured: the banner and re-anchoring implementation (waits on Kris's sanity check of the sibling note), Wave B's `ki-pmo-design` standard change and Wave F's island move; none is captured here under the burn-down focus.

## 7. Open questions for Kris

### THREAD-TERMS - thread, session and chat

- Summary: thread is the owner-facing unit, session the runtime instance, chat a vendor word used only for imported artefacts; run and agent keep their `ki-delegation` meanings. The definitions go into the pilot's `ki-pmo` glossary.
- Need from you: adopt the five definitions, or change one.
- Recommendation: adopt. They match how every existing standard already uses the words, and give the glossary its first draft.

### THREAD-TYPES - three types and their names

- Summary: conversational, coordination and state-of-play, as section 2 defines them; "Project thread" and "master thread" become role words, not type names.
- Need from you: adopt the three, and say whether the type names replace "project thread" and "territory master thread" in the pilot's standard or sit beside them.
- Recommendation: adopt and replace. One name per unit, and the state-of-play thread already carries that name in its checkpoint and opener.

### FIRST-TYPE - conversational or ad hoc

- Summary: section 2.1 recommends conversational: its own turns do the work in conversation with Kris; ad hoc says unplanned and exceptional, which this type is not.
- Need from you: conversational, ad hoc, or another word.
- Recommendation: conversational.

### CLOSE-BANNER - how a coordination thread closes

- Summary: a third state word, CLOSED, in the coordination frame, with the conditions in section 2.2; the `ki-recap` DONE frame stays with conversational threads only.
- Need from you: approve CLOSED, or say a coordination thread should render the DONE frame.
- Recommendation: approve CLOSED. The two frames attest different facts, and one frame per thread type keeps transcript searches unambiguous.

### DECISION-CLASSES - four classes set at the mark

- Summary: operational, rule, standalone and held, each with one home; the coordination thread classifies at every mark and `ki agent close` checks the homes.
- Need from you: adopt the four classes and the rule that a homeless standalone entry shows in every Summary until it has a Decision Record.
- Recommendation: adopt. It turns "consolidate every in-force decision" into a checkable step and answers "where is the list".

### ONE-LIST - the thread log is the Project's decisions list

- Summary: `+/_THREADS/<project>/decisions.md` is the one list in words for the Project's life; the design loop's decisions file stays a stage artefact whose answers are also logged.
- Need from you: agree, or keep a separate curated decisions file per Project after the design folder goes.
- Recommendation: agree. Two lists drift; the log is already tracked, findable from the checkpoint, and homed entry by entry.

### DESIGN-HOME - all design notes to `+/_DESIGN/<subject-slug>/`

- Summary: your `DESIGN-RETENTION` answer placed loop artefacts there; section 4.3 extends it to single design notes and audit papers, retires the folder-note form of the Project note and drops the `streams/design` note type in favour of the mark fields.
- Need from you: approve the extension and the retirements, for Wave B and Wave F when they are captured.
- Recommendation: approve. One home for working material, and the registry goes back to flat notes that AUDIT checks without a special case.

### DESIGN-GRADUATE - when a design note is deleted

- Summary: a note graduates when every outcome has a home, and a record cites it only until Ready, by which time the record's Context quotes the words it needs; then the note is deleted in one commit.
- Need from you: approve the rule, or say design notes are kept after graduation.
- Recommendation: approve. Git keeps the history, the words travel with the records, and nothing canonical ever points at a working file.

```text
THREAD-TERMS - adopt the five definitions
THREAD-TYPES - adopt conversational, coordination and state-of-play; replace the old names in the pilot
FIRST-TYPE - conversational
CLOSE-BANNER - approve CLOSED in the coordination frame
DECISION-CLASSES - adopt the four classes and the homeless-standalone rule
ONE-LIST - agree: the thread log is the Project's decisions list
DESIGN-HOME - approve +/_DESIGN/<subject-slug>/ for every design note; retire the folder-note form
DESIGN-GRADUATE - approve deletion on graduation
```
