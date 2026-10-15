# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › reporting-forms

**Run report at 00:55 BST · last mark 16:09 BST**

---

## Done

Drafting only, under Kris's REPORTING-FORMS instruction of 16 October ([decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/decisions.md), Decision 174). No source file was changed: no chezmoi source, `~/.claude`, `~/.codex`, skill, standard, hook, generator, checkpoint, `Admin`, `Pillars` or `Resources`. This report is the only file written.

### Sources read, and where replies are shaped today

| Source | Lines | What it prescribes today |
| --- | --- | --- |
| chezmoi `dot_claude/private_communication.md` | 8-9, 12 | "End a unit of work with the owner report ... with a copyable reply block", for every session; points at `ki-delegation`, which only links to `ki-pmo` |
| chezmoi `dot_codex/private_AGENTS.md.tmpl` | 20-21 | The same two bullets for every Codex session |
| chezmoi `dot_claude/private_delegation.md.tmpl` | 6, 8, 12-13 | "delegate substantive work to detached background agents by default" and "the final owner report", for every session, conversational included |
| chezmoi `dot_claude/private_CLAUDE.md.tmpl` | none | Imports the three files above; nothing of its own on reply forms |
| chezmoi `dot_claude/output-styles/symlink_ki-coordinator.md.tmpl` | 4 | A symlink to `ki-agentic-harness/output-styles/ki-coordinator.md`; the text lives in the harness |
| chezmoi `.chezmoidata/coordinator-hook.yaml` | 15-21 | Registers the hook command; its comment confirms the Codex trusted hash covers the handler entry, not the script, so a script change needs no hash refresh |
| `ki-pmo` [SKILL.md](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/SKILL.md) | 12-13, 21 | "or to give a summary, recap, full summary" (leak 2); "the one source of the owner report ... which every agent report and thread report takes" |
| `ki-pmo` [standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/references/standards-pmo.md) | 80-96, 300-320, 345-460, 466-575, 577-592, 774, 817-834 | Thread types (conversational banner "ends DONE through `ki-recap`, or reaches a hold"); re-anchoring; the owner report ("Every report written for the owner takes one shape"; "A report with no queries keeps `No reply needed.`", line 431); the generated-surface sources `hook-line`, `hook-pointer`, `run-report`, `footer-report`, `output-style` (line 532 repeats `No reply needed.`); report forms; draining; the pick-up table with conversational HOLD and DONE rows |
| `ki-delegation` [background-run standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md) | 155-167 | Reporting: cadence for coordinating threads; "Every report written for the owner ... is an owner report"; defers the shape to `ki-pmo` under REPORT-SOURCE |
| `ki-delegation` [SKILL.md](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/SKILL.md) | 19, 76 | "Every agent report is an owner report"; coordinator forms are `ki-pmo`'s |
| `ki-checkpoint` [standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-checkpoint/references/standards-checkpoints.md) | 46, 94-96 | Conversational label form; parking and mark lines scoped to coordinating threads |
| [coordinator-reminder.sh](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/hooks/coordinator-reminder.sh) | 17-18, 79-87 | The generated `line` and `pointer`, fired on every owner message in any session of a `[skills.ki-pmo]` checkout, conversational or not |
| [ki-coordinator.md](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/output-styles/ki-coordinator.md) | whole file | Generated from the `output-style` source; "Every report to the owner is an owner report"; no scope sentence |
| Generator | `ki-pmo/scripts/generate/index.ts`, driven by `ki dev skill generate ki-pmo` in tools-ki (`src/commands/dev/skill/index.ts`) | Renders the hook `line` and `pointer`, the whole output style, the run-prompt Report paragraph and the four footers from the standard's `<!-- ki-pmo:source ... -->` blocks; `scripts/banner.test.ts` fails on a hand edit. The generator itself needs no change: every edit below is to the standard's source blocks |
| `ki-recap` [standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-recap/references/standards-session-recap.md) | 135-157 | Its own completion frame, closing an ordinary session recap only |
| tools-ki `src/core/agent/runs.ts` | 181 | The progress protocol tells every background agent to write an owner report; unchanged |
| ki-principal [AGENTS.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/AGENTS.md) | 17 | "Commit only a completed, verified unit of work ... and report its checkpoint", where "checkpoint" collides with `ki-checkpoint` |

"No reply needed" is prescribed in exactly two places, both in the harness: the standard's reply-block bullet (line 431) and the `output-style` source (line 532, rendered into `ki-coordinator.md` line 26). Neither scopes it, so a coordinating style or a literal reading of the global rule puts it under a routine answer.

