# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › activity-levels

**Run report at 18:25 BST · last mark 14:45 BST**

---

## Done

- Read the five standards the handoff names, KI's and Personal's registries, KI's Activity notes and Personal's eleven area checkpoints, and wrote this design report for discussion. Nothing else was changed: no standard, skill, record, checkpoint or registry.
- Commit `15a7ab6`, `docs(threads): add the activity-levels design report`, pushed fast-forward to ki-principal with only my commit stacked. The commit gate passed.
- Correction: my first commit, which was never pushed, also swept in 62 paths another session had already staged. They are deletions under `+/_THREADS/mac-studio-setup/` and moves into `Streams/Projects/mac-studio-setup/`. I soft-reset that local commit and recommitted only the report with `git commit --only`. The other session's staging is back exactly as it was, still staged and uncommitted for that session to finish. Lesson: `git add -- <path>` does not protect against an index someone else has already staged, but `git commit --only -- <path>` does.
- Limitation: Personal's evidence report, `thread-shape-proposal.report.md`, is not in [personal-state-of-play](/Users/krisbrown/workspaces/personal/personal-principal/+/_THREADS/personal-state-of-play/), which holds only `decisions.md`. Section 6 classifies the eleven threads from the head of each checkpoint, not from that report.
- Short version: the standards already put recurring work at Initiative level and never in a Project. They have no territory level and no way to coordinate an Activity, and they do not say where an occurrence's report lands. Personal's six area threads with no Project fill that gap by imitating Project threads. The handoff is weakest on the territory level and on where occurrences report. The answer to "no standing thread" is yes, provided that improving an activity is treated as a Project.

### 1. What the standards say today

**Point 1: levels and registration.**

- Initiative level, never a Project. `ki-repo-kb-activities` [standards-activities.md:27](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/repo-structure/ki-repo-kb-activities/references/standards-activities.md): "Every active Activity names the territory Initiative it serves in a top-level `initiative` key, so recurring work is never lost." Line 29: "Recurring work belongs to an Initiative, never to a finite Project, because an Initiative never completes." `ki-work-recurring` [standards-recurring-work.md:66](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-work-recurring/references/standards-recurring-work.md) says the same about templates. `ki-work` [standards-project-registry.md:126](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-work/references/standards-project-registry.md): "Upkeep and other work that never finishes has no Project." Line 141 gives the Activity's parent as "Its owning base; one Initiative".
- No territory level. No field or rule lets an Activity belong to the territory as a whole. In practice KI homes its territory-wide upkeep on an Initiative: [Briefings Activity](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Operations/Activities/Briefings%20Activity.md) and [Tending Activity](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Operations/Activities/Tending%20Activity.md) both carry `initiative: knowledge-islands-model`.
- Registered in the Activity note only. The note lives in `Admin/Operations/Activities/` (standards-activities.md:7), and the link points upwards only. Registry line 124 says "An Initiative note lists neither its Projects nor its records, Activities or housekeeping templates". An Activity that opts into the recurring profile files each run as a record in `Streams/Roadmap/` (standards-recurring-work.md:23). So an Activity has an Activity note and no registry entry.
- Personal's position: personal-principal declares `[skills.ki-repo-kb-activities]` but has no `Admin/Operations/Activities/` collection. Its regular activities are written up in [Regular Activities](/Users/krisbrown/workspaces/personal/personal-principal/Pillars/Productivity/Knowledge%20Management/Regular%20Activities/Regular%20Activities.md) under `Pillars`.

**Point 2: coordination.**

