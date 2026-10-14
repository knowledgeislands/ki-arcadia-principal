---
note_type: streams/initiative
slug: rig
title: Rig
direction: Rig every host for its role, and keep the workstations every agent and person runs on accurate, tidy and observable.
lifecycle: active
lead: Kris Brown
updated: 2026-10-14T21:02:00Z
author: Written with Claude
---

# Rig

## Direction

Rig owns the role layer: once [[Initiatives/techne|Techne]] has made a host ready, the `tools-rig` engine applies the tools that host's role needs, on macOS or Linux. It also keeps the workstations every agent and person runs on accurate, tidy and observable: chezmoi-managed configuration, local services, secrets hygiene and agent state. A host's base and workspace belong to Techne, its personal layer to chezmoi or Cheztoi, and the shared toolchain to [[platform-foundations|Platform foundations]].

Three roles are recognised. A **workstation** has a person at the keyboard (`terra`, `sol`). A **remote agentic rig** runs agent sessions the owner opens over Tailscale SSH (`vega`, `sol`); `sol` and `vega` share one agentic-rig role definition. An **appliance** runs one service with no personal shell; it is recorded as a role but has no recipe. Omarchy is kept in view for a future owned Linux workstation, not for `vega`.

[[Hosts, Roles and Layers]] explains the layers and roles in plain language.

---

## Notes

- **Projectless upkeep.** Workstation hygiene keeps the host accurate, tidy and observable and is never finished. Its records live in the chezmoi roadmap, not in a `knowledgeislands` repository, and name this Initiative directly. chezmoi's recurring housekeeping templates run the routine checks.
- **Idea: same-boot mcporter stall.** If the same-boot stall returns - both mcporter launchd jobs running but the bridge's `tools/list` failing - diagnose it with a bounded, sanitised live trace of the bridge, without a restart, before any whole-pair restart. Kept as an idea on 2026-10-11 in place of a cancelled chezmoi work record, because the stall has not recurred; Kris approved on 2026-10-11, as logged in the chezmoi run, cancelling and pruning the three chezmoi records as ideas under the Rig Initiative, agent-host and secrets-hygiene.
- **Handed on from [[mac-studio-bootstrap|Mac Studio bootstrap]].** None of these blocks that Project. Rig itself carries opt-in removal of unwanted software; Dock items filtered by profile, so `sol` can have a Dock; and reporting apps that update themselves or were installed from another source, with Warp, OneDrive and DaisyDisk on `sol` as examples. chezmoi carries the decisions on software found on the machines but not declared: act on the add and remove items first, then revisit the ones marked "leave".
- **Later, from the same Project:** NordVPN, the six untrusted Homebrew taps, the Command Line Tools update, and whether to swap the Tailscale GUI app for `tailscaled`. None has a record yet.
- **Idea for evaluation, 2026-10-14: setting up and addressing hosts on the tailnet.** Kris: host-network setup "needs its own thought", and the tailnet is the VPN substrate, not the interaction mechanism. Held here because no existing Project owns it: it spans `terra`, `sol` and `vega`, so it fits neither [[mac-studio-bootstrap|Mac Studio bootstrap]] nor [[agent-host|Agent host]]. Ideas to evaluate: naming hosts and services, with name URLs rather than IP and port; tailnet ACLs; tailnet-only listeners following the tailnet-only listener pattern in `tools-rig`; and the host and service naming scheme Paperclip is waiting for. Every change here is connection-critical and needs a rollout plan with a tested restore path that reconnects first. When Mac Studio bootstrap closes, its `hosts.md` would move to whichever home Kris chooses. Whether this opens as its own evaluation-stage Project (`host-network`) is Kris's open query NEW-AREAS. Evidence: [areas-proposal](<../../+/_THREADS/state-of-play/areas-proposal.report.md>) and [sync-telemetry](<../../+/_THREADS/state-of-play/sync-telemetry.report.md>).
