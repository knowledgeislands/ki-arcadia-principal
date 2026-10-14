# [Knowledge Islands](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Charter.md) › State of play › areas-tokens

**Run report at 21:58 BST · last mark 21:19 BST**

---

## Done

- **This run only read files. Nothing was edited, committed or pushed.** It adds to [areas-proposal](/Users/krisbrown/.local/state/ki/agents/state-of-play/areas-proposal.report.md) and [areas-glass](/Users/krisbrown/.local/state/ki/agents/state-of-play/areas-glass.report.md). It works under Kris's words of 14 October in [decisions.md](/Users/krisbrown/.local/state/ki/agents/state-of-play/decisions.md): token economics belongs in the command centre, Observatory, OTLP and pub-sub picture. It also uses Kris's 21:2x instruction after the Fable limit: "If any of our threads get stuck, change to claude-opus-5-5 at the same effort, at least until the next reset."
- **No roadmap record measures token use today.** I searched the ki-principal, tools-ki, ki-agentic-harness, apps-observatory, tools-rig and chezmoi roadmaps. None covers per-run usage, account limits or a model fallback.

### What already measures or shapes token use

| Source | What it gives today | Gap |
|---|---|---|
| [claude-swap](/Users/krisbrown/.local/share/chezmoi/docs/guides/tools/ai-multi-account.md) (`service:claude-swap-auto`, under [ADR-KB-DOTFILES-007](/Users/krisbrown/.local/share/chezmoi/docs/decisions/ADR-KB-DOTFILES-007-local-tool-specific-multi-account-authentication.md)) | It polls Anthropic's usage endpoint every minute and reads each Claude account's 5-hour and 7-day windows. It switches accounts at 90 %, starting with the account whose weekly window resets soonest. `cswap list` and `status` show the weekly reset times. This is the only place on the host that already knows Claude account limits and reset times. | Its output is text only (`cswap help` shows no JSON form). It works per host and per account, never per run. A switch reaches an open session only after a restart, so a detached `claude -p` run that hits the limit stops and is not moved. That is probably what happened today. |
| [CodexBar](/Users/krisbrown/.local/share/chezmoi/docs/guides/tools/ai-multi-account.md) | `CodexBarCLI usage --provider codex --source cli --format json` returns Codex session and weekly usage as JSON. | Codex only. Per account, not per run. |
| [Headroom proxy](/Users/krisbrown/.local/share/chezmoi/docs/guides/tools/headroom.md) | Every Claude Code and Codex request passes through `127.0.0.1:8787`. It runs in `--mode token` with compression, output shaping and the effort router, so it shapes use as well as seeing it. It keeps proxy statistics and project buckets, such as `chatgpt-codex`. | It runs with `--no-telemetry`, and it cannot tell which `ki agent` run or thread sent a request. Any change to it is connection-critical under Decision 169. It is a cross-check, not the first meter. |
| `ki agent` run packets under `/Users/krisbrown/.local/state/ki/agents/` | The queue carries `--model` and `--effort` for each agent, and dispatch has `--max` for concurrency. | The Claude adapter in [runtimes.ts](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/src/core/agent/runtimes.ts) launches `claude -p` with plain-text output, so `<agent>.log` holds only the final text: no tokens, no cost, no model actually used, and no reason why a run stopped. A limit hit looks the same as any other early exit. Dispatch has no fallback model. |
| [mcp-housekeeping-claude](/Users/krisbrown/workspaces/knowledge-islands/mcp-housekeeping-claude/README.md) and [mcp-housekeeping-chatgpt](/Users/krisbrown/workspaces/knowledge-islands/mcp-housekeeping-chatgpt/README.md) | Storage summaries cover disk use, counts, backups and memory spaces. The session listers are provenance tools. | Their READMEs list no token or cost tool. These are disk economics, not token economics. |
| [ki-tokenomics](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/environment/ki-tokenomics/SKILL.md) and its [standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/environment/ki-tokenomics/references/standards-tokenomics.md) | Context budgets and model-purpose policy: `fast`, `standard`, `reasoning` and `frontier`. A coordinator runs on `fast` at low effort and moves up one step rather than doing work itself. Estimates are labelled `~` and are never billing figures. | It sets policy on what each purpose should use. It has nothing on what was actually consumed, account windows, or what to do when a provider limit is reached. |
| Claude Code's own output | Print mode can emit a JSON result, and Claude Code can export OpenTelemetry metrics, including token and cost counters. | I did not check either against the installed version. `ki agent` uses neither today. |