- Threads exist only for Projects. `ki-pmo` [standards-pmo.md:700](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/references/standards-pmo.md): "A coordination thread coordinates exactly one Project for the owner." Line 706: "open a coordination thread only where there is active work to drive ... A dormant Project needs no thread."
- The state-of-play thread cannot run work. Line 712 says it "does project management only: it runs no delivery itself and routes all real work to coordination threads". So the standard has no route for an Activity occurrence that belongs to no Project.
- Cap, line 716: "at most three or four coordination threads are active at once, plus the state-of-play thread", with about three background agents per thread.
- Naming, lines 109-113: the id forms are `<territory>.sop`, `<territory>.<initiative>.<project>` and `<territory>.<slug>`. Line 120 adds that a conversational slug is "never an Initiative or Project slug of the territory". There is no Initiative-level or Activity-level form.
- `ki-checkpoint` [standards-checkpoints.md:35](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-checkpoint/references/standards-checkpoints.md): "A checkpoint with no Project keeps a plain human-selected name, prefixed with an Initiative key only when one obviously fits." Personal's six area checkpoints, such as `knowledge-acquisition.acquire-dispatch`, take that prefix. Because they share the Project stem shape, the interim mapping in Thread naming would read them as `kb.<initiative>.<project>` for Projects that do not exist.
- Every run, including an activity's, needs a run name and a tracked `+/_THREADS/<run>/` folder (`ki-delegation` [standards-background-runs.md:46, 61](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md)). The standards do not say which run an activity occurrence belongs to.

**Point 3: display names.**

- Line 129: the Initiative and Project parts of a title are "their registry `title` fields as they stand ... a title follows a registry title change at the thread's next checkpoint update, while the id does not." So retitling is the lever today, and there is no short-title field.
- SHORT-NAMES in the [registry-shape report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/registry-shape.report.md) would rename KI's slug, folder and title together, `model` and `foundations`, and withdraw INITIATIVE-NAMES' `short` field. SHAPE-AGREE carries the migration and is still open.

### 2. The model, with alternatives

```text
 Territory (Capital: Streams/ registry, Admin/Operations/Activities/)
 │
 ├── SoP thread ...................... checkpoint _state-of-play.md
 │
 ├── [T] territory-wide Activity ..... Activity note only        (A only)
 │                                     today: forced onto an Initiative
 │
 └── Initiative ...................... Streams/Initiatives/<slug>.md
     │                                 never completes
     ├── [I] Initiative Activity ..... Activity note, initiative: <slug>
     │                                 runs: Streams/Roadmap/ records
     ├── upkeep records .............. Roadmap, purpose: upkeep
     │
     └── Project ..................... Streams/Projects/<slug>.md
         │                             finite; closes
         ├── work records ............ Roadmap, project: <slug>
         └── [P] Project Activity .... not allowed today       (C only)

 Links point upwards only: no registry note lists its Activities.
```

**A. Two levels, as Personal proposes.** A recurring activity belongs to the territory or to one Initiative, never to a Project, and has no standing thread.

- For: this matches the standard's Initiative rule and adds the territory-wide case that KI already fudges on Briefings and Tending.
- Objection 1, the weakest point: "territory level" has no owner. The Initiative is the only unit with a `lead`, a direction and an owner who prioritises it. A territory-level activity's only natural steward is the state-of-play thread, which line 712 forbids from running work. So A either loosens that rule or leaves territory activities unowned.
- Objection 2: the line between the levels is soft. Inbox triage reads as territory upkeep, yet it is acquisition, under Knowledge acquisition. "Knowledge upkeep" could be either. Each activity needs a choice that changes nothing material.
- Objection 3: "no standing thread" does not say where an occurrence's queries and decisions go. That is the real coordination gap.

**B. Initiative only, with a named upkeep Initiative.** Keep today's rule. A territory that has territory-wide upkeep adds one Initiative for it, for example Personal `Upkeep` or KI `Operations`, whose direction is keeping the territory in good order.

- For: no schema change, one rule, and every activity keeps a lead and a direction. It is honest about what KI already does implicitly.
- Objection: the upkeep Initiative is a bucket rather than a direction, and it adds a registry entry whose only job is to own Activities. Kris may see that as artifice.

**C. Activities allowed in a Project that owns ongoing upkeep.** Example: Tower's dashboard upkeep while the dashboard Project is live.

- For: it keeps an activity beside the thing it maintains.
- Objection, which I consider decisive: a Project closes and its Activity is orphaned. The registry defines a Project as finite. Upkeep that lasts only as long as a Project is that Project's own cadence, written as recurring records, and needs no Activity.

**D. Activities owned by an Area.** This is the PARA sense of an ongoing responsibility, and Personal's area threads are exactly this.

- Objection: an Initiative is already "a long-lived direction that never finishes", which is an Area. D adds a fourth level that duplicates it, so it collapses into B, or into A at the Initiative level.

