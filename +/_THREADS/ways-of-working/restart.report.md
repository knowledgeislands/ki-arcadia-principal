# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › restart

**Run report at 14:55 BST · last mark 14:45 BST**

---

## Done

- Read the 17 October Messages block of the [ways-of-working checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md), the [state-of-play consolidation](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/consolidate.report.md), [state homes](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/state-homes.report.md), [thread ids](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/thread-ids.report.md) and the current text of ki-pmo, ki-delegation, ki-checkpoint and ki-diagrams at harness `655350a8`.
- Framed one restart decision, RESTART-AGREE, below: a state model, a messaging rule and a restart-prompt rule, with the exact standard wording.
- Set out what is critical before other threads start, triaged the seven older Messages lines and regrouped every open tag of this thread into eight queries.
- Changed no standard, skill, hook, record, checkpoint or Messages block.

### Why the diagrams here are text

DIAGRAMS-RENDER blamed Mermaid, but no Mermaid is involved: `ki-diagrams` excludes Mermaid and Graphviz. The black squares come from Archify's dual-theme SVG export in [export-svg.ts](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-diagrams/scripts/export-svg.ts). It is dark by default and paints through CSS custom properties, `color-mix()` and `:is()`. Previewers that skip that CSS, including Zed and `rsvg-convert`, fall back to black fill. The state-of-play [diagram fix](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/diagram-fix.report.md) flattened its four SVGs to plain light colours by hand. The thread folder's closed list also forbids SVG files there. The three diagrams below are therefore box-drawing text in fenced blocks: they take the previewer's own text colour, so they read in light and dark alike. DIAGRAMS-EXPORT asks for the lasting fix.

### 1. The restart decision

#### 1.1 Thread and state model

This folds in STATE-AGREE, THREAD-DURABILITY, THREADS-CHECKINS and CHURN-REMEDIES remedies 1, 2 and 4. Kris's test, "if the state folder is lost, you shouldn't lose any knowledge", decides each home.

```text
┌─ DURABLE · in Git · travels between hosts ─────────────────────────────────┐
│ +/_CHECKPOINTS/<thread>.md                                                 │
│    pick-up block · Messages block · open queries · next steps              │
│    and, at a hold, every queued or stopped agent's brief                   │
│ +/_THREADS/<run>/decisions.md                                              │
│    the Project's one decisions list (Project folder after SHAPE-AGREE)     │
│ +/_THREADS/<run>/<name>.report.md                                          │
│    only while it carries an open query or has no other home                │
│ records, standards, Decision Records, diagrams                             │
│    in the repository that owns them                                        │
└────────────────────────────────────────────────────────────────────────────┘
         ▲  copied in only when a report has an open query
         │  committed at each resting point, mark and hold
┌─ MACHINE-LOCAL · XDG state and config · never travels ─────────────────────┐
│ ~/.local/state/ki/agents/<run>/                                            │
│    briefs, prompts, launch records, pid, status, log, queue,               │
│    events, inbox, thread.json, and reports with nothing open               │
│ ~/.local/state/ki/threads/<repository>/<slug>.json                         │
│    native session bindings                                                 │
│ ~/.config/ki/ configuration · ~/.local/state/ki/registry.toml              │
└────────────────────────────────────────────────────────────────────────────┘
         │  swept at every hold; nothing here is the only copy
         ▼  of a decision, an open query or a work product
┌─ THROWAWAY · deleted once superfluous · never knowledge ───────────────────┐
│ <checkout>/tmp/<run>/<name>/   agent scratch, ignored by Git               │
│ ~/.cache/ki/                   regenerable indexes only                    │
│ vendor transcripts             outside the model, never a home             │
└────────────────────────────────────────────────────────────────────────────┘
```

