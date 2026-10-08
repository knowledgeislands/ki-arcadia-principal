---
type: ki-checkpoint
thread: mac-studio-bootstrap
state: active
created_at: 2026-10-08T08:45:00Z
updated_at: 2026-10-08T19:22:00Z
---

# mac-studio-bootstrap

## Objective

Bring Kris's Mac Studio, unused for over a month, back to full estate capability so any thread can resume there, and make it a reliably reachable remote agent host ([mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md), Initiative [Rig](../../Streams/Initiatives/rig.md)). The thread is driven remotely over the tailnet from the laptop; from a browser the checkpoint is at `github.com/knowledgeislands/ki-arcadia-principal`, path `+/_CHECKPOINTS/mac-studio-bootstrap.md`.

## Current state

Established over SSH on 2026-10-08: the Mac Studio is `sol` on the tailnet (`100.90.130.74`), user `krisbrown`, key-based SSH. It runs macOS 26.5.2 with FileVault on, is kept awake by Amphetamine, restarts after power loss and wakes on network. Tailscale is the GUI app with no login item, and key expiry is disabled.

Password-free installs over SSH as of 17:03 CEST (Techne decisions log, Decision 16): Homebrew 7.0.8 is present with 8 taps, and `knowledgeislands/tap` and the other 7 taps are untrusted. chezmoi is initialised with a clean source at `~/.local/share/chezmoi`. The `op` CLI and 1Password.app are present, but 1Password is not signed in and its CLI integration is off. `rig` 0.4.0, `ki` 0.9.0 and `mgit` 0.16.0 are installed. `mas` is missing, so `rig apply --dry-run` fails preflight and there is no full Rig plan yet; read-only `rig status` shows 59 of 225 entries needing attention. A partial `chezmoi diff` has been reviewed as a summary only: it leaves out the four 1Password-backed targets, which cannot render until `op` works and chezmoi has written its `op_cache` helper, and chezmoi asks for `chezmoi init` because its config template has changed. Nothing needing a password, sudo, 1Password, `chezmoi apply`, `rig apply` or a Tailscale change has been run.

Remote agent use and administration are exempt from the Techne Programme Hold under [KI-ARCADIA-GOV-033](../../Streams/Roadmap/KI-ARCADIA-GOV-033-exempt-the-mac-studio-as-a-remote-agent-host.md), still awaiting Kris's review. Each remaining step runs only once Kris approves it.

**Remaining bootstrap runbook.**

Each step is marked **SSH** (runs in an SSH session from the laptop), **SSH + Kris** (over SSH, but Kris makes the decision, types a password or approves a sign-in link) or **Screen** (Kris present at the Mac Studio, or on Screen Sharing at `vnc://100.90.130.74`). Screen Sharing and SSH both ride the tailnet, so a step that interrupts Tailscale needs Kris physically present or a fallback route.

