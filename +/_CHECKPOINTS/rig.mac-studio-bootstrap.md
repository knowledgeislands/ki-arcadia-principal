---
type: ki-checkpoint
thread: rig.mac-studio-bootstrap
label: 'Rig: mac-studio-bootstrap'
state: active
created_at: 2026-10-08T08:45:00Z
updated_at: 2026-10-09T15:20:00Z
---

# rig.mac-studio-bootstrap

## Objective

Bring Kris's Mac Studio, unused for over a month, back to full estate capability so any thread can resume there, and make it a reliably reachable remote agent host ([mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md), Initiative [Rig](../../Streams/Initiatives/rig.md)). The thread is driven remotely over the tailnet from the laptop; from a browser the checkpoint is at `github.com/knowledgeislands/ki-arcadia-principal`, path `+/_CHECKPOINTS/rig.mac-studio-bootstrap.md`. Kris is handing this checkpoint to the master thread `state-of-play` to reassess and perhaps redivide the work, so Open questions and Next step are written to stand alone.

## Current state

**Ownership.** The Mac Studio is Kris's personal hardware, built and managed by his own Rig and chezmoi, not by Techne. Techne may later deploy onto it, but never owns its build recipe. Remote agent use and administration are exempt from the Techne Programme Hold under [KI-ARCADIA-GOV-033](../../Streams/Roadmap/KI-ARCADIA-GOV-033-exempt-the-mac-studio-as-a-remote-agent-host.md), accepted as done on 2026-10-08. Each step on the machine still runs only once Kris approves it.

**Machine.** The Mac Studio is `sol` on the tailnet (`100.90.130.74`), user `krisbrown`, key-based SSH (plain `ssh sol` fails because `known_hosts` holds the IP). It runs macOS 26.5.2 with FileVault on, is kept awake by Amphetamine, restarts after power loss and wakes on network. Display sleep is 30 minutes and a password is required as soon as the screen locks.

**Installed so far, over SSH without passwords** (Techne decisions log, Decision 16; mac-studio-bootstrap decisions log, Decisions 3 to 5): Homebrew 7.0.8 trusts `knowledgeislands/tap` and `steipete/tap`; six other taps remain untrusted. `rig` 0.4.0, `ki` 0.9.0, `mgit` 0.16.0, `mas` 7.0.0 and `dockutil` 3.1.3 are installed. The damaged Discord, draw.io and Notion apps were reinstalled and pass a signature check. An optional Command Line Tools update is pending and needs Software Update on screen.

**1Password and GitHub access.** Kris has turned off 1Password's auto-lock on sol. `op` works only in sol's logged-in GUI session: from an SSH session it sees no account. Git over SSH on sol fails with `Permission denied (publickey)` because sol's SSH config points Git at a GitHub key stored in OneDrive (`~/OneDrive-Personal/private-kris/security/`), and macOS blocks SSH logins from reading OneDrive. Pulls therefore work only from sol's desktop. Anything that must reach GitHub or read a secret runs on screen, and unattended "always run from latest" (DOTFILES-UE-076) is blocked until sol has a GitHub key usable over SSH.

**Tailscale.** The GUI app stays for now and is listed under Open at Login in System Settings (Kris confirmed, Decision 14), so it should relaunch at login. Its in-app start-on-login setting cannot be set, and it does not appear under Allow in the Background. Restart behaviour is untested and can only be tested with Kris at sol. With FileVault on, any restart (macOS update, power loss) leaves sol locked and offline until Kris unlocks it in person, so any reboot needs Kris's approval and presence; until a test restart succeeds, assume a restart may also leave Tailscale disconnected.

