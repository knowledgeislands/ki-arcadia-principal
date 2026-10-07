---
note_type: streams/initiative
slug: rig
title: Rig
direction: Keep the workstation every agent and person runs on accurate, tidy and observable.
lifecycle: active
lead: Kris Brown
updated: 2026-10-07T14:05:00Z
author: Written with Claude
---

# Rig

## Direction

The workstation every agent and person runs on: chezmoi-managed configuration, local services, secrets hygiene and agent state. Agent hosting off the workstation belongs to [[Initiatives/techne|Techne]], and the shared toolchain to [[platform-foundations|Platform foundations]].

---

## Projects

None at present.

---

## Upkeep

Workstation hygiene is projectless: it keeps the host accurate, tidy and observable, and is never finished. Its records live in the chezmoi roadmap, which is not a `knowledgeislands` repository, so they are named by ID only.

- `DOTFILES-UE-027` (chezmoi) - Honest Rig rationales
- `DOTFILES-UE-028` (chezmoi) - Tidy retired software remnants
- `DOTFILES-UE-043` (chezmoi) - Audit 1Password secret hygiene
- `DOTFILES-UE-056` (chezmoi) - Review host Claude cleanup
- `DOTFILES-UE-062` (chezmoi) - Measure the live apply
- `DOTFILES-UE-063` (chezmoi) - Bind qmd search daemon
- `DOTFILES-UE-065` (chezmoi) - Diagnose same-boot mcporter stall

---

## Activities

The chezmoi housekeeping templates name this Initiative: `DOTFILES-HK-001` (review unmanaged and ignored files), `DOTFILES-HK-002` (reconcile sources after tooling changes) and `DOTFILES-HK-003` (review workstation software).

---

## Review

**2026-10-07.** Not yet judged for health: workstation hygiene had no checkpoint of its own, only its place in the state-of-play review. Its records are small and independent of one another. The open question there was whether to trace the mcporter bridge live.

Decisions needed: approve a bounded, sanitised live trace of the mcporter bridge, without a restart, for `DOTFILES-UE-065`.

Next step: run the chezmoi housekeeping templates as they fall due.