- **Durable in Git.** The checkpoint holds the pick-up block, the Messages block, open queries, next steps and, at a hold, every queued or stopped brief. `decisions.md` stays in `+/_THREADS/<run>/` until SHAPE-AGREE's migration moves it into the Project folder; DECISIONS-HOME rides with that migration. A report stays in the thread folder only while it carries an open query or its outcome has no other durable home.
- **Machine-local.** Everything `ki agent` writes, including settled run reports (remedy 1). Lost with the host, and nothing is lost with it.
- **Throwaway.** `tmp/<run>/<name>/`, `~/.cache/ki/` and vendor transcripts.
- **Commit cadence (remedy 2).** A decision is still written in the turn it arrives. The checkpoint, the log and kept reports are committed together at each resting point, mark, hold and close, not at every owner report. Only the Messages block is committed at once, because another thread waits on it.
- **Leftover sweep (remedy 4).** Every hold sweeps unpushed commits, stale branches, stray untracked files, spent runtime files and `tmp/` coverage. Pruning is tools-ki work, already inside [KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md).
- **Run-packet table.** It gains the files the launcher already writes: `<name>.md`, `.draft.md`, `thread.json`, `thread.status`, `inbox.md`, `events.jsonl`, `events.state.json` and `_archive/`.
- THREAD-DURABILITY and THREADS-CHECKINS close by name. Remedies 3 and 5 landed through [KI-HARNESS-GOV-200](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-200-thread-folder-closed-list.md) and KI-TOOL-KI-CLI-137.

#### 1.2 Messaging between threads

This folds in THREAD-MESSAGING, INTERIM-MESSAGING and ROUTING. It turns the interim rule into the standard and removes the "only through the state-of-play thread" bottleneck while keeping state of play as the routing point for Kris's dumps.

```text
  Kris ── dump or decision ──▶ KI > SoP, the routing point
                                   │
                                   │ one line into the receiver's
                                   │ Messages block; that path alone
                                   │ committed and pushed at once
                                   ▼
  Thread A ─── line ──────▶ ┌─────────────────────────────────────┐
  (any coordinating         │ Thread B's checkpoint               │
   thread, same Capital)    │   **Messages**                      │
        ▲                   │   - date · TAG · sender: words      │
        │                   └─────────────────────────────────────┘
        │                                   │
        │                                   │ B pulls fast-forward, then reads
        │                                   │ at bootstrap, resume, every
        │                                   │ Summary and recap, and before
        │                                   │ launching work
        │                                   ▼
        │                   B acts: decisions log, brief, work or query
        │                   B removes the line at its next update
        └── reply line ──── only when the line asks for an answer

  Other Capital: SoP writes to that Capital's SoP, never past it.
  Other host:    lines travel through Git; the pull brings them.
```

#### 1.3 Restart prompts

This folds in RESTART-PROMPTS. A restart prompt is the pick-up block's resume line, exactly as written; no thread gets a bespoke prompt. Anything a thread must do first goes into its Messages block as a `FIRST-STEP` line, which the resume line's bootstrap reads. A thread that gates the others writes `READY` into the state-of-play block, and the state-of-play thread hands Kris the resume lines in its order.

```text
┌─ RESTART SEQUENCE ─────────────────────────────────────────────────────────┐
│ 1 · Kris              answers RESTART-AGREE                                │
│ 2 · ways of working   one harness run writes ki-pmo, ki-delegation and     │
│                       ki-checkpoint, regenerates the hook line and output  │
│                       style, passes the audits and pushes                  │
│ 3 · ways of working   re-bootstraps on the new text, applies it to its own │
│                       checkpoint, writes READY into KI > SoP's Messages    │
│                       block and tells Kris                                 │
│ 4 · KI > SoP          reads READY and puts a FIRST-STEP line in each       │
│                       thread's block, then hands Kris each resume line     │
│                       from that thread's own pick-up block, in order       │
└────────────────────────────────────────────────────────────────────────────┘
         │
         ▼  in KI > SoP's order:
   tools burndown ─┬─▶ Rig: mac-studio-setup ─┬─▶ knowledge acquisition
                   └─▶ Rig: chezmoi ──────────┘            │
                                                           ▼
                                     Host network ─▶ command centre
         │
         ▼  each thread, on its pasted resume line:
┌─ ONE THREAD RESTARTING ────────────────────────────────────────────────────┐
│ re-bootstrap ─▶ read Messages block (FIRST-STEP first) ─▶ mark             │
│ ─▶ Summary with carried-forward queries ─▶ restart authorised work         │
│ ─▶ banner, which rewrites the pick-up block                                │
└────────────────────────────────────────────────────────────────────────────┘
```

