# [Knowledge Islands](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Charter.md) › State of play › sync-telemetry

**Run report at 21:25 BST · last mark 21:25 BST**

---

## Done

- **Found the earlier capture.** Kris raised this on 2026-10-13 in the ways-of-working thread, in the notification-strategy brief at `/Users/krisbrown/.local/state/ki/agents/ways-of-working/notify.md` (line 31): "this could end up contacting the local Observatory instance as well - if you're using Observatory, you can get something like a WebRTC channel that allows it to capture these notifications." It became [KI-PRINCIPAL-ECO-012 (pruned)](https://github.com/knowledgeislands/ki-principal/blob/506a938ebabc592dda70690c65b6c2ed318d9f09/Streams/Roadmap/KI-PRINCIPAL-ECO-012-notification-strategy-for-delegated-work.md), Notification strategy for delegated work. Kris answered all seven of its queries on 2026-10-13, including `OBS-CHANNEL` "(a) Server-Sent Events with browser notifications, not WebRTC". The record was parked and pruned on 2026-10-14 under "RC-ALL: approve all". Its decisions and four-phase plan now sit as an idea in the [Ways of working Project](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) (line 30). OpenTelemetry, metrics and multi-host sync were **not** part of that capture: this is the first time they have been raised. The only earlier mention of telemetry is a Techné open question ("what agent and workload telemetry to capture"), held under the hold in the [Agent host Project](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/agent-host/agent-host.md) (line 45).
- **Every other hit**, one line each:
  - `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/decisions.md` line 53: "possibly the local Observatory instance as a channel (for example WebRTC)".
  - `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/notify.report.md` line 18: "WebRTC is the wrong tool between a loopback server and its own page".
  - [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md), draft, next: "`ki agent` derives [an] append-only events log from each run packet". This is phase 1 of the strategy.
  - [KI-HARNESS-GOV-175](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md), draft, next: the vocabulary for the same events in `ki-delegation`.
  - [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md), draft, next: "`ki agent status` with no run name lists the live threads on this machine". This is per machine only; it has nothing on sync.
  - [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md): "Move the run's state into the tracked thread folder ... committed and pushed". This is the only record about crossing hosts.
  - `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/banner-amend.report.md` line 142: "later notification under [KI-PRINCIPAL-ECO-012 (pruned)](https://github.com/knowledgeislands/ki-principal/blob/506a938ebabc592dda70690c65b6c2ed318d9f09/Streams/Roadmap/KI-PRINCIPAL-ECO-012-notification-strategy-for-delegated-work.md)".
  - `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/design/hosts.md` line 15: "`vega` | agent-host | Ubuntu", next to sol (studio, macOS) and terra (laptop, macOS).
  - [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md), awaiting review: "named remote-access listeners ... accept connections only [from the] tailnet and loopback". This is the pattern any shared listener would follow.
  - The other telemetry hits are unrelated: 5G-EMERGE domain telemetry in the `5g-emerge-*` runs and an "OTel schema" stub in hnr. The chezmoi hits (Headroom guide, [ADR-KB-DOTFILES-007](/Users/krisbrown/.local/share/chezmoi/docs/decisions/ADR-KB-DOTFILES-007-local-tool-specific-multi-account-authentication.md)) are not about this subject. tools-mgit, mcp-git-audit and tools-rig have no telemetry or notification hits.
- **What already exists for cross-host sync and observation:**
  - The personal rule: fetch, check status and level the checkouts before working on another machine (`/Users/krisbrown/.claude/CLAUDE.md`, source `~/.local/share/chezmoi/dot_claude/private_CLAUDE.md.tmpl`). It is followed by hand; nothing checks it.
  - `ki-git` uses the primary checkout by default (`/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-git/references/standards-git.md` lines 47-78) and names the integration host and checkout. It has no ahead/behind step.
  - `mcp-git-audit` already reports branch, status and ahead/behind for up to 16 roots in one read-only call (`git_repos_audit_roots`). It compares against the last fetched remote state and does not fetch.
  - `mgit` runs any Git command, including `fetch`, across a repository set.
  - The Observatory (`/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local`) runs per machine and only on loopback, at `127.0.0.1:1675`. It refuses any request whose Host is not loopback. Its Repositories instrument already flags "unpushed ... behind" and offers governed fetch, pull and push. Its Automation instrument reads `history.jsonl`, and its Rig instrument reports drift.
  - `rig doctor` checks machine tooling, not Git.
  - `ki agent status` is per machine.
  - So everything needed for stage 1 exists, but nothing runs it at session start or at a mark, and nothing compares hosts.
- Nothing was edited, committed, installed or sent. The search was read only.

### Proposed design (one page)

**Stage 1: sync discipline now (no new code).**

- Add one _level check_ to the `ki-pmo` re-anchoring and mark steps, and to the start of any session on a host other than the one that last changed a repository:
  - run `mgit fetch` over the registered estate (or the thread's territory);
  - read ahead/behind and dirty state with `mcp-git-audit` `git_repos_audit_roots`.
- Report the result as banner items `[behind] <n> repos` or `[unpushed] <n> repos` with the repository names. A thread does not start work in a repository that is behind until it has pulled.
- At every mark, and before leaving a host, the thread pushes what it is authorised to push, or names it in the pending handoff, as the personal rule already says.
- Owner: the harness (`ki-pmo` and `ki-delegation`). The nearest record is [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md): add "level before resume and at every mark" to its proposed rule, so no new record is needed.
- If the check proves too slow or noisy as a skill step, `ki repo` would need a `level` subcommand: a fetch plus ahead/behind across the selected repositories, as JSON. That would be a **new tools-ki record**; none exists today.

**Stage 2: telemetry (defer).**

- Shape:
  - One OpenTelemetry Collector per host, declared as a Rig service, listening on `127.0.0.1:4318` (OTLP over HTTP) and writing to a file under `~/.local/state/ki/telemetry/`.
  - Emitters: `ki agent`, with one span per run from launch to `DONE` and the event kinds from [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md); `rig apply` and `rig doctor` results; and the stage 1 level check as a gauge, which replaces Git hooks. Hooks would clash with each repository's husky setup.
  - The Observatory reads the file as a new instrument, the same way Automation reads `history.jsonl`, so its loopback promise holds.
  - Cross-host aggregation means a collector forwarding to a tailnet-only listener under the [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md) pattern. That is a firewall change, so it needs a rollout plan with a tested restore path under the connection-critical rule.
- Why defer:
  - Which agent telemetry to capture is an open Techné question under the [Techne Programme Hold](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Policies/Techne%20Programme%20Hold.md). An aggregator on vega, the agent host, would be remote-environment management.
  - The events log in [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md) already gives most of the value locally, without OTLP.
- Records: none exists. This stage would need **three new records**: a tools-ki emitter, a Rig collector service and an Observatory instrument. Do not capture them until the hold is reshaped.

**Stage 3: notification and state channel.**

- Already decided, 2026-10-13: Server-Sent Events from each Observatory backend to its own page, not WebRTC.
- Across hosts:
  - **WebRTC** adds nothing. The tailnet already gives every host a direct path, and WebRTC would still need a signalling server.
  - **A WebSocket or `tailscale serve` endpoint on the Observatory** would break its loopback-only Host promise.
  - **An ntfy-style pub/sub server** fits: one small service on sol (always on, not Techné), tailnet-only, with a topic per territory. Each host's notifier (strategy phase 2) publishes events to it. It speaks Server-Sent Events and JSON streams natively. It also reaches the phone, as Telegram does.
- Recommendation: ntfy on sol.
  - Each Observatory backend subscribes outbound and relays to its page over its existing Server-Sent Events path.
  - Threads consume it through `ki agent wait --next`, by adding the subscribed feed as an event source beside the local `events.jsonl`, at their next turn and never in the foreground.
  - Git stays the record of truth; messages carry summaries, identifiers and links only.
- Owners: this is the strategy's "generic push" adapter (phase 4), brought forward and made tailnet-local. It goes behind the same `deliver(event, destination)` contract, after [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md) lands. No new record is needed until phase 2 is handed. The tailnet listener follows the [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md) pattern under the connection-critical rule.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- Phase 1 of the notification strategy is waiting on [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md) in tools-ki and [KI-HARNESS-GOV-175](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md) in the harness. Both are draft, next.
- [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md) is awaiting review in tools-rig. Every tailnet-only listener in stages 2 and 3 depends on it.

## Queries

### SYNC-GUARD - Where the stage 1 level check lives

**Context:** Every tool the check needs already exists: `mgit fetch` plus `mcp-git-audit` ahead/behind, and the Observatory's Repositories instrument on each machine. Nothing runs them at session start or at a mark. [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md) is the only record about crossing hosts.

**Query:** Should the level check be a harness rule folded into [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md), or a new `ki repo` command?

**Options:**

a) (recommended) Fold "level before resume and at every mark" into [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md), using `mgit fetch` and `mcp-git-audit`, with `[behind]` and `[unpushed]` banner items. Capture a tools-ki `ki repo level` record only if this proves too slow.

b) Capture a new tools-ki record for a `ki repo level` command now and make the rule call it.

