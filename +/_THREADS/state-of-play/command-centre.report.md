# command-centre report (read-only survey)

Authority: state-of-play Decision 37. Nothing was edited, committed or pushed in any repository; the only files written are this report and `command-centre.status`. No commits, so no commit identifiers; no checks were run because nothing changed.

## 1. Concept inventory

Maturity scale: **idea** (described, not built), **draft** (built or written, not exercised), **in use** (exercised, still changing), **settled** (stable contract).

| Concept | Where it lives | What it means there | Maturity |
| --- | --- | --- | --- |
| Master state-of-play thread | [`_state-of-play.md`](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/_state-of-play.md); [`standards-background-runs.md` - Project threads](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md) | Owner's one coordinating thread: cross-project priorities, releases, decisions, thread queue. Does no real work since Decision 17 | in use |
| Project thread | same `ki-delegation` standard; checkpoints `+/_CHECKPOINTS/<initiative>.<project>.md` | One thread per active Project, delegation-only, resumes from checkpoint, takes directions from master | in use |
| Checkpoint | `ki-checkpoint` skill ([standard](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/skills/governance/ki-checkpoint/references/standards-checkpoints.md)); instances in Arcadia, kit-hnr (`/Users/krisbrown/workspaces/hnr/kis/kit-hnr/+/_CHECKPOINTS/`) | Six-section current-state snapshot for one named thread; Git holds history | settled |
| Resume checkpoint `[P<n>]` | kit-legal [`Resume Checkpoint Conventions`](</Users/krisbrown/workspaces/kit/legal/kit-legal/Admin/Governance/Conventions/Admin Conventions/Resume Checkpoint Conventions.md>), files in `/Users/krisbrown/workspaces/kit/legal/kit-legal/+/_RESUME/` | Local precursor of `ki-checkpoint`: per-session-thread safety net, priority-prefixed names (`[P1] Command Centre`), read by the Command Centre artifact's Session Threads tab | in use (local, pre-portable) |
| Decisions log | `~/.local/state/ki/agents/<run>/decisions.md`, `ki agent decide` | Numbered, dated owner approvals that prompts cite; non-durable, must be consolidated | in use |
| Mark / roll-up since mark | [KI-HARNESS-GOV-169](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-169-roll-up-since-mark.md) (ready, not implemented); applied by hand in `_state-of-play.md` | Owner-struck point; recap covers everything since | draft |
| Needs tags | `ki-delegation` Reporting | Mnemonic-tagged owner decisions (`BOT-1`, `PRFLOW`) | in use |
| Background agents, run queue, dispatcher | `ki-delegation`; `ki agent` in tools-ki ([guide](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-ki/docs/guides/user/background-agents.md)) | Detached runs with status, queue, waiter, tiers | in use |
| Initiative -> Project -> record | [Project registry standard](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/skills/change-management/ki-work/references/standards-project-registry.md); instances in [Arcadia Streams](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/Projects.md) | Long-lived direction -> finite outcome -> flat work records; Project note has only Outcome and Notes | settled |
| Council (governance) | Arcadia [Council](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Pillars/Philosophy/Realisation/Council/Council.md), [Glossary](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Admin/Governance/Conventions/Glossary.md) | Constitutional body that ratifies, returns or rejects Enactment proposals | settled |
| HNR Council (surface) | kit-hnr [`HNR Council.md`](</Users/krisbrown/workspaces/hnr/kis/kit-hnr/Admin/Operations/Live Artifacts/HNR Council.md>) + `.html`; [HNR-KB-KM-005](/Users/krisbrown/workspaces/hnr/kis/kit-hnr/Streams/Roadmap/HNR-KB-KM-005-operationalise-hnr-council.md) (triage, draft) | Read-only "command surface" Live Artifact: Attention, Roadmap, Areas, Decisions, Focused views. "Projection, not a register". Human role: **HNR Council Convenor** | draft (built, awaiting review, not deployed) |
| Command Centre (legal) | kit-legal [`Command Centre.md`](</Users/krisbrown/workspaces/kit/legal/kit-legal/Pillars/Command Centre/Command Centre.md>), [Guide](</Users/krisbrown/workspaces/kit/legal/kit-legal/Pillars/Command Centre/Command Centre Guide.md>), [Live Artifact](</Users/krisbrown/workspaces/kit/legal/kit-legal/Admin/Operations/Live Artifacts/Command Centre Live Artifact.md>) | Canonical register of mutable operational state: 162 Items in 16 Areas, typed kinds (action, decision, deadline, event, wait, chase, verification, investigation), statuses, five headlines, `depends_on`, completion gate in `CLAUDE.md` | in use, drifting ([KIT-LEGAL-OPS-019](/Users/krisbrown/workspaces/kit/legal/kit-legal/Streams/Roadmap/KIT-LEGAL-OPS-019-command-centre-operational-state-reconciliation.md) in progress; 84 Items stale-verified) |
| State of Play (legal matter) | e.g. `/Users/krisbrown/workspaces/kit/legal/kit-legal/Pillars/Criminal - Complainant/20241128 Theft NYP-28112024-0389/State of Play.md` | Durable "what has happened" record of a matter; Command Centre owns what happens next | in use |
| Case progress review | [ER-HARNESS-007](/Users/krisbrown/workspaces/kit/equalremedy/er-agentic-harness/docs/roadmap/ER-HARNESS-007-review-case-progress.md) (future, draft) | Portable, product-side version of the legal Command Centre view | idea |
| Observatory: Instrument, Beacon, Bridge | apps-observatory [README](/Users/krisbrown/workspaces/kit/knowledgeislands/apps-observatory/README.md), [PDR-KI-OBS-001](/Users/krisbrown/workspaces/kit/knowledgeislands/apps-observatory/docs/decisions/PDR-KI-OBS-001-observatory-beacon-and-bridge.md) | Local web app over the estate. Instrument = read-only view; Beacon = attention; Bridge = governed command with receipts (Rig first). No instrument yet for Projects, Initiatives, checkpoints, decisions logs or `ki agent` runs | in use (built; no open roadmap records) |
| Convenor, Steward, Wright, Ferryman | harness [`subagents/coordination/`](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/subagents/coordination/ki-convenor.md); grant in harness `AGENTS.md` | Convenor "calls the council together and holds no vote": routes work to lanes, puts principal's decisions as one bounded choice. Steward shapes/reviews, Wright delivers, Ferryman owns substrate | draft (role records; Paperclip-bound) |
| Paperclip company, Coordination project | [`ki-agent-coordination-paperclip` standard](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/skills/agentic-systems/ki-agent-coordination-paperclip/references/standards-agent-coordination-paperclip.md); Arcadia [paperclip-bootstrap-and-recovery](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/paperclip-bootstrap-and-recovery.md) | "Coordination plane": company per organisation code, one Paperclip _project per repository_, plus a workspace-free Coordination project for cross-repository sequencing and decisions | draft (under the Techne Programme Hold) |
| Techne controller / Fabric | [`paperclip-as-techne-prior-art.md`](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/+/paperclip-as-techne-prior-art.md); Arcadia [AI Execution Fabric](</Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Pillars/Engineering Practice/Architecture/AI Execution Fabric.md>) | Layering: person -> Techne controller (why, authority) -> Paperclip (who does what) -> Fabric (where) -> runtime (how). Fabric explicitly "not a control plane" | idea |
| Project Portfolio | kit-principal [`Project Portfolio.md`](</Users/krisbrown/workspaces/kit/personal/kit-principal/Pillars/Technology/Project Portfolio.md>) | "Portfolio control plane" registry of side projects with owning repository, purpose and state, snapshot of 4 Oct | in use (manual snapshot) |
| Knowledge Island Workbench | kit-principal [`Knowledge Island Workbench.md`](</Users/krisbrown/workspaces/kit/personal/kit-principal/Pillars/Technology/Knowledge Island Workbench.md>) | Desktop shell idea hosting live artifacts and a "personal project workbench" with portfolio visibility | idea |
| Live Artifact pair | `ki-repo-kb-live-artifacts` skill; kit-legal and kit-hnr `Admin/Operations/Live Artifacts/` | Markdown source + HTML view (Cowork) for dashboards; the delivery vehicle of both Command Centre and HNR Council | settled |

