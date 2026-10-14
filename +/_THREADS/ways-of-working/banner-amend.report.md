# banner-amend: thread banner design amended after Decision 175, done

## What has been done

- Amended the design note [thread-banner-and-re-anchoring.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/thread-banner-and-re-anchoring.md), design only, nothing implemented, no checkpoint, `Admin`, `Pillars` or `Resources` touched:
  - BANNER-MARK leaves provisional status. Section 5 cites Kris at the Master's Decision 175: "BANNER-MARK: confirmed. The resume line is the equivalent of a compaction for the checkpoint and coordination thread, and may also trigger a real compaction." The five resume steps stand (mark second, summary third). The NOT AT REST mock now shows `RESUME-COMPACT` as its open tag in place of `BANNER-MARK`.
  - New section 5.1, option RESUME-COMPACT: `/compact <instructions>` ends the turn, so it cannot sit on the resume line; the option is an optional `/compact <keep list>` first paste before the unchanged resume line. A three-step Zed pass-through test (slash completion list, a throwaway-thread compaction with a remembered-words check, then the hook pointer once section 3 ships), the Codex equivalent (same steps in a Codex thread, `/compact` in Codex CLI as control), and the note that an agent cannot drive Zed. Recommendation: resume line alone by default; compaction as Kris's optional first paste.
  - Section 4.1 "Where Kris sees it", citing Decision 175: "Kris sees no Zed rendering of cross-session messages: the threads appear idle, or show x (failed) since the outage, although their backends replied. The messaging interface goes to ways-of-working." It adds the rule that a backend reply is not visible progress, a four-surface table (Zed transcript `Messages` line, checkpoint `Messages: read to entry <n>` line, a one-line `thread.status` file, and notification routed to [KI-PRINCIPAL-ECO-012](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-012-notification-strategy-for-delegated-work.md)), and a three-step red x recovery.
  - Unit model gains four rows: Visible-progress rule, Thread status line, Red x recovery, Resume compaction. Open questions: BANNER-MARK removed; RESUME-COMPACT, SURFACE and REDX added; reply block updated.
- Commit: my staged change was absorbed into another session's commit on ki-principal `main`, `696ce2b` (`docs(design): record every settled ways-of-working decision in the tracked decisions file`, author Kris Brown, co-author trailer present), which also carries `change-management-decisions.md`. The working tree is level with that commit for my file, so the content is committed in full, but under a message that is not mine. The pre-commit audit passed with the same two pre-existing warnings as before (close-out assessments for `paperclip-bootstrap-and-recovery` and `website`).
- Not pushed. `main` is ahead of `origin/main` by that one commit, and the rule is not to push commits I did not make. No other change by me is pending.
- Left untouched: nothing else was dirty at the end; `roadmap-sizing-and-burn-down.md` was committed by another session as `fdf583b` during this run.

## What is in progress

Nothing running. This run is complete.

## Outstanding queries

### PUSH-696 - push the absorbed commit

- Summary: `696ce2b` holds my amendment plus another session's decisions file; it is unpushed and not mine to push.
- Need from you: push it from the session that made it, or say I may.
- Recommendation: the owning session pushes; nothing of mine is lost either way.

The nine questions for Kris are reproduced verbatim below; the coordinator relays them.

## Final mock banners, verbatim from the note

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
│  waiting on you: KI-RELEASE, RESUME-COMPACT      │
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

