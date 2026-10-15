---

---

---

# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › session-identity

**Run report at 00:35 BST · last mark 16:09 BST**

Amended in place by the `session-role` run under Kris's SESSION-ROLE instruction of 16 October: the [Thread role](#thread-role) section, the role rows of the phases and pilot, and the ROLE-FIELD, ROLE-STYLE and ROLE-REPORT queries are new; PLAN-AGREE now covers them.

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
| Role (conversational, coordination, state-of-play) | Portable: checkpoint front matter `role:`, absent meaning conversational; local binding caches it only, under [Thread role](#thread-role) | Governs behaviour on every host |
| Repository | Portable: implied by where the checkpoint lives; local binding caches the absolute path | Paths differ per host; the registry owns physical paths |
| Checkpoint path | Portable: relative path; local binding caches it | Optional for conversational threads |
| Lifecycle state | Portable: pick-up block status or `state:` | Must survive a host move; GOV-189 relies on it |
| Native session IDs | Local binding only | Forbidden in checkpoints by `ki-checkpoint`; meaningless off the host and client |
| Native name as last seen | Local binding only | Vendor-owned; used only for drift checks |
| Host | Local binding only (each row) | `ki-pmo` keeps hosts out of thread state; a host suffix in the label is the only portable trace, per NAME-HOST |
| Client and client version | Local binding only | Runtime fact, varies per session |
| Run, agent and `KI_AGENT_RUN` | Local run packet (existing) | Belongs to `ki-delegation`, not to thread identity |

### Thread role

Added under SESSION-ROLE. Research only; nothing was changed, started, resumed or messaged.

**How role reaches a session today**

No client supplies a native session-type flag, and no checkpoint carries a role field: both checkpoints examined have the closed `ki-checkpoint` front matter `type`, `thread`, `label`, `state`, `created_at`, `updated_at` and nothing else. Role is inferred from five channels, none of them a per-thread declaration:

| Channel | Where | What it decides | Per thread? |
| --- | --- | --- | --- |
| Repository declaration | `[skills.ki-pmo]` at `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/.ki.toml:139`; absent from `/Users/krisbrown/workspaces/personal/acquire/.ki.toml` | Gates the hook (`coordinator-reminder.sh:79-87`) | No: every session in the checkout |
| Output style | `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/.claude/settings.json:1` selects `ki-coordinator`; `~/.claude/settings.json:90` selects `Concise` elsewhere; deployed from chezmoi `dot_claude/output-styles/symlink_ki-coordinator.md.tmpl` | The whole system-prompt persona, coordinator rules and owner-report shape | No: every Claude session in ki-principal, conversational or background |
| Hook | `/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/hooks/coordinator-reminder.sh`, registered in `~/.claude/settings.json:66-88` and `~/.codex/hooks.json` from chezmoi `.chezmoidata/coordinator-hook.yaml`; `UserPromptSubmit` on every prompt and `SessionStart` on `compact` only | Coordinator line on every owner message; re-anchoring pointer after compaction | No: keyed on the repository declaration; silent only under `KI_AGENT_RUN` or the print ceiling (lines 23-24) |
| Opener and resume line | Owner's paste: `Bootstrap as the <project> coordination thread under ki-pmo` ([ki-pmo Opening a thread](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/references/standards-pmo.md)); intake's `Bootstrap Acquire: acquire-intake as an open conversational intake thread` (`/Users/krisbrown/workspaces/personal/acquire/README.md:30`) | The role in words, at startup and resume only | Yes, but owner-supplied each time and lost to compaction unless the summary keeps it |
| Naming and prose | Checkpoint file pattern `<initiative>.<project>.md`; label pattern; prose such as intake checkpoint line 18 "conversational intake thread" and `/Users/krisbrown/workspaces/personal/acquire/AGENTS.md:21` | Inference only | Yes, but not machine-readable and not authoritative under the standard |

**Coordination, traced on this thread** ([checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md)): nothing in the checkpoint says "coordination". It is coordination because the opener said so and because file name, pick-up block and resume line follow the coordination pattern. At **startup** the opener carries it, with the output style and the hook line as repository-wide reinforcement. At **resume** the pasted resume line ("re-bootstrap ... under current ki-pmo") carries it; no `SessionStart` `resume` hook exists. **After compaction** the `compact` hook injects the re-anchoring pointer, which sends the agent to re-read the standard and checkpoint; the role itself survives only through the style, the summary and inference from the file name. It works today, but by repository, not by declaration.

**Conversational, traced on intake** ([checkpoint](/Users/krisbrown/workspaces/personal/acquire/+/_CHECKPOINTS/acquire-intake.md)): at **startup** and **resume** the README opener says "conversational", AGENTS.md line 21 says it has "no coordinator-only delegation, full Project summary, banner or heartbeat mandate", and checkpoint line 18 repeats it. **After compaction** nothing re-supplies it: the hook is silent in acquire and there is no identity line. In acquire the repository channels are correctly silent: no `[skills.ki-pmo]`, no project output style, so the hook exits and Claude gets `Concise`.

**Leaks that push coordinator reporting onto a conversational thread**

1. **Global owner-report rule.** `~/.claude/communication.md:8` (source `/Users/krisbrown/.local/share/chezmoi/dot_claude/private_communication.md`) and `~/.codex/AGENTS.md:16-17` (source `/Users/krisbrown/.local/share/chezmoi/dot_codex/private_AGENTS.md.tmpl`) say "End a unit of work with the owner report ... outstanding queries under stable Needs tags with a copyable reply block" and that "the full summary form is a complete deliverable". They apply to every session on every repository, intake included, so a "summary" there is pulled towards Done, In Progress, Queries and a reply block. This is the main leak for intake.
2. **`ki-pmo` skill trigger.** `/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/SKILL.md:12` says "Use in a state-of-play or coordination thread, **or to give a summary, recap, full summary**, banner or strike the mark", and the skill is installed user-wide (`~/.claude/skills/ki-pmo` and `~/.codex/skills/ki-pmo`, both symlinks to the harness). The word "summary" alone can load the coordinator forms in any repository.
3. **Repository-wide output style.** `ki-principal/.claude/settings.json:1` gives every Claude session in ki-principal the `ki-coordinator` persona, so a conversational thread opened there (any `KI > <topic>` thread in the Capital) answers "summary" with the full Summary and banner. Observed directly: this background agent, launched with `KI_AGENT_RUN=ways-of-working`, is running under `ki-coordinator`; the hook's run-marker exit (lines 23-24) has no counterpart for the style.
4. **Repository-wide hook.** `coordinator-reminder.sh:79-87` fires on every owner message in any session whose checkout declares `ki-pmo`, so the same ki-principal conversational thread also gets the coordinator line, and after compaction the re-anchoring pointer telling it to "answer in owner-report form with the report heading and the footer banner" (line 18).
5. **Minor - messages block in a conversational checkpoint.** The intake checkpoint carries a `Messages from Master: state-of-play` block (lines 11-13). The standard places that block beneath a coordinating thread's pick-up block; on intake it is harmless as an instruction channel but signals coordinator machinery. Checkpoint presence itself does not leak: the standard already allows the optional generic checkpoint and a conversational HOLD row.

Where a leak can only be confirmed live, the pilot below gives the manual check.

**1. The single authoritative declaration**

A new optional front-matter field in the thread's `ki-checkpoint` record: `role: conversational | coordination | state-of-play`. Absent field, or no checkpoint at all, means `conversational`, which is the standard's existing default ("A thread with no stated type is conversational"). `ki-checkpoint` owns the field and its validation; `ki-pmo` owns what each value means. `role: coordination` or `state-of-play` is valid only in a checkout that declares `[skills.ki-pmo]`; the repository declaration stays as the capability gate, never as the role.

It beats the alternatives because each of them is something else's property: the label is presentation, owner-renameable and copied to native names; the file name is a naming convention a conversational checkpoint on a Project topic could match; checkpoint presence is optional for conversational threads by design; the repository declaration and the output style cover every session in a checkout; the opener is an owner instruction at one moment and vanishes with compaction. The checkpoint already travels between hosts through Git, is read at resume and re-anchoring, and is the thing `ki-checkpoint` RESUME validates, so a role there is read at exactly the moments it matters.

**2. Delivery**

| Moment | Claude Code CLI and IDE | Codex CLI | ChatGPT desktop (Codex threads) | ChatGPT chat |
| --- | --- | --- | --- | --- |
| Startup | `ki thread start` sets `KI_THREAD` and `-n <label>`; the `SessionStart` `startup` hook reads the checkpoint `role` and emits the identity line, now ending `role <role>`; a coordination role adds the bootstrap pointer. Without the launcher, the opener's bootstrap step runs `ki thread bind`, after which the hook resolves it | `SessionStart` `startup` (supported) as Claude | Opener paste; hook **not verified** (pilot step d) | Opener paste only |
| Resume | `SessionStart` `resume` (supported) re-emits the identity and role line | `codex resume`; resume matcher **not verified**; the `UserPromptSubmit` line carries role on the first prompt as fallback | Resume-line paste | Resume-line paste |
| After compaction | `SessionStart` `compact` (supported) emits the identity and role line; the re-anchoring pointer only when role is coordination or state-of-play | Compact source **not verified**; `UserPromptSubmit` fallback as now | Not verified; owner may paste the resume line | n/a |
| Every owner message | `UserPromptSubmit`: coordinator line only when the bound role is coordination or state-of-play; nothing for conversational | Same | Not verified | n/a |

The resume line for each type already names the type implicitly ("re-bootstrap ... under current ki-pmo" for coordinating threads, "take the next step with me" for a conversational HOLD); the bootstrap step adds one check that the pasted wording agrees with the declared role.

**3. Conflict and staleness**

Precedence, highest first:

1. An explicit current-thread owner instruction ("treat this as conversational"), for the current session only. The agent offers, in one line, to write it to the checkpoint `role`; it never writes the field unasked.
2. The checkpoint `role` field, re-read at startup, resume, compaction and bootstrap.
3. The default, `conversational`.

Never authority: label, native name, file name or path, checkpoint presence, the repository's `[skills.ki-pmo]`, the output style, the hook text, the binding's cached role, and a compaction summary's recollection of the role.

On a mismatch the agent says it in one line and asks, and keeps behaving under the higher-precedence source until answered; it never silently switches. Cases: the opener or resume line names a different role from the checkpoint ("The checkpoint declares this thread conversational but the opener says coordination - which should hold?"); `role: coordination` in a checkout without `[skills.ki-pmo]`; an existing coordinating checkpoint with no `role` field before migration (the agent treats it as the opener says and asks once whether to record `role: coordination`); and the output style or hook pushing coordinator form in a thread declared conversational (the agent follows the declaration and says once that the style disagrees). A stale binding cache is not a conflict: the checkpoint wins and the cache is refreshed without a question.

**4. Native binding**

The binding's `role` (proposed in the binding file above) is a derived cache: written with `role_from: "<checkpoint path>@<checkpoint updated_at>"` whenever the hook or launcher reads the checkpoint, and never read to decide behaviour. The hook always reads the checkpoint when one is bound; if the checkpoint cannot be read it reports "role unknown, treating as conversational" rather than falling back to the cache. `ki thread check` reports drift when the cached role or its `updated_at` differs from the checkpoint, read-only like name drift. No native name, title or vendor field carries role: no client exposes a field for it, and a role in the name would compete with the label.

**5. Role-gated responses**

| Request | Coordination or state-of-play | Conversational, with or without a checkpoint |
| --- | --- | --- |
| "summary" | The `ki-pmo` Summary: report heading, Done, In Progress, Queries, reply block, footer banner, resume line at rest; pick-up block rewritten | A plain answer in prose about the conversation and its work: no report heading, no Done/In Progress/Queries frame, no Needs tags or reply block, no banner, no pick-up block rewrite |
| "recap" | The `ki-pmo` recap since the mark; "recap and mark" re-strikes | The ordinary `ki-recap` session recap, as plain text; no mark exists to move |
| "full summary" | The `ki-pmo` full summary with `## Decided` | A fuller plain answer; no `## Decided` or frame |
| "status" | The timed one-to-two-line update with each agent's step from `ki agent status`; the Summary only if all work has finished | A plain line or two on where the work stands, including any background run the thread itself started |
| "hold" | Drain to a hold and give the hold report with the HOLD frame | With a checkpoint: `ki-checkpoint` UPDATE writing the conversational HOLD pick-up row (status `hold` and its plain resume line), then one plain sentence giving that resume line; no hold report or frame. Without one: a plain note of where it stopped |
| "resume" | Re-bootstrap from the pick-up block and report in the re-bootstrap form | Re-read the checkpoint if any and continue with the owner; at most one plain line saying where it picks up |
| "mark" | Strike the mark | Say in one line that a conversational thread has no mark, and offer a checkpoint UPDATE |

Changes needed to enforce it:

- **`ki-checkpoint` standard:** add the optional `role` field, its three values, the conversational default, and the rule that coordinating values need `[skills.ki-pmo]`.
- **`ki-pmo` standard:** Thread types reads the type from `role`; Report forms and the SKILL "summary" invocations apply in coordinating threads only, with the table above for conversational ones; Bootstrap adds "bind the session and check the declared role against the opener"; Re-anchoring applies only to coordinating roles; Picking up a thread migrates existing coordinating checkpoints to carry `role`; the messages block is permitted on a conversational checkpoint as a plain instruction line only.
- **`ki-pmo` SKILL.md:12 description:** "Use in a state-of-play or coordination thread to give a summary, recap ..." rather than "or to give a summary", so the word alone no longer selects the skill.
- **Hook `coordinator-reminder.sh`:** gate on the session's resolved role (binding, then checkpoint) after the repository gate, so an unbound or conversational session in ki-principal gets nothing; emit the identity-and-role line on `startup`, `resume` and `compact`; emit the re-anchoring pointer only for coordinating roles.
- **Output style `ki-coordinator`:** generated text gains a first line, "This style applies only when this session's declared role is coordination or state-of-play; otherwise ignore it and answer plainly", since Claude cannot unload a style per session. Under ROLE-STYLE option b) the repository `outputStyle` is removed instead and `ki thread start` passes `--settings '{"outputStyle":"ki-coordinator"}'` for coordinating roles (flag present in `claude --help`; per-session effect **not verified**).
- **`ki agent` launcher (tools-ki):** background agents run with an explicit non-coordinator style, so a run in ki-principal no longer inherits the persona (leak 3, observed).
- **chezmoi personal configuration:** `dot_claude/private_communication.md` and `dot_codex/private_AGENTS.md.tmpl` scope the owner-report rule to background agents and coordinating threads, and say a conversational thread ends a unit of work plainly. Personal configuration; Kris reviews `chezmoi diff` before apply.
- **`ki-pmo` rubric:** HOOK-BINDING's mechanical item stays; a new item checks every coordinating checkpoint carries `role`.

