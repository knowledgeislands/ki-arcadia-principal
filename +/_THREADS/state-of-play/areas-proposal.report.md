# [Knowledge Islands](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Charter.md) › State of play › areas-proposal

**Run report at 21:53 BST · last mark 21:19 BST**

---

## Done

- **Read only. Nothing was edited, committed or pushed.** Sources: [Projects](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/Projects.md), [Initiatives](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/Initiatives.md), the Project notes for [command-centre](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/command-centre.md), [agent-host](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/agent-host/agent-host.md), [mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md), [baseline-rollout](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/baseline-rollout.md), [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) and [delta-evaluation](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/delta-evaluation.md), the [Project registry standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-work/references/standards-project-registry.md), [Ideas and graduation](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-work-roadmap/references/standards-repository-roadmaps.md), the [ki-pmo standard](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/references/standards-pmo.md) and [sync-telemetry](/Users/krisbrown/.local/state/ki/agents/state-of-play/sync-telemetry.report.md).
- **There is no observatory Project note.** The Observatory appears only in command-centre's Outcome and in Notes in other Projects.
- **The bridge documentation is [PDR-KI-OBSERVA-001](/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/docs/decisions/PDR-KI-OBSERVA-001-observatory-beacon-and-bridge.md), "Observatory, Beacon, and Bridge".** It describes three concepts:
  - Instruments observe and are read-only.
  - The Beacon ranks what deserves attention.
  - The Bridge is the command side: governed operations with a capability tier, confirmation and a receipt. Rig is "the first Bridge aspect", and "further aspects are expected".
  - [PDR-KI-OBSERVA-006](/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/docs/decisions/PDR-KI-OBSERVA-006-live-artifacts-speak-the-mcp-apps-bridge.md) uses "bridge" in a different sense, the MCP Apps bridge, and is not relevant here.
- **command-centre and the Observatory are one thing seen from two sides.** command-centre already lists "the Observatory Beacon and Bridge" among the concepts it unifies, and its cheapest pilot is "an Observatory Instrument". command-centre supplies the model and vocabulary; the Observatory is where that model runs on each host.
- **The existing rules already support most of the pattern.** A Project's `## Notes` holds untracked ideas until they pass the graduation test. A Project may have a `design/` folder. `planned` is a valid lifecycle. A dormant Project needs no thread. [delta-evaluation](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/delta-evaluation.md) is already an evaluation Project: its Outcome is a decision.

### 1. Evaluation-stage Projects

- **Shape.** An evaluation-stage Project is an ordinary registry Project. It needs no new note type, so nothing new is added to the standard.
  - Its `lifecycle` is `planned`.
  - Its Outcome is a decision, in the form "Kris decides whether and how ...", with a test such as "a decision exists with its durable owner named".
- **Where ideas live.** Ideas go in `## Notes` as bullets with no identifier, horizon or status. Longer research goes in the Project's `design/` folder. Research runs dispatched by state-of-play land their output there, never as records.
- **No records.** An evaluation-stage Project has no roadmap records. An idea becomes a record only when it passes the existing graduation test: it is actionable, or it is a decision with an owner and a date, and it names the owning repository.
- **No thread.** It has no coordination thread and no checkpoint. Its work is done by bounded research runs that state-of-play dispatches.
- **Threshold for opening one.** All three conditions must hold:
  - a) No existing Project's Outcome can hold the topic, even after a one-line widening.
  - b) The topic needs a decision of its own, not just a note.
  - c) Kris has asked for it, or at least two research runs have already produced material for it.
  - Otherwise the idea goes in the nearest Project's Notes, or in the Initiative's Notes if no Project fits.
- **Staying few.** At most one evaluation-stage Project per Initiative at a time, and three across the territory. A new one must fold or graduate an old one, or Kris must lift the cap.
- **Graduating.** Once Kris takes the decision, the Project moves to `active`, rewrites its Outcome as a delivery outcome, adopts its first records and may get a thread within the cap.
- **Folding.** If the decision is "not now", the ideas move into a sibling Project or the Initiative's Notes, and the Project is cancelled after a two-line close-out assessment. Any Project that has had no update for 30 days is reviewed at the next state-of-play mark.

