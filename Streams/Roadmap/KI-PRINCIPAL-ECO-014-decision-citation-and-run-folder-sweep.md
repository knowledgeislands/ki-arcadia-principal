---
note_type: stream-roadmap
id: KI-PRINCIPAL-ECO-014
area: ECO
title: Decision citation sweep
project: ways-of-working
purpose: upkeep
kind: deliver
status: in-progress
horizon: now
tags:
  - topic/knowledge-islands
blocks: []
blocked_by: []
baseline_ref: 17c7cc22cf3993e15c7f721c6b3e9630ce534fb2
created_at: 2026-10-13T23:35:00Z
updated_at: 2026-10-14T14:11:46Z
---

# Decision Citation and Run-Folder Sweep

## Goal

Every committed file that cites an owner decision by its number in a run's decisions log is rewritten to say what the decision was, in the owner's words, so that no committed record needs a machine-local state folder to be understood. Every closed run folder under `~/.local/state/ki/agents/` is reconciled, with each in-force decision confirmed in a durable owner, and then archived; private runs are reconciled only from their own threads.

## Context

Kris raised the problem on 2026-10-13 in the `ways-of-working` thread: decisions in the state folder's decisions log "are part of the conversation and should materialise in repository records, otherwise knowledge is lost if work moves", and records that cite "Decisions 19 and 20 of the ways-of-working run" need local state to understand. Kris then set the rule: "CITE-RULE - I think we go a bit further. I actually think we should not necessarily need to put the decision number anywhere. It should be written about what the decision was or is." And queued the clean-up: "STATE-CLEANUP - Yes; queue after durability: ki agent close with reconcile gate, plus sweep of existing run folders." then "STATE-CLEANUP - Yes. Queue it after DECISION-HOME is settled."

`DECISION-HOME` is now settled, in words that reached the thread with stop words stripped, quoted as received: "DECISION-HOME - (b) tracked +/_THREADS/<thread>/ for the decisions log and agent reports; state folder keeps runtime only." That decides what the sweep does with each closed run's log: its in-force decisions go to their durable owners, as the `ki-delegation` background-run standard already requires before a folder goes, and the folder is then archived. The `ki agent close` command that gates this, and the launcher's move to the tracked home, are the tools-ki record [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md); the standard's own rewording is the harness record [KI-HARNESS-GOV-180](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-180-tracked-thread-decisions-home.md). This record holds the two sweeps because they span repositories and this island is the territory's Capital.

The change-management report's Durability and ownership section surveyed the committed files that cite by number. In this island: [KI-PRINCIPAL-ECO-012](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-012-notification-strategy-for-delegated-work.md) in three places, [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md), the `secrets-hygiene` and `rig-techne-boundary-audit` notes, and ideas under the `rig` and `agent-host` Initiatives. In the harness: [KI-HARNESS-GOV-168](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-168-roll-out-ki-pin-receivers.md), [KI-HARNESS-GOV-170](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-170-keep-resolution-targets-local.md), the `sources.md` of `ki-tokenomics` and of `ki-delegation`, and the background-run standard's own two citations of named decisions in its Reporting and full-summary sections; a check at capture also found [KI-HARNESS-GOV-171](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-171-standing-surface-design-rules.md) citing two decisions of the `state-of-play` thread and [KI-HARNESS-GOV-178](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-178-repair-checkpoint-configuration.md) citing one of the `acquire-intake` run. In the Techné repositories: `KI-TECHNE-OPS-024` in `ki-techne-harness` and `KI-TOOL-KI-TECHNE-CLI-008` in `tools-techne`. The sweep confirms the list against the repositories at the time it runs, since files change between capture and delivery.

A read-only inventory of the machine's run folders on 2026-10-13, kept as working material in the `ways-of-working` run and not committed, found 25 folders: 17 live on the test of a running agent or an open checkpoint of their own, and 8 with no live agent and no checkpoint of their own, proposed for reconcile-then-archive: `island-model-and-tending`, `legal-bounded-tidy-20261011`, `legal-fr-oct12`, `sacred-inquiry-state-of-play`, `techne`, `tools-burndown`, `vallearmonia-community-presence` and `vallearmonia-youtube`. The `chezmoi` and `mac-studio-bootstrap` runs stay among the 17 live folders: Kris confirmed on 2026-10-14 that their threads are open, "No, they're not closed, they're both being worked on." Legal and personal runs were counted only, with no content read.

