---
type: ki-checkpoint
thread: techne.paperclip-bootstrap-and-recovery
label: 'Techne: paperclip-bootstrap-and-recovery'
state: active
created_at: 2026-10-08T08:35:00Z
updated_at: 2026-10-11T02:42:18Z
---

# techne.paperclip-bootstrap-and-recovery

## Objective

Paperclip is useful: one reviewed roadmap delivery lands in Kris's local main in VA, with reporting and review routines established there, before TMX is considered ([paperclip-bootstrap-and-recovery](../../Streams/Projects/paperclip-bootstrap-and-recovery.md), Initiative [techne](../../Streams/Initiatives/techne.md)).

## Current state

- Delivered, closed done and pruned in `ki-agentic-harness`: KI-HARNESS-GOV-102 (`c872f093`), KI-HARNESS-GOV-103 (`408f8431`), KI-HARNESS-GOV-107 (`5186ae58`), KI-HARNESS-GOV-108 (`608d241a`), KI-HARNESS-GOV-147 (`0fc418eb`) and KI-HARNESS-RTP-018 (`cdd79c5c`). Helpers `paperclip-a` and `paperclip-b` are finished.
- No open records. The run MCP connection check is now the Project note idea "Verify the run MCP connection", kept on 2026-10-11 in place of a cancelled harness work record (state-of-play Decision 38). KI-HARNESS-GOV-162 (Cite rules in Paperclip) was cancelled on 2026-10-09 and is kept as an idea in the Project note.
- Two Paperclip decision cards await Kris through `state-of-play`.

## Decisions made

- The master thread `state-of-play` owns cross-project priorities, releases and decisions; this thread works only this Project's records.
- The standing Paperclip constraints (ticket statuses, authority, ownership, scope, structure, hires) are in the Project note and bind this thread. The Techne Programme Hold applies to any remote operation.
- Workspace retirement (KI-HARNESS-GOV-147): the branch is the durable unit and the worktree a disposable checkout. Removing a worktree is safe once its work is committed to the branch; an unmerged branch is never deleted.

## Files touched

None yet in this thread. Helper prompts, statuses and reports in `~/.local/state/ki/agents/gov-020/` (`paperclip-a.*`, `paperclip-b.*`).

## Open questions

None for this thread; the two decision cards are Kris's, through `state-of-play`.

## Next step

Choose whether the Project note idea "Verify the run MCP connection" becomes work, and if so capture it through `ki-next` and delegate it through `ki agent`, staying within the Project note's constraints; the rule-citation idea also waits in the Project note.