### 2. Project map

| Topic | Home | Initiative | Change | One-line remit |
|---|---|---|---|---|
| Observatory as host command centre | [command-centre](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/command-centre.md) | Knowledge Islands model | **Merge**: reshape its Outcome; keep the slug | One model, and the Observatory on each host as its surface: Instruments, Beacon, Bridge and the state-of-play view as an Instrument. `apps-observatory` keeps product ownership. |
| Inter-agent pub-sub communication | command-centre | Knowledge Islands model | **Absorb** into Notes | Transport: an on-machine bus in each host's Observatory, peered across the tailnet. Decide whether to use ntfy as an interim tool and what the decentralised system should be. |
| Thread event contract (`ki agent` events, `wait --next`) | [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) | Knowledge Islands model | No change | The events that the transport carries. [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md) and [KI-HARNESS-GOV-175](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md) stay here, as does SYNC-GUARD in [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md). |
| Setting up and addressing hosts on the tailnet | **New: `host-network`** | [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) | Evaluation-stage, `planned` | Naming hosts and services, name URLs rather than IP:port, tailnet ACLs, and tailnet-only listeners. Builds on [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md) and takes in Paperclip's naming need from Decision 181. Every change is connection-critical. |
| AI-tooling observability (OTLP) | **New: `ai-observability`** | [Platform foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md) | Evaluation-stage, `planned` | Metrics from Claude Code, Codex and `ki agent` use. A loopback collector on each host, with an Observatory Instrument reading it. Local-first, so it stays outside the Techne Programme Hold until cross-host aggregation reaches `vega`. |
| `sol` and `vega` as hosts | [mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md), [agent-host](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/agent-host/agent-host.md) | Rig, Techne | No change | The build of each machine. Network matters go to `host-network`. When mac-studio-bootstrap closes, its `hosts.md` moves to `host-network`. |
| Baseline | [baseline-rollout](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/baseline-rollout.md) | Platform foundations | No change | Nothing new to absorb. |

- **Net effect:** one merge that needs no new note, and two new `planned` Projects. That reaches the cap of one evaluation-stage Project in Rig and one in Platform foundations.
- **delta-evaluation** is already `paused`. Under the cap, Techne's slot is that Project.

### 3. How state-of-play dispatches

- **Classify.** Every item that arrives is checked against the Outcome lines in [Projects](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/Projects.md).
- **Project has an active thread.** state-of-play writes a dated direction into that Project's checkpoint and nudges the thread if it is on this machine. state-of-play itself does nothing more.
- **Project has no thread** (evaluation-stage or dormant). state-of-play launches a bounded research run in its own run. The output lands in the Project note's Notes or `design/` folder, committed by explicit path.
- **No Project fits.** state-of-play applies the threshold in section 1. It either adds a Notes bullet to the nearest Project or the Initiative, or raises a query proposing a new Project.
- **What state-of-play keeps.** Only decisions that touch more than one Project, priorities, releases and the queue of up to three or four threads.
- **The checkpoint-message pilot.** This is the existing [Directions from the state-of-play thread](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/references/standards-pmo.md) rule, plus Kris's 14 October wish ("adding something at the top of its checkpoint").
  - The `From the state-of-play thread` section goes first in the checkpoint. Each direction is dated and names its sender.
  - The receiving thread reads it at re-bootstrap, at each recap and before launching work, and removes each direction once it has acted on it.
  - The checkpoint lives in Git, so the pilot crosses hosts only if both sides pull and push. That makes SYNC-GUARD's level check a prerequisite.
  - Pilot it on mac-studio-bootstrap, which already has three waiting directions: GATE-FIX, RIG-SOL-BREW and RIG-SOL-TELEGRAM. It succeeds if all three are absorbed and removed at `sol`'s next wake.
  - If it works, ways-of-working adds "first section" to that ki-pmo rule. A future pub-sub channel would only nudge; the checkpoint stays the source of truth.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- The decision on ntfy in the sync-telemetry run's CHANNEL-TELEMETRY moves into command-centre's Notes as one of its evaluation questions if OBS-MERGE is accepted.
