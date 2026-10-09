---
type: ki-checkpoint
thread: techne.agent-host
label: 'Techne: agent-host'
state: active
created_at: 2026-10-07T09:05:00Z
updated_at: 2026-10-09T16:10:00Z
---

# techne.agent-host

## Objective

Reconstruct the `techne` working thread if its session is lost. Status, open records and ideas live in the [[agent-host]] Project note under the [[Initiatives/techne|Techne]] Initiative; this checkpoint copies none of them.

The thread moves agent work off the laptop onto the one agent host the [Techne Programme Hold](<../../Admin/Governance/Policies/Techne Programme Hold.md>) exempts. It delivers the durability rollout of [[ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host|ODR-KI-ARCADIA-001]] and the workstation rollout of [[ADR-KI-ARCADIA-003-the-agent-host-workstation-model|ADR-KI-ARCADIA-003]]. The [[baseline-rollout]] Project is separate and does not gate it. Mac Studio work belongs to the `mac-studio-bootstrap` thread.

## Current state

As of 2026-10-09:

- **Pins and expiries are live.** TECHNE-TOOLS-OPS-014 (pins, expiries, host instructions, host marker at `~/.config/ki/host-marker`) was delivered, run live on the host, accepted (Decision 19) and pruned (Decision 20). The live `setup.sh --pull` run on 2026-10-08 found 21 repositories, none at risk; no pin drift; a silent login banner; the GitHub token expiring on 2027-01-05; and no expiry on the Tailscale key.
- **The `--pull` fix is in.** The first setup run, without `--pull`, failed because the host's `ki-arcadia-principal` checkout was stale. The harness now suggests `--pull` when the estate repair fails, and the operator guide recommends it on every rerun (`ki-techne-harness` commit 2e6308f).
- **The host runs ki 0.10.0.** The recipe's ki pin was raised from 0.9.0 to 0.10.0 (commit 10ea36b) and the 2026-10-09 setup `--pull` rerun took it up: 21 repositories, none at risk, no pin drift, banner silent.
- **The workstation pilot is replanned, still `draft`.** Kris accepted the workstation bundle walkthrough on 2026-10-09 (Decision 26(a)), including the chezmoi-native per-host manifest. TECHNE-TOOLS-OPS-015 (harness, commit c5ec234: optional `target_host` checked against `host.id`) and DOTFILES-UE-073 (chezmoi, commit 9685af8: one `chezmoi archive` call with `--override-data`, `scripts/cheztoi-render` as a thin wrapper, host variants as `cheztoi`-keyed templates) now match it and await Kris's approval. Kris's Mac renders a checked personal payload (minimal zsh, Claude and Codex instructions, a Rig list starting with `mgit`) that becomes the only route for personal instructions on the host, replacing the `chezmoi cat` copy. New interactive SSH sessions hand off from bash to zsh with escape hatches, while non-interactive SSH, hooks and scripts stay in bash; the recipe stays general for any owner and works with no payload.
- **Behind the pilot**, all in triage: TECHNE-TOOLS-OPS-019 (person-neutral recipe defaults), TECHNE-TOOLS-OPS-017 (zsh at rebuild, blocked by TECHNE-TOOLS-OPS-015), TECHNE-TOOLS-OPS-016 and TECHNE-TOOLS-OPS-018 (`ki` Rig provider, then converging tools through Rig), TECHNE-TOOLS-OPS-020 (operator guide split), and TECHNE-TOOLS-OPS-021 with TECHNE-TOOL-CLI-007 (owned-host provider and adapter). TECHNE-TOOL-CLI-006 in `tools-techne` and KI-TOOL-CLI-115 in `tools-ki` are also in triage.
- **The host was restarted on 2026-10-09** through the operator stop/start (Decision 25), moving the kernel from 7.0.0-1012 to 7.0.0-1013 and clearing the reboot flag; status stayed clean (21 repositories, none at risk, no pin drift). Unattended-upgrades installs security updates daily but never reboots, and Livepatch is not attached, so the 7.0.0-1014 kernel due in the 2026-10-10 run will set the reboot flag again; Kris accepts the one provider stop/start it needs (Decision 26(c)).
- **Patching is planned, still `draft`.** Kris answered TECHNE-TOOLS-OPS-022's six decisions on 2026-10-09, all as recommended (Decision 26(b)): no automatic reboot by default, an optional binding window of weekday and host-local time (such as `Sun 04:00`), Livepatch as an opt-in binding field that Kris does not use, security-only unattended scope, updates never changing the status outcome, and no rebuild. The plan (commit 08db094) matches and awaits Kris's approval. The paired `tools-techne` record TECHNE-TOOL-CLI-008 (binding fields `reboot_window` and `livepatch`, status `updates` member) is in triage, non-blocking.
- The decisions log runs to Decision 26. No `techne` agents are running other than this handover.

