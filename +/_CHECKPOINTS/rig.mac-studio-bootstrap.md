---
type: ki-checkpoint
thread: rig.mac-studio-bootstrap
label: 'Rig: mac-studio-bootstrap'
state: active
created_at: 2026-10-08T08:45:00Z
updated_at: 2026-10-12T22:18:00Z
---

# rig.mac-studio-bootstrap

## Objective

Bring Kris's Mac Studio back to full estate capability as a reliably reachable remote agent host, under the Project [mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) in the [Rig Initiative](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md). The bootstrap is done and every follow-up has been handed on; only the restart test remains.

## Current state

Mark: 2026-10-11T03:48Z, decisions log at Decision 40

Decisions log: `~/.local/state/ki/agents/mac-studio-bootstrap/decisions.md` (machine-local, on the laptop, not in Git); every "Decision N" in this checkpoint refers to that file.

ki-delegation read at f2b14dca

**Remaining: the restart test** (Needs Kris item `RESTART`). The Project stays open until it passes.

**Machine.** `sol` (studio, macOS) at `100.90.130.74` on the tailnet, user `krisbrown`, key-based SSH from the laptop with agent forwarding for this host only; use `ssh krisbrown@100.90.130.74`, as plain `ssh sol` fails on `known_hosts`. FileVault is on, so after a restart nothing, Tailscale included, comes up until Kris unlocks it at the screen. Four 1Password-backed chezmoi targets render only at that screen. Host names and types are in the Project's [hosts note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/design/hosts.md).

**Ownership.** The Mac Studio is Kris's personal hardware, managed by Kris's Rig and chezmoi (`studio` profile on `core`), not by Techne. Remote agent use is exempt from the Techne Programme Hold under [GDR-KI-ARCADIA-004](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Decisions/GDR-KI-PRINCIPAL-004-standing-agent-host-exemption-from-the-techne-programme-hold.md) and [KI-ARCADIA-GOV-033](https://github.com/knowledgeislands/ki-principal/blob/75161068b46f9c8529d023c51bbbfb66dbf73b11/Streams/Roadmap/KI-ARCADIA-GOV-033-exempt-the-mac-studio-as-a-remote-agent-host.md) (done, pruned). Each step on the machine still needs Kris's approval.

**Follow-ups handed on.**

- [Rig Initiative](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md): opt-in software removal ([RIG-CORE-041](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md)), profile-filtered Dock items ([RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-RIG-CORE-042-profile-filtered-dock-items.md)), self-updating apps including Warp ([RIG-CORE-043](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/RIG-CORE-043-self-updating-applications.md)), undeclared software decisions ([DOTFILES-UE-079](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md)), and the Later items: NordVPN, six untrusted Homebrew taps, a Command Line Tools update and a `tailscaled` swap.
- [rig.chezmoi](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.chezmoi.md) thread: the `op_cache` race, the copy-key script that runs on every apply, [DOTFILES-UE-082](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-082-tolerate-missing-template-tools.md), [DOTFILES-UE-084](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-084-render-zshenv-on-vega.md) and the 1Password service account.

**Keychain handoff (Decision 44).** The Automation service-account token is in sol's login Keychain and sol's `op_cache` is the token-aware version; sol's chezmoi source is level with origin. The token works from sol's screen session only: over SSH the login Keychain is locked (`security` returns 36), so remote renders still fall back to the desktop app and fail (Needs Kris `KEYCHAIN-SSH`).

**Remote access (Decision 45).** Rig capture [KI-TOOL-RIG-CORE-046](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-046-remote-access-and-continuity.md) (triage, Rig Initiative): declarable screen sharing limited to the tailnet, plus Handoff, Universal Clipboard and Universal Control. How Kris's Macs are reached is in the "Remote access" section of [the macOS workstation guide](/Users/krisbrown/.local/share/chezmoi/docs/guides/user/macos-workstation.md). Screen Sharing is on for sol and off for terra (`100.96.126.29`).

## Decisions made

Decision numbers refer to the machine-local decisions log named in Current state.

- This thread works only on the Mac Studio; the master thread `state-of-play` owns cross-project priorities and releases.
- Rig keeps one list of Kris's software on a `core` profile that `laptop` and `studio` inherit; it never uninstalls, but warns and offers opt-in removal (Decisions 7, 8, 13, 14).
- Tailscale stays the GUI app as a login item; any `tailscaled` swap is deferred (Decisions 5, 14).
- GitHub on `sol` uses Kris's own key, with SSH agent forwarding for `sol` only (Decisions 15, 17, 29, 34).
- XDG base directories reach every zsh through `.zshenv` (Decision 34).
- Kris restarts `sol` in person, Monday evening 2026-10-12 at the earliest, and is not to be reminded (Decision 35).
- Host names and machine types live in the Project's hosts note (Decision 38).

## Files touched

This checkpoint only. The Project note and its hosts note are current.

## Open questions

- **Needs Kris** (all optional, at your convenience):
  - `RESTART` - now (Kris is home): at sol run `rm -rf ~/.cache/op-cache && chezmoi apply && rig apply`, then restart `sol`, unlock FileVault at the screen, and confirm Tailscale relaunches and reconnects (`ssh krisbrown@100.90.130.74` from the laptop works). This closes the Project.
  - `KEYCHAIN-SSH` - the service-account token cannot be read over SSH because the login Keychain is locked there; recommend handing the fix (for example a private token file or a dedicated always-unlocked keychain) to the rig.chezmoi thread, not blocking this Project.
  - `SSH-ALIAS` - optional: capture a chezmoi triage item for a `Host sol` alias (HostName 100.90.130.74, User krisbrown, agent forwarding) so plain `ssh sol` works.
  - `TERRA-VNC` - optional: turn on Screen Sharing on terra (System Settings > General > Sharing, Only these users, VNC password off) if needed before KI-TOOL-RIG-CORE-046 can limit it to the tailnet.
  - `DROPBOX` - Dropbox, PTGui Pro, PhotoSweeper, ScanSnap Home and Synology Drive Client are no longer needed on `sol`; remove them by hand if you wish, or leave them for opt-in removal under RIG-CORE-041.
  - `WARP` - `rig apply` on `sol` fails only on Warp, because Homebrew's Warp cask has an upstream checksum mismatch; the installed app is intact and updates itself. Nothing to do unless you want the failure cleared before RIG-CORE-043 lands.
  - `ZED-MD` - Markdown opens in Zed on the laptop (set through Launch Services, Decision 42). On `sol` the change has to be made at the screen: select a `.md` file in Finder, press Cmd-I, choose Zed under Open with, then Change All. Rig support for default apps is [RIG-CORE-045](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/RIG-CORE-045-default-applications.md), with the Rig Initiative.

## Next step

Wait for Kris's `RESTART` result. Once Tailscale is proven to reconnect after the FileVault unlock, set the Project's `lifecycle` to done and remove this checkpoint.
