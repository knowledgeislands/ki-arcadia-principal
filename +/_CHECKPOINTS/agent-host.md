---
type: ki-checkpoint
thread: agent-host
state: active
created_at: 2026-10-07T09:05:00Z
updated_at: 2026-10-09T06:45:00Z
---

# agent-host

## Objective

Reconstruct the `techne` working thread if its session is lost. Status, open records and ideas live in the [[agent-host]] Project note under the [[Initiatives/techne|Techne]] Initiative; this checkpoint copies none of them.

The thread moves agent work off the laptop onto the one agent host the [Techne Programme Hold](<../../Admin/Governance/Policies/Techne Programme Hold.md>) exempts. It delivers the durability rollout of [[ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host|ODR-KI-ARCADIA-001]] and the workstation rollout of [[ADR-KI-ARCADIA-003-the-agent-host-workstation-model|ADR-KI-ARCADIA-003]]. The [[baseline-rollout]] Project is separate and does not gate it. Mac Studio work belongs to the `mac-studio-bootstrap` thread.

## Current state

As of 2026-10-09:

- **Pins and expiries are live.** TECHNE-TOOLS-OPS-014 (pins, expiries, host instructions, host marker at `~/.config/ki/host-marker`) was delivered, run live on the host, accepted (Decision 19) and pruned (Decision 20). The live `setup.sh --pull` run on 2026-10-08 found 21 repositories, none at risk; no pin drift; a silent login banner; the GitHub token expiring on 2027-01-05; and no expiry on the Tailscale key.
- **The `--pull` fix is in.** The first setup run, without `--pull`, failed because the host's `ki-arcadia-principal` checkout was stale. The harness now suggests `--pull` when the estate repair fails, and the operator guide recommends it on every rerun (`ki-techne-harness` commit 2e6308f).
- **ki 0.10.0 is pinned but not on the host.** The recipe's ki pin was raised from 0.9.0 to 0.10.0 (commit 10ea36b), but the host still runs ki 0.9.0. The rerun to take it up (agent `setup-ki010`) was stopped before running because the harness commits were not then on origin. They are now: the local tracking refs show `ki-techne-harness` pushed to 70c3389 and the chezmoi source pushed to 423fae7 at about 06:40 BST on 2026-10-09, with nothing left unpushed in either. The rerun is therefore unblocked but has not run.
- **The workstation pilot is planned, still `draft`.** TECHNE-TOOLS-OPS-015 (harness, plan commit 70c3389) and DOTFILES-UE-073 (chezmoi, plan commit 423fae7) await Kris's approval. Kris's Mac renders a checked personal payload (minimal zsh, his Claude and Codex instructions, a Rig list starting with `mgit`) that becomes the only route for personal instructions on the host, replacing the `chezmoi cat` copy. New interactive SSH sessions hand off from bash to zsh with escape hatches, while non-interactive SSH, hooks and scripts stay in bash; the recipe stays general for any owner and works with no payload.
- **Behind the pilot**, all in triage: TECHNE-TOOLS-OPS-019 (person-neutral recipe defaults), TECHNE-TOOLS-OPS-017 (zsh at rebuild, blocked by TECHNE-TOOLS-OPS-015), TECHNE-TOOLS-OPS-016 and TECHNE-TOOLS-OPS-018 (`ki` Rig provider, then converging tools through Rig), TECHNE-TOOLS-OPS-020 (operator guide split), and TECHNE-TOOLS-OPS-021 with TECHNE-TOOL-CLI-007 (owned-host provider and adapter). TECHNE-TOOL-CLI-006 in `tools-techne` and KI-TOOL-CLI-115 in `tools-ki` are also in triage.
- The decisions log runs to Decision 21. No `techne` agents are running other than this handover.

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

ODR-KI-ARCADIA-001, ADR-KI-ARCADIA-003, KI-ARCADIA-GOV-031 (pruned), the agent-host Project note and this checkpoint. Outside Arcadia: TECHNE-TOOLS-OPS-013 and TECHNE-TOOLS-OPS-014 (both pruned) to TECHNE-TOOLS-OPS-021, `recipes/direct-host/rig.toml` and `operations/aws/agent-host/` in `ki-techne-harness`; TECHNE-TOOL-CLI-006 and TECHNE-TOOL-CLI-007 in `tools-techne`; and DOTFILES-UE-072 to DOTFILES-UE-074 in the chezmoi source. No remote state changed beyond pushes and the exempt host's setup runs.

## Open questions

For Kris:

1. Approve the TECHNE-TOOLS-OPS-015 and DOTFILES-UE-073 plans. Both then move to `ready`, and delivery runs up to but excluding the live run.
2. Confirm the pilot's record-level choices:
   - `mgit` by direct checksummed download;
   - a combined Codex file with the recipe rules first;
   - the two zsh escape hatches (an environment variable and a flag file);
   - temporary `AGENT_HOST_PROFILE` and `AGENT_HOST_SHELL` settings until the binding fields exist.
3. Agree to take the `chezmoi cat` removal out of TECHNE-TOOLS-OPS-019's scope, since TECHNE-TOOLS-OPS-015 takes it over.
4. Grant SSH separately for the pilot's live run when delivery reaches it.

Owned-host exemption for the Mac Studio is handled by KI-ARCADIA-GOV-033 in the `mac-studio-bootstrap` thread.

## Next step

1. Rerun `bash operations/aws/agent-host/setup.sh --pull`, `status.sh` (text and `--json`) and, over SSH, `rig status --profile direct-host` and `ki --version`, to confirm the host is on ki 0.10.0 with no drift. Decision 20 already authorises this rerun. Before running, check `git log origin/main..main` in `ki-techne-harness` is still empty.
2. Kris answers the open questions.
3. Deliver the pilot pair TECHNE-TOOLS-OPS-015 and DOTFILES-UE-073 from a fresh baseline, then TECHNE-TOOLS-OPS-019, TECHNE-TOOLS-OPS-017 and TECHNE-TOOLS-OPS-018 in that order.