#### 1.4 Standard wording

All edits are in [ki-agentic-harness](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness), quoted from harness `655350a8`. Removed lines are marked `-` and added lines `+`; unchanged sentences are elided as `...`. The hook line and the `ki-coordinator` output style follow from `ki dev skill generate ki-pmo --write`.

**ki-pmo, [standards-pmo.md](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/references/standards-pmo.md) lines 761 to 768 - the messages block**

```diff
-### Directions from the state-of-play thread
+### Messages between threads
 
-The state-of-play thread propagates common instructions. Rules go to their durable owner, a skill or a Decision Record. Thread-level directions go into each affected thread's checkpoint as a **messages block**, ...
+The state-of-play thread propagates common instructions and any coordinating thread may message another. Rules go to their durable owner, a skill or a Decision Record. Thread-level messages go into the receiving thread's checkpoint as a **messages block**, ...
 
-- **Shape:** the bold line `**Messages from Master: state-of-play** - the receiving thread acts on each line, then removes it.`, then one item per message, `- <YYYY-MM-DD> · <TAG> · <the owner's words or the instruction, with links>`, newest first. A message citing an owner decision quotes its words.
+- **Shape:** the bold line `**Messages** - the receiving thread acts on each line, then removes it.`, then one item per message, `- <YYYY-MM-DD> · <TAG> · <sender label>: <the owner's words or the instruction, with links>`, newest first, about 60 words at most with the detail linked. A message citing an owner decision quotes its words. The earlier bold line `**Messages from Master: state-of-play**` is read as this block until the checkpoint's next update.
-- **Sender:** the state-of-play thread, which may write directly into its territory's coordination threads' checkpoints and Project notes to dispatch work, as [Thread types](#thread-types) records. A coordination thread sends to another only through the state-of-play thread.
+- **Sender:** any coordinating thread in the same Capital. It adds its line and edits nothing else in the receiver's checkpoint, commits that path alone and pushes at once. The state-of-play thread routes the owner's dumps and anything with no owning thread, may also write into its territory's Project notes to dispatch work, as [Thread types](#thread-types) records, and alone writes to another Capital, through that Capital's state-of-play thread. A reply, where a line asks for one, is a line in the sender's block.
-- **Receiver:** the thread reads the block at every resume, re-bootstrap and recap and before launching work, acts on each line, ...
+- **Receiver:** the thread pulls fast-forward, then re-reads its checkpoint and the block at bootstrap, every resume and re-bootstrap, every Summary and recap, and before launching work, acts on each line, `FIRST-STEP` first, ...
```

**ki-pmo lines 752 to 759 - Bootstrap**, a new step between 3 and 4 so the report stays last:

```diff
 3. resolves the Project name to the single `+/_CHECKPOINTS/*.<project>.md` checkpoint, ...
+4. reads the checkpoint's [messages block](#messages-between-threads) and acts on each line, `FIRST-STEP` first, before launching any work;
-4. reports under the [report heading](#banner), ...
+5. reports under the [report heading](#banner), ...
```

**ki-pmo line 888 onwards - Picking up a thread**, one paragraph added:

```diff
+A restart prompt is the pick-up block's resume line, verbatim; no thread is given a bespoke prompt. Whatever a thread must do first on restart is a `FIRST-STEP` line in its messages block. A thread that others wait on writes `READY` into the state-of-play thread's block, and that thread then gives the owner each waiting thread's resume line in its own pick-up order.
```

**ki-pmo line 844 - Committing the thread folder**

```diff
-... So a coordinating thread commits and pushes its thread folder at every owner report and at every resting point, by explicit path and never with another session's uncommitted changes, ...
+... So a coordinating thread commits and pushes its checkpoint and thread folder at every resting point, mark and hold and before it closes, not at every owner report, by explicit path and never with another session's uncommitted changes; a line it writes into another thread's messages block is committed and pushed at once. ...
```

**ki-pmo line 881 - Draining a thread, Parking**

```diff
-... The copy from the run's state folder takes only what resuming needs, and a retired report that comes back with it is removed again by explicit path under [Tidying the thread folder](#tidying-the-thread-folder).
+... The copy from the run's state folder takes only what resuming needs: open queries, and every queued or stopped agent's brief, into the checkpoint. Then the thread sweeps for leftovers - unpushed commits, stale branches, stray untracked files, spent runtime files and `tmp/` coverage - and fixes each or names it under the hold report's `## Left over`.
```

**ki-delegation, [standards-background-runs.md](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md) line 61 - Run packet**

```diff
-Knowledge files live in the owning repository's tracked `+/_THREADS/<run>/` folder, committed as the thread goes. The list is closed: ...
+A run report is written to the run's state folder. The thread copies it into the owning repository's tracked `+/_THREADS/<run>/` folder only while it carries an open query or its outcome has no other durable home. The list is closed: ...
```

The table at lines 63 to 66 gains the runtime files the launcher already writes: `<name>.md`, `<name>.draft.md` and `.queued.md` (brief and drafts); `thread.json`, `thread.status` and `inbox.md` (thread runtime); `events.jsonl`, `events.state.json` and `_archive/` (event log and retention), all in the state folder.

**ki-delegation line 119 - Decisions log**

```diff
-... The thread commits and pushes the log and each report there at every owner report and resting point, at each mark, when a report lands and before the thread closes, as Kris set on 2026-10-14, ...
+... The thread writes each decision in the turn it arrives, and commits and pushes the log, with any report it keeps, at every resting point, mark and hold and before the thread closes, as Kris set on 2026-10-14, ...
```

**ki-checkpoint, [standards-checkpoints.md](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-checkpoint/references/standards-checkpoints.md) line 127 - Update lifecycle**, one sentence added:

```diff
 An update replaces the active snapshot in place, preserves `created_at`, and advances `updated_at`. ...
+Another coordinating thread may add one line to a coordination checkpoint's messages block under `ki-pmo` and commit that path alone; that is not an update and does not advance `updated_at`. The owning thread's next update removes each line it has acted on.
```

#### 1.5 Fit with THREAD-IDS and SHAPE-AGREE

- [Decision 179](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/decisions.md) and ki-pmo's Thread naming section give each thread an id, a slug and a title. A Messages line is addressed by checkpoint path, which becomes the slug at migration, and signed with the sender's label, which becomes the title. Nothing in this decision needs the new names first.
- SHAPE-AGREE moves Project notes and the decisions log, not checkpoints, so the Messages block does not move. Its migration carries DECISIONS-HOME, IDS-MIGRATE and NAMING-REST in one pass so nothing is renamed twice.
- The restart therefore depends on neither SHAPE-AGREE nor IDS-MIGRATE.

#### 1.6 Records

No new harness record. The standard edit is owner-directed and bounded, on the pmo-simplify and HARNESS-RECORD precedent. The tools-ki tooling (report path default, de-duplicated briefs, `_archive/` retention, sweep pruning) folds into KI-TOOL-KI-CLI-137 through tools burndown. This replaces STATE-RECORDS' four records with one amendment, [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md), dispatched after the restart.

### 2. Critical before other threads start

Must land, in order:

1. Kris answers RESTART-AGREE.
2. One ki-agentic-harness run writes §1.4, regenerates the hook line and the `ki-coordinator` output style with the installed `ki dev skill generate ki-pmo --write` (stopping if it needs the tools-ki checkout, which another session holds), passes the tests and audits and pushes.
3. This host pulls the harness. The output style is a symlink, so no chezmoi apply is needed.
4. This thread re-bootstraps on the new text, converts its own checkpoint, writes `READY` into the [state-of-play checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/_state-of-play.md)'s block and tells Kris.
5. The state-of-play thread writes each thread's `FIRST-STEP` line and gives Kris the resume lines in order.

Travels with the restart but does not block it: RUN-HYGIENE's checkpoint fixes and `role`, written as `FIRST-STEP` lines.

Can follow, in any order: SHAPE-AGREE and its migration, TOOLS-PUSH (tools burndown's own first step), CHEZMOI-APPLY, HARNESS-ACCEPT, DIAGRAMS-EXPORT, IDEAS-ROOTING, the KI-HARNESS-GOV-189 amendment and the ki-principal estate sweep.

Only RESTART-AGREE is on the critical path.

### 3. Triage of the older Messages lines

| Line | Disposition |
| --- | --- |
| ROUTING | Folded into RESTART-AGREE (§1.2): any thread messages any other; state of play routes Kris's dumps and coordinates coordination. |
| GIT-SURFACE | An `Idea:` bullet in the [ways-of-working Project note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md), on IDEAS-ROOTING's answer; its home in Engineering Practice comes later through Enactment. Touches [KI-HARNESS-GOV-203](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-203-git-clean-down-criteria.md) and [KI-TOOL-KI-CLI-140](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-140-git-hygiene-estate-audit.md). |
| DIAGRAMS, DIAGRAMS-RENDER | Query DIAGRAMS-EXPORT. Meanwhile this thread's designs use text diagrams. |
| KI-AGENTS-NAME | Done: logged as Decision 181. Remove the line. |
| AWAITING-REVIEW | Query HARNESS-ACCEPT. |
| AREAS-DISPATCH | Keep. It waits on OBS-MERGE and NEW-AREAS. |
| SYNC-GUARD | Folded. Dispatch after the restart: ki-agentic-harness, "amend KI-HARNESS-GOV-189: drop host naming and step 3, add level-before-resume (mgit fetch, then mcp-git-audit ahead and behind) at session start, every mark and before leaving a host, with `[behind]` and `[unpushed]` footer items". |

## In Progress

Nothing is running.

### Outstanding - no action requested now

- tools-ki holds five of this thread's commits unpushed above 26 commits from other sessions, on a detached HEAD in another session (TOOLS-PUSH).
- chezmoi holds three of this thread's commits unpushed and unapplied (CHEZMOI-APPLY).
- The [state-of-play checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/_state-of-play.md) still uses a `## Pick-up` heading and the label `Master: state-of-play` (RUN-HYGIENE).

## Queries

### RESTART-AGREE - one standard for state, messaging and restart

**Context:** §1 proposes one standard edit across ki-pmo, ki-delegation and ki-checkpoint. It covers where each kind of file lives, how threads message each other and what a restart prompt is. It replaces STATE-AGREE, STATE-RECORDS, DECISIONS-HOME (deferred into SHAPE-AGREE), THREAD-DURABILITY, THREADS-CHECKINS, CHURN-REMEDIES, THREAD-MESSAGING, INTERIM-MESSAGING, RESTART-PROMPTS and ROUTING. Nothing else blocks the other threads' restart.

**Query:** Do you agree §1 as the standard, so one harness run can write it and the restart can begin?

**Options:**

a) (recommended) Agree §1 as written: one ki-agentic-harness run writes §1.4, regenerates the surfaces and pushes; this thread then writes READY.

b) Write the messaging and restart-prompt parts (§1.2, §1.3) now and leave the state model (§1.1) until after the restart.

c) As a), but keep every run report committed in the thread folder (drop remedy 1).

