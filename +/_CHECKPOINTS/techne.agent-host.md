---
type: ki-checkpoint
thread: techne.agent-host
label: 'Techne: agent-host'
state: active
created_at: 2026-10-07T09:05:00Z
updated_at: 2026-10-10T13:30:00Z
---

# techne.agent-host

## Objective

Reconstruct the `techne` working thread if its session is lost. Status, open records and ideas live in the [[agent-host]] Project note under the [[Initiatives/techne|Techne]] Initiative; this checkpoint copies none of them.

The thread moves agent work off the laptop onto the one agent host the [Techne Programme Hold](<../../Admin/Governance/Policies/Techne Programme Hold.md>) exempts. It delivers the durability rollout of [[ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host|ODR-KI-ARCADIA-001]] and the workstation rollout of [[ADR-KI-ARCADIA-003-the-agent-host-workstation-model|ADR-KI-ARCADIA-003]]. The [[baseline-rollout]] Project is separate and does not gate it. Mac Studio work belongs to the `mac-studio-bootstrap` thread.

## Current state

Verified on 2026-10-10 at about 14:30 BST.

Mark: 2026-10-09T21:40Z, decisions log at Decision 34

- **Repositories.** All eight touched repositories (`ki-arcadia-principal`, `ki-techne-harness`, `tools-techne`, `ki-specifications`, `ki-website`, `ki-agentic-harness`, `tools-ki`, chezmoi) are level with origin and clean.
- **Delivered and closed.** OS patching (TECHNE-TOOLS-OPS-022) and the chezmoi workstation bundle (DOTFILES-UE-073) are accepted and pruned. The workstation pilot (TECHNE-TOOLS-OPS-015) is accepted and kept, not pruned. The `agent-host` rename (Decision 30) is live everywhere, including on the host.
- **Ideas, not records.** The owned-host provider and the operator-guide split are now ideas in the [[agent-host]] Project note; their cancelled records are pruned.
- **In triage.** TECHNE-TOOLS-OPS-016, TECHNE-TOOLS-OPS-017 (zsh, the `vega` rename and the remaining live record identifiers, at rebuild), TECHNE-TOOLS-OPS-018 and TECHNE-TOOLS-OPS-019 in the harness; TECHNE-TOOL-CLI-006 and TECHNE-TOOL-CLI-008 (binding fields `reboot_window` and `livepatch`, status `updates` member) in `tools-techne`; KI-TOOL-CLI-116 (launcher-held `--wait-for` gates) in `tools-ki`. KI-HARNESS-GOV-170 (keep resolution targets local) is adopted to Next in `ki-agentic-harness`.
- **Host restart due.** The host is on kernel 7.0.0-1013 with the reboot-required flag set after the 2026-10-10 unattended run. The binding sets no `reboot_window` yet, so it needs the provider's stop and start; awaiting Kris's go.
- **Live record identifiers.** TECHNE-TOOLS-OPS-011 (the `.bashrc` marker), TECHNE-TOOLS-OPS-022 (instance user data), KI-ARCADIA-GOV-020 and KI-ARCADIA-GOV-023 (stack tags, description, recipe and guide) stay because changing them alters live state; proposed to fold into the TECHNE-TOOLS-OPS-017 rebuild.
- **The Mac.** `terra`; chezmoi `rigProfile` is `laptop`; Tailscale is up. `mise` 2026.10.6 and `codex` 0.162.0 stay off the recipe pins (2026.10.4 and 0.161.0).
- **`ki agent --wait-for` is unreliable** in ki 0.10.0 (KI-TOOL-CLI-116); sequence dependent runs by hand.
- The decisions log runs to Decision 35.

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
- References avoid roadmap record identifiers that will not last (Decision 32). Its durable owner is the cross-repository choreography rule in each repository's `AGENTS.md` and the `ki-work-roadmap` skill: a handoff names the originating repository, states the need and whether it blocks in plain terms, and links only durable documentation, never another repository's roadmap records (Decision 33). Code, checks and guides describe behaviour rather than cite pruned records. Checkpoints still cite records by full identifier, and `ki-accept` keeps its cross-repository link check before pruning (Decision 35).

## Files touched

ODR-KI-ARCADIA-001, ADR-KI-ARCADIA-003, the agent-host Project note and this checkpoint. Outside Arcadia: `recipes/agent-host/` and `operations/aws/agent-host/` in `ki-techne-harness`, the open records listed above, and the Techne host settings in chezmoi.

## Open questions

For Kris:

1. Stop and start the host now that the reboot flag is set.
2. Fold the remaining live record identifiers into the TECHNE-TOOLS-OPS-017 rebuild?
3. KI-HARNESS-GOV-170 scope: add `ki-accept`'s acceptance standard, and record cross-repository duplicates in plain words naming the repository but no identifier?
4. `mise` and `codex`: lower the Mac to the pins, raise the pins, or leave them (recommended: raise the pins).
5. Plan TECHNE-TOOLS-OPS-017 next.
6. Hand the machine-naming convention (Decision 29(a)) to the `rig.mac-studio-bootstrap` thread; not yet done.

Owned-host exemption for the Mac Studio is handled by KI-ARCADIA-GOV-033 in the `mac-studio-bootstrap` thread.

Parked tangents, each to get a home when picked up:

- **2026-10-09: personal harness instructions.** Kris wants the Claude and Codex instructions to become skills from a personal harness (not yet designed), leaving thin `CLAUDE.md` and `AGENTS.md`; the workstation bundle carries the files meanwhile. Cross-project: raise in state-of-play when picked up.

## Next step

1. Kris answers the open questions above; restart the host on his go.
