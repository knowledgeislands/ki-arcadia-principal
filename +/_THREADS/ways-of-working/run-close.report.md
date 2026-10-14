# run-close: owner report

Run `ways-of-working`, agent `run-close`, 2026-10-13, Claude Fable 5.1 (Claude Code).

## Decided

- Decision 23 (2026-10-13), Kris: "STATE-CLEANUP - Yes; queue after durability: ki agent close with reconcile gate, plus sweep of existing run folders." Carried out as a captured record plus a read-only inventory; nothing implemented, nothing swept.
- Decision 2 (2026-10-13), Kris: "run-folder retention (archive or delete the run folder once the thread or run closes and its decisions are consolidated into durable owners). No new record." Quoted in the record as the rule `close` mechanises.

## What has been done

- Captured [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md), "Agent run close", in `tools-ki` as `status: triage`, `kind: deliver`, project `ways-of-working`, component `agent`. It specifies `ki agent close <run>`: archive or delete only after a reconcile gate (every logged decision has a durable home, no agent running), a per-blocker report on failure, delete only behind an explicit flag. It gives three options for the gate (process only; process plus decision homes; full close gate including DONE, worktrees and checkpoints, recommended), three for how a decision proves its home (`home:` line via `ki agent decide --home` or `ki agent reconcile`, recommended; text search; attestation override), and four for archive against delete (move to `$KI_STATE_HOME/agents/_archive/<run>/` with a `close.md`, recommended; compressed; outside the state root; delete only). It depends on the open `DECISION-HOME` decision and quotes the report's options (a), (b), (c) and recommendation verbatim; `blocked_by` stays empty because that is an owner decision, not a build-order block.
- Commits in `tools-ki`, on `main`, pushed fast-forward to `origin/main`:
  - `477a562` chore(roadmap): reserve KI-TOOL-KI-CLI-124 work identifier
  - `bb25fa8` docs(roadmap): capture KI-TOOL-KI-CLI-124 agent run close
- Checks: pre-commit hooks (lint-staged with rumdl, syncpack) passed on both commits. `ki repo audit --repo .` before and after: FAIL=2, both pre-existing in `ki-engineering` (`KNIP-2` knip failed; `DEPS-1` rumdl 0.2.77 → 0.2.78 beyond the 14-day window). No new FAIL; `ki-work-roadmap` evaluated the new record with no finding.
- Inventory written, read-only, to [run-close.inventory.md](/Users/krisbrown/.local/state/ki/agents/ways-of-working/run-close.inventory.md): 25 run folders, 1.1 GB in total. Per folder: size, latest activity, agent count, running and not-DONE counts, dispatcher state, decision count, worktrees, own thread checkpoint and other checkpoints naming it, and a proposed action. Totals: keep (live) 17, reconcile-then-archive 8, archive now 0. Every folder has a `decisions.md` (1 to 153 decisions), so none is archivable without a reconcile pass. Four folders have agents running (8 agents, including this one). No worktree is checked out anywhere; three `worktrees/` directories are empty. `personal-tower` (851 MB of agent scratch JSON) and `state-of-play` (172 MB `backups/`) hold 93 percent of the space. No content of any private run was read beyond names, sizes, pid liveness, DONE state and heading counts. Nothing was deleted, moved or archived.
- Limitations: the inventory's "live" test is mechanical. `chezmoi` and `mac-studio-bootstrap` count as live only because `rig.chezmoi.md` and `rig.mac-studio-bootstrap.md` checkpoints still exist, although the change-management report calls those threads closed. Whether any decision already has a durable home was not verified; that is the reconcile step.
- Not touched: `ki-principal` has an untracked `+/diagrams/` from another session; left as found. No checkpoint, `Admin`, `Pillars` or `Resources` file was edited.

## What is in progress

Nothing running.

Outstanding - no action requested now:

- Receiver-owned: `KI-TOOL-KI-CLI-124` waits in triage for adoption through `ki-next` once `DECISION-HOME` is answered; the record names which gate variant each answer implies.
- Retained decision: the eight reconcile-then-archive folders and the two closed-but-checkpointed ones wait for `close` to exist, or for a manual reconcile from their own threads.

## Outstanding queries

### DECISION-HOME-FOR-CLOSE - Which DECISION-HOME option should the close gate assume?

Summary: The record is written against the report's three options. Under (a) the gate checks each log entry for a home; under (b) it checks the committed log; under (c) the decision gate falls away. The planning step cannot start without the answer. Need you: Confirm the report's recommendation (a), or name (b) or (c). Recommendation: (a), as the report recommends; it keeps the log as the working copy and makes consolidation checkable before a folder goes.

### CLOSED-THREADS - Are the chezmoi, mac-studio-bootstrap and techne threads closed?

Summary: The report says they are closed; `rig.chezmoi.md` and `rig.mac-studio-bootstrap.md` still exist, so the inventory keeps those two as live. `techne` has no checkpoint and is already proposed for reconcile-then-archive. All three have agents that exited without `DONE` and decisions cited by number in committed records. Need you: Say whether the two checkpointed threads are closed, so their folders move to reconcile-then-archive and the `CITE-RULE` sweep covers their decisions before the logs go. Recommendation: Treat both as closed and reconcile them first in the sweep, since their decisions are the ones the report already found cited by number only.

```text
DECISION-HOME-FOR-CLOSE - (a)
CLOSED-THREADS - yes, both closed; reconcile first
```
