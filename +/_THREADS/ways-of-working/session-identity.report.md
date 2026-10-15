---

---

---

# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › session-identity

**Run report at 00:30 BST · last mark 16:09 BST**

---

## Done

Research and planning only, under Kris's SESSION-IDENTITY instruction of 16 October. Nothing was implemented; no checkpoint, standard, tool, chezmoi source, client configuration or native session was changed, renamed, started or resumed.

### Sources read

- The [intake checkpoint](/Users/krisbrown/workspaces/personal/acquire/+/_CHECKPOINTS/acquire-intake.md) (label `Acquire: acquire-intake`, conversational, at rest).
- The conversational-lifecycle handoff: no file carries that exact name. The closest match, and the one used, is the [coordination handback](/Users/krisbrown/workspaces/personal/acquire/+/_THREADS/acquire-intake/handback-coordination.report.md) with Decision 48 in the [intake decisions log](/Users/krisbrown/workspaces/personal/acquire/+/_THREADS/acquire-intake/decisions.md), which make intake a "standard conversational thread" with no coordinator ceremony and hand all coordination to Knowledge acquisition.
- This thread's [checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md); the [ki-pmo standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/references/standards-pmo.md) (Glossary, Thread types, Picking up a thread); the [ki-checkpoint standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-checkpoint/references/standards-checkpoints.md), which already forbids any vendor-session field, runtime identifier or conversation URL in a checkpoint; the [background-run standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md).
- The open queries CONVERSATIONAL-RUN, NAME-HOST, NAME-ROOT and FOOTER-PROJECTS in the [thread-model review](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/thread-model-review.report.md), and [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md). The plan builds on them and re-decides none: the native name is the label as NAME-ROOT and NAME-HOST settle it.
- `ki agent` 0.10.5 help and source ([runtimes.ts](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/src/core/agent/runtimes.ts), [thread.ts](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/src/core/agent/thread.ts)); [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md); the shared [coordinator-reminder hook](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/hooks/coordinator-reminder.sh) and its chezmoi registration; the chezmoi [Codex guide](/Users/krisbrown/.local/share/chezmoi/docs/guides/tools/codex.md) and [ChatGPT guide](/Users/krisbrown/.local/share/chezmoi/docs/guides/tools/chatgpt.md).

**Limitation:** the brief allowed official documentation fetched today, but the run's authority footer forbids any network call, so no documentation was fetched. Every finding below rests on the installed binaries, their help, the generated Codex protocol schema, the installed app bundles and the observed shape of local stores (keys and layout only; no conversation content, token or secret was printed).

### Capability matrix

Clients installed on sol: Claude Code CLI 2.1.292 (Homebrew cask), Claude Code VS Code extension 2.1.300, Claude Desktop 2.37337.1, Codex CLI 0.162.1, ChatGPT desktop app 26.1007.41230 (bundle `com.openai.codex`, bundling Codex CLI 0.162.0-alpha.17.2), ChatGPT Classic 1.2026.184, the ChatGPT/Codex VS Code extension 26.1007.21434, Zed 1.24.2.