- [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md) is still awaiting review, and every tailnet listener depends on it.

## Queries

### AREAS-PATTERN - How new evaluation areas are held

**Context:** Kris wants new areas held as Projects full of ideas but without roadmap records, and without "hundreds of projects". The registry standard already allows a `planned` Project whose Notes and `design/` folder hold the ideas, and delta-evaluation already works this way. What is missing is a written threshold, a cap and rules for graduating or folding.

**Query:** Should the evaluation-stage pattern in section 1 become the rule?

**Options:**

a) (recommended) Adopt section 1 as written: a `planned` Project whose Outcome is a decision, with ideas kept in Notes or `design/` and no records or thread. It opens only when all three threshold conditions hold, with at most one per Initiative and three across the territory, and it graduates to `active` or folds after a close-out. ways-of-working writes this into the `ki-work` Project registry standard under an existing record.

b) Do (a) without the numeric cap, and have state-of-play review the evaluation-stage Projects at each mark instead.

### OBS-MERGE - Observatory and command-centre as one Project

**Context:** command-centre already lists the Observatory Beacon and Bridge among its concepts, and its first pilot is an Observatory Instrument. PDR-KI-OBSERVA-001 makes the Bridge the Observatory's command side, with Rig as its first aspect, which already matches "the Observatory as host command centre". Kris wants inter-agent pub-sub to run through the Observatory on each host and across the tailnet.

**Query:** Should command-centre absorb the Observatory-as-command-centre topic and inter-agent communication, instead of a separate observatory Project?

**Options:**

a) (recommended) Keep one Project, `command-centre`. Reshape its Outcome so the model is realised as the Observatory on each host (Instruments, Beacon, Bridge, a state-of-play Instrument and a per-host communication endpoint peered over the tailnet), with ntfy as the interim question in its Notes. ways-of-working keeps the event contract, and `apps-observatory` keeps product ownership.

b) Open a separate `observatory` Project under Platform foundations for the product and its communication, leaving command-centre as vocabulary and the read-only view only.

### NEW-AREAS - Host network and AI observability

**Context:** Kris asked for AI-tooling observability (OTLP) as its own Project under Platform foundations, and said that setting up and addressing hosts "needs its own thought". Both topics have ideas but no records. Host network spans `terra`, `sol` and `vega`, so it fits neither mac-studio-bootstrap nor agent-host. It also needs the naming scheme Paperclip is waiting for, and KI-TOOL-RIG-CORE-047's listener pattern.

**Query:** Should both open now as evaluation-stage Projects?

**Options:**

a) (recommended) Open `host-network` under Rig and `ai-observability` under Platform foundations, both `planned`, each with an Outcome that is a decision. Seed each one's Notes from sync-telemetry and Decision 181 through one ki-principal commit. Open no thread for either.

b) Open only `ai-observability` now, and hold host network as Notes in the Rig Initiative until a research run meets the threshold.

```text
AREAS-PATTERN

Adopt the evaluation-stage pattern as written in areas-proposal section 1: a planned Project whose Outcome is a decision, with ideas kept in Notes or design/ and no records or thread. It opens only when all three threshold conditions hold, with at most one per Initiative and three across the territory, and it graduates to active or folds after a close-out. ways-of-working writes this into the ki-work Project registry standard under an existing record.

---

OBS-MERGE

Keep one Project, command-centre, and do not open an observatory Project. Reshape its Outcome so the model is realised as the Observatory on each host (Instruments, Beacon, Bridge, a state-of-play Instrument and a per-host communication endpoint peered over the tailnet), with ntfy as the interim question in its Notes. ways-of-working keeps the event contract (KI-TOOL-KI-CLI-123, KI-HARNESS-GOV-175), and apps-observatory keeps product ownership.

---

NEW-AREAS

Open host-network under Rig and ai-observability under Platform foundations as planned evaluation-stage Projects, each with an Outcome that is a decision. Seed each one's Notes from the sync-telemetry report and Decision 181's naming need (host-network) through one ki-principal commit by explicit path. Open no thread for either.
```

```text
╭─ run report · 2026-10-14T20:53:00Z ──────────────╮
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
