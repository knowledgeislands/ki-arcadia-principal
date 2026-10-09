---
type: ki-checkpoint
thread: mac-studio-bootstrap
state: active
created_at: 2026-10-08T08:45:00Z
updated_at: 2026-10-09T06:55:00Z
---

# mac-studio-bootstrap

## Objective

Bring Kris's Mac Studio, unused for over a month, back to full estate capability so any thread can resume there, and make it a reliably reachable remote agent host ([mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md), Initiative [Rig](../../Streams/Initiatives/rig.md)). The thread is driven remotely over the tailnet from the laptop; from a browser the checkpoint is at `github.com/knowledgeislands/ki-arcadia-principal`, path `+/_CHECKPOINTS/mac-studio-bootstrap.md`. Kris is handing this checkpoint to the master thread `state-of-play` to reassess and perhaps redivide the work, so Open questions and Next step are written to stand alone.

## Current state

**Ownership.** The Mac Studio is Kris's personal hardware, built and managed by his own Rig and chezmoi, not by Techne. Techne may later deploy onto it, but never owns its build recipe. Remote agent use and administration are exempt from the Techne Programme Hold under [KI-ARCADIA-GOV-033](../../Streams/Roadmap/KI-ARCADIA-GOV-033-exempt-the-mac-studio-as-a-remote-agent-host.md), accepted as done on 2026-10-08. Each step on the machine still runs only once Kris approves it.

**Machine.** The Mac Studio is `sol` on the tailnet (`100.90.130.74`), user `krisbrown`, key-based SSH (plain `ssh sol` fails because `known_hosts` holds the IP). It runs macOS 26.5.2 with FileVault on, is kept awake by Amphetamine, restarts after power loss and wakes on network. Display sleep is 30 minutes and a password is required as soon as the screen locks.

**Installed so far, over SSH without passwords** (Techne decisions log, Decision 16; mac-studio-bootstrap decisions log, Decisions 3 to 5): Homebrew 7.0.8 trusts `knowledgeislands/tap` and `steipete/tap`; six other taps remain untrusted. `rig` 0.4.0, `ki` 0.9.0, `mgit` 0.16.0, `mas` 7.0.0 and `dockutil` 3.1.3 are installed. The damaged Discord, draw.io and Notion apps were reinstalled and pass a signature check. An optional Command Line Tools update is pending and needs Software Update on screen.

**1Password and GitHub access.** Kris has turned off 1Password's auto-lock on sol. `op` works only in sol's logged-in GUI session: from an SSH session it sees no account. Git over SSH on sol fails with `Permission denied (publickey)` because sol's SSH config points Git at a GitHub key stored in OneDrive (`~/OneDrive-Personal/private-kris/security/`), and macOS blocks SSH logins from reading OneDrive. Pulls therefore work only from sol's desktop. Anything that must reach GitHub or read a secret runs on screen, and unattended "always run from latest" (DOTFILES-UE-076) is blocked until sol has a GitHub key usable over SSH.

**Tailscale.** The GUI app stays, as a login item, for now. Its own start-on-login setting (`TailscaleStartOnLogin`) is off and its login helper is not loaded, so it probably will not reconnect after a restart. The in-app "Launch at login" toggle was unavailable; Kris switched Tailscale on in System Settings login items, but that does not change the app's own setting. Restart behaviour is untested. With FileVault on, any restart (macOS update, power loss) leaves sol locked and offline until Kris unlocks it in person, so any reboot needs Kris's approval and presence.

**chezmoi.** sol's chezmoi source is at `423fae7` with a clean tree, fast-forwarded by Kris on screen (Decision 10). The laptop is ahead only by unpushed roadmap documents, which `.chezmoiignore` excludes, so both render the same targets. The non-secret part of the two-part apply (Decision 9) is done and verified: `chezmoi status` is empty for all 269 selected targets, all 55 `.chezmoiremove` deletions ran, sol's local VS Code settings were overwritten as approved, both run scripts finished, and a fresh login shell finds `brew`, `rig`, `ki` and `mgit` without errors. Still to do, by Kris in Terminal on sol's screen with 1Password unlocked, are the four 1Password-backed targets:

```sh
chezmoi diff ~/.claude.json "$HOME/Library/Application Support/Claude/claude_desktop_config.json" ~/.mcporter/mcporter.json ~/.codex/config.toml
chezmoi apply -v ~/.claude.json "$HOME/Library/Application Support/Claude/claude_desktop_config.json" ~/.mcporter/mcporter.json ~/.codex/config.toml
chezmoi status
```

`chezmoi status` should then be empty. sol's applied Rig config now carries the new `cli.codexbar.*` fields; if `rig status` on sol rejects them as an unknown field, the Homebrew `rig` on sol is older than the config.

