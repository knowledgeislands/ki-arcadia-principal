# Agent host as Kris's working machine: merged report

**Brief:** `agent-host-workstation-brief.md` · **Reviews:** `agent-host-workstation-review-fable.md`, `agent-host-workstation-review-codex.md` · **Date:** 2026-10-07, revised the same day for owner input after review

## Summary

Treat the subject as two concerns with two owners. What every agent session needs belongs to the `direct-host` recipe in `ki-techne-harness`, declared as a Rig profile - tools and their exact pins, with KI skills still installed by `ki bootstrap` - that is the same for anyone who binds the recipe. Kris's own layer comes from the chezmoi source: on a host Kris does not own it travels as Cheztoi, a payload rendered on the Mac from an explicit allowlist and delivered through the one existing reconcile path, `techne host setup`. Cheztoi carries the host-safe zsh profile, instructions that match what the host can do, and Rig fragments for Kris's personal tools and skills. chezmoi never runs against the full source on the host, and nothing in either layer adds a credential, an unattended process or a roadmap writing checkout. Rig already runs on Linux without root, but nothing has yet been declared for Linux and it has no install path for `ki`'s signed release, so the move is staged: Rig observes the recipe's pins first, installs Kris's personal tools in the pilot, and takes over `converge.sh`'s tool installs once it can install `ki`. The open choices are the Cheztoi record, the staging and its trigger, how Rig installs `ki`, how zsh becomes the login shell, and whether detached delegation belongs on the host at all while the exemption allows agents only in sessions Kris opens.

## Owner input after review