**Where I come out:** A at the Initiative level, which is today's rule and is sound. For the territory level, choose between A's explicit territory home, which needs an owner rule (query ACT-HOME), and B's upkeep Initiative. I recommend A with the owner rule. Kris named the territory level, and B's bucket Initiative is the more artificial of the two. If Kris's disagreement is with the territory level itself, B is the better answer.

### 3. Coordination

```text
 trigger: owner asks in any thread, or a schedule fires
     │
     ▼
 SoP thread (or the scheduler) launches ONE agent
     run: <territory>-state-of-play       <- no new thread, no new run
     brief: from the Activity note (procedure, authority, evidence)
     │
     ▼
 agent does the occurrence
     ├─ work product  -> its owning home (records, notes, sources)
     ├─ run evidence  -> Streams/Roadmap run record (recurring profile)
     │                   or the Activity's declared evidence place
     └─ run report    -> +/_THREADS/<territory>-state-of-play/
                         <activity>-<YYYY-MM-DD>.report.md
     │
     ▼
 SoP folds queries into its list; answers land in its decisions log;
 standing changes to the procedure -> Activity note via Enactment;
 report tidied at the next resting point
     │
     ▼
 Need to IMPROVE the activity (finite)?  -> a Project under the
 Activity's Initiative, with an ordinary coordination thread
```

- **Who dispatches:** the state-of-play thread on request, or a scheduler where the Activity's `realization` is `scheduled-task`. Launching a briefed occurrence is a dispatch, not delivery, so ki-pmo needs one sentence allowing it. Any thread may ask the state-of-play thread to run one.
- **Where reports and decisions land:** the run report goes in the state-of-play thread folder. Queries and per-occurrence answers go in its decisions log. A standing change to how the activity runs goes into the Activity note through the Enactment Process, because Activity notes sit under `Admin`. Recurring-profile evidence stays where `ki-work-recurring` puts it.
- **Thread needed:** none for the activity itself. The split that makes this work is that the activity recurs and needs no thread, while improving it is finite and becomes a Project under the activity's Initiative. That Project gets a coordination thread only while it is active, as line 706 already says. Acquire dispatch fits this: its checkpoint describes a stocktake and route-building, which is Project-shaped work, mixed with occurrences.
- **Id, slug and title, if a thread is ever wanted:** an Initiative-level thread `<territory>.<initiative>` would not collide with anything, because line 120 already stops a conversational slug from equalling an Initiative slug. Examples: `kb.knowledge-acquisition`, slug `kb-knowledge-acquisition`, title `Personal > Knowledge acquisition`, or `Personal > Acquire` after a retitle. An Activity-level id `<territory>.<initiative>.<activity>` would collide in shape with the coordination form `<territory>.<initiative>.<project>`, and nothing keeps Activity and Project slugs apart, so I advise against it. `Personal > Acquire > Dispatch` therefore names an Activity, not a thread.
- **Cap:** occurrences run inside the state-of-play run, so they count against its roughly three running agents and not against the three-or-four thread cap. An Initiative-level thread, if adopted, would count as one coordination thread.

### 4. Short names

| | Retitle the Initiative | Short-title field |
| --- | --- | --- |
| Lever | Registry `title`, which line 129 already uses | New `short` on Initiative notes in `ki-work`, used for thread titles and labels |
| Names per Initiative | One | Two, which can drift |
| Heading and registry | Show the short name, `Acquire` | Keep the long name and use the short one in thread titles only |
| Change | None to the standards | ki-work schema, ki-pmo naming, checker |
| Fit with SHORT-NAMES | Same lever. SHORT-NAMES also renames the slug and folder | Reverses SHORT-NAMES, which withdraws INITIATIVE-NAMES' `short` |

Recommendation: retitle, with no new field. That keeps one name and agrees with SHORT-NAMES. Whether a slug follows the title is a separate decision for each Initiative, taken in SHAPE-AGREE's single migration so that nothing is renamed twice. For Personal, `Knowledge acquisition` becomes `Acquire` as a title. A slug rename to `acquire` can join the same migration if Kris wants folders to be short too. One risk: the verb `Acquire` already names the `ki-acquire-*` skills and the `acquire-intake` thread. That is fine for a title, but `acquire` as a slug needs the path-form wikilink rule SHORT-NAMES proposes.