c) Rely on each machine's Observatory Repositories instrument and add no rule.

### CHANNEL-TELEMETRY - Cross-host channel and telemetry timing

**Context:** On 2026-10-13 Kris chose Server-Sent Events over WebRTC for the Observatory and its page. Across hosts, WebRTC adds nothing on a tailnet, and opening the Observatory beyond loopback breaks its promise. An ntfy-style server on sol, tailnet-only, slots in as the strategy's generic-push adapter. OTLP telemetry needs three new records and touches a question held under the Techne Programme Hold.

**Query:** Should the cross-host channel be ntfy on sol, with OTLP telemetry deferred until the hold is reshaped?

**Options:**

a) (recommended) Make ntfy on sol, tailnet-only, the cross-host channel. Bring it in as the generic-push adapter behind [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md) when phase 2 is handed, consumed by each Observatory over Server-Sent Events and by threads through `ki agent wait --next`. Defer OTLP until the Techne hold is reshaped.

b) Do (a), and also capture the three telemetry records now (tools-ki emitter, Rig collector, Observatory instrument), with loopback-only collectors.

c) Use WebRTC between the hosts' Observatories.

```text
SYNC-GUARD

Fold "level before resume and at every mark" into KI-HARNESS-GOV-189: mgit fetch then mcp-git-audit ahead/behind across the estate at session start, at every mark and before leaving a host, with [behind] and [unpushed] banner items; capture a tools-ki `ki repo level` record only if that proves too slow.

---

CHANNEL-TELEMETRY

Make ntfy on sol, tailnet-only, the cross-host notification and state channel: the generic-push adapter behind KI-TOOL-KI-CLI-123, brought in when phase 2 of the notification strategy is handed, consumed by each Observatory over Server-Sent Events and by threads through `ki agent wait --next`; defer OTLP telemetry until the Techne Programme Hold is reshaped.
```

```text
╭─ run report · 2026-10-14T20:24:38Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] SYNC-GUARD
- [waiting] CHANNEL-TELEMETRY
