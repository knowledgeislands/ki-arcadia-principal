---
note_type: streams/project
slug: mac-studio-bootstrap
title: Mac Studio bootstrap
outcome: Kris's Mac Studio, unused for over a month, is back to full estate capability - chezmoi applied, Rig declarations reconciled, Homebrew `ki` and `mgit` installed, the workspace cloned and registered, and Claude Code and Zed ready to resume any thread there.
initiative: rig
lifecycle: active
lead: Kris Brown
target: null
updated: 2026-10-11T02:38:00Z
author: Written with Claude
---

# Mac Studio Bootstrap

## Outcome

Kris's Mac Studio, unused for over a month, is back to full estate capability. The test: chezmoi is applied from the current source, `rig status` and `rig doctor` show the declared machine, Homebrew `ki` passes `ki doctor`, every workspace repository is cloned and in the `ki` registry, and a Claude Code or Zed thread there can resume any checkpoint in [[Projects]].

This Project sits in [[rig|Rig]], because the Mac Studio, `sol` on the tailnet, is Kris's own hardware: Rig and chezmoi build and maintain it as Kris's rig on another machine, with the `studio` profile on `core`, declared in the chezmoi source. Techne may deploy onto it later but never owns its build recipe, and it is separate from Techne's [[agent-host]] Project.

Under [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] it is an exempt remote agent host: agents administer it over Tailscale and SSH, with Kris approving each step.

---

## Notes

- The bootstrap is delivered: chezmoi applied on `sol`, Rig declarations reconciled, the released `ki` installed and passing `ki doctor`, and agents can reach `sol` over Tailscale and SSH, with GitHub through agent forwarding.
- **Remaining: a restart test.** FileVault is on, so a reboot leaves `sol` offline until Kris unlocks it in person. Kris restarts it, no earlier than Monday evening 2026-10-12, and the Project stays open until Tailscale is proven to relaunch and reconnect after the unlock.
- 1Password-backed chezmoi targets render only at `sol`'s screen, so Kris applies those there.
- Follow-ups are handed on and none blocks this Project: software removal, Dock items, self-updating apps, undeclared software decisions and the later workstation items to [[rig|Rig]]; tolerating missing template tools to the chezmoi thread; rendering `.zshenv` on the agent host to chezmoi's roadmap under [[agent-host]].
- [[hosts|Hosts]] names the estate's machines - `vega`, `sol` and `terra` - and their machine types, from which the Rig profiles and the Cheztoi host profile take their names.
- The thread's checkpoint is [rig.mac-studio-bootstrap](../../../+/_CHECKPOINTS/rig.mac-studio-bootstrap.md).
