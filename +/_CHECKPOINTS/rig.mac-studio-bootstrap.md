---
type: ki-checkpoint
thread: rig.mac-studio-bootstrap
label: 'Rig: mac-studio-bootstrap'
state: active
created_at: 2026-10-08T08:45:00Z
updated_at: 2026-10-09T15:40:00Z
---

# rig.mac-studio-bootstrap

## Objective

Bring Kris's Mac Studio, unused for over a month, back to full estate capability so any thread can resume there, and make it a reliably reachable remote agent host ([mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md), Initiative [Rig](../../Streams/Initiatives/rig.md)). The thread is driven remotely over the tailnet from the laptop; from a browser the checkpoint is at `github.com/knowledgeislands/ki-arcadia-principal`, path `+/_CHECKPOINTS/rig.mac-studio-bootstrap.md`. Kris is handing this checkpoint to the master thread `state-of-play` to reassess and perhaps redivide the work, so Open questions and Next step are written to stand alone.

## Current state

**Ownership.** The Mac Studio is Kris's personal hardware, built and managed by Kris's own Rig and chezmoi (`studio` profile on `core`), not by Techne. Techne may later deploy onto it, but never owns its build recipe, and it is separate from the Techne agent-host. Remote agent use and administration are exempt from the Techne Programme Hold under [KI-ARCADIA-GOV-033](../../Streams/Roadmap/KI-ARCADIA-GOV-033-exempt-the-mac-studio-as-a-remote-agent-host.md), accepted as done on 2026-10-08. Each step on the machine still runs only once Kris approves it.

**Machine.** The Mac Studio is `sol` on the tailnet (`100.90.130.74`), user `krisbrown`, key-based SSH (plain `ssh sol` fails because `known_hosts` holds the IP). It runs macOS 26.5.2 with FileVault on, is kept awake by Amphetamine, restarts after power loss and wakes on network. Display sleep is 30 minutes and a password is required as soon as the screen locks.

**Installed so far, over SSH without passwords** (Techne decisions log, Decision 16; mac-studio-bootstrap decisions log, Decisions 3 to 5): Homebrew 7.0.8 trusts `knowledgeislands/tap` and `steipete/tap`; six other taps remain untrusted. `rig` 0.4.0, `ki` 0.9.0, `mgit` 0.16.0, `mas` 7.0.0 and `dockutil` 3.1.3 are installed. The damaged Discord, draw.io and Notion apps were reinstalled and pass a signature check. Kris has signed in to the Mac App Store (Decision 15). An optional Command Line Tools update is pending and needs Software Update on screen.

**Rig on sol is too old.** sol's Homebrew `rig` 0.4.0 cannot read the current catalogue: it rejects `unknown field 'cli.codexbar.source'`, with both sol's live configuration and the new profile configuration. The laptop runs a development build (`0.4.0+dev`). `rig apply` on sol therefore needs a newer Rig release (or another update route Kris chooses) first.

**1Password and GitHub access.** Kris has turned off 1Password's auto-lock on sol. `op` works only in sol's logged-in GUI session: from an SSH session it sees no account. Git over SSH on sol fails with `Permission denied (publickey)` because sol's SSH config points Git at Kris's GitHub key stored in OneDrive (`~/OneDrive-Personal/private-kris/security/`), and macOS blocks SSH sessions from reading OneDrive. Kris is happy to use the same key and no 1Password SSH agent, provided sol reads it from where it is stored on the machine (Decision 16). Proposed fix, awaiting Kris: a copy of the key in `~/.ssh` on sol, listed first in the chezmoi-managed SSH config. Until then, pulls work only from sol's desktop, anything that must reach GitHub or read a secret runs on screen, and unattended "always run from latest" (DOTFILES-UE-076) is blocked.

**Tailscale.** The GUI app stays for now and is listed under Open at Login in System Settings (Kris confirmed, Decision 14), so it should relaunch at login. Its in-app start-on-login setting cannot be set, and it does not appear under Allow in the Background. Restart behaviour is untested and can only be tested with Kris at sol. With FileVault on, any restart (macOS update, power loss) leaves sol locked and offline until Kris unlocks it in person, so any reboot needs Kris's approval and presence; until a test restart succeeds, assume a restart may also leave Tailscale disconnected.

