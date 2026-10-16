# Thread-move rule handed to ki-pmo - [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md), Initiative Rig - since the thread began - resting

## What has been done

- Captured [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md) "move thread between hosts" as a triage record for `ki-pmo` in `ki-agentic-harness`, handed off from the Mac Studio bootstrap Project. It quotes Kris's words of 2026-10-14, sets out the proposed rule (drain only running agents; queued work goes back into the thread checkpoint; the run's decisions log and reports move into the tracked thread folder and are pushed; the new host pulls level, opens the Capital, re-queues from the checkpoint and pastes the resume line; the old host's session is retired), and lists the two open points. The skill itself is untouched; the record is marked as not blocking.
- Commits, both mine, pushed fast-forward to `origin/main` (`50dc6a56..8cd1a56d`): `0a93ccde` reserves [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md) in the issue ledger; `8cd1a56d` adds the record. Nothing from other threads was waiting to be pushed.
- Checks passed: `bun run test` (1142 pass, 0 fail), `bunx tsc --noEmit`, `ki repo audit --skill ki-work-roadmap` (15/15), and the pre-commit hooks.
- Limitation: the record cites the decisions log as machine-local on the laptop rather than linking it, because the log is not in Git.

## What is in progress

Nothing is running.

### Outstanding - no action requested now

- The untracked `+/diagrams/` folder in `ki-agentic-harness` belongs to another session and was left alone.
- This report is in the thread folder and is not committed; the coordinating thread commits its own folder.
- The two open points stay on the record for `ki-pmo` planning: how `ki agent` exports and re-imports a queue, and what happens to agents that must run on a specific host.

## Outstanding queries

No outstanding queries.

```text
No outstanding queries.
```
