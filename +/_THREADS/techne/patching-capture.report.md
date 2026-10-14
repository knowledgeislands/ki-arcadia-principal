# Patching capture report

## Done

- Captured TECHNE-TOOLS-OPS-022 "Agent host OS patching" at `ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-022-agent-host-os-patching.md`. Status is `triage` with no horizon, which is how `ki-next` sets a new capture; it is not `draft`, because adopting a record needs the owner's approval. The audit allows at most four words in a title, so the working title "Patch agent hosts through the recipe" became "Agent host OS patching". The record lists the open questions: the patching model, reboot versus durability and FileVault, reporting, the provider split, privilege, and whether the current host rebuilds now or waits. None of TECHNE-TOOLS-OPS-017, -018 or -021 is a genuine prerequisite, so `blocks` and `blocked_by` stay empty and the record links them in prose.
- Harness commits: 585121a (reserves the number in the issue ledger), then edd5f72 (adds the record).
- Arcadia `+/_CHECKPOINTS/agent-host.md` now records the update attempt and its outcome and the new record's identifier. Open question 5 now asks "rebuild now or wait for the planned rebuild (TECHNE-TOOLS-OPS-017) to take up the pending updates", which is the binding owner's call. `updated_at` is bumped, the decisions log is noted as running to Decision 23, and the headings are unchanged. Commit 80750a7.
- `ki repo audit`: ki-techne-harness PASS=16 WARN=2 FAIL=0. Arcadia PASS=21 WARN=3 FAIL=0. All of these warnings were already there: the inline KI_VERSION in CI, no committed pre-commit gate, and, in Arcadia only, the close-out note for island-model-and-tending.

## Failed

- I did not run `git pull --ff-only`. The run rules forbid any Git fetch or remote call. Both checkouts were clean, and the commits are local only.

## Needs the owner

- Decide whether to rebuild the host now or wait for the planned rebuild (TECHNE-TOOLS-OPS-017) to take up the pending updates.
- Push both repositories when ready. In Arcadia, the untracked `+/_CHECKPOINTS/territory-rollout.md` comes from another session; I left it alone.
