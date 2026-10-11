---
note_type: streams/initiative
slug: rig
title: Rig
direction: Keep the workstation every agent and person runs on accurate, tidy and observable.
lifecycle: active
lead: Kris Brown
updated: 2026-10-11T01:50:00Z
author: Written with Claude
---

# Rig

## Direction

The workstation every agent and person runs on: chezmoi-managed configuration, local services, secrets hygiene and agent state. Agent hosting off the workstation belongs to [[Initiatives/techne|Techne]], and the shared toolchain to [[platform-foundations|Platform foundations]].

---

## Notes

- **Projectless upkeep.** Workstation hygiene keeps the host accurate, tidy and observable and is never finished. Its records live in the chezmoi roadmap, not in a `knowledgeislands` repository, and name this Initiative directly. chezmoi's recurring housekeeping templates run the routine checks.
- **Idea: same-boot mcporter stall.** If the same-boot stall returns - both mcporter launchd jobs running but the bridge's `tools/list` failing - diagnose it with a bounded, sanitised live trace of the bridge, without a restart, before any whole-pair restart. Kept as an idea on 2026-10-11 in place of a cancelled chezmoi work record, because the stall has not recurred (Decision 47 of the chezmoi thread).
- **Handed on from [[mac-studio-bootstrap|Mac Studio bootstrap]].** None of these blocks that Project. Rig itself carries opt-in removal of unwanted software; Dock items filtered by profile, so `sol` can have a Dock; and reporting apps that update themselves or were installed from another source, with Warp, OneDrive and DaisyDisk on `sol` as examples. chezmoi carries the decisions on software found on the machines but not declared: act on the add and remove items first, then revisit the ones marked "leave".
- **Later, from the same Project:** NordVPN, the six untrusted Homebrew taps, the Command Line Tools update, and whether to swap the Tailscale GUI app for `tailscaled`. None has a record yet.