### RUN-HYGIENE - checkpoint fixes and the push rule

**Context:** Absorbs IDENTITY-NEXT's `role` ask, CHECKPOINT-FINDINGS, PUSH-RULE and REPORT-FILE-FORM, as the [summary draft](/Users/krisbrown/.local/state/ki/agents/ways-of-working/summary-draft.md) sets out. The checkpoint fixes travel as FIRST-STEP lines with the restart. PUSH-RULE settles the clash between the generic brief footer, which forbids any push, and briefs that allow one.

**Query:** May the checkpoint fixes go out as FIRST-STEP lines and the brief footer defer to a brief's own push rule?

**Options:**

a) (recommended) Yes: each thread fixes its checkpoint form and adds `role` on its FIRST-STEP line, and the generic footer gives way to an explicit push rule in the brief.

b) Fix the checkpoints only; keep the footer's no-push rule absolute and push from the thread.

### TOOLS-PUSH - this thread's five tools-ki commits

**Context:** tools-ki holds this thread's commits `33770a8d`, `80246ca6`, `30513f9c`, `4ef7b9c0` and `90807355` unpushed, above 26 commits from other sessions, on a detached HEAD another session holds. `90807355` carries KI-TOOL-KI-CLI-145 (IDENTITY-NEXT Phase 2). Absorbs the tools-ki state tooling, which joins KI-TOOL-KI-CLI-137.

