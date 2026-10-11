---
note_type: pillars/note
updated: 2026-10-11T14:00:00Z
author: Written with Claude
---

# Hosts, Roles and Layers

## In one paragraph

Every machine Kris works on or sends agents to is built in the same four layers. **Techne** gets the machine to a reachable, patched, ready state (the base). **Rig** then rigs it up with the tools its job needs (the role). **Techne, through `ki`**, adds the repositories and working rules (the workspace). **chezmoi** - or **Cheztoi** on less-trusted machines - makes it feel like Kris's own (the personal layer). How each tool reaches each operating system is a separate supply question: packaging. The short version is: _Techne takes a host to base and ready; Rig rigs it up._

The detail and the evidence behind this are in the [[rig-techne-boundary-audit|Rig and Techne boundary audit]], whose ten decisions Kris accepted on 2026-10-11.

---

## The layers

| Layer | What it answers | Who owns it | Example on `vega` |
| --- | --- | --- | --- |
| Base | Is there a reachable, patched machine with an operator user? | Techne: `ki-techne-harness` recipes, `tools-techne` commands | The AWS stack builds an Ubuntu instance, joins Tailscale and turns on security patching |
| Role | Which tools, at which versions, does this kind of machine need? | Rig: the `tools-rig` engine applying a role profile | `rig apply` installs `ki`, `mise`, `bun`, `node`, Codex and Claude Code |
| Workspace | Which repositories, skills and working rules? | Techne, through `ki` | Clone the repository set, run `ki bootstrap`, write the host marker |
| Personal | How does this person like it? | chezmoi on trusted machines, Cheztoi on less-trusted ones | The Cheztoi payload drops Kris's zsh setup and agent instructions |
| Packaging | How does each tool get onto each OS? | Each `tools-*` repository's release, plus thin channels | `ki` arrives as a signed release archive |

```text
   personal    chezmoi (terra, sol)  |  Cheztoi (vega)
   workspace   repositories, ki bootstrap, working rules      <- Techne via ki
   role        tools for the job, applied by Rig               <- Rig
   base        reachable, patched, operator user, Rig present  <- Techne
   ------------------------------------------------------------
   packaging   how every tool above is supplied
```

### The hand-off

Techne stops at a **ready host**: reachable over Tailscale by SSH, base packages present, patching on, secrets delivered, Rig and `mise` installed, and a small facts file saying what the machine is called and which roles it carries. From there setup runs three steps in order: Rig applies the role, the workspace step clones and bootstraps, and the personal layer goes on last.

On `sol`, Kris does the base by hand; the same three steps then apply, with chezmoi in place of Cheztoi. On `vega`, the AWS stack does the base.

---

## The roles

A role is what a machine is _for_. A machine has one base and one or more roles.

| Role | What it is for | Personal layer | Machines |
| --- | --- | --- | --- |
| Workstation | A person at the keyboard: apps, Dock, macOS settings | chezmoi | `terra`, `sol` |
| Remote agentic rig | Agent sessions Kris opens over Tailscale SSH, with the KI toolchain and a workspace | chezmoi on owned machines, Cheztoi on less-trusted ones | `vega`, `sol` |
| Appliance | Runs one service, such as a Paperclip environment, with no remote desktop and no personal shell | none, or a minimal Cheztoi payload | none yet |

`sol` carries two roles at once: it is a workstation and a remote agentic rig. `vega` and `sol` are the same role on different bases, a cloud instance and an owned Mac, so they should share one definition of the agentic-rig toolchain. The appliance role is recorded but has no recipe: anything that runs Paperclip remotely stays held by the [[Techne Programme Hold]]. `vega`'s own exemption is [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]].

---

## Machine names

| Kind | Naming rule | Names |
| --- | --- | --- |
| Physical machine | A body in our solar system | `sol` (the Mac Studio), `terra` (the laptop) |
| Peripheral | A moon | `luna`, `phobos` (external drives) |
| Non-physical host | A star system of its own | `vega` (the AWS host) |

Machine names are not recipe names. The Techne recipe that builds `vega`'s base stays called `agent-host` and is described as "the AWS base for a remote agentic rig". A second recipe, for an appliance or an owned host, would be the moment to revisit that name.

---

## Versions

Each role says what versions it needs, and the policy depends on how the machine is kept:

- **Rebuildable hosts** such as `vega` pin **exact** versions, so a rebuild gives the same machine.
- **Workstations** such as `terra` and `sol` take the **newest** from Homebrew.
- The role declares **minimums** that both satisfy, so `vega` and `sol` agree on what a KI session needs even though one pins and one floats.

The agentic-rig role profile moves out of the `agent-host` recipe into a recipe-independent `roles/` folder in `ki-techne-harness`, so other recipes and `sol` can include it.

## Packaging

One **KI release contract** is the canonical artefact for every KI and personal tool: per-platform archives (macOS and Linux, Intel and ARM), a checksum manifest, a signature, and an installer with the key built in, as `ki` already does. Three thin channels deliver it:

- the **Homebrew tap**, for Macs;
- a **signed-release install kind** in Rig, so any role can install KI tools on any OS - this replaces the planned harness-only provider and amends [[ADR-KI-ARCADIA-003-the-agent-host-workstation-model|ADR-KI-ARCADIA-003]];
- the **installer**, for bootstrap, where Rig is not yet present.

apt, AUR and Nix are deferred until an appliance fleet or an Arch workstation actually exists.

---

## Omarchy

`vega` stays on **Ubuntu LTS**: it has a security-only update channel, Livepatch and ready-made AWS images, and it does not need a desktop. Omarchy, an opinionated Arch desktop, would cost an OS axis in the AWS provider and lose security-only patching for little gain. It is kept in view for a possible future **owned Linux workstation**, where Rig would then need a pacman provider and Kris's catalogue would need Arch variants.

---

## Related

- [[rig-techne-boundary-audit|Rig and Techne boundary audit]] - the full inventory, options and decisions.
- [[ADR-KI-ARCADIA-003-the-agent-host-workstation-model|ADR-KI-ARCADIA-003]] - how the agent host becomes its owner's working machine.
- [[ADR-KI-ARCADIA-006-techne-implementation-ownership|ADR-KI-ARCADIA-006]] - which repository owns recipes, providers and bindings.
- [[ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host|ODR-KI-ARCADIA-001]] - how work on the agent host stays safe.
- [[Engineering Estate]] - the wider architectural roles this sits within.
