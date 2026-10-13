---
note_type: stream-roadmap
id: KI-PRINCIPAL-ECO-012
area: ECO
title: Notification strategy for delegated work
kind: deliver
purpose: capability
project: ways-of-working
horizon: next
status: draft
tags:
  - topic/knowledge-islands
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-13T08:21:34Z
updated_at: 2026-10-13T13:55:00Z
---

# Notification Strategy for Delegated Work

## Goal

Define one Knowledge Islands wide strategy for how the owner learns about delegated work - meaningful progress, completion, failure, blocked work and decisions that need the owner - from background agents launched through `ki agent`, delivered first in the coordinating thread and then through a Telegram bot for remote delivery, with Slack or other tooling as configurable alternatives, platform-native notifications as an optional channel and the local Observatory as a further channel. Repositories stay authoritative: every notification summarises an outcome and links back to the work record, checkpoint or report that owns it.

## Context

Feedback from the `Tower: regular maintenance` thread on 2026-10-13: detached agents kept working, but their progress did not reliably reach the owner. macOS Notification Centre helped but is bound to one machine and is not user-friendly enough. Kris accepted the handoff as Decision 13 of the [[ways-of-working]] run on 2026-10-13: capture one bounded roadmap item and return a recommended approach and implementation plan; Telegram preferred; coordinating-thread updates first; Slack or others configurable; platform-native optional and not the default; possibly the local Observatory as a channel; do not implement integrations yet. Interim preference: chat updates only, with local-host notifications disabled.

Today the [[ways-of-working]] practice reaches the owner only through the run packet under `~/.local/state/ki/agents/<run>/`: each agent's one-line status file, its final report and the `DONE` marker, read by `ki agent status`, `watch` and `wait --next`, and relayed by the coordinating thread in its next turn. There is no event log, no channel other than the thread and no delivery receipt. The Observatory already reads a sibling pattern, the scheduled-jobs reporter's `history.jsonl` under the XDG state directory, into its Automation instrument and the Beacon, but knows nothing of agent runs. The official Claude Code Telegram plugin is enabled in the chezmoi source but not configured; it binds a bot to one running Claude Code session for inbound messages, so a detached agent or daemon cannot send through it.

This record belongs to Knowledge Islands Principal because the strategy spans the `ki-delegation` skill, `ki agent` in `tools-ki`, the Observatory and the chezmoi user configuration, with no single repository owner; it serves the [[ways-of-working]] Project, which owns the delegation and thread practice, and hands its view to [[command-centre]]. Kris adopted it on 2026-10-13 as `ADOPT` in Decision 17 of the `ways-of-working` run, with `HOME` (a): the record stays here and each delivery is a handoff item in the repository that owns it, which keeps its own priority, plan and acceptance. Phase 1 was handed to `tools-ki` and `ki-agentic-harness` the same day; the later phases are handed when phase 1 has landed.

## Boundary

- Assessment and one record only: no integration is implemented, no notification sent, no bot created, no secret read.
- In scope: the event vocabulary, delivery rules, routing, ownership per concern, the Observatory channel and a phased plan with a smallest useful first step.
- Out of scope: inbound replies from Telegram into a thread (a later, separate decision); notifications for scheduled housekeeping runs, which already reach the Observatory's Automation instrument; Paperclip-coordinated agents.
- The coordinating thread stays out of the delivery path, under `ki-delegation` Coordinator responsiveness: a coordinator reads events at its next turn and never waits or relays in the foreground.

## Owner decisions

Kris answered the strategy's tagged questions on 2026-10-13 in Decision 17 of the `ways-of-working` run; the tags are kept so later phases can cite them.

| Tag | Decision |
| --- | --- |
| `HOME` | (a) This record stays in Knowledge Islands Principal under [[ways-of-working]]; deliveries are handed to `tools-ki`, the harness, the Observatory and chezmoi as handoff items, each receiving repository owning its priority, plan and acceptance. |
| `BOT-ID` | (a) A dedicated send-only notifier bot, not the Claude Code plugin's bot. |
| `TOKEN-HOME` | (a) The bot token lives in the macOS Keychain under the KI secret store; chezmoi carries only the reference. |
| `QUIET` | (a) `failed`, `blocked` and `needs-owner` break quiet hours; `progress` and `done` wait for the digest. |
| `OBS-CHANNEL` | (a) The Observatory delivers over Server-Sent Events with browser notifications, not WebRTC. |
| `REMOTE-SCOPE` | (a) Knowledge Islands and personal territories deliver remotely by default; every other principal opts in. |
| `ADOPT` | Adopted to `draft` through `ki-next`; phase 1 handed to `tools-ki` and the harness now. |

## Phase 1 requirements

Phase 1 is the smallest useful step and carries no integration. The receiving repositories plan it under their own authority; these are the requirements this record hands them.

