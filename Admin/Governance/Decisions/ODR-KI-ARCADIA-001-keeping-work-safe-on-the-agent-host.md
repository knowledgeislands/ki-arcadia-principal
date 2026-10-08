---
note_type: admin/governance/decision
id: ODR-KI-ARCADIA-001
title: 'Keeping work safe on the agent host'
date: 2026-10-07
status: current
decision_type_url: https://knowledgeislands.info/specifications/decision-records/odr
decision_type: operations
decision_depends_on: ['GDR-KI-ARCADIA-004', 'GDR-KI-ARCADIA-005']
---

# ODR-KI-ARCADIA-001: Keeping work safe on the agent host

## Context

[[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] exempts one agent host, `ki-techne-agent-host`, from the Techne Programme Hold, and treats its disk as disposable: the host can be stopped at any time and rebuilt or withdrawn. Agent work on the host lives in Git checkouts, so a stop, rebuild or withdrawal can discard commits that no remote holds unless the host's status, operations and tooling guard against it.

## Decision

The agent host keeps work safe through the following durability model.

- **Safe work.** Work counts as safe only once it is in Git on a remote, on any branch. The repositories the host's workspace declares are protected; Claude Code and Codex sign-ins and transcripts, caches, hand-made backups and any checkout outside the declared set are disposable by rule. Inventory fails closed: a missing workspace, an absent or unexpected repository, unreadable Git state or a discovery error is `unknown`, not clean.
- **Status contract.** The harness status script produces one versioned structured report with an outcome of `clean`, `at-risk` or `unknown` and a distinct exit status for each, tolerates a failure in one repository, and offers a read-only `--fetch`. The CLI consumes that report rather than parsing text.
- **Stop.** Stop reads the status with a short timeout, warns about any repository at risk or unknown, and never refuses; `--now` skips the read. The kill switch stays available.
- **Rebuild and withdraw.** These are two named operations in the harness and the CLI, both through the recipe's destroy path. Rebuild replaces the stack and keeps the GitHub token; withdraw removes the stack and every parameter, then lists the manual footprint. Both refuse unless the status is clean, with two overrides: one naming exactly the repositories at risk, and one for an unreadable host with typed confirmation. Both check that the host read is the host to be deleted, and both are idempotent. Agents implement and test them offline; the binding owner runs every live rebuild and withdrawal.
- **Recovery routes.** Push first, then a verified `git bundle` copied to the Mac. No EBS snapshot is a recovery route; that is revisited only if the host becomes unreadable with work on it.
- **Credentials.** Building, rebuilding and tearing down the host use the binding owner's administrator session in the Techne account; day-to-day operation uses the host's account-local operator role, as GDR-KI-ARCADIA-004 states.
- **Roadmap writing checkout.** For every Knowledge Islands repository the Mac checkout is the designated roadmap writing checkout. The host carries a marker that `ki` honours by refusing roadmap writes there; host sessions report the roadmap changes they need. A design in which the remote's `main` is the single history needs its own approval and a change to GDR-KI-ARCADIA-004.
- **Two checkouts.** Push where you worked; before working on the other machine, fetch, check status and be level. The rule is machine-neutral and reaches both Claude and Codex on the host.
- **Pins.** One harness file declares the host's exact tool versions, bumped by ordinary commits, with drift reported against the pins and, from the Mac, against the Mac's versions.
- **Expiries.** A cached expiry file covering the GitHub token, the Tailscale key, the review date and pin drift feeds a login banner and a status warning within 14 days of any expiry. The GitHub token is issued with a 90-day expiry.
- **Rollout.** One `ki-techne-harness` pilot (the status contract, the stop warning, and rebuild and withdraw with their guards) is delivered before a wave. The CLI follows first in that wave, then pins, expiries and the host marker.

## Consequences

- `ki-techne-harness` owns the status contract, guards, operations, pins and expiries, and its operator guide states the protection boundary, the sequences and the 90-day token expiry. `tools-techne` follows the harness contract, as [[ADR-TECHNE-003-techne-implementation-ownership|ADR-TECHNE-003]] requires.
- `tools-ki` gains the host-marker refusal, the operator's chezmoi source carries the two-checkout rule for both runtimes, and `ki-agentic-harness` decides where a writing-checkout designation lives. Each is recorded in its owning repository.
- Work at risk on the host blocks a rebuild or withdrawal unless the owner discards it by name, so withdrawing the exemption cannot silently lose work.
- Material outside Git on the host is lost on rebuild unless moved into a repository or onto the Mac first.

## References

- [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] - the exemption whose bounds this operates within.
- [[GDR-KI-ARCADIA-005-the-roadmap-model|GDR-KI-ARCADIA-005]] - the roadmap model the writing-checkout rule serves.
- [[ADR-TECHNE-003-techne-implementation-ownership|ADR-TECHNE-003]] - the harness and CLI ownership split.