This record is captured from Kris's answers and is not adopted, planned or implemented by it.

Kris read a numbered citation in a thread summary on 2026-10-14 and said, as relayed by the master thread: "has no meaning to me because I don't know what the decision was ... and I don't know where the list is. I thought we'd looked at changing the way that decisions were recorded like this so that they became durable knowledge." The master thread's relay places the sweep: "tools-ki launcher change and ki-principal run-folder sweep stay with their owners as handoffs named in the plan." Kris then placed the subject: "everything to do with the decisions log belongs to ways-of-working". This record is therefore planned by the `ways-of-working` thread.

## Boundary

- The citation sweep: each listed file, in whichever repository, rewritten so the decision is described in the owner's words and dated, with the number removed; each repository commits its own change under its own authority, and this record tracks the whole.
- The run-folder sweep: reconcile and then archive the eight folders above, plus any Kris adds; each decision checked against its durable owner, each unread report of an agent that exited without `DONE` read before the folder goes.
- Legal and personal runs, including `legal-bounded-tidy-20261011` and `legal-fr-oct12`, are reconciled only from their own threads, by an agent of that territory; this island's agents do not read them.
- Not the `ki agent close` command, the launcher change or the standard's wording, which the records named above own.
- Not the live runs, which close under the standard's rule when their threads close. This includes the `chezmoi` and `mac-studio-bootstrap` runs, whose threads are open and being worked on; any reconcile of their folders happens only from those threads when they close.
- No run folder is deleted; archive is the action, and anything beyond needs Kris's word.

## Current state

Grounded on 2026-10-14 at this island's `024625d`, harness `86744bfd`, `tools-ki` `7e3c05f`, with `ki-techne-harness` and `tools-techne` read at their primary checkouts the same day:

- Files that match `Decision [0-9]+` today, confirmed by `git grep` in each repository. In this island: `Streams/Initiatives/rig.md` and its `knowledge-islands-model/design/territory-selection-report.md`; `Streams/Projects/agent-host.md` and its design folder's `design.md`, `rig-techne-boundary-audit.md` and `workstation-bundle-walkthrough.md`; the Project notes `baseline-rollout.md`, `delta-evaluation.md`, `island-model-and-tending.md`, `paperclip-bootstrap-and-recovery.md`, `roadmap-model.md`, `secrets-hygiene.md` and `website.md`; the `ways-of-working` design folder's `change-management-brief.md`, both change-management reviews, `roadmap-sizing-and-burn-down.md` and `thread-banner-and-re-anchoring.md`; and [KI-PRINCIPAL-ECO-012](KI-PRINCIPAL-ECO-012-notification-strategy-for-delegated-work.md). [KI-PRINCIPAL-ECO-013](KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) no longer matches. In the harness: [KI-HARNESS-GOV-168](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-168-roll-out-ki-pin-receivers.md), [KI-HARNESS-GOV-170](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-170-keep-resolution-targets-local.md), [KI-HARNESS-GOV-171](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-171-standing-surface-design-rules.md), [KI-HARNESS-GOV-178](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-178-repair-checkpoint-configuration.md), [KI-HARNESS-OPS-005](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md) and `skills/environment/ki-tokenomics/references/sources.md`. In `tools-ki`: KI-TOOL-KI-CLI-115 and [KI-TOOL-KI-CLI-125](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-125-ki-release-contract.md). In `ki-techne-harness`: `KI-TECHNE-OPS-018`, `019`, `023`, `024` and `027`. In `tools-techne`: `KI-TOOL-TECHNE-CLI-006` and `008`.
- Not every match is a citation. Quotations of Kris's own words, such as "Decisions 19 and 20 of the ways-of-working run" in this record's Context, and quotations of the standard's old rule in [KI-HARNESS-GOV-180](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-180-tracked-thread-decisions-home.md) are evidence and stay. The sweep rewrites a number used as authority, not a number inside a quotation.
- The `ki-delegation` skill's own files that cite by number, its standard, `SKILL.md`, `assets/run-prompt.md` and `references/sources.md`, are rewritten by the harness's tracked thread decisions home record, not here; the harness's `ki-tokenomics` sources file is swept here.
- The eight folders proposed for reconcile-then-archive are unchanged since the inventory: `island-model-and-tending`, `legal-bounded-tidy-20261011`, `legal-fr-oct12`, `sacred-inquiry-state-of-play`, `techne`, `tools-burndown`, `vallearmonia-community-presence` and `vallearmonia-youtube`. The `ways-of-working` run is live, and Kris placed its log on 2026-10-14: "everything to do with the decisions log belongs to ways-of-working". That thread reconciles its own log at its own close; this record does not read it.
- `ki agent close` does not exist in installed `ki` 0.10.1. The `tools-ki` plan delivers `decide --home`, `reconcile` and `close` with a gate that blocks on any decision without a durable home, archives to `$KI_STATE_HOME/agents/_archive/<run>/` by default and deletes only with `--delete`.
- Kris read a numbered citation in a thread summary on 2026-10-14 and said, as relayed by the master thread: "has no meaning to me because I don't know what the decision was ... and I don't know where the list is. I thought we'd looked at changing the way that decisions were recorded like this so that they became durable knowledge." The citation sweep is the committed half of that change.

