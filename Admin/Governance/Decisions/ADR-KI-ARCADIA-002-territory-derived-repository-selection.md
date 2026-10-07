---
note_type: admin/governance/decision
id: ADR-KI-ARCADIA-002
title: Territory-derived repository selection
date: 2026-10-07
status: current
decision_type: architecture
decision_type_url: https://knowledgeislands.info/specifications/decision-records/adr
---

# ADR-KI-ARCADIA-002: Territory-derived repository selection

## Context

The registered Agora rosters duplicate their Capitals' territorial membership. KI and mgit both select repository sets, while the registry resolves physical checkouts and Paperclip coordinates admitted work. The [[territory-selection-brief]], independent [[territory-selection-review-astra|Astra review]] and [[territory-selection-review-sol|Sol review]], and [[territory-selection-report]] examine these boundaries.

## Decision

Adopt the model in [[territory-selection-report]] as amended by [[territory-selection-decisions|Kris's decisions]]. The owner's words take precedence.

- Derive selection from the Capital's `territory_members`. Retire Agora membership declarations, CLI grammar and runtime selection after their consumers pass the serial pilot.
- Use `-t, --territory` and `--estate` as mutually exclusive explicit scopes in KI and mgit. An explicit repository selection cannot be combined with either scope. Preserve each tool's default selection when no explicit scope is supplied.
- Match repeated `-f, --filter` values against repository directory-name prefixes, literally and case-sensitively, with OR semantics before worktree expansion. Reject empty prefixes. A filter narrows the selected scope and never widens it.
- Declare an optional `territory_prefix` in the Capital's `[skills.ki-repo]` table. Use it as the short territory handle, aligned with the main harness prefix where one exists. Arcadia declares `ki`; retain `KIS` as its Paperclip organisation code. A Capital without a short prefix is named by its registry key. Canonical identity and local registry keys retain their separate resolution roles.
- Validate scope and naming metadata before filtering; validate selected physical roots afterwards. Missing registration, ambiguity, invalid declarations, unavailable selected roots and empty operational selections fail before execution. A known excluded root need not be physically available.
- Resolve the complete ordered result before emitting machine roots. Use NUL-delimited roots for mgit, diagnostics on stderr, and a buffered caller that validates every root before Git actions.
- Cut over without Agora aliases, legacy filter globs or syntax guessing. Saved territory locations refresh current membership explicitly; ordinary saved snapshots remain usable without KI and failed refreshes preserve them. Historic identifiers remain provenance.
- Keep territorial jurisdiction, repository acceptance and Paperclip admission separate. Resolve shared-report ownership through the admitted company binding and an explicit owning repository.
- Deliver the shared contract, KI pilot, mgit pilot and real read-only reconciliation serially. The owner permits push, prune and release for the verified rollout and says, "You don't even need to create the project tbh." Create no Project or speculative backlog. Pruning selects only eligible terminal records of this rollout; delivery acceptance remains a review of its evidence.

## Consequences

Territory membership has one authoritative roster. KI and mgit share selector semantics while keeping their command eligibility, native defaults and runtime requirements. mgit's local Git operation remains standalone Bash and Git.

Current executable consumers move to territories before Agora declarations disappear. Users replace old Agora flags and saved location specifications at the cut-over; historic acquisition and context identifiers do not become aliases. Territory identity and selection belong to this rollout, while trade routes and the trade hold stay in the separate trade scope.
