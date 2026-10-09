---
type: ki-checkpoint
thread: mac-studio-bootstrap
state: active
created_at: 2026-10-08T08:45:00Z
updated_at: 2026-10-09T06:28:00Z
---

# mac-studio-bootstrap

## Objective

Bring Kris's Mac Studio, unused for over a month, back to full estate capability so any thread can resume there, and make it a reliably reachable remote agent host ([mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md), Initiative [Rig](../../Streams/Initiatives/rig.md)). The thread is driven remotely over the tailnet from the laptop; from a browser the checkpoint is at `github.com/knowledgeislands/ki-arcadia-principal`, path `+/_CHECKPOINTS/mac-studio-bootstrap.md`.

## Current state

Established over SSH: the Mac Studio is `sol` on the tailnet (`100.90.130.74`), user `krisbrown`, key-based SSH. It runs macOS 26.5.2 with FileVault on, is kept awake by Amphetamine, restarts after power loss and wakes on network. Tailscale is the GUI app, kept as a login item for now, and key expiry is disabled. Display sleep is 30 minutes and a password is required as soon as the screen locks.

Password-free installs over SSH (Techne decisions log, Decision 16; mac-studio-bootstrap decisions log, Decisions 3 to 6): Homebrew 7.0.8 trusts `knowledgeislands/tap` and `steipete/tap`; the other taps remain untrusted. `rig` 0.4.0, `ki` 0.9.0, `mgit` 0.16.0, `mas` 7.0.0 and `dockutil` 3.1.3 are installed. The damaged Discord, draw.io and Notion apps have been reinstalled and pass a signature check. Kris is signed in to 1Password.app with its CLI integration on, but `op` 2.38.1 sees no account from SSH: SSH runs in launchd's background session, and the app integration answers only processes in the logged-in GUI session. 1Password on sol relocks after about 10 seconds; screen lock and sleep settings do not explain it, so it is most likely 1Password's own auto-lock or its lock-with-the-Mac behaviour under Screen Sharing.

Kris has run `chezmoi init` on sol: `~/.config/chezmoi/chezmoi.yaml` is regenerated and `chezmoi doctor` reports no warnings or errors. Nothing needing a password, sudo, `chezmoi apply`, `rig apply` or a Tailscale change has been run.

Remote agent use and administration are exempt from the Techne Programme Hold under [KI-ARCADIA-GOV-033](../../Streams/Roadmap/KI-ARCADIA-GOV-033-exempt-the-mac-studio-as-a-remote-agent-host.md), which Kris accepted as done on 2026-10-08. Each later step runs only once Kris approves it.

**chezmoi diff (read-only summary, leaving out the four 1Password-backed targets).** sol's chezmoi source is clean at `d152e10`, 9 commits behind the laptop's `423fae7` and able to fast-forward; only three of those commits touch home-folder files (sol host keys in `known_hosts`, a small `ki` config addition and CodexBar CLI ownership in the Rig app list). `chezmoi apply` would touch 184 entries: 118 adds, 55 deletes, 9 modifications, 2 missing workspaces recreated, 1 locally edited file changed and 2 run scripts.

| Area | Add | Change | Delete |
| --- | --- | --- | --- |
| `workspaces/` | 60: per-repository VS Code workspaces, `.mgit.toml` manifests, Legal project folders | 1 path fix | 28: old aggregate workspaces and `.mgit-workspace.toml` manifests |
| `bin/` | 28: `bin/chezmoi/json` and `op_cache`, scheduled-job, launchd and paperclip helpers, renamed git commands | 2 | 18: retired or renamed commands and the old `bin/env` folder |
| Shell | 23 `.zsh/` fragments and 4 `.zprofile.d/` fragments | `.zshrc`, `.zprofile`, 3 `.zsh/` fragments | 9 old `.zsh/` files |
| Other | `.paperclip/runtime/mise.toml` | `.ssh/config` (adds only `ki-techne-agent-host`), VS Code user settings | None |