## Steps

Each repository commits its own change under its own authority; this record tracks the whole and the island's thread delivers it.

### Citation sweep, repository by repository

- [x] Re-run `git grep -nE 'Decision(s)? [0-9]+' -- .` in each repository above and classify each match as a citation to rewrite or a quotation to keep, listing the classification in this record's Discussion before editing.
- [x] For each citation, read the decision in the run's log, in the state folder or the thread's tracked folder, and replace the number with the owner's operative words, dated, and the name of the file that holds the rest; where the log entry quotes nothing, describe the decision and date it. A Project note or design file is edited only in the sentence that cites; checkpoints under `+/_CHECKPOINTS/` are not edited.
- [x] This island: one commit, `docs(streams): describe cited decisions in the owner's words`. Harness: one commit touching the four roadmap records and `ki-tokenomics` sources, after the harness's own `ki-delegation` rewording has landed so the two do not collide. `tools-ki`: one commit for its two records. `ki-techne-harness` and `tools-techne`: one commit each, by this island's agent under the cross-repository handoff rule, or handed to those repositories as Kris decides below.
- [x] Push each repository fast-forward under the thread's standing push permission. Done for this island, `tools-ki`, `ki-techne-harness` and `tools-techne`; the harness commit followed Kris's word on 2026-10-14, "commit the harness citation rewrite now", and is on `origin/main`.

### Run-folder sweep, after `ki agent close` is installed

- [ ] For each of the eight folders, read `decisions.md`, and for each in-force decision find or create its durable home and record it with `ki agent reconcile <run> <number> <home>`; read each `<name>.report.md` of an agent that exited without `DONE` and note in this record's Discussion what it reported and what, if anything, it changes; leave `legal-bounded-tidy-20261011` and `legal-fr-oct12` to the legal territory's own thread, which runs the same steps there.
- [ ] Run `ki agent close <run>` for each of the six island folders; on a blocker, resolve it or list it under Discussion for Kris, and never pass `--reconciled` or `--delete` without Kris's word.
- [ ] Record each archive's `close.md` path in this record's Discussion.

## Files touched

