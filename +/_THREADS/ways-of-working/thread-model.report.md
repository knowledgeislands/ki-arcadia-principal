# thread-model report - ways-of-working run

Design only. One note written, committed and pushed; no skill, record, checkpoint or protected-zone edit.

## What has been done

- Wrote [thread-types-and-durable-decisions](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/thread-types-and-durable-decisions.md) (219 lines): terms (thread, session, chat, run, agent), the three thread types with purpose, delegation, identity, decisions, opener, banner and close-out, a CLOSED state word for the coordination frame, the decision lifecycle in six stages with four decision classes set at each mark, the design-note lifecycle and its move to `+/_DESIGN/<subject-slug>/`, the unit model, the pending records touched and eight open questions.
- Added its entry to the folder index [design](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/design.md).
- Committed as `docs(design): model thread types and the decision lifecycle for ways-of-working` (ki-principal `1749d13`), explicit paths, co-author trailer naming Claude Fable 5.1; `git pull --rebase` was a no-op and the push to `origin/main` was fast-forward. The pre-commit `rumdl` check passed; the pre-commit KI repo audit passed with two pre-existing STREAM-10 warnings on the `paperclip-bootstrap-and-recovery` and `website` Projects, unrelated to this change.
- Checks: no en or em dash in the note; every absolute link resolves; `rumdl check` clean on both files.
- Pending records found and cited, none duplicated: [KI-HARNESS-GOV-180](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-180-tracked-thread-decisions-home.md), [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md), [KI-PRINCIPAL-ECO-014](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md), [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md), [KI-HARNESS-GOV-184](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-184-working-area-marks.md), [KI-PRINCIPAL-ECO-012](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-012-notification-strategy-for-delegated-work.md). Not yet captured anywhere: the banner implementation, Wave B's `ki-pmo-design` standard change and Wave F's island design-folder move; the note names them and captures nothing under the burn-down focus.
- Limitation: the note uses the `streams/design` note type its sibling uses, which the `ki-repo-kb` frontmatter standard does not declare; the note itself proposes dropping that type with the `+/_DESIGN/` move.

## What is in progress

Nothing is running.

Outstanding - no action requested now:

- Retained material: the sibling banner note still cites decisions by number in two places; [KI-PRINCIPAL-ECO-014](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md) owns that sweep and this note did not touch it.

## Unit model (verbatim from the note)

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

## Outstanding queries (verbatim from the note)

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
