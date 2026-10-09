---
note_type: streams/project
slug: mac-studio-bootstrap
title: Mac Studio bootstrap
outcome: Kris's Mac Studio, unused for over a month, is back to full estate capability - chezmoi applied, Rig declarations reconciled, Homebrew `ki` and `mgit` installed, the workspace cloned and registered, and Claude Code and Zed ready to resume any thread there.
initiative: rig
lifecycle: active
lead: Kris Brown
target: null
updated: 2026-10-09T15:24:00Z
author: Written with Claude
---

# Mac Studio Bootstrap

## Outcome

Kris's Mac Studio, unused for over a month, is back to full estate capability. The test: chezmoi is applied from the current source, `rig status` and `rig doctor` show the declared machine, Homebrew `ki` passes `ki doctor`, every workspace repository is cloned and in the `ki` registry, and a Claude Code or Zed thread there can resume any checkpoint in [[Projects]].

This Project sits in [[rig|Rig]], because the Mac Studio, `sol` on the tailnet, is Kris's own hardware: Rig and chezmoi build and maintain it as Kris's rig on another machine, with the `studio` profile on `core`, declared in the chezmoi source. Techne may deploy onto it later but never owns its build recipe, and it is separate from Techne's [[agent-host]] Project.

Under [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] it is an exempt remote agent host: agents administer it over Tailscale and SSH, with Kris approving each step.

---

## Notes

- FileVault is on, so a reboot leaves `sol` offline until Kris unlocks it in person; every reboot needs Kris's approval.
- 1Password and GitHub pulls work only on `sol`'s screen, so Kris does those steps there.
- The thread's checkpoint is [rig.mac-studio-bootstrap](../../+/_CHECKPOINTS/rig.mac-studio-bootstrap.md); its first steps assume nothing is checked out on the Mac Studio yet.
- Anything the bootstrap finds missing or wrong in the chezmoi source, Rig declarations or `ki` install guidance becomes a record in the owning repository.

### Close-out assessment

Nothing has been delivered yet: the Project was registered without a work record. The bootstrap itself is captured as a triage record in Arcadia, so the Project stays open until it is done.
