---
type: ki-checkpoint
thread: techne
state: active
created_at: 2026-10-07T09:05:00Z
updated_at: 2026-10-08T08:06:25Z
---

# techne

## Objective

Reconstruct the `techne` working thread if its session is lost. Status, open records and ideas live in the [[agent-host]] Project note under the [[Initiatives/techne|Techne]] Initiative; this checkpoint copies none of them.

The thread moves agent work off the laptop onto the one agent host the [Techne Programme Hold](<../../Admin/Governance/Policies/Techne Programme Hold.md>) exempts. It delivers the durability rollout of [[ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host|ODR-KI-ARCADIA-001]] and the workstation rollout of [[ADR-KI-ARCADIA-003-the-agent-host-workstation-model|ADR-KI-ARCADIA-003]]. The [[baseline-rollout]] Project is separate and does not gate it.

## Current state

The host was rebuilt on 2026-10-07 by a stack-only delete that kept the GitHub token; workspace setup re-converged and status shows 21 repositories, none at risk. The GitHub token carries a 90-day expiry. Claude and Codex are not yet signed in on the host.

GDR-KI-ARCADIA-004 words the exemption by role with no fixed review date. Every ODR-KI-ARCADIA-001 rollout record is captured in its owning repository. The workstation design is decided (Decision 7) and recorded in ADR-KI-ARCADIA-003; its rollout is captured in `ki-techne-harness` and the chezmoi source, with the Rig profile folded into TECHNE-TOOLS-OPS-014 and the pilot pair, TECHNE-TOOLS-OPS-015 and DOTFILES-UE-073, selected behind the durability pilot TECHNE-TOOLS-OPS-013 and stage 1. Arcadia commits are local and unpushed, because another session's commit is ahead of origin there; the other repositories are pushed. Both design loops' papers are deleted, their outcomes consolidated in ODR-KI-ARCADIA-001 and ADR-KI-ARCADIA-003. No `techne` agents are running.

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
- The host becomes the binding owner's working machine through the recipe's Rig profile and the owner's Cheztoi projection, Rig staged, zsh by guarded hand-off, no detached delegation yet, and Rig the only new binary (ADR-KI-ARCADIA-003).

## Files touched

The workstation decisions file and design index, ADR-KI-ARCADIA-003 and the Decisions index, the agent-host Project note and this checkpoint. Outside Arcadia: TECHNE-TOOLS-OPS-013, OPS-014 and new records OPS-015 to OPS-018 in `ki-techne-harness`, and DOTFILES-UE-073 and UE-074 in the chezmoi source. No remote state changed beyond pushes.

## Open questions

None.

## Next step

Kris signs Claude (and optionally Codex) in on the host and pushes Arcadia once the other session's commit there is settled; then the durability pilot, TECHNE-TOOLS-OPS-013, is planned through `ki-plan`, followed by TECHNE-TOOLS-OPS-014 and the workstation pilot pair.