Thread rules:

- Background agents run through `ki agent` under the run name `techne`, with status, reports and the decisions log in `~/.local/state/ki/agents/techne/`.
- Estate rules from 2026-10-07: roadmap records use the v1 model (`kind`, `project`, `component`, `horizon` with a `hold` block); trades are on hold, so work is done directly or recorded in the receiving repository; `/ki-design-loop` runs for any Techne design question whose shape is still open.
- No remote agent execution or remote-environment changes outside the standing exemption. Each live host run needs Kris's SSH grant. Live rebuilds and withdrawals are the binding owner's alone.
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
- The host-marker path is `~/.config/ki/host-marker`, and ki is pinned at 0.10.0 (Decisions 19 and 20).
- The workstation pilot plans come back to Kris for approval before delivery (Decision 20).

## Files touched

ODR-KI-ARCADIA-001, ADR-KI-ARCADIA-003, KI-ARCADIA-GOV-031 (pruned), the agent-host Project note and this checkpoint. Outside Arcadia: TECHNE-TOOLS-OPS-013 and TECHNE-TOOLS-OPS-014 (both pruned) to TECHNE-TOOLS-OPS-021, TECHNE-TOOLS-OPS-022, `recipes/direct-host/rig.toml` and `operations/aws/agent-host/` in `ki-techne-harness`; TECHNE-TOOL-CLI-006, TECHNE-TOOL-CLI-007 and TECHNE-TOOL-CLI-008 in `tools-techne`; and DOTFILES-UE-072 to DOTFILES-UE-074 in the chezmoi source. No remote state changed beyond pushes and the exempt host's setup runs.

## Open questions

For Kris:

1. Approve the TECHNE-TOOLS-OPS-015 and DOTFILES-UE-073 plans, now matching the accepted walkthrough (Decision 26(a)). Both then move to `ready`, and delivery runs up to, but excluding, the live run. With them, confirm whether `target_host` should match `host.id` as decided, given that on AWS `host.id` is the instance ID and changes at every rebuild, or a stable host name instead.
2. Confirm the pilot's record-level choices:
   - `mgit` by direct checksummed download;
   - a combined Codex file with the recipe rules first;
   - the two zsh escape hatches (an environment variable and a flag file);
   - temporary `AGENT_HOST_PROFILE` and `AGENT_HOST_SHELL` settings until the binding fields exist.
3. Answered: TECHNE-TOOLS-OPS-019 no longer carries the `chezmoi cat` removal, which TECHNE-TOOLS-OPS-015 owns (Decision 24(c)); the record keeps the person-neutral defaults and the binding fields.
4. Grant SSH separately for the pilot's live run when delivery reaches it.
5. Approve the TECHNE-TOOLS-OPS-022 plan (`draft` to `ready`); its six decisions are answered (Decision 26(b)). Until it is delivered, each kernel update needs a provider stop/start, starting with the 2026-10-10 kernel.

Owned-host exemption for the Mac Studio is handled by KI-ARCADIA-GOV-033 in the `mac-studio-bootstrap` thread.

Parked tangents, noted to come back to; each gets a home (Project, roadmap record or nothing) when picked up:

- **2026-10-09: personal harness for instructions.** Kris wants Claude and Codex instructions to become skills from a personal harness (not yet designed), leaving thin `CLAUDE.md` and `AGENTS.md`; the workstation bundle carries the files meanwhile. Cross-project: raise in state-of-play when picked up.

## Next step

1. Kris approves the TECHNE-TOOLS-OPS-015, DOTFILES-UE-073 and TECHNE-TOOLS-OPS-022 plans, and stops and starts the host after the 2026-10-10 kernel update.
2. Deliver the pilot pair TECHNE-TOOLS-OPS-015 and DOTFILES-UE-073 from a fresh baseline, then TECHNE-TOOLS-OPS-019, TECHNE-TOOLS-OPS-017 and TECHNE-TOOLS-OPS-018 in that order.