**chezmoi.** sol's chezmoi source is at `423fae7` with a clean tree, fast-forwarded by Kris on screen (Decision 10). This thread's three earlier commits (`4812d81`, `ed3a669`, `42c3fcb`) are on `origin/main`, and as of the last local fetch `origin/main` is `7dadf8c`, which also holds the rig.chezmoi thread's 1Password repoints (`c9a771b`) and the DOTFILES-UE-079 capture. The laptop is ahead only by the three DOTFILES-UE-075 commits (table below). The non-secret part of the two-part apply (Decision 9) is done and verified: `chezmoi status` was empty for all 269 selected targets, all 55 `.chezmoiremove` deletions ran, sol's local VS Code settings were overwritten as approved, both run scripts finished, and a fresh login shell finds `brew`, `rig`, `ki` and `mgit` without errors. Still to do, by Kris in Terminal on sol's screen with 1Password unlocked, are the four 1Password-backed targets:

```sh
chezmoi diff ~/.claude.json "$HOME/Library/Application Support/Claude/claude_desktop_config.json" ~/.mcporter/mcporter.json ~/.codex/config.toml
chezmoi apply -v ~/.claude.json "$HOME/Library/Application Support/Claude/claude_desktop_config.json" ~/.mcporter/mcporter.json ~/.codex/config.toml
chezmoi status
```

`chezmoi status` should then be empty. Once DOTFILES-UE-075 is pulled on sol, `chezmoi apply` there stops until `rigProfile` is set, so run `chezmoi init --promptString rigProfile=studio` first.

**Laptop chezmoi apply now stops (affects other threads).** DOTFILES-UE-075 is in the laptop's chezmoi source, so every `chezmoi apply` on the laptop, including the rig.chezmoi 1Password work, stops with a clear message until Kris runs `chezmoi init --promptString rigProfile=laptop`. Then, after reviewing `chezmoi diff`: `chezmoi apply`; `rig apply --scope tools` (installs Spark Desktop; Rig checks Dock paths before installing, so a single plain `rig apply` would skip the Dock this time); then `rig apply` (swaps the Spark Dock icon).

**1Password references.** The rig.chezmoi thread is reorganising the 1Password vaults ([DOTFILES-UE-077](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-077-reorganise-1password-vaults-safely.md), triage) and repoints references in `.chezmoidata/mcp-servers.yaml` as items move; the repoints so far (`9d76bbe`, `c9a771b`) are pushed. Kris will apply the four targets on sol only after the 1Password changes on the laptop have finished (Decision 15), then pull on sol's screen so both sources agree; check for later reference changes before applying.

**Rig plan on sol.** The last dry run, before the profiles and with the old configuration, showed 47 of 225 entries to change: 3 formulae, 18 casks (including nordvpn, displaylink, onedrive, zoom, slack, launchcontrol and processspy), 2 App Store apps (Actions, Telegram), 4 other tools, 2 skills, 6 launchd jobs and 2 services, the two mcporter services and 4 macOS defaults (raw output `sol-rig-dryrun-2.txt` in the run directory). With the `studio` profile the dry run should show the missing core tools, DaVinci Resolve and Lightroom Classic as present, no Dock work and nothing for Paperclip; it has not been run on sol because of the Rig version. NordVPN stays in for now; Kris may drop it later. Rig never uninstalls software.

**Dock.** Rig's Dock apply clears the Dock and re-adds only declared items, and fails the whole Dock step on any missing path. Kris wants one Dock order on every machine, each showing only the items it has (Decision 13); Rig cannot express that until [RIG-CORE-042](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-042-profile-filtered-dock-items.md) lets a Dock item follow its app's profile. Until then the laptop's Dock is unchanged except that Spark Desktop takes Spark's place, and `studio` selects no Dock, so `rig apply` leaves sol's Dock (Outlook, Lightroom Classic, Spark Desktop) as it is.

**Profiles as delivered** ([DOTFILES-UE-075](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-075-sol-tailscale-daemon-exception.md), Awaiting review). One catalogue: `core` on every machine, `laptop` and `studio` building on it, chosen by the `rigProfile` value chezmoi asks for once; an unprofiled machine stops. Paperclip and the WhatsApp and 5G-Emerge refresh jobs are laptop-only; DisplayLink, WiFi Explorer, Tailscale, Outlook, Spark Desktop and the shared macOS settings are in `core`; DaVinci Resolve and Lightroom Classic are in `studio`. Defaults applied: Shadowlab's Spark shortcut manager (the laptop's `Spark.app`, not an old Spark Mail) is kept, off the Dock, with its catalogue name corrected; Delta, RendApp and The Tower stay laptop-only. Laptop verification: rendered output differs from today only by Spark Desktop and the Dock swap; tests 178 pass, 2 skipped; `ki repo audit` FAIL=0. sol was not verified, because of the Rig version. Evidence is in `/tmp/ue075-baseline` and `/tmp/ue075-new`, to delete once accepted.