**Query:** Should tools burndown take these commits as its first step?

**Options:**

a) (recommended) Hand them to tools burndown: it reconciles the stack, cuts v0.10.6 and bumps ki-principal's `.github/ki-version`.

b) Leave them unpushed until you review the 26 other commits yourself.

### HARNESS-ACCEPT - four harness records awaiting your review

**Context:** New; replaces IDENTITY-NEXT's acceptance half and this thread's share of AWAITING-REVIEW. [KI-HARNESS-GOV-195](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-195-granola-screenshots-markers.md), [KI-HARNESS-GOV-198](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-198-reply-forms.md), [KI-HARNESS-GOV-203](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-203-git-clean-down-criteria.md) and [KI-HARNESS-OPS-005](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md) are delivered and wait on acceptance. KI-HARNESS-GOV-203 has a 30-day stale threshold you never set. The IDENTITY-NEXT Phase 1 text lands with Phase 3.

**Query:** May this thread present all four in one ki-accept sitting after the restart?

**Options:**

a) (recommended) Yes: one ki-accept sitting after the restart, with the 30-day threshold put to you there.

b) Accept them one at a time as each thread reaches them.

### CHEZMOI-APPLY - three chezmoi commits unapplied

**Context:** chezmoi holds commits `673b999`, `d81a80c` and `d1a6e6d` unpushed and unapplied; they change `~/.claude/communication.md`, `~/.claude/delegation.md` and `~/.codex/AGENTS.md`. The Rig chezmoi thread has `+/_THREADS/chezmoi/` in flight.