### Where token economics sits in the Project map

Token economics splits into three parts: measure, show and act. Each part goes to a Project that already exists or is already proposed, so no new Project is needed and areas-proposal's threshold condition a) fails.

| Part | Home | Remit |
|---|---|---|
| Measure | `ai-observability` (proposed in NEW-AREAS), [Platform foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md) | Tokens, cost, model and stop reason per run. Account windows and reset times per host. Later, OTLP from Claude Code and Codex into a loopback collector, with Headroom statistics as a cross-check. Its Outcome decision widens to "how use is measured and attributed". |
| Show | [command-centre](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/command-centre.md), the Sessions Instrument from OBS-MERGE | Per-run and per-thread totals beside each session, account windows with their reset times, and Beacon attention when a window passes 90 % or a run stops on a limit. Read-only, as areas-glass set out. |
| Act | [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) (contract), with `ki-tokenomics` holding policy and tools-ki holding the mechanism | The fallback ladder for each model purpose, the concurrency gate, and the stop reasons a run reports. |

### The smallest first slice

- **Step 1: record usage for each run. This adds requirements to existing records and creates no new record.**
  - [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md) gains two things:
    - the `done` and `failed` events carry `usage`: input, output and cache tokens, the cost estimate labelled `~`, and the model actually used;
    - `failed` gains a `limit` reason that carries the reset time where the runtime reports one.
  - The Claude adapter reads these from print mode's JSON result and the Codex adapter from `codex exec`'s JSON. The final text still goes to `<agent>.log`, so reports are unchanged. Both forms need checking against the installed versions first.
- **Step 2: account windows.**
  - The Instrument reads the account windows from claude-swap's existing poll and CodexBar's JSON. This adds no new call to Anthropic or OpenAI.
  - claude-swap's output is text only, so this slice either parses `cswap list` defensively or reads the usage state it already keeps on disk. In both cases a missing or changed format degrades and says so.
- **Step 3: show it in the glass.**
  - [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md)'s `--json` listing, already asked for in areas-glass, carries each run's usage and each thread's total, grouped by `thread.json`.
  - The Sessions Instrument shows those totals and, for each account, its 5-hour and 7-day percentages with their reset times. A limit stop ranks on the Beacon.
- **Not in the first slice:**
  - OTLP and a collector, which wait for ai-observability's decision;
  - any change to Headroom, which is connection-critical;
  - cross-host totals, so `sol` shows only on `sol` until the tailnet transport exists;
  - billing reconciliation.

### How it feeds dispatch choices

- **Model fallback.**
  - Kris's 21:2x rule becomes a ladder for each model purpose in `ki-tokenomics`, for example `frontier`: Fable, then Opus 5.5 at the same effort.
  - When a run fails with the `limit` reason, `ki agent dispatch` relaunches it on the next rung with the same prompt and effort, and returns to the first rung after the reported reset time.
  - Until step 1 lands, the thread applies the rule by hand, as Kris instructed.
  - Overload fallback in print mode, if the installed version has it, is a separate case: it covers a busy service, not a spent account.
- **Concurrency.**
  - Dispatch's `--max`, about three per thread, becomes a ceiling rather than a fixed value. Dispatch lowers it as the active account's 5-hour window fills and holds the queue when every account is above the 90 % threshold.
  - A held queue shows as "held until <reset time>", never as a silent stall.
  - Dispatch never switches accounts itself, so it cannot work against claude-swap's consume-first rotation. It only reads the windows.
