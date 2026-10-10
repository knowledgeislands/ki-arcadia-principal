---
note_type: admin/governance/decision
id: ODR-KI-ARCADIA-001
title: 'Keeping work safe on the agent host'
date: 2026-10-07
updated: 2026-10-10
status: current
decision_type_url: https://knowledgeislands.info/specifications/decision-records/odr
decision_type: operations
decision_depends_on: ['GDR-KI-ARCADIA-004', 'GDR-KI-ARCADIA-005']
---

# ODR-KI-ARCADIA-001: Keeping work safe on the agent host

## Context

[[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] exempts one agent host, `ki-techne-agent-host`, from the Techne Programme Hold, and treats it as a host whose disk may be discarded: the host can be stopped at any time and rebuilt or withdrawn. That premise covers any host of the `direct-host` recipe, whether a cloud instance that is replaced or an owned machine that is reset. Agent work on the host lives in Git checkouts, so a stop, rebuild or withdrawal can discard commits that no remote holds unless the host's status, operations and tooling guard against it.

## Decision

The agent host keeps work safe through the following durability model. The operator's workstation is the machine the binding owner works from.

- **Safe work.** Work counts as safe only once it is in Git on a remote, on any branch. The repositories the host's workspace declares are protected; Claude Code and Codex sign-ins and transcripts, caches, hand-made backups and any checkout outside the declared set are disposable by rule. Inventory fails closed: a missing workspace, an absent or unexpected repository, unreadable Git state or a discovery error is `unknown`, not clean.
- **Status contract.** The harness status script produces one versioned structured report with an outcome of `clean`, `at-risk` or `unknown` and a distinct exit status for each, tolerates a failure in one repository, and offers a read-only `--fetch`. The CLI consumes that report rather than parsing text.
- **Stop.** Stop reads the status with a short timeout, warns about any repository at risk or unknown, and never refuses; `--now` skips the read. The kill switch stays available.
- **Rebuild and withdraw.** These are two named operations in the harness and the CLI, both through the recipe's destroy path. Rebuild replaces the host, keeping reusable credentials; withdraw removes the binding's footprint and credentials, then lists the manual footprint. For the AWS provider, rebuild replaces the stack and keeps the GitHub token parameter, and withdraw removes the stack and every parameter. Both refuse unless the status is clean, with two overrides: one naming exactly the repositories at risk, and one for an unreadable host with typed confirmation. Both check that the host read is the host to be deleted, and both are idempotent. Agents implement and test them offline; the binding owner runs every live rebuild and withdrawal.
- **Recovery routes.** Push first, then a verified `git bundle` copied to the operator's workstation. No provider disk snapshot, such as an EBS snapshot for the AWS provider, is a recovery route; that is revisited only if the host becomes unreadable with work on it.
- **Credentials.** Building, rebuilding, tearing down and operating the host use the provider access that [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] grants.
- **Roadmap writing checkout.** For every Knowledge Islands repository the checkout on the operator's workstation is the designated roadmap writing checkout. The host carries a marker that `ki` honours by refusing roadmap writes there; host sessions report the roadmap changes they need. A design in which the remote's `main` is the single history needs its own approval and a change to GDR-KI-ARCADIA-004.
- **Two checkouts.** Push where you worked; before working on the other machine, fetch, check status and be level. The rule is machine-neutral; the recipe itself renders it, with the writing-checkout rule, into host instructions for both Claude and Codex.
- **Pins.** One harness file declares the host's exact tool versions, bumped by ordinary commits, with drift reported against the pins and, from the operator's workstation, against its versions.
- **Expiries.** A cached expiry file covering the GitHub token, the Tailscale key and pin drift feeds a login banner and a status warning within 14 days of any expiry. The GitHub token is issued with a 90-day expiry.

## Consequences

- `ki-techne-harness` owns the status contract, guards, operations, pins and expiries, and its operator guide states the protection boundary, the sequences and the 90-day token expiry. `tools-techne` follows the harness contract, as [[ADR-KI-ARCADIA-006-techne-implementation-ownership|ADR-KI-ARCADIA-006]] requires.
- `tools-ki` gains the host-marker refusal, the `direct-host` recipe carries the two-checkout and writing-checkout rules for both runtimes, with the binding owner's personal source adding only its own wording, and `ki-agentic-harness` decides where a writing-checkout designation lives. Each is recorded in its owning repository.
- Work at risk on the host blocks a rebuild or withdrawal unless the owner discards it by name, so withdrawing the exemption cannot silently lose work.
- Material outside Git on the host is lost on rebuild unless moved into a repository or onto the operator's workstation first.

## References

- [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] - the exemption whose bounds this operates within.
- [[GDR-KI-ARCADIA-005-the-roadmap-model|GDR-KI-ARCADIA-005]] - the roadmap model the writing-checkout rule serves.
- [[ADR-KI-ARCADIA-006-techne-implementation-ownership|ADR-KI-ARCADIA-006]] - the harness and CLI ownership split.
