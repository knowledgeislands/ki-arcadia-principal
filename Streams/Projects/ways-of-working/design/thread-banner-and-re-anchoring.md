---
note_type: streams/design
updated: 2026-10-14T11:20:00Z
author: Written with Claude
---

# Thread banner and re-anchoring

Design only, for Kris to sanity-check before anything is built. Amended after the Master relayed Kris's answers of 2026-10-14: BANNER-MARK is confirmed, the resume line is weighed as a compaction, and the messaging interface now covers where Kris sees cross-session work. It answers the Master's relay of Kris's request: "every coordination-thread summary or owner report ends with a multi-line status banner modelled on the ki-recap banner. The banner states plainly whether the thread is AT REST (all work concluded, nothing in progress, no open queries) or not, and why. The banner carries one copyable resume line Kris can paste back into the thread later", and the hooks-diagnose finding that "after compaction the shape itself is what gets lost". Kris's instruction of 2026-10-14 at the Master gives this thread "the whole thread-working model - how coordination threads work, their skills, hooks, the banner, re-bootstrap and inter-thread messaging".

Sources: the `ways-of-working` decisions log, the Master's [hooks-diagnose report](/Users/krisbrown/.local/state/ki/agents/state-of-play/hooks-diagnose.report.md), the `ki-recap` [completion banner](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-recap/references/standards-session-recap.md), the `ki-delegation` [background-run standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md) at harness revision `d4e2d8e8`, and [coordinator-reminder.sh](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/hooks/coordinator-reminder.sh) with its test.

## 1. Mock status banner

The banner closes every Summary, recap and full summary, after the reply block. It borrows the `ki-recap` frame (52 display columns, fixed first line so transcript archives can search for it) but speaks plainly inside. Line one carries the state word; the lines beneath say why. Evidence lines sit under the frame with three leading spaces. The resume line is the last thing in the message, in its own one-line fenced block so it copies cleanly.

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

## 2. Unit model

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

## 3. Proposed text placement

**`### Re-anchoring after compaction`**, new subsection under Thread working rules in standards-background-runs.md, after Refreshing this guidance:

```markdown
After compaction, or when the owner says `Re-bootstrap ki-delegation.`, the thread does this before its next reply:

1. re-reads [Coordinator responsiveness](#coordinator-responsiveness), [Reporting](#reporting) and [Thread working rules](#thread-working-rules);
2. re-reads its checkpoint: the Thread working rules block, `Current state` with the mark and the `ki-delegation read at` revision, and the open Needs-tagged queries;
3. runs `ki agent status` and reads its inbox;
4. confirms in one line, then answers in the [owner report](#owner-report) form at the owner's level, closing with the [banner](#banner).

Re-anchoring moves no mark and re-outputs no summary; the [resume line](#banner) does both.
```

**Refreshing this guidance** gains a fourth trigger: `after compaction`.

**Bootstrap** accepts the name-free form: "`Re-bootstrap ki-delegation.` is enough for a thread already on contract; it takes its Project from its checkpoint label." The master thread's opener stays `state-of-play`.

**Line 56** (the hook paragraph under Coordinator responsiveness) becomes:

```markdown
A runtime hook backs these rules: the harness `hooks/coordinator-reminder.sh` injects a one-line reminder, naming the cadence and the owner-report form, on every owner message, and after compaction injects a pointer to [Re-anchoring after compaction](#re-anchoring-after-compaction). It fires in a thread whose checkout holds `+/_CHECKPOINTS/` and stays silent in agents `ki agent` launches. The hook is registered per machine by the user-environment manager.
```

**Banner**, in Reporting under Coordinating threads, replacing the present `#` banner bullet's state words: the opening `#` heading stays; the closing banner is added as above, with the AT REST conditions, the NOT AT REST lines, the evidence lines and the resume line. The three forms table gains "closes with the banner" in Sections.

**Hook change**, `hooks/coordinator-reminder.sh` and `coordinator-reminder.test.ts`:

- `UserPromptSubmit` keeps the present line, plus `Unread thread messages: <n>` when the inbox holds entries newer than the checkpoint's `updated_at`.
- `SessionStart` with `source: compact` emits: `Context was compacted. Before replying, follow "Re-anchoring after compaction" in ki-delegation (standards-background-runs.md): re-read the rules and your checkpoint, run ki agent status, then confirm in one line and answer in owner-report form.`
- Runtime split: when `CLAUDECODE` is set (Claude Code sets it in every session, including Zed through the Agent SDK) skip `has_terminal`; the `KI_AGENT_RUN` and print-ceiling guards already cover `ki agent` children. Otherwise (Codex) keep `has_terminal` until the tools-ki release carrying `KI_AGENT_RUN` ships, then delete it. Tests: a Claude compact payload with no terminal gets the pointer; a Codex one without a terminal stays silent; `KI_AGENT_RUN` silences both.
- No chezmoi change: registrations and matchers are unchanged, and Codex trust hashes cover handler entries, not script contents.