- **Purpose evidence.** Per-run usage grouped by model purpose shows whether `reasoning` or `frontier` effort is going on mechanical work. That gives `ki-tokenomics` measured evidence where today it has only `~` estimates.
- **Host choice.** Today `sol` stopped because its account ran out. Once windows are visible on each host, state-of-play can place a run on the host whose account has headroom. Seeing this across hosts waits on command-centre's transport question.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- Until the fallback is automated, coordinating threads apply Kris's 21:2x rule by hand: a run stopped by a Fable limit is relaunched on claude-opus-5-5 at the same effort until the next reset. ways-of-working can write the rule into `ki-tokenomics` under an existing record. It needs no new record.
- Print mode's JSON result fields, `codex exec`'s JSON fields, the overload-fallback flag and Claude Code's OpenTelemetry settings are all unverified against the installed versions. Step 1's implementer checks them first.
- [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md) is still awaiting review, and every tailnet listener depends on it, including any later cross-host usage feed.
- The question of ntfy as an interim channel, raised as CHANNEL-TELEMETRY in the sync-telemetry run, moves into command-centre's Notes if OBS-MERGE is accepted.

## Queries

There are still three queries. AREAS-PATTERN is unchanged. OBS-MERGE adds usage and account windows to the Sessions Instrument. NEW-AREAS folds token economics into ai-observability and takes on the first slice and the dispatch rules.

### AREAS-PATTERN - How evaluation areas are held

**Context:** Kris wants new areas held as Projects full of ideas but without roadmap records, and without "hundreds of projects". The registry standard already allows a `planned` Project whose Notes and `design/` folder hold the ideas, and [delta-evaluation](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/delta-evaluation.md) already works this way. What is missing is a written threshold, a cap and rules for graduating or folding. Token economics needs no Project of its own under this threshold.

**Query:** Should the evaluation-stage pattern in areas-proposal section 1 become the rule?

**Options:**

a) (recommended) Adopt section 1 as written: a `planned` Project whose Outcome is a decision, with ideas kept in Notes or `design/` and no records or thread. It opens only when all three threshold conditions hold, with at most one per Initiative and three across the territory, and it graduates to `active` or folds after a close-out. ways-of-working writes this into the `ki-work` Project registry standard under an existing record.

b) Do (a) without the numeric cap, and have state-of-play review the evaluation-stage Projects at each mark instead.

### OBS-MERGE - command-centre holds the Observatory, the glass and agent advertisement

**Context:** [command-centre](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/command-centre.md) already lists the Observatory Beacon and Bridge among its concepts and promises "one read-only state-of-play view". Kris wants a single pane of glass over every agentic session, where agents advertise themselves, but not as a harness GUI. Today's Fable limit and `sol`'s spent account show that the glass also needs each run's token use and each account's limits and reset times. claude-swap and CodexBar already read those on each host.

**Query:** Should command-centre absorb the Observatory as command centre, inter-agent communication, the single pane of glass and agent advertisement, with the Sessions Instrument also showing usage and account windows?

**Options:**

a) (recommended) Keep one Project, `command-centre`, and reshape its Outcome so the model is realised as the Observatory on each host:

- Instruments, Beacon and Bridge.
- A read-only "Sessions" Instrument as the single pane of glass. It shows per-run and per-thread token use and each account's 5-hour and 7-day windows with reset times, and a limit stop ranks on the Beacon. It is never a harness GUI.
- A per-host communication endpoint peered over the tailnet later.
- Notes holding ntfy as the interim question.

ways-of-working keeps the event contract, including the advertisement and usage fields. It asks tools-ki to add a `--json` listing to item 1 of KI-TOOL-KI-CLI-127. `apps-observatory` keeps product ownership and takes the Sessions Instrument as a record once the Outcome is reshaped.

b) Do (a) but defer the glass: record it only as a command-centre Notes bullet until KI-TOOL-KI-CLI-127 and KI-TOOL-KI-CLI-123 are delivered.

