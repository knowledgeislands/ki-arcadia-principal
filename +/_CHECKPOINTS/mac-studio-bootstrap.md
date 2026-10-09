---
type: ki-checkpoint
thread: mac-studio-bootstrap
state: active
created_at: 2026-10-08T08:45:00Z
updated_at: 2026-10-09T06:45:00Z
---

# mac-studio-bootstrap

## Objective

Bring Kris's Mac Studio, unused for over a month, back to full estate capability so any thread can resume there, and make it a reliably reachable remote agent host ([mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md), Initiative [Rig](../../Streams/Initiatives/rig.md)). The thread is driven remotely over the tailnet from the laptop; from a browser the checkpoint is at `github.com/knowledgeislands/ki-arcadia-principal`, path `+/_CHECKPOINTS/mac-studio-bootstrap.md`. Kris is handing this checkpoint to the master thread `state-of-play` to reassess and perhaps redivide the work, so Open questions and Next step are written to stand alone.

## Current state

**Ownership.** The Mac Studio is Kris's personal hardware, built and managed by his own Rig and chezmoi, not by Techne. Techne may later deploy onto it, but never owns its build recipe. Remote agent use and administration are exempt from the Techne Programme Hold under [KI-ARCADIA-GOV-033](../../Streams/Roadmap/KI-ARCADIA-GOV-033-exempt-the-mac-studio-as-a-remote-agent-host.md), accepted as done on 2026-10-08. Each step on the machine still runs only once Kris approves it.

**Machine.** The Mac Studio is `sol` on the tailnet (`100.90.130.74`), user `krisbrown`, key-based SSH (plain `ssh sol` fails because `known_hosts` holds the IP). It runs macOS 26.5.2 with FileVault on, is kept awake by Amphetamine, restarts after power loss and wakes on network. Display sleep is 30 minutes and a password is required as soon as the screen locks.

**Installed so far, over SSH without passwords** (Techne decisions log, Decision 16; mac-studio-bootstrap decisions log, Decisions 3 to 5): Homebrew 7.0.8 trusts `knowledgeislands/tap` and `steipete/tap`; six other taps remain untrusted. `rig` 0.4.0, `ki` 0.9.0, `mgit` 0.16.0, `mas` 7.0.0 and `dockutil` 3.1.3 are installed. The damaged Discord, draw.io and Notion apps were reinstalled and pass a signature check. An optional Command Line Tools update is pending and needs Software Update on screen.

**1Password and GitHub access.** Kris has turned off 1Password's auto-lock on sol. `op` and the 1Password SSH agent work only in sol's logged-in GUI session: from an SSH session `op` sees no account, and an SSH-session `git pull` from GitHub fails, while Kris's own pull on sol's screen worked. So anything that must reach GitHub or read a secret runs on screen, and unattended "always run from latest" over SSH is blocked until sol has a GitHub credential usable outside the GUI session.

**Tailscale.** The GUI app stays, as a login item, for now. Its own start-on-login setting (`TailscaleStartOnLogin`) is off and its login helper is not loaded, so it probably will not reconnect after a restart. The in-app "Launch at login" toggle was unavailable; Kris switched Tailscale on in System Settings login items, but that does not change the app's own setting. Restart behaviour is untested. With FileVault on, any restart (macOS update, power loss) leaves sol locked and offline until Kris unlocks it in person, so any reboot needs Kris's approval and presence.

**chezmoi.** Kris ran `chezmoi init` on sol (`chezmoi doctor` clean) and then fast-forwarded sol's chezmoi source himself on screen (decisions log, Decision 10). The reviewed `chezmoi apply` touches 184 entries: per-repository VS Code workspaces and `.mgit.toml` manifests replacing aggregate ones, new `bin/` helpers including `bin/chezmoi/json` and `op_cache`, Zsh and `.zprofile.d/` fragments, `.ssh/config` gaining only `ki-techne-agent-host`, and two run scripts needing no 1Password or GUI. Every deletion comes from `.chezmoiremove` and matches the source's Git history, so no local-only work is lost. Kris approved dropping sol's local VS Code settings edits and a two-part apply (Decision 9): all non-secret targets by an agent over SSH, then the four 1Password-backed targets (`~/.claude.json`, the Claude Desktop config, `~/.mcporter/mcporter.json`, `~/.codex/config.toml`) by Kris in Terminal on sol's screen.

