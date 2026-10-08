---
note_type: admin/governance/decision
id: ADR-KI-ARCADIA-003
title: 'The agent host workstation model'
date: 2026-10-08
status: current
decision_type_url: https://knowledgeislands.info/specifications/decision-records/adr
decision_type: architecture
decision_depends_on: ['GDR-KI-ARCADIA-004', 'ODR-KI-ARCADIA-001']
---

# ADR-KI-ARCADIA-003: The agent host workstation model

## Context

[[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] exempts one agent host, `ki-techne-agent-host`, from the Techne Programme Hold, and [[ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host|ODR-KI-ARCADIA-001]] keeps work on it safe. The host's binding owner opens sessions there, so the host must work like the owner's own machine: the same tools, skills, shell and working rules. The host is not owned by the binding owner, has no root access for the `techne` user, cannot reach the owner's private chezmoi source and must stay inside the exemption's bounds: no new credential and no unattended process.

The binding owner's chezmoi source already carries the personal configuration, and its Rig catalogue already declares the owner's tools, though only for macOS. Rig runs on Linux without root and has non-Homebrew providers, but it has no install path for `ki`'s signed release archives and no proof on a real Linux host. The `direct-host` recipe's `converge.sh` installs the shared tools itself.

## Decision

The agent host becomes the binding owner's working machine through two layers with two owners, delivered through the existing setup path.

- **Recipe layer.** The `direct-host` recipe in `ki-techne-harness` owns what every session needs, the same for any binding owner: a `direct-host` Rig profile declaring `ki`, mise, Bun, Node, Codex and Claude Code with exact pins (a minimum for Claude Code) and Linux variants, plus what is not a tool - Git settings, the repository set and `ki bootstrap`, which installs the KI skills. The profile declares no managed resources. The recipe owns `~/.config/rig/rig.toml` and its `[rig]` table, `~/.config/mise/config.toml` and the agent instructions under `~/.claude/`.
- **Personal layer: Cheztoi.** The binding owner's chezmoi source is the main source of the personal layer. Cheztoi is its projection for a host the owner does not own: on the Mac, chezmoi renders an explicit allowlist of host-safe files and a Rig fragment selecting the owner's personal tools and skills by their catalogue identities with Linux variants. The personal layer contributes only Rig `conf.d` fragments and files through declared hooks, never the recipe's destinations.
- **Payload contract.** The harness applies the binding owner's profile payload if one is supplied, without naming any person. The payload carries a revision, file ownership and permissions, removal of files dropped from the allowlist, and validation of rendered contents for secrets, Mac-only paths and managed resources. Delivery is pull-on-demand through `techne host setup`; there is no second channel and no schedule.
- **No chezmoi on the host.** chezmoi is never applied on the host and neither the `chezmoi` nor the `techne` binary is installed there; `techne` runs from its checkout through `bun run`. Rig is the only new binary.
- **Rig, staged.** Stage 1: the recipe's pin file is a Rig fragment declaring the `direct-host` profile, `converge.sh` installs Rig at a pinned tag, and `status.sh` reports drift through `rig status`, with `converge.sh`'s installs unchanged. Pilot: the owner's personal tools install through the Cheztoi Rig fragment by `rig apply`, `mgit` first. Stage 3: `converge.sh`'s Bun, Node, Codex and `ki` installs move to `rig apply --profile direct-host` only once Rig can install `ki`'s signed release and stage 1's `rig status` has reported clean on the host through at least one pin bump. `converge.sh` keeps bootstrapping Rig and mise.
- **Installing `ki`.** A harness custom provider under `rig-provider-v1` wraps `ki`'s own signed installer, keeping its signature check. A release-archive kind in `tools-rig` is taken up only if a second archive-shipped tool needs Rig.
- **Shell.** zsh becomes the interactive shell through a guarded hand-off from `.bashrc` to `zsh -l`, with zsh's startup files sourcing the host environment and every shell entry path tested. The stack sets `--shell /bin/zsh` at the next rebuild that happens for another reason; no rebuild is made for it.
- **Delegation.** The host receives a variant of the delegation instructions without detached agents until `KI-HARNESS-GOV-144` settles supervision and termination of detached runs, because the exemption allows agents only in sessions the binding owner opens.
- **Not a writing checkout.** Nothing in either layer marks the host as a roadmap writing checkout, adds a credential or starts an unattended process.
- **Rollout.** One harness record and one paired Cheztoi record form the pilot, delivered after the durability pilot and stage 1, before any wider wave.

## Consequences

- `ki-techne-harness` owns the stage 1 change within its pins record, the payload hook, the shell hand-off, personal-tool drift in status, the `ki` provider and the stage 3 move, each recorded in its roadmap.
- The binding owner's chezmoi source owns the Cheztoi allowlist, renderer, host instruction variants and the Linux variants of the personal tools it selects.
- Rig is proven on a real Linux host by stage 1 before any shared tool depends on it; the shared tools keep working throughout.
- A binding owner without a personal payload still gets a complete host from the recipe alone.
- Personal profile and runtime state on the host are recovered by re-running setup from the Mac; `techne host status` assesses Git state only.
- Detached delegation on the host, and the stack's shell change, each wait on a named later event rather than a date.
- The binding owner's grant covers capturing the rollout records in their owning repositories, folding stage 1 into the harness pins record and selecting the pilot; it grants no acceptance or pruning.

## References

- [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] - the exemption whose bounds the host's profile stays within.
- [[ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host|ODR-KI-ARCADIA-001]] - the durability model whose pins and writing-checkout rule this builds on.
- [[ADR-TECHNE-003-techne-implementation-ownership|ADR-TECHNE-003]] - the recipe, binding and provider ownership split.
