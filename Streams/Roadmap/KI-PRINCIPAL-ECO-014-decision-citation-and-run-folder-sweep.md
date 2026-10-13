---
note_type: stream-roadmap
id: KI-PRINCIPAL-ECO-014
area: ECO
title: Decision citation sweep
project: ways-of-working
status: triage
tags:
  - topic/knowledge-islands
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-13T23:35:00Z
updated_at: 2026-10-13T23:35:00Z
---

# Decision Citation and Run-Folder Sweep

## Goal

Every committed file that cites an owner decision by its number in a run's decisions log is rewritten to say what the decision was, in the owner's words, so that no committed record needs a machine-local state folder to be understood. Every closed run folder under `~/.local/state/ki/agents/` is reconciled, with each in-force decision confirmed in a durable owner, and then archived; private runs are reconciled only from their own threads.

## Context

Kris raised the problem on 2026-10-13 in the `ways-of-working` thread: decisions in the state folder's decisions log "are part of the conversation and should materialise in repository records, otherwise knowledge is lost if work moves", and records that cite "Decisions 19 and 20 of the ways-of-working run" need local state to understand. Kris then set the rule: "CITE-RULE - I think we go a bit further. I actually think we should not necessarily need to put the decision number anywhere. It should be written about what the decision was or is." And queued the clean-up: "STATE-CLEANUP - Yes; queue after durability: ki agent close with reconcile gate, plus sweep of existing run folders." then "STATE-CLEANUP - Yes. Queue it after DECISION-HOME is settled."

`DECISION-HOME` is now settled, in words that reached the thread with stop words stripped, quoted as received: "DECISION-HOME - (b) tracked +/_THREADS/<thread>/ for decisions log and agent reports; state folder keeps runtime only." That decides what the sweep does with each closed run's log: its in-force decisions go to their durable owners, as the `ki-delegation` background-run standard already requires before a folder goes, and the folder is then archived. The `ki agent close` command that gates this, and the launcher's move to the tracked home, are the tools-ki record [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md); the standard's own rewording is the harness record [KI-HARNESS-GOV-180](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-180-tracked-thread-decisions-home.md). This record holds the two sweeps because they span repositories and this island is the territory's Capital.

The change-management report's Durability and ownership section surveyed the committed files that cite by number. In this island: [KI-PRINCIPAL-ECO-012](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-012-notification-strategy-for-delegated-work.md) in three places, [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md), the `secrets-hygiene` and `rig-techne-boundary-audit` notes, and ideas under the `rig` and `agent-host` Initiatives. In the harness: [KI-HARNESS-GOV-168](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-168-roll-out-ki-pin-receivers.md), [KI-HARNESS-GOV-170](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-170-keep-resolution-targets-local.md), the `sources.md` of `ki-tokenomics` and of `ki-delegation`, and the background-run standard's own two citations of named decisions in its Reporting and full-summary sections; a check at capture also found [KI-HARNESS-GOV-171](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-171-standing-surface-design-rules.md) citing two decisions of the `state-of-play` thread and [KI-HARNESS-GOV-178](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-178-repair-checkpoint-configuration.md) citing one of the `acquire-intake` run. In the Techné repositories: `KI-TECHNE-OPS-024` in `ki-techne-harness` and `KI-TOOL-KI-TECHNE-CLI-008` in `tools-techne`. The sweep confirms the list against the repositories at the time it runs, since files change between capture and delivery.

A read-only inventory of the machine's run folders on 2026-10-13, kept as working material in the `ways-of-working` run and not committed, found 25 folders: 17 live on the test of a running agent or an open checkpoint of their own, and 8 with no live agent and no checkpoint of their own, proposed for reconcile-then-archive: `island-model-and-tending`, `legal-bounded-tidy-20261011`, `legal-fr-oct12`, `sacred-inquiry-state-of-play`, `techne`, `tools-burndown`, `vallearmonia-community-presence` and `vallearmonia-youtube`. The `chezmoi` and `mac-studio-bootstrap` runs move to that list if Kris confirms their threads closed. Legal and personal runs were counted only, with no content read.

This record is captured from Kris's answers and is not adopted, planned or implemented by it.

## Boundary

- The citation sweep: each listed file, in whichever repository, rewritten so the decision is described in the owner's words and dated, with the number removed; each repository commits its own change under its own authority, and this record tracks the whole.
- The run-folder sweep: reconcile and then archive the eight folders above, plus any Kris adds; each decision checked against its durable owner, each unread report of an agent that exited without `DONE` read before the folder goes.
- Legal and personal runs, including `legal-bounded-tidy-20261011` and `legal-fr-oct12`, are reconciled only from their own threads, by an agent of that territory; this island's agents do not read them.
- Not the `ki agent close` command, the launcher change or the standard's wording, which the records named above own.
- Not the live runs, which close under the standard's rule when their threads close.
- No run folder is deleted; archive is the action, and anything beyond needs Kris's word.

## Discussion

### Order

The run-folder sweep waits for `ki agent close`, because the inventory's own note says what it could not verify: "whether any decision in any log has a durable home, whether any thread is closed in the owner's eyes, and whether unread reports in exited-without-DONE agents matter. These are the reconcile step's questions." The gate answers the first mechanically; the second is Kris's; the third is the reconciler's reading. The citation sweep has no such dependency and can run first, repository by repository.

### What a rewritten citation looks like

A citation that reads "under Decision 16" becomes the decision itself: what Kris chose, in Kris's words where the log holds them, and the date. Where the words are long, the record quotes the operative sentence and names the file that holds the rest, which after the tracked home lands is the thread's committed decisions log rather than the state folder.

### Open questions

- Whether the `ways-of-working` run itself, with its decisions log already quoted entry by entry in this Project's design folder, is reconciled by moving that file to the tracked home or by treating the design folder as the home until Wave F moves it.
- Whether the Techné repositories' two records are swept by this island's agent under the cross-repository handoff rule, or handed to those repositories as roadmap items.
