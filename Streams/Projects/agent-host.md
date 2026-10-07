---
note_type: streams/project
slug: agent-host
title: Agent host
outcome: Agent work runs on a Techne agent host within the Techne Programme Hold's standing exemption, modelled as harness-defined recipes and person-owned bindings, with the prototype reviewed.
initiative: techne
lifecycle: active
lead: Kris Brown
target: null
updated: 2026-10-07T19:00:00Z
author: Written with Claude
---

# Agent Host

## Outcome

Move agent work into the Techne footprint on an agent host, inside the standing exemption from the [[Techne Programme Hold]]. Agent hosts are harness-defined recipes that a person binds into named instances, and the prototype is reviewed before the exemption is kept, widened or withdrawn.

This Project sits in [[Initiatives/techne|Techne]]. It and [[baseline-rollout]] do not gate each other.

---

## Notes

- **Exemption.** The [[Techne Programme Hold]] carries one standing exemption: setting up and operating the single agent host `ki-techne-agent-host` with Kris's own credentials through the account-local operator role, with no automatic lapse and a review on 2026-11-06 ([[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]]). Paperclip, Kitteth, Telegram, wider K3s, the controller and every other environment stay held.
- **Model.** `direct-host` is the first recipe and `agent-host` the first binding, rendered by chezmoi into `~/.config/techne/`. [[ADR-TECHNE-003-techne-implementation-ownership|ADR-TECHNE-003]] records the ownership split.
- **Egress and identity.** The security group allows TCP 443 and 80 to any address; named-destination egress and the GitHub and model API credential identity are open questions for the review.
- **Hold prerequisites.** Lifting the hold needs a local review-to-live-main cycle with recovery ([[paperclip-bootstrap-and-recovery]]), an account of what Paperclip supplies versus what Techne must add (harness working analysis `+/paperclip-as-techne-prior-art.md`), and a repository-owned remote-delivery policy.
- **Host usable like Kris's machine.** Bring Kris's command-line tools onto the host - `mgit`, `ki`, `techne`, chezmoi and Cheztoi - most likely as a chezmoi host profile delivered as the first slice of the Cheztoi profile work, with its stale hold rewritten. Open in shape; a candidate for a design loop.
- **Host set-up follow-ups.** Work durability in `stop.sh` and `destroy.sh`; the two-checkout rule and a designated roadmap writing checkout; keeping the host's pins current; a standing expiry view; an MCP source for the host (the `BIND-2` audit failures); and moving the three `ki` behaviour fixes found live (`ki dev local set` while the checkout is active, bootstrap without `--refresh`, the estate `diag` exit status) to `tools-ki`.
- **Controller as a recipe.** The held controller (`techne controller`, stack `ki-techne-ops-007-primary`) is a delegation-capable recipe and could later become a `techne host` binding, retiring `techne controller`. Revisit when the hold lifts.
- **CLI consistency.** `mgit` with no or an unknown subcommand runs its default action across every repository; fold into the `tools-mgit` help fix if Kris agrees.
- **Archived TECHNE copies.** Four TECHNE records still describe their archived `ki-techne-principal` copies as identical retained projections; only ADR-TECHNE-003 has been corrected.
- **Laptop relief.** Capture a standing-load record in its owning repository, then pause non-essential Rig agents and trim the MCP inventory; the chezmoi mcporter stall is related.
- **Techne cloud readiness.** An Arcadia record for the held full footprint - the Paperclip comparison promoted, the reconstructability inventory and the Paperclip workload design - only if Kris moves to reshape the hold.
