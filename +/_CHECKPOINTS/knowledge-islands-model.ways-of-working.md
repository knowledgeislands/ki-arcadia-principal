---
type: ki-checkpoint
thread: knowledge-islands-model.ways-of-working
label: 'KI Model: ways-of-working'
state: active
created_at: 2026-10-09T20:58:00Z
updated_at: 2026-10-14T09:12:19Z
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

- Mark: 2026-10-14T09:12:19Z, the carry-forward point. Kris: "everything that you want to carry forwards, you can create a mark and then state it so that it's clear what's that, and basically the checkpoint should only include the work in progress and going forwards." Everything before the mark lives in [change-management-decisions](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-decisions.md), the records and Git; the decisions log is bounded at its CHECKPOINT-MARK entry.
- Run `ways-of-working`; decisions log at `/Users/krisbrown/.local/state/ki/agents/ways-of-working/decisions.md`. `ki-delegation` last read 2026-10-14 (harness `main`).
- Running: `harness-push` integrates and pushes the harness `main` stack, naming other threads' commits. `banner-mock` produces the banner mocks, the unit model, re-anchoring, the hook fix, RESTORE-PATH placement and the messaging interface, in [thread-banner-and-re-anchoring](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/thread-banner-and-re-anchoring.md). `sizing-design` writes one design record for roadmap sizing and burn-down, [roadmap-sizing-and-burn-down](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/roadmap-sizing-and-burn-down.md).
- Queued after `harness-push`: `mark-tidy` (MARK-RULE captured as a harness deliver record at next; delete the diagram scratch, rebuild the stale skill-graph and skill-map HTML, keep `+/diagrams/` visible); `apps-sweep` (`ki-work-housekeeping` to `ki-work-recurring` in apps-midnight.ninja, apps-rig.midnight.ninja and apps-tower.midnight.ninja); `principal-enact` (the five governance notes as one bounded change); `triage-plan` (fix the plan sections of [KI-HARNESS-GOV-181](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-181-chrome-route-svg-export.md); plan [KI-HARNESS-GOV-180](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-180-tracked-thread-decisions-home.md), [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md) and [KI-PRINCIPAL-ECO-014](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md) to Ready); `ki-release` (one tools-ki patch release with the renames and `KI_AGENT_RUN`).
- Queued after `banner-mock`: `banner-amend` (BANNER-MARK confirmed: mark first, then re-output; a `/compact` resume-line option and its test; Zed visibility of cross-session traffic; red-x thread recovery; a backend reply is not visible progress).
- Interfaces: the Master (`state-of-play`, session `ki-principal-cf`) reaches this thread by direct SendMessage; this thread owns the thread-working model (how coordination threads work, their skills, hooks, the banner, re-bootstrap and inter-thread messaging).
- Standing rules from the Master: burn the roadmap down and create no new feature records unless Kris asks; an agent may push other threads' committed work beneath ours when checks pass, naming it; a connection-critical change carries a tested restore path; a follow-up release stops and asks first.

## Decisions made

- Every settled decision is recorded in words, with Kris quoted verbatim, in [change-management-decisions](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-decisions.md); none lives only here or in the state folder.

## Files touched

- Since the mark: nothing. Earlier work is in Git and in the records linked above.

## Open questions

- Waiting on Kris: the banner mock and unit-model sanity check before any build; the pilot delivery grant for [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) (Ready) once the harness push lands; review of the [KI-HARNESS-GOV-180](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-180-tracked-thread-decisions-home.md), [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md) and [KI-PRINCIPAL-ECO-014](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md) plans, then delivery; review of the sizing design.
- Held: PAPERCLIP-REQ, until Wave F.
- Parked 2026-10-09: a gradual move from Obsidian-style to GitHub-flavoured Markdown, starting with a front-matter field declaring a note's flavour.

## Next step

1. [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) pilot (Ready; `ki-pmo`, the `ki-coordinator` style, this island and the harness only), on Kris's grant.
2. [KI-HARNESS-GOV-181](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-181-chrome-route-svg-export.md) (next, deliver); [KI-HARNESS-GOV-182](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-182-wave-e-skill-renames.md) (done once pushed); the MARK-RULE record; [KI-HARNESS-GOV-179](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-179-diagram-html-commit-opt-in.md) (triage).
3. Notification records [KI-PRINCIPAL-ECO-012](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-012-notification-strategy-for-delegated-work.md), [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md) and [KI-HARNESS-GOV-175](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md) (draft, next; tools-ki first).
4. Waves A-D and F after the pilot's lessons; banner, re-anchoring, hook, RESTORE-PATH and messaging implementation after Kris's sanity check; the roadmap sizing build after the current Next records close.

Handoffs: the `chezmoi` and `legal-principal` threads rename `ki-work-housekeeping` themselves; four other threads' checkpoints mention old skill names and their own threads update them.