On 2026-10-07, after both reviews and the first merged report, Kris gave two directions (coordinator's decisions log, Decisions 4 and 5):

> "I'm guessing a lot will be informed from chezmoi (becoming cheztoi as a play on the subject)"

and

> "it could also be rig based as part of the recipe? that way we are more focused on tools and skills?"

The first makes chezmoi the main source of the host's personal configuration and keeps Cheztoi as the name of its counterpart on hosts Kris does not own; the first report had recommended dropping the name. The second puts a Rig profile into the recipe for tools, skills and managed resources, leaving chezmoi and Cheztoi only the binding owner's personal layer; the first report had recommended against Rig on the ground that it models the Mac. Both directions are folded into the model, the decisions, the rollout plan and the pilot below; the reviews stand as written.

### What Rig offers a no-root Ubuntu host today

- **Runtime and install.** Rig is one Bash 3.2-compatible executable with no runtime dependency beyond Bash (`tools-rig` ADR-RIG-001). It detects `linux` from `OSTYPE` (`src/rig/30-commands.bash`), its whole Bats suite runs on `ubuntu-latest` in CI (`.github/workflows/ci.yml`), and `install.sh` installs into `~/.local/bin` and `~/.local/share/man` with `curl` and no root. The latest release is `v0.4.0`, a pre-v1 preview.
- **Model.** A tool may declare platform variants under one identity, so `mgit` can stay Homebrew on the Mac and take a different installer on Linux (RIG-CONF-021, RIG-CAT-008). Profiles compose through `inherits`, and configuration is `rig.toml` plus `conf.d/*.toml` fragments with exactly one `[rig]` table (RIG-CONF-001), which lets a recipe own the root and a personal layer add fragments.
- **Providers that need no root.** The built-in mise, uv, npm, chezmoi and direct-download providers work on Linux; direct-download fetches one executable over HTTPS, checks its SHA-256 and writes it to a declared destination such as `~/.local/bin` (RIG-ORCH-006, RIG-STATE-012). Custom providers follow the `rig-provider-v1` executable contract.
- **Skills.** Third-party skills install through a deliberately installed Skills CLI; Rig never invokes `ki` (RIG-ORCH-032), so KI skills stay with `ki bootstrap` and Rig at most records them.

### What Rig lacks for this host

- **No Linux declarations.** Every one of the 380 `platforms` entries in Kris's catalogue (`dot_config/rig/conf.d/`) is `["macos"]`, and `ki`, `mgit`, mise and chezmoi are Homebrew formulae. The gap is data, not code: each tool the host needs wants a Linux variant.
- **No install path for `ki`.** `ki` ships signed `tar.gz` archives with a signed checksum manifest that its own installer verifies (`tools-ki/install.sh`); direct-download handles only a single executable checked by SHA-256. Either a harness custom provider that wraps `ki`'s installer or a new archive kind in `tools-rig` is needed.
- **Managers must already exist.** Rig does not bootstrap the native managers it drives, as Homebrew must already be present on the Mac (RIG-ORCH-018). On the host, `converge.sh` keeps installing Rig itself and mise at pinned versions.
- **No Linux resource providers.** launchd, macOS defaults and Dock are macOS-only, and there is no systemd adapter. That suits the hold: the recipe profile declares no managed resources, and validation must refuse a Cheztoi fragment that adds any.
- **Unproven on a real host.** Linux coverage is Bats with faked native commands. No Linux profile has been applied in earnest, and how the mise pins are expressed (Rig locators or the native mise manifest Rig observes) is not yet settled.

### What `converge.sh`'s tool installs become

- **Rig** - newly bootstrapped by `converge.sh` from its installer at a pinned tag.
- **mise** - stays a `converge.sh` bootstrap, as the manager Rig drives.
- **Bun, Node and Codex** - declared in the recipe's Rig profile through the mise provider; observed by Rig first, then installed by `rig apply` once the trigger is met. The global mise manifest is generated from, or checked against, the same declaration so one file stays authoritative.
- **`ki`** - declared in the profile and observed by Rig; installed by `converge.sh` through its signed installer until Rig has an install path for it (decision 3).
- **Claude Code** - declared with a minimum and observed; the stack's boot script keeps installing it.
- **Personal tools such as `mgit`** - declared in Kris's catalogue with a Linux variant, rendered into a Cheztoi fragment and installed by `rig apply` for the owner's profile. `mgit` is a single Bash script, so direct-download from a release tag with a SHA-256 fits.
- Git settings, startup files, the repository set, `ki bootstrap`, registry and projections, and Claude settings are not tool installs and stay in `converge.sh`.

The smallest first step is a pin file in Rig's format. `TECHNE-TOOLS-OPS-014` is still in triage and already promises "one harness file" of exact pins with drift reporting (durability Decision 7). If that file is the recipe's Rig fragment declaring the `direct-host` profile with Linux variants, and `status.sh` reports drift through `rig status --profile direct-host --format json`, Rig is proven on the host with no change to what `converge.sh` installs.

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

1. **Two layers, two owners.** The recipe owns what every session needs, the same for any binding owner: a `direct-host` Rig profile declaring `ki`, mise, Bun, Node, Codex and Claude Code with exact pins (a minimum for Claude Code) and Linux variants, plus what is not a tool - Git settings, the repository set and `ki bootstrap`, which installs the KI skills. The profile declares no managed resources. Kris's chezmoi source owns the personal layer: personal tools and third-party skills, shell profile, instruction files and helpers. Neither layer writes the other's destinations: the recipe owns `~/.config/rig/rig.toml` and its `[rig]` table, `~/.config/mise/config.toml` and the agent instructions under `~/.claude/`; the personal layer contributes only `conf.d` fragments and files through declared hooks.
2. **Render on the Mac, deliver through setup: Cheztoi.** Cheztoi is the chezmoi source's projection for a host Kris does not own. chezmoi renders an explicit allowlist of host-safe files, and a Rig fragment selecting Kris's personal tools and skills by their existing catalogue identities with Linux variants, into a payload; `setup.sh` already does this for `AGENT_HOST_INSTRUCTIONS` with `chezmoi cat`. The payload contract is person-neutral in the harness ("apply the binding owner's profile payload if one is supplied") and carries a revision, file ownership and permissions, removal of files dropped from the allowlist, and a validation step that checks rendered contents, not only names, for secrets, Mac-only paths and managed resources (Codex Add). Delivery stays pull-on-demand by Kris running `techne host setup`: no second channel and no schedule.
3. **No chezmoi apply on the host.** The source has no OS or hostname gating, resolves 1Password at apply time, re-includes mcporter, Paperclip and LaunchAgents material, and collides with `converge.sh`; the host cannot reach `krisb/dotfiles` anyway. Both reviews agree.
4. **Tools through Rig, staged.** Rig observes the recipe profile first, installs the personal fragment in the pilot, and replaces `converge.sh`'s tool installs once it can install `ki` (decision 2). `mgit` is a clean first personal tool (Bash and Git, one file) but works by discovery only, because its workspace manifests are chezmoi-managed and absent on the host (Fable). `techne` on the host is of little operator use: the instance role reads parameters only, and the Mac holds the bindings and administrator session (hold line 31). The checkout already runs it through `bun run`. A chezmoi binary on the host is not needed while the Mac renders.
5. **Shell.** The stack still creates `techne` with `/bin/bash` and `techne` cannot `chsh`. `converge.sh` already writes `.profile` and `.bashrc`, so a guarded hand-off to `zsh -l` for interactive sessions is possible without root; `--shell /bin/zsh` in the stack is the clean fix but needs a rebuild, which now costs a fresh Tailscale key and device removal (durability report). `env.sh` must also be sourced from zsh's startup files, and login, interactive, non-interactive SSH and Git-hook shells all tested (Codex Add).
6. **Instructions match the host.** The rendered `delegation.md` names `~/bin/claude-bg`, which the host lacks. Either the helper travels with the instructions, or the host gets a variant without detached delegation. Which one is a decision (below), because detached agents outlive the launching session and the hold allows agents "only in sessions Kris opens, with no unattended or scheduled agents" (hold line 28).
7. **The host is not a writing checkout.** Durability Decision 6 makes the Mac the roadmap writing checkout for every Knowledge Islands repository, enforced by a host marker in `ki`. "Usable like Kris's machine" holds inside that bound: the profile must not deliver anything that marks the host as a writing checkout (Fable Add).
8. **Within the exemption.** Rerunnable setup, updates and status on one host, with no new credential and no unattended process, is inside GDR-KI-ARCADIA-004 as now amended. Rig adds neither: it runs only inside setup and status, and the host declares no Rig services or jobs. Whether detached helpers are within it is decision 5.
9. **Recovery.** `techne host status` assesses Git checkout state only. Personal profile and runtime state recover by re-running setup from the Mac; the guide should say so (Codex Add). The guide's references to the retired `techne-agent-host` helper are corrected in the same harness record (Fable Add).

## Agreement and difference

| Point | Reviews | Settlement and evidence |
| --- | --- | --- |
| 1 | Fable Agree; Codex Agree | Kept. Codex adds that dependencies are declared together; folded into model 2. |
| 2 | Fable Agree; Codex Agree | Kept. Where tool pins are declared is decision 2; after owner input it is Rig for both layers, staged, because Rig runs on Linux today and needs only Linux variants and a `ki` install path. |
| 3 | Fable Agree; Codex Differ | Projection kept; UE-020 cannot carry it because it is cancelled (`897993d`). A fresh Cheztoi record is decision 1. |
| 4 | Fable Agree; Codex Agree | Kept. Codex notes a standalone chezmoi binary need not imply source access; not needed while the Mac renders. |
| 5 | Fable Agree; Codex Agree | Kept, with Codex's addition: validate rendered contents and dependencies, not only filenames. |
| 6 | Fable Agree; Codex Agree | Kept. The `claude/` payload in `setup.sh` lines 34-42 generalises to the profile payload. |
| 7 | Fable Agree; Codex Agree | Kept, with Fable's limit: discovery only, `knowledgeislands/` subtree only. |
| 8 | Fable Agree; Codex Differ | Settled for the brief: the instance role reads only the host's parameters (stack lines 171-196) and the hold reserves AWS operation to the binding owner and operator role (line 31). Codex is right that the brief overstated "none the host holds"; corrected above. |
| 9 | Fable Agree; Codex Agree | Baseline half already decided (durability Decision 7). Codex adds the boot-installed Node and unpinned Claude Code to the drift report; adopted, and the drift report becomes `rig status` against the recipe profile. |
| 10 | Fable Differ; Codex Agree | Fable's user-level hand-off is available today (`converge.sh` writes `.bashrc`); the stack change needs a rebuild. Which route the pilot takes is decision 4. |
| 11 | Fable Agree; Codex Differ | Codex is right on oh-my-zsh (guarded, home-relative); the pilot still excludes it on usefulness. Fable's check of the `00_zsh_*` fragments, which likely source Homebrew plugins, is adopted. |
| 12 | Fable Agree; Codex Agree | Both agree instructions must match tools; they differ on the branch - Fable delivers `claude-bg`, Codex a host variant. Decision 5. |
| 13 | Fable Agree; Codex Differ | Setup is within the exemption. Whether a detached helper keeps agents "in sessions Kris opens" is not settled by the evidence; decision 5. |
| 14 | Fable Differ; Codex Differ | Both right: UE-020 is cancelled and pruned. Decision 1. |
| 15 | Fable Agree; Codex Differ | Pilot set kept but sequenced after the durability pilot, which edits the same harness scripts (Fable), and without detached delegation unless decision 5 says otherwise (Codex). |
| - | Fable Add | The host is not a roadmap writing checkout (durability Decision 6). Adopted as model 7. |
| - | Fable Add | The design-loop standard places artefacts in `Streams/Projects/agent-host/design/`; both agent-host loops used `Admin/Governance/Decisions/references/`. Settled: both loops' artefacts have since moved there. |
| - | Fable Add | Operator guide still names the retired `techne-agent-host` helper. Adopted into the harness record. |
| - | Fable Add | Token expiry now 90 days. Out of scope; already decided by the durability loop. |
| - | Codex Add | Payload revision, ownership, permissions, removal, validation and rollback. Adopted as model 2. |
| - | Codex Add | Test every shell entry path, including repository mise environments. Adopted as model 5. |
| - | Codex Add | Codex instructions and login belong in the inventory; the projection is Claude-only today. Adopted into the pilot. |
| - | Codex Add | Profile and runtime state recover by re-running setup, not by Git status. Adopted as model 9. |

## Rollout plan

Records are captured through `ki-next` once Kris decides; none exists yet.

- **`ki-techne-harness`, stage 1** (handed to `TECHNE-TOOLS-OPS-014`, the durability wave-2 record): the pin file is the recipe's Rig fragment declaring the `direct-host` profile with Linux variants; the recipe names it; `converge.sh` installs Rig at a pinned tag; `status.sh` reports drift through `rig status`. `converge.sh`'s installs are unchanged. If OPS-014 has started on another format by then, the stage becomes the first step of the workstation pilot instead.
- **`ki-techne-harness`** (pilot): person-neutral Cheztoi payload hook in `setup.sh` and `converge.sh` with the model 2 contract; `rig apply` for the owner's profile from the delivered fragment; zsh startup sourcing `env.sh` and the shell route from decision 4; personal-tool drift in `status.sh`; operator guide corrections. Sequenced after the durability pilot, which edits `converge.sh`, `status.sh` and the rebuild path, and after stage 1.
- **chezmoi** (pilot, paired): the Cheztoi record - the allowlist and renderer for the host profile (minimal portable zsh fragments `00_xdg_base_dirs`, `00_path`, `00_utils`, `50_mise`, `50_ki`, `99_prompt`, after checking each), the instruction files for Claude and Codex, the delegation branch from decision 5, and a Linux variant for `mgit` in the catalogue rendered into the Cheztoi Rig fragment.
- **`ki-techne-harness`, stage 3** (wave 2): `converge.sh`'s Bun, Node, Codex and `ki` installs replaced by `rig apply --profile direct-host`, with the `ki` install path from decision 3. Trigger: Rig can install `ki`'s signed release, and stage 1's `rig status` has reported clean on the host through at least one pin bump.
- **`tools-techne`** (wave 2): pass the profile through `techne host setup` if the harness hook needs an argument, and show personal-tool drift in `techne host status`.
- **`tools-rig`** (only if decision 3 chooses it): a release-archive install kind with checksum-manifest verification, as a handoff record that `tools-rig` schedules itself.
- **Arcadia**: the Project note link and, if a decision changes, the Decision Record.

The pilot proves the path end to end with `mgit` through Rig, a zsh session and a minimal profile before the allowlist grows.

## Decisions

1. **The Cheztoi record.** - Options: (a) capture a fresh chezmoi record named Cheztoi now, since Kris has already decided early to keep `direct-host` (KI-ARCADIA-GOV-021), which meets UE-020's recapture condition, and Kris has named chezmoi as the main source with Cheztoi its counterpart on hosts Kris does not own; (b) wait for the 2026-11-06 review. Recommendation: (a), keeping the name Cheztoi.
2. **Where tool versions and skills are declared.** - Options: (a) a host-profile manifest in the chezmoi source for personal tools, with the recipe's pins in a plain harness file, as the first report recommended; (b) Rig now in full - the recipe names a `direct-host` Rig profile and `converge.sh`'s tool installs become `rig apply` in the pilot; (c) Rig, staged - the recipe's pin file is a Rig fragment observed by `rig status` first (stage 1, through OPS-014), Kris's personal tools install through a Cheztoi Rig fragment in the pilot, and `converge.sh`'s installs move to `rig apply` at the stage 3 trigger. Recommendation: (c). (a) builds a second tool model beside the one ADR-DOTFILES-008 makes canonical, though Rig already runs on Linux without root. (b) is blocked on `ki`, which Rig cannot yet install, and would put an unproven Linux path under the tools every agent session depends on. (c) keeps the shared tools working while Rig proves itself, and puts Kris's focus on tools and skills from the pilot onwards.
3. **How Rig installs `ki`.** - Options: (a) a harness custom provider, under `rig-provider-v1`, that wraps `ki`'s own signed installer; (b) a release-archive kind in `tools-rig` with checksum-manifest verification, handed to `tools-rig` to schedule; (c) mise's GitHub-release backend. Recommendation: (a). It keeps `ki`'s signature check, needs no `tools-rig` release and lives with the recipe; take (b) if a second archive-shipped tool needs Rig. (c) drops the signature check.
4. **How zsh becomes the login shell.** - Options: (a) a guarded hand-off from `.bashrc` to `zsh -l` now, with `--shell /bin/zsh` folded into the next rebuild that happens for another reason; (b) change the stack and rebuild now. Recommendation: (a). A rebuild costs a fresh Tailscale key and device removal and buys nothing the hand-off does not.
5. **Detached delegation on the host.** - Options: (a) deliver `claude-bg` with the instructions, on the rule that Kris launches detached agents only from a session Kris opened, and they finish or are stopped before that session ends; (b) deliver a host variant of `delegation.md` without detached delegation until the portable `ki-delegation` contract and its `ki` tooling (`KI-HARNESS-GOV-144`) settle supervision and termination; (c) amend the exemption to allow it explicitly. Recommendation: (b). The hold allows agents only in sessions Kris opens (line 28); a helper whose purpose is to outlive the session needs that settled first, and `ki` is already on the host to carry the portable successor.
6. **`techne` and chezmoi binaries on the host.** - Options: (a) neither in the pilot; `techne` runs from its checkout through `bun run`, and Rig is the only new binary; (b) install `techne` by its Linux installer, never with a binding or AWS profile. Recommendation: (a). Its operator commands need the Mac's bindings and administrator session; revisit if a host-side use appears.
7. **The pilot.** - Options: (a) one harness record plus one paired Cheztoi record - payload contract, owner's Rig fragment with `mgit`, zsh route, minimal profile, Claude and Codex instructions - after the durability pilot and stage 1; (b) harness record alone, with the Cheztoi side in wave 2. Recommendation: (a), because the payload contract and the owner's Rig fragment are only proven with a real payload.

## Changes after review

- UE-020 is treated as cancelled, not held; the chezmoi side becomes a fresh record (both reviews).
- The Mac's `ki` version, the host's credential surface, ADR-TECHNE-003's home and the repository set are corrected (Fable, Codex).
- The zsh route gained a no-rebuild option (Fable).
- Detached delegation moved out of the default pilot and into a decision against the hold's session-only bound (Codex).
- The payload contract gained revision, ownership, removal, content validation and rollback; shell-path testing and Codex instructions joined the pilot (Codex).
- The model now states that the host is not a roadmap writing checkout, and the design-folder location became a decision (Fable).
- After owner input (Decision 4): the name Cheztoi is kept for the personal layer on hosts Kris does not own, with chezmoi its main source; the first report's advice to drop it is withdrawn.
- After owner input (Decision 5): the first report's reason for rejecting Rig - that it models only the Mac and installs through Homebrew - did not hold. Rig runs on Linux, installs without root and has non-Homebrew providers; what it lacks is Linux declarations and a `ki` install path. Tool and skill declaration moves to Rig, staged, with the recipe naming a `direct-host` profile; decision 3 on installing `ki` is new.
- The design-folder decision is withdrawn as settled: both agent-host loops' artefacts now sit in `Streams/Projects/agent-host/design/`. The remaining decisions renumber, with the Cheztoi record first and the `ki` install path as the new decision 3.
