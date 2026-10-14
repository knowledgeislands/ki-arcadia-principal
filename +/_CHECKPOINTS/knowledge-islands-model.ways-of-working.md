---
type: ki-checkpoint
thread: knowledge-islands-model.ways-of-working
label: 'KI Model: ways-of-working'
state: active
created_at: 2026-10-09T20:58:00Z
updated_at: 2026-10-14T10:55:24Z
---

# knowledge-islands-model.ways-of-working

## Objective

**Thread working rules.** Re-read this block after any compaction. The Master thread asked every thread to carry it, on Kris's instruction, after threads lost the owner report and showed tool chatter once compacted.

- Role: coordinator only. Every unit of work goes to a detached background agent through the local build `/Users/krisbrown/workspaces/knowledge-islands/tools-ki/bin/ki agent launch|decide|wait|status`, run `ways-of-working`. Stay responsive. A new owner message steers; it never pre-empts running work. Kris: "if I send you a message, it doesn't preempt any work that you are already doing."
- Owner report, every time, in the `ki-delegation` Reporting shape: `#` banner with timestamp; `## What has been done`; `## What is in progress`, with "Outstanding - no action requested now"; `## Outstanding queries`, one `### TAG - title` each with Summary, Need from you and Recommendation; closing fenced `text` reply block. The full summary adds `## Decided` first. No output style, proxy shaping block or communication level shortens it. Records are linked by full identifier and absolute path; never "see earlier".
- Quiet level: timestamped one-or-two-line updates at each change of activity; outcomes only. Minimal visible tool use: short tool calls, prompts written to files out of sight, lookups delegated, no raw tool output in replies.
- Standing rules: never push without a request, except this thread's checkpoint commits and agents pushing under their `--rules`; never `--no-verify` or force-push; ask before publishing to a public registry; secrets stay in the secret store; the Techne Programme Hold applies; `Admin`, `Pillars` and `Resources` change only through the Enactment Process; stage by explicit path; British English and ASCII hyphens; touch no other thread's checkpoint; quote Kris verbatim in decisions; describe decisions in words, never by number.
- Master standing rules (2026-10-14): burn the roadmap down and create no new feature records; an agent may push other threads' committed work beneath ours when checks pass, naming the commits; a connection-critical change carries a tested restore path; a follow-up release stops and asks first.

Kris's way of working with a master thread and Project threads, background agents and the `ki` tools is defined in transferable skills and supported by a clear state-of-play view ([ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md), Initiative [knowledge-islands-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md)).

## Current state

- Mark: 2026-10-14T10:55:24Z. Kris: "Resume under current ki-pmo and ki-delegation since last mark: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner." Everything before the mark lives in [change-management-decisions](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-decisions.md), the thread folder, the records and Git.
- Thread folder: +/_THREADS/ways-of-working/ (tracked copies of the decisions log and every finished report, hand-copied under [KI-HARNESS-GOV-180](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-180-tracked-thread-decisions-home.md) until the launcher release ships `ki agent close`).
- ki-pmo read at f5da817b.
- Run `ways-of-working`; decisions log at `/Users/krisbrown/.local/state/ki/agents/ways-of-working/decisions.md`, bounded at its entry for this mark.
- Running: [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) pilot (in-progress, Now). The `pilot` agent finished at 11:56 BST on 2026-10-14: [KI-HARNESS-GOV-185](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-185-ki-pmo-extraction.md) is awaiting review on harness `main`; what remains on the record is the thread's own: the chezmoi deployment of the `ki-coordinator` output style, the fresh-session acceptance runs on each runtime, scoring and the hand to `ki-accept`.
- Done since the old mark: tools-ki 0.10.2 released; [KI-HARNESS-GOV-180](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-180-tracked-thread-decisions-home.md) done; [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md) delivered and awaiting review (merged, not released); thread logs copied into the thread folder; diagrams rebuilt; [KI-PRINCIPAL-ECO-014](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md) mostly done (this island, `tools-ki`, `ki-techne-harness` and `tools-techne` rewritten and pushed; the harness patch is saved at `/Users/krisbrown/.local/state/ki/agents/ways-of-working/eco014-work/harness-eco014.patch`; the run-folder move waits on the [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md) release); sizing design settled in [roadmap-sizing-and-burn-down](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/roadmap-sizing-and-burn-down.md); thread-model design written in [thread-types-and-durable-decisions](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/thread-types-and-durable-decisions.md) and banner design in [thread-banner-and-re-anchoring](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/thread-banner-and-re-anchoring.md).
- Interfaces: the Master (`state-of-play`, session `ki-principal-cf`) reaches this thread by direct SendMessage; this thread owns the thread-working model (how coordination threads work, their skills, hooks, the banner, re-bootstrap and inter-thread messaging) and everything to do with the decisions log.
- Standing rules from the Master: burn the roadmap down and create no new feature records unless Kris asks; an agent may push other threads' committed work beneath ours when checks pass, naming it; a connection-critical change carries a tested restore path; a follow-up release stops and asks first.

## Decisions made