**Query:** Should the Rig chezmoi thread review the diff, apply and push these with its own work?

**Options:**

a) (recommended) Yes: Rig chezmoi reviews `chezmoi diff`, applies and pushes them on its restart.

b) You review and apply them yourself.

### SHAPE-AGREE - nested Project folders and one naming migration

**Context:** As drafted in the [summary draft](/Users/krisbrown/.local/state/ki/agents/ways-of-working/summary-draft.md) and [thread ids](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/thread-ids.report.md): Projects nest as `Streams/Initiatives/<initiative>/<project>/<project>.md` with SHORT-NAMES (`model`, `foundations`), DESIGN-TIDY and six records. Absorbs DECISIONS-HOME, THREAD-IDS-AGREE, IDS-MIGRATE and NAMING-REST (withdraw NAME-ROOT, PILOT-LABEL `Personal > Acquire intake (sol)`, FOOTER-PROJECTS option a). Not on the restart path.

**Query:** Do you agree the shape and naming as one migration after the restart, harness checker first?

**Options:**

a) (recommended) Agree it as one migration after the restart: harness checker first, then folders, decisions logs and thread ids together.

b) Agree the shape now but migrate ids separately later.

### DIAGRAMS-EXPORT - diagrams that read in every previewer

**Context:** New; replaces DIAGRAMS and DIAGRAMS-RENDER. The cause is the Archify export's CSS, not Mermaid (see Done). Hand-flattening each SVG does not last.

