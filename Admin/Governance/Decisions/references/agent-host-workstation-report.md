# Agent host as Kris's working machine: merged report

**Brief:** `agent-host-workstation-brief.md` · **Reviews:** `agent-host-workstation-review-fable.md`, `agent-host-workstation-review-codex.md` · **Date:** 2026-10-07

## Summary

Treat the subject as two concerns with two owners. Tools every agent session needs stay in the `ki-techne-harness` recipe, with exact pins and drift reporting already decided by the durability loop. Kris's own layer - personal tools, a host-safe zsh profile and instructions that match what the host can do - is rendered on the Mac from an explicit allowlist in the chezmoi source and delivered as a payload through the one existing reconcile path, `techne host setup`. chezmoi never runs against the full source on the host, and nothing in the profile adds a credential, an unattended process or a roadmap writing checkout. `DOTFILES-UE-020` was cancelled this evening, so the chezmoi side needs a fresh record. The open choices are when to capture it, how zsh becomes the login shell, and whether detached delegation belongs on the host at all while the exemption allows agents only in sessions Kris opens.

## Corrections to the brief

- `DOTFILES-UE-020` is held on stale prerequisites (Established facts; point 14) - it was cancelled with `resolution: rejected` in chezmoi `897993d` and pruned in `0c572e7`, both on 2026-10-07. Its Cancelled section says to "capture the host-profile slice afresh if the 2026-11-06 review keeps the host". There is no hold to release. Both reviews.
- The Mac runs `ki` 0.8.1 - it now runs 0.8.3, so the host's 0.7.1 pin is two releases behind. Fable review; `tools-ki/package.json`.
- The only credentials on the host are the GitHub token and Kris's Claude login - too categorical. The host also has an instance role and an authenticated Tailscale node, and the operator guide expects an interactive Codex login. The instance role can only read and decrypt parameters under the host's prefix (`infra/aws/agent-host-stack.yaml` lines 171-196), so it confers no operator permissions. Codex review.
- `ADR-TECHNE-003` is cited as a harness decision - its live copy is in Arcadia, `Admin/Governance/Decisions/ADR-TECHNE-003-techne-implementation-ownership.md`. Both reviews.
- `host/repositories.txt` holds "the rest of Kris's estate" - it lists 21 repositories, all under `knowledgeislands/`, matching the token's scope. Fable review.
- `claude-bg` - it detaches through `perl -MPOSIX` on every platform, not only on macOS (`bin/executable_claude-bg` lines 99-105), so the host needs Perl's POSIX module. Codex review; Fable's "macOS fallback only" is not borne out by the script.
- The Mac-only zsh fragments include oh-my-zsh - `dot_zsh/50_oh_my_zsh` is home-relative, guards its `brew` plugin and its `source`, so it is portable once oh-my-zsh is installed; it is excluded from the pilot on usefulness, not portability. `dot_zsh/50_mise` is portable and needed for repository environments. Codex review.
- The Project note's "Open records" and "Next step" sections - removed since the brief was written; the note no longer carries them. Fable review.
- The addendum cites the identity choice as durability Decision 3 - it is a related decision, "Credential identity", in `agent-host-durability-decisions.md`, and is now in the hold policy's Credentials bound (`Techne Programme Hold.md` line 31). Decision 3 there is the snapshot route. Fable review.

## Model

