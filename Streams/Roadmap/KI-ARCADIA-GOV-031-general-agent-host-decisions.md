---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-031
area: GOV
title: General agent-host decisions
kind: deliver
purpose: governance
project: agent-host
component: governance
horizon: now
status: awaiting-review
blocks: []
blocked_by: []
baseline_ref: ee0059f8f99c9338c7c646d2fe9acc9944e57a38
created_at: 2026-10-08T08:43:00Z
updated_at: 2026-10-08T12:58:48Z
---

# General Agent-Host Decisions

## Goal

The two agent-host Decision Records read as a general `direct-host` design: person-neutral and target-neutral, covering a cloud instance or an owned machine, Linux or macOS, under any binding owner, with Kris's own choices named only as examples.

## Context

On 2026-10-08 Kris set the direction for the agent-host recipe: "the idea of an agent host recipe is that it can feel like it's running locally, but running on another machine. In this case it's a hosted instance, but it could also be in the future something like my Mac Studio. Also, of course, this is a general project. It's not my specific setup project". A read-only generic review then found that [[ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host|ODR-KI-ARCADIA-001]] and [[ADR-KI-ARCADIA-003-the-agent-host-workstation-model|ADR-KI-ARCADIA-003]] assume Kris's Mac as the operator's machine, a cloud disk, chezmoi and zsh, and proposed changes P4 to P7 to the records.

Kris approved them the same day: "yes, all recommended, but zsh please, not bash". So the interactive shell is a per-binding choice whose recipe default is zsh, rather than the review's proposed default of bash.

## Boundary

- In scope: in-place amendments to ODR-KI-ARCADIA-001 (P4, and the P7 consequence) and ADR-KI-ARCADIA-003 (P5, P6, and the P7 recipe layer).
- Also in scope (added 2026-10-08 under Decision 12): removing "the review date" from ODR-KI-ARCADIA-001's Expiries bullet, which Decision 6 of the Techne run had already removed from the exemption.
- Out of scope: GDR-KI-ARCADIA-004, whose exemption stays specific to the one host (P13 is noted, not decided); the harness and chezmoi records, which their own repositories reshape; P8 to P12; any code or remote action.

## Current state

Delivered and awaiting Kris's review.

## Steps

- [x] P4: in ODR-KI-ARCADIA-001, define the operator's workstation and use it wherever "the Mac" stood; state rebuild and withdraw by intent, with the stack, parameter, EBS and administrator-session details in sentences for the AWS provider; recast the premise as a host whose disk may be discarded.
- [x] P5: in ADR-KI-ARCADIA-003, restate the premises as cases (a host the owner may not own or administer), replace "no chezmoi on the host" with no personal-configuration tool on the host, move chezmoi, Cheztoi and `mgit` into examples, and make the Rig profile, personal-tool variants and payload validation target-OS-aware.
- [x] P6: make the shell a per-binding choice through an optional binding field `shell`, with zsh as the recipe default; the recipe installs it, keeps the host environment sourceable from any shell and owns the hand-off; the provider's login-shell change reads the binding.
- [x] P7: the recipe renders host instructions for Claude and Codex carrying the two-checkout and writing-checkout rules; the binding owner's personal source adds only its own wording (ODR-KI-ARCADIA-001 consequence and ADR-KI-ARCADIA-003 recipe layer).
- [x] Fold-in: remove "the review date" from ODR-KI-ARCADIA-001's Expiries bullet.
- [x] Run the verification below and write the review packet.

## Files touched

- `Admin/Governance/Decisions/ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host.md`
- `Admin/Governance/Decisions/ADR-KI-ARCADIA-003-the-agent-host-workstation-model.md`
- This record

## Verify

- `ki repo audit --repo .` passes.
- Neither record says "the Mac" or requires chezmoi, Cheztoi, `mgit` or zsh except as an example or default; AWS terms appear only in sentences for the AWS provider; no added line contains an en-dash or em-dash.

## Dependencies / blocks

None. The paired reshaping is in `ki-techne-harness` (TECHNE-TOOLS-OPS-014, TECHNE-TOOLS-OPS-015, TECHNE-TOOLS-OPS-017 and a new person-neutral defaults record) and the chezmoi source (DOTFILES-UE-072 and DOTFILES-UE-073); neither blocks this record or is blocked by it.

## Documentation impact

### Decision Records

ODR-KI-ARCADIA-001 and ADR-KI-ARCADIA-003 are amended in place. Titles are unchanged, so the Decisions index is unchanged.

### Specifications

None.

### Guides

None here; the `ki-techne-harness` operator guide is outside this record (P10 is undecided).

### Roadmap

None beyond the paired records named under Dependencies.

## Review

### Delivered

The approved P4 to P7 amendments, applied in place to the two records, with the shell default changed to zsh as Kris directed, plus the review-date fold-in Kris approved in Decision 12. Baseline `ee0059f8f99c9338c7c646d2fe9acc9944e57a38`; the result is this record's commit.

### Change Summary

- ODR-KI-ARCADIA-001: the premise covers any `direct-host` host whose disk may be discarded, a replaced cloud instance or a reset owned machine. The Decision defines the operator's workstation as the machine the binding owner works from and uses it for the bundle copy, the writing checkout, pin comparison and material moved off the host. Rebuild keeps reusable credentials and withdraw removes the binding's footprint and credentials, with the stack and parameter details stated for the AWS provider; the snapshot exclusion and credentials follow the same pattern. The two-checkout rule is rendered by the recipe for both runtimes, and the consequence moves it from the operator's chezmoi source to the recipe.
- Fold-in (Decision 12): ODR-KI-ARCADIA-001's Expiries bullet now lists the GitHub token, the Tailscale key and pin drift; "the review date" is removed.
- ADR-KI-ARCADIA-003: the Context states the general case (any owner, cloud or owned, Linux or macOS) and the hardest case the model holds for, with the current host as one instance. The recipe layer has a variant per target OS and owns the host-instructions file. The personal layer is the owner's personal-configuration source projected as the payload on the operator's workstation, with Cheztoi as Kris's example. Payload validation rejects paths invalid on the target OS. "No chezmoi on the host" becomes no personal-configuration tool on the host. The pilot installs one personal tool first, `mgit` for Kris. The shell is a per-binding choice with zsh as the recipe default. The consequences follow.

### Verification

- `ki repo audit --repo .` on 2026-10-08: PASS=23 WARN=1 FAIL=0. The one warning, HOOK-1 (no committed `.githooks/pre-commit`), predates this record.
- The two records name Kris, chezmoi, Cheztoi and `mgit` only in example clauses, say "the Mac" nowhere, and confine stack, parameter, EBS and the Techne account to AWS-provider sentences. No added line contains an en-dash or em-dash.

### Outstanding concerns

- Resolved: ODR-KI-ARCADIA-001's Expiries bullet listed "the review date", which Decision 6 of the Techne run removed from the exemption. Kris approved folding the fix into this record (Decision 12), and it is applied.
- A host outside GDR-KI-ARCADIA-004, such as an owned Mac Studio or another person's host, still needs its own governance decision before agents run on it (P13).

### Post-change review

The goal is met: both records read as the general design, with Kris's setup as the worked example. Substance is unchanged except where Kris decided it: the shell becomes a binding choice and the safety rules move into the recipe. This is the implementing agent's own check, not an independent review.

### Mini recap

GOV-031 generalises the agent-host durability and workstation decisions so they hold for any binding owner and any host, with zsh as the default shell. Learning route: none beyond the outstanding concerns above.

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
