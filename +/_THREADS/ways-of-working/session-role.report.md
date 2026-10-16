# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › session-role

**Run report at 00:36 BST · last mark 16:09 BST**

---

## Done

Research and planning only, under Kris's SESSION-ROLE instruction of 16 October and the SESSION-IDENTITY limits. Nothing was implemented, and no live session was started, resumed or messaged.

- Read the [session-identity run report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/session-identity.report.md) and its brief, the `ki-pmo` standard (Scope, Glossary, Thread types, Coordinator responsiveness, Re-anchoring, Report forms, Opening, Bootstrap, Picking up a thread), the `ki-delegation` Reporting section and `ki-checkpoint` labels.
- Traced how role reaches a session for this coordination thread ([checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md)) and for intake ([checkpoint](/Users/krisbrown/workspaces/personal/acquire/+/_CHECKPOINTS/acquire-intake.md)). Finding: no checkpoint declares a role. Coordination comes from the opener, the checkpoint naming pattern, and the repository-wide `[skills.ki-pmo]` declaration, which drives both the hook and the `ki-coordinator` output style. Intake's conversational role comes from its opener, its AGENTS.md and the prose in its checkpoint. Nothing restores intake's role after compaction.
- Named five leaks with file and line: the global owner-report rule in `~/.claude/communication.md:8` and `~/.codex/AGENTS.md:16-17`; the `ki-pmo` SKILL.md:12 description, which triggers on "summary"; the repository-wide output style in `ki-principal/.claude/settings.json:1`, observed live because this background agent runs under it; the repository-wide hook gate in `coordinator-reminder.sh:79-87`; and, a minor one, the messages block in intake's checkpoint (lines 11-13).
- Amended the session-identity report in place. It gains a **Thread role** section covering the declaration (`role:` in checkpoint front matter, defaulting to conversational), delivery per client and moment, precedence and mismatch handling, the binding's role as a cache only, a role-gated response table for summary, recap, full summary, status, hold, resume and mark, and every standard, hook, style, launcher and chezmoi change needed. Role is folded into Phases 1 to 5. The intake pilot gains steps e to j, and Phase 4b verifies on this coordination thread (steps k to n). The proposed records were widened rather than multiplied, and there is no new Initiative or Project. The three new queries are ROLE-FIELD, ROLE-STYLE and ROLE-REPORT. PLAN-AGREE remains the single agreement query, and the reply block has been updated.
- Commit: the two reports in ki-principal, committed locally by explicit path as `docs(threads): add thread-role discovery to the session-identity plan`. No checks apply to a report-only change beyond the repository's commit hook.

## In Progress

Nothing is running.

The commit is **not pushed**. The brief asked for a pull and push, but this run's footer forbids every remote call and every push, so the footer governs and the thread decides the push. It sits above the earlier unpushed session-identity commit. Another session's untracked `+/_THREADS/desk-kit/setup-note.report.md` was left untouched.

Outstanding - no action requested now:

- Whether `claude --settings` sets `outputStyle` for a single session, whether Codex fires `SessionStart` on resume and compaction, and whether the ChatGPT desktop app runs hooks are all left to the pilot, not checked here.

## Queries

The full plan and these queries are in the [session-identity report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/session-identity.report.md). The queries are repeated here so this report can be answered on its own.

### PLAN-AGREE - agree the bounded plan

**Context:** The session-identity plan now also declares role in one checkpoint field that defaults to conversational, and delivers it with the identity line at startup, resume and compaction. Conflicts resolve as owner instruction first, then the declaration, then the default, with a one-line question on any mismatch. The binding keeps role only as a cache. Summary, recap, status, hold, resume and mark are gated by role. The plan closes the five named leaks and verifies the result on intake and on this coordination thread.

**Query:** Do you agree the phased plan as amended?

**Options:**

a) (recommended) Agree Phases 0 to 5, including the Thread role section, Phase 4b and the not-in-scope list; capture the three proposed records and start Phase 1.

b) Agree, but pilot by hand first (Kris starts `claude -n "<label>"` and pastes the resume line, no tooling), and capture records only after.

c) Hold the plan for a revision you describe.

### THREAD-KEY - the stable logical key