1. `ki agent` derives an append-only events log per run from the run packet, with the five event kinds and the run-level close named under Recommended approach, each event carrying a stable identity of run, agent, kind and sequence.
2. `ki agent wait --next` and `ki agent watch` return `failed`, `blocked` and `needs-owner` events as well as finishes, in the order they happened.
3. The progress protocol gains the optional milestone line `HH:MM TZ - milestone: <text>`; every other status line stays local.
4. The `ki-delegation` background-run standard names the events, the milestone line, what the waiter and monitor return, and the coordinator's place outside the delivery path.
5. The waiter's order is corrected. Evidence from the `ways-of-working` run: twice on 2026-10-13 `ki agent wait --next` returned an older unseen finish rather than the newest, because the launcher walks agents in alphabetical name order and returns the first unseen one that has stopped. At 09:53 it returned `merge`, finished at 04:52, while `notify` and `report-format` had finished at 09:25 and 09:32; `review-fable` and `review-astra`, finished at 04:20 and 04:31, were never returned. A sequenced events log with the seen marker keyed by event removes the defect, so it is a phase 1 requirement rather than a separate corrective record.

## Dependencies / blocks

- `tools-ki` delivers the phase 1 mechanics: the events log, its derivation, the sequenced waiter and monitor, and the milestone line in the progress protocol the launcher appends. Durable documentation: [the tools-ki README](https://github.com/knowledgeislands/tools-ki/blob/main/README.md), which describes `ki agent`.
- `ki-agentic-harness` delivers the phase 1 wording: the event vocabulary, the milestone line, the waiter and monitor behaviour and the coordinator rule in the `ki-delegation` background-run standard and its run-prompt skeleton. Durable documentation: [the background-run standard](https://github.com/knowledgeislands/ki-agentic-harness/blob/main/skills/governance/ki-delegation/references/standards-background-runs.md).
- Phases 2 to 4 are handed to `tools-ki`, chezmoi and `apps-observatory.local` once phase 1 has landed; the Telegram bot is recorded in [[Admin/Governance/Conventions/Admin Conventions/Integrations|Integrations]] through the Enactment Process when phase 2 creates it.
- Nothing in this repository blocks the work; `blocked_by` is empty. The record closes when every phase has landed in its owner and the interim chat-only preference has been retired by the owner.

## Discussion

### Recommended approach

**Source of truth.** The run packet already carries everything a notification needs. `ki agent` derives an append-only `events.jsonl` per run from what it already observes: launch, hold, gate failure, a status line that names a milestone, `DONE`, an exit without `DONE`, and the report's Failed and Needs sections. Agents keep writing status and report as now and never call a channel themselves. One optional progress-protocol line form, `HH:MM TZ - milestone: <text>`, lets an agent mark meaningful progress; every other status line stays local.

**Events that warrant delivery.** Five kinds, each with a stable identity of run, agent, kind and sequence: `progress` (a milestone line only), `done` (DONE written and the report present), `failed` (exited without DONE, or the report carries a Failed part), `blocked` (a gate that cannot open, a held agent whose predecessor failed, or a status line that says blocked) and `needs-owner` (each Needs tag in a report). A run-level `all finished` closes the set.

**Delivery.** One detached notifier per machine, `ki agent notify`, started by the launcher or dispatcher when absent and later by a launchd agent, watches the run directories, derives events, applies routing and suppression, calls channel adapters and writes a `deliveries.jsonl` receipt per event and channel. The coordinator is never in the path: the thread channel is `ki agent wait --next` returning the event list at the coordinator's next turn, which is the interim preference made event-based; remote channels are push from the notifier.

**Channels.** The thread channel is first and always on. Telegram is the preferred remote channel: the notifier posts to the Bot API `sendMessage` endpoint directly, outbound only, to one explicitly configured chat per owner, with the token in the secret store rather than in configuration. Slack (incoming webhook) and a generic push service such as ntfy follow as adapters behind the same `deliver(event, destination)` contract. Platform-native notifications (macOS Notification Centre) are an adapter that is off by default and currently disabled by the owner. The adapter contract, not any one service, is what the strategy fixes.

**Frequency, quiet periods and duplicates.** `done`, `failed`, `blocked` and `needs-owner` deliver immediately. `progress` coalesces to at most one message per run per fifteen minutes, carrying the latest milestone per agent. Quiet hours are configured per owner in local time; during them `progress` and `done` wait for a digest at the end of the quiet period, while `failed`, `blocked` and `needs-owner` still deliver unless the owner sets the channel to hold everything. The receipt log suppresses duplicates: an event identity delivers once per channel; an unchanged status line is never re-sent; a Needs tag is one event until its wording changes; relaunching an agent of the same name starts a new sequence.

**Routing and links.** Destinations resolve owner, then territory, then run: a user-level `~/.config/ki/notify.toml`, managed by chezmoi and holding no secret, declares channels, each owner's destinations, quiet hours and per-territory overrides; `ki agent launch --notify <channel>` or a run-level `notify.json` overrides for one run. The territory comes from the run's working directory through the registry and the thread from the run name, since a Project thread maps to one run. Every message names the run and agent, the last status or the Done lines, the Needs tags, and links to the authoritative owner: the work record by full identifier, the thread checkpoint and the report path. Remote channels carry a GitHub URL where the record has a remote and otherwise the repository-relative path with the machine name; the local channels carry absolute paths that open in the editor.

**Observatory channel.** The Observatory follows its own rule, observation derived from retained state, so its channel is a Runs instrument that reads the run packets and the notifier's receipts, in the way the Automation instrument reads `history.jsonl` today, and raises Beacon signals: `failed` and `blocked` as attention, `needs-owner` as attention, `done` as note, and `channel unreachable` from failed receipts. The Beacon's change detection then shows what appeared and cleared since the last observation. For live delivery, the loopback backend pushes over Server-Sent Events to the open page, which raises browser notifications when the owner has allowed them. WebRTC is designed for peer-to-peer media and data between browsers; between a loopback server and its own page, Server-Sent Events or a WebSocket is the simpler fit, and WebRTC only becomes relevant if the Observatory is ever reached from another device without a server in between. The Observatory is machine-bound like Notification Centre, so it is a local channel and the state-of-play view for [[command-centre]], not the remote channel.

**Detecting unavailable channels and failures.** Each delivery writes a receipt with success or the error; the notifier checks each channel at start (Telegram through `getMe`, a webhook only by an explicit test message) and records a heartbeat. Failures surface in three places: the thread channel prints `delivery failed: <channel> since <time>` with the next events; the Observatory raises the `channel unreachable` signal; and the notifier falls through to the next configured channel in order. `ki agent status` says when the notifier is not running, and the Rig doctor check can watch the launchd agent.

**Privacy and destinations.** No remote channel exists until the owner declares a destination; there is no default. Messages carry summaries, identifiers and paths, never file contents, secrets or the owner's addresses, and pass the same redaction the Observatory applies. Each territory may opt out of remote delivery, so a principal with sensitive material stays on the thread and Observatory channels. Tokens live in the secret store; the chezmoi template carries only the reference. Platform-native notifications stay off by default because they expose text on a shared screen.

### Where each concern is owned

| Concern | Owner |
| --- | --- |
| Event vocabulary, what warrants delivery, the milestone line, coordinator out of the path, privacy rule | `ki-delegation` in the harness, with the owner-facing side in `ki-pmo` once that skill exists |
| Event derivation, `events.jsonl`, the notifier, channel adapters, receipts, `wait --next` events, `ki agent notify` | `ki agent` in `tools-ki` |
| Runs instrument, Beacon signals, Server-Sent Events and browser notifications, `channel unreachable` | `apps-observatory.local` |
| `~/.config/ki/notify.toml` template, quiet hours, secret references, the launchd agent | chezmoi user configuration |
| The Telegram bot as a declared integration, by identity not token | [Integrations](<../../Admin/Governance/Conventions/Admin Conventions/Integrations.md>) in this island |

### Phased plan

1. **Smallest useful first step (one `tools-ki` record, one `ki-agentic-harness` record).** Derive `events.jsonl` from the run packet and make `ki agent wait --next` and `watch` return `failed`, `blocked` and `needs-owner` events as well as finishes; add the milestone line to the progress protocol. No integration; the interim chat-only preference stands and becomes event-based. Handed off on 2026-10-13 as the requirements above.
2. **Notifier and Telegram (one `tools-ki` record, one chezmoi record).** The detached notifier with the adapter contract, receipts, quiet hours and the Telegram adapter; `notify.toml` template; token in the secret store; pilot on one run before any other channel.
3. **Observatory (one `apps-observatory.local` record).** Runs instrument over run packets and receipts, Beacon signals, then Server-Sent Events and browser notifications; this is also the cheapest pilot of the [[command-centre]] state-of-play view.
4. **Alternatives (one `tools-ki` record).** Slack webhook, generic push, platform-native off by default, per-territory routing; record the bot in [[Admin/Governance/Conventions/Admin Conventions/Integrations|Integrations]].
5. **Later, separately decided.** Inbound replies to Needs tags from Telegram into the thread.

### Alternatives the owner declined

The questions put to Kris each carried an alternative, kept here for the record: the Claude Code plugin's bot instead of a dedicated one (`BOT-ID`); the plugin's `.env` for the token (`TOKEN-HOME`); only `failed`, or nothing, breaking quiet hours (`QUIET`); WebRTC for the Observatory (`OBS-CHANNEL`); every territory, or none until each opts in, delivering remotely (`REMOTE-SCOPE`); and moving this record to `tools-ki` (`HOME`). Kris chose the recommended option in each case; the resolved decisions are under Owner decisions above.

### Report shape since the assessment

The assessment was written against the earlier report shape with Failed and Needs sections. The owner report that replaced it on 2026-10-13 (Decision 14 of the `ways-of-working` run) puts material failures inside "What has been done" and gives each outstanding query a heading `<tag> - <title>`, so `needs-owner` derives from those headings and `failed` needs a signal the standard names, most simply the agent's final status line. Phase 1 settles that rule in the harness wording and the launcher together.