No relevant material found in `hnr-agentic-harness`; `ki-specifications` mentions only a "planner and orchestration" heading in its README.

## 2. Overlaps and conflicts

**Same word, different thing**

- **Council.** Arcadia: the governing body that ratifies canonical change (a decision-making body). kit-hnr: a read-only attention surface (a view). The harness Convenor follows Arcadia ("calls the council together, holds no vote"), so kit-hnr's usage is the outlier. Calling Kris's master thread "council management" would fit the Arcadia sense (Kris decides, the master thread convenes) but not the HNR one.
- **Project.** KI registry Project = finite outcome under an Initiative. Paperclip project = one per repository. `repo_type = "project"` = a repository shape. kit-principal "Project Portfolio" = a product or side project (closer to a repository or an Initiative). Four meanings.
- **State of play.** Master thread name in the KI estate; durable "what happened" note per legal matter in kit-legal; informal meeting title in kit-hnr. kit-legal's meaning is the opposite half of the split its Command Centre draws (history versus next action).
- **Control plane.** Paperclip: the coordination system. kit-principal: the portfolio note. Arcadia AI Execution Fabric: explicitly disclaims being one.
- **Checkpoint.** `ki-checkpoint` `+/_CHECKPOINTS/` versus kit-legal `+/_RESUME/` resume checkpoints with `[P<n>]` names; same purpose, different location, front matter (`note_type: admin-resume-checkpoint` versus `type: ki-checkpoint`) and naming (`priority` versus `label: '<Initiative>: <project>'`). kit-hnr checkpoints use repository-scoped thread names, not `<initiative>.<project>`.