### Phased plan

- **Phase 0 - agree.** Kris answers the queries below. No work starts before PLAN-AGREE.
- **Phase 1 - standard (ki-agentic-harness).** One new record: a "thread identity and native sessions" section in `ki-checkpoint`, with a pointer from `ki-pmo` Glossary (session) and `ki-delegation`: the key, the label as authority, the binding as a local runtime file outside every checkpoint, the three supply channels, drift as report-only. **Role:** the same record adds the optional `role` front-matter field to `ki-checkpoint`; in `ki-pmo`, Thread types reads it, Report forms and the SKILL description gate the coordinator forms to coordinating roles with the role-gated response table, Bootstrap binds and checks role, Re-anchoring is limited to coordinating roles, the messages block is allowed on a conversational checkpoint as a plain line, and the rubric checks every coordinating checkpoint carries `role`; the `ki-coordinator` output style gains its self-scoping first line under ROLE-STYLE; `ki dev skill generate ki-pmo --write` regenerates the hook line and style. The migration adds `role: coordination` or `role: state-of-play` to every existing coordinating checkpoint in the territory, through each thread's own next update or the state-of-play messages block, never by another thread editing it directly.
- **Phase 2 - tooling (tools-ki).** One new record: `ki thread start|resume|bind|show|check`, the binding file and its tests; Claude through `--session-id` and `-n`, Codex through `codex resume` and read-only `thread/read`. Cross-referenced to [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md), whose live listing could later show bound threads, but kept separate because 127 is about runs. `ki agent launch` passing `--session-id` and recording it in the run packet is an optional later step, not in this phase. **Role:** `ki thread show` prints the resolved role and its source; `ki thread check` reports role-cache drift; `ki-checkpoint` validation accepts the `role` field; `ki agent launch` runs background agents with an explicit non-coordinator output style; under ROLE-STYLE b) only, `ki thread start` passes the style per session.
- **Phase 3 - hook (ki-agentic-harness script, chezmoi registration and personal configuration).** Extend the shared `SessionStart` script for `startup` and `resume` matchers to emit the identity line; chezmoi adds the matchers and refreshes the Codex trusted hash. Silent when no binding matches, and silent under `KI_AGENT_RUN`. **Role:** the identity line ends `role <role>`; `UserPromptSubmit` emits the coordinator line only when the resolved role is coordinating, and `compact` emits the re-anchoring pointer only then; an unbound session in a `ki-pmo` checkout gets nothing. Under ROLE-REPORT, chezmoi scopes the owner-report rule in `dot_claude/private_communication.md` and `dot_codex/private_AGENTS.md.tmpl` to background agents and coordinating threads; Kris reviews `chezmoi diff` before apply.
- **Phase 4 - pilot on intake (acquire, local state only).** (a) Kris runs `ki thread resume acquire/acquire-intake --client claude` from the acquire checkout; check the name shows in the prompt box and `/resume` picker, the first turn carries the identity line, and the binding holds one live Claude row. (b) Kris quits and resumes the same session with `claude --resume <name>`; check the hook re-supplies identity. (c) Kris runs it with `--client codex`, then types `/rename <label>` in the Codex TUI; check `ki thread check` reports no drift, and reports drift after a deliberate rename. (d) In the ChatGPT desktop app, Kris renames the Codex thread to the label and runs the bind line the agent prints; check whether the app ran the hook. **Role, before Phase 3 lands (baseline):** (e) in intake under Claude Code, Kris sends `summary`; today's expected result is a plain answer, and any report heading, Done/In Progress/Queries frame, reply block or banner confirms leak 1 or 2 and is recorded as the baseline. (f) The same in intake under Codex or the ChatGPT desktop app. **Role, after Phases 1 to 3:** (g) intake's checkpoint carries no `role` field (default conversational); the identity line reads `role conversational`; Kris sends `summary`, `status`, `recap` and `mark`; expected: plain prose for each, no heading, frame, Needs tag, reply block or banner, `mark` answered with the one-line "no mark" note, and the checkpoint's pick-up area untouched. (h) Kris types `/compact` in intake and then `summary`; expected: the identity line reappears and the answer stays plain. (i) Kris opens a throwaway conversational thread in the ki-principal checkout (unbound) and sends `summary`; expected: a plain answer and no coordinator hook line, which proves leaks 3 and 4 closed. (j) Mismatch: Kris pastes intake's opener with "coordination" in place of "conversational"; expected: one line naming the mismatch and a question, with no switch. Success adds: no coordinator form appears in intake in any step from (g) onwards.
- **Phase 4b - verify on this coordination thread (ki-principal, after the migration gives this checkpoint `role: coordination`).** (k) Kris resumes `KI > Model > ways of working` with its pick-up resume line; expected: the identity line reads `role coordination`, and the re-bootstrap report renders the report heading and footer banner as now. (l) Kris sends `summary`; expected: the full `ki-pmo` Summary, unchanged from today. (m) Kris types `/compact` then the resume line; expected: identity line, re-anchoring pointer and owner-report reply. (n) Kris types "treat this as conversational for now" then `summary`; expected: a plain answer, plus one line offering to write `role: conversational`, which Kris declines; next `summary` after a resume returns to the Summary. Any difference from today's coordination behaviour in (k) to (m) fails the phase.
- **Phase 5 - record.** The Ways of working Project note gains a line for this workstream; the pilot result, role steps included, goes into the Phase 1 record before it is accepted.

