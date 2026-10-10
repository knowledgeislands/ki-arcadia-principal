---
type: ki-checkpoint
thread: rig.mac-studio-bootstrap
label: 'Rig: mac-studio-bootstrap'
state: active
created_at: 2026-10-08T08:45:00Z
updated_at: 2026-10-10T17:10:00Z
---

# rig.mac-studio-bootstrap

## Objective

Bring Kris's Mac Studio, unused for over a month, back to full estate capability so any thread can resume there, and make it a reliably reachable remote agent host ([mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md), Initiative [Rig](../../Streams/Initiatives/rig.md)). The thread is driven remotely over the tailnet from the laptop. The Project is close to done: what remains is Kris's actions at sol, a restart test, and handing the follow-ups on.

## Current state

**Mark 2, 2026-10-10 17:37 CEST** (Decision 28 in the run's `decisions.md`). A "summary since the mark" covers everything after it, including every open question below that is still open at the mark. The earlier mark (Decision 21) is superseded.

**Ownership.** The Mac Studio is Kris's personal hardware, built and managed by Kris's own Rig and chezmoi (`studio` profile on `core`), not by Techne, and it is separate from the Techne agent-host. Remote agent use and administration are exempt from the Techne Programme Hold under [KI-ARCADIA-GOV-033](https://github.com/knowledgeislands/ki-arcadia-principal/blob/60e8a65e5eb56b0496cf917763397339734ade1e/Streams/Roadmap/KI-ARCADIA-GOV-033-exempt-the-mac-studio-as-a-remote-agent-host.md) (done, pruned). Each step on the machine still runs only once Kris approves it.

**Machine.** The Mac Studio is `sol` on the tailnet (`100.90.130.74`), user `krisbrown`, key-based SSH (plain `ssh sol` fails because `known_hosts` holds the IP). macOS 26.5.2, FileVault on, kept awake by Amphetamine, restarts after power loss, wakes on network; display sleep 30 minutes with a password required as soon as the screen locks.

**Rig and chezmoi on sol.** sol runs `rig 0.5.0` with `rigProfile=studio`; its chezmoi source is at `a81a5f2`, matching `origin/main`, and every target is applied except `~/.config/ki/config.toml`, held back for the HNR harness question (Kris to do item 2). The apply covers the four 1Password-backed targets and the GitHub key copy ([DOTFILES-UE-080](https://github.com/krisb/dotfiles/blob/4817b1947e10e047413288464280061a141de7ab/docs/roadmap/DOTFILES-UE-080-local-github-ssh-key.md), done, pruned). The 1Password Touch ID workaround over Screen Sharing works and is written up in the workstation guide. Kris has swapped sol's App Store and hand-installed copies of Slack, TickTick, WiFi Explorer and Spark Desktop for Homebrew ones and moved Telegram to the App Store (Decision 30).

**sol after the agent runs.** sol uses released `ki 0.10.0` from Homebrew with the released KI harness; `ki doctor` passes 13 of 13. The stale tools-ki dev runner (`~/.local/bin/ki`, its `.ki-local-runner` and the `ki.1` man link into tools-ki) and the parked July harness folder are deleted. apps-observatory is cloned at `~/workspaces/kit/knowledgeislands/apps-observatory`, not started. The HNR harness keeps its remembered local source in `~/.config/ki/config.toml` but is no longer a configured harness (it has no released archive).

**sol `rig doctor` (17:55 BST, interactive login shell, before the chezmoi apply):** unhealthy, 9 findings. Missing via Homebrew: `beyond-compare`, `gitup` and `ollama` (old `/usr/local/bin` artifact paths, fixed in chezmoi `a737ffb`; config now applied, awaiting `rig apply`), `daisydisk` (now declared from the App Store in `a81a5f2`; awaiting `rig apply`) and `onedrive` (self-updated copy; Kris deletes it). `port.observatory` not listening. Three historical apply failures: `daisydisk`, `onedrive`, `warp` (Warp had updated itself mid-install; the dry run now has nothing to do). The `skill.archify` and `skill.caveman` `provenance-missing` findings seen earlier appear only in non-interactive SSH shells: `XDG_STATE_HOME` is exported only by the interactive fragment `~/.zsh/00_xdg_base_dirs`, so the `skills` CLI misses its lock file at `~/.local/state/skills/.skill-lock.json`. Both machines have the same lock file and the laptop shows the same finding with the variable unset.

**Agents:** none running; every agent in the chain has finished. Reports are `<name>.report.md` in the run directory `~/.local/state/ki/agents/mac-studio-bootstrap/`; `push-and-apply.report.md` holds the latest pass.

**Pushes and apply.** chezmoi, tools-rig and Arcadia are pushed and match `origin/main`. chezmoi is applied in full on the laptop, and on sol except `~/.config/ki/config.toml`. sol's `chezmoi git -- pull` failed because GitHub over SSH has no key in a non-interactive session; the commit was delivered over the SSH link instead. The laptop's `rig doctor` shows only the two expected Observatory findings, which `rig apply --target observatory` clears.

**Tailscale.** The GUI app stays and is listed under Open at Login (Decision 14). Restart behaviour is untested. With FileVault on, any restart leaves sol locked and offline until Kris unlocks it in person, so any reboot needs Kris's approval and presence; until a test restart succeeds, assume a restart may also leave Tailscale disconnected.

**Captured since the last mark:**

- [RIG-CORE-043](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-043-self-updating-applications.md) in tools-rig (triage): self-updating applications, widened so doctor reports an app installed from a different source than declared and shows the swap steps, never deleting anything (Decisions 24, 33).
- [DOTFILES-UE-082](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-082-tolerate-missing-template-tools.md) in chezmoi (triage): templates that look up a not-yet-installed tool warn and skip rather than fail the apply (Decision 25).
- [RIG-DIST-010](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-DIST-010-release-current-catalogue-reader.md) is `done`, not pruned (Decision 32).
- chezmoi Rig source: Apple Silicon artifact paths for Beyond Compare, GitUp and Ollama, the Observatory launch agent on mise's `latest` bun (Decision 31), and DaisyDisk from the App Store on both Macs (Decision 33; the laptop's old Homebrew record is left alone because uninstalling the cask would delete the App Store app).
- The chezmoi workstation guide has a "Set up a new machine" section (Decision 23). The 1Password service-account option is an open question in the rig.chezmoi checkpoint (Decision 25).

**Other open records:** [RIG-CORE-041](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md) (opt-in removal), [RIG-CORE-042](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-042-profile-filtered-dock-items.md) (profile-filtered Dock items; until then `studio` selects no Dock and sol's Dock stays as it is), [DOTFILES-UE-076](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-076-always-run-latest-source.md) (always run from latest), [DOTFILES-UE-079](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md) (undeclared software: act on add and remove, then revisit "leave", Decision 18). All are triage; adoption is Kris's call.

## Decisions made

- The master thread `state-of-play` owns cross-project priorities and releases; this thread works only on the Mac Studio.
- The Project sits in Rig because the Mac Studio is Kris's workstation; remote agent use is exempt from the hold under KI-ARCADIA-GOV-033 and GDR-KI-ARCADIA-004.
- Rig model: one list of Kris's software, a `core` profile with `laptop` and `studio` inheriting it; Rig never uninstalls but should warn and offer opt-in removal (Decisions 7, 8, 13, 14).
- Tailscale stays as the GUI app login item; any `tailscaled` swap is deferred (Decision 5).
- GitHub on sol uses Kris's own key, copied into `~/.ssh` by chezmoi (Decisions 15, 17).
- New-machine and long-apply practice goes into the chezmoi workstation guide (Decision 23).
- Self-updating apps become a Rig improvement (RIG-CORE-043); OneDrive on sol is not downgraded or reinstalled (Decisions 24, 27).
- Missing template tools become DOTFILES-UE-082; the 1Password service account belongs to the rig.chezmoi thread (Decision 25).
- Agents may run `ki bootstrap`, `ki doctor` and the SSH pull check, and fix sol issues without sudo (Decisions 26, 27).
- Leave sol's App Store copies to RIG-CORE-043 rather than force `brew --adopt`; sol authenticates to GitHub with its own key, so no agent forwarding (Decision 29).
- Make sol match the laptop: Kris swaps Slack, TickTick, WiFi Explorer and Spark Desktop to Homebrew and Telegram to the App Store (Decision 30).
- Switch sol to released ki, fix the Rig artifact paths and Observatory bun path, and clone apps-observatory on sol (Decision 31).
- RIG-DIST-010 accepted; chezmoi, tools-rig and Arcadia pushed and chezmoi applied through `push-and-apply` (Decision 32).
- DaisyDisk comes from the App Store on both Macs (licence); OneDrive on sol is deleted by Kris with sudo; RIG-CORE-043 widened; sol's stale ki runner and parked folder removed; HNR harness left as is (Decision 33).

## Files touched

This checkpoint. Outside the repository, since the last mark: RIG-CORE-043, RIG-DIST-010 and the tools-rig `_ISSUES.md` ledger; DOTFILES-UE-082, the roadmap ledger, `docs/guides/user/macos-workstation.md`, `docs/guides/user/README.md`, `dot_config/rig/conf.d/private_10-applications.toml` and `private_50-services.toml` in chezmoi; one Open questions line in [rig.chezmoi](rig.chezmoi.md). On sol: Rig-installed software, the full chezmoi target set, the released ki harness, the apps-observatory clone, and the removed dev runner and parked folder. Agent prompts, statuses, reports and `decisions.md` are in `~/.local/state/ki/agents/mac-studio-bootstrap/`.

## Open questions

**Kris to do:**

1. **On sol, at the screen:** delete OneDrive (`sudo rm -rf /Applications/OneDrive.app`), then run `rig apply` (Beyond Compare, GitUp and Ollama paths, DaisyDisk from the App Store, OneDrive reinstalled). Then run `mise trust` and `bun install` in the apps-observatory clone, then `rig apply --target observatory`, then sign in to OneDrive again.
2. **HNR harness on sol:** keep it with `chezmoi apply ~/.config/ki/config.toml` on sol, or drop it for sol only by making the harness per-machine in the source. Someone removed it from sol's copy at 17:22 today, so the file was held back.
3. **Laptop (optional):** `rig apply --target observatory` clears the two Observatory findings.
4. **GitHub from non-interactive SSH sessions on sol fails again:** choose agent forwarding or a keychain unlock per session. At sol's screen, `ssh-add --apple-use-keychain ~/.ssh/kris@kris.me.uk` fixes local sessions.
5. **Skills provenance (optional):** approve exporting `XDG_STATE_HOME` for login shells too (move or copy `00_xdg_base_dirs` into `.zprofile.d/`), so `rig doctor` over SSH stops flagging `skill.archify` and `skill.caveman`.
6. **Prune RIG-DIST-010** when ready.
7. **Restart test at sol, Monday evening at the earliest,** to see whether Tailscale relaunches and reconnects after FileVault unlock.

Still open for the thread:

1. **Close the Project** and hand follow-ups to the Rig Initiative and the rig.chezmoi thread: RIG-CORE-041, RIG-CORE-042, RIG-CORE-043, DOTFILES-UE-079 (act on add and remove, revisit "leave"), DOTFILES-UE-082, and the 1Password service account.
2. **rig.chezmoi checkpoint** RECORD-2 heading failures (`## Decisions in force` instead of `## Decisions made`); only its own thread should fix them.
3. **Later:** NordVPN, six untrusted Homebrew taps, Command Line Tools update, and the `tailscaled` swap.

## Next step

Give Kris the **Kris to do** list. Once sol's `rig apply` has run, check its `rig doctor` from an interactive login shell; after the restart test, close the Project with the follow-ups handed on.
