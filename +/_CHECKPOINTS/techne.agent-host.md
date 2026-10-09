---
type: ki-checkpoint
thread: techne.agent-host
label: 'Techne: agent-host'
state: active
created_at: 2026-10-07T09:05:00Z
updated_at: 2026-10-09T21:55:00Z
---

# techne.agent-host

## Objective

Reconstruct the `techne` working thread if its session is lost. Status, open records and ideas live in the [[agent-host]] Project note under the [[Initiatives/techne|Techne]] Initiative; this checkpoint copies none of them.

The thread moves agent work off the laptop onto the one agent host the [Techne Programme Hold](<../../Admin/Governance/Policies/Techne Programme Hold.md>) exempts. It delivers the durability rollout of [[ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host|ODR-KI-ARCADIA-001]] and the workstation rollout of [[ADR-KI-ARCADIA-003-the-agent-host-workstation-model|ADR-KI-ARCADIA-003]]. The [[baseline-rollout]] Project is separate and does not gate it. Mac Studio work belongs to the `mac-studio-bootstrap` thread.

## Current state

Verified on 2026-10-09 at about 22:50 BST.

- **Repositories.** `ki-techne-harness`, `tools-ki` and chezmoi are level with origin and clean. `tools-techne` is one local commit ahead (the TECHNE-TOOL-CLI-008 wording fix below), unpushed. Arcadia carries this checkpoint commit and one of Kris's own checkpoint commits, both unpushed.
- **Delivered and closed.** OS patching (TECHNE-TOOLS-OPS-022) is accepted and pruned; the workstation bundle in chezmoi (DOTFILES-UE-073) is accepted and pruned. TECHNE-TOOLS-OPS-020, TECHNE-TOOLS-OPS-021 and TECHNE-TOOL-CLI-007 were cancelled as rejected and pruned. The `agent-host` rename (Decision 30) is pushed everywhere.
- **Awaiting review.** The workstation pilot, TECHNE-TOOLS-OPS-015, waits for Kris's review. Its live run passed; its open concerns are the missing `target_host` until the `vega` rebuild, the provider still creating `techne` with bash, and the profile validator not yet refusing a personal-configuration tool such as `chezmoi` in the owner's Rig fragment.
- **In triage.** TECHNE-TOOLS-OPS-016, TECHNE-TOOLS-OPS-017 (zsh and `vega` rename at rebuild, blocked by TECHNE-TOOLS-OPS-015), TECHNE-TOOLS-OPS-018 and TECHNE-TOOLS-OPS-019 in the harness; TECHNE-TOOL-CLI-006 and TECHNE-TOOL-CLI-008 (binding fields `reboot_window` and `livepatch`, and the status `updates` member) in `tools-techne`; KI-TOOL-CLI-115 in `tools-ki`.
- **Host restarts.** The live binding sets no `reboot_window` (the field waits for TECHNE-TOOL-CLI-008), so the host never restarts itself. Each kernel update still needs the provider's stop and start, starting with the 7.0.0-1014 kernel due on 2026-10-10. The last verified host state, from the TECHNE-TOOLS-OPS-022 acceptance run, was kernel 7.0.0-1013, no reboot flag, outcome clean, 34 pending updates (12 security) and a silent banner.
- **Host unreachable from the Mac now.** Tailscale is stopped on `terra`, so `ssh ki-techne-agent-host` does not resolve; the host's current state was not rechecked.
- **The Mac.** Named `terra` (computer, host and Tailscale name). chezmoi's `rigProfile` is `laptop`; `chezmoi status` works, and its only differences are `~/.claude/CLAUDE.md`, `~/.codex/AGENTS.md` and a pending run script, none in the Techne settings. `mise` 2026.10.6 and `codex` 0.162.0 stay off the recipe pins (2026.10.4 and 0.161.0).
- **`ki agent --wait-for` is still broken** in installed ki 0.10.0: the wait gate is only a prompt instruction, unchanged since 0.9.0, so a waiting run can end its turn and never resume. No record tracks it. Until fixed, sequence dependent runs by hand.
- The decisions log runs to Decision 34. Decision 33 (handoffs name the need in plain terms, never another repository's roadmap records) is next, as the `handoff-rule` run.

Thread rules:

- Background agents run through `ki agent` under run name `techne`, with status, reports and the decisions log in `~/.local/state/ki/agents/techne/`.
- Estate rules from 2026-10-07: roadmap records use the v1 model (`kind`, `project`, `component`, `horizon` with a `hold` block); trades are on hold, so work is done directly or recorded in the receiving repository; `/ki-design-loop` runs for any Techne design question whose shape is still open.
- No remote agent execution or remote-environment changes outside the standing exemption. Each live host run needs Kris's SSH grant. Live rebuilds and withdrawals are the binding owner's alone.
- Commit with explicit paths only.

## Decisions made

- Outside the exemption the hold stands. Only Kris can authorise, reshape or retire it.
- The exemption is standing and kept, with no fixed review date; it is revisited if the hold is reshaped (GDR-KI-ARCADIA-004).
- Credentials by stated role: the binding owner's administrator session builds and tears down, the operator role operates, and the GitHub token and Claude login are the binding owner's own until unattended agents arrive.
- Work on the host is safe only once it is on a remote; the durability model and its rollout follow ODR-KI-ARCADIA-001, one harness pilot before a wave.
- Agent hosts are recipes bound by per-person bindings, providers and footprints (ADR-KI-ARCADIA-006).
- The host becomes the binding owner's working machine through the recipe's Rig profile and the owner's profile payload (for Kris, Cheztoi), with zsh as the default shell and no detached delegation yet (ADR-KI-ARCADIA-003).
- The design is general across owners and targets; the recipe carries the two-checkout and writing-checkout rules (Decisions 10 and 11).
- The host-marker path is `~/.config/ki/host-marker`, and ki is pinned at 0.10.0 (Decisions 19 and 20).
- `target_host` is checked against the host name, not the provider's `host.id`; the recipe name `agent-host` stays generic (Decision 28).
- Patching: no automatic reboot by default, an optional daily host-local reboot window, Livepatch opt-in, security-only unattended scope, and updates never changing the status outcome (Decisions 26 and 27).
- Naming: the AWS agent host becomes `vega` at its rebuild; the laptop is `terra`; one name, `agent-host`, for the recipe and everything that meant `direct-host` (Decisions 29 and 30).
- Handoffs between repositories state the need in plain terms and link durable docs, never another repository's roadmap records (Decisions 32 and 33).

## Files touched

ODR-KI-ARCADIA-001, ADR-KI-ARCADIA-003, the agent-host Project note and this checkpoint. Outside Arcadia: `recipes/agent-host/` and `operations/aws/agent-host/` in `ki-techne-harness`, the open records listed above, and the Techne host settings in chezmoi.

## Open questions

For Kris:

1. Review TECHNE-TOOLS-OPS-015 and decide whether to accept it.
2. Push the `tools-techne` commit that rewords TECHNE-TOOL-CLI-008.
3. Restart the host through the provider's stop and start once the 7.0.0-1014 kernel lands on 2026-10-10, or plan TECHNE-TOOL-CLI-008 so the binding can set a reboot window.
4. Decide whether to capture the `ki agent --wait-for` fix in `tools-ki`.
5. Bring `mise` and `codex` on the Mac back to their pins, or move the pins (optional).
6. Hand the machine-naming convention (Decision 29(a)) to the `rig.mac-studio-bootstrap` thread; not yet done.

Owned-host exemption for the Mac Studio is handled by KI-ARCADIA-GOV-033 in the `mac-studio-bootstrap` thread.

Parked tangents, each to get a home when picked up:

- **2026-10-09: personal harness instructions.** Kris wants the Claude and Codex instructions to become skills from a personal harness (not yet designed), leaving thin `CLAUDE.md` and `AGENTS.md`; the workstation bundle carries the files meanwhile. Cross-project: raise in state-of-play when picked up.

## Next step

1. Run `handoff-rule` (Decision 33).
2. Kris works through the open questions above.
