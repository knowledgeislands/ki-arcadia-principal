# banner-mock: thread banner and re-anchoring design, done

## What has been done

- Wrote the design note [thread-banner-and-re-anchoring.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/thread-banner-and-re-anchoring.md): two mock banners, the unit model, proposed text placement, the master-to-thread messaging interface, the provisional BANNER-MARK order and seven open questions with a recommendation each. Linked it from the folder's index note [design.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/design.md).
- Committed on ki-principal `main` as `024625d` (`docs(design): add thread banner and re-anchoring design for sanity check`), staged by explicit path; the repository pre-commit audit passed with two pre-existing warnings on unrelated Projects (paperclip-bootstrap-and-recovery and website close-out assessments). `git pull --rebase` brought nothing new; pushed fast-forward; `main` is level with `origin/main`.
- Nothing implemented: no change to ki-agentic-harness, any checkpoint, `Admin`, `Pillars` or `Resources`.
- Not ours, left untouched: `Streams/Projects/ways-of-working/design/roadmap-sizing-and-burn-down.md` is untracked in ki-principal from another session.
- Owner words cited inline in the note: the banner request ("every coordination-thread summary or owner report ends with a multi-line status banner modelled on the ki-recap banner ..."), the Master's Decision 174 relay ("the whole thread-working model - how coordination threads work, their skills, hooks, the banner, re-bootstrap and inter-thread messaging"), RESTORE-PATH ("any change to a firewall or to the configuration of a service critical for connection ... must carry in its rollout plan a tested restore path that reconnects first, then evaluates why it failed"), DECISION-HOME ("(b) tracked +/_THREADS/<thread>/ for the decisions log and agent reports; state folder keeps runtime only") and the handoff rule ("counts as done only when Kris expressly says so").

### Mock banners, verbatim from the note

### AT REST

```text
╭──────────────────────────────────────────────────╮
│  THREAD AT REST · KI Model: ways-of-working      │
│  nothing running, nothing queued                 │
│  no open queries, every decision logged          │
╰──────────────────────────────────────────────────╯
   ways-of-working · mark 2026-10-13T04:03Z · decisions log at Decision 50
   checkpoint committed and pushed · banner 2026-10-14T09:04Z
   held, not blocking: PAPERCLIP-REQ until Wave F · parked: 1
```

```text
Resume KI Model: ways-of-working under ki-delegation since 2026-10-14T09:04Z: re-bootstrap, mark, summary, take stock, restart work given since, then banner.
```

### NOT AT REST

```text
╭──────────────────────────────────────────────────╮
│  THREAD NOT AT REST · KI Model: ways-of-working  │
│  running: harness-push                           │
│  queued: mark-tidy, apps-sweep, principal-enact  │
│  waiting on you: KI-RELEASE, BANNER-MARK         │
╰──────────────────────────────────────────────────╯
   ways-of-working · mark 2026-10-13T04:03Z · decisions log at Decision 50
   checkpoint committed, 1 commit unpushed · banner 2026-10-14T09:04Z
   held, not blocking: PAPERCLIP-REQ until Wave F · parked: 1
```

```text
Resume KI Model: ways-of-working under ki-delegation since 2026-10-14T09:04Z: re-bootstrap, mark, summary, take stock, restart work given since, then banner.
```

Why NOT AT REST, in the frame: one line each for running agents, queued agents and open Needs tags, in that order, and only the lines that apply. Other reasons take the same slot: `waiting on: Master, HOOK-FIX`, `blocked: Headroom proxy down`, `uncommitted: checkpoint`. AT REST needs all four of: no agent running or queued, no open Needs query, the checkpoint committed, and every decision since the mark logged. Held and parked items never block AT REST; they are named on the third evidence line so they are not forgotten.

The resume line makes the thread, in order:

1. re-bootstrap: re-read `ki-delegation` (Coordinator responsiveness, Reporting, Thread working rules) and its own checkpoint, including the Thread working rules block, and run `ki agent status`;
2. mark: strike a checkpoint mark at the resume time, commit it, confirm in one line;
3. summary: re-output the Summary it last gave, in full, so the thread and Kris read the same state;
4. take stock since the banner time on the line: decisions log, run status, inbox, and owner messages;
5. restart any work given since the banner, then end with a fresh banner.

The thread name on the line is a guard: a thread whose checkpoint label does not match stops and asks before doing anything. Pasted into the right thread, the line is enough on its own; a thread that has lost its context reads `ki-delegation` first, which defines the five steps. `Re-bootstrap ki-delegation.` on its own does step 1 only and then answers in owner-report form.

### Unit model, verbatim from the note