**Not in scope:** writing to native sessions through the app-server (`thread/name/set` or any other write) beyond the owner's own hand rename; arbitrary vendor metadata; any role in a native name, title or vendor field; ChatGPT chat (non-Codex) binding beyond paste; Claude Desktop and web; moving bindings between hosts (they are rebuilt on each host; GOV-189 owns moves); changing `ki agent` runs, queues or reports beyond the background-agent output style; any change to intake's acquisition contract; any coordinator ceremony for conversational threads; a separate Initiative or Project for role; settling NAME-ROOT, NAME-HOST, CONVERSATIONAL-RUN or FOOTER-PROJECTS.

### Proposed records, not captured

- ki-agentic-harness: new `KI-HARNESS-GOV` record "thread identity, role and native sessions" (Phase 1, the `ki-pmo` and `ki-checkpoint` role changes, the output-style line and the hook script in Phase 3), referencing [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md).
- tools-ki: new `KI-TOOL-KI-CLI` record "thread session bindings and role" (Phase 2, including the background-agent output style), referencing [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md).
- chezmoi: new `KB-DOTFILES-UE` record for the hook matchers, the Codex trusted-hash refresh and the scoped owner-report rule (Phase 3).
- ki-principal: no record; a line in the [Ways of working Project note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md).

## In Progress