**chezmoi.** sol's chezmoi source is at `423fae7` with a clean tree, fast-forwarded by Kris on screen (Decision 10). `origin/main` is now `8ee4524`, which holds this thread's earlier commits and the rig.chezmoi thread's first 1Password repoints. The laptop is ahead of it by eight unpushed commits (see table below), mostly roadmap documents, which `.chezmoiignore` excludes; the rig.chezmoi thread's `c9a771b` also changes rendered 1Password references. The non-secret part of the two-part apply (Decision 9) is done and verified: `chezmoi status` is empty for all 269 selected targets, all 55 `.chezmoiremove` deletions ran, sol's local VS Code settings were overwritten as approved, both run scripts finished, and a fresh login shell finds `brew`, `rig`, `ki` and `mgit` without errors. Still to do, by Kris in Terminal on sol's screen with 1Password unlocked, are the four 1Password-backed targets:

```sh
chezmoi diff ~/.claude.json "$HOME/Library/Application Support/Claude/claude_desktop_config.json" ~/.mcporter/mcporter.json ~/.codex/config.toml
chezmoi apply -v ~/.claude.json "$HOME/Library/Application Support/Claude/claude_desktop_config.json" ~/.mcporter/mcporter.json ~/.codex/config.toml
chezmoi status
```

`chezmoi status` should then be empty. sol's applied Rig config now carries the new `cli.codexbar.*` fields; if `rig status` on sol rejects them as an unknown field, the Homebrew `rig` on sol is older than the config.

**1Password references.** The rig.chezmoi thread is reorganising the 1Password vaults ([DOTFILES-UE-077](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-077-reorganise-1password-vaults-safely.md), triage) and repoints references in `.chezmoidata/mcp-servers.yaml` as items move: kit-mcp-gsuite is pushed (`e62ec78`, `9d76bbe`), and `c9a771b` repoints four more to the Rig vault, not yet pushed. Kris will apply the four targets on sol only after the 1Password changes on the laptop have finished (Decision 15), then pull on sol's screen so both sources agree; check for later reference changes before applying.

**Rig plan.** `rig apply --dry-run` passes preflight (198 planned, 3 expected failures, 20 skipped). `rig status` shows the real change set, 47 of 225 entries: install 3 formulae, 18 casks (including nordvpn, displaylink, onedrive, zoom, slack, launchcontrol and processspy), 2 App Store apps (Actions, Telegram) and 4 other tools; 2 skills; 6 launchd jobs and 2 services; rewrite and restart the two mcporter services; change 4 macOS defaults; and rebuild the Dock. NordVPN stays in for now; Kris may drop it later. Rig never uninstalls software. Raw output: `sol-rig-dryrun-2.txt` in the run directory.

**Dock.** Rig's Dock apply clears the Dock and re-adds only declared items, and fails the whole Dock step on any missing path. Kris wants one Dock order on every machine, each showing only the items it has (Decision 13); Rig cannot express that until [RIG-CORE-042](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-042-profile-filtered-dock-items.md) (triage, `tools-rig`) lets a Dock item follow its app's profile. Until then, under [DOTFILES-UE-075](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-075-sol-tailscale-daemon-exception.md): the laptop's Dock is unchanged except that Spark Desktop takes Spark's place, and the `studio` profile selects no Dock, so `rig apply` leaves sol's Dock (Outlook, Lightroom Classic, Spark Desktop) as it is.

**Software reconciliation** (full lists in `sol-laptop-compare.txt` in the run directory). The laptop matches its Rig declaration exactly; sol lacks 28 declared tools. Kris's answers (Decisions 13 and 14): only DaVinci Resolve and Lightroom Classic are declared for the studio; PTGui Pro, PhotoSweeper, ScanSnap Home, Synology Drive Client and Dropbox are clean-up candidates on sol; DisplayLink and WiFi Explorer move to `core`; the WhatsApp and 5G-Emerge refresh jobs and Paperclip become laptop-only; shared macOS settings are identical on both; both machines move to Spark Desktop. Every other undeclared item has a suggested action and an empty decision column in [DOTFILES-UE-079](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md). Nothing is uninstalled; removals are by hand or later through [RIG-CORE-041](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md).