- This island: `Streams/Initiatives/rig.md`, `Streams/Initiatives/knowledge-islands-model/design/territory-selection-report.md`, `Streams/Projects/agent-host.md`, `Streams/Projects/agent-host/design/design.md`, `Streams/Projects/agent-host/design/rig-techne-boundary-audit.md`, `Streams/Projects/agent-host/design/workstation-bundle-walkthrough.md`, `Streams/Projects/baseline-rollout.md`, `Streams/Projects/delta-evaluation.md`, `Streams/Projects/island-model-and-tending.md`, `Streams/Projects/paperclip-capture-and-rebuild/paperclip-capture-and-rebuild.md`, `Streams/Projects/roadmap-model.md`, `Streams/Projects/secrets-hygiene.md`, `Streams/Projects/website.md`, `Streams/Projects/ways-of-working/design/change-management-brief.md`, `Streams/Projects/ways-of-working/design/change-management-review-astra.md`, `Streams/Projects/ways-of-working/design/change-management-review-fable.md`, `Streams/Projects/ways-of-working/design/roadmap-sizing-and-burn-down.md`, `Streams/Projects/ways-of-working/design/thread-banner-and-re-anchoring.md`, `Streams/Roadmap/KI-PRINCIPAL-ECO-012-notification-strategy-for-delegated-work.md`, and this record's Discussion.
- Harness: `docs/roadmap/KI-HARNESS-GOV-168-roll-out-ki-pin-receivers.md`, `KI-HARNESS-GOV-170-keep-resolution-targets-local.md`, `KI-HARNESS-GOV-171-standing-surface-design-rules.md`, `KI-HARNESS-GOV-178-repair-checkpoint-configuration.md`, `KI-HARNESS-OPS-005-acquire-ai-sessions.md` and `skills/environment/ki-tokenomics/references/sources.md`.
- `tools-ki`: `docs/roadmap/KI-TOOL-KI-CLI-115-enforce-roadmap-writing-checkout.md` and `KI-TOOL-KI-CLI-125-ki-release-contract.md`.
- `ki-techne-harness`: `docs/roadmap/KI-TECHNE-OPS-018`, `019`, `023`, `024` and `027`. `tools-techne`: `docs/roadmap/KI-TOOL-TECHNE-CLI-006` and `008`.
- State folder: the six island run folders move to `$KI_STATE_HOME/agents/_archive/`; nothing is deleted.

## Verify

- In each swept repository, `git grep -nE 'Decision(s)? [0-9]+' -- .` prints only the matches classified as quotations in Discussion.
- This island: `ki repo audit --skill ki-repo-kb-streams` reports no failure and no new warning beyond the two pre-existing `STREAM-10` warnings on the `paperclip-bootstrap-and-recovery` and `website` Project notes, which are outside this record. Harness, `tools-ki`, `ki-techne-harness` and `tools-techne`: `ki repo audit --skill ki-work-roadmap` passes, and the harness's `ki repo audit --skill ki-tokenomics` passes.
- `ki agent status <run>` for each of the six island folders lists no running agent before close; `ki agent close <run>` prints every gate line `ok` and names its archive; `ls $KI_STATE_HOME/agents/_archive/` shows the six and `ls $KI_STATE_HOME/agents/` no longer does.
- The `chezmoi`, `mac-studio-bootstrap`, `ways-of-working` and both legal folders are untouched: their modification times are unchanged.

## Dependencies / blocks

- `blocked_by` is empty: the records this depends on live in other repositories. The citation sweep needs nothing and can start on approval, except the harness files, which wait for the harness's `ki-delegation` rewording so one standard is not edited twice at once.
- The run-folder sweep waits for `ki agent close` in an installed `ki`; Kris queued it "after durability: ki agent close with reconcile gate, plus sweep of existing run folders." The `tools-ki` guide at `docs/guides/user/background-agents.md` will document the command.
- Legal and personal runs are reconciled by their own territories' threads; this record names them and does not read them.
- The `ways-of-working` run's own log is outside this sweep, on Kris's placement of the decisions log with that thread.

## Delegation

The `ways-of-working` thread coordinates. Citation sweep: one detached background agent under `ki-delegation` with the five repositories as `--add-dir`, one round per repository group, reporting the classification list before editing so the thread can check it. Run-folder sweep: a second agent, launched only once `ki agent close` is installed and the citation commits have landed, with no access to the legal or personal folders, reporting each gate output in full. Kris accepts through `ki-accept` after both.

## Documentation impact

### Decision Records

None. The rule that a decision is described, not numbered, is owned by the `ki-delegation` standard once the harness record lands; this record applies it.

### Specifications

None.

### Guides

None here; the `tools-ki` background-agents guide documents `close` under that repository's record.

### Roadmap

No follow-on record in this island. Techné repository edits are handled as the answer to the open question below decides, as commits by this island's agent or as handoffs, and open no feature record either way.

## Discussion

### Order