Nothing is running.

This report is committed locally in ki-principal and **not pushed**. The brief asked for a pull and push, but the run's authority footer forbids every remote call and every push; the footer governs, so the thread decides the push. The ki-principal working tree also holds another session's untracked `+/_THREADS/desk-kit/setup-note.report.md`, left untouched.

Outstanding - no action requested now:

- The generated Codex schema sits in `/tmp/codex-schema.GXOc`, disposable.
- Whether the ChatGPT desktop app runs `~/.codex/hooks.json`, and whether Codex hook payloads carry `session_id`, are checked in pilot step (d) and (c), not before.

## Queries

### PLAN-AGREE - agree the bounded plan

**Context:** No client exposes custom metadata; only a name travels natively. The plan keeps identity in the checkpoint (key, label, role, state), native IDs in a machine-local binding under `~/.local/state/ki/threads/`, supplies identity through a launcher and the shared `SessionStart` hook, treats drift as report-only, and pilots on intake in five phases with the not-in-scope list above. Under SESSION-ROLE it now also declares role in one checkpoint field with a conversational default, delivers it with the identity line at startup, resume and compaction, resolves conflicts by owner instruction then declaration then default with a one-line question on mismatch, keeps the binding's role as a cache only, gates summary, recap, status, hold, resume and mark by role, closes the five named leaks, and verifies on intake (steps e to j) and on this coordination thread (Phase 4b).

