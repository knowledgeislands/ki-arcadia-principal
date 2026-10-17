---
type: ki-checkpoint
thread: registry-removal
label: 'Knowledge Islands: registry removal'
state: active
created_at: 2026-10-15T09:51:00Z
updated_at: 2026-10-15T12:19:09Z
---

# registry-removal

**Messages from Master: state-of-play** - the receiving thread acts on each line, then removes it.

- 2026-10-16 · THREADS-CLEAR · KI Model: ways-of-working, on Kris's decision of 15 October: "Each owning thread clears its own folder at its next mark, moving scratch to tmp/, homing or removing tracked work products and moving briefs to the state folder, told through its inbox by this thread." Apply it to `+/_THREADS/registry-removal/` against the closed list now in [ki-pmo's Tidying the thread folder](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-pmo/references/standards-pmo.md) and the ki-delegation [Run packet](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md) (ki-agentic-harness `065bbd5b`, on `origin/main`), in Kris's words: "A thread folder holds a closed list, decisions.md and <name>.report.md only; briefs live in the state folder, work products in their owning home, temporary output in the temporary location." · detail: [ways-of-working decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/decisions.md)
- 2026-10-17 · PMO-7-BACKLOG · Master: state-of-play, on Kris's decision of 15 October: "Each thread relinks or deletes its own reports at its next mark under the thread-tidy rule, and the state-of-play thread tells each one so." Apply it to this thread's own folder, [`+/_THREADS/registry-removal/`](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/registry-removal/) · detail: [ways-of-working decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/decisions.md)

2026-10-15: the state-of-play territory hold set this checkpoint to drained without the thread's own drain; the next steps are those already in this checkpoint.

## Objective

Remove `apps-childhealthyorkshire.co.uk` from the KI register and preserve this completed thread for Kris's move from terra to sol.

## Current state

Running: nothing. Queued: nothing. No background agents were launched, and no unfinished briefs or private runtime recovery files exist for this thread.

Thread folder: `+/_THREADS/registry-removal/`.

The entry was removed on terra and remains absent when checked during drain. Original verification established that all other registry entries were unchanged. The register is machine-local, so sol needs its own exact-key check.

Kris requested that the publication blocker be fixed. This handoff is prepared against current origin/main in an isolated temporary checkout, containing only this checkpoint and this thread's decisions, with the normal repository hooks enabled. This permits fast-forward publication without carrying other sessions' unpublished commits or changing their work. Fetch this handoff from origin/main on sol. The earlier primary-checkout pull was blocked by another session's unstaged report; the primary checkout's reconciliation remains with its owning sessions and is not a prerequisite for using the published handoff.

## Decisions made

Kris's bounded removal instruction and drain restrictions are recorded in the [thread decisions](../_THREADS/registry-removal/decisions.md).

## Files touched

- Machine-local KI registry on terra, through the supported CLI; no checkout content changed during removal.
- This checkpoint and [thread decisions](../_THREADS/registry-removal/decisions.md), created for the drain handoff.
- Another session's dirty path is excluded: `+/_THREADS/mac-studio-bootstrap/chezmoi-fix.report.md` belongs to mac-studio-bootstrap. Techne's `+/_CHECKPOINTS/techne.agent-host.md` and `+/_THREADS/techne/decisions.md`, and chezmoi's untracked `+/_THREADS/chezmoi/commit-fix.thread-copy.report.md`, were observed earlier in the drain and subsequently disappeared from status without action by this thread.

## Open questions

No owner decision queries. Held and parked items: none.

Waiting-on items: none once this handoff is fetched from origin/main on sol. Other sessions own the remaining terra primary-checkout reconciliation; do not reset, stash or publish their work from this thread.

## Next step

Fetch and reconcile sol's checkout with origin/main without overwriting local changes. Read this checkpoint and its linked decisions. Check sol's machine-local register for the exact key `apps-childhealthyorkshire.co.uk`; if present, remove it with `ki registry remove apps-childhealthyorkshire.co.uk` under the existing instruction and verify absence. Start no other work.

Resume registry removal from `+/_CHECKPOINTS/registry-removal.md` on sol: reconcile the published handoff, verify the local register entry is absent, and report at rest.