### Overlap with the session-identity plan

The [session-identity report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/session-identity.report.md) stays the plan; REPORTING-FORMS changes it as follows. ROLE-FIELD (how role is declared) is not re-decided: until it lands, "coordinating thread" means what the standard already says, a thread opened or resumed with a coordinating opener, and a thread with no stated type is conversational.

- **ROLE-REPORT - superseded.** Its option a) scopes the owner-report rule away from conversational threads and says they end a unit of work "with a plain answer". REPORTING-FORMS says a conversational thread gives the owner-report format when a unit of work ends, and plain replies otherwise. The chezmoi edits move from Phase 3 into Phase 1a below, with new wording. ROLE-REPORT should be withdrawn.
- **ROLE-STYLE - narrowed.** The scope sentences in the output style and the hook line land in Phase 1a as text, because REPORTING-FORMS asks that they stop pushing forms onto a conversational session now. ROLE-STYLE then decides only the mechanism: keep the repository's `outputStyle` selection or pass it per session, and the background-agent style.
- **Role-gated response table - narrowed.** The conversational "summary", "full summary", "status", "resume" and "mark" cells stand. The "recap" cell's "as plain text" narrows to "the `ki-recap` session recap in its own form", because `ki-recap` keeps its completion frame. The "hold" cell, which writes a conversational HOLD pick-up row, is superseded by CONV-CHECKPOINT. A new row is implied: when a unit of work ends, a conversational thread gives the completed-work report with no heading or banner.
- **Phase 1 plan text - superseded in part.** "The messages block is allowed on a conversational checkpoint as a plain line" is replaced by CONV-CHECKPOINT: a conversational checkpoint carries no messages block. Leak 5 is then closed by intake removing its block at its own next update.
- **Phase 3 plan text - narrowed.** Its ROLE-REPORT sentence is removed. When the hook's role gate lands, the hook-line scope sentence drafted here is removed, because the hook is then silent in conversational sessions; the output-style scope paragraph stays, because Claude cannot unload a style.
- **CONVERSATIONAL-RUN - narrowed.** In the [thread-model review](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/thread-model-review.report.md), its option a) gives a delegating conversational thread a run and a thread folder, which still fits, and the ki-pmo hold report and HOLD frame, which no longer fit, because banners are coordinator-only. CONVRUN-NARROW below re-poses it.

### 1. The three reply forms, defined once

**Owner.** The definitions belong in the `ki-pmo` standard, as a new `## Reply forms` section directly before `## Owner report`, rather than in the `ki-delegation` Reporting section the brief suggested. Three reasons. Kris's REPORT-SOURCE decision makes the `ki-pmo` standard the owner report's one source, and `ki-delegation` already only links to it. The `ki-pmo` standard already defines the three thread types the forms depend on. And the generator renders the hook line and output style only from that standard, so the scope sentences those surfaces need can cite a section in the same file. `ki-delegation` Reporting gets a one-sentence pointer, and the personal guidance points at `ki-pmo` instead of `ki-delegation`. FORMS-OWNER asks this.

Canonical text, to insert before `## Owner report` (line 345), with a Contents entry:

