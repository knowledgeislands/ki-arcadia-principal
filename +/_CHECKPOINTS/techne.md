---
type: ki-checkpoint
thread: techne
state: active
created_at: 2026-10-07T09:05:00Z
updated_at: 2026-10-08T07:25:30Z
---

# techne

## Objective

Reconstruct the `techne` working thread if its session is lost. Status, open records and ideas live in the [[agent-host]] Project note under the [[Initiatives/techne|Techne]] Initiative; this checkpoint copies none of them.

The thread moves agent work off the laptop onto the one agent host the [Techne Programme Hold](<../../Admin/Governance/Policies/Techne Programme Hold.md>) exempts, and now delivers the durability rollout of [[ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host|ODR-KI-ARCADIA-001]]. The [[baseline-rollout]] Project is separate and does not gate it.

## Current state

The host was rebuilt on 2026-10-07 by a stack-only delete that kept the GitHub token; workspace setup re-converged and status shows 21 repositories, none at risk. The GitHub token carries a 90-day expiry. Claude and Codex are not yet signed in on the host.

GDR-KI-ARCADIA-004 now words the exemption by role with no fixed review date, and the rollout note and diagram match. KI-ARCADIA-GOV-029 and KI-ARCADIA-GOV-021 are accepted under Decision 6 and pruned. Every ODR-KI-ARCADIA-001 rollout record is captured in its owning repository and listed in the [[agent-host]] Project note; TECHNE-TOOLS-OPS-014 now removes the review-date line from host status. The Arcadia commits are local and unpushed, because another session's commit is ahead of origin there. No `techne` agents are running apart from the queued workstation-decisions run (`ws-decide`, Decision 7).

Thread rules:

- Background agents run through `ki agent` under the run name `techne`, with status, reports and the decisions log in `~/.local/state/ki/agents/techne/`.
- Estate rules from 2026-10-07: roadmap records use the v1 model (`kind`, `project`, `component`, `horizon` with a `hold` block); trades are on hold, so work is done directly or recorded in the receiving repository; `/ki-design-loop` runs for any Techne design question whose shape is still open.
- No remote agent execution or remote-environment changes outside the standing exemption. Live rebuilds and withdrawals are the binding owner's alone.
- Commit with explicit paths only; accept only through `ki-accept` on Kris's approval; never prune without approval.
- Leave other sessions' uncommitted changes alone.

## Decisions made

- Outside the exemption the hold stands. Only Kris can authorise, reshape or retire it.
- The exemption is standing and kept, with no fixed review date: the prototype review was decided early as keep, `direct-host` stays a recipe, and the exemption is revisited when the hold is reshaped (GDR-KI-ARCADIA-004).
- Credentials are stated by role: the binding owner's administrator session builds and tears down, the operator role operates, and the GitHub token and Claude login are the binding owner's own until unattended agents arrive.
- Work on the host is safe only once it is on a remote; the durability model and its rollout follow ODR-KI-ARCADIA-001, with one harness pilot before a wave.
- Agent hosts are recipes bound by per-person bindings, with providers and footprints (ADR-TECHNE-003).

## Files touched

The agent-host Project note and this checkpoint; the state-of-play checkpoint, the hold, the rollout note and KI-ARCADIA-GOV-024 lost their links to the pruned KI-ARCADIA-GOV-021. Outside Arcadia: TECHNE-TOOLS-OPS-014 in `ki-techne-harness`, and new records and ledger advances in chezmoi, `tools-ki` and `ki-agentic-harness`. No remote state changed.

## Open questions

None at thread level.

## Next step

Kris signs Claude (and optionally Codex) in on the host and pushes Arcadia once the other session's commit there is settled; the workstation-decisions run records Decision 7; then the harness pilot, TECHNE-TOOLS-OPS-013, is planned through `ki-plan`.
