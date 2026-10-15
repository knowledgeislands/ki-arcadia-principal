# Registry removal

## Owner instructions

- 15 October 2026, operational: Kris requested removal of `apps-childhealthyorkshire.co.uk` from the KI register. Completed on terra with `ki registry remove apps-childhealthyorkshire.co.uk`; verification showed exactly that entry removed and every other entry unchanged. No repository checkout was deleted or changed by the removal.
- 15 October 2026, operational: Kris requested DRAIN FOR SOL, no new work or agents, explicit-path commits through hooks, and no publication or reconciliation of another session's unpublished commits. This thread launched no agents and has no unfinished run or private runtime material to copy.
- 15 October 2026, operational: Kris asked to fix the unpublished recovery handoff. Publish only this thread's two recovery files from an isolated checkout based on origin/main, through normal hooks and a fast-forward push, preserving other sessions' primary-checkout work.

## Recovery

The registry is machine-local. On sol, inspect `ki registry list --format json` for the exact repository key. If present, the original bounded removal instruction authorises `ki registry remove apps-childhealthyorkshire.co.uk`, followed by another exact-key check. The terra registry change does not propagate through Git.

The portable handoff is [registry-removal](../../_CHECKPOINTS/registry-removal.md). There are no open decision queries or retired reports in this thread.