```markdown
## Reply forms

Every reply to the owner takes one of three forms, which Kris set apart on 2026-10-16, as relayed: "Please make the reporting rules explicitly distinguish ordinary conversational replies, completed-work reports, and coordinator summaries. A conversational thread can do bounded work directly without becoming a coordination thread. Routine answers and acknowledgements should stay plain, without empty reporting sections or a "No reply needed" block. When a completed-work report is required, use the owner-report format. Coordinator checkpoints, marks and banners apply only to coordinating threads."

| Form | When | Shape |
| --- | --- | --- |
| Conversational reply | The default in every thread, for anything that does not end a [unit of work](#units-of-work): answers, acknowledgements, clarifying questions, plans proposed for agreement and timed progress updates | Plain prose. No heading, section, Needs tag, reply block, `No reply needed.` or banner. A question for the owner is one line |
| Completed-work report | When a unit of work ends, in any thread, and as every background agent's final report | The [owner report](#owner-report): `## Done`, `## In Progress`, `## Queries` and the reply block. In a conversational thread it has no report heading, form line or footer banner, and opens at `## Done` |
| Coordinator summary | Only in a coordinating thread | The [report forms](#report-forms): Summary, recap, full summary, re-bootstrap and hold report, each an owner report under the report heading and form line, closing with the footer banner and, at rest, the resume line, with the pick-up block, mark and messages block that go with them |

In a coordinating thread the completed-work report is its Summary. In a conversational thread a request for a "summary", "full summary" or "status" gets a conversational reply, and a request for a "recap" gets the ordinary `ki-recap` session recap in its own form; neither borrows a coordinator form.

### Units of work

A unit of work ends, and a completed-work report is owed, when at least one of these holds for the work since the last such report:

1. **Changed:** a change to a repository, configuration or external system was committed, or was deliberately left uncommitted with the reason stated.
2. **Handed off:** work passed to another thread, repository, record or person, such as a captured record, a trade, an inbox message or a handoff item.
3. **Run finished:** a background run the thread launched has finished; for a background agent, its own run is ending.
4. **Deliverable:** a deliverable the owner asked for, such as a document, report, draft or analysis written to a file, has been produced.
5. **Stopped for the owner:** the work stopped before completion with something the owner must decide, supply or do, such as a failure, a block or a decision.

None of these ends a unit of work, and each gets a conversational reply: answering a question, however many reads it took; acknowledging an instruction or a decision; a clarifying question; an interim step or a timed update; a single read, lookup or check; a plan proposed in conversation for agreement.

A change the owner asked for and that was made in the same turn, in one file or one commit, with nothing failed, open or left to decide, is confirmed in one plain line naming what changed, and needs no report. Work that ends with nothing changed and nothing open is told in one plain line; work that ends with nothing changed but something open meets criterion 5. A background agent always reports, because its report is its run's only output. One report covers every unit that ended in the same turn.

### Conversational bounded work

A conversational thread does bounded work directly, without delegating, opening a run or becoming coordinating. The work is bounded when it serves the matter the owner raised in the thread, stays within the authority the owner gave there and each repository's own rules, and can finish with the owner in the thread. The thread may delegate when it chooses. It becomes coordinating only when the owner opens or re-bootstraps it with a coordinating [opener](#opening-a-thread), never on its own. When the work outgrows the bound, because it needs a Project's [one list](#one-list), more than one run at once, or would keep the owner waiting across sessions, the thread says so in one line and proposes the Project's coordination thread, or a new one through the state-of-play thread.

### Coordinator-only machinery

The report heading and form line, the footer banner, the resume line, the mark, the pick-up block, the messages block, re-anchoring after compaction, the turn budget and the heartbeat belong to coordinating threads only. A conversational thread's optional checkpoint is the plain `ki-checkpoint` record: it notes a pause in `Current state` and how to carry on in `Next step`, is resumed by `ki-checkpoint` RESUME when the owner asks, and is removed by REMOVE when the work ends.
```

The completed-work report in a conversational thread drops the heading and banner, as the brief's default proposed, because both are coordinator forms and the heading names an Initiative and Project a conversational thread may not have. A background agent's saved report keeps a `#` heading, because HEADING-LASTING requires one (see CONVRUN-NARROW).

### 2. Unit-of-work test

The five criteria and the exclusions are in the canonical text above. In short: report when something was changed, handed off, finished by a run, delivered on request, or stopped needing the owner; otherwise reply plainly. When nothing changed, no report is owed unless something is open; a background agent always reports. UNIT-TRIVIAL asks Kris to confirm the one-line exemption for a same-turn single-file change.

### 3. Conversational bounded work and CONVERSATIONAL-RUN

The bound is in the canonical text. It reconciles with CONVERSATIONAL-RUN like this. Doing bounded work directly needs no run. A conversational thread that does delegate takes a run and a thread folder as CONVERSATIONAL-RUN's option a) proposed, but it has no hold report, HOLD frame, REST or BUSY. It pauses through a checkpoint update, and its agents' saved reports are headed `# <thread label> › <run name>`, with `**Run report at <local time>**` and no mark or footer banner. Personal `delegation.md` today tells every Claude session to "delegate substantive work to detached background agents by default", which contradicts direct bounded work, so its edit below scopes that default to coordinating threads.

### 4. Coordinator-only machinery

Pick-up blocks, marks, banners, resume lines and the Messages from Master block apply only to coordinating threads. A conversational checkpoint still carries the closed `ki-checkpoint` front matter and six sections, with its label, its pause in `Current state` and its next step in `Next step`. It loses the conversational HOLD and DONE rows of the pick-up table and the conversational hold resume line. The state-of-play thread's write right already covers coordination threads' checkpoints only. Its REINSTATE line in intake's checkpoint would stop being a pattern, and intake removes its block at its next update. CONV-CHECKPOINT asks this.

### 5. Exact edits

All in British English with ASCII hyphens. `›`, `·` and the frame glyphs are existing format characters.

#### 5.1 ki-agentic-harness - `skills/change-management/ki-pmo/references/standards-pmo.md`

**Contents** (after the `- [Recovering a thread showing a red x](...)` entry, before `- [Owner report](#owner-report)`):

```diff
+- [Reply forms](#reply-forms)
+  - [Units of work](#units-of-work)
+  - [Conversational bounded work](#conversational-bounded-work)
+  - [Coordinator-only machinery](#coordinator-only-machinery)
```

**New section** before line 345: the canonical text in section 1 above.

**Thread types table, Banner row** (line 89):

```diff
-| Banner | None; ends DONE through `ki-recap`, or reaches a hold where it has a checkpoint | The report heading, ...
+| Banner | None: conversational replies and completed-work reports under [Reply forms](#reply-forms), with no report heading, footer banner, mark, pick-up block or resume line | The report heading, ...
```

(The coordination and state-of-play cells of the row are unchanged.)

**Re-anchoring after compaction** (lines 302 and 314):

```diff
-A compaction keeps a thread's session but replaces its transcript with a summary, so the thread re-anchors from durable state before it replies.
+A compaction keeps a coordinating thread's session but replaces its transcript with a summary, so the thread re-anchors from durable state before it replies; a conversational thread re-reads its checkpoint, if it has one, and carries on with a conversational reply.
```

**Owner report, first sentence** (line 347):

```diff
-Every report written for the owner takes one shape, the **owner report**: a background agent's final `<name>.report.md`, which the owner reads directly, and a coordinating thread's Summary, including the Summary at a resting point.
+Every completed-work report under [Reply forms](#reply-forms) takes one shape, the **owner report**: a background agent's final `<name>.report.md`, which the owner reads directly, a coordinating thread's Summary, including the Summary at a resting point, and the report a conversational thread gives when a unit of work ends.
```

**Owner report, Heading bullet** (line 410), appended after "...accepts the framed label, the one-line heading and this one.":

```diff
+  A conversational thread's completed-work report has no report heading, form line or footer banner: it opens at `## Done` and ends with its reply block. A background agent reporting to a conversational thread heads its saved file `# <thread label> › <run name>`, with the form line `**Run report at <local time>**`, and closes with no footer banner.
```

**Owner report, Reply block bullet** (line 431), replacing its `No reply needed.` sentence:

```diff
-A report with no queries keeps `No reply needed.` as the block's only line.
+A completed-work report with no queries keeps `No reply needed.` as the block's only line; a conversational reply carries neither the block nor that line.
```

**Report forms** (line 579, first sentence):

```diff
-A coordinating thread reports in three forms, and in a fourth, the hold report, when it drains to a hold.
+A coordinating thread, and only a coordinating thread, reports in three forms, and in a fourth, the hold report, when it drains to a hold; a conversational thread uses the first two [reply forms](#reply-forms).
```

**Draining a thread** (line 774), after "...and every thread that drains takes this form.":

```diff
+Only a coordinating thread drains; a conversational thread with a checkpoint pauses through a `ki-checkpoint` UPDATE of `Current state` and `Next step`.
```

**Picking up a thread** (lines 824, 827, 831-832):

```diff
-| HOLD | Conversational with a checkpoint | `hold` | `Resume <label> from its checkpoint since <mark>: read the pick-up block and take the next step with me.` | Continue the next step with the owner under `ki-recap` |
-| DONE | Conversational with a checkpoint | `done` | None | Nothing resumes |
...
-- **REST or BUSY on a conversational thread.** It carries no REST or BUSY banner. One with background work in flight finishes to DONE or drains to HOLD.
-- **HOLD on a conversational thread without a checkpoint.** There is nowhere to park. It finishes to DONE through `ki-recap` before a hold lands.
+- **Any banner or pick-up block on a conversational thread.** Its checkpoint, if it has one, is the plain `ki-checkpoint` record under [Coordinator-only machinery](#coordinator-only-machinery).
```

**Generated-surface source `hook-line`** (line 483): insert at the very start of the line, before `Coordinator:`:

```text
In a coordinating thread only, one opened or resumed as a ki-pmo coordination or state-of-play thread; in a conversational thread ignore this line and reply in the ki-pmo Reply forms. 
```

**Generated-surface source `hook-pointer`** (line 489):

```diff
-Context was compacted. Before replying, follow "Re-anchoring after compaction" in the ki-pmo coordinating-thread standard (skills/change-management/ki-pmo/references/standards-pmo.md): re-read the standard and your checkpoint in full, run ki agent status and read your inbox, then confirm in one line and answer in owner-report form with the report heading and the footer banner. Re-anchoring moves no mark.
+Context was compacted. In a coordinating thread, before replying, follow "Re-anchoring after compaction" in the ki-pmo coordinating-thread standard (skills/change-management/ki-pmo/references/standards-pmo.md): re-read the standard and your checkpoint in full, run ki agent status and read your inbox, then confirm in one line and answer in owner-report form with the report heading and the footer banner. Re-anchoring moves no mark. In a conversational thread, re-read your checkpoint if you have one and carry on with a conversational reply.
```

**Generated-surface sources `run-report` and `footer-report`** (lines 495, 501), only under CONVRUN-NARROW a):

```diff
-... then the thread's block-letter footer banner, `run report` and the issued time on its top border and one blank framed line inside each border, with its list and, at rest, the resume line.
+... then, for a coordinating thread, its block-letter footer banner, `run report` and the issued time on its top border and one blank framed line inside each border, with its list and, at rest, the resume line; a conversational thread's run report has no mark in its form line and no footer banner.
```

(`footer-report` reads "with its bracketed-state list" where `run-report` reads "with its list"; the same insertion applies.)

**Generated-surface source `output-style`** (lines 507-512):

```diff
 ---
 name: ki-coordinator
-description: Coordinating thread under ki-pmo. The thread delegates every unit of work ...
+description: Coordinating thread under ki-pmo, set aside in a conversational thread or a background agent. The thread delegates every unit of work ...
 ---

 # Coordinating thread

+This style applies only in a coordinating thread, a session the owner opened or resumed as a `ki-pmo` coordination or state-of-play thread. In a conversational thread, set it aside and reply in the `ki-pmo` reply forms: a plain conversational reply by default, and the owner report without heading or banner when a unit of work ends. A background agent follows its brief's report rule.
+
 You are a coordinating thread under the Knowledge Islands `ki-pmo` standard: ...
```

Then run `ki dev skill generate ki-pmo --write` from the development-linked checkout. It rewrites `hooks/coordinator-reminder.sh` lines 17-18, `output-styles/ki-coordinator.md`, the run-prompt Report paragraph and the four footers, so a later regeneration keeps the change.

#### 5.2 ki-agentic-harness - `skills/change-management/ki-pmo/SKILL.md`

```diff
-  the thread working rules. Use in a state-of-play or coordination thread, or to give a summary, recap, full summary,
-  banner or strike the mark; `ki-delegation` owns the background runs the thread launches.
+  the thread working rules, and the three reply forms every thread uses. Use in a state-of-play or coordination thread to
+  give a summary, recap, full summary or banner or strike the mark, or to decide how any thread replies; `ki-delegation`
+  owns the background runs the thread launches.
```

Line 21:

```diff
-It is the one source of the [owner report](references/standards-pmo.md#owner-report) and its Needs tags, which every agent report and thread report takes,
+It is the one source of the three [reply forms](references/standards-pmo.md#reply-forms), conversational reply, completed-work report and coordinator summary, with what counts as a unit of work, and of the [owner report](references/standards-pmo.md#owner-report) and its Needs tags, which every completed-work report takes,
```

#### 5.3 ki-agentic-harness - `skills/change-management/ki-pmo/scripts/banner.test.ts`

Add assertions so that regeneration cannot drop the scope:

```diff
+test('the hook line, the pointer and the output style confine the coordinator forms to coordinating threads', () => {
+  expect(hook).toContain("line='In a coordinating thread only,")
+  expect(hook).toContain('in a conversational thread ignore this line and reply in the ki-pmo Reply forms')
+  expect(hook).toContain('In a conversational thread, re-read your checkpoint if you have one')
+  expect(outputStyle).toContain('This style applies only in a coordinating thread')
+  expect(standard).toContain('## Reply forms')
+})
```

#### 5.4 ki-agentic-harness - `skills/governance/ki-delegation/references/standards-background-runs.md`

Line 157, first sentence:

```diff
-The owner sees only status one-liners and each report.
+The owner sees only status one-liners and each report, in the [reply forms](../../../change-management/ki-pmo/references/standards-pmo.md#reply-forms) the `ki-pmo` standard sets; a background agent's final report is always a completed-work report.
```

Line 163, first sentence:

```diff
-Every report written for the owner, a background agent's final `<name>.report.md` and a coordinating thread's Summary alike, is an **owner report** ...
+Every completed-work report, a background agent's final `<name>.report.md`, a coordinating thread's Summary and a conversational thread's end-of-unit report alike, is an **owner report** ...
```

#### 5.5 ki-agentic-harness - `skills/governance/ki-checkpoint/references/standards-checkpoints.md`

After line 96:

```diff
+A conversational thread's checkpoint is this record and nothing more: no pick-up block, mark, resume line or messages block, which `ki-pmo` keeps for coordinating threads under [Coordinator-only machinery](../../../change-management/ki-pmo/references/standards-pmo.md#coordinator-only-machinery). It notes a pause in `Current state` and how to carry on in `Next step`.
```

#### 5.6 ki-agentic-harness - source reviews

One line each in `ki-pmo/references/sources.md` and `ki-delegation/references/sources.md`, in the REFRESH commit: "A 2026-10-16 review, under the reply-forms record, separated the conversational reply, the completed-work report and the coordinator summary after Kris's REPORTING-FORMS instruction, and scoped the hook line, the pointer and the output style to coordinating threads."

#### 5.7 chezmoi - `dot_claude/private_communication.md`

```diff
-- End a unit of work with the owner report the `ki-delegation` background-run standard defines: what has been done, what is in progress, and outstanding queries under stable Needs tags with a copyable reply block. The level sets only its depth.
-- An owner report, and the full summary form, is a complete deliverable: no output style, proxy shaping block or communication level shortens its sections, its queries or its reply block, as the `ki-delegation` Reporting section states.
+- Reply in the three forms the `ki-pmo` standard's Reply forms section sets: a plain conversational reply by default, with no report sections, reply block or "No reply needed"; the owner report (Done, In Progress, Queries and a copyable reply block) when a unit of work ends, as that section defines it; and the coordinator forms only in a coordinating thread. The level sets only the report's depth.
+- An owner report, and every coordinator summary, is a complete deliverable: no output style, proxy shaping block or communication level shortens its sections, its queries or its reply block.
```

Line 12 is unchanged; "the owner report keeps its shape at every level" still holds.

#### 5.8 chezmoi - `dot_codex/private_AGENTS.md.tmpl`

The same two bullets replace lines 20-21, word for word as in 5.7.

#### 5.9 chezmoi - `dot_claude/private_delegation.md.tmpl`

```diff
-- In Claude Code, delegate bounded substantive work to in-session subagents, run in the background where the runtime offers it; do not try to launch or queue a detached agent.
+- In a coordinating thread in Claude Code, delegate bounded substantive work to in-session subagents, run in the background where the runtime offers it; do not try to launch or queue a detached agent. A conversational thread does bounded work directly.
 ...
-- The user sees only the one-line status updates and the final owner report in the shape `ki-delegation` sets, at the level `communication.md` sets.
+- The user sees only the one-line status updates and, when a unit of work ends, the owner report, in the reply forms `ki-pmo` sets, at the level `communication.md` sets.
 ...
-- In Claude Code, delegate substantive work to detached background agents by default, launched with `ki agent launch` or `ki agent queue`, not in-session background subagents.
-- The user sees only the one-line status updates and the final owner report in the shape `ki-delegation` sets, at the level `communication.md` sets.
+- In a coordinating thread in Claude Code, delegate every unit of work to detached background agents, launched with `ki agent launch` or `ki agent queue`, not in-session background subagents. A conversational thread does bounded work directly and may delegate the same way.
+- The user sees only the one-line status updates and, when a unit of work ends, the owner report, in the reply forms `ki-pmo` sets, at the level `communication.md` sets.
```

No change to `private_CLAUDE.md.tmpl`, the output-style symlink or `coordinator-hook.yaml`: the style and hook are symlinked or run from the harness checkout, and the Codex trusted hash covers the handler entry, not the script.

#### 5.10 ki-principal - `AGENTS.md` line 17 (optional alignment)

```diff
-Give concise progress updates at meaningful checkpoints. Commit only a completed, verified unit of work, staged by explicit path under `ki-git`; leave an unverified unit uncommitted and report its checkpoint.
+Give concise progress updates at meaningful points. Commit only a completed, verified unit of work, as the `ki-pmo` reply forms define it, staged by explicit path under `ki-git`; leave an unverified unit uncommitted and say where it stopped.
```

### 6. Phase

A new **Phase 1a - reply forms (text only)**, between Phase 0 and Phase 1 of the session-identity plan. It depends only on FORMS-AGREE, not on PLAN-AGREE, ROLE-FIELD or the hook work. Order:

1. **ki-agentic-harness**, one commit through its gate: 5.1 to 5.6, then `ki dev skill generate ki-pmo --write`, `bun run test` and `bunx tsc --noEmit`. Live sessions take the change at once, because the output style is a symlink to the harness checkout and the hook runs from it.
2. **chezmoi**, after step 1 so the section it names exists: 5.7 to 5.9; Kris reviews `chezmoi diff`, then applies.
3. **ki-principal**: 5.10, and one workstream line in the [Ways of working Project note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md).
4. **acquire**: intake removes its messages block at its own next checkpoint update, under CONV-CHECKPOINT; nobody edits it for it.

Later phases adjust it. Phase 1 (ROLE-FIELD): "opened or resumed as a ki-pmo coordination or state-of-play thread" in the hook-line and style scope sentences becomes "whose checkpoint declares role coordination or state-of-play". Phase 3 (hook role gate): the hook-line scope sentence is removed, because the hook is then silent outside coordinating roles; the pointer's conversational clause goes with it; the style's scope paragraph stays. ROLE-REPORT leaves Phase 3.

**Records (proposed, not captured):**

- ki-agentic-harness: one new `KI-HARNESS-GOV` record, "reply forms: conversational reply, completed-work report and coordinator summary", for 5.1 to 5.6, separate from the proposed "thread identity, role and native sessions" record so that it can land first.
- chezmoi: no record; 5.7 to 5.9 under REPORTING-FORMS as an explicit owner instruction, after Kris's `chezmoi diff` review.
- ki-principal: no record; 5.10 and the Project note line under the same instruction.

## In Progress

Nothing is running.

This report is committed locally in ki-principal and not pushed; the run's authority forbids pushing, so the thread pushes it. The ki-principal tree also holds another session's untracked `+/_THREADS/desk-kit/setup-note.report.md`, left untouched.

Outstanding - no action requested now:

- Every source file listed was clean when read; the harness, tools-ki and chezmoi trees had no uncommitted changes.
- The ki-pmo rubric's PMO-4 judgment item could later check that conversational replies carry no coordinator form; it was left out to keep the edits minimal.

## Queries

### FORMS-AGREE - agree the drafted wording

**Context:** Section 1 defines the conversational reply, the completed-work report and the coordinator summary. It gives a five-criterion unit-of-work test with exclusions, the bound on conversational work and the coordinator-only list. Section 5 gives every edit across the harness, chezmoi and ki-principal, with the hook line and output style changed through their generator sources so that regeneration keeps them. Nothing has been edited.

**Query:** Do you agree the drafted definitions and edits as written?

**Options:**

a) (recommended) Agree sections 1 to 5 as written, subject to the queries below.

b) Agree with amendments you name.

### FORMS-OWNER - which skill owns the definitions

**Context:** The brief proposed the `ki-delegation` Reporting section. But your REPORT-SOURCE decision makes the `ki-pmo` standard the owner report's one source, the thread types live there, and the generator renders the hook line and output style only from it.

**Query:** Which standard owns the three reply forms?

**Options:**

a) (recommended) The `ki-pmo` standard, in a new `## Reply forms` section before `## Owner report`, with `ki-delegation` Reporting and the personal guidance pointing to it.

b) The `ki-delegation` Reporting section, with `ki-pmo` and the generated surfaces linking across to it.

### UNIT-TRIVIAL - a same-turn small change

**Context:** Under the five criteria, any commit ends a unit of work, so a one-line typo fix done at once would need Done, In Progress, Queries and a reply block, which is the empty-section report you asked to avoid. The draft exempts a change asked for and made in the same turn, in one file or one commit, with nothing failed, open or left to decide; it is confirmed in one plain line.

**Query:** Should that exemption stand?

**Options:**

a) (recommended) Keep it: such a change is confirmed in one plain line naming what changed.

b) Drop it: every commit gets a completed-work report.

### NO-REPLY-BLOCK - the block in a report with no queries

**Context:** Your owner-report format of 13 October ends every report with the reply block, and a report with no queries keeps `No reply needed.`. REPORTING-FORMS removes that line from routine answers. The draft keeps it in completed-work reports and removes it everywhere else.

**Query:** Does a completed-work report with no queries still end with `No reply needed.`?

**Options:**

a) (recommended) Yes, in completed-work reports only; conversational replies never carry it.

b) No; a report with no queries ends at `No outstanding queries` with no block.

### CONV-CHECKPOINT - what a conversational checkpoint carries

**Context:** The pick-up table gives a conversational thread with a checkpoint a HOLD row with a plain resume line, plus a DONE row. Intake's checkpoint also carries a state-of-play messages block, and the session-identity plan would have allowed it as a plain line. REPORTING-FORMS says coordinator checkpoints, marks and banners apply only to coordinating threads.

**Query:** Does a conversational checkpoint drop the pick-up block, resume line and messages block?

**Options:**

a) (recommended) Yes: it is the plain `ki-checkpoint` record, pausing in `Current state` and `Next step`. The conversational HOLD and DONE rows leave the pick-up table, and intake removes its messages block at its next update.

b) Keep the conversational HOLD row and its plain resume line, dropping only the messages block.