**Same thing, different words**

- **The attention view**: Observatory Beacon; HNR Council "Attention"; kit-legal "Headlines" and Ready queue; master thread's "Needs Kris" list and Summary; ER-HARNESS-007 "which bounded action should receive attention". Three independent attention taxonomies exist (HNR: Blocked, Waiting, Review, In progress, Ready now, Shape now, Stale; kit-legal: five headlines; Observatory: "unusual above complete").
- **The coordinating role**: master thread (KI delegation), Convenor (harness role and Paperclip agent), HNR Council Convenor (human), Paperclip Coordination project, Techne controller. All "route and put decisions to the principal, own no lane work".
- **The unit of tracked work**: roadmap record (with lifecycle and horizon), legal Command Centre Item (kind + status + `next_step` + `owner`), Paperclip task, Needs tag, background agent run. Legal Items carry kinds the roadmap model lacks (wait, chase, deadline, event, verification); a Needs tag is effectively an informal `decision` Item.
- **The registry of everything in flight**: Arcadia Project registry, kit-principal Project Portfolio, Known Lands, `ki registry`, Observatory Repositories instrument.
- **Projection, not register**: HNR Council, kit-legal Command Centre artifact ("derived navigation, no parallel register") and Observatory all state the same rule independently. This is the strongest shared principle.

**Model conflicts**

- kit-legal makes the Command Centre the **canonical owner** of mutable state; HNR Council and Observatory are **projections** over records owned elsewhere. The KI master thread is neither: its state is spread across checkpoints, a non-durable decisions log and `ki agent` status, with no single projection.
- Authority location: Observatory Bridge executes commands with receipts; Paperclip schedules agents; `ki agent` launches detached runs; the master thread only dispatches. Nothing yet says which surface may act and which may only show.

