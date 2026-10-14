# harness-links - [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md), [knowledge-islands-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) - since the run began - resting

Background agent `harness-links` in `ki-agentic-harness`, run on 2026-10-14 after the `reply-stack` agent's stacked reply block had landed on `main`. Every commit below is pushed to `origin/main`, which was level with local `main` before and after each push; nobody else's commit arrived during the run.

## What has been done

- Accepted [KI-HARNESS-GOV-187](https://github.com/knowledgeislands/ki-agentic-harness/blob/e60b4e45/docs/roadmap/KI-HARNESS-GOV-187-thread-model-and-banner.md) as `done` under `ki-accept`, quoting Kris as received, "GOV-187-REVIEW / accept KI-HARNESS-GOV-187" and "THREAD-FOLDER / confirmed as delivered", after re-running its Verify step: `bun run test` 1142 pass, `bunx tsc --noEmit` clean, and `ki repo audit --skill` for `ki-skills`, `ki-delegation`, `ki-checkpoint`, `ki-pmo`, `ki-engineering`, `ki-repo-harness`, `ki-work-roadmap` and `ki-authoring` with no failure. The only warnings are the two pre-existing `ki-skills` refresh-cadence warnings and two `ki-diagrams` freshness warnings on the skill map and skill graph, both already named on the record. Commit `docs(roadmap): accept KI-HARNESS-GOV-187 as done`.
- Delivered LINK-GUARD's harness part under Kris's approval, as received: "LINK-GUARD / approve: hook line plus KI-HARNESS-GOV-188 in the harness, link printer in KI-TOOL-KI-CLI-127, output style handed to Rig: chezmoi". The hook line in `hooks/coordinator-reminder.sh` now says every roadmap record a report names is linked by its full identifier to its local file, and a pruned record links to the Project note that carries it or to its last Git revision; the hook tests, the hook README, the `ki-coordinator` output style and the `ki-pmo` standard's coordinating-thread practices say the same. The banner test stays green.
- Approved and delivered [KI-HARNESS-GOV-188](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-188-report-record-links.md), now `awaiting-review` from baseline `28d1dc78`: a mechanical `PMO-7` criterion in the `ki-pmo` rubric reads every thread report under `+/_THREADS/<run>/` and flags, at WARN level, each full record identifier left outside a Markdown link and each record link whose absolute local target no longer exists. The identifier grammar is imported from the vendored `ki-work-roadmap:work-identifiers` module, so work records and Decision Records are both caught while Needs tags such as `ACCEPT-181` and short forms such as `GOV-187` are not; fenced blocks, including the reply block, are skipped. The rubric is regenerated, the standard's Linking records rule and Mechanical boundary name the check, and the sources review quotes Kris's words. Commit `feat(ki-pmo): flag unlinked record identifiers in thread reports (KI-HARNESS-GOV-188)`.
- Ran the new criterion against Knowledge Islands Principal with `ki repo audit --skill ki-pmo --repo ki-principal`. Under `+/_THREADS/ways-of-working/` it reads 67 reports and flags 46 of them: 38 lines name identifiers left unlinked, among them KI-HARNESS-GOV-187 and [KI-HARNESS-GOV-190](https://github.com/knowledgeislands/ki-agentic-harness/blob/e60b4e45/docs/roadmap/KI-HARNESS-GOV-190-stacked-reply-block.md) in the `gov181-deliver`, `pilot-lessons`, `thread-model-enact` and `reply-stack` reports, [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md) in the `cli124-fix` and `cli127-widen` reports, and [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) in four reports; 21 lines name links whose target file is gone, every one a record pruned since the report was written and still linked to its deleted file rather than to its Project note or last Git revision. The other thread folders show the same pattern: `state-of-play` 80 of 140 reports, `techne` 47 of 56, `chezmoi` 21 of 36, `tools-burndown` 21 of 27, `mac-studio-bootstrap` 5 of 11, `knowledge-acquisition` 3 of 4, `pilot-test1` 1 of 1. No report in any thread was changed, as the task set.
- Pruned the two done records, KI-HARNESS-GOV-187 and KI-HARNESS-GOV-190, with `ki repo roadmap prune` after the in-repository preflight found only bare historical mentions and no links to either file. Commit `chore(roadmap): prune 2 done work records`. The prune command writes its own standardised message, so that one commit carries no co-author trailer; the two commits I wrote carry it. Both pruned records are linked above to their last committed state on the canonical remote, at the commit before the prune.
- Gates on the combined result: `bun run test` 1149 pass, 0 fail; `bunx tsc --noEmit` clean; the hook and banner tests 19 pass; the skill-graph check through `ki repo audit --skill ki-repo-harness` passes with its two pre-existing freshness warnings; `ki repo audit --skill` for `ki-pmo`, `ki-delegation`, `ki-work-roadmap` and `ki-authoring` pass and `ki-skills` passes with its two pre-existing refresh-cadence warnings. One existing test, the `ki-skills` remediation inventory, counts every criterion in the harness and was advanced by one for `PMO-7`.

## What is in progress

Nothing is running. The run is complete and this report is its last act.

### Outstanding - no action requested now

- Reports in the Principal's thread folders that link a pruned record to its deleted file, or name a record without a link, will keep showing as `PMO-7` warnings until each thread repairs its own reports; nothing in the harness audit is affected.
- One Needs tag in the ways-of-working `burn-down` report is shaped like a record identifier, a rescope tag for [KI-HARNESS-OPS-005](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md), and the grammar flags it; the standard asks threads not to shape tags that way and no registry lookup of repository codes was added.
- The decisions log and checkpoints are not scanned by `PMO-7`: the log is in the owner's words and the checkpoint belongs to `ki-checkpoint`.
- The link printer in KI-TOOL-KI-CLI-127 and the output-style deployment through Rig and chezmoi are the other two parts of LINK-GUARD and were not this run's work.
- The `+/diagrams/` folder in the harness checkout was untracked before this run started and was left alone.

## Outstanding queries

### GOV-188-REVIEW - accept KI-HARNESS-GOV-188

**Summary:** [KI-HARNESS-GOV-188](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-188-report-record-links.md) is `awaiting-review` with its six-part review packet, every gate passing and the criterion proven against the Principal's own reports.

**Need from you:** acceptance of the record as `done`.

**Recommendation:** accept it on its review packet.

### LINK-LEVEL - keep PMO-7 at WARN for now

**Summary:** the criterion is WARN rather than FAIL because the Capital's existing reports predate the rule, and a FAIL would turn every `ki-pmo` audit there red until each thread had repaired its own reports. Raising it is one word in the rubric item once the reports are clean.

**Need from you:** confirmation of WARN now, with FAIL to follow once the ways-of-working reports are repaired.

**Recommendation:** keep WARN and revisit after the repair below.

### REPORT-REPAIR - repair the ways-of-working thread's own reports

**Summary:** 46 of this thread's 67 reports carry a `PMO-7` finding, mostly pruned records still linked to their deleted file, which the Git-revision link now cures. This run did not touch them, as the task set.

**Need from you:** approval to launch one background agent to repair only `+/_THREADS/ways-of-working/*.report.md`, linking each bare identifier to its record and each pruned record to its last Git revision on the canonical remote, and leaving every other thread's folder alone.

**Recommendation:** approve one agent, this thread's folder only.

```text
GOV-188-REVIEW

accept KI-HARNESS-GOV-188 as done on its review packet (/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-188-report-record-links.md)

---

LINK-LEVEL

keep PMO-7 at WARN; raise it to FAIL once the ways-of-working reports are repaired

---

REPORT-REPAIR

approve one background agent to repair +/_THREADS/ways-of-working/*.report.md only: link every bare record identifier to its record and every pruned record to its last Git revision on the canonical remote; touch no other thread's folder
```