c) Open a separate `observatory` Project under Platform foundations for the product, the glass and communication, leaving command-centre as vocabulary only.

### NEW-AREAS - Host network, and AI observability with token economics

**Context:** Kris asked for AI-tooling observability (OTLP) as its own Project under Platform foundations, and added that token economics must be part of the picture. Today a Fable limit stopped work, and `sol` stopped when its account ran out. No record measures token use. `ki agent` keeps no usage or stop reason. claude-swap and CodexBar already know each account's windows. `ki-tokenomics` has model-purpose policy but no fallback. Host network still needs its own thought, together with the naming scheme Paperclip is waiting for and [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md).

**Query:** Should both Projects open now as evaluation-stage Projects, with token economics in ai-observability and the first slice and dispatch rules carried on existing records?

**Options:**

a) (recommended) Open `host-network` under Rig and `ai-observability` under Platform foundations, both `planned`, each with an Outcome that is a decision. ai-observability's decision covers how token use is measured and attributed per run, per thread and per account, OTLP included. Before that decision, ways-of-working carries the first slice on existing records:

- usage and a `limit` stop reason in [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md)'s events;
- totals for each run and thread in [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md)'s `--json` listing;
- a fallback ladder for each model purpose and a concurrency gate driven by account windows in `ki-tokenomics`, starting from Kris's "claude-opus-5-5 at the same effort until the next reset".

Seed both Projects' Notes through one ki-principal commit by explicit path, and open no thread for either.

b) Do (a) but leave the dispatch rules manual: coordinating threads apply the fallback by hand and concurrency stays fixed until ai-observability's decision.

c) Open only `ai-observability` now, with token economics, and hold host network as Notes in the Rig Initiative until a research run meets the threshold.

```text
AREAS-PATTERN

Adopt the evaluation-stage pattern as written in areas-proposal section 1: a planned Project whose Outcome is a decision, with ideas kept in Notes or design/ and no records or thread. It opens only when all three threshold conditions hold, with at most one per Initiative and three across the territory, and it graduates to active or folds after a close-out. ways-of-working writes this into the ki-work Project registry standard under an existing record.

---

OBS-MERGE

Keep one Project, command-centre, and do not open an observatory Project. Reshape its Outcome so the model is realised as the Observatory on each host: Instruments, Beacon and Bridge; a read-only Sessions Instrument as the single pane of glass over this machine's ki agent runs and live Claude Code sessions (metadata only, never a harness GUI, no acting on sessions), showing per-run and per-thread token use and each account's 5-hour and 7-day windows with reset times, with a limit stop ranked on the Beacon; a per-host communication endpoint peered over the tailnet later; ntfy as the interim question in its Notes. ways-of-working keeps the event contract (KI-TOOL-KI-CLI-123, KI-HARNESS-GOV-175) including the agent-advertisement and usage fields, and asks tools-ki to add a --json listing to item 1 of KI-TOOL-KI-CLI-127. apps-observatory keeps product ownership and takes the Sessions Instrument as a record once the Outcome is reshaped.

---

NEW-AREAS

Open host-network under Rig and ai-observability under Platform foundations as planned evaluation-stage Projects, each with an Outcome that is a decision. ai-observability's decision covers how token use is measured and attributed per run, per thread and per account, OTLP included, with ki-tokenomics keeping policy. Before that decision, ways-of-working carries the first slice on existing records: usage and a limit stop reason in KI-TOOL-KI-CLI-123's done and failed events; per-run and per-thread totals in KI-TOOL-KI-CLI-127's --json listing; a fallback ladder for each model purpose and a concurrency gate driven by account windows in ki-tokenomics, starting from "claude-opus-5-5 at the same effort until the next reset". Seed each one's Notes from the sync-telemetry report, the areas-glass and areas-tokens reports and Decision 181's naming need (host-network) through one ki-principal commit by explicit path. Open no thread for either.
```

```text
╭─ run report · 2026-10-14T20:58:23Z ──────────────╮
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