- Every settled decision is recorded in words, with Kris quoted verbatim, in [change-management-decisions](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-decisions.md) and in the tracked decisions log at `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/decisions.md`; none lives only in the state folder.
- Since the old mark, Kris on 2026-10-14: "approved KI-HARNESS-GOV-180, KI-TOOL-KI-CLI-124 and KI-PRINCIPAL-ECO-014 to ready and delivery"; "ECO-013 pilot delivery granted"; "Interim tracked copies of the state-of-play and ways-of-working logs under +/_THREADS now"; sizing takes "all recommended answers, except snapshot dimensions", then "snapshot records both counts and size-weighted counts keyed by the status and horizon pair"; "Coordination banner uses REST/BUSY block letters; a conversational thread ends DONE; a coordination thread shows DONE only when its project closes and is tidied up"; "Thread is the owner-facing term; three thread types (normal/conversational or ad hoc, coordination, state-of-play) to be formally defined".

## Files touched

- Since the mark: this checkpoint and the thread folder copies (decisions log, `banner-letters`, `cli124-deliver`, `eco014-deliver`, `gov180-deliver`, `pilot`, `principal-tidy`, `release2`, `sizing-amend` and `thread-model` reports).

## Open questions

Open Needs queries, each with its tag; the full wording is in the named report under the thread folder.

- OMITTED-REPORTS (`principal-tidy`): may `territory-masters.report.md` and `baseline-fixes.report.md` be copied into `+/_THREADS/state-of-play/` as they are. Recommended: copy.
- HARNESS-NOW (`eco014-deliver`): commit the verified harness citation patch now, or wait. [KI-HARNESS-GOV-180](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-180-tracked-thread-decisions-home.md) is now done, so the wait has lapsed; recommended: commit.
- THREAD-TERMS, THREAD-TYPES, FIRST-TYPE, DECISION-CLASSES, ONE-LIST, DESIGN-HOME, DESIGN-GRADUATE (`thread-model`, design [thread-types-and-durable-decisions](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/thread-types-and-durable-decisions.md)): adopt the five terms; adopt the three thread types and replace the old names; the first type's name (recommended: conversational); the four decision classes set at the mark; the thread log as the Project's one decisions list; all design notes to `+/_DESIGN/<subject-slug>/`; design notes deleted on graduation.
- CLOSE-TIDY, REST-SCOPE, RESTORE-HOME, HOOK-RUNTIME, RESUME-COMPACT, SURFACE, REDX (`banner-letters`, design [thread-banner-and-re-anchoring](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/thread-banner-and-re-anchoring.md)): the four close-out tidy steps; open queries leave a thread at REST; the two homes for the restore-path rule; the environment-variable split telling Claude from Codex; whether the resume line also compacts and whether Kris runs the Zed test; the cross-session surface rule and the thread status line; the red-x recovery procedure.
- CLI124-RELEASE: release tools-ki with `ki agent close` and `reconcile` from [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md); a follow-up release asks first under the Master's standing rule.
- CLI124-ACCEPT: review and acceptance of [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md), awaiting review.
- CHECKPOINT-HOMES: where coordinating checkpoints and their thread folders live once the design-folder move is settled.
- NEXT-181: whether [KI-HARNESS-GOV-181](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-181-chrome-route-svg-export.md) (draft, next) is delivered next or deferred behind the pilot's remaining steps.
- Waiting on Kris: the banner mock and unit-model sanity check before any build; review of [KI-HARNESS-GOV-185](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-185-ki-pmo-extraction.md) and the pilot's acceptance scoring.
- Held: PAPERCLIP-REQ, until Wave F.
- Parked 2026-10-09: a gradual move from Obsidian-style to GitHub-flavoured Markdown, starting with a front-matter field declaring a note's flavour.

## Next step

1. [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md): deploy the `ki-coordinator` style through chezmoi, run the fresh-session acceptance tests on each runtime, score, and hand to `ki-accept`; review of [KI-HARNESS-GOV-185](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-185-ki-pmo-extraction.md).
2. [KI-PRINCIPAL-ECO-014](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md): commit the harness patch once HARNESS-NOW is answered; the run-folder move after the [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md) release.
3. [KI-HARNESS-GOV-181](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-181-chrome-route-svg-export.md) (next, deliver); the MARK-RULE record; [KI-HARNESS-GOV-179](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-179-diagram-html-commit-opt-in.md) (triage); [KI-HARNESS-GOV-182](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-182-wave-e-skill-renames.md) is done.
4. Notification records [KI-PRINCIPAL-ECO-012](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-012-notification-strategy-for-delegated-work.md), [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md) and [KI-HARNESS-GOV-175](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md) (draft, next; tools-ki first).
5. Waves A-D and F after the pilot's lessons; banner, re-anchoring, hook, RESTORE-PATH and messaging implementation after Kris's sanity check; the roadmap sizing build after the current Next records close.

Handoffs: the `chezmoi` and `legal-principal` threads rename `ki-work-housekeeping` themselves; four other threads' checkpoints mention old skill names and their own threads update them; each coordinating checkpoint replaces its `ki-delegation read at` line with `ki-pmo read at` at its next update.
