---
note_type: streams/design
updated: 2026-10-11T03:52:00Z
author: Written with Claude
---

# Decisions in force

**For:** Kris Brown - **Project:** [[mac-studio-bootstrap|Mac Studio bootstrap]], with [[Initiatives/rig|Rig]] - **Date:** 2026-10-11

The decisions that still guide `sol`, the Mac Studio, stated as they stand today. History and superseded choices are left out.

The full decisions log is machine-local run state on the laptop at `~/.local/state/ki/agents/mac-studio-bootstrap/decisions.md`; it is not in Git.

---

## Ownership and access

- `sol` is Kris's own hardware. Rig and chezmoi build and maintain it as Kris's rig on another machine, on the `studio` profile, which builds on `core`. Techne may deploy onto it but never owns its build.
- Remote agent use of `sol` is exempt from the Techne hold under [[GDR-KI-PRINCIPAL-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-PRINCIPAL-004]]. Agents administer it over Tailscale and SSH, with Kris approving each step.
- The laptop's SSH key passes through to `sol` by agent forwarding, for `sol` only, so remote sessions there can reach GitHub.
- The HNR harness stays on `sol` and in its `ki` registry.

## Restarts and login

- Any reboot of `sol` needs Kris present, because FileVault keeps it offline until Kris unlocks it in person.
- Tailscale stays the GUI app, set to open at login. Swapping it for `tailscaled` is a later Rig item.
- 1Password-backed chezmoi targets are applied at `sol`'s screen, not over SSH.

## Software

- One software list serves every machine: `core` holds what both Macs share, and `laptop` and `studio` add only what is particular to each.
- `sol` matches the laptop. DaVinci Resolve is the only studio-only app, and both machines use Spark Desktop in place of the old Spark.
- DaisyDisk comes from the App Store on both machines, because of its licence.
- App Store and hand-installed copies are swapped for the declared source by Kris deleting them at `sol`'s screen and running `rig apply`. Rig reports such a mismatch but never deletes anything itself.
- chezmoi always runs from the latest source; pulling it on `sol` is always fine.

## Close

- The Project closes only after the restart test, which Kris runs at `sol` no earlier than Monday evening 2026-10-12. It stays open until Tailscale is proven to relaunch and reconnect after the unlock.