**Rig and chezmoi records:**

- [RIG-CORE-041](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md) in `tools-rig` (triage, pushed): `rig doctor` warnings that tell unwanted software apart from drifted software, plus an explicit, opt-in removal list with an uninstall dry run.
- [DOTFILES-UE-075](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-075-sol-tailscale-daemon-exception.md) in chezmoi, "Per-machine Rig profiles", Ready, and delivery approved by Kris (Decision 15). `default` becomes `core`; `laptop` and `studio` build on it; each machine picks its profile through a `rigProfile` chezmoi data value set once at `chezmoi init` (on sol, `--promptString rigProfile=studio`), and an unprofiled machine stops and asks (Decision 14). `core` plus `laptop` must equal the laptop today plus Spark Desktop, checked before and after. Spark Desktop joins `core` and the Spark Dock place. Still open, each with a default that does not block delivery: whether Delta, RendApp and The Tower are installed on sol by hand (default laptop-only), and whether to keep Shadowlab's Spark. The second is new: the laptop's `Spark.app` turned out to be Shadowlab's Spark shortcut manager, not an older Spark Mail as the catalogue claims; default keep it, off the Dock, with its catalogue name corrected. Replacing or removing `Spark.app` is a manual migration step. A separate delivery run (`profiles-deliver`) is queued after this update.
- [DOTFILES-UE-076](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-076-always-run-latest-source.md) in chezmoi (triage): bring the source to `origin/main` by fast-forward only on every machine before applying, and refuse when that is not possible.
- [DOTFILES-UE-079](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md) in chezmoi (triage): Kris's decisions on every undeclared app on either machine.
- [RIG-CORE-042](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-042-profile-filtered-dock-items.md) in `tools-rig` (triage, not pushed): profile-filtered Dock items, so one shared Dock order can live in `core`. The chezmoi-template alternative is the fallback if declined.

**Remaining sol sequence:**

1. **Screen.** Kris applies and checks the four 1Password-backed targets in Terminal on sol.
2. **Done.** Kris signed in to the Mac App Store on sol (Decision 15).
3. **Screen.** After DOTFILES-UE-075 is delivered and pulled on sol (so sol gets the `studio` profile and keeps its Dock), Kris reviews and approves `rig apply`, run on screen for the administrator-password and macOS approval prompts (displaylink, nordvpn, onedrive, zoom, slack, maybe launchcontrol and processspy); then `rig status`, `rig status --unmanaged` and `rig doctor`.
4. **Screen.** `ki bootstrap` (tools-ki getting-started guide; `ki-bootstrap` skill).
5. **SSH.** `ki diag` and `ki doctor`.
6. **Screen or SSH + Kris.** Sign in to Claude Code, Zed's agent and GitHub as Kris.
7. **SSH.** Restore the workspace with `mgit repair` (preview, then `--apply`), register each repository with `ki registry add --repo <path>`, check `mgit doctor` and `ki registry list`.
8. **Kris present.** A test restart, to confirm Tailscale relaunches from Open at Login and reconnects after the FileVault unlock.
9. **Conditional, Kris present.** Only if Kris later decides to swap the Tailscale app for the `tailscaled` daemon, which needs the per-machine profiles in DOTFILES-UE-075 first.

**Stale Project note.** [mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md) still says the work is attended-only and that the Mac Studio sits outside [agent-host](../../Streams/Projects/agent-host/agent-host.md); after KI-ARCADIA-GOV-033 that is out of date. It is unchanged.

