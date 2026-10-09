---
type: ki-checkpoint
thread: rig.mac-studio-bootstrap
label: 'Rig: mac-studio-bootstrap'
state: active
created_at: 2026-10-08T08:45:00Z
updated_at: 2026-10-09T21:43:00Z
---

# rig.mac-studio-bootstrap

## Objective

Bring Kris's Mac Studio, unused for over a month, back to full estate capability so any thread can resume there, and make it a reliably reachable remote agent host ([mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md), Initiative [Rig](../../Streams/Initiatives/rig.md)). The thread is driven remotely over the tailnet from the laptop; from a browser the checkpoint is at `github.com/knowledgeislands/ki-arcadia-principal`, path `+/_CHECKPOINTS/rig.mac-studio-bootstrap.md`. Kris is handing this checkpoint to the master thread `state-of-play` to reassess and perhaps redivide the work, so Open questions and Next step are written to stand alone.

## Current state

**Mark.** 2026-10-09 23:25 CEST, Decision 21 in the run's `decisions.md`. A "summary since the mark" covers everything after it, including each Open question below still open at the mark.

**Ownership.** The Mac Studio is Kris's personal hardware, built and managed by Kris's own Rig and chezmoi (`studio` profile on `core`), not by Techne. Techne may later deploy onto it, but never owns its build recipe, and it is separate from the Techne agent-host. Remote agent use and administration are exempt from the Techne Programme Hold under [KI-ARCADIA-GOV-033](https://github.com/knowledgeislands/ki-arcadia-principal/blob/60e8a65e5eb56b0496cf917763397339734ade1e/Streams/Roadmap/KI-ARCADIA-GOV-033-exempt-the-mac-studio-as-a-remote-agent-host.md), accepted as done on 2026-10-08. Each step on the machine still runs only once Kris approves it.

**Machine.** The Mac Studio is `sol` on the tailnet (`100.90.130.74`), user `krisbrown`, key-based SSH (plain `ssh sol` fails because `known_hosts` holds the IP). It runs macOS 26.5.2 with FileVault on, is kept awake by Amphetamine, restarts after power loss and wakes on network. Display sleep is 30 minutes and a password is required as soon as the screen locks.

**Installed so far, over SSH without passwords** (Techne decisions log, Decision 16; mac-studio-bootstrap decisions log, Decisions 3 to 5): Homebrew 7.0.8 trusts `knowledgeislands/tap` and `steipete/tap`; six other taps remain untrusted. `ki` 0.9.0, `mgit` 0.16.0, `mas` 7.0.0 and `dockutil` 3.1.3 are installed. The damaged Discord, draw.io and Notion apps were reinstalled and pass a signature check. Kris has signed in to the Mac App Store (Decision 15). An optional Command Line Tools update is pending and needs Software Update on screen.

**Rig on sol.** Rig `v0.5.0` is published (Decision 19): an immutable GitHub release at tag `v0.5.0`, with the Homebrew tap formula PR merged. sol has been upgraded with `brew upgrade rig` and runs `rig 0.5.0`, which reads the current catalogue. `rig show` and `rig status` on sol still fail with `[rig] references unknown profile 'default'`: sol's `~/.config/rig/conf.d` is the new catalogue (profiles `core`, `laptop`, `studio`, `public`, `services`), but its `~/.config/rig/rig.toml` predates it and still says `default-profile = "default"`. This clears once Kris sets `rigProfile=studio` and re-applies chezmoi on sol's screen (steps below). The tools-rig checkout is back at `0.5.0+dev` with the unpublished-candidate notices removed (`7f6d7d6`, pushed); the post-release cleanup is complete. [RIG-DIST-010](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-DIST-010-release-current-catalogue-reader.md) is still triage, untouched, waiting for Kris to adopt and accept it once sol runs Rig.

**1Password and GitHub access.** Kris has turned off 1Password's auto-lock on sol. `op` works only in sol's logged-in GUI session: from an SSH session it sees no account. Git over SSH on sol fails with `Permission denied (publickey)` because the GitHub key lives in OneDrive (`~/OneDrive-Personal/private-kris/security/`), which macOS blocks SSH sessions from reading. The fix Kris approved (Decision 17 item 4) is delivered as [DOTFILES-UE-080](https://github.com/krisb/dotfiles/blob/4817b1947e10e047413288464280061a141de7ab/docs/roadmap/DOTFILES-UE-080-local-github-ssh-key.md) in chezmoi, accepted as done (`9dc00af`, pushed) and pruned: on every apply a run script copies the key into `~/.ssh` when OneDrive is readable and no local copy exists, and the SSH config lists the local copy first. It must first run once on sol's screen (steps below). Until then pulls work only from sol's desktop, anything that must reach GitHub or read a secret runs on screen, and unattended "always run from latest" ([DOTFILES-UE-076](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-076-always-run-latest-source.md)) stays blocked.

**Tailscale.** The GUI app stays for now and is listed under Open at Login in System Settings (Kris confirmed, Decision 14), so it should relaunch at login. Its in-app start-on-login setting cannot be set, and it does not appear under Allow in the Background. Restart behaviour is untested and can only be tested with Kris at sol. With FileVault on, any restart (macOS update, power loss) leaves sol locked and offline until Kris unlocks it in person, so any reboot needs Kris's approval and presence; until a test restart succeeds, assume a restart may also leave Tailscale disconnected.

**chezmoi on sol.** sol's chezmoi source is at `423fae7` with a clean tree, fast-forwarded by Kris on screen (Decision 10). The non-secret part of the two-part apply (Decision 9) is done and verified: `chezmoi status` was empty for all 269 selected targets, all 55 `.chezmoiremove` deletions ran, sol's local VS Code settings were overwritten as approved, both run scripts finished, and a fresh login shell finds `brew`, `rig`, `ki` and `mgit` without errors. After the next pull, `chezmoi apply` on sol stops until `rigProfile` is set, so run `chezmoi init --promptString rigProfile=studio` first. The four 1Password-backed targets, by Kris in Terminal on sol's screen with 1Password unlocked, are:

```sh
chezmoi diff ~/.claude.json "$HOME/Library/Application Support/Claude/claude_desktop_config.json" ~/.mcporter/mcporter.json ~/.codex/config.toml
chezmoi apply -v ~/.claude.json "$HOME/Library/Application Support/Claude/claude_desktop_config.json" ~/.mcporter/mcporter.json ~/.codex/config.toml
chezmoi status
```

`chezmoi status` should then be empty.

**Laptop.** Kris has set `rigProfile=laptop` (Decision 17), so laptop applies no longer stop. The laptop's live `~/.config/rig` still has the old profiles (`default`, `public`, `services`) because nothing has been applied since. Still to do on the laptop, after reviewing `chezmoi diff`: `chezmoi apply` (expect two "copied <kris@kris.me.uk>" lines from DOTFILES-UE-080); `rig apply --scope tools` (installs Spark Desktop; Rig checks Dock paths before installing, so a single plain `rig apply` would skip the Dock this time); then `rig apply` (swaps the Spark Dock icon).

**1Password references.** The rig.chezmoi thread is reorganising the 1Password vaults ([DOTFILES-UE-077](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-077-reorganise-1password-vaults-safely.md), triage) and repoints references in `.chezmoidata/mcp-servers.yaml` as items move. Kris applies the four targets on sol only after the 1Password changes on the laptop have finished (Decision 15), then pulls on sol's screen so both sources agree; check for later reference changes before applying.

**Profiles** ([DOTFILES-UE-075](https://github.com/krisb/dotfiles/blob/4817b1947e10e047413288464280061a141de7ab/docs/roadmap/DOTFILES-UE-075-sol-tailscale-daemon-exception.md), done, accepted on Decision 17 and pruned). One catalogue: `core` on every machine, `laptop` and `studio` building on it, chosen by the `rigProfile` value chezmoi asks for once; an unprofiled machine stops. Paperclip and the WhatsApp and 5G-Emerge refresh jobs are laptop-only; DisplayLink, WiFi Explorer, Tailscale, Outlook, Spark Desktop and the shared macOS settings are in `core`; DaVinci Resolve and Lightroom Classic are in `studio`. sol has not been verified against it yet, because its `rig.toml` is not re-rendered.

**Rig plan on sol.** The last dry run, before the profiles and with the old configuration, showed 47 of 225 entries to change: 3 formulae, 18 casks (including nordvpn, displaylink, onedrive, zoom, slack, launchcontrol and processspy), 2 App Store apps (Actions, Telegram), 4 other tools, 2 skills, 6 launchd jobs and 2 services, the two mcporter services and 4 macOS defaults (raw output `sol-rig-dryrun-2.txt` in the run directory). With the `studio` profile the dry run should show the missing core tools, DaVinci Resolve and Lightroom Classic as present, no Dock work and nothing for Paperclip. NordVPN stays in for now; Kris may drop it later. Rig never uninstalls software.

**Dock.** Rig's Dock apply clears the Dock and re-adds only declared items, and fails the whole Dock step on any missing path. Kris wants one Dock order on every machine, each showing only the items it has (Decision 13); Rig cannot express that until [RIG-CORE-042](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-042-profile-filtered-dock-items.md) lets a Dock item follow its app's profile. Until then the laptop's Dock is unchanged except that Spark Desktop takes Spark's place, and `studio` selects no Dock, so `rig apply` leaves sol's Dock (Outlook, Lightroom Classic, Spark Desktop) as it is.

**Software reconciliation** (full lists in `sol-laptop-compare.txt` in the run directory). The laptop matches its Rig declaration exactly; sol lacks 28 declared tools. PTGui Pro, PhotoSweeper, ScanSnap Home, Synology Drive Client and Dropbox are clean-up candidates on sol, and the old Spark Mail is to go (Decision 16). Kris's decisions are recorded in [DOTFILES-UE-079](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md) (`00e5d9a`, pushed). Per Decision 18, once the add and remove decisions have been acted on, the items marked "leave" are revisited as a subset and decided again; record this in DOTFILES-UE-079 when it is next touched. Nothing is uninstalled; removals are by hand or later through [RIG-CORE-041](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md).

**Project note.** [mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md) carries the Decision 16 wording, citing GDR-KI-ARCADIA-004 and describing the `studio`-on-`core` profile without a record ID, so the STREAM-9 failure is gone. Committed as `e6e3b33` (the run reported `3ca2315`, since rewritten); it is already on `origin/main`.

**Rig and chezmoi records:**

- [DOTFILES-UE-075](https://github.com/krisb/dotfiles/blob/4817b1947e10e047413288464280061a141de7ab/docs/roadmap/DOTFILES-UE-075-sol-tailscale-daemon-exception.md) in chezmoi, "Per-machine Rig profiles": done (acceptance `2cf5403`, pushed); pruned in `eeaa891`, unpushed.
- [DOTFILES-UE-080](https://github.com/krisb/dotfiles/blob/4817b1947e10e047413288464280061a141de7ab/docs/roadmap/DOTFILES-UE-080-local-github-ssh-key.md) in chezmoi, local copy of the GitHub key for SSH sessions: done (acceptance `9dc00af`, pushed); pruned in `eeaa891`, unpushed.
- [DOTFILES-UE-076](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-076-always-run-latest-source.md) in chezmoi (triage): bring the source to `origin/main` by fast-forward only on every machine before applying, and refuse when that is not possible. Linked to DOTFILES-UE-080.
- [DOTFILES-UE-079](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md) in chezmoi (triage): Kris's decisions on every undeclared app, recorded in `00e5d9a`; the add and remove items are not yet acted on.
- [RIG-DIST-010](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-DIST-010-release-current-catalogue-reader.md) in `tools-rig` (triage): publish a Rig release that reads the current catalogue; `v0.5.0` is published and on sol, and adopting and accepting the record are Kris's call.
- [RIG-CORE-041](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md) in `tools-rig` (triage, pushed): `rig doctor` warnings that tell unwanted software apart from drifted software, plus an explicit, opt-in removal list with an uninstall dry run.
- [RIG-CORE-042](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-042-profile-filtered-dock-items.md) in `tools-rig` (triage, pushed): profile-filtered Dock items, so one shared Dock order can live in `core`. The chezmoi-template alternative is the fallback if declined.

**Remaining sol sequence:**

1. **Screen.** `chezmoi git -- pull --ff-only`, then `chezmoi init --promptString rigProfile=studio`, which re-renders `~/.config/rig/rig.toml` on the next apply so `rig show` works.
2. **Screen.** `chezmoi diff`, then `chezmoi apply`; check `rig show` and `rig status` now succeed; expect the two "copied <kris@kris.me.uk>" lines; check `ls -l ~/.ssh/kris@kris.me.uk*` shows `-rw-------` and `-rw-r--r--`. After the laptop's 1Password changes have finished, apply the four 1Password-backed targets (commands above).
3. **SSH.** `ssh -T git@github.com` should authenticate. If it asks for the key's passphrase, run `ssh-add --apple-use-keychain ~/.ssh/kris@kris.me.uk` once at sol's screen.
4. **Screen.** `rig apply --dry-run` and check it; Kris approves `rig apply`, run on screen for the administrator-password and macOS approval prompts (displaylink, nordvpn, onedrive, zoom, slack, maybe launchcontrol and processspy); then `rig status`, `rig status --unmanaged` and `rig doctor`.
5. **Screen.** `ki bootstrap` (tools-ki getting-started guide; `ki-bootstrap` skill).
6. **SSH.** `ki diag` and `ki doctor`.
7. **Screen or SSH + Kris.** Sign in to Claude Code, Zed's agent and GitHub as Kris.
8. **SSH.** Restore the workspace with `mgit repair` (preview, then `--apply`), register each repository with `ki registry add --repo <path>`, check `mgit doctor` and `ki registry list`.
9. **Kris present.** A test restart, to confirm Tailscale relaunches from Open at Login and reconnects after the FileVault unlock.
10. **Conditional, Kris present.** Only if Kris later decides to swap the Tailscale app for the `tailscaled` daemon.

**Unpushed local commits** (pushing needs Kris's approval):

| Repository | Commits |
| --- | --- |
| `ki-arcadia-principal` | `9ea3ade` (permalinks) and this update; `805c2e7` belongs to another thread. Local `main` is also one commit behind `origin/main` (`d78645d`), so integrate before pushing |
| chezmoi (`~/.local/share/chezmoi`) | `c47059e` (permalinks) and `eeaa891` (prune of DOTFILES-UE-075 and DOTFILES-UE-080). Local `main` is one commit behind `origin/main` (`ed321f8`), so integrate before pushing. Before this push, the rig.chezmoi thread must repin line 23 of its own checkpoint `rig.chezmoi.md`, whose `main` links to DOTFILES-UE-075 break once the prune lands. The uncommitted `.chezmoidata/mcp-servers.yaml` edit belongs to another thread |
| `tools-rig` | `de4fdee` (permalink in RIG-CORE-042). Local `main` is one commit behind `origin/main` (`a1cc074`), so integrate before pushing |

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
- The App Store on sol is signed in; the four 1Password-backed targets wait until the laptop's 1Password changes have finished (Decision 15).
- Project note wording approved (Decision 16), with record IDs swapped for GDR-KI-ARCADIA-004 (Decision 17).
- GitHub on sol uses Kris's own key, not a new one and not the 1Password SSH agent, copied into `~/.ssh` automatically by chezmoi (Decisions 15 to 17).
- The old Spark Mail goes; only Spark Desktop is installed for mail (Decision 16).
- Decision 17: laptop profile set; accept and push DOTFILES-UE-075; prepare (not publish) a newer Rig release for sol; build the GitHub key copy into chezmoi; update the Project note.
- Decision 18: Kris is happy with the Decision 17 actions; DOTFILES-UE-079 "leave" items are revisited as a subset after the add and remove items are acted on.
- Decision 19: publish Rig `v0.5.0` and push chezmoi up to `49e43e1` (not `d2500e6`); Kris handed the rollout to this thread, reporting only what is left.

## Files touched

This checkpoint, KI-ARCADIA-GOV-033 and the Project note [mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md). Outside this repository: [RIG-CORE-041](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md), [RIG-CORE-042](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-042-profile-filtered-dock-items.md) and [RIG-DIST-010](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-DIST-010-release-current-catalogue-reader.md) (and the `v0.5.0` and `0.5.0+dev` release surfaces) in `tools-rig`; [DOTFILES-UE-075](https://github.com/krisb/dotfiles/blob/4817b1947e10e047413288464280061a141de7ab/docs/roadmap/DOTFILES-UE-075-sol-tailscale-daemon-exception.md) (and the chezmoi Rig configuration it changes), [DOTFILES-UE-076](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-076-always-run-latest-source.md), [DOTFILES-UE-079](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md) and [DOTFILES-UE-080](https://github.com/krisb/dotfiles/blob/4817b1947e10e047413288464280061a141de7ab/docs/roadmap/DOTFILES-UE-080-local-github-ssh-key.md) (SSH config, key-copy run script and tests) in chezmoi. Agent reports and raw outputs are in `~/.local/state/ki/agents/mac-studio-bootstrap/`, with Kris's decisions in its `decisions.md`.

## Open questions

- **rig.chezmoi repin.** Line 23 of `rig.chezmoi.md` links the pruned DOTFILES-UE-075. Either that thread repoints it or Kris lets this thread do it.
- **sol's Rig profile.** On sol's screen Kris pulls chezmoi, sets `rigProfile=studio`, reviews `chezmoi diff`, applies, then runs `rig apply --dry-run` and `rig apply`; until then `rig show` fails on sol. Then adopting and accepting RIG-DIST-010 is Kris's call.
- **Laptop 1Password work.** Is it finished? The answer decides whether sol's apply includes the four 1Password-backed targets.
- **After sol runs Rig.** This thread runs `ki bootstrap`, `ki doctor` and an SSH `git pull` check on sol.
- **Pushing.** Kris approves pushing chezmoi `c47059e` and `eeaa891`, tools-rig `de4fdee`, and this repository's `9ea3ade` and this update (table above). The chezmoi push waits for the rig.chezmoi thread to repin line 23 of `rig.chezmoi.md`.
- **Laptop apply.** Kris runs the laptop steps under Laptop (chezmoi apply, then the two `rig apply` passes).
- **DOTFILES-UE-079.** Commit Kris's edits, act on the add and remove items, then revisit the "leave" subset (Decision 18). Removals on sol, including the studio clean-up candidates and old Spark Mail, are by hand or through RIG-CORE-041.
- **Work division (for the master thread).** Mac Studio setup, chezmoi and Rig work interleave: Rig uninstall and doctor warnings (RIG-CORE-041), profile-filtered Dock items (RIG-CORE-042), always-run-from-latest (DOTFILES-UE-076), the Rig release (RIG-DIST-010) and the Tailscale variant. RIG-CORE-041, RIG-CORE-042, RIG-DIST-010 and DOTFILES-UE-076 now name mac-studio-bootstrap as their owning Project (`a1cc074` in tools-rig and `ed321f8` in chezmoi, both on `origin/main`); DOTFILES-UE-079 and the Tailscale variant remain for `state-of-play` to place.
- **Record adoption.** RIG-CORE-041, RIG-CORE-042, RIG-DIST-010, DOTFILES-UE-076 and DOTFILES-UE-079 are triage records; horizon and adoption are Kris's call. The shared Dock waits on RIG-CORE-042.
- **Tailscale restart and 1Password targets on sol.** Both still pending, with Kris at sol. Until a test restart succeeds, assume a restart cuts off remote access.
- **Later choices.** Whether to drop NordVPN; whether to trust any of the six other Homebrew taps; apply the Command Line Tools update; whether to swap Tailscale for `tailscaled`.

## Next step

On sol's screen: pull, `chezmoi init --promptString rigProfile=studio`, `chezmoi apply` (re-rendering `rig.toml`, copying the GitHub key, and the four 1Password-backed targets once the laptop's 1Password work has finished), check `rig show` and `rig status`, check `ssh -T git@github.com` over SSH, `rig apply --dry-run`, `rig apply`, `ki bootstrap`, `ki doctor`, and a restart test. Meanwhile the master thread settles the work division above.