## 3. Lessons from the state-of-play run so far

1. **Separate command from work.** The master thread became coordination-only (Decision 17) and all delivery moved to Project threads and background agents. This matches the Convenor posture and kit-legal's "Items own control, Working Notes own material" split.
2. **Attention is the scarce resource.** A cap of three or four Project threads plus master (Decisions 19, 24), mnemonic Needs tags and short-tag replies, and the parked "restate open Needs" practice all exist to keep Kris's attention bounded. Any view must rank, not list.
3. **Non-durable logs drift from durable owners.** state-audit found decisions logs ahead of their checkpoints (chezmoi 24-33, techne 31-32), and `_state-of-play.md` carries `updated_at: 2026-10-09` while it records 2026-10-11 items. A view that reads checkpoints must surface staleness, as kit-legal's `last_verified` and HNR's Stale rule do.
4. **Marks need one form.** Master uses a dated `Mark:` bullet; agent-host and chezmoi used "Mark 1" and "Mark A". KI-HARNESS-GOV-169 is ready but unimplemented; MARK-* defaults await Kris.
5. **Rules transfer only from skills.** Linking (Decision 3), tangent parking (Decision 2) and thread rules moved from personal preferences into `ki-delegation`; agents improvised worktree locations where the skill was silent (state-audit FIX-1).
6. **Roadmap count pressure.** Kris wants records down (Decisions 23, 35); ideas belong in Project notes. The command-centre work should create almost no records.
7. **No single view exists.** Kris reads state through chat, checkpoints and `ki agent status`; the parked "state-of-play view" tangent in ways-of-working already points at Observatory and the kit-hnr and kit-legal surfaces.
8. **Checkouts and pushes are operational state.** Primary checkouts fall behind pushing agents (Decision 4); agents push directly to harness `main` (Decision 26). Observatory's Repositories instrument already sees this.

## 4. Proposed Project

- **Name:** `command-centre` (title "Command centre"). Prefer it over "council" because Arcadia's Council is the constitutional decision body; the master thread _convenes_ that decision-making rather than being it.
- **Initiative:** `knowledge-islands-model`.
- **Outcome:** one shared vocabulary and model for the command centre - who convenes, what counts as attention, what is a projection and what may act - adopted by the harness skills, Observatory and the kit-hnr and kit-legal surfaces, with one read-only state-of-play view over Projects, checkpoints, decisions logs, Needs and background agents.
- **Scope versus ways-of-working:** ways-of-working keeps the thread rules (`ki-delegation` Reporting, Project threads, Thread working rules, run-folder retention, worktree location, coordinator model). command-centre owns the vocabulary and the view, and takes over the parked "state-of-play view" tangent from the ways-of-working checkpoint. It consumes thread rules; it does not write them.
- **Scope versus KI-HARNESS-GOV-169:** marks stay in ways-of-working under KI-HARNESS-GOV-169. command-centre treats the mark as an input to its view ("since mark") and only asks that the view can read the settled mark form.
- **Out of scope:** changing kit-legal's or kit-hnr's canonical models (they remain repository-owned; alignment is offered as handoffs); Paperclip operations under the Techne Programme Hold; Bridge write capabilities.

**First three steps**

1. Run `ki-design-loop` with this report as the brief: settle the glossary (Command centre, Convenor, Council, Beacon/attention, Bridge/command, projection) and the attention taxonomy as one bounded decision for Kris (`CC-VOCAB`), recorded in Arcadia as a Decision Record if accepted.
2. Write the crosswalk (Section 1 and 2 tables) into `Streams/Projects/command-centre/design/` and offer non-blocking handoffs: kit-hnr to rename or reframe "HNR Council" against the Arcadia Council meaning (feeds HNR-KB-KM-005), kit-legal to consider moving `+/_RESUME/` onto `ki-checkpoint` (feeds its OPS-013 skills programme), kit-principal to point Project Portfolio at the Arcadia registry instead of restating it.
3. Pilot the read-only view in the cheapest place: an Observatory Instrument (or Beacon extension) that reads the Project registry, `+/_CHECKPOINTS/`, `ki agent status` and decisions logs, ranking Needs, stale checkpoints and finished-but-unread agents. Judge it in use for a week before any record.