**Unpushed local commits** (pushing needs Kris's approval):

| Repository | Commits |
| --- | --- |
| `ki-arcadia-principal` | This update only |
| chezmoi (`~/.local/share/chezmoi`) | `36591b3`, `46bbc17` (DOTFILES-UE-079 captured), `088bcff`, `7dadf8c` (DOTFILES-UE-075 answers and Spark Desktop); `c9a771b`, `03760da`, `89a4684` and `75eb658` belong to the rig.chezmoi thread |
| `tools-rig` | `138e879`, `8967bce` (RIG-CORE-042 captured) |

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
- Profile answers (Decisions 13 and 14): only DaVinci Resolve (plus Lightroom Classic) for the studio; DisplayLink and WiFi Explorer in `core`; the WhatsApp and 5G-Emerge jobs and Paperclip laptop-only, Paperclip later on the remote agent host only; one Dock order with machine-specific items; identical shared macOS settings; capture undeclared software for decision; Spark Desktop on both machines; an unprofiled new machine stops and asks.
- Kris approved delivery of DOTFILES-UE-075; the App Store on sol is signed in; sol's GitHub pulls stay on screen with Kris's own key rather than a new key for SSH; the four 1Password-backed targets wait until the laptop's 1Password changes have finished (Decision 15).

## Files touched

This checkpoint, the Project note [mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md) (earlier) and KI-ARCADIA-GOV-033. Outside this repository: [RIG-CORE-041](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md) and [RIG-CORE-042](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-042-profile-filtered-dock-items.md) in `tools-rig`; [DOTFILES-UE-075](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-075-sol-tailscale-daemon-exception.md), [DOTFILES-UE-076](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-076-always-run-latest-source.md) and [DOTFILES-UE-079](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md) in chezmoi. Agent reports and raw outputs are in `~/.local/state/ki/agents/mac-studio-bootstrap/`, with Kris's decisions in its `decisions.md`.

## Open questions

- **Work division (for the master thread).** Mac Studio setup, chezmoi and Rig work interleave: per-machine Rig profiles (DOTFILES-UE-075), Rig uninstall and doctor warnings (RIG-CORE-041), profile-filtered Dock items (RIG-CORE-042), always-run-from-latest (DOTFILES-UE-076) and the Tailscale variant. Which thread or Project owns each is for `state-of-play` to decide.
- **DOTFILES-UE-075, two defaulted questions.** Delta, RendApp and The Tower on sol (default laptop-only), and whether to keep Shadowlab's Spark shortcut manager on both machines (default keep, off the Dock). Neither blocks delivery.
- **Record adoption.** RIG-CORE-041, RIG-CORE-042, DOTFILES-UE-076 and DOTFILES-UE-079 are triage records; horizon and adoption are Kris's call. The shared Dock waits for RIG-CORE-042.
- **Undeclared software.** Kris fills in the decision column of DOTFILES-UE-079, and removes the studio clean-up candidates and any unwanted `Spark.app` by hand or through RIG-CORE-041.
- **Tailscale after restart.** A test restart with Kris at sol, to confirm Tailscale relaunches from Open at Login and reconnects after the FileVault unlock. Until then, assume a restart cuts off remote access.
- **Stale Project note.** Kris asked what the update to [mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md) would be: drop "attended-only" and record that the Mac Studio is a remote agent host under KI-ARCADIA-GOV-033, with each step on it still run only on Kris's approval. It needs Kris's go-ahead.
- **Pushing.** The unpushed commits listed above need Kris's approval to push.
- **Later choices.** Whether to drop NordVPN; whether to trust any of the six other Homebrew taps; when to apply the Command Line Tools update; whether to swap Tailscale to `tailscaled`.

## Next step

The `profiles-deliver` run delivers DOTFILES-UE-075 on the laptop (Kris reviews its `chezmoi diff` before any apply). Once the laptop's 1Password changes have finished and the chezmoi commits are pushed, Kris pulls on sol's screen and applies the four 1Password-backed targets there (commands under chezmoi above), then `chezmoi init --promptString rigProfile=studio` and `chezmoi apply` on sol. Kris then runs `rig apply` on screen, followed by `ki bootstrap` and `ki doctor`. Meanwhile the master thread settles the work division above.
