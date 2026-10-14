# close-ki report - 2026-10-09

## Done

- **Accepted:** KI-HARNESS-GOV-165, KI-HARNESS-GOV-166 (`df30541e`) and KI-ARCADIA-GOV-032 (`533267b`). I searched every Git checkout under `~/workspaces` plus the chezmoi source for the old GDR-KI-ARCADIA-007 and -008 references. Nothing cited GDR-KI-ARCADIA-008, and every GDR-KI-ARCADIA-007 citation already meant Governing Technology Investigations. The only stale reference left was a dangling wikilink in KI-ARCADIA-GOV-032's own Context, which is now plain text.
- **Merged:**
  - BREW-013 into [KI-HARNESS-GOV-168](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-168-roll-out-ki-pin-receivers.md). GOV-168 now covers the `.github/tool-release-consumers.json` registration trades, the replay and the release-event verification, and notes that the harness is provisioned and can register first. BREW-013 was cancelled as merged (`c694086d`, `d625b71`).
  - KI-HARNESS-GOV-159 and -160 into [KI-HARNESS-GOV-158](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-158-enforce-the-commit-gate.md), retitled "Enforce the commit gate" with three stages: content criteria, receiver trades, then raising the levels.
  - KI-HARNESS-GOV-157 into [KI-TOOL-CLI-115](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-ki/docs/roadmap/KI-TOOL-CLI-115-enforce-roadmap-writing-checkout.md), retitled "Enforce roadmap writing checkout", because `ki` owns the enforcing behaviour. CLI-115 links GOV-157 at a pinned commit, and the harness keeps the `ki-work-roadmap` standard text, which reaches it through a trade (`291fab9`).
- **Cancelled:** KI-HARNESS-GOV-162 and KI-SPEC-RGV-001, both as rejected (`3b9bbeb`). Each is now a one-line idea under Notes in [paperclip-bootstrap-and-recovery](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/paperclip-bootstrap-and-recovery.md) and [specification-review](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/specification-review.md) (`04c37e3`).
- **Pruned (one prune-only commit per repository):**
  - ki-agentic-harness: 7 records (`7bcb3070`)
  - ki-arcadia-principal: KI-ARCADIA-GOV-028, -032 and -033 (`975f492`)
  - tools-ki: KI-TOOL-CLI-114 (`12b9ebc`)
  - tools-mgit: MGIT-CLI-015 (`84bccae`)
  - homebrew-tap: BREW-013 (`fb1f068`)
  - ki-specifications: KI-SPEC-RGV-001 (`e51f322`)
  - Before pruning, links in Arcadia that would have broken now point at pinned copies or plain text (`7516106`). These were in the Techne Programme Hold policy, the knowledge-islands-model design note and three checkpoints.
- **Pushed:** all of the above, fast-forward only, on top of prep-threads' pushed Arcadia commits.
- **Checks:** the roadmap audit passes in every repository I touched, and the authoring audit passes where I ran it. Arcadia's Streams audit passes with two STREAM-10 close-out warnings: island-model-and-tending was already warning, and ways-of-working is the other thread's new Project. The homebrew-tap tests pass (11 and 7 runs). The full tap audit in the worktree failed only on RUNTIMES-2, which comes from auditing an unregistered worktree, plus the existing HOOK-1 warning.
- **Open records before → after:**

| Repository | Before | After |
| --- | --- | --- |
| ki-agentic-harness | 12 | 6 |
| ki-arcadia-principal | 7 | 6 |
| tools-ki | 1 | 1 |
| tools-mgit | 0 | 0 |
| homebrew-tap | 1 | 0 |
| ki-specifications | 1 | 0 |
| ki-website | 3 | 3 (no changes) |

## Failed

- [KI-ARCADIA-GOV-030](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-GOV-030-refresh-the-release-app-note.md) is not closed. The GitHub Apps note has the Rig-vault key location and the harness installation, but its Verification subsection still says full end-to-end proof awaits `BREW-010`. It also still has no pointer to the tap's `docs/guides/maintainer/release-app-operations.md`. Those are exactly the two things the record asks for, so it stays open.

## Needs Kris

- **KI-ARCADIA-GOV-030:** approve a small edit to the GitHub Apps note, made through the Enactment Process. It would replace the `BREW-010` sentence with the 2026-10-07 proof (tap PRs #23 to #29 and website PRs #24 to #28) and add the tap-guide pointer. After that the record can close.
- **Arcadia primary checkout:** the checkout still holds prep-threads' pre-rebase commits `da093f5` and `a9e502d`, which were pushed as `5238a43` and `60e8a65`. It needs a reset to origin/main from that thread, not from me.
