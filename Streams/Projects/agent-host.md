---
note_type: streams/project
slug: agent-host
title: Agent host
outcome: Agent work runs on a Techne agent host within the Techne Programme Hold's standing exemption, modelled as harness-defined recipes and person-owned bindings, with the prototype reviewed.
initiative: techne
lifecycle: active
lead: Kris Brown
target: null
updated: 2026-10-07T17:20:00Z
author: Written with Claude
---

# Agent Host

## Outcome

Move agent work into the Techne footprint on an agent host, inside the standing exemption from the [[Techne Programme Hold]]. The current model treats agent hosts as harness-defined recipes that a person binds into named instances (`KI-ARCADIA-GOV-025`), and the prototype is reviewed under [[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|KI-ARCADIA-GOV-021]].

This Project sits in [[Initiatives/techne|Techne]]. It and [[baseline-rollout]] do not gate each other.

---

## Update

Records read on 2026-10-07 at about 18:20 BST; recheck before acting.

- **Health.** On track. The host is built and in use for Kris-opened sessions, the recipe and binding model is delivered across the harness, `tools-techne` and chezmoi, and Kris's live checks of the `techne` CLI passed on 2026-10-07. A stated judgement for Kris to confirm.
- **Exemption.** The [[Techne Programme Hold]] carries one standing exemption: setting up and operating the single agent host `ki-techne-agent-host` with Kris's own credentials through the account-local operator role, with no automatic lapse and a review on 2026-11-06 ([[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]]). Paperclip, Kitteth, Telegram, wider K3s, the controller and every other environment stay held.
- **Model.** Agent hosts are harness-defined recipes that a person binds into named instances; `direct-host` is the first recipe and `agent-host` the first binding, rendered by chezmoi into `~/.config/techne/`. [[ADR-TECHNE-003-techne-implementation-ownership|ADR-TECHNE-003]] records the ownership split. `KI-ARCADIA-GOV-025`, harness `TECHNE-TOOLS-OPS-011` and `OPS-012`, `tools-techne` `TECHNE-TOOL-CLI-004` and `CLI-005`, and chezmoi `DOTFILES-UE-068` to `UE-070` are done and pruned or closed.
- **Host.** Reached over Tailscale SSH as `techne`. `setup.sh` reruns with no changes and `status.sh` reports unlanded work and expiry. It still has the AWS default hostname and no `zsh` until rebuilt; `codex login status` has not been checked since OPS-011's acceptance; the hand set-up backups `~/.profile.bak-ops011-*` and `~/.bashrc.bak-ops011-*` remain for Kris to delete. The GitHub token expires on 2026-11-06, the day of the review.
- **Egress and identity.** The security group allows TCP 443 and 80 to any address; named-destination egress and the GitHub and model API credential identity are not yet evidenced (`KI-ARCADIA-GOV-023` review).
- **Hold prerequisites.** 1, the local review-to-live-main cycle and recovery: not met ([[paperclip-bootstrap-and-recovery]]). 2, what Paperclip supplies versus what Techne must add: partial, in the harness working analysis `+/paperclip-as-techne-prior-art.md`. 3, a repository-owned remote-delivery policy: not met, no record.
- **Next step.** Kris chooses a time for the host rebuild: first the no-change CloudFormation change set from the harness operator guide's "Before a rebuild" step, which must show no change; then the rebuild for the hostname and `zsh`; then proof that `techne host setup --host agent-host` re-converges. Ahead of 2026-11-06, assemble GOV-021's inputs from the owning records.

---

## Open records

Status lives in each record.

- [[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|KI-ARCADIA-GOV-021]] - Review the agent-host prototype on 2026-11-06: keep, widen or withdraw the exemption, and whether to reshape the hold
- `DOTFILES-UE-020` (chezmoi) - Implement Cheztoi profile. Held on `TECHNE-GOV-005` and `KI-HARNESS-RTP-012`; the first is in the retired `ki-techne-principal`, so the hold condition is stale

---

## Ideas

Not yet captured as records.

- **Host usable like Kris's machine.** Bring Kris's command-line tools onto the host - `mgit`, `ki`, `techne`, chezmoi and Cheztoi - most likely as a chezmoi host profile delivered as the first slice of `DOTFILES-UE-020`, with its stale hold rewritten. Open in shape; a candidate for a design loop.
- **OPS-011 follow-ups**, named at its acceptance and now homed only here: work durability in `stop.sh` and `destroy.sh`; the two-checkout rule and a designated roadmap writing checkout; keeping the host's pins current; a standing expiry view; an MCP source for the host (the 21 `BIND-2` audit failures); and moving the three `ki` behaviour fixes found live (`ki dev local set` while the checkout is active, bootstrap without `--refresh`, the estate `diag` exit status) to `tools-ki`.
- **Controller as a recipe.** The held controller (`techne controller`, stack `ki-techne-ops-007-primary`) is a delegation-capable recipe and could later become a `techne host` binding, retiring `techne controller`. Revisit when the hold lifts.
- **CLI consistency.** `mgit` with no or an unknown subcommand runs its default action across every repository; fold into the `tools-mgit` help fix if Kris agrees.
- **Archived TECHNE copies.** Four TECHNE records still describe their archived `ki-techne-principal` copies as identical retained projections; GOV-025 corrected only ADR-TECHNE-003.
- **Laptop relief.** Capture a standing-load record in its owning repository, then pause non-essential Rig agents and trim the MCP inventory; chezmoi `DOTFILES-UE-065` (mcporter stall) is related.
- **Techne cloud readiness.** An Arcadia record for the held full footprint - prerequisite 2 promoted, the reconstructability inventory and the Paperclip workload design - only if Kris moves to reshape the hold.

---

## Sources

Created by KI-ARCADIA-GOV-026. Update and Ideas moved here from the `techne` thread checkpoint on 2026-10-07; the checkpoint now holds only thread reconstruction.
