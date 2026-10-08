---
type: ki-checkpoint
thread: mac-studio-bootstrap
state: active
created_at: 2026-10-08T08:45:00Z
updated_at: 2026-10-08T14:45:00Z
---

# mac-studio-bootstrap

## Objective

Bring Kris's Mac Studio, unused for over a month, back to full estate capability so any thread can resume there, and make it a reliably reachable remote agent host ([mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md), Initiative [Rig](../../Streams/Initiatives/rig.md)). The thread is driven remotely over the tailnet from the laptop; from a browser the checkpoint is at `github.com/knowledgeislands/ki-arcadia-principal`, path `+/_CHECKPOINTS/mac-studio-bootstrap.md`.

## Current state

Established over SSH on 2026-10-08, with nothing changed: the Mac Studio is `sol` on the tailnet (`100.90.130.74`), user `krisbrown`, key-based SSH. It runs macOS 26.5.2 with FileVault on, is kept awake by Amphetamine, restarts after power loss and wakes on network. Tailscale is the GUI app with no login item, and key expiry is disabled. There is no Homebrew, chezmoi, `ki`, Rig or `mgit`.

Remote agent use and administration are exempt from the Techne Programme Hold under [KI-ARCADIA-GOV-033](../../Streams/Roadmap/KI-ARCADIA-GOV-033-exempt-the-mac-studio-as-a-remote-agent-host.md), awaiting Kris's review. Nothing on the Mac Studio changes until Kris says so.

**Remote bootstrap runbook.**

Each step is marked **SSH** (runs in an SSH session from the laptop), **SSH + Kris** (over SSH, but Kris types a password or approves a sign-in link) or **Screen** (Kris present at the Mac Studio, or on Screen Sharing at `vnc://100.90.130.74`). Screen Sharing and SSH both ride the tailnet, so a step that interrupts Tailscale needs Kris physically present or a fallback route.