**Rig plan.** `rig apply --dry-run` passes preflight (198 planned, 3 expected failures, 20 skipped). `rig status` shows the real change set, 47 of 225 entries: install 3 formulae, 18 casks (including nordvpn, displaylink, onedrive, zoom, slack, launchcontrol and processspy), 2 App Store apps (Actions, Telegram) and 4 other tools; 2 skills; 6 launchd jobs and 2 services; rewrite and restart the two mcporter services; change 4 macOS defaults; and rebuild the Dock. NordVPN stays in for now; Kris may drop it later. Rig never uninstalls software. Raw output: `sol-rig-dryrun-2.txt` in the run directory.

**Dock.** Rig's Dock apply clears the Dock and re-adds only declared items. Outlook is declared (`dock.workstation` in `private_40-macos.toml`) and stays; the earlier report that it would go was wrong. Only Adobe Lightroom Classic (declared nowhere) and Spark Desktop (Rig declares `Spark.app`) would drop. Lightroom must be studio-only, because a missing Dock path fails the whole Dock step on the laptop, so it depends on DOTFILES-UE-075. Rig's Dock preflight on sol also fails until Obsidian, Delta, LaunchControl, RendApp and The Tower exist there; Delta, RendApp and The Tower are not in Rig's install list. A studio Dock under DOTFILES-UE-075 avoids both problems.

**Software reconciliation** (full lists in `sol-laptop-compare.txt` in the run directory). The laptop matches its Rig declaration exactly, Dock included (38 items in order); sol lacks 28 declared tools, as the dry run showed. Undeclared software: on sol only, about 16 items (headline: add DaVinci Resolve, PTGui Pro, PhotoSweeper, ScanSnap Home, Synology Drive Client and Dropbox as studio-only; ask about Actual, Moom, Ice, the Google apps, Spark Desktop and two agent tools; clean up libtiff and Clicker Writer); on the laptop only, about 16 apps plus Rust, Zig and other mise or cargo tools (add actionlint, the Rust toolchain and cloudflare-wrangler; ask about Home Assistant, Webex and seven others; clean up BlueStacks, Prime Video and the Microsoft shims if unused); on both, HP, OneNote, iTerm and Homebrew `node` (ask). Nothing is uninstalled; removals go to RIG-CORE-041.

**Rig and chezmoi records** (local commits, not pushed):

- [RIG-CORE-041](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md) in `tools-rig` (triage): `rig doctor` warnings that tell unwanted software apart from drifted software, plus an explicit, opt-in removal list with an uninstall dry run.
- [DOTFILES-UE-075](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-075-sol-tailscale-daemon-exception.md) in chezmoi, "Per-machine Rig profiles", adopted into Now and planned to Ready (Decision 12). `default` becomes `core`; `laptop` and `studio` build on it; each machine picks its profile through a `rigProfile` chezmoi data value set once at `chezmoi init` (on sol, `--promptString rigProfile=studio`), and a missing or unknown value fails rather than guessing. Each machine gets its own Dock, and sol's keeps Outlook and Lightroom Classic. `core` plus `laptop` must equal the laptop today, checked before and after. Nine questions, each with a default, await Kris (studio apps, Spark, laptop-only tools, where the WhatsApp and 5G-Emerge jobs run, Paperclip per machine, sol's Dock extras, shared macOS settings on sol, undeclared software, unprofiled new machines), then delivery approval. The sol Tailscale-daemon variant lives inside it.
- [DOTFILES-UE-076](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-076-always-run-latest-source.md) in chezmoi (triage): bring the source to `origin/main` by fast-forward only on every machine before applying, and refuse when that is not possible.

**Remaining sol sequence:**

1. **Screen.** Kris applies and checks the four 1Password-backed targets in Terminal on sol.
2. **Screen.** Sign in to the Mac App Store; Actions and Telegram need it and mas 7 cannot check the sign-in.
3. **Screen.** After DOTFILES-UE-075 is delivered (so sol gets the `studio` profile and its own Dock), Kris reviews and approves `rig apply`, run on screen for the administrator-password and macOS approval prompts (displaylink, nordvpn, onedrive, zoom, slack, maybe launchcontrol and processspy); then `rig status`, `rig status --unmanaged` and `rig doctor`.
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
| `ki-arcadia-principal` | `db4a4c6`, `24644eb` (this checkpoint), plus this update; also other threads' `7bcc855`, `78e195a`, `3ddf167`, `6b2fa47`, `e052df3`, `a2d9e12` |
| chezmoi (`~/.local/share/chezmoi`) | `4812d81`, `ed3a669` (DOTFILES-UE-075 widened, DOTFILES-UE-076 captured), `42c3fcb` (DOTFILES-UE-075 adopted and planned) |
| `tools-rig` | `ae9d68b`, `9383925` (RIG-CORE-041 captured) |

