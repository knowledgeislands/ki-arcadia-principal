---
note_type: streams/project
slug: mac-studio-bootstrap
title: Mac Studio bootstrap
outcome: Kris's Mac Studio, unused for over a month, is back to full estate capability - chezmoi applied, Rig declarations reconciled, Homebrew `ki` and `mgit` installed, the workspace cloned and registered, and Claude Code and Zed ready to resume any thread there.
initiative: rig
lifecycle: active
lead: Kris Brown
target: null
updated: 2026-10-14T17:00:00Z
author: Written with Claude
---

# Mac Studio Bootstrap

## Outcome

Kris's Mac Studio, unused for over a month, is back to full estate capability. The test: chezmoi is applied from the current source, `rig status` and `rig doctor` show the declared machine, Homebrew `ki` passes `ki doctor`, every workspace repository is cloned and in the `ki` registry, and a Claude Code or Zed thread there can resume any checkpoint in [[Projects]].

This Project sits in [[rig|Rig]], because the Mac Studio, `sol` on the tailnet, is Kris's own hardware: Rig and chezmoi build and maintain it as Kris's rig on another machine, with the `studio` profile on `core`, declared in the chezmoi source. Techne may deploy onto it later but never owns its build recipe, and it is separate from Techne's [[agent-host]] Project.

Under [[GDR-KI-PRINCIPAL-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-PRINCIPAL-004]] it is an exempt remote agent host: agents administer it over Tailscale and SSH, with Kris approving each step.

## Remit

Kris widened the remit on 2026-10-14 (Kris, 2026-10-14: "I want to add to this projects remit that it needs to look at the rig differences"):

- **RIG-DIFF:** compare `sol` with the laptop, read-only, across Rig profiles, tools, skill links, Dock extras and undeclared set-up such as Headroom, then settle each difference.
- **SOL-SCOPE:** `sol` manages all seven workspace groups, and joins the `ki` registry after a dry-run against the laptop's 52 entries.
- **LOCAL-MODE-CHECK:** re-run `ki dev local on` on `sol` if its `ki` configuration no longer shows in `chezmoi status`.

---

## Notes

- The bootstrap is delivered: chezmoi applied on `sol`, Rig declarations reconciled, the released `ki` installed and passing `ki doctor`, and agents can reach `sol` over Tailscale and SSH, with GitHub through agent forwarding.
- **Remaining: a restart test.** FileVault is on, so a reboot leaves `sol` offline until Kris unlocks it in person. Kris restarts it, no earlier than Monday evening 2026-10-12, and the Project stays open until Tailscale is proven to relaunch and reconnect after the unlock.
- 1Password-backed chezmoi targets render only at `sol`'s screen, so Kris applies those there.
- Follow-ups are handed on and none blocks this Project: software removal, Dock items, self-updating apps, undeclared software decisions and the later workstation items to [[rig|Rig]]; tolerating missing template tools to the chezmoi thread; rendering `.zshenv` on the agent host to chezmoi's roadmap under [[agent-host]].
- [[decisions-in-force|Decisions in force]] states the decisions that still guide `sol`. The full decisions log is machine-local run state on the laptop at `~/.local/state/ki/agents/mac-studio-bootstrap/decisions.md`, not in Git.
- [[hosts|Hosts]] names the estate's machines - `vega`, `sol` and `terra` - and their machine types, from which the Rig profiles and the Cheztoi host profile take their names.
- The thread's checkpoint is [rig.mac-studio-bootstrap](../../../+/_CHECKPOINTS/rig.mac-studio-bootstrap.md).
- **Idea: remote access and continuity in Rig.** A Rig profile could declare whether its machines accept screen sessions and who may connect, and on macOS Handoff (with Universal Clipboard) and Universal Control; `rig doctor` would report drift, `rig apply` set what macOS allows without the GUI, and Rig show the manual steps for the rest. Findings so far: recent macOS restricts enabling Screen Sharing from a script; Handoff and Universal Control are per-user preferences whose `defaults` keys need confirming; on Linux, GNOME Remote Desktop (`grdctl`) or xrdp. Today `sol` has Screen Sharing on and `terra` off, set by hand as the chezmoi source's macOS workstation guide describes; restricting listeners to the tailnet stays with the Rig firewall work. Kept as an idea on 2026-10-14 in place of a cancelled `tools-rig` work record: Kris approved the state-of-play thread's roadmap census on 2026-10-14 ('RC-ALL: approve all'), which parked it because its trigger, a further machine or profile, is speculative.
- **Rig note: shared-failure reporting (R2).** On `sol`, `rig upgrade` reported one shared cause, Command Line Tools older than macOS, as 84 separate failures; it showed an app Kris had deleted by hand as "failed" rather than missing; and a hand-run upgrade left no receipt to read afterwards. Rig's `apply` and `upgrade` could stop or collapse when a provider fails the same way for every item, report a removed declared app as missing, and keep a receipt for interactive runs (difference D2 in the thread's `rig-guide` report, the earlier RIG-UX idea). Kept as a note rather than a `tools-rig` record on Kris's RIG-RECORDS approval of 2026-10-14; `KI-TOOL-RIG-CORE-054` catches that cause before a run.
- **Rig note: PATH shadowing check (R4).** On `sol`, an old mise `claude` shim, from a global npm package in an inactive Node, came first on PATH ahead of Homebrew's `claude`. `rig doctor` could warn when another PATH entry shadows a declared tool's executable (difference D21). Pruning old runtimes stays with the chezmoi source under `KB-DOTFILES-UE-090`. Kept as a note on the same approval; `KI-TOOL-RIG-CORE-055` (interpreter port owners) was captured as a record beside `KI-TOOL-RIG-CORE-054`.
