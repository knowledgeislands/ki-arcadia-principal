---
type: ki-checkpoint
thread: rig.mac-studio-bootstrap
label: 'Rig: mac-studio-bootstrap'
state: active
created_at: 2026-10-08T08:45:00Z
updated_at: 2026-10-10T15:38:00Z
---

# rig.mac-studio-bootstrap

## Objective

Bring Kris's Mac Studio, unused for over a month, back to full estate capability so any thread can resume there, and make it a reliably reachable remote agent host ([mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md), Initiative [Rig](../../Streams/Initiatives/rig.md)). The thread is driven remotely over the tailnet from the laptop. The Project is close to done: what remains is the three running sol agents, a restart test, record acceptance, pushes and handing the follow-ups on.

## Current state

**Mark 2, 2026-10-10 17:37 CEST** (Decision 28 in the run's `decisions.md`). A "summary since the mark" covers everything after it, including every open question below that is still open at the mark. The earlier mark (Decision 21) is superseded.

**Ownership.** The Mac Studio is Kris's personal hardware, built and managed by Kris's own Rig and chezmoi (`studio` profile on `core`), not by Techne, and it is separate from the Techne agent-host. Remote agent use and administration are exempt from the Techne Programme Hold under [KI-ARCADIA-GOV-033](https://github.com/knowledgeislands/ki-arcadia-principal/blob/60e8a65e5eb56b0496cf917763397339734ade1e/Streams/Roadmap/KI-ARCADIA-GOV-033-exempt-the-mac-studio-as-a-remote-agent-host.md) (done, pruned). Each step on the machine still runs only once Kris approves it.

**Machine.** The Mac Studio is `sol` on the tailnet (`100.90.130.74`), user `krisbrown`, key-based SSH (plain `ssh sol` fails because `known_hosts` holds the IP). macOS 26.5.2, FileVault on, kept awake by Amphetamine, restarts after power loss, wakes on network; display sleep 30 minutes with a password required as soon as the screen locks.

**Rig and chezmoi on sol.** sol runs `rig 0.5.0` with `rigProfile=studio`. `rig apply` has run twice: planned 153, completed 189, failed 9, skipped 18. The full `chezmoi apply` is clean, including the four 1Password-backed targets and the GitHub key copy ([DOTFILES-UE-080](https://github.com/krisb/dotfiles/blob/4817b1947e10e047413288464280061a141de7ab/docs/roadmap/DOTFILES-UE-080-local-github-ssh-key.md), done, pruned). The 1Password Touch ID workaround over Screen Sharing works and is written up in the workstation guide.

**Running agents** (run directory `~/.local/state/ki/agents/mac-studio-bootstrap/`, chained, not finished at the mark):

- `sol-apply-failures` diagnoses the nine `rig apply` failures (read-only).
- `sol-ki-bootstrap` runs `ki bootstrap`, `ki doctor` and the SSH pull check on sol (Decision 26).
- `sol-fix` fixes what it can over SSH without sudo (Decision 27): adopt present casks with `brew install --cask --adopt`, rerun `rig apply`, fix doctor findings in sol's own user setup. Excluded: sudo, reboot, uninstalling, downgrading self-updated apps, on-screen approvals, other machines and remote services. OneDrive is a self-updated app and stays as it is.

Their reports land as `<name>.report.md` in the run directory; read them first on resume.

**Tailscale.** The GUI app stays and is listed under Open at Login (Decision 14). Restart behaviour is untested. With FileVault on, any restart leaves sol locked and offline until Kris unlocks it in person, so any reboot needs Kris's approval and presence; until a test restart succeeds, assume a restart may also leave Tailscale disconnected.

**Captured since the last mark** (all local and unpushed):

- [RIG-CORE-043](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-043-self-updating-applications.md) in tools-rig (triage): self-updating applications, with OneDrive on sol as the example (Decision 24).
- [DOTFILES-UE-082](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-082-tolerate-missing-template-tools.md) in chezmoi (triage): templates that look up a not-yet-installed tool warn and skip rather than fail the apply (Decision 25).
- The chezmoi workstation guide (`docs/guides/user/macos-workstation.md`) has a "Set up a new machine" section: profile first, apply order, 1Password over Screen Sharing, sudo keep-alive and the temporary sudoers timeout, self-updating apps, FileVault restarts (Decision 23).
- The 1Password service-account option (a service account scoped to the Rig vault, for unattended applies on sol) is handed to the rig.chezmoi thread as an open question in its checkpoint (Decision 25). That checkpoint's broken DOTFILES-UE-075 link is gone; the rig.chezmoi thread's own rewrite removed it (Decision 22).

**Other open records:** [RIG-DIST-010](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-DIST-010-release-current-catalogue-reader.md) (triage, waits for acceptance now sol runs Rig), [RIG-CORE-041](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md) (opt-in removal), [RIG-CORE-042](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-042-profile-filtered-dock-items.md) (profile-filtered Dock items; until then `studio` selects no Dock and sol's Dock stays as it is), [DOTFILES-UE-076](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-076-always-run-latest-source.md) (always run from latest), [DOTFILES-UE-079](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md) (undeclared software: act on add and remove, then revisit "leave", Decision 18). All are triage; adoption is Kris's call.

**Unpushed local commits** (pushing needs Kris's approval):

| Repository | Commits |
| --- | --- |
| chezmoi (`~/.local/share/chezmoi`) | `92fe97b` (guide), `a117aae` and `8fc878f` (DOTFILES-UE-082). `64a6fcd` and `ecc5339` (DOTFILES-UE-078) belong to the rig.chezmoi thread |
| `tools-rig` | `18b5eda` and `7d50431` (RIG-CORE-043) |
| `ki-arcadia-principal` | This checkpoint's commit; the local tracking ref shows nothing else ahead (not fetched) |

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

## Files touched

This checkpoint. Outside the repository, since the last mark: RIG-CORE-043 and the tools-rig `_ISSUES.md` ledger; DOTFILES-UE-082, the chezmoi roadmap ledger, `docs/guides/user/macos-workstation.md` and `docs/guides/user/README.md` in chezmoi; one Open questions line in [rig.chezmoi](rig.chezmoi.md). On sol: Rig-installed software and the full chezmoi target set. Agent prompts, statuses, reports and `decisions.md` are in `~/.local/state/ki/agents/mac-studio-bootstrap/`.

## Open questions

Open at Mark 2:

1. **Sol agents.** Results of `sol-apply-failures`, `sol-ki-bootstrap` and `sol-fix`, and whatever they leave for Kris at sol's screen (sudo, macOS approvals, sign-ins).
2. **Restart test** with Kris at sol, to see whether Tailscale relaunches and reconnects after FileVault unlock.
3. **Accept RIG-DIST-010** now that sol runs Rig.
4. **Push** the local commits in chezmoi, tools-rig and Arcadia (table above).
5. **Close the Project** and hand the follow-ups to the Rig Initiative and the rig.chezmoi thread: RIG-CORE-041, RIG-CORE-042, RIG-CORE-043, DOTFILES-UE-079 (act on add and remove, then revisit "leave"), DOTFILES-UE-082, and the 1Password service account.
6. **rig.chezmoi checkpoint** has RECORD-2 heading failures (`## Decisions in force` instead of `## Decisions made`) that only its own thread can fix.
7. **Later:** NordVPN, the six untrusted Homebrew taps, the Command Line Tools update, and the `tailscaled` swap.

## Next step

Read the three sol agent reports in the run directory and give Kris the on-screen list they leave; then, with Kris at sol, run the restart test. After that, ask Kris to accept RIG-DIST-010, approve the pushes, and close the Project with the follow-ups handed on.