### 5. Forward work, for owner approval, nothing applied

- ki-agentic-harness, `ki-repo-kb-activities`: Home accepts either `initiative: <slug>` or an explicit territory home owned by the state-of-play thread. Audit warns only when an Activity has neither, or both.
- ki-agentic-harness, `ki-work-recurring`: templates and runs inherit an Initiative or territory home on the same terms.
- ki-agentic-harness, `ki-work`: Attributes by level gives the Activity's parent as "one Initiative, or the territory", and the Initiative `## Notes` rule points to Activities by upward link only, unchanged.
- ki-agentic-harness, `ki-pmo`: a new Activities subsection. No thread for an Activity. The state-of-play thread may dispatch a briefed occurrence into its own run. Reports, queries and decisions land as described in section 3. Improving an Activity is a Project. Occurrences count against the agent limit, not the thread cap.
- ki-agentic-harness, `ki-pmo` Thread naming: no `<territory>.<initiative>.<activity>` id. Optionally add `<territory>.<initiative>` if ACT-THREAD b) is taken.
- ki-agentic-harness, `ki-checkpoint`: a checkpoint with no Project no longer takes an `<initiative>.` prefix that looks like a Project stem. Existing ones are renamed in the IDS-MIGRATE pass.
- ki-agentic-harness, `ki-delegation`: an activity occurrence runs in the state-of-play run, with its brief taken from the Activity note.
- personal-principal, a handoff and not harness work: create `Admin/Operations/Activities/`, decide whether Regular Activities in `Pillars` is internal procedure that belongs in `Admin`, and carry out section 6.

### 6. What Personal should do with its eleven threads

The eleven area checkpoints are in [Personal checkpoints](/Users/krisbrown/workspaces/personal/personal-principal/+/_CHECKPOINTS/). This is read from their heads only, so Personal > SoP should check each one before acting.

| Checkpoint | Registry | Under the recommended model |
| --- | --- | --- |
| `health-and-wellbeing.personal-health` | Project, `active` | Keep as a coordination thread if there is active work |
| `knowledge-acquisition.personal-capture` | Project, `planned` | Dormant: no thread until the state-of-play thread opens it within the cap |
| `life-admin.family-and-friends` | Project, `planned` | Dormant, as above |
| `life-admin.household-and-finance` | Project, `planned` | Dormant, as above |
| `thinking-and-research.intentional-life` | Project, `planned` | Dormant, as above |
| `knowledge-acquisition.acquire-dispatch` | none | Activity `Acquire dispatch` under knowledge-acquisition. Its stocktake and route-building become a Project if still live. Retire the thread |
| `knowledge-acquisition.personal-knowledge-upkeep` | none | Activity, territory-wide under A or under knowledge-acquisition. Retire the thread |
| `life-admin.personal-administration` | none | Upkeep records with `purpose: upkeep` under life-admin, plus an inbox-triage Activity if it recurs. Retire the thread |
| `thinking-and-research.personal-research` | none | Not an activity: ideas go in the Initiative's `## Notes` or idea-stage Projects. Retire the thread |
| `rig.personal-rig` | none, label `Rig: regular-maintenance` | Activity `Rig maintenance` under rig. Its held finite items become records. Retire the thread |
| `tower.personal-tower` | none, label `Tower: regular maintenance` | Activity `Tower maintenance` under tower. REPORT-LAUNCHER and LAB-TIMING become records. Retire the thread |

Result: at most one active coordination thread now, plus the state-of-play thread, against a cap of three or four. The six area threads become Activities or records.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- Personal's `thread-shape-proposal.report.md` was not available. If it arrives, it can be compared with section 6.
- Personal > SoP was not messaged, as the brief required. Any handoff waits for Kris.

## Queries

### ACT-HOME - where a regular activity lives

**Context:** The standards allow an Activity only at Initiative level and have no territory level, so KI's territory-wide Briefings and Tending sit on the Model Initiative. Personal proposes territory or Initiative, never a Project. A territory level needs an owner, and the only candidate is the state-of-play thread. Section 2 sets out the alternatives: an upkeep Initiative (B), Project-owned activities (C) and Areas (D).