**Software reconciliation** (full lists in `sol-laptop-compare.txt` in the run directory). The laptop matches its Rig declaration exactly; sol lacks 28 declared tools. PTGui Pro, PhotoSweeper, ScanSnap Home, Synology Drive Client and Dropbox are clean-up candidates on sol, and the old Spark Mail is to go (Decision 16). Every other undeclared item has a suggested action and an empty decision column in [DOTFILES-UE-079](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md). Nothing is uninstalled; removals are by hand or later through [RIG-CORE-041](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md).

**Rig and chezmoi records:**

- [DOTFILES-UE-075](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-075-sol-tailscale-daemon-exception.md) in chezmoi, "Per-machine Rig profiles", delivered locally and Awaiting review; commits unpushed.
- [DOTFILES-UE-076](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-076-always-run-latest-source.md) in chezmoi (triage): bring the source to `origin/main` by fast-forward only on every machine before applying, and refuse when that is not possible.
- [DOTFILES-UE-079](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md) in chezmoi (triage, captured and pushed): Kris's decisions on every undeclared app on either machine.
- [RIG-CORE-041](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md) in `tools-rig` (triage, pushed): `rig doctor` warnings that tell unwanted software apart from drifted software, plus an explicit, opt-in removal list with an uninstall dry run.
- [RIG-CORE-042](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-042-profile-filtered-dock-items.md) in `tools-rig` (triage, captured, not pushed): profile-filtered Dock items, so one shared Dock order can live in `core`. The chezmoi-template alternative is the fallback if declined.

**Project note.** [mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md) is rewritten in the working tree with the Decision 16 wording but left uncommitted: naming DOTFILES-UE-075 and KI-ARCADIA-GOV-033 in it trips audit rule STREAM-9 (Project notes name no work records). Waiting on Kris's choice (Open questions).

**Remaining sol sequence:**

1. **Kris.** Accept DOTFILES-UE-075 and approve pushing its three commits.
2. **Screen, after the laptop's 1Password changes.** Kris pulls (`chezmoi git pull`) and applies the four 1Password-backed targets (commands above), after `chezmoi init --promptString rigProfile=studio`.
3. **Screen.** Update Rig on sol to a release that reads the current catalogue.
4. **Screen.** `chezmoi diff` then `chezmoi apply`; `rig apply --dry-run` and check it; Kris approves `rig apply`, run on screen for the administrator-password and macOS approval prompts (displaylink, nordvpn, onedrive, zoom, slack, maybe launchcontrol and processspy); then `rig status`, `rig status --unmanaged` and `rig doctor`.
5. **Screen.** `ki bootstrap` (tools-ki getting-started guide; `ki-bootstrap` skill).
6. **SSH.** `ki diag` and `ki doctor`.
7. **Screen or SSH + Kris.** Sign in to Claude Code, Zed's agent and GitHub as Kris.
8. **SSH.** Restore the workspace with `mgit repair` (preview, then `--apply`), register each repository with `ki registry add --repo <path>`, check `mgit doctor` and `ki registry list`. Needs the GitHub key fix for unattended pulls.
9. **Kris present.** A test restart, to confirm Tailscale relaunches from Open at Login and reconnects after the FileVault unlock.
10. **Conditional, Kris present.** Only if Kris later decides to swap the Tailscale app for the `tailscaled` daemon.

