---
type: ki-checkpoint
thread: agent-host
state: active
created_at: 2026-10-07T09:05:00Z
updated_at: 2026-10-08T15:13:00Z
---

# agent-host

## Objective

Reconstruct the `techne` working thread if its session is lost. Status, open records and ideas live in the [[agent-host]] Project note under the [[Initiatives/techne|Techne]] Initiative; this checkpoint copies none of them.

The thread moves agent work off the laptop onto the one agent host the [Techne Programme Hold](<../../Admin/Governance/Policies/Techne Programme Hold.md>) exempts. It delivers the durability rollout of [[ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host|ODR-KI-ARCADIA-001]] and the workstation rollout of [[ADR-KI-ARCADIA-003-the-agent-host-workstation-model|ADR-KI-ARCADIA-003]]. The [[baseline-rollout]] Project is separate and does not gate it.

## Current state

The host was rebuilt on 2026-10-07 by a stack-only delete that kept the GitHub token; workspace setup re-converged and status shows 21 repositories, none at risk. The GitHub token carries a 90-day expiry. Claude and Codex are now signed in on the host.

GDR-KI-ARCADIA-004 words the exemption by role with no fixed review date. KI-ARCADIA-GOV-031 made ODR-KI-ARCADIA-001 and ADR-KI-ARCADIA-003 person-neutral and target-neutral and is accepted and pruned. Every ODR-KI-ARCADIA-001 rollout record is captured in its owning repository, and the ADR-KI-ARCADIA-003 workstation rollout is captured in `ki-techne-harness` and the chezmoi source. The durability pilot TECHNE-TOOLS-OPS-013 is accepted and pruned but has not yet run against the live host.

TECHNE-TOOLS-OPS-014 is delivered and `awaiting-review` in `ki-techne-harness` (Decision 13). It adds the pin file `recipes/direct-host/rig.toml` (the recipe's Rig `direct-host` profile, exact versions plus a Claude Code minimum), the observe-only `rig-pins.sh` provider, recipe host instructions rendered for Claude (`~/.claude/rules/ki-agent-host.md`) and Codex (`~/.codex/AGENTS.md`), the host marker at `~/.config/ki/host-marker`, and a 14-day expiry mark in host status and the login banner. None of it has run on the host yet: the first setup rerun upgrades `ki`, mise and Codex, pins Node and installs Rig. The marker path is the candidate in KI-TOOL-CLI-115 in `tools-ki`.

Behind it, the workstation pilot pair TECHNE-TOOLS-OPS-015 and DOTFILES-UE-073 is in draft, and TECHNE-TOOLS-OPS-019 (person-neutral recipe defaults), TECHNE-TOOLS-OPS-020 (operator guide split) and TECHNE-TOOLS-OPS-021 with TECHNE-TOOL-CLI-007 (owned-host provider and adapter) are in triage. The decisions log runs to Decision 17. No `techne` agents are running.

Thread rules:

- Background agents run through `ki agent` under the run name `techne`, with status, reports and the decisions log in `~/.local/state/ki/agents/techne/`.
- Estate rules from 2026-10-07: roadmap records use the v1 model (`kind`, `project`, `component`, `horizon` with a `hold` block); trades are on hold, so work is done directly or recorded in the receiving repository; `/ki-design-loop` runs for any Techne design question whose shape is still open.
- No remote agent execution or remote-environment changes outside the standing exemption. Live rebuilds and withdrawals are the binding owner's alone.
- Commit with explicit paths only; accept only through `ki-accept` on Kris's approval; never prune without approval.
- Leave other sessions' uncommitted changes alone.
- This thread covers the agent host only (Decision 17).

## Decisions made

- Outside the exemption the hold stands. Only Kris can authorise, reshape or retire it.
- The exemption is standing and kept, with no fixed review date: the prototype review was decided early as keep, `direct-host` stays a recipe, and the exemption is revisited when the hold is reshaped (GDR-KI-ARCADIA-004).
- Credentials are stated by role: the binding owner's administrator session builds and tears down, the operator role operates, and the GitHub token and Claude login are the binding owner's own until unattended agents arrive.
- Work on the host is safe only once it is on a remote; the durability model and its rollout follow ODR-KI-ARCADIA-001, with one harness pilot before a wave.
- Agent hosts are recipes bound by per-person bindings, with providers and footprints (ADR-KI-ARCADIA-006).
- The host becomes the binding owner's working machine through the recipe's Rig profile and the owner's profile payload (for Kris, Cheztoi), Rig staged, the shell a per-binding choice with zsh as the default, no detached delegation yet, and Rig the only new binary (ADR-KI-ARCADIA-003).
- The design is general: any binding owner, any target (cloud or owned, Linux or macOS), with Kris's choices only as examples; the recipe itself carries the two-checkout and writing-checkout rules (Decisions 10 and 11).

## Files touched

ODR-KI-ARCADIA-001, ADR-KI-ARCADIA-003, KI-ARCADIA-GOV-031 (pruned), the agent-host Project note and this checkpoint. Outside Arcadia: TECHNE-TOOLS-OPS-013 (pruned) to TECHNE-TOOLS-OPS-021 in `ki-techne-harness`, TECHNE-TOOL-CLI-006 and TECHNE-TOOL-CLI-007 in `tools-techne`, and DOTFILES-UE-072 to DOTFILES-UE-074 in the chezmoi source. No remote state changed beyond pushes.

## Open questions

- Owned-host exemption for the Mac Studio is handled by KI-ARCADIA-GOV-033 in the `mac-studio-bootstrap` thread.

## Next step

1. Kris reviews and accepts TECHNE-TOOLS-OPS-014 through `ki-accept`.
2. Kris reruns host setup.
3. Kris confirms the host-marker path.
4. The workstation pilot pair, TECHNE-TOOLS-OPS-015 and DOTFILES-UE-073, is planned through `ki-plan`, then TECHNE-TOOLS-OPS-019.
