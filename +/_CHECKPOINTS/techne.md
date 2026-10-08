---
type: ki-checkpoint
thread: techne
state: active
created_at: 2026-10-07T09:05:00Z
updated_at: 2026-10-08T09:10:00Z
---

# techne

## Objective

Reconstruct the `techne` working thread if its session is lost. Status, open records and ideas live in the [[agent-host]] Project note under the [[Initiatives/techne|Techne]] Initiative; this checkpoint copies none of them.

The thread moves agent work off the laptop onto the one agent host the [Techne Programme Hold](<../../Admin/Governance/Policies/Techne Programme Hold.md>) exempts. It delivers the durability rollout of [[ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host|ODR-KI-ARCADIA-001]] and the workstation rollout of [[ADR-KI-ARCADIA-003-the-agent-host-workstation-model|ADR-KI-ARCADIA-003]]. The [[baseline-rollout]] Project is separate and does not gate it.

## Current state

The host was rebuilt on 2026-10-07 by a stack-only delete that kept the GitHub token; workspace setup re-converged and status shows 21 repositories, none at risk. The GitHub token carries a 90-day expiry. Claude and Codex are not yet signed in on the host.

GDR-KI-ARCADIA-004 words the exemption by role with no fixed review date. Every ODR-KI-ARCADIA-001 rollout record is captured in its owning repository. The workstation design is decided (Decision 7) and recorded in ADR-KI-ARCADIA-003; its rollout is captured in `ki-techne-harness` and the chezmoi source, with the Rig profile folded into TECHNE-TOOLS-OPS-014 and the pilot pair, TECHNE-TOOLS-OPS-015 and DOTFILES-UE-073, selected behind the durability pilot TECHNE-TOOLS-OPS-013 and stage 1. TECHNE-TOOLS-OPS-013 is delivered and awaiting Kris's review, with the neutral `host.id` and guide fixes (P1, P2). Kris approved generic-review proposals P4 to P9 on 2026-10-08 (Decision 11), with zsh as the default shell: KI-ARCADIA-GOV-031 amends ODR-KI-ARCADIA-001 and ADR-KI-ARCADIA-003 to be person-neutral and target-neutral and awaits Kris's review; TECHNE-TOOLS-OPS-014, TECHNE-TOOLS-OPS-015 and TECHNE-TOOLS-OPS-017 are reshaped, TECHNE-TOOLS-OPS-019 is captured in triage for person-neutral recipe defaults, DOTFILES-UE-072 is narrowed to Kris's personal wording and DOTFILES-UE-073 is OS-aware. P10 to P12 are undecided and P13 is noted. Both design loops' papers are deleted, their outcomes consolidated in ODR-KI-ARCADIA-001 and ADR-KI-ARCADIA-003. No `techne` agents are running.

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
- The host becomes the binding owner's working machine through the recipe's Rig profile and the owner's profile payload (for Kris, Cheztoi), Rig staged, the shell a per-binding choice with zsh as the default, no detached delegation yet, and Rig the only new binary (ADR-KI-ARCADIA-003).
- The design is general: any binding owner, any target (cloud or owned, Linux or macOS), with Kris's choices only as examples; the recipe itself carries the two-checkout and writing-checkout rules (Decisions 10 and 11).

## Files touched

ODR-KI-ARCADIA-001, ADR-KI-ARCADIA-003, KI-ARCADIA-GOV-031, the agent-host Project note and this checkpoint. Outside Arcadia: TECHNE-TOOLS-OPS-013 to TECHNE-TOOLS-OPS-019 in `ki-techne-harness`, and DOTFILES-UE-072 to DOTFILES-UE-074 in the chezmoi source. No remote state changed beyond pushes.

## Open questions

None.

## Next step

Kris signs Claude (and optionally Codex) in on the host, reviews TECHNE-TOOLS-OPS-013 and KI-ARCADIA-GOV-031, and decides P10 to P12; then TECHNE-TOOLS-OPS-014 is planned through `ki-plan`, followed by the workstation pilot pair and TECHNE-TOOLS-OPS-019.