| Unit | What it is | Boundary | Owner | Hand-offs |
| --- | --- | --- | --- | --- |
| Banner | Closing frame on every Summary, recap and full summary: state (AT REST or NOT AT REST), why, evidence lines, resume line | Reads state, never changes it; never replaces the owner report above it | `ki-delegation` Reporting, under Coordinating threads | Hooks only re-inject the pointer; `ki-recap` keeps its own single-session banner |
| Resume line | One copyable owner instruction that runs the five steps | Does nothing a human could not say in words; the thread name guards against the wrong session | `ki-delegation` Reporting | Step 2 calls the mark (`ki-checkpoint`); step 4 reads the inbox and decisions log (`ki agent`) |
| Mark | Baseline in the checkpoint's `Current state`: `Mark: <UTC>, decisions log at Decision <N>` | Struck only by the owner, by "mark", "recap and mark" or the resume line | `ki-checkpoint` owns the field and its form; `ki-delegation` owns when it is struck and the recap window it bounds | Recap since the mark reads it; full summary never moves it |
| Thread working rules block | Short block at the top of a checkpoint's Objective: role, report shape, level, tool quietness, standing rules | Current rules only; durable rules stay in skills, the block names them | `ki-checkpoint` owns the block's place and shape; the master thread propagates its content | Re-anchoring re-reads it; the resume line re-reads it |
| Re-anchoring after compaction | Step list a compacted thread runs before its next reply | Reading and one-line confirmation only; no work | `ki-delegation` Thread working rules, new subsection | Triggered by the compact hook pointer or by `Re-bootstrap ki-delegation.`; not a resume (no mark, no summary) |
| Compact hook pointer | One sentence the `SessionStart`/`compact` hook injects, naming the subsection | Pointer only; carries no rules of its own | Harness `hooks/coordinator-reminder.sh` and test | Reads nothing from the checkpoint; the subsection does the rest |
| RESTORE-PATH rule | Any connection-critical change carries a tested restore path that reconnects first, then evaluates | Rollout plans and briefs; not a technical runbook | `ki-delegation` (briefs and footers) and `ki-engineering` standard (repositories) | Rig and chezmoi repositories cite the standard rather than restate it |
| Thread name | The checkpoint `thread` id, for example `knowledge-islands-model.ways-of-working`; its last segment is the run name; the Claude session is named the same | Convention, no registry | `ki-delegation` Project threads | `ki agent status` lists runs; Claude `ListAgents` lists sessions by that name |
| Thread message | Short dated note from one thread to another, tagged, quoting the owner where it carries a decision | Carries work or decisions, never authority beyond the owner's | `ki-delegation`, new subsection under Project threads | Lands in the target's inbox; a live Claude target also gets a nudge |
| Inbox | `~/.local/state/ki/agents/<run>/inbox.md`, numbered and dated entries | Runtime state, machine-local; decisions it carries are also logged durably by the receiver | `ki-delegation` names it; `ki agent decide --log` writes it today | Read by take stock, by re-anchoring and announced by the owner-message hook |

## What is in progress

Nothing running. This run is complete.

Outstanding - no action requested now:

- Implementation waits on Kris's sanity check of the note (receiver-owned: the ways-of-working thread delivers the skill subsection, the banner definition, the hook change with its test, and the RESTORE-PATH text once answered).
- `KI_AGENT_RUN` release for Codex hook detection is folded into the KI-RELEASE ask already with Kris.

## Outstanding queries

The seven questions below are for Kris; the coordinator relays them.

### BANNER-MARK - mark before summary

- Summary: the resume line strikes the checkpoint mark first, then re-outputs the summary, as the Master read Kris's "start by creating a mark and re-putting the summary".
- Need from you: confirm the order, or say summary first.
- Recommendation: confirm. The pasted line is the owner saying "mark", and the summary is the since-last-message form, so the order costs nothing.

### BANNER-FRAME - framed like ki-recap, or plain lines

- Summary: the mock uses the ki-recap 52-column frame with plain words inside, so archives can search `THREAD AT REST`.
- Need from you: frame or no frame.
- Recommendation: frame. It makes the state visible at a glance across several threads' updates.

### RESUME-GUARD - thread name on the resume line

- Summary: the line names the thread; a mismatch with the checkpoint label stops the thread. The name-free `Re-bootstrap ki-delegation.` stays for re-anchoring only.
- Need from you: keep the name, or drop it for a shorter line.
- Recommendation: keep it. One paste into the wrong Zed tab otherwise marks and re-summarises the wrong thread.

### AT-REST - what counts as open

- Summary: AT REST means no agent running or queued, no open Needs query, checkpoint committed, decisions logged. Held (PAPERCLIP-REQ) and parked items appear on an evidence line but do not block it.
- Need from you: agree, or say that held items block AT REST.
- Recommendation: agree. A thread holding one item for a future wave can still rest.

### INBOX - inbox file as the channel

- Summary: thread messages land in the target run's `inbox.md`, written with the existing `ki agent decide --log`; `SendMessage` is only a nudge; the hook announces unread entries; Codex needs no special path; session name = thread id.
- Need from you: approve the channel and the naming convention.
- Recommendation: approve. It needs no build and survives a thread not being live.

### RESTORE-HOME - where the rule lives

- Summary: `ki-delegation` Coordination plus every rules footer, and a core subsection in the `ki-engineering` standard; Rig and chezmoi cite it.
- Need from you: approve the two homes.
- Recommendation: approve. Both runtimes load both skills, and the footer puts it in front of every background agent.

### HOOK-RUNTIME - telling Claude from Codex

- Summary: the hook skips `has_terminal` when `CLAUDECODE` is set; Codex keeps it until `KI_AGENT_RUN` ships in the KI-RELEASE.
- Need from you: approve the environment-variable split.
- Recommendation: approve. The variable is present in this session and in Zed; the test suite fakes it.

```text
BANNER-MARK - confirm: mark first, then summary
BANNER-FRAME - frame
RESUME-GUARD - keep the thread name on the line
AT-REST - agree: held and parked items do not block
INBOX - approve the inbox channel and session naming
RESTORE-HOME - approve ki-delegation and ki-engineering
HOOK-RUNTIME - approve the CLAUDECODE split
```
