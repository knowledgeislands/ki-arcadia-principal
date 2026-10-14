# [Knowledge Islands](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Charter.md) › State of play › areas-glass

**Run report at 21:56 BST · last mark 21:19 BST**

---

## Done

- **Nothing was edited, committed or pushed.** This run only read files. It adds to [areas-proposal](/Users/krisbrown/.local/state/ki/agents/state-of-play/areas-proposal.report.md) under Kris's 14 October words in [decisions.md](/Users/krisbrown/.local/state/ki/agents/state-of-play/decisions.md): the single pane of glass and agents advertising themselves, plus token economics, which arrived as a later aside on the same day.

### What already exists to feed the view

- **Claude Code already advertises its live sessions on each machine.** Each live session writes a file to `/Users/krisbrown/.claude/sessions/<pid>.json`, holding `name`, `cwd`, `status` (`busy` or `idle`), `startedAt`, `sessionId`, `entrypoint` and a peer-messaging socket. At 21:54 BST there were 17: 8 busy and 9 idle, all named, all with entrypoint `sdk-ts`. Zed's sessions should be among them, but I have not proved that the `sdk-ts` entries come from Zed rather than from `ki agent` launches. The format is internal to Claude Code and undocumented, so it may change. This is also the substrate behind Claude Code's own cross-session listing, the in-session `ListAgents` tool.
- **`ki agent` run folders cover the KI runs.** Each run under `/Users/krisbrown/.local/state/ki/agents/` has per-agent `.pid`, `.status` (the one-line progress protocol), `.report.md`, `DONE` and `queue.jsonl` files. 14 runs also carry `thread.json`, which names the repository and thread folder. Today `ki agent status` requires a run name.
- **[KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md)** (draft, next, ways-of-working). Its item 1 is `ki agent status` with no run name, listing this machine's live threads and agents from packet files only. That is the KI half of the glass. It specifies no machine-readable output.
- **[KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md)** (draft, next). It adds an append-only `events.jsonl` per run, with `progress`, `done`, `failed`, `blocked` and `needs-owner` events. That is the feed a view would show as "what needs Kris". The record explicitly puts the Observatory out of its scope, in later phases.
- **The session listers are history tools, not presence tools.** [mcp-housekeeping-claude](/Users/krisbrown/workspaces/knowledge-islands/mcp-housekeeping-claude/README.md) has `claude_code_sessions_list` and `claude_code_projects_list`. [mcp-housekeeping-chatgpt](/Users/krisbrown/workspaces/knowledge-islands/mcp-housekeeping-chatgpt/README.md) has `codex_sessions_list` and `chatgpt_sessions_list`. They are content-minimised provenance tools for acquisition and cleanup. None of them says which session is live now. Codex has no live-session registry that I found.
- **The Observatory has 12 Instruments, and none looks at agents or sessions** ([README](/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/README.md)). The nearest precedent is Automation, which shows how each scheduled job last ended and which jobs have stopped reporting on this machine. The rules a new instrument must follow are already written:
  - Instruments are read-only ([PDR-KI-OBSERVA-001](/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/docs/decisions/PDR-KI-OBSERVA-001-observatory-beacon-and-bridge.md)).
  - Everything works without an LLM and degrades usefully when its sources are missing ([locality](/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/docs/specs/locality.md)).
  - Every read is bounded at ten seconds ([machine-reads](/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/docs/specs/machine-reads.md)).
  - New instruments follow [add an instrument](/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/docs/guides/developer/add-an-instrument.md).
  - The Beacon already ranks attention across instruments, so a `needs-owner` event would rank there unchanged.
- **[delta-evaluation](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/delta-evaluation.md)** is paused, with its decision point on 2026-10-21. It treats Delta as a possible delivery and review interface, not as a view of what is running. A glass does not compete with it, with Zed or with Paperclip.

### Where it sits in the Project map