Every deletion comes from `.chezmoiremove` and matches a version in the source's Git history, so no local-only work is lost. Both run scripts (`patch_codexbar_config.sh`, `patch_claude_code_hooks.mjs`) need no 1Password or GUI. The one loss is sol's locally edited VS Code `settings.json` (edited on 27 July): apply would drop five local entries, mostly VS Code prompt answers. Recommendation: apply once Kris decides on those VS Code edits; optionally fast-forward sol's source first. Only the four secret targets call `op`, so everything else can be applied over SSH and those four on sol's screen with 1Password unlocked; a plain `chezmoi apply` of all targets must run on screen.

**Rig plan.** The full `rig apply --dry-run` now passes preflight: 198 planned, 3 failed and 20 skipped. `rig status` gives the real change set (47 of 225 entries): install 3 formulae (git-almanac, obscura, rumdl), 18 casks (including codexbar and nordvpn), 2 App Store apps (Actions, Telegram) and 4 other tools (bun, codex-multi-auth, skills-cli, claude-swap); 2 skills; add 6 launchd jobs and 2 services (observatory, paperclip); rewrite the two mcporter service definitions, which restarts both; change 4 macOS defaults (Dock minimise effect and icon size, minimise-to-application, Finder list view); and rebuild the Dock. The Dock rebuild adds 8 entries and **removes Microsoft Outlook and Adobe Lightroom Classic from the Dock** without uninstalling them. Nothing is upgraded or removed: Rig never uninstalls packages, so dropping an app means removing its declaration and uninstalling it by hand. The 3 failures are expected: both skills wait for skills-cli, and the Dock check waits for Obsidian, which may need a second `rig apply`. The Tailscale app cask is already installed, so `rig apply` leaves Tailscale unchanged. The raw output is in the run directory as `sol-rig-dryrun-2.txt`.

**Remaining bootstrap runbook.**

Each step is marked **SSH** (runs in an SSH session from the laptop), **SSH + Kris** (over SSH, but Kris makes the decision, types a password or approves a sign-in link) or **Screen** (Kris present at the Mac Studio, or on Screen Sharing at `vnc://100.90.130.74`). Screen Sharing and SSH both ride the tailnet, so a step that interrupts Tailscale needs Kris physically present or a fallback route.

