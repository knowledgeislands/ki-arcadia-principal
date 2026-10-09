---
note_type: streams/project
slug: mac-studio-bootstrap
title: Mac Studio bootstrap
outcome: Kris's Mac Studio, unused for over a month, is back to full estate capability - chezmoi applied, Rig declarations reconciled, Homebrew `ki` and `mgit` installed, the workspace cloned and registered, and Claude Code and Zed ready to resume any thread there.
initiative: rig
lifecycle: active
lead: Kris Brown
target: null
updated: 2026-10-08T13:51:00Z
author: Written with Claude
---

# Mac Studio Bootstrap

## Outcome

Kris's Mac Studio, unused for over a month, is back to full estate capability. The test: chezmoi is applied from the current source, `rig status` and `rig doctor` show the declared machine, Homebrew `ki` passes `ki doctor`, every workspace repository is cloned and in the `ki` registry, and a Claude Code or Zed thread there can resume any checkpoint in [[Projects]].

This Project sits in [[rig|Rig]], because the Mac Studio is a workstation. [[agent-host]] does not own it: that Project moves agent work onto the Techne agent host, not onto Kris's own machines.

---

## Notes

- The work is attended: it runs on the Mac Studio itself, with Kris signing in to 1Password, the Mac App Store, GitHub and Claude.
- The thread's checkpoint is [rig.mac-studio-bootstrap](../../+/_CHECKPOINTS/rig.mac-studio-bootstrap.md); its first steps assume nothing is checked out on the Mac Studio yet.
- Anything the bootstrap finds missing or wrong in the chezmoi source, Rig declarations or `ki` install guidance becomes a record in the owning repository.

### Close-out assessment

Nothing has been delivered yet: the Project was registered without a work record. The bootstrap itself is captured as a triage record in Arcadia, so the Project stays open until it is done.