1. **Two layers, two owners.** The recipe owns what every session needs (`ki`, mise, Bun, Node, Codex, Claude Code, Git settings, the repository set), declared as exact pins in one harness file with drift reported against the pins and the Mac, as durability Decision 7 already settles. Kris's chezmoi source owns the personal layer: personal tools, shell profile, instruction files and helpers. Neither layer writes the other's destinations: `~/.config/mise/config.toml` and the agent instructions under `~/.claude/` stay recipe-written, and the profile contributes to them only through declared hooks.
2. **Render on the Mac, deliver through setup.** chezmoi renders an explicit allowlist of host-safe files and personal tool pins into a payload; `setup.sh` already does this for `AGENT_HOST_INSTRUCTIONS` with `chezmoi cat`. The payload contract is person-neutral in the harness ("apply the person's profile payload if one is supplied") and carries a revision, file ownership and permissions, removal of files dropped from the allowlist, and a validation step that checks rendered contents, not only names, for secrets and Mac-only paths (Codex Add). Delivery stays pull-on-demand by Kris running `techne host setup`: no second channel and no schedule.
3. **No chezmoi apply on the host.** The source has no OS or hostname gating, resolves 1Password at apply time, re-includes mcporter, Paperclip and LaunchAgents material, and collides with `converge.sh`; the host cannot reach `krisb/dotfiles` anyway. Both reviews agree.
4. **Tools.** `mgit` is a clean fit (Bash and Git, Linux installer) but works by discovery only, because its workspace manifests are chezmoi-managed and absent on the host (Fable). `techne` on the host is of little operator use: the instance role reads parameters only, and the Mac holds the bindings and administrator session (hold line 31). The checkout already runs it through `bun run`. A chezmoi binary on the host is not needed while the Mac renders.
5. **Shell.** The stack still creates `techne` with `/bin/bash` and `techne` cannot `chsh`. `converge.sh` already writes `.profile` and `.bashrc`, so a guarded hand-off to `zsh -l` for interactive sessions is possible without root; `--shell /bin/zsh` in the stack is the clean fix but needs a rebuild, which now costs a fresh Tailscale key and device removal (durability report). `env.sh` must also be sourced from zsh's startup files, and login, interactive, non-interactive SSH and Git-hook shells all tested (Codex Add).
6. **Instructions match the host.** The rendered `delegation.md` names `~/bin/claude-bg`, which the host lacks. Either the helper travels with the instructions, or the host gets a variant without detached delegation. Which one is a decision (below), because detached agents outlive the launching session and the hold allows agents "only in sessions Kris opens, with no unattended or scheduled agents" (hold line 28).
7. **The host is not a writing checkout.** Durability Decision 6 makes the Mac the roadmap writing checkout for every Knowledge Islands repository, enforced by a host marker in `ki`. "Usable like Kris's machine" holds inside that bound: the profile must not deliver anything that marks the host as a writing checkout (Fable Add).
8. **Within the exemption.** Rerunnable setup, updates and status on one host, with no new credential and no unattended process, is inside GDR-KI-ARCADIA-004 as now amended. Whether detached helpers are is decision 5.
9. **Recovery.** `techne host status` assesses Git checkout state only. Personal profile and runtime state recover by re-running setup from the Mac; the guide should say so (Codex Add). The guide's references to the retired `techne-agent-host` helper are corrected in the same harness record (Fable Add).

## Agreement and difference

| Point | Reviews | Settlement and evidence |
| --- | --- | --- |
| 1 | Fable Agree; Codex Agree | Kept. Codex adds that dependencies are declared together; folded into model 2. |
| 2 | Fable Agree; Codex Agree | Kept. Where personal tool pins are declared - Rig, which models the Mac and marks `mgit`, `ki` and chezmoi macOS-only, or the profile manifest - is decision 3. |
| 3 | Fable Agree; Codex Differ | Projection kept; UE-020 cannot carry it because it is cancelled (`897993d`). A fresh record is decision 2. |
| 4 | Fable Agree; Codex Agree | Kept. Codex notes a standalone chezmoi binary need not imply source access; not needed while the Mac renders. |
| 5 | Fable Agree; Codex Agree | Kept, with Codex's addition: validate rendered contents and dependencies, not only filenames. |
| 6 | Fable Agree; Codex Agree | Kept. The `claude/` payload in `setup.sh` lines 34-42 generalises to the profile payload. |
| 7 | Fable Agree; Codex Agree | Kept, with Fable's limit: discovery only, `knowledgeislands/` subtree only. |
| 8 | Fable Agree; Codex Differ | Settled for the brief: the instance role reads only the host's parameters (stack lines 171-196) and the hold reserves AWS operation to the binding owner and operator role (line 31). Codex is right that the brief overstated "none the host holds"; corrected above. |
| 9 | Fable Agree; Codex Agree | Baseline half already decided (durability Decision 7). Codex adds the boot-installed Node and unpinned Claude Code to the drift report; adopted. |
| 10 | Fable Differ; Codex Agree | Fable's user-level hand-off is available today (`converge.sh` writes `.bashrc`); the stack change needs a rebuild. Which route the pilot takes is decision 4. |
| 11 | Fable Agree; Codex Differ | Codex is right on oh-my-zsh (guarded, home-relative); the pilot still excludes it on usefulness. Fable's check of the `00_zsh_*` fragments, which likely source Homebrew plugins, is adopted. |
| 12 | Fable Agree; Codex Agree | Both agree instructions must match tools; they differ on the branch - Fable delivers `claude-bg`, Codex a host variant. Decision 5. |
| 13 | Fable Agree; Codex Differ | Setup is within the exemption. Whether a detached helper keeps agents "in sessions Kris opens" is not settled by the evidence; decision 5. |
| 14 | Fable Differ; Codex Differ | Both right: UE-020 is cancelled and pruned. Decision 2. |
| 15 | Fable Agree; Codex Differ | Pilot set kept but sequenced after the durability pilot, which edits the same harness scripts (Fable), and without detached delegation unless decision 5 says otherwise (Codex). |
| - | Fable Add | The host is not a roadmap writing checkout (durability Decision 6). Adopted as model 7. |
| - | Fable Add | The design-loop standard now places artefacts in `Streams/Projects/agent-host/design/`; both agent-host loops used `Admin/Governance/Decisions/references/`. Decision 1. |
| - | Fable Add | Operator guide still names the retired `techne-agent-host` helper. Adopted into the harness record. |
| - | Fable Add | Token expiry now 90 days. Out of scope; already decided by the durability loop. |
| - | Codex Add | Payload revision, ownership, permissions, removal, validation and rollback. Adopted as model 2. |
| - | Codex Add | Test every shell entry path, including repository mise environments. Adopted as model 5. |
| - | Codex Add | Codex instructions and login belong in the inventory; the projection is Claude-only today. Adopted into the pilot. |
| - | Codex Add | Profile and runtime state recover by re-running setup, not by Git status. Adopted as model 9. |

