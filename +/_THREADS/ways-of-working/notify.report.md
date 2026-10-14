# notify - report

## Done

- Captured `KI-PRINCIPAL-ECO-012` (Notification strategy for delegated work) as a `triage` record under Decision 13, in Knowledge Islands Principal for the ways-of-working Project: `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-012-notification-strategy-for-delegated-work.md`. Not adopted, planned or promoted; no integration, notification, bot or secret touched.
- Commits on `main`, pushed fast-forward to `origin` (ahead by exactly these two, nothing behind): `1532cff` chore(roadmap): reserve KI-PRINCIPAL-ECO-012 work identifier (the ledger advance the number-reservation standard requires as its own commit); `ba24c74` docs(roadmap): capture KI-PRINCIPAL-ECO-012. Trailer `Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>`.
- Checks: husky pre-commit (rumdl, KB audit) passed on both commits; `ki repo audit --repo .` ends FAIL=2 WARN=2, the same two pre-existing failures as the baseline (TOPICS-1 GitHub topics, PRINCIPAL-2 Enactment anchor); no new FAIL. The diff is the record plus the ledger line; the Roadmap index lists no records, so no index line was needed.
- Home decision: Knowledge Islands Principal, area ECO (cross-estate, no single repository owner: harness skill, `ki agent`, Observatory, chezmoi), serving ways-of-working, which owns the delegation and thread practice; command-centre takes the view. Delivery records go to each repository by trade once adopted.

## Recommended approach

1. The run packet is the source of truth. `ki agent` derives an append-only `events.jsonl` per run from what it already sees; agents keep writing status and report and never call a channel.
2. Five events warrant delivery: progress (a milestone status line only), done, failed, blocked, needs-owner (one per Needs tag), plus a run-level all-finished.
3. One detached notifier per machine (`ki agent notify`) watches run folders, routes, suppresses, calls channel adapters and writes a receipt per event and channel. The coordinator stays out of the path: its channel is `ki agent wait --next` returning events at its next turn.
4. Telegram is the remote channel: the notifier posts outbound-only to the Bot API to one configured chat; the Claude Code Telegram plugin cannot serve a detached process, so it is not the mechanism. Slack webhook, generic push and platform-native (off by default) are adapters behind one `deliver(event, destination)` contract.
5. done, failed, blocked and needs-owner deliver at once; progress coalesces to one message per run per fifteen minutes; quiet hours hold progress and done for a digest; receipts suppress duplicates.
6. Routing resolves owner, territory, run from a chezmoi-managed, secret-free `~/.config/ki/notify.toml`, with per-run override. Every message carries the record identifier, checkpoint and report link; summaries only, repositories stay authoritative.
7. Observatory channel: a Runs instrument reads run packets and receipts (as Automation reads `history.jsonl`), raises Beacon signals, and the loopback backend pushes Server-Sent Events to the page for browser notifications. WebRTC is the wrong tool between a loopback server and its own page; it would only matter for another device with no server between.
8. Failures: a receipt per delivery, `getMe` check at start, heartbeat; surfaced in the thread channel, as an Observatory `channel unreachable` signal and by falling through to the next channel; `ki agent status` reports a missing notifier.
9. Privacy: no remote destination until declared; summaries, identifiers and paths only, redacted; per-territory opt-out; tokens in the secret store, references only in chezmoi.
10. Ownership: vocabulary and rules in `ki-delegation` (owner-facing side in `ki-pmo` later); mechanics in `ki agent`; instrument and push in Observatory; destinations and quiet hours in chezmoi; the bot as an integration in Integrations.

## Phased plan

1. Smallest useful first step (one `tools-ki` record, one `ki-delegation` edit): `events.jsonl` from the run packet; `wait --next` and `watch` return failed, blocked and needs-owner events; the milestone line in the progress protocol. No integration; interim chat-only stands.
2. Notifier and Telegram (one `tools-ki` record, one chezmoi record): adapter contract, receipts, quiet hours, Telegram adapter, `notify.toml` template, token in the secret store; pilot on one run.
3. Observatory (one `apps-observatory.local` record): Runs instrument, Beacon signals, then Server-Sent Events and browser notifications; also the cheapest pilot of the command-centre state-of-play view.
4. Alternatives (one `tools-ki` record): Slack webhook, generic push, platform-native off by default, per-territory routing; record the bot in Integrations.
5. Later, separately decided: inbound replies to Needs tags from Telegram into the thread.

## Needs Kris

- `HOME` - Where the record lives. Options: (a) adopt in ki-principal under ways-of-working with delivery traded out; (b) move to tools-ki. Recommendation: (a).
- `BOT-ID` - Which bot sends. Options: (a) a dedicated outbound-only notifier bot; (b) the Claude Code plugin's bot. Recommendation: (a), narrower token and no clash with the plugin's inbound polling.
- `TOKEN-HOME` - Where the token lives. Options: (a) macOS Keychain under the KI secret store; (b) the plugin's `.env`. Recommendation: (a).
- `QUIET` - Which events break quiet hours. Options: (a) failed, blocked and needs-owner; (b) failed only; (c) none. Recommendation: (a).
- `OBS-CHANNEL` - Observatory transport. Options: (a) Server-Sent Events plus browser notifications; (b) WebRTC. Recommendation: (a).
- `REMOTE-SCOPE` - Which territories may deliver remotely. Options: (a) Knowledge Islands and personal by default, other principals opt in; (b) all; (c) none until each opts in. Recommendation: (a).
- `ADOPT` - Adopt `KI-PRINCIPAL-ECO-012` to draft with a horizon through `ki-next`, then trade phase 1 to tools-ki and the harness. Recommendation: adopt at next, phase 1 now.