### CONVRUN-NARROW - a delegating conversational thread

**Context:** In the [thread-model review](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/thread-model-review.report.md), CONVERSATIONAL-RUN a) gives a delegating conversational thread a run, a thread folder and the ki-pmo hold report with the HOLD frame. Banners are now coordinator-only. HEADING-LASTING still needs every saved report to open with a `#` heading.

**Query:** How is CONVERSATIONAL-RUN answered under the reply forms?

**Options:**

a) (recommended) The thread may take a run and a thread folder named for its checkpoint, under the closed list and commit rule. It pauses through a checkpoint update, with no hold report or banner. Its agents head their reports `# <thread label> › <run name>` with `**Run report at <local time>**` and no footer banner.

b) Its agents report into the state folder only, with no thread folder, as CONVERSATIONAL-RUN b).

### FORMS-PHASE - land before the identity work

**Context:** Every edit in section 5 is text: no field, hook gate or launcher. It can land as Phase 1a before ROLE-FIELD and the hook work. It supersedes ROLE-REPORT, narrows ROLE-STYLE to the mechanism alone, and narrows the role-gated table and the Phase 1 and 3 text as listed under Done.

**Query:** Should the reply forms land now as Phase 1a?

**Options:**

a) (recommended) Yes: add Phase 1a in the order harness, chezmoi, ki-principal, intake; withdraw ROLE-REPORT; read ROLE-STYLE as the mechanism only.