## Rollout plan

Records are captured through `ki-next` once Kris decides; none exists yet.

- **`ki-techne-harness`** (pilot): person-neutral profile payload hook in `setup.sh` and `converge.sh` with the model 2 contract; zsh startup sourcing `env.sh` and the shell route from decision 4; `mgit` install under the declared pins; personal-tool drift in `status.sh`; operator guide corrections. Sequenced after the durability pilot, which edits `converge.sh`, `status.sh` and the rebuild path.
- **chezmoi** (pilot, paired): the allowlist and renderer for the host profile - minimal portable zsh fragments (`00_xdg_base_dirs`, `00_path`, `00_utils`, `50_mise`, `50_ki`, `99_prompt`, after checking each), the instruction files for Claude and Codex, and the delegation branch from decision 5.
- **`tools-techne`** (wave 2): pass the profile through `techne host setup` if the harness hook needs an argument, and show personal-tool drift in `techne host status`.
- **Arcadia**: the Project note link and, if a decision changes, the Decision Record; then the design folder is consolidated and deleted.

The pilot proves the path end to end with `mgit`, a zsh session and a minimal profile before the allowlist grows.

## Decisions

1. **Where the design artefacts live.** - Options: (a) leave both agent-host loops' artefacts in `Admin/Governance/Decisions/references/`, as their prompts directed; (b) move both loops' artefacts to `Streams/Projects/agent-host/design/` with a `design.md` index and the Project note as its folder note, as the current design-loop standard requires. Recommendation: (b), in one commit after the durability rollout's Project note edits settle, so the two runs do not collide on the note.
2. **The chezmoi record for the host profile.** - Options: (a) capture a fresh chezmoi record now, since Kris has already decided early to keep `direct-host` (KI-ARCADIA-GOV-021), which meets UE-020's recapture condition; (b) wait for the 2026-11-06 review. Recommendation: (a), and drop the name "Cheztoi" unless Kris wants it kept, since no live record carries it.
3. **Where personal tool pins are declared.** - Options: (a) a host-profile manifest in the chezmoi source, rendered into the payload; (b) Rig, extended with a Linux platform for `mgit` and friends. Recommendation: (a). Rig models the Mac workstation (ADR-DOTFILES-008) and installs through Homebrew; the host installs through release installers and mise.
4. **How zsh becomes the login shell.** - Options: (a) a guarded hand-off from `.bashrc` to `zsh -l` now, with `--shell /bin/zsh` folded into the next rebuild that happens for another reason; (b) change the stack and rebuild now. Recommendation: (a). A rebuild costs a fresh Tailscale key and device removal and buys nothing the hand-off does not.
5. **Detached delegation on the host.** - Options: (a) deliver `claude-bg` with the instructions, on the rule that Kris launches detached agents only from a session Kris opened, and they finish or are stopped before that session ends; (b) deliver a host variant of `delegation.md` without detached delegation until the portable `ki-delegation` contract and its `ki` tooling (`KI-HARNESS-GOV-144`) settle supervision and termination; (c) amend the exemption to allow it explicitly. Recommendation: (b). The hold allows agents only in sessions Kris opens (line 28); a helper whose purpose is to outlive the session needs that settled first, and `ki` is already on the host to carry the portable successor.
6. **`techne` and chezmoi binaries on the host.** - Options: (a) neither in the pilot; `techne` runs from its checkout through `bun run`; (b) install `techne` by its Linux installer, never with a binding or AWS profile. Recommendation: (a). Its operator commands need the Mac's bindings and administrator session; revisit if a host-side use appears.
7. **The pilot.** - Options: (a) one harness record plus one paired chezmoi record - payload contract, zsh route, `mgit`, minimal profile, Claude and Codex instructions - after the durability pilot; (b) harness record alone, with the chezmoi side in wave 2. Recommendation: (a), because the payload contract is only proven with a real payload.

## Changes after review

- UE-020 is treated as cancelled, not held; the chezmoi side becomes a fresh record (both reviews).
- The Mac's `ki` version, the host's credential surface, ADR-TECHNE-003's home and the repository set are corrected (Fable, Codex).
- The zsh route gained a no-rebuild option (Fable).
- Detached delegation moved out of the default pilot and into a decision against the hold's session-only bound (Codex).
- The payload contract gained revision, ownership, removal, content validation and rollback; shell-path testing and Codex instructions joined the pilot (Codex).
- The model now states that the host is not a roadmap writing checkout, and the design-folder location became a decision (Fable).
