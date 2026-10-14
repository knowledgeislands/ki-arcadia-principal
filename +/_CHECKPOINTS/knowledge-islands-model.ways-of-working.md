---
type: ki-checkpoint
thread: knowledge-islands-model.ways-of-working
label: 'KI Model: ways-of-working'
state: active
created_at: 2026-10-09T20:58:00Z
updated_at: 2026-10-14T00:45:00Z
---

# knowledge-islands-model.ways-of-working

## Objective

Kris's way of working with a master thread and Project threads, background agents and the `ki` tools is defined in transferable skills and supported by a clear state-of-play view ([ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md), Initiative [knowledge-islands-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md)).

## Current state

- Active: Kris opened this thread ahead of the master's queue. Run `ways-of-working`; decisions log at `/Users/krisbrown/.local/state/ki/agents/ways-of-working/decisions.md`. Mark: 2026-10-13T04:03Z.
- Nothing running. Seven finished agent runs are reported: export-route, quotes-fix, quiet-tools, closed-threads, pilot-plan, skill-renames and noise-apply. Their findings are carried below.
- Design record: [change-management-decisions](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-decisions.md) and [change-management-report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-report.md). The tracked `+/_THREADS/<thread>/` home for decisions logs and agent reports is settled but not yet created.
- Export route: Archify's Chrome route is reused for SVG export, and the pinned-stylesheet extractor is dropped. Kris: "EXPORT-ROUTE - (a) reuse Archify's Chrome route; open the deliver record." [KI-HARNESS-GOV-181](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-181-chrome-route-svg-export.md) is captured in triage. A read-only trial exported the harness skill graph byte for byte equal to the committed SVG under Node and Bun, with no network and no install.
- Quotes: Kris approved restoring his quoted words from the session transcript. Restored in ki-principal `b37a91f` (on origin), tools-ki `71aaef7` (on origin) and harness `49fde031` (unpushed). A broken splice in the design decisions file was repaired in `1bc8c43` (on origin).
- Quiet tools: the quiet-level tool-work sentence is restored in chezmoi `f2ced1e` (on origin) and the coordinator tool-call rule is in the `ki-delegation` standard, harness `71d7a0fd` (unpushed).
- Closed threads: the `chezmoi` and `mac-studio-bootstrap` threads are not closed. Kris: "No, they're not closed, they're both being worked on." Their run logs stay, to be reconciled only from their own threads when they close. The report was corrected (`b6d4efa`, on origin).
- Pilot: [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) is planned to the Ready shape (`6c39ad5`, on origin) and stays `draft` until Kris approves the plan. Two checks are resolved: `claude -p` runs hooks, and a project-level `outputStyle` overrides the user-level one (binary-derived evidence; the live check is in Verify). Kris: "review before grant".
- Skill renames (Wave E): [KI-HARNESS-GOV-182](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-182-wave-e-skill-renames.md) is `awaiting-review`. `ki-design-loop` is now `ki-pmo-design`, `ki-work-housekeeping` is now `ki-work-recurring`, and `ki-pulse` moved to `skills/acquire/`. `ki-pmo` is left for the pilot. Harness tests pass (1112); tools-ki `f6d65d8` is pushed (1144 tests pass); ki-principal `b203b70` is on origin. Harness commits are unpushed (see handoff below).
- Noise: Headroom user-message compression is switched off in the chezmoi source (`881d529`, on origin). The running proxy needs a restart to pick it up. The coordinator reminder hook line now carries the cadence and form (harness `12c791b7`, on origin); the Codex instructions file was emptied of a stale Headroom block. Kris: "PROMPT-PROTECT - (a), plus the two (c) rules in ki-delegation." The two rules are: log an owner decision in the turn it arrives, and verify quotations against the transcript file, not from memory.
- Coordinator style: the reporting standard states that an owner report is a complete deliverable under every output style. A harness-shipped coordinator output style is in the pilot's scope, selected per repository.
- Chezmoi: `main` is level with origin, having pushed quiet-tools `f2ced1e` and carrying other-session commits `264341f`, `f62f1f2`, `fba0911`, `881d529` and `647e137`.
- Kris will restart Headroom now that the chain has finished. This applies the user-message compression setting and unblocks pilot acceptance tests 2 and 3.
- Earlier settled answers (2026-10-13): decisions are written as what they were, never by number; `ki-pmo` owns the coordinator hook, which is declared by the repository's `ki-pmo` declaration and not by checkpoint location; the design loop is `ki-pmo-design`; `ki-pulse` is kept; `ki-recap` hands coordinating threads to `ki-pmo`'s forms; repositories may opt in to committing diagram HTML; design working material goes to `+/_DESIGN/<subject-slug>/`; the Claude fast model is `claude-haiku-5-5`; the `ki territory` wording is kept; `--member` is added to the design; the Paperclip requirement is held until Wave F; notifications use a dedicated send-only bot and Server-Sent Events with browser notifications; tokens live in the macOS Keychain under the KI secret store; remote scope is KI and personal by default.
- Parked since 2026-10-09: a gradual move from Obsidian-style to GitHub-flavoured Markdown, starting with a front-matter field declaring a note's flavour.

## Decisions made