The run-folder sweep waits for `ki agent close`, because the inventory's own note says what it could not verify: "whether any decision in any log has a durable home, whether any thread is closed in the owner's eyes, and whether unread reports in exited-without-DONE agents matter. These are the reconcile step's questions." The gate answers the first mechanically; the second is Kris's; the third is the reconciler's reading. The citation sweep has no such dependency and can run first, repository by repository.

### What a rewritten citation looks like

A citation that reads "under Decision 16" becomes the decision itself: what Kris chose, in Kris's words where the log holds them, and the date. Where the words are long, the record quotes the operative sentence and names the file that holds the rest, which after the tracked home lands is the thread's committed decisions log rather than the state folder.

### Open questions

Settled at planning on 2026-10-14:

- The `ways-of-working` run is not reconciled by this record. Kris placed it: "everything to do with the decisions log belongs to ways-of-working". That thread keeps its log, copies it to the tracked thread folder once the harness wording lands, and closes it under the standard when the thread closes. The design folder's quoted copy stays as evidence and is not a home.
- A match on a number inside a quotation of Kris's words or of the old standard is not a citation and is kept; the classification list in Discussion is written before any edit.

Settled at approval on 2026-10-14: Kris answered "TECHNE-SWEEP - a", so this island's agent edits the five `ki-techne-harness` records and two `tools-techne` records under the cross-repository handoff rule, committing in each repository with local edits only; the Techne Programme Hold is unaffected.

### Classification

Re-run on 2026-10-14 before editing, at this island's `17c7cc2`, harness `0540aabf`, `tools-ki` `a86a63a`, `ki-techne-harness` `de6b4d3` and `tools-techne` `854e60a`. Matches under `+/_THREADS/` and `+/_CHECKPOINTS/` are the logs themselves and the checkpoints, and are outside the sweep.

Kept, because the number is not a citation of authority:

- `Streams/Initiatives/knowledge-islands-model/design/territory-selection-report.md`: "Decision 3" names item 3 of that report's own Decisions list, not a run's log.
- `Streams/Projects/ways-of-working/design/change-management-brief.md`: the verbatim block of the ways-of-working decisions and the sentence introducing it are the quoted copy the Open questions above keep as evidence.
- `Streams/Projects/ways-of-working/design/change-management-report.md`: quotes Kris's own words, "cite 'Decisions 19 and 20 of the ways-of-working run'".
- `Streams/Projects/ways-of-working/design/roadmap-sizing-and-burn-down.md`: the number sits inside the blockquote of the master's relay, kept as received.
- `Streams/Projects/ways-of-working/design/thread-banner-and-re-anchoring.md`: the two banner mock-ups show the mark form the standard then defined, `decisions log at Decision <N>`; the harness's tracked thread decisions home record owns that form.
- This record: quotations of Kris's words and the illustration "under Decision 16" of the pattern removed.
- Harness: [KI-HARNESS-GOV-180](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-180-tracked-thread-decisions-home.md) quotes the old standard; the `ki-delegation` standard and its `sources.md` are that record's to reword.
- `tools-ki`: `src/tests/cli/agent.test.ts` fixtures exercise the log's own numbered format; [KI-TOOL-KI-CLI-125](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-125-ki-release-contract.md) "Decision 6" names item 6 of the linked, committed Rig and Techne boundary audit.
- `ki-techne-harness`: `KI-TECHNE-OPS-018` "Decision 5" and "decision 3" name items of the linked audit and of ADR-KI-PRINCIPAL-003. `tools-techne`: `KI-TOOL-TECHNE-CLI-006` "Decisions 2, 4 and 8" name items in the committed ODR-KI-PRINCIPAL-001 references.

Rewritten, every other match: in this island the 19 files under Files touched less the five kept above, 60 citations of the ways-of-working, state-of-play, chezmoi and Techne runs; in the harness six files citing the state-of-play, acquire-intake, knowledge-acquisition and ways-of-working runs; in `tools-ki` KI-TOOL-KI-CLI-115 citing the state-of-play and tools-burndown runs; in `ki-techne-harness` five records citing the state-of-play and Techne runs; in `tools-techne` two records citing the Techne and tools-burndown runs. Each rewrite quotes the operative words from the run's log, as recorded there, with the date and the run's name.

### Delivery