**RESTORE-PATH**, so Claude and Codex both load it (both runtimes install the same harness skills):

- `ki-delegation`: a `### Connection-critical changes` subsection under Coordination, in Kris's words: "any change to a firewall or to the configuration of a service critical for connection (Headroom proxy, SSH, Tailscale, network, auth) must carry in its rollout plan a tested restore path that reconnects first, then evaluates why it failed"; plus one line in each `assets/rules-*.md` footer: "A connection-critical change needs a tested restore path in the task; without one, stop and report."
- `ki-engineering` standard: a core subsection `### Connection-critical rollouts` beside Clean-end-state cutovers under section 1, same rule, with "tested" meaning the restore path was run once before the change on the same machine.
- Rig and chezmoi: their `AGENTS.md` cite the standard; no restatement.

## 4. Master-to-thread messaging interface

Facts: a `ki agent decide` note is passive; Claude Code `SendMessage` reaches live Claude sessions on this Mac only; Codex threads need Kris to paste; session names do not map to threads today.

The design makes the inbox the channel and the nudge an optimisation, so one mechanism works for Claude, Codex, a thread that is not live, and a thread on another machine once the inbox moves under tracked `+/_THREADS/<thread>/` with the decisions log (DECISION-HOME, Kris: "(b) tracked +/_THREADS/<thread>/ for the decisions log and agent reports; state folder keeps runtime only").

- **Naming:** thread id is the checkpoint `thread` field; run name is its last segment (`ways-of-working`); master run is `state-of-play`. A Claude thread names its session after its thread id at bootstrap, so `ListAgents` shows which threads are live. No registry file.
- **Message shape:** one entry, written with `ki agent decide <target-run> --log ~/.local/state/ki/agents/<target-run>/inbox.md "<text>"`, so it is numbered and dated today with no build. Text: `From <sender thread> <TAG>: <what and why, one paragraph>. Owner words: "<verbatim>". Reply: <ack | outcome by <when>>.`
- **Nudge:** if the target is a live Claude session, the sender also sends one line by `SendMessage`: `Inbox: <TAG> from <sender>. Read ~/.local/state/ki/agents/<run>/inbox.md.` Otherwise nothing; the owner-message hook announces unread entries on the target's next turn, and the resume line's take stock reads the inbox.
- **Acknowledgement:** the receiver logs the message in its own decisions log (`From <sender>: ...`, as today), acts, and acks with `ACK <TAG>` plus the outcome: by `SendMessage` to a live Claude sender, else as an inbox entry in the sender's run, and always in its next owner report. The sender keeps the item under Needs until acked, and under Kris's rule a handoff "counts as done only when Kris expressly says so".
- **Codex:** same inbox and ack path. The Codex hook announces unread entries on the next owner message. Where the thread is idle, the sender gives Kris the resume line of the target in a code block; Kris pastes it and the thread takes stock. No special casing beyond the absent nudge.
- **Later, not now:** `ki agent send <run> <text>` in tools-ki to replace the `--log` idiom, and the inbox moving with the decisions log under `+/_THREADS/`. Both are captured when the interim has run for a few days, under the burn-down rule.

### 4.1 Where Kris sees it

Finding, Kris at the Master on 2026-10-14: "Kris sees no Zed rendering of cross-session messages: the threads appear idle, or show x (failed) since the outage, although their backends replied. The messaging interface goes to ways-of-working." Zed's ACP client renders only the owner's turns and the thread's replies to them. A `SendMessage` the thread receives, and the reply it sends back, go between backends and never appear in the transcript, so in the sidebar the thread shows idle on its last owner instruction, or a red x where its backend errored during the Headroom proxy outage of 08:49-09:46 BST.

**Rule: a backend reply is not visible progress.** A reply to a `SendMessage`, or an inbox ack, counts as progress only once it is on a surface Kris looks at. The receiving thread writes what it did into its next owner-facing turn and its checkpoint; the sending thread keeps the item under Needs, and says "acked by backend, not yet visible", until that happens. Neither thread tells Kris an item is done on the strength of a backend reply.

**Surfaces, and what each carries:**

| Surface | Carries | Who writes it | When |
| --- | --- | --- | --- |
| Zed transcript | Owner turns and the thread's own replies; nothing injected | The thread, in its owner report | Every owner-facing turn names messages received and acked since the last one, under a `Messages` line in Summary |
| Checkpoint | `Current state` line `Messages: read to entry <n> at <UTC>`; open Needs tags from messages | The thread, under `ki-checkpoint` | At each checkpoint update and at the mark |
| Thread status line | `~/.local/state/ki/agents/<run>/thread.status`: one line, `HH:MM <zone> - <state word> - <what it is doing or waiting on>` | The thread, at each owner report and each banner | Read by `ki agent status`, which today lists runs only; listing threads beside runs is a small tools-ki follow-on |
| Notification | Message received, ack sent, thread recovered, thread errored | Not this design | Routed to [KI-PRINCIPAL-ECO-012](../../../Roadmap/KI-PRINCIPAL-ECO-012-notification-strategy-for-delegated-work.md), which owns the channel (Telegram first, coordinating thread meanwhile); this design only names the four events so that record can carry them |