## Decisions made

- The master thread `state-of-play` owns cross-project priorities, releases and decisions; this thread works only the Mac Studio.
- The Project sits in Rig because the Mac Studio is Kris's workstation (gov-020 decisions log, Decision 3); its remote agent use is exempt from the hold under KI-ARCADIA-GOV-033 and GDR-KI-ARCADIA-004.
- Kris keeps the Tailscale app as a login item for now and defers any `tailscaled` swap until more is running (decisions log, Decision 5).
- Kris approved `dockutil`, trusting `steipete/tap`, fixing damaged apps and keeping NordVPN in sol's plan (Decision 5).
- Rig model: one list of Kris's software, a `core` profile with `laptop` and `studio` profiles inheriting it; Rig never uninstalls, but should warn about unwanted versus drifted software and offer opt-in removal (Decisions 7 and 8).
- Outlook and Lightroom Classic stay on sol's Dock (Decision 8).
- Finish the sol and laptop reconciliation and adopt and plan DOTFILES-UE-075 to Ready; implementation, `rig apply` and pushes still need Kris (Decision 12).
- Pulling the chezmoi source to latest is always acceptable, and chezmoi should always run from latest (Decision 8).
- sol's VS Code local edits may be dropped; chezmoi apply runs in two parts, non-secret targets over SSH by an agent and the four secret targets on screen by Kris (Decision 9).

## Files touched

This checkpoint, the Project note [mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md) (earlier) and KI-ARCADIA-GOV-033. Outside this repository: RIG-CORE-041 in `tools-rig`; DOTFILES-UE-075 and DOTFILES-UE-076 in chezmoi. Agent reports and raw outputs are in `~/.local/state/ki/agents/mac-studio-bootstrap/`, with Kris's decisions in its `decisions.md`.

## Open questions

- **Work division (for the master thread).** Mac Studio setup, chezmoi and Rig work now interleave: per-machine Rig profiles (DOTFILES-UE-075), Rig uninstall and doctor warnings (RIG-CORE-041), always-run-from-latest (DOTFILES-UE-076) and the Tailscale variant all touch both. Which thread or Project owns each, and whether the sol bootstrap waits for any of them, is for `state-of-play` to decide.
- **DOTFILES-UE-075 questions.** Kris answers the nine questions in the record (or accepts the defaults), then approves delivery. This blocks `rig apply` on sol.
- **Record adoption.** RIG-CORE-041 and DOTFILES-UE-076 are still triage records; their horizon and adoption are Kris's call.
- **Software lists.** Kris decides the add, ask and clean-up items above (question 8 of DOTFILES-UE-075 defaults to leaving them alone).
- **Other session's Rig change.** Before delivering profiles, confirm whether another session's earlier uncommitted change to `dot_config/rig/conf.d/private_10-applications.toml` in chezmoi was committed, moved or dropped (it was not in the working tree at 07:41 BST; the CodexBar fields that reached sol may be it).
- **A GitHub key sol can use over SSH.** sol's GitHub key lives in OneDrive, which SSH logins cannot read. Which key to give sol (for example one from the 1Password SSH agent, if that works outside the GUI, or a dedicated key outside OneDrive) is Kris's decision; it gates DOTFILES-UE-076 on sol.
- **Tailscale after restart.** Kris needs, on sol's screen, to allow Tailscale in System Settings > General > Login Items & Extensions > Allow in the Background, then enable "Launch at login" in the Tailscale app, and approve a test restart with Kris present to confirm it reconnects after the FileVault unlock. Until then, assume a restart cuts off remote access.
- **Stale Project note.** Update [mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md) to reflect KI-ARCADIA-GOV-033 (no longer attended-only; remote agent host under the exemption)? It is a Streams note, so it needs Kris's go-ahead.
- **Pushing.** The unpushed commits listed above in three repositories need Kris's approval to push.
- **Later choices.** Whether to drop NordVPN; whether to trust any of the six other Homebrew taps; when to apply the Command Line Tools update; whether to swap Tailscale to `tailscaled`.

## Next step

Kris applies the four 1Password-backed targets on sol's screen (commands under chezmoi above) and answers the DOTFILES-UE-075 questions, then approves its delivery. Deliver per-machine profiles before `rig apply` on sol, so sol gets the `studio` profile and its own Dock; Kris then runs `rig apply` on screen, followed by `ki bootstrap` and `ki doctor`. Meanwhile Kris can sign in to the App Store on sol and set Tailscale's background and login settings, and the master thread settles the work division above.