**Roadmap records:** none proposed now. If the pilot in step 3 is chosen, one Observatory record (area `BCN` or `APP`) at that point.

**Draft Project note** (`/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/command-centre.md`, not written):

```markdown
---
note_type: streams/project
slug: command-centre
title: Command centre
outcome: One shared vocabulary and model for Kris's command centre, adopted across the harness, Observatory, kit-hnr and kit-legal, with one read-only state-of-play view.
initiative: knowledge-islands-model
lifecycle: planned
lead: Kris Brown
target: null
updated: 2026-10-11T00:00:00Z
author: Written with Claude
---

# Command centre

## Outcome

Align the differently flavoured coordination concepts across the estate - the master and Project threads, Initiatives and Projects, checkpoints, decisions logs, marks, Needs and background agents in Knowledge Islands; the Command Centre in kit-legal; the HNR Council in kit-hnr; the Observatory Beacon and Bridge; the Convenor role and Paperclip Coordination project; and the kit-principal Project Portfolio - into one vocabulary and one model. The test: the glossary names each concept once, every surface states whether it is a projection or an owner, and Kris can see state of play across Projects and Initiatives at a glance in one read-only view.

This Project sits in [[knowledge-islands-model|Knowledge Islands model]].

---

## Notes

- Thread rules and marks stay with [[ways-of-working]]; this Project consumes them and owns the vocabulary and the view.
- "Council" already means the constitutional decision body in [[Council]]. The command centre convenes decisions for that body rather than being it; the Convenor role ("calls the council together and holds no vote") is the matching coordination role.
- Shared principle found in three places: a command surface is a projection over canonical records, never a second register.
- Three attention taxonomies exist (HNR Council Attention, kit-legal headlines, Observatory Beacon); settle one before building a view.
- kit-legal Item kinds (wait, chase, deadline, event, verification) cover states the roadmap model lacks; Needs tags behave like decision Items. Idea, not yet a record.
- kit-legal `+/_RESUME/` resume checkpoints are a precursor of `ki-checkpoint`; offer migration as a handoff.
- Idea: an Observatory Instrument over the Project registry, checkpoints, decisions logs and `ki agent` runs, ranking Needs, staleness and unread agent reports.
- The crosswalk lives in the state-of-play `command-centre` report until this Project's design folder exists.
```

## Done

- Surveyed 12 repositories; 21 concepts inventoried with paths and maturity.
- Mapped five word clashes (Council, Project, State of play, Control plane, Checkpoint) and four same-thing clusters.
- Drew eight lessons from the state-of-play decisions log and checkpoints.
- Proposed `command-centre` Project under knowledge-islands-model with scope, three steps and a draft note; no new roadmap records.

## Failed

- None. `PDR-KI-OBS-001` and the Paperclip standard were read only in outline.

## Needs Kris

- `CC-CREATE`: create the `command-centre` Project note from the draft above (Arcadia, `lifecycle: planned`), and add it to the master queue? Recommend yes, queued behind ways-of-working.
- `CC-NAME`: "Command centre" as the name, keeping "Council" for the Arcadia governance body? Recommend yes.
- `CC-VIEW`: move the parked "state-of-play view" tangent from the ways-of-working checkpoint to this Project? Recommend yes.
- `CC-HNR`: raise with kit-hnr that "HNR Council" clashes with Arcadia's Council? Recommend yes, as a non-blocking handoff once CC-NAME settles.
