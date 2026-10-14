---
type: ki-checkpoint
thread: knowledge-islands-model.ways-of-working
label: 'KI Model: ways-of-working'
state: active
created_at: 2026-10-09T20:58:00Z
updated_at: 2026-10-14T13:58:48Z
---

# knowledge-islands-model.ways-of-working

## Objective

**Thread working rules.** Re-read this block after any compaction. The Master thread asked every thread to carry it, on Kris's instruction, after threads lost the owner report and showed tool chatter once compacted.

- Role: coordinator only. Every unit of work goes to a detached background agent through the local build `/Users/krisbrown/workspaces/knowledge-islands/tools-ki/bin/ki agent launch|decide|wait|status`, run `ways-of-working`. Stay responsive. A new owner message steers; it never pre-empts running work. Kris: "if I send you a message, it doesn't preempt any work that you are already doing."
- Owner report, every time, in the `ki-delegation` Reporting shape: `#` banner with timestamp; `## What has been done`; `## What is in progress`, with "Outstanding - no action requested now"; `## Outstanding queries`, one `### TAG - title` each with Summary, Need from you and Recommendation; closing fenced `text` reply block with one prefilled recommended instruction per query, then the `ki-pmo` banner (REST or BUSY frame, lines beneath, resume line) rendered the same in every thread; Kris, 2026-10-14: the reply block "must carry the recommended answer on each line, not every option". The full summary adds `## Decided` first. No output style, proxy shaping block or communication level shortens it. Records are linked by full identifier and absolute path; never "see earlier".
- Quiet level: timestamped one-or-two-line updates at each change of activity; outcomes only. Minimal visible tool use: short tool calls, prompts written to files out of sight, lookups delegated, no raw tool output in replies.
- Standing rules: never push without a request, except this thread's checkpoint commits, its `+/_THREADS/ways-of-working/` folder (committed and pushed at every report and resting point; Kris, 2026-10-14: "threads need to know that they need to commit their work under +/_THREAD/") and agents pushing under their `--rules`; never `--no-verify` or force-push; ask before publishing to a public registry; secrets stay in the secret store; the Techne Programme Hold applies; `Admin`, `Pillars` and `Resources` change only through the Enactment Process; stage by explicit path; British English and ASCII hyphens; touch no other thread's checkpoint; quote Kris verbatim in decisions; describe decisions in words, never by number.
- Master standing rules (2026-10-14): burn the roadmap down and create no new feature records; an agent may push other threads' committed work beneath ours when checks pass, naming the commits; a connection-critical change carries a tested restore path; a follow-up release stops and asks first.

Kris's way of working with a master thread and Project threads, background agents and the `ki` tools is defined in transferable skills and supported by a clear state-of-play view ([ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md), Initiative [knowledge-islands-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md)).

## Current state