**Query:** Do you agree the phased plan as written?

**Options:**

a) (recommended) Agree Phases 0 to 5, including the Thread role section, Phase 4b and the not-in-scope list; capture the three proposed records and start Phase 1.

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

### ROLE-FIELD - where the thread role is declared

**Context:** Neither checkpoint carries a role today; coordination is inferred from the opener, the file-name pattern and the repository's `[skills.ki-pmo]`, which covers every session in ki-principal. A front-matter field is machine-readable by the hook, travels through Git and is read at resume and re-anchoring; `ki-checkpoint` keeps a closed front-matter set, so it needs a standard change.

**Query:** Where does a thread's authoritative role live?

**Options:**

a) (recommended) An optional checkpoint front-matter field `role: conversational | coordination | state-of-play`, absent meaning conversational, coordinating values valid only where `[skills.ki-pmo]` is declared, with existing coordinating checkpoints migrated through their own updates.

b) A `Role:` line in the checkpoint's pick-up block, read by the agent but not by the hook.

c) The opener and resume line alone, with no stored field.

### ROLE-STYLE - stop the coordinator output style reaching non-coordinating sessions

**Context:** ki-principal's tracked `.claude/settings.json` gives every Claude session there, conversational threads and background agents included, the `ki-coordinator` style; this run is itself under it. Claude cannot unload a style mid-session; `claude --settings` exists but its per-session effect on `outputStyle` is not verified, and editors such as Zed start sessions without the launcher.

**Query:** How is the style confined to coordinating roles?

**Options:**

a) (recommended) Keep the repository selection, add a generated first line making the style apply only when the session's declared role is coordinating, and have `ki agent launch` start background agents with a non-coordinator style.

b) Remove the repository `outputStyle` and have `ki thread start` pass the style per session for coordinating roles, after a pilot proves `--settings` sets it; editor-started coordinating sessions then rely on the hook alone.

### ROLE-REPORT - scope the global owner-report rule

**Context:** `~/.claude/communication.md:8` and `~/.codex/AGENTS.md:16-17`, rendered by chezmoi, tell every session on every repository to end a unit of work with the owner report and reply block; this is the main route by which intake's "summary" can take coordinator form. Changing it is personal configuration under chezmoi and needs Kris's review of `chezmoi diff`.

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
╭─ run report · 2026-10-15T23:35:00Z ──────────────╮
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
- [unpushed] this report in ki-principal, committed locally, with the session-role amendment

```text
Resume KI > Model > ways of working under current ki-pmo and ki-delegation since 2026-10-15T15:09:48Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