**Query:** Should the harness add a static light export and a rule for diagrams in designs?

**Options:**

a) (recommended) Add a ki-agentic-harness triage record: a static, flattened light option in `export-svg.ts`, and a rule in ki-pmo-design and ki-diagrams that design reports use text diagrams inline or exported static SVGs beside a Project note.

b) Keep the dual-theme SVG and accept flattening by hand when a previewer fails.

### IDEAS-ROOTING - where ideas start

**Context:** As drafted in the [summary draft](/Users/krisbrown/.local/state/ki/agents/ways-of-working/summary-draft.md): Rig stays a KI Initiative and a concept starts as an `Idea:` bullet in its owning Project or Initiative note. Absorbs GIT-SURFACE's capture.

**Query:** Do ideas start as `Idea:` bullets in the owning note, GIT-SURFACE first?

**Options:**

a) (recommended) Yes: a ki-principal run adds GIT-SURFACE as an `Idea:` bullet in the ways-of-working Project note, and later ideas follow the same rule.

b) Keep ideas in a separate scratch note until each is given a record.

```text
RESTART-AGREE

Agree the restart design §1 as written: one ki-agentic-harness run writes the §1.4 wording into ki-pmo, ki-delegation and ki-checkpoint, regenerates the surfaces with ki dev skill generate ki-pmo --write and pushes; ways of working then converts its checkpoint, writes READY into the state-of-play Messages block and tells me.

---

RUN-HYGIENE

Yes: each thread fixes its checkpoint form and adds role on its FIRST-STEP line at restart, and the generic brief footer gives way to an explicit push rule in the brief.

---

TOOLS-PUSH

Hand the five tools-ki commits (33770a8d, 80246ca6, 30513f9c, 4ef7b9c0, 90807355) to tools burndown: it reconciles the stack, cuts v0.10.6 and bumps ki-principal's .github/ki-version; the tools-ki state tooling joins KI-TOOL-KI-CLI-137.

---

HARNESS-ACCEPT

Present KI-HARNESS-GOV-195, KI-HARNESS-GOV-198, KI-HARNESS-GOV-203 and KI-HARNESS-OPS-005 to me in one ki-accept sitting after the restart, with the KI-HARNESS-GOV-203 30-day stale threshold put to me there.

---

CHEZMOI-APPLY

Rig chezmoi reviews chezmoi diff for 673b999, d81a80c and d1a6e6d, applies and pushes them on its restart.

---

SHAPE-AGREE

Agree the nested Project shape, SHORT-NAMES, DESIGN-TIDY, DECISIONS-HOME, THREAD-IDS-AGREE, IDS-MIGRATE and NAMING-REST as one migration after the restart: harness checker first, then folders, decisions logs and thread ids together.

---

DIAGRAMS-EXPORT

Add a ki-agentic-harness triage record for a static flattened light export option in export-svg.ts and a ki-pmo-design and ki-diagrams rule that design reports use inline text diagrams or exported static SVGs beside a Project note.

---

IDEAS-ROOTING

Ideas start as Idea: bullets in the owning Project or Initiative note; a ki-principal run adds GIT-SURFACE to the ways-of-working Project note first.
```

```text
╭─ run report · 2026-10-17T13:55:40Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] RESTART-AGREE
- [waiting] RUN-HYGIENE
- [waiting] TOOLS-PUSH
- [waiting] HARNESS-ACCEPT
- [waiting] CHEZMOI-APPLY
- [waiting] SHAPE-AGREE
- [waiting] DIAGRAMS-EXPORT
- [waiting] IDEAS-ROOTING
- [committed] this report, pushed