**Context:** Labels change (LABEL-CHANGE, NAME-ROOT), but checkpoint stems do not, and `ki-checkpoint` already treats the stem as the thread. A conversational thread may have no checkpoint today.

**Query:** What is a thread's stable key?

**Options:**

a) (recommended) `<repository name>/<checkpoint stem>`; a conversational thread that wants cross-session identity takes the optional generic checkpoint.

b) A new minted thread ID stored in the checkpoint frontmatter.

c) The label itself.

### BINDING-HOME - where the native-session binding lives

**Context:** Native IDs must stay out of portable checkpoints, and `~/.local/state/ki/agents/` already holds run state. Under GOV-189, run state moves between hosts through the tracked folder only for decisions and reports.

**Query:** Where does the binding live and how does it move between hosts?

**Options:**

a) (recommended) One JSON file per thread at `~/.local/state/ki/threads/<repository>/<stem>.json`, never committed and never moved; each host builds its own on first session.

b) One append-only `~/.local/state/ki/sessions.jsonl` for all threads.

### SUPPLY-CHANNEL - how identity reaches the agent

**Context:** A file alone makes no connection to a session. Claude Code and Codex share a `SessionStart` hook with `additionalContext`, which the coordinator reminder already uses. The launcher can set `KI_THREAD` and the name, but ChatGPT chat has no hook.

**Query:** Which channels carry identity into a session?

**Options:**

a) (recommended) Launcher environment and name, plus the `SessionStart` hook on startup, resume and compact, plus the pasted resume line as fallback where no hook runs.

b) Launcher and pasted resume line only, with no hook change.

### NAME-AUTHORITY - which side owns the name

**Context:** Claude sets the name at start with `-n`. Codex can only rename after start, through `/rename`, the app's rename or `thread/name/set`. Writing to a live client is outside this run's limits and untested.

**Query:** Which side is authoritative, and may tooling write native names?

**Options:**

a) (recommended) The checkpoint label is authoritative; tooling sets the name only at Claude start through `-n`; Codex names are set by hand; `ki thread check` reports drift and never renames.

b) As a), and `ki thread` may also call `thread/name/set` on Codex threads after a tested pilot.

### RECORD-OWNERS - where the work is captured

**Context:** [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md) covers runs and live listing, and [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md) covers host moves. Folding this work into either would widen a record already in flight. The role work joins the three proposed records.

**Query:** Capture new records or fold into the existing ones?

**Options:**

a) (recommended) Capture one new record each in ki-agentic-harness, tools-ki and chezmoi, cross-referencing 127 and 189, and add a workstream line to the Ways of working Project note.

b) Fold the tooling into [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md) and the standard into [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md).

### PILOT-LABEL - intake's label during the pilot

**Context:** Intake's label is `Acquire: acquire-intake`. If NAME-ROOT (still open) is settled, it would become `Acquire > intake`, and NAME-HOST would add `(sol)` only if the thread is machine-bound. The native name copies the label, so a later change means a rename in every bound session.

**Query:** Which label does the pilot use?

**Options:**

a) (recommended) Wait for NAME-ROOT and NAME-HOST, then pilot with the label they give; Phases 1 to 3 do not depend on it.

b) Pilot now with `Acquire: acquire-intake` and rename later.

### ROLE-FIELD - where the thread role is declared

**Context:** Neither checkpoint carries a role today. Coordination is inferred from the opener, the file-name pattern and the repository's `[skills.ki-pmo]` declaration, which covers every session in ki-principal. A front-matter field can be read by the hook, travels through Git and is read at resume and re-anchoring. `ki-checkpoint` keeps a closed front-matter set, so adding one needs a standard change.

**Query:** Where does a thread's authoritative role live?

**Options:**

a) (recommended) An optional checkpoint front-matter field `role: conversational | coordination | state-of-play`, absent meaning conversational, coordinating values valid only where `[skills.ki-pmo]` is declared, with existing coordinating checkpoints migrated through their own updates.

b) A `Role:` line in the checkpoint's pick-up block, read by the agent but not by the hook.

c) The opener and resume line alone, with no stored field.

### ROLE-STYLE - stop the coordinator output style reaching non-coordinating sessions