1. **SSH + Kris.** Kris reviews the chezmoi diff summary above, decides on sol's VS Code edits, whether to fast-forward sol's source to `423fae7` first, and whether to apply the non-secret targets over SSH; then approves `chezmoi apply`.
2. **Screen.** Check 1Password > Settings > Security on sol for the auto-lock timing and lock-with-the-Mac behaviour, so 1Password stays unlocked long enough for `chezmoi apply` to fill `op_cache`.
3. **SSH, then Screen.** Run the approved `chezmoi apply -v` (chezmoi `docs/guides/tools/chezmoi.md`, "Managed environment"): the non-secret targets over SSH if approved, then the four 1Password-backed targets in Terminal on sol with 1Password unlocked, checking them on screen.
4. **Screen.** Sign in to the Mac App Store; Actions and Telegram need it, and mas 7 cannot check the sign-in over SSH.
5. **Screen.** Once Kris settles the Dock question and approves the plan, run `rig apply` and check `rig status`, `rig status --unmanaged` and `rig doctor` (macOS workstation guide, "Reconcile the workstation"); rerun `rig apply` if the Dock check still fails after Obsidian installs. Expect administrator-password or macOS approval prompts for displaylink (driver), nordvpn (network extension), onedrive, zoom, slack and possibly launchcontrol and processspy, and a restart of the mcporter services.
6. **Screen.** Run `ki bootstrap` once 1Password and chezmoi are in place (tools-ki `docs/guides/user/getting-started.md`, "Create the user environment"; `ki-bootstrap` skill).
7. **SSH.** Run `ki diag` and `ki doctor`.
8. **Screen or SSH + Kris.** Sign in to Claude Code (and Zed's agent) and GitHub as Kris; browser sign-in links can be opened on the laptop, but app sign-ins need the screen.
9. **SSH.** Restore the workspace: chezmoi has written the `mgit` manifests under `~/workspaces`. Preview with `mgit repair`, clone the missing repositories with `mgit repair --apply` once the preview is reviewed, then record each with `ki registry add --repo <path>` (tools-mgit README; getting-started, "Register your first repository"). Check with `mgit doctor` and `ki registry list`.
10. **Conditional, Kris present (not over the tailnet).** Only if Kris later decides to swap: replace the GUI Tailscale with the open-source `tailscaled` system daemon so the node survives logout (`brew install tailscale`, run it as a launchd daemon through Homebrew services, quit and remove the app, `tailscale up`). The old node drops as the app quits, so do it on the Mac Studio's keyboard or the local network; then rename the new node `sol` and disable key expiry again. It first needs the chezmoi Rig exception in DOTFILES-UE-075, because Rig declares the Tailscale app for every machine.
11. **SSH.** Open Zed or Claude Code in `ki-arcadia-principal` and resume this checkpoint; record anything that went wrong as a work record in its owning repository.

Optionally, on screen, apply any pending macOS updates and the newer Command Line Tools that Homebrew reports, through Software Update; a macOS update restarts the machine (see the FileVault note below).

**FileVault.** With FileVault on, after any restart (macOS update, power loss) the disk stays locked and nothing starts, so the Mac Studio is unreachable over the tailnet until someone unlocks it in person. Auto-restart after power loss therefore brings it back only to the unlock screen.

## Decisions made

- The master thread `state-of-play` owns cross-project priorities, releases and decisions; this thread works only the Mac Studio.
- The Project sits in Rig: the Mac Studio is a workstation. Settled: Kris confirmed the Rig home on 2026-10-08 (gov-020 decisions log, Decision 3). Its use as a remote agent host is an exemption from the hold under KI-ARCADIA-GOV-033 and GDR-KI-ARCADIA-004, treated like the agent host.
- Remote reachability over Tailscale is the top priority (Techne decisions log, Decision 14); the runbook is prepared first and nothing on the Mac Studio changes until Kris says so (Decision 15).
- Kris approved password-free installs over SSH on `sol`: the tap tools and the Rig and chezmoi previews, with no sudo, 1Password, `chezmoi apply`, `rig apply` or Tailscale change (Techne decisions log, Decision 16).
- Kris approved installing `dockutil`, trusting `steipete/tap` for codexbar, reinstalling the damaged apps and keeping NordVPN in sol's plan (mac-studio-bootstrap decisions log, Decision 5).
- Kris keeps the Tailscale app as a login item on sol for now and defers the `tailscaled` swap until more is running, so DOTFILES-UE-075 stays open and runbook step 10 is conditional (Decision 5).

## Files touched

The Project note [mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md), this checkpoint and KI-ARCADIA-GOV-033. Source guidance: the chezmoi macOS workstation, chezmoi, config-patterns and Rig guides, the `ki-bootstrap` skill, the `tools-ki` getting-started guide, the `tools-mgit` README and the `homebrew-tap` README.

## Open questions

- Should Microsoft Outlook and Adobe Lightroom Classic stay in sol's Dock? If so, add them to Rig's Dock declaration before `rig apply`; otherwise Rig removes them from the Dock.
- Keep or drop sol's local VS Code settings edits, and whether to fast-forward sol's chezmoi source before apply (runbook step 1).
- 1Password on sol relocks after about 10 seconds; Kris to check its auto-lock settings before `chezmoi apply` (runbook step 2).
- Whether to swap to `tailscaled` once more is running on sol; DOTFILES-UE-075 (chezmoi `docs/roadmap/DOTFILES-UE-075-sol-tailscale-daemon-exception.md`) stays open until then, and Rig has no per-machine mechanism for it yet.
- Whether the Mac Studio has a GitHub-accepted SSH key, or uses the 1Password SSH agent, which would add on-screen approvals to step 9.
- Whether Kris wants a fallback route for step 10, since it briefly cuts the tailnet path.

## Next step

Kris reviews the chezmoi diff summary above and approves `chezmoi apply`, deciding on sol's VS Code edits, the optional source fast-forward and whether the non-secret targets run over SSH (runbook step 1). Then walk Kris through the rest in order: 1Password auto-lock check; `chezmoi apply`; App Store sign-in, the Dock question and `rig apply`; `ki bootstrap`; `ki doctor`. Update this checkpoint after each step.
