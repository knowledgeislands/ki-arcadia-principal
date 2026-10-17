---
note_type: streams/initiative
slug: rig
title: Rig
direction: Rig every host for its role, and keep the workstations every agent and person runs on accurate, tidy and observable.
lifecycle: active
lead: Kris Brown
updated: 2026-10-14T22:50:00Z
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
- **Handed on from [[mac-studio-setup|Mac Studio setup]].** None of these blocks that Project. Rig itself carries opt-in removal of unwanted software; Dock items filtered by profile, so `sol` can have a Dock; and reporting apps that update themselves or were installed from another source, with Warp, OneDrive and DaisyDisk on `sol` as examples. chezmoi carries the decisions on software found on the machines but not declared: act on the add and remove items first, then revisit the ones marked "leave".
- **Later, from the same Project:** NordVPN, the six untrusted Homebrew taps, the Command Line Tools update, and whether to swap the Tailscale GUI app for `tailscaled`. None has a record yet.
- **MAC-CLOUD, 2026-10-17.** Captured from Kris's intake, long term, no design: "can we build a Mac on AWS EC2? ... a service that offers a Mac mini in the cloud and I can ... install myself onto it and then more and more so I become a dumb terminal towards that ... that's more long term, and that's definitely rig-focused for the future". The Techne Agent host Project and the Programme Hold boundary are to be settled before any work. Detail: [themes.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/themes.md).
- **RIG-CATALOGUE, 2026-10-17.** Captured from Kris's intake, no design: "application config ... really is the remit of [dotfiles], but often a lot of systems ... mix up things like config and caching and state ... XDG ... compared to a lot of Mac apps which store their stuff in application support ... rig has a definition for each piece of software. A little bit like a brew file ... the rig system has a software catalog ... you could have a template ... it merges that item of config in from Rig's understanding of the default way of that working ... platform specific variations ... my existing rig config would be fine ... we can progressively enhance towards that". Existing material: tools-rig's XDG directory contract decision and the Observatory's tool-storage triage record; the chezmoi half is a Messages line in Rig: chezmoi; who takes it waits on Kris's RIG-OWNER. Detail: [themes.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/themes.md).