| Capability | Claude Code CLI 2.1.292 | Codex CLI 0.162.1 and app-server | ChatGPT desktop 26.1007 (Codex threads) | ChatGPT chat input (Classic, web) | `ki agent` 0.10.5 |
| --- | --- | --- | --- | --- | --- |
| Choose the native ID at start | **supported**: `--session-id <uuid>` (`--help`) | **unsupported**: Codex mints a UUIDv7 thread ID; `thread/start` has no ID parameter (schema) | **unsupported** | **unsupported** | **unsupported**: launches `claude -p` without `--session-id` (source) |
| Read own native ID from inside the session | **undocumented but observed**: `CLAUDE_CODE_SESSION_ID` is set in this session's environment | **not verified** | **not verified** | **unsupported** | n/a |
| Native ID in hook payload | **supported**: `session_id`, `cwd`, `source` on `SessionStart`; the existing hook reads `cwd` and `source` | **supported** per the chezmoi Codex guide: shares `SessionStart` and `UserPromptSubmit` and the `additionalContext` shape; `session_id` field **not verified** | **not verified** whether the app runs `~/.codex/hooks.json` | **unsupported** | n/a |
| Inject context at start or resume | **supported**: `SessionStart` `hookSpecificOutput.additionalContext` (matchers `startup`, `resume`, `compact`) | **supported** for `startup` and `clear` (`ThreadStartSource` enum); resume matcher **not verified** | **not verified** | **unsupported**; paste only | prompt and environment only (`KI_AGENT_RUN`) |
| Set a human name at start | **supported**: `-n, --name` ("shown in prompt box, /resume picker, and terminal title") | **unsupported** at start; `thread/start` has no name field | **unsupported** at start | **unsupported** | **unsupported** |
| Rename a live session | **supported**: `/rename <name>` (binary strings: "/rename to find them easily in /resume later") | **supported**: TUI `/rename`; app-server `thread/name/set {threadId, name}` (schema) | **undocumented but observed**: the app bundle calls `thread/name/set`; rename is a UI action, not a typed `/rename` | **unsupported** in the input box (confirms the prior finding); sidebar rename **not verified** | n/a |
| Read the native name | **undocumented but observed**: transcripts carry `ai-title` records (`aiTitle`, `sessionId`); no `custom-title` record seen in the sample, so where `/rename` writes is **not verified** | **supported**: `Thread.name` from `thread/read` and `thread/list` (`searchTerm` matches the title); **undocumented but observed**: `~/.codex/session_index.jsonl` keys `id`, `thread_name`, `updated_at` | **supported** through the shared app-server only if the app uses it; **not verified** | **unsupported** | n/a |
| Arbitrary custom metadata | **unsupported**: no flag or command found | **unsupported**: `thread/metadata/update` patches `gitInfo` only (`branch`, `originUrl`, `sha`), confirming the prior finding. Nearest fields: `thread/goal/set` (an `objective`, a task goal, not identity) and `thread/section/move` (a user-visible section). `agentNickname` and `agentRole` exist on `Thread` but are set only for sub-agents | as Codex | **unsupported** | n/a |
| Resume by ID or name | **supported**: `-r, --resume [id or search]`, `--continue`, `--fork-session`; background sessions `claude attach <id or name>` | **supported**: `codex resume [SESSION_ID]`, "Session id (UUID) or session name"; `codex exec resume`, `codex fork`; `thread/resume {threadId}` | **not verified** | **unsupported** | **unsupported**: no resume of an agent session |
| Session store | **undocumented but observed**: `~/.claude/projects/<cwd slug>/<uuid>.jsonl`; `~/.claude/sessions/<pid>.json` holds process keys, not names | **undocumented but observed**: `~/.codex/sessions/YYYY/MM/DD/rollout-<time>-<uuid>.jsonl`, `session_index.jsonl`, `state_5.sqlite` | shares `~/.codex` | vendor cloud | run packet `~/.local/state/ki/agents/<run>/<agent>.launch.json` (`runtime`, `model`, `effort`, `workdir`) and `thread.json` (`repository`, `folder`); no native session ID captured |

Two Codex identifiers matter: `Thread.id` (the thread, UUIDv7, the one `resume` takes) and `Thread.sessionId` ("shared by threads that belong to the same session tree"). The binding keys on `Thread.id`. Claude Desktop and the Claude web client were not examined beyond their version; no supported session interface to them was found locally.

Prior findings: `/rename` unavailable in the ChatGPT input box, **confirmed** for chat; `thread/name/set` supported, **confirmed**; no arbitrary metadata dictionary, **confirmed**. Correction: the ChatGPT desktop app does rename Codex threads, through its UI and `thread/name/set`, so "rename unavailable" holds for the chat input only.

Consequence: no client lets us attach our metadata to a native session. Only a **name** travels natively. Everything else must live in our own binding and be supplied to the agent by a hook, a launcher or the owner's paste.

### Proposed design