**Context:** ki-principal's tracked `.claude/settings.json` gives every Claude session there the `ki-coordinator` style, including conversational threads and background agents; this run is itself under it. Claude cannot unload a style mid-session. `claude --settings` exists, but whether it sets `outputStyle` for a single session is not verified. Editors such as Zed start sessions without the launcher.

**Query:** How is the style confined to coordinating roles?

**Options:**

a) (recommended) Keep the repository selection, add a generated first line making the style apply only when the session's declared role is coordinating, and have `ki agent launch` start background agents with a non-coordinator style.

b) Remove the repository `outputStyle` and have `ki thread start` pass the style per session for coordinating roles, after a pilot proves `--settings` sets it; editor-started coordinating sessions then rely on the hook alone.

### ROLE-REPORT - scope the global owner-report rule

**Context:** `~/.claude/communication.md:8` and `~/.codex/AGENTS.md:16-17`, rendered by chezmoi, tell every session in every repository to end a unit of work with the owner report and reply block. This is the main way intake's "summary" can take coordinator form. Changing it is personal configuration under chezmoi and needs Kris to review `chezmoi diff`.

**Query:** Should the owner-report rule be scoped by role?

**Options:**

a) (recommended) Scope it to background agents and coordinating threads, adding that a conversational thread ends a unit of work with a plain answer, in both chezmoi sources, applied after Kris reviews `chezmoi diff`.

b) Leave it global and rely on the hook's conversational identity line to override it.

```text
PLAN-AGREE

Agree Phases 0 to 5, including the Thread role section, Phase 4b and the not-in-scope list in /Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/session-identity.report.md; capture the three proposed records and start Phase 1.

---

THREAD-KEY

A thread's stable key is <repository name>/<checkpoint stem>; a conversational thread that wants cross-session identity takes the optional generic checkpoint.

---

BINDING-HOME

The binding is one JSON file per thread at ~/.local/state/ki/threads/<repository>/<stem>.json, never committed and never moved; each host builds its own on first session.

---

SUPPLY-CHANNEL

Identity reaches a session through the launcher environment and name, plus the SessionStart hook on startup, resume and compact, plus the pasted resume line as fallback where no hook runs.

---

NAME-AUTHORITY

The checkpoint label is authoritative; tooling sets the name only at Claude start through -n; Codex names are set by hand; ki thread check reports drift and never renames.

---

RECORD-OWNERS

Capture one new record each in ki-agentic-harness, tools-ki and chezmoi, cross-referencing KI-TOOL-KI-CLI-127 and KI-HARNESS-GOV-189, and add a workstream line to the Ways of working Project note.

---

PILOT-LABEL

Wait for NAME-ROOT and NAME-HOST, then pilot intake with the label they give; Phases 1 to 3 do not depend on it.

---

ROLE-FIELD

Declare a thread's role in an optional checkpoint front-matter field role: conversational | coordination | state-of-play, absent meaning conversational, coordinating values valid only where [skills.ki-pmo] is declared, with existing coordinating checkpoints migrated through their own updates.

---

ROLE-STYLE

Keep ki-principal's outputStyle selection, add a generated first line making the ki-coordinator style apply only when the session's declared role is coordinating, and have ki agent launch start background agents with a non-coordinator style.

---

ROLE-REPORT

Scope the owner-report rule in chezmoi dot_claude/private_communication.md and dot_codex/private_AGENTS.md.tmpl to background agents and coordinating threads, adding that a conversational thread ends a unit of work with a plain answer; apply after I review chezmoi diff.
```

```text
╭─ run report · 2026-10-15T23:36:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] PLAN-AGREE
- [waiting] THREAD-KEY
- [waiting] BINDING-HOME
- [waiting] SUPPLY-CHANNEL
- [waiting] NAME-AUTHORITY
- [waiting] RECORD-OWNERS
- [waiting] PILOT-LABEL
- [waiting] ROLE-FIELD
- [waiting] ROLE-STYLE
- [waiting] ROLE-REPORT
- [unpushed] session-identity and session-role reports in ki-principal, committed locally

```text
Resume KI > Model > ways of working under current ki-pmo and ki-delegation since 2026-10-15T15:09:48Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
