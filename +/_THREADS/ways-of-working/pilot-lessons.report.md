# pilot-lessons report to the ways-of-working thread, Project [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md), Initiative [knowledge-islands-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md), since the run began, finished

## What has been done

- Accepted KI-HARNESS-GOV-181 as `done` on its review packet, in Kris's words "ACCEPT-181 - accept KI-HARNESS-GOV-181 as done on its review packet". The Verify gates were re-run first and all passed: `bun run test` 1142 pass, `bunx tsc --noEmit` clean, `ki repo audit --skill ki-diagrams` 5/5 criteria with no failure, and the skill-graph SVG re-exported byte-identical through the Chrome route. The `ki-diagrams` audit carried two DIAG-4 freshness warnings on the skill map and skill graph, raised by later `ki-pmo` edits to traced skills, not by this record; they are recorded in its Done section as a fleet finding. Harness commit `34e2ed2e`. The record is pruned; its last revision is [KI-HARNESS-GOV-181](https://github.com/knowledgeislands/ki-agentic-harness/blob/34e2ed2e6b08f4b7690234b66343529473b5340d/docs/roadmap/KI-HARNESS-GOV-181-chrome-route-svg-export.md).
- Pruned KI-HARNESS-GOV-181 and KI-HARNESS-GOV-185 with the standard roadmap prune, commit `50dc6a56`, after a reference preflight across the harness, the principal, the specifications, the website and `tools-ki`. `ki repo audit --skill ki-work-roadmap` passes. The last revision of the second record is [KI-HARNESS-GOV-185](https://github.com/knowledgeislands/ki-agentic-harness/blob/2057cc9694be6e0e278c826a3f234e7e3d850238/docs/roadmap/KI-HARNESS-GOV-185-ki-pmo-extraction.md). Limitation: the native prune writes its own standardised commit message, which carries no co-author trailer; I did not amend the pushed commit.
- Repaired the three links to the pruned records in Knowledge Islands Principal, in [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) and the [change-management decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-decisions.md), to the Git-revision links above. The thread's own checkpoint still links KI-HARNESS-GOV-181 by local path in two places; checkpoints are outside this run's authority, so it is named below.
- Recorded the four pilot lessons on [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) under its pilot-lessons heading, quoting Kris's "CODEX-MARK - keep the 13:54Z mark and push; record the second-writer lesson" and "Getting a bit frustrated here again because now we're also losing the linking again for roadmap items in the summary output text." The hook-after-compaction item is written as an observation to confirm when tests 2 and 3 are scored. Principal commit `dd08666`.
- Captured the harness change lesson 4 needs as [KI-HARNESS-GOV-188](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-188-report-record-links.md), a horizon-next draft for a `ki-pmo` rubric criterion that every record identifier in an owner report is a link, with a pruned record linking to its Project note or last Git revision. Ledger reserved in commit `e5cc60f6`, record in `a5584ec8`, linked from the lesson. `ki-pmo` itself was not edited.
- Evidence for lesson 3: this launched agent also saw the `ki-coordinator` output style active in its session, and has recorded that beside the `gov181-deliver` observation.
- Both repositories were fetched, rebased cleanly and pushed fast-forward to `origin/main`: harness at `50dc6a56`, principal at `dd08666`. Kris's "PUSH-187 - fine as it stands; no further action" was honoured; nothing was done about the KI-HARNESS-GOV-187 reservation commit.

## What is in progress

Nothing is running.

Outstanding - no action requested now:

- The checkpoint [knowledge-islands-model.ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md) links KI-HARNESS-GOV-181 by its now-pruned local path at two points. The live thread relinks them to the Git revision above at its next checkpoint write.
- The principal's `ki-authoring` Markdown gate fails on three files owned by other threads (`+/_THREADS/ways-of-working/decisions.md`, one state-of-play report, one untracked knowledge-acquisition report). The two files this run touched pass the gate alone. Left to their owners.
- The `ki-diagrams` DIAG-4 freshness warnings on the skill map and skill graph wait for a REFRESH after the `ki-pmo` changes land; [KI-HARNESS-GOV-187](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-187-thread-model-and-banner.md) is the natural place.

## Outstanding queries

No outstanding queries.

```text
PILOT-LESSONS - noted; nothing to decide
```