1. **SSH + Kris.** Decide tap trust: `brew trust --tap knowledgeislands/tap`, as on the laptop, and review the other 7 untrusted taps separately as the Rig guide describes. It needs no password; it is Kris's call because tap trust is a supply-chain decision.
2. **SSH.** Run `brew install mas`, then `rig show`, `rig status` and `rig apply --dry-run` for the full Rig plan (chezmoi `docs/guides/user/macos-workstation.md`, "Inspect the machine").
3. **Screen.** Sign in to the 1Password app and turn on its CLI integration so `op` works over SSH; approval prompts appear on the Mac Studio's screen, not in the SSH session.
4. **Screen.** Run `chezmoi init` to regenerate `~/.config/chezmoi/chezmoi.yaml`, answering any prompts, then check `chezmoi doctor` (chezmoi `docs/guides/agents/config-patterns.md`).
5. **Screen, review.** Review the full `chezmoi diff`, including the 1Password-backed targets, `.ssh/config`, the 28 `workspaces/` and 18 `bin/` deletions and the two run scripts (`patch_codexbar_config.sh`, `patch_claude_code_hooks.mjs`). `chezmoi diff` prints rendered secrets, so review it only where that is safe.
6. **Screen.** Once Kris approves the diff, run `chezmoi apply -v` (chezmoi `docs/guides/tools/chezmoi.md`, "Managed environment"); its run scripts and secret templates may raise 1Password and macOS prompts.
7. **Screen.** Sign in to the Mac App Store, then, once Kris approves the plan, run `rig apply` and check `rig status`, `rig status --unmanaged` and `rig doctor` (macOS workstation guide, "Reconcile the workstation"). Cask installs and macOS defaults may ask for an administrator password or macOS approval, and licensed vendor applications may still need their own installer.
8. **Screen.** Run `ki bootstrap` once 1Password and chezmoi are in place (tools-ki `docs/guides/user/getting-started.md`, "Create the user environment"; `ki-bootstrap` skill).
9. **SSH.** Run `ki diag` and `ki doctor`.
10. **Screen or SSH + Kris.** Sign in to Claude Code (and Zed's agent) and GitHub as Kris; browser sign-in links can be opened on the laptop, but app sign-ins need the screen.
11. **SSH.** Restore the workspace: chezmoi has written the `mgit` manifests under `~/workspaces`. Preview with `mgit repair`, clone the missing repositories with `mgit repair --apply` once the preview is reviewed, then record each with `ki registry add --repo <path>` (tools-mgit README; getting-started, "Register your first repository"). Check with `mgit doctor` and `ki registry list`.
12. **Kris present (not over the tailnet).** Replace the GUI Tailscale with the open-source `tailscaled` system daemon so the node survives logout: `brew install tailscale`, run it as a launchd daemon through Homebrew services, quit and remove the Tailscale app, and bring the daemon up with `tailscale up`, approving its sign-in link. Tailscale supports only one variant on a machine. Do this on the Mac Studio's own keyboard or from the local network: the old node drops as the app quits, so SSH and Screen Sharing over the tailnet go with it. The daemon joins as a new node, so check its tailnet name and address, remove the old `sol` node, rename the new one `sol` and disable key expiry on it again. Rig declares the Tailscale app (`tailscale-app` cask) in the `default` profile, so a later `rig apply` would reinstall it; the chezmoi Rig declaration needs a Mac Studio exception first (see Open questions).
13. **SSH.** Open Zed or Claude Code in `ki-arcadia-principal` and resume this checkpoint; record anything that went wrong as a work record in its owning repository.

Optionally, on screen, apply any pending macOS updates and the newer Command Line Tools that Homebrew reports, through Software Update; a macOS update restarts the machine (see the FileVault note below).

**FileVault.** With FileVault on, after any restart (macOS update, power loss) the disk stays locked and nothing starts, including `tailscaled`, so the Mac Studio is unreachable over the tailnet until someone unlocks it in person. Auto-restart after power loss therefore brings it back only to the unlock screen.

## Decisions made

- The master thread `state-of-play` owns cross-project priorities, releases and decisions; this thread works only the Mac Studio.
- The Project sits in Rig: the Mac Studio is a workstation. Settled: Kris confirmed the Rig home on 2026-10-08 (gov-020 decisions log, Decision 3). Its use as a remote agent host is an exemption from the hold under KI-ARCADIA-GOV-033 and GDR-KI-ARCADIA-004, treated like the agent host.
- Remote reachability over Tailscale is the top priority (Techne decisions log, Decision 14); the runbook is prepared first and nothing on the Mac Studio changes until Kris says so (Decision 15).
- Kris approved password-free installs over SSH on `sol`: the tap tools and the Rig and chezmoi previews, with no sudo, 1Password, `chezmoi apply`, `rig apply` or Tailscale change (Techne decisions log, Decision 16).

## Files touched

The Project note [mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md), this checkpoint and KI-ARCADIA-GOV-033. Source guidance: the chezmoi macOS workstation, chezmoi, config-patterns and Rig guides, the `ki-bootstrap` skill, the `tools-ki` getting-started guide, the `tools-mgit` README and the `homebrew-tap` README.

## Open questions

- Rig declares the Tailscale GUI app for every machine on the `default` profile. Replacing it with `tailscaled` on the Mac Studio needs a chezmoi Rig declaration change (a per-machine exception or a `tailscale` formula entry) before step 12; a chezmoi roadmap record for the `sol` `tailscale-app` exception is being captured and has no identifier yet.
- Whether the Mac Studio has a GitHub-accepted SSH key, or uses the 1Password SSH agent, which would add on-screen approvals to step 11.
- Whether Kris wants a fallback route for step 12, since it briefly cuts the tailnet path.

## Next step

Once Kris has reviewed KI-ARCADIA-GOV-033 and says to proceed, walk Kris through the remaining sequence in order: tap trust; `brew install mas` and the full `rig apply --dry-run`; 1Password sign-in and CLI integration over Screen Sharing; `chezmoi init`; full `chezmoi diff` review; `chezmoi apply`; `rig apply`; `ki bootstrap`; `ki doctor`. These are runbook steps 1 to 9. Update this checkpoint after each step.
