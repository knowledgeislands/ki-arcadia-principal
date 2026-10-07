# Keeping work safe on the agent host: decisions

**Owner:** Kris Brown - **Report:** [agent-host-durability-report.md](agent-host-durability-report.md) - **Date:** 2026-10-07

These are the owner's own words, numbered against the report's decisions. Where they differ from the report, they win. Kris answered the report as a whole:

> Durability decisions - all agreed with the following changes/notes: - The GDR's credential wording - don't mention me directly, what should be the right approach here?

Kris then chose the coordinator's role-based wording for decision 5. Every other decision is agreed as the report recommends.

## Decisions

1. **What counts as safe work.** All agreed: (a). Only what is in Git on a remote is safe, the declared repositories are protected, and a named list is disposable by rule.
2. **Stop and teardown.** All agreed: (a). Stop warns with a timeout and `--now` and never refuses; teardown fails closed with two overrides, one naming the repositories at risk and one for an unreadable host with typed confirmation.
3. **EBS snapshot as a recovery route.** All agreed: (b). No snapshot for now; Git push or a verified bundle copied to the Mac only. Revisit if a host ever becomes unreadable with work on it.
4. **Rebuild and withdraw.** All agreed: (a). Two named operations in the harness and the CLI, both through the recipe's destroy path under the administrator profile, with `techne host teardown` replaced.
5. **The GDR's credential wording.** "The GDR's credential wording - don't mention me directly, what should be the right approach here?" Kris chose this role-based wording: building, rebuilding and tearing down the host use the binding owner's administrator session in the Techne account; day-to-day operation (start, stop, status) uses the host's account-local operator role; no agent holds AWS credentials of its own. The amendment goes through an Enactment record.
6. **The roadmap writing checkout.** All agreed: (a). The Mac checkout is the writing checkout for every Knowledge Islands repository, declared once in the Decision Record and enforced by a host marker in `ki`, with a harness handoff on where designations live. A remote-`main` history is only a later, separately approved design.
7. **How the host's pins stay current.** All agreed: (a). Declared exact pins in one harness file, bumped by commits, with drift reported against the pins and the Mac; `ki` is bumped in the pilot or the first wave-2 record.
8. **The pilot's scope.** All agreed: (a). One harness record (status contract, guards, rebuild and withdraw), with the CLI first in wave 2. The report's "landed before Kris's rebuild" is overtaken: the rebuild happened on 2026-10-07 as a stack-only delete that kept the GitHub token, and workspace setup re-converged. The pilot proceeds as the first record without that timing, and a later rebuild or withdrawal is its live test.

## Related decisions

These answer the report's Needs Kris items and settle the scheduled review.

- **Credential identity (GDR-KI-ARCADIA-004's condition).** Kris chose "Mine, for now": the host's GitHub token and Claude login are Kris's own identities, because only Kris opens sessions there. A machine identity is revisited when unattended agents arrive, which stay held.
- **KI-ARCADIA-GOV-021.** Kris chose "Decide 'keep' now": `direct-host` stays as a recipe, the review is decided early as keep, and no evidence pack is needed.
- **GitHub token expiry.** The GitHub token is rotated with a 90-day expiry, and the operator guide's 30-day guidance changes to 90 days.

## Authority

- **Grant:** as recorded in the coordinator's decisions log for this run: "write the durability decisions file and its Decision Record, amend GDR-KI-ARCADIA-004 through an Enactment record (role-based wording, identity decision, GOV-021 keep), record the keep on KI-ARCADIA-GOV-021 and take it to awaiting-review, update the agent-host Project note, capture the rollout records through `ki-next` and select the pilot. Commit locally in Arcadia; do not push (Arcadia main carries another session's unpushed commits). No acceptance or pruning: Kris approves those separately."
- **Completion target:** awaiting-review.
- **Push scope:** none.
- **Prune scope:** none.