**Rig plan.** `rig apply --dry-run` passes preflight (198 planned, 3 expected failures, 20 skipped). `rig status` shows the real change set, 47 of 225 entries: install 3 formulae, 18 casks (including nordvpn, displaylink, onedrive, zoom, slack, launchcontrol and processspy), 2 App Store apps (Actions, Telegram) and 4 other tools; 2 skills; 6 launchd jobs and 2 services; rewrite and restart the two mcporter services; change 4 macOS defaults; and rebuild the Dock. The Dock rebuild would take Microsoft Outlook and Adobe Lightroom Classic off sol's Dock; Kris wants both kept, so the Dock declaration must change before `rig apply`. NordVPN stays in for now; Kris may drop it later. Rig never uninstalls software. Raw output: `sol-rig-dryrun-2.txt` in the run directory.

**Rig and chezmoi records captured** (local commits, not pushed, all in triage and unadopted):

- [RIG-CORE-041](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md) in `tools-rig`: `rig doctor` warnings that tell unwanted software apart from drifted software, plus an explicit, opt-in removal list with an uninstall dry run.
- [DOTFILES-UE-075](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-075-sol-tailscale-daemon-exception.md) in chezmoi, widened and retitled "Per-machine Rig profiles": Kris's model is one list of all his software, a `core` profile, and `laptop` and `studio` profiles inheriting it, selected per machine through the chezmoi hostname or a machine-local mechanism. The sol Tailscale-daemon variant now lives inside it.
- [DOTFILES-UE-076](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-076-always-run-latest-source.md) in chezmoi: bring the source to `origin/main` by fast-forward only on every machine before applying, and refuse when that is not possible.

**In progress** (background agents in the run directory `~/.local/state/ki/agents/mac-studio-bootstrap/`, results not yet in):

- `sol-pull-compare`: a software comparison of sol and the laptop against Rig's declarations (undeclared on sol, undeclared on the laptop, undeclared on both, declared but missing on the laptop), with add, clean-up or ask suggestions and full lists in `sol-laptop-compare.txt`; and an explanation of why Rig would remove Outlook from sol's Dock while it is on the laptop's. Its source-pull step is overtaken by Kris's own pull.
- `sol-chezmoi-apply-1b`: waits for `sol-pull-compare`, confirms sol's source matches the laptop's, then applies every non-secret target over SSH and checks a fresh login shell; it reports the exact command for Kris to apply the four secret targets on screen.

**Remaining sol sequence** (after the non-secret apply):

1. **Screen.** Kris applies and checks the four 1Password-backed targets in Terminal on sol.
2. **Screen.** Sign in to the Mac App Store; Actions and Telegram need it and mas 7 cannot check the sign-in.
3. **Screen.** After the Dock declaration change, Kris reviews and approves `rig apply`, run on screen for the administrator-password and macOS approval prompts (displaylink, nordvpn, onedrive, zoom, slack, maybe launchcontrol and processspy); then `rig status`, `rig status --unmanaged` and `rig doctor`, rerunning `rig apply` if the Dock check fails until Obsidian is installed.
4. **Screen.** `ki bootstrap` (tools-ki getting-started guide; `ki-bootstrap` skill).
5. **SSH.** `ki diag` and `ki doctor`.
6. **Screen or SSH + Kris.** Sign in to Claude Code, Zed's agent and GitHub as Kris.
7. **SSH.** Restore the workspace with `mgit repair` (preview, then `--apply`), register each repository with `ki registry add --repo <path>`, check `mgit doctor` and `ki registry list`.
8. **Screen.** Allow Tailscale in the background and enable its launch at login (see Open questions), then, with Kris present, a test restart to confirm it reconnects after the FileVault unlock.
9. **Conditional, Kris present.** Only if Kris later decides to swap the Tailscale app for the `tailscaled` daemon, which needs the per-machine profiles in DOTFILES-UE-075 first.

**Stale Project note.** [mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md) still says the work is attended-only and that the Mac Studio sits outside [agent-host](../../Streams/Projects/agent-host/agent-host.md); after KI-ARCADIA-GOV-033 that is out of date. It is unchanged.