| Topic | Home | Change | Remit |
|---|---|---|---|
| Single pane of glass | [command-centre](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/command-centre.md) | Absorbed, no new Project | Its Outcome already promises "one read-only state-of-play view". The glass is that view, widened from threads to every agentic session on the host, and realised as an Observatory Instrument. `apps-observatory` keeps product ownership. |
| Agents advertising themselves | command-centre (model), [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) (contract) | Notes bullet only | An advertisement is what a session publishes about itself on its host: identity, repository and thread, status line and anything that needs the owner. Claude Code's session file and the `ki agent` packet already do this. ways-of-working owns the fields as part of the event contract it already holds. The future pub-sub transport carries advertisements across the tailnet, which is command-centre's Notes question. |
| Token economics | `ai-observability` (if NEW-AREAS opens it) | Outcome widened | OTLP use metrics include token and cost counts per session. The glass shows them per session once the collector exists. [ki-tokenomics](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/environment/ki-tokenomics/SKILL.md) keeps the budget and model-purpose policy. |

### The smallest first slice

- **Order:** step 1 lands before step 2, and step 3 is optional.
- **Step 1: a machine-readable live listing in [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md).**
  - Item 1 gains a `--json` form of the run-less listing. This is one requirement on an existing record, not a new record.
  - The Observatory reads `ki` the way it does today, inside its ten-second bound.
  - ways-of-working raises this as a request on that record. tools-ki owns its priority.
- **Step 2: one read-only Observatory Instrument, "Sessions", scoped to this machine.**
  - It lists the `ki agent` runs, threads and agents with their latest status lines.
  - Beside them it lists the live Claude Code sessions from the session registry, by metadata only: `name`, repository resolved from `cwd`, `busy` or `idle`, and start time. It never reads transcripts.
  - If the registry format changes or is missing, it degrades and says so.
  - Codex is shown as "not observable live" until it has a registry.
  - This becomes an `apps-observatory` record only after command-centre's decision.
- **Step 3 (optional): show the events once KI-TOOL-KI-CLI-123 lands.**
  - A `needs-owner` or `failed` event goes to the Beacon's attention ranking. No new channel is needed.

### What it must not become

- **No harness GUI.** It has no prompt box. It does not send, attach, resume, launch or stop anything, and it reads no transcripts. Zed stays where Kris talks to sessions. Paperclip stays company coordination. Delta stays an open question in delta-evaluation.
- **No acting on sessions yet.** Any operation on a session, such as stopping an agent, would be a later Bridge aspect. It would need its own decision, a capability tier and a receipt.
- **No cross-host view in the first slice.** Peering over the tailnet waits on command-centre's transport question and on [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md). Every listener there is connection-critical.
- **No second source of truth.** The checkpoint, the decisions log and the run packet stay authoritative. The glass only reflects them.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md) is still awaiting review, and every tailnet listener depends on it.
- The question of ntfy as an interim channel, raised as CHANNEL-TELEMETRY in the sync-telemetry run, moves into command-centre's Notes if OBS-MERGE is accepted.
- The `sdk-ts` attribution in the Claude Code session registry is unproven. The first slice should check which entries are Zed's before labelling them.

## Queries

AREAS-PATTERN is unchanged from areas-proposal. OBS-MERGE and NEW-AREAS are revised to fold in the glass, agent advertisement and token economics. There are still three queries.

### AREAS-PATTERN - How evaluation areas are held

**Context:** Kris wants new areas held as Projects full of ideas but without roadmap records, and without "hundreds of projects". The registry standard already allows a `planned` Project whose Notes and `design/` folder hold the ideas, and [delta-evaluation](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/delta-evaluation.md) already works this way. What is missing is a written threshold, a cap and rules for graduating or folding.

**Query:** Should the evaluation-stage pattern in areas-proposal section 1 become the rule?

**Options:**

a) (recommended) Adopt section 1 as written: a `planned` Project whose Outcome is a decision, with ideas kept in Notes or `design/` and no records or thread. It opens only when all three threshold conditions hold, with at most one per Initiative and three across the territory, and it graduates to `active` or folds after a close-out. ways-of-working writes this into the `ki-work` Project registry standard under an existing record.

b) Do (a) without the numeric cap, and have state-of-play review the evaluation-stage Projects at each mark instead.

### OBS-MERGE - command-centre holds the Observatory, the glass and agent advertisement