## Unit model, verbatim from the note

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
| Visible-progress rule | A backend reply or inbox ack is progress only once it is on a surface Kris looks at | Governs what a thread may call done or acked; changes no mechanism | `ki-delegation`, Project threads, beside the message shape | Sender keeps the item under Needs until visible; receiver writes it into its next owner turn and checkpoint |
| Thread status line | `~/.local/state/ki/agents/<run>/thread.status`, one line: time, state word, what it is doing or waiting on | Runtime, machine-local; mirrors the banner, never replaces it | `ki-delegation` names it; the thread writes it at each owner report and banner | `ki agent status` reads it once tools-ki lists threads beside runs; ECO-012 may read it as an event source |
| Red x recovery | Three-step procedure: resume line into the same thread, else a new thread named by the thread id, then report what was missed | Recovery only; makes no decision and re-sends no message | `ki-delegation` Thread working rules, beside Re-anchoring | Uses the resume line and the inbox; its `recovered <UTC>` evidence line is the banner's |
| Resume compaction | Optional `/compact <keep list>` first paste before the resume line | Runtime command, ends the turn; never part of the resume line itself | `ki-delegation` Reporting, as an option beside the resume line | Fires the compact hook pointer; the resume line does the rest |

## Open questions, verbatim from the note

### BANNER-FRAME - framed like ki-recap, or plain lines

- Summary: the mock uses the `ki-recap` 52-column frame with plain words inside, so archives can search `THREAD AT REST`.
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

- Summary: thread messages land in the target run's `inbox.md`, written with the existing `ki agent decide --log`; `SendMessage` is only a nudge; the hook announces unread entries; Codex needs no special path.
- Need from you: approve the channel and the naming convention (session name = thread id).
- Recommendation: approve. It needs no build and survives a thread not being live.

### RESTORE-HOME - where the rule lives

- Summary: `ki-delegation` Coordination plus every rules footer, and a core subsection in the `ki-engineering` standard; Rig and chezmoi cite it.
- Need from you: approve the two homes.
- Recommendation: approve. Both runtimes load both skills, and the footer puts it in front of every background agent.

### HOOK-RUNTIME - telling Claude from Codex

- Summary: the hook skips `has_terminal` when `CLAUDECODE` is set; Codex keeps it until `KI_AGENT_RUN` ships in the KI-RELEASE.
- Need from you: approve the environment-variable split.
- Recommendation: approve. The variable is present in this session and in Zed; the test suite fakes it.

### RESUME-COMPACT - does the resume line also compact

- Summary: `/compact` ends the turn, so it cannot sit on the resume line; the option is an optional `/compact <keep list>` first paste, with the Zed pass-through test in section 5.1.
- Need from you: choose one of: resume line alone (default), optional first paste when the thread is long, or always compact first; and whether you run the Zed test or want it left until the hook change ships.
- Recommendation: optional first paste, your call per resume. Run the Zed test once in a throwaway thread; it takes two minutes and settles whether Codex and Claude threads in Zed can be compacted by paste at all.

### SURFACE - where cross-session work shows

- Summary: a backend reply is not visible progress; messages reach you through the thread's next owner turn (a `Messages` line in Summary), the checkpoint, a one-line thread status file, and later a notification under KI-PRINCIPAL-ECO-012.
- Need from you: approve the rule and the four surfaces, and say whether the thread status line is worth the tools-ki follow-on to list threads beside runs in `ki agent status`.
- Recommendation: approve. The rule stops a thread calling a handoff done because another backend said so; the status line costs one write per report and gives `ki agent status` a view of live threads without Zed.

### REDX - recovering a thread showing a red x

- Summary: paste the thread's resume line into the same Zed thread; if Zed will not send, open a new thread in the same folder and paste it there; the thread reports what it missed and marks the banner `recovered`.
- Need from you: approve the procedure, or say a red x thread should always be replaced by a new one.
- Recommendation: approve. The same-thread paste keeps the transcript where it was; the checkpoint and inbox make the new-thread fallback lossless either way.

```text
RESUME-COMPACT - optional first paste; run the Zed test
SURFACE - approve the rule and the four surfaces; status line yes
REDX - approve the procedure
BANNER-FRAME - frame
RESUME-GUARD - keep the thread name on the line
AT-REST - agree: held and parked items do not block
INBOX - approve the inbox channel and session naming
RESTORE-HOME - approve ki-delegation and ki-engineering
HOOK-RUNTIME - approve the CLAUDECODE split
```

```text
PUSH-696 - owning session pushes / banner-amend may push
```