1. **Logical thread identity.** The stable key is `<repository name>/<checkpoint stem>`, for example `acquire/acquire-intake`; the stem is already the checkpoint's `thread:` field and unique within its repository. The label is the human name and may change; the key does not. A conversational thread wanting identity across sessions takes the optional generic checkpoint `ki-pmo` already allows, with no pick-up ceremony beyond what its type requires. One key maps to many native sessions, on any client and host, each a row in the local binding.
2. **Binding.** One machine-local file per thread at `~/.local/state/ki/threads/<repository>/<stem>.json`, beside the existing `agents/` state: `key`, `repository` (absolute path), `checkpoint` (relative path), `label` and `role` cached from the checkpoint, and `sessions`, each `{client, client_version, native_id, native_name, host, started_at, last_seen_at, state}` with state `live`, `ended` or `forked`. Writers: a launcher at start and resume, the `SessionStart` hook when it sees a session it can attribute, an explicit bind command from inside a session, and `ki-pmo` drain and DONE, which mark sessions `ended`. Nothing else writes it.
3. **Supply to the agent.** Three channels, in order of strength. (i) The launcher: `ki thread start|resume <key> --client claude|codex` sets `KI_THREAD=<key>` in the environment, passes `--session-id` and `-n <label>` to Claude, or `codex resume <id>` to Codex, and opens with the thread's resume line. (ii) The `SessionStart` hook, extended from the existing shared script: on `startup`, `resume` and `compact` it looks up the payload's `session_id` (or `KI_THREAD`) in the bindings and returns one `additionalContext` line, "This session is `<label>` (`<key>`), role `<role>`, checkpoint `<path>`", recording the ID on first sight. This is what makes the connection. (iii) Fallback for surfaces without hooks (ChatGPT chat, possibly the desktop app): the owner pastes the resume line, which names the label; the agent resolves it to the checkpoint. That surface gets no native-ID binding.
4. **Consistency.** The checkpoint `label` is authoritative; the native name is derived as exactly the label (with a host suffix only as NAME-HOST settles). The launcher sets it at start in Claude; in Codex it is set by hand with `/rename` or the app's rename until a write through `thread/name/set` is agreed. Drift is detected read-only: `ki thread check` compares each live binding's native name, read through `thread/read` for Codex, with the label and reports; it never renames. Lifecycle state stays in the pick-up block for coordinating threads and in `state:` plus the checkpoint text for conversational ones; the binding mirrors nothing but `live`/`ended` per session. No queue, run, folder or banner is created for a conversational thread by any of this; the binding is not a work list.
5. **Portable versus local.** The field table follows.

| Field | Home | Reason |
| --- | --- | --- |
| Logical key (repository + stem) | Portable: the checkpoint file name and `thread:` | Stable across hosts and clients; already exists |
| Label (human name) | Portable: checkpoint `label:` | Owner-chosen identity; the source the native name derives from |
| Role (conversational, coordination, state-of-play) | Portable: checkpoint, per `ki-pmo` thread types | Governs behaviour on every host |
| Repository | Portable: implied by where the checkpoint lives; local binding caches the absolute path | Paths differ per host; the registry owns physical paths |
| Checkpoint path | Portable: relative path; local binding caches it | Optional for conversational threads |
| Lifecycle state | Portable: pick-up block status or `state:` | Must survive a host move; GOV-189 relies on it |
| Native session IDs | Local binding only | Forbidden in checkpoints by `ki-checkpoint`; meaningless off the host and client |
| Native name as last seen | Local binding only | Vendor-owned; used only for drift checks |
| Host | Local binding only (each row) | `ki-pmo` keeps hosts out of thread state; a host suffix in the label is the only portable trace, per NAME-HOST |
| Client and client version | Local binding only | Runtime fact, varies per session |
| Run, agent and `KI_AGENT_RUN` | Local run packet (existing) | Belongs to `ki-delegation`, not to thread identity |

### Phased plan

