# Adopt Arcadia - report

Pushed to origin/main as a fast-forward (ec94749..f22cd71): 4995cbd, 703bb2a, 51b6599, 377a983, f22cd71.

Checks: `ki repo audit --skill ki-decision-records` PASS (29/29). Running the full `ki repo audit` in the worktree added no findings to the pre-change baseline. Its remaining FAILs (RUNTIMES-2, REPO-REG-1) happen because the worktree is not registered. Its WARNs (CI-1, HOOK-1, STREAM-10) were already there. The primary checkout's one FAIL (STREAM-9) comes from your uncommitted `Streams/Projects/mac-studio-bootstrap.md`.

## Done

- [KI-ARCADIA-GOV-032](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-GOV-032-consolidate-adopting-decision-records.md) is adopted, planned, delivered and now Awaiting review. GDR-KI-ARCADIA-001 is the single record for adopting Decision Records, and the old GDR-KI-ARCADIA-007 is folded into it and deleted. To keep the serials gap-free, Governing Technology Investigations moved from GDR-KI-ARCADIA-008 to GDR-KI-ARCADIA-007, which is the renumbering the gap-free standard prescribes. All citations are in Arcadia and have been repointed.
- [KI-ARCADIA-MOD-007](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-MOD-007-retire-runtime-specific-realisation-notes.md) is adopted (Draft, Next). Its "Proposed disposition" table lists every Claude and ChatGPT note, what is worth keeping, its proposed home and the links to repoint.
- [KI-ARCADIA-ECO-011](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-ECO-011-assess-the-estate-baseline.md) is deferred to Soon (waits for the territory rollout). [KI-ARCADIA-OPS-013](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-OPS-013-decide-on-a-delta-trial.md) is deferred to Soon (waits for the Projects stock-take).
- GitHub Apps now shows the Rig vault key and `op read` path, the `ki-agentic-harness` install, ruleset and token proof, and the counts of 3 installations and 8 credential holders. Release Cascade no longer says the harness receiver is inert.

## Needs the owner

- Review [KI-ARCADIA-GOV-032](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-GOV-032-consolidate-adopting-decision-records.md). GDR-KI-ARCADIA-007 now names a different decision.
- Approve the rows in [KI-ARCADIA-MOD-007](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-MOD-007-retire-runtime-specific-realisation-notes.md). Choose whether Scheduled Task Audit gets a runtime-neutral note or is retired. Confirm whether the Claude Housekeeping note goes.
- Two judgement calls to confirm. I adopted the deferred triage records as Draft on Soon, not Hold. The GitHub Apps workflow table now has a row for the harness's `update-ki-pin.yml`.
- Your primary checkout's `main` has 3 unpushed local commits and is 5 behind origin. Run `git pull --rebase` when convenient.
