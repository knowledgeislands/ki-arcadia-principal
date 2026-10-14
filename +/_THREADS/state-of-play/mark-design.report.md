# mark-design report

**Done**

- [KI-HARNESS-GOV-169](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-169-roll-up-since-mark.md) records Kris's MARK decisions (Decision 16) as decided and is planned to `ready` at horizon `next`, with kind changed from `decide` to `deliver`. Not implemented.
- The plan builds on thread-model-2's reporting and refresh rules: running threads pick up the mark rule through the refresh rule, and the Summary practice is the light counterpart.
- Commit 01ac726c, pushed fast-forward to origin/main; the primary checkout is that checkout and is current.
- Checks: `ki repo audit` PASS=30 WARN=2 FAIL=0. Both warnings are pre-existing (ki-model-radar review date and ki-skills sources refresh). `ki repo audit --skill ki-work-roadmap` and the pre-commit hook pass.

**Needs Kris** (recommended defaults; confirm or change. A rejection returns the record to draft)

- MARK-FORM: a mark is a UTC timestamp plus the decisions-log position, stored as one `Mark: <time>, decisions log at Decision <N>` line in the checkpoint's Current state. No per-repo commit IDs.
- MARK-STRIKE: only you move the mark, by saying "mark" (or "recap and mark"). Giving a recap does not move it.
- MARK-NONE: with no mark yet, the first recap covers the period since the last recap (or since the checkpoint was created), then strikes a mark. Existing threads convert their last-recap note into a mark on the next guidance refresh.
- MARK-SOURCES: the roll-up reads the decisions log after Decision N, agent reports since the mark, `ki agent status`, work-record changes in scope, and the checkpoint's Needs-you items and parked tangents. For the master thread, scope is only what it raised or owns.
- MARK-SUMMARY: proactive updates (when agents finish or you return) use the short "since your last message" Summary; the full recap since the mark comes only on request.
- MARK-NAME: rename "project recap" to "recap since the mark" and move it under Thread working rules so the master thread has one too.
- MARK-RUBRIC: extend rubric item RUN-5 rather than add a new item.
- READY: I moved the horizon from soon to next and the status to ready on your "plan it to ready" instruction. That horizon move is normally a ki-next step. Confirm, or say to put it back to draft until the items above are settled.