Until ECO-012 delivers, the checkpoint and the thread status line are the surfaces that survive a thread being idle, and the Zed transcript is the one Kris reads first. The nudge stays: a `SendMessage` still wakes a live Claude thread even though Kris never sees it; what the woken thread must not do is treat its reply to the nudge as having reported to Kris.

**Recovering a thread showing a red x.** The red x means the backend turn errored, not that the thread is lost: the checkpoint, decisions log and inbox hold everything it needs.

1. Do not open a new thread first. Paste that thread's resume line into the same Zed thread. If the thread replies, it re-anchors, strikes the mark, re-outputs its summary and takes stock, and the inbox gives it every message the outage swallowed.
2. If Zed will not send into the thread, open a new thread in the same project folder, and paste the resume line. The name on the line and the checkpoint label match, so the guard passes; the thread names its session after its thread id and the old transcript becomes history.
3. The recovered thread reports, under take stock, what it missed and what it did about it, and its banner says `recovered <UTC>` on the second evidence line for that one report.

Messages sent during an outage need no re-send: the inbox is the channel, the nudge is lost, and the resume line's take stock reads the inbox. A sender that only nudged without writing the inbox entry has not sent the message.

## 5. BANNER-MARK, confirmed, and the resume line as a compaction

Kris at the Master on 2026-10-14: "BANNER-MARK: confirmed. The resume line is the equivalent of a compaction for the checkpoint and coordination thread, and may also trigger a real compaction." The resume line therefore strikes the mark first and re-outputs the summary second (steps 2 and 3 above), and this is no longer provisional. The summary re-output is the Summary form (since last message), so it does not depend on the mark, and the next recap covers from the resume. Outstanding items carry forward across marks, so nothing is dropped.

### 5.1 Option RESUME-COMPACT: the resume line triggers a real compaction

Claude Code accepts `/compact <instructions>`: it summarises the transcript, keeping what the instructions name, and the `SessionStart` hook then fires with `source: compact`, which is where the re-anchoring pointer is injected. Codex CLI has its own `/compact`, which summarises without instructions. Two facts shape the option. First, `/compact` ends the turn: the runtime compacts and waits, so the instructions shape the summary but do not drive the five steps. Second, after a compaction the summary in step 3 is rebuilt from the checkpoint and the decisions log rather than re-output from memory, which is the no-transcript reconstruction `ki-checkpoint` is for, at the cost of detail that was only in the transcript.

So the option is a two-line resume block rather than a longer single line. The first line is optional; the second is the resume line as it stands:

```text
/compact Keep verbatim: thread id, Thread working rules block, mark, open Needs tags, running and queued agents, messages read to entry.
```

```text
Resume KI Model: ways-of-working under ki-delegation since 2026-10-14T09:04Z: re-bootstrap, mark, summary, take stock, restart work given since, then banner.
```

**Proposed test, Zed pass-through.** Kris runs it in a throwaway Claude Code thread in Zed with a dozen turns of filler, never in a coordination thread:

1. Type `/` in the Zed agent panel. If `compact` appears in the completion list, the Claude Code ACP adapter advertises it and Zed will send it as a command.
2. Send `/compact Keep only the words APPLE and PEAR.` Pass: the context indicator in the panel drops, and a follow-up `What do you remember?` returns the two words and not the filler. Fail: the reply treats the line as prose, the indicator does not move, and the filler is still remembered.
3. Once the hook change in section 3 ships, the pass case also shows the re-anchoring pointer in the thread's next turn, which proves the `source: compact` path in Zed as well.

The same three steps in a Codex thread in Zed test the Codex adapter; the Codex control is `/compact` in the Codex CLI itself. An agent cannot drive Zed, so the control for Claude is the Claude Code terminal, where `/compact <instructions>` is documented; the only agent-runnable part is the hook test in section 3.

**Recommendation.** Keep the resume line a single paste that does not compact, and offer the `/compact` line as an optional first paste Kris uses when the thread is long or has just recovered from an error. Reasons: the two cannot be one line because `/compact` ends the turn; the mark and the summary already give the checkpoint and the coordination thread their logical compaction, which is what Kris named; and a compaction that is not needed throws away transcript detail for nothing. If the Zed test fails, nothing in the design changes: the second line still works and the first is simply unavailable in Zed.

## 6. Open questions for Kris

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
