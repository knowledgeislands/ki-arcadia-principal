---
note_type: streams/initiative
slug: techne
title: Techne
direction: Take hosts to ready, move agent work into a governed Techne footprint and make the agent fleet useful, within the Techne Programme Hold.
lifecycle: active
lead: Kris Brown
updated: 2026-10-13T23:00:00Z
author: Written with Claude
---

# Techne

## Direction

Techne takes hosts to ready: it owns a host's base (provisioning, patching, identity, secrets delivery, the operator user and lifecycle) and its workspace (the repository set, `ki bootstrap` and working rules, through `ki`). [[rig|Rig]] then applies the host's role, and the shared toolchain belongs to [[platform-foundations|Platform foundations]]. Techne also moves agent work into a governed footprint and makes the agent fleet deliver reviewed work. The [[Techne Programme Hold]] bounds what may run remotely; Knowledge Islands Principal owns the engineering decisions, while `ki-techne-harness` and `tools-techne` own their implementation.

The `agent-host` recipe is the AWS base for a remote agentic rig. `vega` stays on Ubuntu LTS, for its security-only update channel, Livepatch and ready-made images. The appliance role has no recipe until the hold is reshaped.

[[Hosts, Roles and Layers]] explains the layers and roles in plain language.

---

## Notes

- [[Techne Programme Hold]] bounds what may run remotely. Remote delivery needs its own repository-owned policy.
- The agent-host Project thread keeps its own checkpoint, [techne.agent-host](../../+/_CHECKPOINTS/techne.agent-host.md), for thread reconstruction.
- There is no projectless upkeep and no recurring Activity.
