---
type: ki-checkpoint
thread: techne.agent-host
label: 'Techne: agent-host'
state: active
created_at: 2026-10-07T09:05:00Z
updated_at: 2026-10-11T02:55:00Z
---

# techne.agent-host

## Objective

Reconstruct the `techne` working thread if its session is lost. Status, open records and ideas live in the [[agent-host]] Project note under the [[Initiatives/techne|Techne]] Initiative; this checkpoint copies none of them.

The thread moves agent work off the laptop onto the one agent host the [Techne Programme Hold](<../../Admin/Governance/Policies/Techne Programme Hold.md>) exempts. It delivers the durability rollout of [[ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host|ODR-KI-ARCADIA-001]] and the workstation rollout of [[ADR-KI-ARCADIA-003-the-agent-host-workstation-model|ADR-KI-ARCADIA-003]]. The [[baseline-rollout]] Project is separate and does not gate it. Mac Studio work belongs to the `mac-studio-bootstrap` thread.

## Current state

Verified on 2026-10-11 at about 03:55 BST.

Mark: 2026-10-09T21:40Z, decisions log at Decision 34

ki-delegation read at cfa9c458

- **Repositories.** `ki-arcadia-principal` is level with origin. Harness commits for TECHNE-TOOLS-OPS-017, TECHNE-TOOLS-OPS-023 and TECHNE-TOOLS-OPS-024, and the KI-HARNESS-GOV-170 scope change in `ki-agentic-harness`, await Kris's push.
- **Delivered and closed.** OS patching (TECHNE-TOOLS-OPS-022) and the chezmoi workstation bundle (DOTFILES-UE-073) are accepted and pruned. The workstation pilot (TECHNE-TOOLS-OPS-015) is accepted and kept, not pruned. The `agent-host` rename is live everywhere, including on the host.
- **The host.** Restarted through the provider on 2026-10-10: kernel 7.0.0-1014, no reboot flag, status clean.
- **Pins.** `recipes/agent-host/rig.toml` in the harness is the one list of host tool versions; `mise` and `codex` are raised to 2026.10.6 and 0.162.0. The Mac is no longer compared against it; TECHNE-TOOLS-OPS-024 (weekly pin bump) is planned, draft.
- **Ready, held.** TECHNE-TOOLS-OPS-017 (zsh, the `vega` rename and removal of the remaining live record identifiers, at rebuild) is ready. Its build and the approval of TECHNE-TOOLS-OPS-024 are held for the Rig and Techne boundary audit (Decision 39), written at `Streams/Projects/agent-host/design/rig-techne-boundary-audit.md` and awaiting Kris's ten decisions.
- **In triage.** TECHNE-TOOLS-OPS-016, TECHNE-TOOLS-OPS-018, TECHNE-TOOLS-OPS-019 and TECHNE-TOOLS-OPS-023 in the harness; TECHNE-TOOL-CLI-006 and TECHNE-TOOL-CLI-008 in `tools-techne`; KI-TOOL-CLI-116 (launcher-held `--wait-for` gates) in `tools-ki`. KI-HARNESS-GOV-170 (keep resolution targets local) is planned, draft, in `ki-agentic-harness`.
- **The Mac.** `terra`; chezmoi `rigProfile` is `laptop`; Tailscale is up.
- **`ki agent --wait-for` is unreliable** in ki 0.10.0 (KI-TOOL-CLI-116); sequence dependent runs by hand.
- No background agents running. The decisions log runs to Decision 39.

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

- **AUDIT:** answer the ten decisions in the Rig and Techne boundary audit; then hand the outcome to state-of-play and release or reshape the TECHNE-TOOLS-OPS-017 build and the TECHNE-TOOLS-OPS-024 approval.
- **NAMES:** hand the machine-naming convention (Decision 29(a)) to the `rig.mac-studio-bootstrap` thread; a paste-in line was given, not yet confirmed sent.
- **PUSH:** push the harness and `ki-agentic-harness` commits.

Owned-host exemption for the Mac Studio is handled by KI-ARCADIA-GOV-033 in the `mac-studio-bootstrap` thread.

- Parked 2026-10-09: personal harness instructions - Kris wants the Claude and Codex instructions to become skills from a personal harness, leaving thin `CLAUDE.md` and `AGENTS.md`; raise in state-of-play when picked up.

## Next step

1. Kris answers AUDIT; the thread then releases or reshapes the held work.