1. **Screen.** Confirm Screen Sharing and Remote Login are on, apply pending macOS updates, and sign in to the Mac App Store. Rig needs the App Store already signed in before `rig apply` (chezmoi `docs/guides/user/macos-workstation.md`, "Reconcile the workstation"; `docs/guides/tools/rig.md`). A macOS update restarts the machine; see the FileVault note below.
2. **SSH + Kris.** Install Homebrew through its own supported procedure from brew.sh, which asks for Kris's administrator password (macOS workstation guide, "Reconcile the workstation": install Homebrew natively first). Verify with `brew doctor`.
3. **SSH, then Screen.** Install 1Password and its CLI, because chezmoi fetches secrets from 1Password at apply time (chezmoi `docs/guides/tools/chezmoi.md`, "Templates and secrets") and Rig, which normally installs them, runs only after chezmoi. Use the locators Rig declares: `brew install --cask 1password` and `brew install 1password/tap/1password-cli`. Then, on screen, sign in to the 1Password app and turn on its CLI integration; approval prompts appear on the Mac Studio's screen, not in the SSH session.
4. **SSH.** Install chezmoi with `brew install chezmoi`, then initialise it from `git@github.com:krisb/dotfiles.git` into its source folder. GitHub access over SSH needs a key on the Mac Studio that GitHub accepts; if none, Kris adds one (**SSH + Kris**). Run `chezmoi init`, inspect `~/.config/chezmoi/chezmoi.yaml` and check `chezmoi doctor` (chezmoi `docs/guides/agents/config-patterns.md`).
5. **SSH, review, then Screen if prompted.** Review with `chezmoi diff`, then apply with `chezmoi apply -v` only after Kris approves the diff (chezmoi guide, "Managed environment"). `chezmoi diff` prints rendered secrets, so review it only where that is safe. 1Password approval prompts during apply appear on screen.
6. **SSH.** Install the tap tools: `brew install knowledgeislands/tap/rig`, `knowledgeislands/tap/ki` and `knowledgeislands/tap/mgit`; naming the tap taps it implicitly (`homebrew-tap` README). Review tap trust as the Rig guide describes before trusting any third-party tap.
7. **SSH, review, then SSH + Kris.** Run `rig show`, `rig status` and `rig apply --dry-run`; apply with `rig apply` only after Kris approves the plan, then check `rig status`, `rig status --unmanaged` and `rig doctor` (macOS workstation guide, "Inspect the machine" and "Reconcile the workstation"). Some casks and macOS defaults prompt for a password, and licensed vendor applications may still need their own installer (**Screen**).
8. **Screen or SSH + Kris.** Sign in to Claude Code (and Zed's agent) and GitHub as Kris; browser sign-in links can be opened on the laptop, but app sign-ins need the screen.
9. **SSH.** Run `ki bootstrap`, then `ki diag` and `ki doctor` (tools-ki `docs/guides/user/getting-started.md`, "Create the user environment"; `ki-bootstrap` skill).
10. **SSH.** Restore the workspace: chezmoi has written the `mgit` manifests under `~/workspaces`. Preview with `mgit repair`, clone the missing repositories with `mgit repair --apply` once the preview is reviewed, then record each with `ki registry add --repo <path>` (tools-mgit README; getting-started, "Register your first repository"). Check with `mgit doctor` and `ki registry list`.
11. **Kris present (not over the tailnet).** Replace the GUI Tailscale with the open-source `tailscaled` system daemon so the node survives logout: `brew install tailscale`, run it as a launchd daemon through Homebrew services, quit and remove the Tailscale app, and bring the daemon up with `tailscale up`, approving its sign-in link. Tailscale supports only one variant on a machine. Do this on the Mac Studio's own keyboard or from the local network: the old node drops as the app quits, so SSH and Screen Sharing over the tailnet go with it. The daemon joins as a new node, so check its tailnet name and address, remove the old `sol` node, rename the new one `sol` and disable key expiry on it again. Rig declares the Tailscale app (`tailscale-app` cask) in the `default` profile, so a later `rig apply` would reinstall it; the chezmoi Rig declaration needs a Mac Studio exception first (see Open questions).
12. **SSH.** Open Zed or Claude Code in `ki-arcadia-principal` and resume this checkpoint; record anything that went wrong as a work record in its owning repository.

**FileVault.** With FileVault on, after any restart (macOS update, power loss) the disk stays locked and nothing starts, including `tailscaled`, so the Mac Studio is unreachable over the tailnet until someone unlocks it in person. Auto-restart after power loss therefore brings it back only to the unlock screen.

## Decisions made

- The master thread `state-of-play` owns cross-project priorities, releases and decisions; this thread works only the Mac Studio.
- The Project sits in Rig: the Mac Studio is a workstation. Its use as a remote agent host is an exemption from the hold under KI-ARCADIA-GOV-033 and GDR-KI-ARCADIA-004, treated like the agent host.
- Remote reachability over Tailscale is the top priority (Techne decisions log, Decision 14); the runbook is prepared first and nothing on the Mac Studio changes until Kris says so (Decision 15).
- No changes to the Mac Studio were made while preparing this thread.

## Files touched

The Project note [mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md), this checkpoint and KI-ARCADIA-GOV-033. Source guidance: the chezmoi macOS workstation, chezmoi, config-patterns and Rig guides, the `ki-bootstrap` skill, the `tools-ki` getting-started guide, the `tools-mgit` README and the `homebrew-tap` README.

## Open questions

- Rig declares the Tailscale GUI app for every machine on the `default` profile. Replacing it with `tailscaled` on the Mac Studio needs a chezmoi Rig declaration change (a per-machine exception or a `tailscale` formula entry), recorded in the chezmoi repository before step 11.
- Whether the Mac Studio has a GitHub-accepted SSH key, or uses the 1Password SSH agent, which would add on-screen approvals to steps 4 and 10.
- Whether Kris wants a fallback route for step 11, since it briefly cuts the tailnet path.

## Next step

Once Kris has reviewed KI-ARCADIA-GOV-033 and says to proceed, start at step 1 with Kris on screen; run `ki doctor` first if `ki` already exists. Update this checkpoint after each step.