**Unpushed local commits** (pushing needs Kris's approval):

| Repository | Commits |
| --- | --- |
| `ki-arcadia-principal` | `db4a4c6`, `7bcc855`, `78e195a` (checkpoint updates), plus this update |
| chezmoi (`~/.local/share/chezmoi`) | `4812d81`, `ed3a669` (DOTFILES-UE-075 widened, DOTFILES-UE-076 captured) |
| `tools-rig` | `ae9d68b`, `9383925` (RIG-CORE-041 captured) |

## Decisions made

- The master thread `state-of-play` owns cross-project priorities, releases and decisions; this thread works only the Mac Studio.
- The Project sits in Rig because the Mac Studio is Kris's workstation (gov-020 decisions log, Decision 3); its remote agent use is exempt from the hold under KI-ARCADIA-GOV-033 and GDR-KI-ARCADIA-004.
- Kris keeps the Tailscale app as a login item for now and defers any `tailscaled` swap until more is running (decisions log, Decision 5).
- Kris approved `dockutil`, trusting `steipete/tap`, fixing damaged apps and keeping NordVPN in sol's plan (Decision 5).
- Rig model: one list of Kris's software, a `core` profile with `laptop` and `studio` profiles inheriting it; Rig never uninstalls, but should warn about unwanted versus drifted software and offer opt-in removal (Decisions 7 and 8).
- Outlook and Lightroom Classic stay on sol's Dock (Decision 8).
- Pulling the chezmoi source to latest is always acceptable, and chezmoi should always run from latest (Decision 8).
- sol's VS Code local edits may be dropped; chezmoi apply runs in two parts, non-secret targets over SSH by an agent and the four secret targets on screen by Kris (Decision 9).

## Files touched

This checkpoint, the Project note [mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md) (earlier) and KI-ARCADIA-GOV-033. Outside this repository: RIG-CORE-041 in `tools-rig`; DOTFILES-UE-075 and DOTFILES-UE-076 in chezmoi. Agent reports and raw outputs are in `~/.local/state/ki/agents/mac-studio-bootstrap/`, with Kris's decisions in its `decisions.md`.

## Open questions

- **Work division (for the master thread).** Mac Studio setup, chezmoi and Rig work now interleave: per-machine Rig profiles (DOTFILES-UE-075), Rig uninstall and doctor warnings (RIG-CORE-041), always-run-from-latest (DOTFILES-UE-076) and the Tailscale variant all touch both. Which thread or Project owns each, and whether the sol bootstrap waits for any of them, is for `state-of-play` to decide.
- **Record adoption.** RIG-CORE-041, DOTFILES-UE-075 and DOTFILES-UE-076 are triage records; their horizon and adoption are Kris's call.
- **Dock declaration.** Outlook and Lightroom Classic must be added to sol's Rig Dock declaration before `rig apply`. Why Rig would remove Outlook on sol when it is on the laptop's Dock is under investigation by `sol-pull-compare`. Any Rig declaration change (profiles or Dock) should wait for another session's uncommitted change to `dot_config/rig/conf.d/private_10-applications.toml` in the chezmoi repository; that change was not visible in the working tree at 07:41 BST, so confirm with that session whether it was committed, moved or dropped.
- **GitHub credential outside the GUI session.** sol needs a GitHub credential usable from SSH (for example a deploy key or a GitHub-accepted SSH key not held in 1Password) before agents can pull or run from latest unattended. Which credential, and whether that is acceptable, is Kris's decision.
- **Tailscale after restart.** Kris needs, on sol's screen, to allow Tailscale in System Settings > General > Login Items & Extensions > Allow in the Background, then enable "Launch at login" in the Tailscale app, and approve a test restart with Kris present to confirm it reconnects after the FileVault unlock. Until then, assume a restart cuts off remote access.
- **Stale Project note.** Update [mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md) to reflect KI-ARCADIA-GOV-033 (no longer attended-only; remote agent host under the exemption)? It is a Streams note, so it needs Kris's go-ahead.
- **Pushing.** The unpushed commits listed above in three repositories need Kris's approval to push.
- **Later choices.** Whether to drop NordVPN; whether to trust any of the six other Homebrew taps; when to apply the Command Line Tools update; whether to swap Tailscale to `tailscaled`.

## Next step

Wait for `sol-pull-compare` and `sol-chezmoi-apply-1b` to report (in `~/.local/state/ki/agents/mac-studio-bootstrap/`), then fold their results in: the software comparison, the Dock explanation, and whether the non-secret apply succeeded. Kris then applies the four 1Password-backed targets on sol's screen with the command that report gives, signs in to the App Store and sets Tailscale's background and login settings. Before `rig apply`, the master thread settles the work division above, and the Dock declaration (and, if chosen, the `studio` profile) is changed once the other session's `private_10-applications.toml` change is resolved; Kris then runs `rig apply` on screen, followed by `ki bootstrap` and `ki doctor`.