**Query:** Where may a regular activity be homed?

**Options:**

a) (recommended) Territory or Initiative, never a Project. A territory-level Activity declares an explicit territory home and the state-of-play thread stewards it. Initiative remains the default.

b) Initiative only. Each territory that needs territory-wide upkeep adds one upkeep Initiative for it.

c) Also allow an Activity in a Project that owns ongoing upkeep, moving it to the Initiative at Project close.

### ACT-THREAD - how an occurrence is coordinated

**Context:** An Activity has no thread today, and ki-pmo bars the state-of-play thread from running work. Section 3 proposes that the state-of-play thread or a scheduler dispatch each occurrence as one agent in the state-of-play run. Reports go in its folder and answers in its log, standing changes go to the Activity note through Enactment, and improving an activity becomes a Project with an ordinary coordination thread. An Initiative-level thread `<territory>.<initiative>` would be well-formed if wanted. An Activity-level id would collide in shape with Project ids.

**Query:** Should regular activities run without a standing thread, dispatched through the state-of-play thread?

**Options:**

a) (recommended) Yes. No standing thread. Occurrences are dispatched into the state-of-play run and report there. Improving an activity is a Project with a coordination thread while it is active.

b) Allow one Initiative-level thread per busy Initiative, id `<territory>.<initiative>` and title such as `Personal > Acquire`, counting against the cap.

c) Allow Activity-level threads, `<territory>.<initiative>.<activity>`, accepting the shape collision with Project ids.

### ACT-NAMES - how short display names are set

**Context:** Thread titles take the registry `title` (ki-pmo line 129), so `Personal > Acquire` means retitling Knowledge acquisition. SHORT-NAMES uses the same lever for KI and also renames slug and folder, and it withdraws INITIATIVE-NAMES' `short` field. A short field would keep long names in headings but give each Initiative two names that can drift.

**Query:** Is retitling the Initiative the way to get short display names, with no short-title field?

**Options:**

a) (recommended) Yes. Retitle, with no new field. Whether each slug follows is decided in SHAPE-AGREE's single migration. Personal retitles Knowledge acquisition to `Acquire` in that pass.

b) Add a `short` field to Initiative notes for thread titles and labels, keeping long registry titles.

### ACT-WORK - capture the harness changes and the Personal handoff

**Context:** Section 5 lists seven harness changes and one Personal handoff. They depend on ACT-HOME and ACT-THREAD, and their renames belong in the SHAPE-AGREE and IDS-MIGRATE pass so that nothing is renamed twice. Nothing has been captured or sent.

**Query:** Once the three queries above are answered, should the changes be captured and the handoff sent?

**Options:**

a) (recommended) Capture one ki-agentic-harness record for the section 5 changes, sequenced with the SHAPE-AGREE migration, and send Personal > SoP one handoff carrying section 6 through the thread.

b) Talk it through first and capture nothing yet.

```text
ACT-HOME

Home a regular activity at territory or Initiative level, never in a Project; a territory-level Activity declares an explicit territory home and the state-of-play thread stewards it; Initiative stays the default.

---

ACT-THREAD

Run regular activities with no standing thread: the state-of-play thread or a scheduler dispatches each occurrence as one agent in the state-of-play run, reports and answers land there, standing changes go to the Activity note through Enactment, and improving an activity is a Project with a coordination thread while active.

---

ACT-NAMES

Retitle Initiatives for short display names with no short-title field; decide slug renames in SHAPE-AGREE's single migration; Personal retitles Knowledge acquisition to Acquire in that pass.

---

ACT-WORK

Capture one ki-agentic-harness record for the section 5 changes of the activity-levels report, sequenced with the SHAPE-AGREE migration, and send Personal > SoP one handoff carrying its section 6.
```

```text
╭─ run report · 2026-10-17T17:25:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued in this run
- [waiting] ACT-HOME
- [waiting] ACT-THREAD
- [waiting] ACT-NAMES
- [waiting] ACT-WORK
- [committed] this report committed and pushed in ki-principal
- [uncommitted] another session's staged mac-studio-setup move, 62 paths, left untouched

```text
Resume KI > Model > ways of working under current ki-pmo and ki-delegation since 2026-10-17T13:45:36Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