**Unpushed local commits** (pushing needs Kris's approval):

| Repository | Commits |
| --- | --- |
| `ki-arcadia-principal` | This update only |
| chezmoi (`~/.local/share/chezmoi`) | `71e5062`, `82430bf`, `9217e6d` (DOTFILES-UE-075 delivery) |
| `tools-rig` | `138e879`, `8967bce` (RIG-CORE-042 captured) |

## Decisions made

- The master thread `state-of-play` owns cross-project priorities, releases and decisions; this thread works only the Mac Studio.
- The Project sits in Rig because the Mac Studio is Kris's workstation (gov-020 decisions log, Decision 3); its remote agent use is exempt from the hold under KI-ARCADIA-GOV-033 and GDR-KI-ARCADIA-004.
- Kris keeps the Tailscale app as a login item for now and defers any `tailscaled` swap until more is running (decisions log, Decision 5).
- Kris approved `dockutil`, trusting `steipete/tap`, fixing damaged apps and keeping NordVPN in sol's plan (Decision 5).
- Rig model: one list of Kris's software, a `core` profile with `laptop` and `studio` profiles inheriting it; Rig never uninstalls, but should warn about unwanted versus drifted software and offer opt-in removal (Decisions 7 and 8).
- Outlook and Lightroom Classic stay on sol's Dock (Decision 8).
- Pulling the chezmoi source to latest is always acceptable, and chezmoi should always run from latest (Decision 8).
- sol's VS Code local edits may be dropped; chezmoi apply runs in two parts, non-secret targets over SSH by an agent and the four secret targets on screen by Kris (Decision 9).
- Profile answers (Decisions 13 and 14): only DaVinci Resolve (plus Lightroom Classic) for the studio; DisplayLink and WiFi Explorer in `core`; the WhatsApp and 5G-Emerge jobs and Paperclip laptop-only, Paperclip later on the remote agent host only; one Dock order with machine-specific items; identical shared macOS settings; capture undeclared software for decision; Spark Desktop on both machines; an unprofiled new machine stops and asks.
- Kris approved delivery of DOTFILES-UE-075 and the push of this thread's three earlier chezmoi commits (already on `origin/main`); the App Store on sol is signed in; the four 1Password-backed targets wait until the laptop's 1Password changes have finished (Decision 15).
- Project note wording approved (Decision 16): sol is Kris's own hardware built by Rig and chezmoi, an exempt remote agent host administered over Tailscale and SSH with Kris approving each step, separate from agent-host, FileVault reboots need Kris's approval.
- GitHub on sol uses Kris's own key, not a new one and not the 1Password SSH agent, read from where it is stored on the machine (Decisions 15 and 16).
- The old Spark Mail goes; only Spark Desktop is installed for mail (Decision 16).

## Files touched

This checkpoint, KI-ARCADIA-GOV-033 and the Project note [mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md) (uncommitted edit in the working tree). Outside this repository: [RIG-CORE-041](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md) and [RIG-CORE-042](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-042-profile-filtered-dock-items.md) in `tools-rig`; [DOTFILES-UE-075](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-075-sol-tailscale-daemon-exception.md) (and the chezmoi Rig configuration it changes), [DOTFILES-UE-076](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-076-always-run-latest-source.md) and [DOTFILES-UE-079](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md) in chezmoi. Agent reports and raw outputs are in `~/.local/state/ki/agents/mac-studio-bootstrap/`, with Kris's decisions in its `decisions.md`.

## Open questions

- **Laptop profile, soon (affects other threads).** Kris runs `chezmoi init --promptString rigProfile=laptop` on the laptop; until then every laptop `chezmoi apply` stops, including the rig.chezmoi 1Password work.
- **DOTFILES-UE-075 review.** Kris reviews and accepts it, and approves pushing `71e5062`, `82430bf` and `9217e6d`.
- **Rig on sol.** sol's `rig` 0.4.0 cannot read the catalogue; a newer Rig release (or another update route Kris chooses) is needed before any `rig apply` on sol. Whether to cut a release is for `state-of-play` or the Rig thread.
- **GitHub key on sol.** Approve the proposed fix: copy Kris's GitHub key into `~/.ssh` on sol and list it first in the chezmoi SSH config, so SSH sessions can pull.
- **Project note and STREAM-9.** Either drop the record IDs (cite GDR-KI-ARCADIA-004 and describe `studio` on `core` without naming DOTFILES-UE-075; recommended), or keep them and accept the STREAM-9 failure. Revert with `git restore Streams/Projects/mac-studio-bootstrap.md` if neither suits.
- **Work division (for the master thread).** Mac Studio setup, chezmoi and Rig work interleave: Rig uninstall and doctor warnings (RIG-CORE-041), profile-filtered Dock items (RIG-CORE-042), always-run-from-latest (DOTFILES-UE-076), the Rig release for sol and the Tailscale variant. Which thread or Project owns each is for `state-of-play` to decide.
- **Record adoption.** RIG-CORE-041, RIG-CORE-042, DOTFILES-UE-076 and DOTFILES-UE-079 are triage records; horizon and adoption are Kris's call. The shared Dock waits on RIG-CORE-042.
- **Undeclared software.** Kris fills in the decision column of DOTFILES-UE-079 and removes the studio clean-up candidates and old Spark Mail by hand or through RIG-CORE-041.
- **Tailscale restart and 1Password targets on sol.** Both still pending, with Kris at sol. Until a test restart succeeds, assume a restart cuts off remote access.
- **Pushing.** The unpushed commits above need Kris's approval.
- **Later choices.** Whether to drop NordVPN; whether to trust any of the six other Homebrew taps; apply the Command Line Tools update; whether to swap Tailscale for `tailscaled`.

## Next step

Kris sets the laptop profile (`chezmoi init --promptString rigProfile=laptop`, then the laptop steps under Current state), reviews and accepts DOTFILES-UE-075, approves its push, and decides the GitHub key fix and the Project note STREAM-9 option. Then a newer Rig release reaches sol, and on sol's screen Kris pulls, sets `rigProfile=studio`, applies (including the four 1Password-backed targets once the laptop's 1Password changes have finished) and runs `rig apply`, followed by `ki bootstrap` and `ki doctor`. Meanwhile the master thread settles the work division above.