- **Phase 0 - agree.** Kris answers the queries below. No work starts before PLAN-AGREE.
- **Phase 1 - standard (ki-agentic-harness).** One new record: a "thread identity and native sessions" section in `ki-checkpoint`, with a pointer from `ki-pmo` Glossary (session) and `ki-delegation`: the key, the label as authority, the binding as a local runtime file outside every checkpoint, the three supply channels, drift as report-only.
- **Phase 2 - tooling (tools-ki).** One new record: `ki thread start|resume|bind|show|check`, the binding file and its tests; Claude through `--session-id` and `-n`, Codex through `codex resume` and read-only `thread/read`. Cross-referenced to [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md), whose live listing could later show bound threads, but kept separate because 127 is about runs. `ki agent launch` passing `--session-id` and recording it in the run packet is an optional later step, not in this phase.
- **Phase 3 - hook (ki-agentic-harness script, chezmoi registration).** Extend the shared `SessionStart` script for `startup` and `resume` matchers to emit the identity line; chezmoi adds the matchers and refreshes the Codex trusted hash. Silent when no binding matches, and silent under `KI_AGENT_RUN`.
- **Phase 4 - pilot on intake (acquire, local state only).** (a) Kris runs `ki thread resume acquire/acquire-intake --client claude` from the acquire checkout; check the name shows in the prompt box and `/resume` picker, the first turn carries the identity line, and the binding holds one live Claude row. (b) Kris quits and resumes the same session with `claude --resume <name>`; check the hook re-supplies identity. (c) Kris runs it with `--client codex`, then types `/rename <label>` in the Codex TUI; check `ki thread check` reports no drift, and reports drift after a deliberate rename. (d) In the ChatGPT desktop app, Kris renames the Codex thread to the label and runs the bind line the agent prints; check whether the app ran the hook. Success: the intake checkpoint is unchanged apart from any agreed label, holds no native ID, and intake's acquisition behaviour is untouched.
- **Phase 5 - record.** The Ways of working Project note gains a line for this workstream; the pilot result goes into the Phase 1 record before it is accepted.

**Not in scope:** writing to native sessions through the app-server (`thread/name/set` or any other write) beyond the owner's own hand rename; arbitrary vendor metadata; ChatGPT chat (non-Codex) binding beyond paste; Claude Desktop and web; moving bindings between hosts (they are rebuilt on each host; GOV-189 owns moves); changing `ki agent` runs, queues or reports; any change to intake's acquisition contract; any coordinator ceremony for conversational threads; settling NAME-ROOT, NAME-HOST, CONVERSATIONAL-RUN or FOOTER-PROJECTS.

### Proposed records, not captured

- ki-agentic-harness: new `KI-HARNESS-GOV` record "thread identity and native sessions" (Phase 1 and the hook script in Phase 3), referencing [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md).
- tools-ki: new `KI-TOOL-KI-CLI` record "thread session bindings" (Phase 2), referencing [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md).
- chezmoi: new `KB-DOTFILES-UE` record for the hook matchers and Codex trusted-hash refresh (Phase 3).
- ki-principal: no record; a line in the [Ways of working Project note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md).

## In Progress

Nothing is running.

This report is committed locally in ki-principal and **not pushed**. The brief asked for a pull and push, but the run's authority footer forbids every remote call and every push; the footer governs, so the thread decides the push. The ki-principal working tree also holds another session's untracked `+/_THREADS/desk-kit/setup-note.report.md`, left untouched.

Outstanding - no action requested now:

- The generated Codex schema sits in `/tmp/codex-schema.GXOc`, disposable.
- Whether the ChatGPT desktop app runs `~/.codex/hooks.json`, and whether Codex hook payloads carry `session_id`, are checked in pilot step (d) and (c), not before.

## Queries

### PLAN-AGREE - agree the bounded plan

**Context:** No client exposes custom metadata; only a name travels natively. The plan keeps identity in the checkpoint (key, label, role, state), native IDs in a machine-local binding under `~/.local/state/ki/threads/`, supplies identity through a launcher and the shared `SessionStart` hook, treats drift as report-only, and pilots on intake in five phases with the not-in-scope list above.

**Query:** Do you agree the phased plan as written?