Citation sweep delivered on 2026-10-14, commits `e3ef135` here (`docs(streams): describe cited decisions in the owner's words`, 19 files), `86c56b3` in `tools-ki`, `f1815e6` in `ki-techne-harness` and `4f179ed` in `tools-techne`, each by explicit path, rebased and pushed fast-forward to `origin/main`. The three handoff commits name KI-PRINCIPAL-ECO-014 and Kris's "TECHNE-SWEEP - a". Verify: in each of the four repositories `git grep -nE 'Decision(s)? [0-9]+'` prints only the matches classified as kept above; this island's `ki repo audit --skill ki-repo-kb-streams` reports no failure and only the two pre-existing `STREAM-10` warnings; `ki repo audit --skill ki-work-roadmap` passes in the other three.

The harness rewrite of its six files is written and verified (`ki repo audit --skill ki-work-roadmap` and `--skill ki-tokenomics` both pass with it applied, and the remaining matches are the kept quotations in [KI-HARNESS-GOV-180](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-180-tracked-thread-decisions-home.md) and the `ki-delegation` files that record owns), but not committed: the plan above has the harness files wait for the harness's `ki-delegation` rewording, and that record is still draft. The patch is kept with the `ways-of-working` run's working material until Kris says whether to commit it now, since the six files do not overlap the standard, or to wait.

The run-folder sweep has not started: `ki agent close` and `ki agent reconcile` are not in the installed `ki` 0.10.2, which has `decide`, `launch`, `queue` and `status`. Nothing in `$KI_STATE_HOME/agents/` was moved, archived or deleted. The eight folders named above are unchanged.

### Run-folder sweep, first pass

Run on 2026-10-14 with installed `ki` 0.10.3, which has `ki agent close` and `ki agent reconcile`. The gate was run for each candidate from its owning repository; `close` changes nothing while any blocker stands, and nothing was moved, archived or deleted. `$KI_STATE_HOME/agents/_archive/` does not yet exist.

- `tools-burndown` is not a closed run: its thread is `platform-foundations.estate-factorisation`, whose checkpoint is `active` and was marked on 2026-10-14 at 11:02Z, and its tracked log at `+/_THREADS/tools-burndown/` is already reconciled (one decision with a home, earlier decisions kept in `historical-decisions.md`). It closes under the standard's rule when that thread closes, as the Boundary says for live runs.
- `sacred-inquiry-state-of-play` belongs to the Sacred Inquiry territory, not to Knowledge Islands; its prompts name only that territory's repository. Under the Boundary's rule for other territories' runs it is left to that territory's own thread, unread beyond its two-line log.
- `island-model-and-tending` (home this island): every agent finished, no dispatcher, queue and worktrees empty, no tracked thread folder; blocked because all 37 decisions in the state folder's log have no home.
- `techne` (home this island, tracked folder `+/_THREADS/techne/` committed and clean): blocked because all 57 decisions in the tracked log have no home, and five agents exited without `DONE`: `build-015`, `naming`, `naming2`, `rename-agent-host` and `setup-ki010`. None of the five wrote a report; each status line shows it was superseded by a finished agent (`build-015b`, `naming3`, `rename-agent-host2` and `3`, `setup-ki010b`), so there is nothing unread.
- `vallearmonia-community-presence` and `vallearmonia-youtube` (home `va-principal`, no tracked thread folder): every agent finished, no dispatcher, queue and worktrees empty; blocked because their 3 and 24 decisions have no home.

Kris kept the gate strict on 2026-10-14, "keep the close gate strict with the reconciled waiver", and this record says never to pass `--reconciled` without Kris's word. The four closed-thread runs therefore wait for one of two things: each decision housed with `ki agent reconcile`, or Kris's waiver, which archives the folder with its log intact and records the waiver in `close.md`.

### Adoption

On 14 October 2026 Kris approved the state-of-play thread's triage burn-down as written, under Kris's instruction to burn the roadmap down: adopted as `deliver / Next`. Kris asked for it in CITE-RULE and STATE-CLEANUP. The citation sweep can start now; the run-folder sweep waits for KI-TOOL-KI-CLI-124's `ki agent close`. Adoption grants no planning, implementation or acceptance authority.
