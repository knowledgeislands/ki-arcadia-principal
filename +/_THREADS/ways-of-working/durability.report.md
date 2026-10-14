# durability - Durability and ownership answered in the design report

## What has been done

- Added `## Durability and ownership` to the [design report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-report.md), before `## Decisions`, with four subsections: Durable decisions, What is durable in the repository, Hook ownership, and `ki-pmo` against `ki-pmo-review`. Every owner decision it cites quotes Kris's words inline; Decision 22 is quoted in full at its head.
- Added five tagged owner decisions, 11 to 15, to the report's Decisions list (`DECISION-HOME`, `CITE-RULE`, `DESIGN-RETENTION`, `HOOK-OWNER`, `LOOP-NAME`), a `## Changes after review` entry, the header's Amended line, and one sentence in the folder index [design.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/design.md).
- Findings worth knowing. Striking a mark truncates no decision; what removes decisions is close, under Decision 2's retention rule, and the only Git-tracked copies (the checkpoint's `Decisions made`, the design decisions file) are snapshots that are themselves removed. The decisions file holds durable content in a temporary file. The hook detects by the checkpoint footprint, which fires in three repositories that declare `ki-checkpoint` but not `ki-delegation`, and this island itself declares `ki-checkpoint` and not `ki-delegation`; `ki repo audit` has no code touching the hook and cannot read user settings under ADR-KI-HARNESS-010, so the check splits across `ki-pmo`'s rubric, the chezmoi source and `rig doctor`. `ki-pmo-review` fails the glance test ("review" places it after delivery); `ki-pmo-design` passes.
- Citation survey (`git grep`, committed files, checkpoints excluded): [KI-HARNESS-GOV-176](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-176-explicit-skill-dependency-graph.md), the case Kris named, was already fixed by the `decisions-sync` agent and now quotes Kris's instruction. Twelve files still cite by number: [KI-PRINCIPAL-ECO-012](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-012-notification-strategy-for-delegated-work.md), [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) (links the decisions file that would be deleted), the secrets-hygiene and agent-host Project notes, the rig Initiative note and the agent-host boundary audit in this island; [KI-HARNESS-GOV-168](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-168-roll-out-ki-pin-receivers.md), [KI-HARNESS-GOV-170](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-170-keep-resolution-targets-local.md) and two skill `sources.md` files in the harness; [KI-TECHNE-OPS-024](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-024-weekly-pin-bump.md); [KI-TOOL-TECHNE-CLI-008](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-008-host-patching-fields.md). The fix is one sweep item, proposed under `CITE-RULE`.
- Verification: `ki repo audit --repo .` in ki-principal shows no new FAIL; one failure my section introduced (a wikilink pipe inside a table, MD056) was fixed before committing. Three failures pre-date this work and are in files outside my scope: the thread's own [checkpoint](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md) fails RECORD-2 because `updated_at: 2026-10-13T15:35Z` is not RFC 3339 (needs seconds); TOPICS-1 (GitHub topics differ from `package.json` keywords, `arcadia`); PRINCIPAL-2 (Enactment Process not anchored in CLAUDE.md or AGENTS.md). Pre-commit hooks passed; the diff touches only the design folder.
- Committed as `674fd45` ("docs(ways-of-working): add Durability and ownership to the design report", Co-Authored-By Claude Fable 5.1) and pushed fast-forward to `origin/main` (`dbb7b42..674fd45`). No skill, hook, tool, checkpoint, `Admin`, `Pillars` or `Resources` file was changed. The decisions file was no longer dirty when I committed: `decisions-sync`'s commit landed first.

## What is in progress

Nothing running.

Outstanding - no action requested now:

- Receiver-owned once decided: the citation sweep (`CITE-RULE`), the hook's signal change and `ki-pmo` requirement in the pilot record (`HOOK-OWNER`), the governance record GDR-KI-PRINCIPAL-009 at the pilot's acceptance (`DESIGN-RETENTION`).
- Verification limitation: the three pre-existing audit failures above; the checkpoint one is the thread's to fix at its next update (seconds in `updated_at`).
- Retained decisions: none; every decision this work rests on is quoted in the section.

## Outstanding queries

### DECISION-HOME - Where does an owner decision live?

- Summary: the run log is deleted at close and the checkpoint and design file are snapshots; three kinds of decision need three homes.
- Need you: choose (a) log as working copy, consolidated at every mark and before close, with `## Decided` and the mark cursor as locators only; (b) commit the log; (c) no log.
- Recommendation: (a).

### CITE-RULE - How does a record cite an owner decision?

- Summary: twelve committed files cite a number into a file that will not exist.
- Need you: choose (a) words, date and home, number as provenance only, with one sweep item and the rule written into Linking records and the work-item Discussion guidance; (b) numbers permitted while the log exists; (c) (a) plus a mechanical WARN.
- Recommendation: (a).

### DESIGN-RETENTION - What happens to the design folder?

- Summary: the standards' delete-after-consolidation rule is right but leaves timing, per-owner consolidation and the survival of your words unsaid.
- Need you: choose (a) consolidate per owner, governance record at the pilot's acceptance, delete the folder in one commit when Wave F closes after every decision has a home and links are re-pointed; (b) keep the decisions file permanently; (c) archive under `-/`.
- Recommendation: (a).

### HOOK-OWNER - Who owns the coordinator reminder hook?

- Summary: chezmoi data is the right per-machine switch but not the policy; the checkpoint footprint is the wrong signal; the audit cannot read user settings.
- Need you: choose (a) `ki-pmo` owns rule, line and requirement; harness ships; chezmoi registers; signal becomes the declared `ki-pmo` once the pilot creates it; checks split across `ki-pmo` rubric, chezmoi source and `rig doctor`; this island declares `ki-pmo` in the pilot; (b) `ki-checkpoint`; (c) `ki-delegation`; (d) `tools-ki` registers at bootstrap.
- Recommendation: (a).

### LOOP-NAME - What is the loop called beside ki-pmo?

- Summary: `ki-pmo` runs the work; the loop designs it before it is run; "review" reads as after delivery.
- Need you: choose (a) `ki-pmo-review`; (b) `ki-pmo-design`; (c) `ki-blueprint`.
- Recommendation: (b).

```text
DECISION-HOME - (a) log as working copy, consolidated at every mark and before close.
CITE-RULE - (a) words, date and home; one sweep item; rule into Linking records and the work-item guidance.
DESIGN-RETENTION - (a) consolidate per owner; GDR at the pilot's acceptance; delete the folder when Wave F closes.
HOOK-OWNER - (a) ki-pmo owns it; declared skill as the signal; checks split; declare ki-pmo in the pilot.
LOOP-NAME - (b) ki-pmo-design.
```