**Context:** [command-centre](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/command-centre.md) already lists the Observatory Beacon and Bridge among its concepts. It already promises "one read-only state-of-play view", and its first pilot is an Observatory Instrument. Kris now wants a single pane of glass over every agentic session, Zed's included, where agents advertise themselves, but not as a harness GUI. Claude Code already advertises its live sessions in `/Users/krisbrown/.claude/sessions/`. Item 1 of [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md) lists the KI runs. No new Project or record is needed to start.

**Query:** Should command-centre absorb the Observatory as command centre, inter-agent communication, the single pane of glass and agent advertisement, with the first slice above as its pilot?

**Options:**

a) (recommended) Keep one Project, `command-centre`, and reshape its Outcome so the model is realised as the Observatory on each host:

- Instruments, Beacon and Bridge.
- A read-only "Sessions" Instrument as the single pane of glass, never a harness GUI.
- A per-host communication endpoint peered over the tailnet later.
- Notes holding ntfy as the interim question.

ways-of-working keeps the event contract, including the advertisement fields. It asks tools-ki to add a `--json` listing to item 1 of KI-TOOL-KI-CLI-127. `apps-observatory` keeps product ownership and takes the Sessions Instrument as a record once the Outcome is reshaped.

b) Do (a) but defer the glass: record it only as a command-centre Notes bullet until KI-TOOL-KI-CLI-127 and KI-TOOL-KI-CLI-123 are delivered.

c) Open a separate `observatory` Project under Platform foundations for the product, the glass and communication, leaving command-centre as vocabulary only.

### NEW-AREAS - Host network, and AI observability with token economics

**Context:** Kris asked for AI-tooling observability (OTLP) as its own Project under Platform foundations. They then added that token economics must be part of the command-centre, Observatory, OTLP and pub-sub picture. They also said that setting up and addressing hosts "needs its own thought". Both areas have ideas but no records. Host network spans `terra`, `sol` and `vega`, and it needs the naming scheme Paperclip is waiting for and the listener pattern in [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md).

**Query:** Should both open now as evaluation-stage Projects, with token economics inside ai-observability's Outcome?

**Options:**

a) (recommended) Open `host-network` under Rig and `ai-observability` under Platform foundations, both `planned`, each with an Outcome that is a decision. ai-observability's decision also covers how token and cost use per session is measured and shown in the Sessions Instrument, with [ki-tokenomics](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/environment/ki-tokenomics/SKILL.md) keeping budget policy. Seed both Notes through one ki-principal commit by explicit path and open no thread.

b) Open only `ai-observability` now, with token economics, and hold host network as Notes in the Rig Initiative until a research run meets the threshold.

```text
AREAS-PATTERN

Adopt the evaluation-stage pattern as written in areas-proposal section 1: a planned Project whose Outcome is a decision, with ideas kept in Notes or design/ and no records or thread. It opens only when all three threshold conditions hold, with at most one per Initiative and three across the territory, and it graduates to active or folds after a close-out. ways-of-working writes this into the ki-work Project registry standard under an existing record.

---

OBS-MERGE

Keep one Project, command-centre, and do not open an observatory Project. Reshape its Outcome so the model is realised as the Observatory on each host: Instruments, Beacon and Bridge; a read-only Sessions Instrument as the single pane of glass over this machine's ki agent runs and live Claude Code sessions (metadata only, never a harness GUI, no acting on sessions); a per-host communication endpoint peered over the tailnet later; ntfy as the interim question in its Notes. ways-of-working keeps the event contract (KI-TOOL-KI-CLI-123, KI-HARNESS-GOV-175) including the agent-advertisement fields, and asks tools-ki to add a --json listing to item 1 of KI-TOOL-KI-CLI-127. apps-observatory keeps product ownership and takes the Sessions Instrument as a record once the Outcome is reshaped.

---

NEW-AREAS

Open host-network under Rig and ai-observability under Platform foundations as planned evaluation-stage Projects, each with an Outcome that is a decision. ai-observability's decision includes token economics: how token and cost use per session is measured and shown in the Sessions Instrument, with ki-tokenomics keeping budget policy. Seed each one's Notes from the sync-telemetry report, this areas-glass report and Decision 181's naming need (host-network) through one ki-principal commit by explicit path. Open no thread for either.
```

```text
╭─ run report · 2026-10-14T20:56:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] AREAS-PATTERN
- [waiting] OBS-MERGE
- [waiting] NEW-AREAS