- Thread rules get their own skill, `ki-pmo`, adopted by every principal knowledge base; every repository adopts the roadmap skill. The design is reviewed as one change-management model.
- A handoff to another thread stays under Needs as one current message until Kris says it is done.
- Coordinating threads coordinate. Substantive reasoning goes to background agents, and coordinators may run on a faster, lower-reasoning model.
- Worktrees and run-folder retention are in `ki-delegation`.
- The master thread owns cross-project priorities; this thread works only this Project's records. The master is under a burn-down focus: no new feature records, and only blockers, defects or items Kris asks for are captured.
- Marks are per thread, kept in the checkpoint. Kris caps active Project threads at three plus the master.
- Coordinator responsiveness is a fundamental requirement: no substantive work in the thread, and an owner message never pre-empts work in flight. Kris: "if I send you a message, it doesn't preempt any work that you are already doing."
- The coordinator reminder hook is built for both runtimes. Kris: "A repository that doesn't delegate then never gets the hook, and removing ki-pmo disables it."
- Owner reports use the three-section shape with tagged queries and a closing reply block, with the full summary form. The canonical owner is `ki-delegation`'s Reporting section.
- Decisions must materialise in repository records, not only local state. Local state is runtime-only. Kris: "if the state folder is lost, you shouldn't lose any knowledge."
- Quiet-tool rule: coordinators keep tool calls short and do not paste raw output; this is in `ki-delegation` and the chezmoi quiet level.
- Pilot: queued for planning after the chain, reviewed before any delivery grant.
- Owner words for a handoff about Chrome-route export: the pinned-stylesheet extractor is dropped; the deliver record is against the Chrome route.

## Files touched

- ki-principal: `Streams/Projects/ways-of-working/design/change-management-decisions.md` and `change-management-report.md` (`74dc1ff`, `1bc8c43`, `b37a91f`, `b6d4efa`); `Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md` (`6c39ad5`, `9b45c0d`); `Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md`; this checkpoint.
- ki-agentic-harness: [KI-HARNESS-GOV-181](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-181-chrome-route-svg-export.md) (`e227ad5c`, `e83d7b13`, on origin); [KI-HARNESS-GOV-182](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-182-wave-e-skill-renames.md) (unpushed); [KI-HARNESS-GOV-179](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-179-diagram-html-commit-opt-in.md), [KI-HARNESS-GOV-180](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-180-tracked-thread-decisions-home.md) and [KI-HARNESS-GOV-177](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-177-browser-free-svg-extractor.md); `skills/governance/ki-delegation/references/standards-background-runs.md` (`71d7a0fd`, unpushed); `hooks/coordinator-reminder.sh` (`12c791b7`, on origin).
- tools-ki: `docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md` (`71aaef7`, on origin); bootstrap list (`f6d65d8`, on origin). Related: [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md).
- chezmoi: `dot_claude/private_communication.md`, `dot_codex/private_AGENTS.md.tmpl` (`f2ced1e`); Headroom profile (`881d529`).
- Untouched and not ours: harness `+/diagrams/` and chezmoi `dot_config/rig/conf.d/private_56-firewall.toml` (both untracked); the other session's uncommitted harness skill-graph and rubric files.

## Open questions

- ADOPT-181: Adopt [KI-HARNESS-GOV-181](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-181-chrome-route-svg-export.md) from triage to `draft`? Recommendation: adopt at `next`, `kind: deliver`, so `ki-plan` can choose between importing Archify's module and porting a minimal client.
- PUSH-HARNESS-MAIN: harness `main` is ten commits ahead of origin. Eight are ours (`3beced0a` to `c44623ee`, and `71d7a0fd`); two are from another session: `49fde031` and `df08e1e5` (the skill map). Kris: "wait for the other session; push ours once its commits land." Should `main` be pushed as it stands, publishing the other session's commits too, or wait for that session to push? Recommendation: keep the hold.
- HOUSEKEEPING-DECLS: five repositories still declare `[skills.ki-work-housekeeping]`: legal-principal, apps-midnight.ninja, apps-rig.midnight.ninja, apps-tower.midnight.ninja, and the chezmoi source. Rename in one sweep now, or in the naming wave?
- KI-RELEASE: installed `ki` 0.10.1 still requires `ki-design-loop` in its bootstrap list until a tools-ki release. Release now?
- PRINCIPAL-ENACT: protected-zone references to the old names need enactment: `Admin/Governance/Conventions/Streams Conventions/Streams Conventions.md:26`, `Admin/Governance/Decisions/GDR-KI-PRINCIPAL-005-the-roadmap-model.md:34`, `Admin/Operations/Processes/Enactment Process.md:25`, `Pillars/Philosophy/Model/Conventions/Structure/Structure.md:140`, `Pillars/Philosophy/Model/Processes/Enactment Process/Enactment Process.md:46`; checkpoints `knowledge-islands-model.command-centre.md:42`, `platform-foundations.baseline-rollout.md:39` and `techne.agent-host.md:43`. The website skills-by-outcome guide also names the old skills. Enact now as one bounded change?
- PLAN-APPROVE: approve [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) as written (approve, or change with a note)? Approval lets `ki-plan` set it Ready; delivery is then granted separately. Recommendation: approve.
- CAPITALS: which Capitals declare `ki-pmo` in the pilot? (a) this island and the harness only, with the other territories waiting for Wave F; or (b) every Capital now by a one-line handoff. Recommendation: (a).
- STYLE-NAME: name of the shipped coordinator output style. The plan defaults to `ki-coordinator`; say if you want another name.
- Held: PAPERCLIP-REQ, until Wave F.

## Next step

1. Kris answers the open questions above; the plan goes Ready only on PLAN-APPROVE.
2. Kris restarts Headroom, now that the chain has finished, so the user-message compression setting applies.
3. Once the plan is approved and delivery granted, the pilot runs as a detached background agent from this thread, with acceptance tests 2 and 3 after the restart.
4. Harness `main` push waits on PUSH-HARNESS-MAIN.

Pending handoff: `ki-agentic-harness`, this machine (darwin), branch `main`, ten commits ahead of `origin/main`, unpushed and held for PUSH-HARNESS-MAIN. All other repositories in this thread are level with origin.