b) Fold it into Phases 1 and 3 and wait for PLAN-AGREE and ROLE-FIELD.

### FORMS-RECORD - where the work is captured

**Context:** Under the record threshold, a standard change needing acceptance takes a record. The harness edits qualify. The chezmoi and ki-principal edits are personal configuration and guidance under your explicit instruction, with `chezmoi diff` reviewed before apply.

**Query:** How is Phase 1a captured?

**Options:**

a) (recommended) One new `KI-HARNESS-GOV` record for the harness edits, separate from the proposed identity record. The chezmoi and ki-principal edits go under REPORTING-FORMS with no record, plus a line in the Ways of working Project note.

b) Fold the harness edits into the proposed "thread identity, role and native sessions" record.

```text
FORMS-AGREE

Agree sections 1 to 5 of /Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/reporting-forms.report.md as written, subject to the other answers in this block.

---

FORMS-OWNER

The ki-pmo standard owns the three reply forms in a new ## Reply forms section before ## Owner report, with ki-delegation Reporting and the personal guidance pointing to it.

---

UNIT-TRIVIAL

Keep the exemption: a change asked for and made in the same turn, in one file or one commit, with nothing failed, open or left to decide, is confirmed in one plain line naming what changed.

---

NO-REPLY-BLOCK

A completed-work report with no queries still ends with No reply needed.; conversational replies never carry it.

---

CONV-CHECKPOINT

A conversational checkpoint is the plain ki-checkpoint record, pausing in Current state and Next step, with no pick-up block, resume line or messages block; remove the conversational HOLD and DONE rows from the pick-up table, and intake removes its messages block at its next update.

---

CONVRUN-NARROW

Answer CONVERSATIONAL-RUN this way: a conversational thread may take a run and a thread folder named for its checkpoint under the closed list and commit rule, pauses through a checkpoint update with no hold report or banner, and its agents head their reports # <thread label> › <run name> with **Run report at <local time>** and no footer banner.

---

FORMS-PHASE

Land the reply forms now as Phase 1a, in the order harness, chezmoi, ki-principal, intake; withdraw ROLE-REPORT; read ROLE-STYLE as deciding the mechanism only.

---

FORMS-RECORD

Capture one new KI-HARNESS-GOV record for the harness edits, separate from the proposed identity record; make the chezmoi and ki-principal edits under REPORTING-FORMS with no record, and add a line to the Ways of working Project note.
```

```text
╭─ run report · 2026-10-15T23:55:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] FORMS-AGREE
- [waiting] FORMS-OWNER
- [waiting] UNIT-TRIVIAL
- [waiting] NO-REPLY-BLOCK
- [waiting] CONV-CHECKPOINT
- [waiting] CONVRUN-NARROW
- [waiting] FORMS-PHASE
- [waiting] FORMS-RECORD
- [unpushed] this report in ki-principal, committed locally

```text
Resume KI > Model > ways of working under current ki-pmo and ki-delegation since 2026-10-15T15:09:48Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
