---
note_type: streams/project
slug: agent-host
title: Agent host
outcome: Agent work runs on a Techne agent host within the Techne Programme Hold's standing exemption, modelled as harness-defined recipes and person-owned bindings, with the prototype reviewed.
initiative: techne
lifecycle: active
lead: Kris Brown
target: null
updated: 2026-10-08T07:34:59Z
author: Written with Claude
---

# Agent Host

## Outcome

Move agent work into the Techne footprint on an agent host, inside the standing exemption from the [[Techne Programme Hold]]. Agent hosts are harness-defined recipes that a person binds into named instances, and the prototype is reviewed before the exemption is kept, widened or withdrawn.

This Project sits in [[Initiatives/techne|Techne]]. It and [[baseline-rollout]] do not gate each other.

---

## Notes

- **Exemption.** The [[Techne Programme Hold]] carries one standing exemption: setting up and operating the single agent host `ki-techne-agent-host`, built and torn down under the binding owner's administrator session and operated through the account-local operator role, with no automatic lapse and no fixed review date ([[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]]). The prototype review decided keep, with `direct-host` staying a recipe; the exemption is revisited when the hold is reshaped. Paperclip, Kitteth, Telegram, wider K3s, the controller and every other environment stay held.
- **Model.** `direct-host` is the first recipe and `agent-host` the first binding, rendered by chezmoi into `~/.config/techne/`. [[ADR-TECHNE-003-techne-implementation-ownership|ADR-TECHNE-003]] records the ownership split.
- **Durability.** [[ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host|ODR-KI-ARCADIA-001]] decides how work on the host stays safe: a structured status verdict, stop that warns, guarded rebuild and withdraw, declared pins, an expiry view, the Mac as the roadmap writing checkout, and the two-checkout rule.
- **Identity and egress.** The host's GitHub token and Claude login are the binding owner's own until unattended agents arrive. The security group allows TCP 443 and 80 to any address; named-destination egress is still open.
- **Durability rollout.** Every ODR-KI-ARCADIA-001 record is captured in its owning repository: the guarded-work pilot and the pins-and-expiries record in `ki-techne-harness`, guarded host commands in `tools-techne`, the two-checkout rule for Claude and Codex in the chezmoi source, the `ki` refusal of roadmap writes on the host marker in `tools-ki`, and a non-blocking handoff on where a writing-checkout designation lives in `ki-agentic-harness`. Host status stops showing a review date under the pins-and-expiries record.
- **Hold prerequisites.** Lifting the hold needs a local review-to-live-main cycle with recovery ([[paperclip-bootstrap-and-recovery]]), an account of what Paperclip supplies versus what Techne must add (harness working analysis `+/paperclip-as-techne-prior-art.md`), and a repository-owned remote-delivery policy.
- **Workstation.** [[ADR-KI-ARCADIA-003-the-agent-host-workstation-model|ADR-KI-ARCADIA-003]] decides how the host becomes the binding owner's working machine: the `direct-host` recipe's Rig profile for shared tools, Cheztoi as the chezmoi source's host-safe projection for the personal layer, Rig staged in three steps, zsh through a guarded hand-off, no detached delegation on the host yet, and Rig the only new binary. Its rollout is captured in `ki-techne-harness` and the chezmoi source, and each record names this Project. The Rig profile is folded into the harness's pins-and-expiries record. The pilot is one harness workstation record paired with the chezmoi Cheztoi host-profile record, after the durability pilot and the Rig profile stage. The `ki` Rig provider, the stack's zsh shell at the next rebuild, the gated move of the shared tools to `rig apply` and the host's detached delegation follow. `tools-techne` may need a profile argument for `techne host setup` and personal-tool drift in `techne host status`, settled when the pilot is planned.
- **Host set-up follow-ups.** An MCP source for the host (the `BIND-2` audit failures), and moving the three `ki` behaviour fixes found live (`ki dev local set` while the checkout is active, bootstrap without `--refresh`, the estate `diag` exit status) to `tools-ki`.
- **Controller as a recipe.** The held controller (`techne controller`, stack `ki-techne-ops-007-primary`) is a delegation-capable recipe and could later become a `techne host` binding, retiring `techne controller`. Revisit when the hold lifts.
- **CLI consistency.** `mgit` with no or an unknown subcommand runs its default action across every repository; fold into the `tools-mgit` help fix if Kris agrees.
- **Archived TECHNE copies.** Four TECHNE records still describe their archived `ki-techne-principal` copies as identical retained projections; only ADR-TECHNE-003 has been corrected.
- **Laptop relief.** Capture a standing-load record in its owning repository, then pause non-essential Rig agents and trim the MCP inventory; the chezmoi mcporter stall is related.
- **Techne cloud readiness.** An Arcadia record for the held full footprint - the Paperclip comparison promoted, the reconstructability inventory and the Paperclip workload design - only if Kris moves to reshape the hold.
- **Design outcomes.** The durability and workstation design loops are consolidated in [[ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host|ODR-KI-ARCADIA-001]] and [[ADR-KI-ARCADIA-003-the-agent-host-workstation-model|ADR-KI-ARCADIA-003]]; their working papers are deleted.