**Options:**

a) (recommended) Agree Phases 0 to 5 and the not-in-scope list; capture the three proposed records and start Phase 1.

b) Agree, but pilot by hand first (Kris starts `claude -n "<label>"` and pastes the resume line, no tooling), and capture records only after.

c) Hold the plan for a revision you describe.

### THREAD-KEY - the stable logical key

**Context:** Labels change (LABEL-CHANGE, NAME-ROOT); checkpoint stems do not, and `ki-checkpoint` already treats the stem as the thread. A conversational thread may lack a checkpoint today.

**Query:** What is a thread's stable key?

**Options:**

a) (recommended) `<repository name>/<checkpoint stem>`; a conversational thread that wants cross-session identity takes the optional generic checkpoint.

b) A new minted thread ID stored in the checkpoint frontmatter.

c) The label itself.

### BINDING-HOME - where the native-session binding lives

**Context:** Native IDs must stay out of portable checkpoints; `~/.local/state/ki/agents/` already holds run state; GOV-189 keeps run state moving through the tracked folder only for decisions and reports.

**Query:** Where does the binding live and how does it move between hosts?

**Options:**

a) (recommended) One JSON file per thread at `~/.local/state/ki/threads/<repository>/<stem>.json`, never committed and never moved; each host builds its own on first session.

b) One append-only `~/.local/state/ki/sessions.jsonl` for all threads.

### SUPPLY-CHANNEL - how identity reaches the agent

**Context:** A file alone is no connection. Claude Code and Codex share a `SessionStart` hook with `additionalContext`, already used by the coordinator reminder; the launcher can set `KI_THREAD` and the name; ChatGPT chat has no hook.

**Query:** Which channels carry identity into a session?

**Options:**

a) (recommended) Launcher environment and name, plus the `SessionStart` hook on startup, resume and compact, plus the pasted resume line as fallback where no hook runs.

b) Launcher and pasted resume line only, with no hook change.

### NAME-AUTHORITY - which side owns the name

**Context:** Claude sets the name at start with `-n`; Codex only renames after start, through `/rename`, the app's rename or `thread/name/set`. Writing to a live client is outside this run's limits and untested.

**Query:** Which side is authoritative, and may tooling write native names?

**Options:**

a) (recommended) The checkpoint label is authoritative; tooling sets the name only at Claude start through `-n`; Codex names are set by hand; `ki thread check` reports drift and never renames.

b) As a), and `ki thread` may also call `thread/name/set` on Codex threads after a tested pilot.

### RECORD-OWNERS - where the work is captured

**Context:** [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md) covers runs and live listing; [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md) covers host moves. Folding this into either widens a record already in flight.

**Query:** Capture new records or fold into the existing ones?

**Options:**

a) (recommended) Capture one new record each in ki-agentic-harness, tools-ki and chezmoi, cross-referencing 127 and 189, and add a workstream line to the Ways of working Project note.

b) Fold the tooling into KI-TOOL-KI-CLI-127 and the standard into KI-HARNESS-GOV-189.

### PILOT-LABEL - intake's label during the pilot

**Context:** Intake's label is `Acquire: acquire-intake`; NAME-ROOT (open) would make it `Acquire > intake` and NAME-HOST would add `(sol)` only if machine-bound. The native name copies the label, so a later change means a rename in every bound session.

**Query:** Which label does the pilot use?

**Options:**

a) (recommended) Wait for NAME-ROOT and NAME-HOST, then pilot with the label they give; Phases 1 to 3 do not depend on it.

b) Pilot now with `Acquire: acquire-intake` and rename later.

```text
PLAN-AGREE

Agree Phases 0 to 5 and the not-in-scope list in /Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/session-identity.report.md; capture the three proposed records and start Phase 1.

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
```

```text
╭─ run report · 2026-10-15T23:30:00Z ──────────────╮
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
- [unpushed] this report in ki-principal, committed locally

```text
Resume KI > Model > ways of working under current ki-pmo and ki-delegation since 2026-10-15T15:09:48Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