- Mark: 2026-10-14T13:54Z (14:54 BST). Kris: "Bootstrap as the ways-of-working project thread under ki-pmo." Everything before the mark lives in [change-management-decisions](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-decisions.md), the thread folder, the records and Git.
- Thread folder: `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/` (tracked decisions log and every finished report; committed and pushed by the thread at every report and resting point).
- ki-pmo read at 0aa8248c.
- Run `ways-of-working`; the tracked decisions log `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/decisions.md` is the live log and runs ahead of the state copy at `/Users/krisbrown/.local/state/ki/agents/ways-of-working/decisions.md`, which stops at the entry before Kris's banner approval of 2026-10-14 ~12:05 BST.
- Done since the 10:55Z mark:
  - Banner made normative in `ki-pmo`, reply block prefilled in `ki-delegation`, frame test added, hook and `ki-coordinator` style updated; KI-HARNESS-GOV-186 (done, pruned) closed (`banner-build`, `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/banner-build.report.md`).
  - Mark struck at 10:55Z and nine reports copied (`mark3`, `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/mark3.report.md`).
  - [KI-HARNESS-GOV-185](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-185-ki-pmo-extraction.md) accepted as done; the [KI-PRINCIPAL-ECO-014](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md) harness citation rewrite committed and pushed; the pilot worktree removed (`gov185-tidy`, `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/gov185-tidy.report.md`).
  - Roadmap burn-down: harness open records 9 to 4, principal 5 to 4; KI-HARNESS-GOV-168, 171, 179, 183 and 184 closed and pruned; KI-PRINCIPAL-ECO-012 parked into the [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) Project note and pruned; [KI-HARNESS-OPS-005](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md) rescoped and awaiting review (`burn-down`, `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/burn-down.report.md`).
  - [KI-HARNESS-GOV-181](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-181-chrome-route-svg-export.md) delivered (SVG export through Archify's Chrome route) and awaiting review, pushed at `e205e81f` (`gov181-deliver`, `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/gov181-deliver.report.md`).
  - [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md) accepted as done with the thread-home change.
  - `ki-coordinator` output-style deployment handed to Rig: chezmoi; the style is live in Claude Code sessions.
  - Kris on the pilot's acceptance runs, 2026-10-14: "PILOT-TESTS - done I think".
- Running:
  - `cli124-fix`: tools-ki 0.10.3 release with `ki agent close` and `reconcile` (no npm); depends on nothing.
  - `eco014-close`: closes [KI-PRINCIPAL-ECO-014](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md) with the run-folder move; held until `cli124-fix` releases 0.10.3; tells the Master when ECO-014 closes so KI-TOOL-KI-CLI-115 can be pruned.
  - `thread-model-enact`: enacts the thread model and banner amendments under [KI-HARNESS-GOV-187](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-187-thread-model-and-banner.md) (in-progress) in `ki-pmo`, `ki-delegation`, the hook line and the output style; its wait on `gov185-tidy` has cleared.
- Interfaces: the Master (`state-of-play`, now session `ki-principal-c9`) reaches this thread by direct SendMessage; this thread owns the thread-working model (how coordination threads work, their skills, hooks, the banner, re-bootstrap and inter-thread messaging) and everything to do with the decisions log.
- Standing rules from the Master: burn the roadmap down and create no new feature records unless Kris asks; an agent may push other threads' committed work beneath ours when checks pass, naming it; a connection-critical change carries a tested restore path; a follow-up release stops and asks first.

## Decisions made

- Every settled decision is recorded in words, with Kris quoted verbatim, in [change-management-decisions](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-decisions.md) and in the tracked decisions log `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/decisions.md`.
- Since the 10:55Z mark, Kris on 2026-10-14:
  - ~12:05 BST: the block-letter banner as the Acquire thread rendered it is right; every re-bootstrapping thread renders it the same way; the reply block carries the recommended answer on each line, not every option.
  - ~12:50 BST: the Claude-specific deployment folder for the output style "makes sense to me ... this is answered".
  - ~13:50 BST, all as recommended: accept [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md) with the thread-home change then release tools-ki 0.10.3 (no npm); accept [KI-HARNESS-GOV-185](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-185-ki-pmo-extraction.md); leave the two state-of-play reports out; commit the harness citation rewrite now; adopt thread, session and chat terms; adopt the three thread types conversational, coordination and state-of-play; adopt the four decision classes and the homeless-standalone rule; the thread log is the Project's one decisions list; design notes move to `+/_DESIGN/<subject>/` and are deleted on graduation; the four close-out steps; open queries do not make a thread BUSY; the restore-path rule lives in `ki-delegation` and `ki-engineering`; the hook runtime split; the resume line with an optional compact paste first, Kris runs the Zed test; the surfaces rule and the `ki agent status` follow-on; red-x recovery; keep the close gate strict with the reconciled waiver; start [KI-HARNESS-GOV-181](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-181-chrome-route-svg-export.md) now; keep the defaults.
  - Relayed by the Master: "RC-ALL: approve all; ways-of-working applies the harness part" and "RC-OPS-005: rescope now".
  - On the banner: "Banner is great, but it needs the date it was issued to be more prominent than the mark"; "the running should each be a line with the running: prefix"; "Use ISO-8601 UTC for the issued too and fix the border".
  - "PILOT-TESTS - done I think".
  - "threads need to know that they need to commit their work under +/_THREAD/".

## Files touched

- Since the mark: this checkpoint and the thread folder reports `burn-down` and `gov181-deliver`.

## Open questions

Reconciled at the 13:54Z mark against Kris's words of 2026-10-14. Answered: OMITTED-REPORTS ("leave the two state-of-play reports out"); HARNESS-NOW ("commit the harness citation rewrite now", done); THREAD-TERMS, THREAD-TYPES, FIRST-TYPE, DECISION-CLASSES, ONE-LIST, DESIGN-HOME, DESIGN-GRADUATE (adopted as recommended, being enacted by `thread-model-enact`); CLOSE-TIDY, REST-SCOPE, RESTORE-HOME, HOOK-RUNTIME, RESUME-COMPACT, SURFACE, REDX (approved as recommended); CLI124-RELEASE and CLI124-ACCEPT ("accept KI-TOOL-KI-CLI-124 with the change ... then release tools-ki 0.10.3 (no npm)"); NEXT-181 ("start KI-HARNESS-GOV-181 now", delivered); GOV185-ACCEPT (accepted); the banner sanity check (approved ~12:05 BST). Superseded: MARK3-TAGS (`mark3`), since three of its four reconstructed tags are now answered in Kris's words.

- CHECKPOINT-HOMES (carried, no report source): where coordinating checkpoints and their thread folders live now the design-folder move is settled. Recommended: checkpoints stay in `+/_CHECKPOINTS/`, thread folders in `+/_THREADS/<run>/`, matching the commit rule Kris set on 2026-10-14.
- ACCEPT-181 (`gov181-deliver`): accept [KI-HARNESS-GOV-181](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-181-chrome-route-svg-export.md) as done on its review packet. Recommended: accept.
- PUSH-187 (`gov181-deliver`): the `gov181-deliver` push carried another agent's `e6ed2254 docs(roadmap): reserve KI-HARNESS-GOV-187` to `origin/main`. Recommended: fine as it stands.
- Kris's own: the Zed test of the resume line.
- Held: PAPERCLIP-REQ, until Wave F.
- Parked 2026-10-09: a gradual move from Obsidian-style to GitHub-flavoured Markdown, starting with a front-matter field declaring a note's flavour.

## Next step

1. Watch `cli124-fix`, `eco014-close` and `thread-model-enact` to finish; commit and push the thread folder at each report.
2. [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md): score the acceptance runs Kris called done and hand the record to `ki-accept`.
3. On Kris's answer, accept [KI-HARNESS-GOV-181](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-181-chrome-route-svg-export.md) and [KI-HARNESS-OPS-005](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md) through `ki-accept`; prune [KI-HARNESS-GOV-185](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-185-ki-pmo-extraction.md) (done, unpruned).
4. Notification records [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md) and [KI-HARNESS-GOV-175](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md) (draft, next; tools-ki first).
5. Waves A-D and F after the pilot's lessons; re-anchoring, thread status line, inbox channel and messaging implementation; the roadmap sizing build after the current Next records close.

Handoffs: the `chezmoi` and `legal-principal` threads rename `ki-work-housekeeping` themselves; four other threads' checkpoints mention old skill names and their own threads update them; each coordinating checkpoint replaces its `ki-delegation read at` line with `ki-pmo read at` at its next update.
