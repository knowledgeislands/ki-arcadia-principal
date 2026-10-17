# Decisions

## Decision 1 (2026-10-13)

- QUEUE: yes - open the ways-of-working Project thread now, ahead of the master's queue order.

## Decision 2 (2026-10-13)

- WT-RULE: yes - add to ki-delegation the background-run worktree location (~/.local/state/ki/agents/<run>/worktrees/<repo>, removed with git worktree remove and branch deleted once merged, before DONE) and run-folder retention (archive or delete the run folder once the thread or run closes and its decisions are consolidated into durable owners). No new record.

## Decision 3 (2026-10-13)

- COORD-MODEL: yes in principle - the main thread should be a coordinator, not do the reasoning. Coordinating threads run lean and hand heavy reasoning to background agents; model-purpose detail goes to ki-tokenomics.

## Decision 4 (2026-10-13)

- SPLIT/SKILL-REVIEW: yes - a separate skill for the threads unit, working name ki-pmo (Project Management Office) rather than ki-threads. Fold into one structural review of the change-management model: checkpoints, sessions, recoverability and where the mark belongs (possibly ki-checkpoint becomes the threads/sessions skill); the checkpoint opener; Initiative and Project definitions, with goals at every level (Initiative direction, Project outcome, record goal), possibly as a bounded list; and ki territory. The current structure evolved rather than was planned; aim for something simpler to understand.

## Decision 5 (2026-10-13)

- Review method and scope: run ki-design-loop, but the review covers change management as a whole including ki-design-loop itself; decide the new structure given how it has evolved - changes are welcome. Reviews use higher-reasoning models on both runtimes, Fable (Claude) and Astra (ChatGPT/Codex), with a higher-reasoning consolidation merging the two. The coordinating thread, whether Claude or ChatGPT based, must be able to dispatch to both and amalgamate the results. command-centre's KI-model scope is absorbed into this design; command-centre keeps cross-territory alignment and the state-of-play view. Applicability: every principal knowledge base adopts the PMO skill; every repository adopts the roadmap skill.

## Decision 6 (2026-10-13)

- Handoffs to other threads: a handoff counts as done only when Kris expressly says so. Until then the thread keeps it under Needs, revised into one current consolidated message, rather than issuing numbered second messages.

## Decision 7 (2026-10-13)

- PLAN and AGENT-MODEL: yes. Add model and effort options to ki agent directly, no tools-ki record, no release. The design also assesses the ki command surface - how it has evolved recently, especially at sub-command level (ki agent, ki repo, ki territory) - and naming, including whether 'territory' is too much of a mouthful versus a shorter word that better represents the concept; short forms like repo, not repository.

## Decision 8 (2026-10-13)

- COORD-WORDING folds into PLAN: the design looks strongly at the default session or thread model. Kris leans to a lower, less-reasoning model handling things in a mechanical handoff fashion with reasoning deferred to background agents and helpers, possibly as the general approach - or the right balance of model level and reasoning level. The ki-tokenomics coordination wording stands until the design decides.

## Decision 9 (2026-10-13)

- PUSH done by Kris; MASTER-SYNC handed off by Kris.

## Decision 10 (2026-10-13)

- Models and environment: the design loop (or its successor) and ki-pmo must make use of the highest-level models available - today Fable (Claude) and Astra (Codex) - and every merged report must state which models and runtimes were considered and used for the reviews and the merge. They must be mindful of what the running environment offers: in future this may run in Paperclip, where agents may not have both models or both agentic systems; ideally they should, so having both becomes a stated requirement for Paperclip, and the loop says how it degrades when only one is available. Naming: Kris does not like 'ki-shape' - a skill name must convey its purpose at a glance; the review's naming must meet that test. For the merge: include a 'Models and environment' section in the report and treat these points as owner input to the proposed model.

## Decision 11 (2026-10-13)

- Coordinator responsiveness: Kris struggles with main threads not delegating and not staying responsive, so his messages interrupt work that should be happening in background agents. Make this explicit and hard, so Kris never has to remind a dispatch thread: tighten ki-delegation's Coordinator responsiveness into checkable rules now, and carry it into the ki-pmo design.

## Decision 12 (2026-10-13)

- Handoff from another thread, accepted by Kris: assess principal-to-territory command dispatch (assessment only, no changes) - see dispatch-assess prompt; outcome feeds the ki command-surface part of the design.

## Decision 13 (2026-10-13)

- Notification strategy (feedback from Tower: regular maintenance thread, accepted by Kris): capture one bounded roadmap item and return a recommended approach and implementation plan for KI-wide notifications for delegated work. Telegram preferred; coordinating-thread updates first; Slack or others configurable; platform-native optional, not default; possibly the local Observatory instance as a channel (for example WebRTC). Repositories stay authoritative; notifications summarise and link back. Do not implement integrations yet. Interim: chat updates only; local-host notifications are disabled.

## Decision 14 (2026-10-13)

- Reporting format (Kris, verbatim text in report-format.md and in this session transcript): standardise owner reports through the ways-of-working process. Three sections in order: 1 What has been done (outcomes, material failures, corrections, limitations); 2 What is in progress (running, waiting, owner or dependency; 'Nothing running' when true; 'Outstanding - no action requested now' items here, distinguishing agent work, receiver-owned work, verification limitations and retained decisions); 3 Outstanding queries, each headed '<stable tag> - <plain title>' with Summary, Need you, Recommendation, no per-query 'Your next step'; finish with one fenced text block of every query heading and recommended instruction, same tags and order, a suggested reply not approval. Every ID or named record reference is a verified link with full identifier text (absolute local path preferred, else canonical remote); never invent a link; state unresolved targets. Reconcile into the canonical governance owner, removing duplicate or conflicting instructions. Supersedes the Done/Failed/Needs you report shape wherever it is defined.

## Decision 15 (2026-10-13)

- Responsiveness is a fundamental requirement (Kris, 2026-10-13): threads keep doing work directly and every owner message pre-empts it, costing Kris time and tokens. Make it very explicit in every change from the ways-of-working design (process, PMO). Kris's message to threads, verbatim: 'It's imperative that you do not do the work directly and that you delegate that work to subagents so that you remain responsive. And if I send you a message, it doesn't preempt any work that you are already doing. This is a fundamental requirement of the delegation capability.' Kris will return soon to bottom this out.

## Decision 16 (2026-10-13)

- COORD-HOOK: (a) - build the coordinator reminder hook for both runtimes (Claude Code and Codex) now, before the pilot opens, and get it trialled.

## Decision 17 (2026-10-13)

- Kris's answers to the outstanding queries, returned verbatim: COORD-HOOK (a) both runtimes before the pilot opens, as the pilot's first task. PUSH-CKPT push (done). TRAILER name the model that made the commit; update briefs. PILOT-SCOPE (a) ki-pmo move only, with the rebuild-from-checkpoint test. COORD-DEFAULT (a) standard at low effort; trial fast at low effort against the five tests. BINDINGS (a) user-level ki setting per runtime; Codex trial GPT-6 Luna low; Claude fast model left as '<your pick>' - not yet chosen. AIMS (a) optional list of 3-5 aims under Direction. THREAD-SCOPE (a) remove the estate-area exception; fold rig.chezmoi into the master. NAMES (c) ki-pmo, ki-work-recurring, ki-design-loop -> ki-blueprint. TERRITORY-WORD (a) keep ki territory. VIEWS (a) ki territory projects|threads. MEMBER-SEL add --member to the design, matching registry key and repository URL. PAPERCLIP-REQ hold until Wave F. HOME (a) keep KI-PRINCIPAL-ECO-012 in ki-principal; hand deliveries to each repository. BOT-ID (a) dedicated send-only bot. TOKEN-HOME (a) macOS Keychain under the KI secret store. QUIET (a) failed, blocked, needs-owner. OBS-CHANNEL (a) Server-Sent Events plus browser notifications. REMOTE-SCOPE (a) KI and personal by default; others opt in. ADOPT adopt KI-PRINCIPAL-ECO-012 to draft through ki-next; hand phase 1 to tools-ki and the harness now.

## Decision 18 (2026-10-13)

- FULL-SUMMARY adopted (Kris, verbatim): 'adopt proposed (H1 banner; ## Decided, What has been done, What is in progress, Outstanding queries; every query in full, never "see earlier"; closing reply block), in ki-delegation owner-report standard and ki-pmo design, queued coord-hook and trailer.' Kris supplied another thread's summary as an example it got mostly right, to be reflected in the definition (private legal content: derive the shape only, never copy content). Kris also suggests something like /ki-recap for this kind of thread - assess.

## Decision 19 (2026-10-13)

- Skill dependencies (Kris, verbatim): 'where a skill relies on another, its imperative that that mapping is clear in the frontmatter and that we have the skill graph capable of illustrating this. And I'd like that skill graph to be done using archify not graphviz or whatever it was before ... and the skill graph lives in the docs in the harness.'

## Decision 20 (2026-10-13)

- archify (Kris): 'archify is a skill for drawing diagrams and its excellent' - for the skill-graph agent: find and use the archify skill (check installed skills, plugins and territory harnesses) to draw the harness skill graph.

## Decision 21 (2026-10-13)

- Kris's answers (verbatim): BINDINGS - Claude fast model: claude-haiku-5-5 (Claude Haiku 5.5). BLUEPRINT-FIT - Name for ki-design-loop: ki-pmo-review, and how does it differ from ki-pmo (question open). DESIGN-AREA - Keep design area, ki-design-system and ki-design-inspiration. SUMMARY-ENTRY - (b) /ki-pmo entry point once KI-PRINCIPAL-ECO-013 creates ki-pmo; build nothing now. RECV-ADOPT - Adopt KI-TOOL-KI-CLI-123 and KI-HARNESS-GOV-175 draft next deliver; tools-ki first. ADOPT-176 - Adopt KI-HARNESS-GOV-176 and take it through ki-accept. RECYCLE - Keep roadmap-cycles drawing removed. PLAYWRIGHT - question: why this dependency, how is playwright used? (open). SHAPE-21 - Keep KI-SHAPE-21 warning. DEFAULTS - Keep defaults. PUSH-THREAD - Standing permission: push the thread's checkpoint commits fast-forward as made. Plus three discussions raised for design (see Decision 22).

## Decision 22 (2026-10-13)

- Discussions raised by Kris (full text in the session transcript, message containing 'Discussion: durable knowledge'): (1) Durable knowledge: decisions in ~/.local/state/.../decisions.md are part of the conversation and should materialise in repository records, otherwise knowledge is lost if work moves; are decisions truncated at the mark like work done? Conversely, not everything in the repository is durable knowledge (the design folder's brief, reviews, report, decisions); and records such as KI-HARNESS-GOV-176 cite 'Decisions 19 and 20 of the ways-of-working run', which needs local state to understand. (2) Responsiveness hook: is chezmoi data the right enable/disable mechanism? Should tooling handle it - e.g. installing the skill requires the hook; what if nothing uses it; how is it disabled; does it make sense in a project without delegation; is it a delegation enabler or a checkpoint concern (detection by +/_CHECKPOINTS location); would an audit or CONFORM of the relevant skill pick it up? (3) Skill names: show an Archify graph of the skills and how they interrelate, as part of reviewing current and proposed naming.

## Decision 23 (2026-10-13)

- Kris: "STATE-CLEANUP - Yes; queue after durability: ki agent close with reconcile gate, plus sweep of existing run folders." "PLAYWRIGHT-DEP - (a) build and compare a browser-free extractor; adopt only if output matches, else (b)."

## Decision 24 (2026-10-13)

- Kris, verbatim:

"DECISION-HOME - (a) log is a working copy, written into durable homes at every mark and before the run closes... In some ways that's okay, but also I think we have to understand the log isn't that useful. What's useful Or certainly it's short-lived. Again, I'm not sure why it can't be under a working area within the relevant repository. I think a key thing here should be that if the state folder is lost, you shouldn't lose any knowledge, or at least you should be able to recover from it."

"CITE-RULE - I think we go a bit further. I actually think we should not necessarily need to put the decision number anywhere. It should be written about what the decision was or is."

"DESIGN-RETENTION - I guess if this is truly a working area, it should be stored in the `+` working area under some kind of design heading in terms of then the durability of it later on. Not all design decisions need to materialise into decision records, or certainly not their own unique decision records. They may well well supplement existing ones."

"HOOK-OWNER - (a). A repository that doesn't delegate then never gets the hook, and removing ki-pmo disables it."

"LOOP-NAME - `ki-pmo-design`"

"PULSE-NAME - `ki-pulse` is fine for now, but maybe we go with `ki-pmo-pulse`. Or maybe KI-recap becomes aware of the kind of thread it is and if this is a delegating thread, it follows the standards in delegation versus it's otherwise default recapping capability."

"GRAPH-DEFAULTS - Keep the choices."

"STATE-CLEANUP - Yes. Queue it after DECISION-HOME is settled."

## Decision 25 (2026-10-13)

- Kris's answers, received 2026-10-13 23:2x BST. The text arrived with stop words stripped, apparently by prompt compression. Quoted here as received: "DECISION-HOME - (b) tracked +/_THREADS/<thread>/ for the decisions log and agent reports; state folder keeps runtime only." "DESIGN-RETENTION - (a) +/_DESIGN/<subject-slug>/ in every repository." "PULSE-NAME - keep ki-pulse; revisit as ki-signals in the naming wave." "RECAP-AWARE - (c) ki-recap detects a coordinating thread and hands to ki-pmo's forms." "HTML-COMMIT - (a) manifest opt-in to commit the HTML; harness opts in." "EXTRACT-PIN - open a deliver record against ki-diagrams for the pinned-stylesheet extractor." "ACCEPT-177 - accept KI-HARNESS-GOV-177 through ki-accept." Coordinator hold: EXTRACT-PIN is held, because new evidence shows Archify's own browser gate already drives system Chrome headless over CDP (bin/visual-check.mjs), so the exporter could reuse it without Playwright. This goes back to Kris as EXPORT-ROUTE. Kris also asked: (1) whether the hook approach captured the need for regular updates from the coordinator or dispatcher; (2) whether the background noise from config-level settings for Claude and Codex is squishing formats, and whether a hook should do that work on every message; (3) whether the skills-map outputs were fixed; (4) whether Archify ships a command-line tool, and how ki-diagrams handles this in other projects.

## Decision 26 (2026-10-14)

- Kris, verbatim (newest turn, uncompressed): "PROMPT-PROTECT - (a), plus the two (c) rules in ki-delegation." "COORD-STYLE - (c) in the pilot; (a) now." "HOOK-LINE - (b)." "CODEX-NOISE - (a) and (b)." "FIX-QUOTES - approve the scripted correction from the transcript." "PUSH-HARNESS - wait for the other session; push ours once its commits land." "EXPORT-ROUTE - (a) reuse Archify's Chrome route; open the deliver record." EXTRACT-PIN is therefore dropped. CLOSED-THREADS remains open.

## Decision 27 (2026-10-14)

- Kris, verbatim: "QUIET-TOOLS - (a) coordinator rule in ki-delegation plus restore the quiet-tool-work sentence in communication.md."

## Decision 28 (2026-10-14)

- From Master: state-of-play (Decision 158, Kris 2026-10-14): the roadmap has grown about 50% since last measured. Standing focus: burn it down. Create no new feature records and do not widen scope; capture only blockers, defects or items Kris asks for, and prefer closing, merging or rejecting existing records.

## Decision 29 (2026-10-14)

- CLOSED-THREADS - No, they're not closed, they're both being worked on.

## Decision 30 (2026-10-14)

- PILOT-READY - yes; queue planning for KI-PRINCIPAL-ECO-013 after the chain, review before grant.

## Decision 31 (2026-10-14)

- RESTART-PROXY - will restart Headroom after the chain finishes.

## Decision 32 (2026-10-14)

- PUSH-CHEZMOI - yes; push chezmoi fast-forward after quiet-tools.

## Note (2026-10-14)

- Quote restoration: the quoted owner words in Decision 25 were restored verbatim from the session transcript (user turn of 2026-10-13T22:40:22Z) by the script in `quotes-fix-work/fix_quotes.py`, under Kris's approval "FIX-QUOTES - approve the scripted correction from the transcript." The same script restored the quoted spans in the design decisions and report files and in KI-HARNESS-GOV-179, KI-HARNESS-GOV-180, KI-PRINCIPAL-ECO-013, KI-PRINCIPAL-ECO-014 and KI-TOOL-KI-CLI-124; the proposal table with ratios is `quotes-fix-work/proposals.md`.

## Decision 33 (2026-10-14)

- SKILLS-PARALLEL - yes; start the two Wave E renames and the ki-pulse move now in a worktree, with a deliver record; leave ki-pmo for the pilot.

## Decision 34 (2026-10-14)

- PLAN-APPROVE - approve.

## Decision 35 (2026-10-14)

- CAPITALS - (a).

## Decision 36 (2026-10-14)

- STYLE-NAME - keep ki-coordinator.

## Decision 37 (2026-10-14)

- PUSH-HARNESS-MAIN - (b) wait for the other session's skill-map commit, then push ours.

## Decision 38 (2026-10-14)

- ADOPT-181 - adopt at next, kind deliver.

## Decision 39 (2026-10-14)

- KI-RELEASE - yes, release tools-ki right after the harness push.

## Decision 40 (2026-10-14)

- HOUSEKEEPING-DECLS - (b) sweep the three apps repos after the harness push; hand chezmoi and legal-principal to their own threads.

## Decision 41 (2026-10-14)

- PRINCIPAL-ENACT - yes, bounded enactment of the five notes after the harness push.

## Decision 42 (2026-10-14)

- From Master: state-of-play (Kris 2026-10-14, Decision 165): (1) Please fix KI-HARNESS-GOV-181's missing plan sections (it fails the harness roadmap audit) and push the ki-agentic-harness stack; it includes two master commits (80538f0e, 88d24305: triage dispositions and a prune). Standing rule now: an agent may push other threads' committed work beneath its own when checks pass, naming the commits. (2) KI-HARNESS-GOV-180, KI-PRINCIPAL-ECO-014 and KI-TOOL-KI-CLI-124 are adopted at Next (triage burn-down) and are yours to plan and deliver. (3) ROADMAP-SIZING, Kris agreed: capture ONE design record in your change-management design for roadmap sizing and burn-down history. Direction: (a) first, a daily ki snapshot appending one JSONL line per repository (date, count by state, later points by state) to a tracked file, repairable from Git history at any commit, charted in Observatory; (b) then a size field in Fibonacci points 1-13 set at plan time, measuring Kris's attention (review, decisions, risk) rather than agent effort, split above 8, triage unsized; (c) then ID allocation moved out of the roadmap notes file's front matter and body into one ki-owned per-area allocation file checked against Git history so pruned IDs never recur. Ownership: ki-work-roadmap defines fields, tools-ki does allocation and snapshots, Observatory charts. Burn-down focus (Decision 158) still applies: design now, build after the current Next records close.

## Decision 43 (2026-10-14)

- From Master: state-of-play (Kris 2026-10-14, Decision 169), two items for your change-management design and the ki-delegation standard: (1) RESTORE-PATH rule: any change to a firewall or to the configuration of a service critical for connection (Headroom proxy, SSH, Tailscale, network, auth) must carry in its rollout plan a tested restore path that reconnects first, then evaluates why it failed. Trigger: a Headroom apply this morning removed the proxy's launchd service and cut every session off for 41 minutes, with no rollback given. Put the rule where Claude and Codex both load it (ki-delegation and the engineering standard). (2) COMPACTION REGRESSION: coordination threads lose agreed behaviour after context compaction: they fall back from the owner report to ad hoc 'still to do' lists, and show tool chatter Kris does not want. The rules live in skills and conversation, not in anything re-injected after compaction. Kris wants a durable fix. Suggested direction: a post-compaction hook (Claude Code SessionStart with source compact, and the Codex equivalent) that re-injects the thread's role, communication level, owner-report shape and quiet tool-use rule from the thread's checkpoint; plus a short 'thread working rules' block in every checkpoint. One record, Kris-requested, so within Decision 158.

## Decision 44 (2026-10-14)

- Re-bootstrap request from Master: state-of-play, on Kris's instruction (2026-10-14). Kris has seen threads regress after compaction (lost owner report, tool chatter) and the Headroom proxy was down 08:49-09:46 BST, so messages may have failed with "connection refused".

1. Re-read the ki-delegation skill (owner report, quiet level, background runs) and your own checkpoint now.
2. Add a short "Thread working rules" block to your own checkpoint (role, owner-report shape, quiet level, minimal visible tool use and outcomes only, standing rules) and re-read it after any compaction. Touch no other thread's checkpoint.
3. Recover anything missed: review your user messages since 08:45 BST and your run's decisions log, and act on anything unanswered or interrupted.
4. Standing rules now in force: burn the roadmap down, no new feature records (Decision 158); you may push other threads' committed work beneath yours when checks pass, naming it (Decision 165); connection-critical changes need a tested restore path (Decision 169); follow-up releases stop and ask first.
5. Then give Kris one owner report.

## Decision 45 (2026-10-14)

- From Master: state-of-play, Kris's request (2026-10-14, Decision 171 there). This is Kris-requested, so it is allowed under the burn-down. Fold it into the post-compaction work (your Decision 43); a hooks-diagnose report will follow from the master.
Requirement: every coordination-thread summary or owner report ends with a multi-line status banner modelled on the ki-recap banner. The banner states plainly whether the thread is AT REST (all work concluded, nothing in progress, no open queries) or not, and why. The banner carries one copyable resume line Kris can paste back into the thread later. The line makes the thread: (1) re-bootstrap to the latest standards by re-reading ki-delegation and its checkpoint; (2) set a mark in its checkpoint; (3) re-output its summary; (4) take stock of its coordination activity (decisions log, run status, inbox, messages since the banner); (5) restart any work given since the banner, then end with a fresh banner. Put the definition in the ki-delegation skill's Reporting section so every thread inherits it; any hook only re-injects it. Before implementing, show Kris a mock banner (at rest and not at rest) and the unit model (names, boundary, hand-offs) for a sanity check.

## Decision 46 (2026-10-14)

- PUSH-STALL - (a) push all eleven now.

## Decision 47 (2026-10-14)

- MARK-RULE - yes, that reading; capture as a harness deliver record at next.

## Decision 48 (2026-10-14)

- DIAGRAMS-TIDY - (b) delete scratch and rebuild the stale HTML after the push; keep +/diagrams/ visible.

## Decision 49 (2026-10-14)

- From Master: state-of-play, hooks-diagnose result (full report: ~/.local/state/ki/agents/state-of-play/hooks-diagnose.report.md). Under Kris's instruction that improvements go into the skills, please deliver this together with the banner request:
(1) In ki-delegation standards-background-runs.md, add a '### Re-anchoring after compaction' subsection under Thread working rules. It covers re-reading responsiveness, Reporting, Thread working rules and the checkpoint, running ki agent status, then a one-line confirmation and the owner-report form. Add 'after compaction' to the Refreshing triggers. Accept the name-free 'Re-bootstrap ki-delegation.' form. Update line 56. (2) In hooks/coordinator-reminder.sh and its test, have SessionStart/compact emit a pointer to that subsection. Drop the has_terminal check for Claude, since the print-ceiling guard covers ki agent children; that check makes the hook silent in every Zed thread. Keep it for Codex until tools-ki ships KI_AGENT_RUN. No chezmoi change is needed. Show Kris the banner mock first, as already asked.

## Decision 50 (2026-10-14)

- From Master: state-of-play by direct message (Kris's Decision 174 there, 2026-10-14): ways-of-working now owns the whole thread-working model - how coordination threads work, their skills, hooks, the banner, re-bootstrap and inter-thread messaging; the master hands work over and no longer does it. Make the master-to-ways-of-working interface solid; master now messages directly, not via this log. BANNER-MARK provisional: resume line sets a checkpoint mark first, then re-outputs the summary, until Kris confirms. KI-MARKER-RELEASE: fold the unreleased KI_AGENT_RUN marker into the single KI-RELEASE ask.

## Decision 51 (2026-10-14)

- From Master: state-of-play by direct message (its Decision 175, Kris 10:05 BST): KI-MARKER-RELEASE approved ("do it and get it released") - one tools-ki patch release with the renames and KI_AGENT_RUN; any follow-up release asks first. BANNER-MARK confirmed: mark first, then re-output summary; Kris asks whether the resume line should also trigger a real compaction (/compact <instructions> if Zed ACP passes slash commands). Messaging finding: cross-session traffic does not render in Zed; design must surface it where Kris looks, recover red-x threads, and not count backend replies as visible progress.

## Decision 52 (2026-10-14)

- MISSED-MESSAGES - Kris: last message before the outage was PUSH-STALL, MARK-RULE and DIAGRAMS-TIDY, all received and acted on; nothing lost.

## Decision 53 (2026-10-14)

- CHECKPOINT-MARK - Kris: "take stock of where we are, what's left, what's outstanding. Basically, everything that you want to carry forwards, you can create a mark and then state it so that it's clear what's that, and basically the checkpoint should only include the work in progress and going forwards."

## Decision 54 (2026-10-14)

- From Master: state-of-play by direct message (10:10 BST, relaying Kris: "has no meaning to me because I don't know what the decision was ... and I don't know where the list is. I thought we'd looked at changing the way that decisions were recorded like this so that they became durable knowledge."): bring KI-HARNESS-GOV-180 forward to plan and deliver straight after the banner; banner, mark and resume line describe or date decisions, never cite numbers; the tools-ki launcher change and the ki-principal run-folder sweep stay with their owners as handoffs, named in the plan.

## Decision 55 (2026-10-14)

- From Master: state-of-play by direct message (Kris 10:12 BST): everything to do with the decisions log belongs to ways-of-working - KI-HARNESS-GOV-180, its handoffs, and whether to take an interim snapshot of existing run-folder logs. The master forwards thread-model questions here in one line and oversees only Project threads' state, cross-thread blockers, releases and the burn-down. This thread puts its own asks to Kris directly.

## Decision 56 (2026-10-14)

- MARK-REISSUE (Kris 10:19 BST, relayed by Master): striking a mark always reissues the summary straight away; the fresh owner report covers only what follows the new mark plus carried-forward open points, and ends with the banner and resume line. Worked example: state-of-play's mark at 09:19Z. Fold into the banner and mark design before build.

## Decision 57 (2026-10-14)

- Kris, 2026-10-14 ~10:30 BST: approved KI-HARNESS-GOV-180, KI-TOOL-KI-CLI-124 and KI-PRINCIPAL-ECO-014 to ready and delivery. Release: bump the markdown linter as a dependency chore, then release tools-ki 0.10.2. Interim tracked copies of the state-of-play and ways-of-working logs under +/_THREADS now. This island's agent sweeps the seven Techne records. ECO-013 pilot delivery granted. Rebuild this island's change-management diagram with a mark sidecar. Sizing: all recommended answers, except snapshot dimensions pending his question about what horizon counts are for. Thread is the owner-facing term; three thread types (normal/conversational or ad hoc, coordination, state-of-play) to be formally defined; decisions becoming durable knowledge and the fate of project design folders to be designed.

## Decision 58 (2026-10-14)

- Kris, 2026-10-14 ~10:45 BST: snapshot records both counts and size-weighted counts keyed by the status and horizon pair, so readers can look at status, horizon or both. Coordination banner uses REST/BUSY block letters; a conversational thread ends DONE; a coordination thread shows DONE only when its project closes and is tidied up.

## Decision 59 (2026-10-14T11:02:05Z)

- Kris, 2026-10-14 ~12:05 BST: the block-letter banner as the Acquire thread rendered it is right; every thread that re-bootstraps under ki-pmo must render it the same way; the reply block must carry the recommended answer on each line, not every option. Build it into ki-pmo and ki-delegation now.

## Decision 60 (2026-10-14T11:49:02Z)

- Kris, 2026-10-14 ~12:50 BST: the explanation of why the ki-coordinator output style deploys to a Claude-specific folder is accepted ('this makes sense to me ... this is answered'); the 4th White Paper opener was dispatched as given, so the HNR thread is 5G Emerge: fourth-white-paper (Initiative 5g-emerge, Project fourth-white-paper).

## Decision 61 (2026-10-14T12:53:32Z)

- Kris, 2026-10-14 ~13:50 BST, all as recommended: output-style handoff pasted to chezmoi; KI Master told by paste; accept KI-TOOL-KI-CLI-124 with the change (thread home from the launch's working directory) then release tools-ki 0.10.3 (no npm); accept KI-HARNESS-GOV-185; leave the two state-of-play reports out; commit the harness citation rewrite now; adopt thread, session and chat terms; adopt the three thread types conversational, coordination and state-of-play, replacing the old names; adopt the four decision classes and the homeless-standalone rule; the thread log is the Project's one decisions list; design notes move to +/_DESIGN/<subject>/ and are deleted on graduation; confirm the four close-out steps; open queries do not make a thread BUSY; restore-path rule lives in ki-delegation and ki-engineering; approve the hook runtime split; resume line with an optional compact paste first, Kris runs the Zed test; approve the surfaces rule and the ki agent status follow-on; approve red-x recovery; keep the close gate strict with the reconciled waiver; start KI-HARNESS-GOV-181 now; keep the defaults. Headroom not yet restarted: hold launches until Kris restarts it.

## Decision 62 (2026-10-14T12:55:26Z)

- Master reports its session is now ki-principal-c9 (was ki-principal-cf); MASTER-REACH closed. The untracked +/_THREADS/chezmoi/ folder in ki-principal belongs to Rig: chezmoi (pmo-adopt2 and coord-style agents; its commit sits unpushed in the ki-principal-chezmoi-pmo-adopt worktree); this thread leaves it to that thread. Master is asking Kris to send the ki-pmo re-read with each coordinating thread's resume line so banners match.

## Decision 63 (2026-10-14T13:18:05Z)

- Master relayed Kris's approvals 'RC-ALL: approve all; ways-of-working applies the harness part' and 'RC-OPS-005: rescope now'. Brief burn-down.md is written: harness roadmap 15 to 5, principal 5 to 4, OPS-005 narrowed and kept clear of Granola. It is held with the other launches until Kris restarts Headroom.

## Decision 64 (2026-10-14T13:28:34Z)

- Kris on the banner: 'Banner is great, but it needs the date it was issued to be more prominent than the mark'. The housekeeping line was also cut off at the right edge. Proposed change: the issue date and local time go into the top border of the frame, as '╭─ issued YYYY-MM-DD HH:MM TZ ─...╮' padded to 52 columns. 'banner <UTC>' comes off the housekeeping line, and the mark stays on the label line. This goes into the thread-model-enact brief as a KI-HARNESS-GOV-186 follow-up: update the ki-pmo standard, the output style, the frame test and the hook line.

## Decision 65 (2026-10-14T13:29:20Z)

- Kris on the banner lines beneath the frame, prompted by the Acquire thread's banner: 'the running should each be a line with the running: prefix'. Rule: every running agent gets its own 'running: <agent> - <what>' line, and queued and waiting items follow the same pattern with their own prefix. This goes into the thread-model-enact brief with BANNER-DATE, for the ki-pmo standard, the output style, the frame test and the hook line.

## Decision 66 (2026-10-14T13:31:33Z)

- Kris on BANNER-DATE: 'Use ISO-8601 UTC for the issued too and fix the border'. Rule: the top border reads '╭─ issued <YYYY-MM-DDTHH:MM:SSZ> ─...╮' and is padded to the same code-point width as the other frame lines. The frame test must assert the top border's width. BANNER-DATE is approved with this amendment.

## Decision 67 (2026-10-14T13:36:39Z)

- Master update: ki-principal is level with origin, and the untracked chezmoi decisions copy was removed because it duplicated a tracked file. The burn-down outside the harness is done. KI-TOOL-KI-CLI-115 is cancelled but kept because KI-PRINCIPAL-ECO-014 links to it. When ECO-014 closes, or its link becomes bare text, tell the Master so CLI-115 can be pruned; this is added to the harness-citations brief. The Paperclip Project is renamed paperclip-capture-and-rebuild, and ECO-014's path list now matches.

## Decision 68 (2026-10-14T13:39:53Z)

- Kris: 'PILOT-TESTS - done I think'. Headroom is healthy on a new process. Launched burn-down, cli124-fix, gov185-tidy (which includes the harness citations and removing the pilot worktree) and gov181-deliver. thread-model-enact waits on gov185-tidy, and eco014-close waits on cli124-fix.

## Decision 69 (2026-10-14T13:40:52Z)

- Kris: 'threads need to know that they need to commit their work under +/_THREAD/' (meaning +/_THREADS/). Rule: a coordinating thread commits and pushes its +/_THREADS/<run>/ folder, which holds the decisions log and agent reports. It does this at every report and resting point, because ki agent writes these files but never commits them. Added to the thread-model-enact brief for ki-pmo, ki-delegation, the hook line and the output style. The banner housekeeping line says 'thread folder committed and pushed'.

## Decision 70 (2026-10-14T14:05:09Z)

- CODEX-MARK - keep the 13:54Z mark and push; record the second-writer lesson

## Decision 71 (2026-10-14T14:05:09Z)

- ACCEPT-181 - accept KI-HARNESS-GOV-181 as done on its review packet

## Decision 72 (2026-10-14T14:05:09Z)

- PUSH-187 - fine as it stands; no further action

## Decision 73 (2026-10-14T16:28:07Z)

- REPLY-STACK - Kris: "Can we see the way that the default copy block is? So it's easier to use it. There's often quite a lot of detail now on per line." Reply block becomes stacked: tag line, blank line, recommended instruction, --- between queries.

## Decision 74 (2026-10-14T16:43:21Z)

- LINK-GUARD - approve: hook line plus KI-HARNESS-GOV-188 in the harness, link printer in KI-TOOL-KI-CLI-127, output style handed to Rig: chezmoi

## Decision 75 (2026-10-14T16:43:21Z)

- THREAD-FOLDER - confirmed as delivered

## Decision 76 (2026-10-14T16:43:21Z)

- GOV-187-REVIEW - accept KI-HARNESS-GOV-187

## Decision 77 (2026-10-14T16:43:21Z)

- KI-HANDOFFS - widen KI-TOOL-KI-CLI-127 to carry all four plus the link printer

## Decision 78 (2026-10-14T16:43:21Z)

- REBOOT-ALL - after GOV-187 is accepted and reply-stack lands, this thread re-bootstraps first, then the Master sends each live coordination thread its one-line re-bootstrap opener

## Decision 79 (2026-10-14T16:43:21Z)

- AUDIT-SCAFFOLD - accept the generic-audit clause as a pass; the README scaffold finding stays with its existing owner

## Decision 80 (2026-10-14T16:50:31Z)

- REPLY-STACK - confirmed as delivered

## Decision 81 (2026-10-14T16:53:33Z)

- PUSH-EXTRA - accept as pushed; tell the Master for the Granola review

## Decision 82 (2026-10-14T16:53:33Z)

- LINK-FORM - clickable GitHub link to the file at its last revision; KI-HARNESS-GOV-188's check accepts it. Perhaps the link text can be `KI-HARNESS-GOV-188 (pruned)`

## Decision 83 (2026-10-14T16:57:08Z)

- SECTION-NAMES - What has been done -> Done / What is in progress -> In Progress / Outstanding queries -> Queries

## Decision 84 (2026-10-14T17:03:03Z)

- BANNER-FRAME - (drawn) top border "╭─ coordination ---- <issued> ─╮"; body: blank, "KI Model - ways-of-working", blank; bottom border "╰──── mark <mark> ─╯"; second version drops the label-and-mark line beneath; item lines and housekeeping line follow as before

## Decision 85 (2026-10-14T17:45:20Z)

- BANNER-FRAME (refined) - top border "╭─ coordination ──── summary <issued> ─╮"; blank line after frame; items as "- [queued] …", "- [waiting] TAG"; "KI Model - ways-of-working could be centralised too"

## Decision 86 (2026-10-14T17:47:36Z)

- GATE-FIX - ask the Master to relay to Rig: mac-studio-bootstrap: reword the two "Rig note" bullets so they name no records, conform its checkpoint, commit and push from sol; then commit this thread's waiting files

## Decision 87 (2026-10-14T17:47:36Z)

- REBOOT-TIMING - hold the re-bootstrap until banner-frame lands, then re-bootstrap once and signal the Master

## Decision 88 (2026-10-14T17:47:36Z)

- GOV-188-REVIEW - accept KI-HARNESS-GOV-188 as done on its review packet

## Decision 89 (2026-10-14T17:47:37Z)

- LINK-LEVEL - keep the link check at warning; raise it to failure once this thread's reports are repaired

## Decision 90 (2026-10-14T17:47:37Z)

- REPORT-REPAIR - approve: an agent relinks this thread's own reports once the gate is unblocked

## Decision 91 (2026-10-14T17:47:37Z)

- HEADING-FORM - adopt: heading "<label> · <form> at <local time>", then a plain line "Project <linked name> · Initiative <linked name> · <window> · <state>"

## Decision 92 (2026-10-14T17:47:37Z)

- RUN-WAIVER - leave the four run folders in place; drop the run-folder sweep from KI-PRINCIPAL-ECO-014 and close it on its verified citation half

## Decision 93 (2026-10-14T17:47:37Z)

- RECORD-THRESHOLD - agree: a record only for a product or standard change needing acceptance; operational work runs on the decisions log, brief and report; add it to the ki-pmo standard

## Decision 94 (2026-10-14T17:50:44Z)

- QUERY-FORM - (Kris) on the queries... _Context:_ <This should cover enough information for you to be able to make an informed decision.> _Query:_ <The question succinctly?> _Options:_ <Possible: With the first one being recommended ...> - a) (recommended) blah blah - b) yah yah yah

## Decision 95 (2026-10-14T18:01:48Z)

- QUERY-FORM (amended) - bold not italics for the "Context", "Query", "Options" please

## Decision 96 (2026-10-14T18:02:10Z)

- QUERY-FORM (amended) - if the options have a), b), then no bullet also

## Decision 97 (2026-10-14T18:08:30Z)

- FRAME-PLACE - (the coordination/summary/label/mark frame) "This is for the heading, not the footer banner. The footer banner needs to be like it was before, with the large ascii text."

## Decision 98 (2026-10-14T18:13:36Z)

- HEADING-SHAPE - (supersedes the frame as heading) "maybe you can just come up with something which is just a better heading that is the actual just normal text, so it can be rich text rather than fixed width text. So maybe you do not need to say project or initiative in front of it, you use the ways of working and you render it with a sensible label, and the initiative is before that, so it says knowledge islands model, which is linked. The next line says ways of working and then you have your headings, done, in progress, queries, and then you have your banner at the end. ... after the initiative and project headings at the start you could have one line which says summary at, whatever, and last mark at." Footer keeps the block letters.

## Decision 99 (2026-10-14T18:15:47Z)

- HEADING-SHAPE (agreed) - "Actually, that is really good." Heading: # [Initiative](link) › [Project](link), then bold line "<Form> at <local time> · last mark <local time>"; no frame at the top; block-letter footer stays

## Decision 100 (2026-10-14T18:17:47Z)

- HEADING-SHAPE (amended) - "Maybe we use a tripple HR element Before the main heading."

## Decision 101 (2026-10-14T18:18:28Z)

- HEADING-SHAPE (amended) - "And maybe then even a single HR alignment after the summary and last mark part."

## Decision 102 (2026-10-14T18:21:14Z)

- FOOTER-SHAPE - (drew) "╭─ recap · 2026-10-14T18:18:50Z ───╮" with a blank framed line above and below the three block-letter rows; "What about with some spaces around it, so that it is got a bit more impact?"

## Decision 103 (2026-10-14T18:22:21Z)

- FOOTER-SHAPE (agreed) - "Okay, I am really happy with that. Yeah, let us go with it."

## Decision 104 (2026-10-14T18:23:42Z)

- LETTER-REPLY - add bare-letter resolution in ki agent decide to KI-TOOL-KI-CLI-127 as a sixth item, record only; expand letters by hand until then

## Decision 105 (2026-10-14T18:25:36Z)

- SHAPE-FREEZE - freeze the report shape once heading-rich lands; roll it out with one re-bootstrap; log further tweaks for a review in about a week

## Decision 106 (2026-10-14T18:25:36Z)

- GATE-SCOPE - have an agent propose scoping ki-principal's pre-commit audit to staged files, whole-tree audit kept in CI or the regular audit run; report the design before changing anything

## Decision 107 (2026-10-14T19:19:27Z)

- GATE-SCOPE - accept the design: open a KI-TOOL-KI-CLI record for --staged and --paths on ki repo audit and a KI-HARNESS-GOV record for the GATE-1 sentence; switch ki-principal's hook once the released ki carries the option; CI stays whole-tree

## Decision 108 (2026-10-14T19:19:28Z)

- CLOSE-191 - accept KI-HARNESS-GOV-191 as delivered, extra housekeeping states included, and prune it

## Decision 109 (2026-10-14T19:19:28Z)

- UPDATE-CADENCE - yes: add to ki-pmo - full Summary only when all dispatched work has finished or on request; otherwise timed one-to-two-line updates; a blocking query raised in a single line; the resume line shown only at rest; a report that does not repeat unchanged queries still carries the full stacked reply block for every open query

## Decision 110 (2026-10-14T19:19:28Z)

- CONCURRENCY - add the current practice to ki-pmo: chain agents that touch the same files, run different repositories in parallel, about three running per thread, the rest queued

## Decision 111 (2026-10-14T19:19:28Z)

- BUSY-Y-GLYPH - keep the standard's BUSY lettering unchanged

## Decision 112 (2026-10-14T19:19:44Z)

- REST-FULL - when the thread reaches a rest state because all its active work has concluded, it gives the summary again in full, every open query in full with the reply block (Kris: "it's important that when ... it's going to issue a rest state because it's concluded all of its active work, that we should have a summary again in full")

## Decision 113 (2026-10-14T19:28:21Z)

- THREAD-TIDY - add a rule to ki-pmo: at each mark the thread deletes every report whose queries are all answered and whose outcome has a durable home, keeping only reports with open queries and decisions.md, with Git history holding the rest; each thread applies it to its own folder at its next mark, starting with this one once the commit gate passes

## Decision 114 (2026-10-14T19:31:01Z)

- DIAGRAMS - keep every skill diagram, including any new thread-model diagram, in the harness docs/diagrams/ under ki-diagrams; ki-principal's Engineering Practice Pillar and the ways-of-working Project note link to them; after skills-map reports, an agent refreshes them there, first checking with the Master who owns the untracked harness +/diagrams/ folder

## Decision 115 (2026-10-14T19:31:30Z)

- DIAGRAM-SET - not one massive skill graph but the right set of diagrams: sub-graphs per skill family (for example change management: the skills within it and the skills outside it that it relies on), explorable as HTML as well as SVG (Kris, as received: "It doesn't have to be a single massive diagram, it can be the right set of diagrams.")

## Decision 116 (2026-10-14T19:41:49Z)

- SUBGRAPHS - (via skill-reviews handover, 20:34 BST) "Build eight area dependency diagrams ..., each showing the area's skills, what they rely on outside, and what relies on them; retire the big skill graph and keep the area map as the index."

## Decision 117 (2026-10-14T19:41:49Z)

- HTML - (via skill-reviews handover) "Add one local build command for all diagram HTML." On committing the HTML (the old KI-HARNESS-GOV-179): "I definitely want to get that done sooner rather than later. There's no reason for it to be on hold. So we can remove that hold and we can move it into now." This answers HTML-NOW.

## Decision 118 (2026-10-14T19:41:49Z)

- PUSH - (via skill-reviews handover) "A background agent re-runs the tests, TypeScript and the focused audits on ki-agentic-harness main, then pushes, listing the other threads' commits."

## Decision 119 (2026-10-14T19:41:49Z)

- RUNTIME-TAG - (via skill-reviews handover) "Leave it out."

## Decision 120 (2026-10-14T19:41:49Z)

- AREA-ACCEPT - (via skill-reviews handover) Kris wanted acceptance after the area diagrams are delivered; KI-HARNESS-GOV-183 is closed, so the new record is accepted after delivery.

## Decision 121 (2026-10-14T20:13:20Z)

- RECORD-HOME - open one new ki-agentic-harness roadmap item at Now, on my direct instruction, covering the eight area diagrams and the committed HTML with its build command, and the roadmap item sits in this initiative/project

## Decision 122 (2026-10-14T20:13:20Z)

- GATE-RELEASE - accept KI-TOOL-KI-CLI-129; release tools-ki as the next 0.x carrying --staged and --paths, bump ki-principal's .github/ki-version to it, then add --staged to the pre-commit audit line and update the Conformance.md sentence under GATE-SCOPE; CI stays whole-tree

## Decision 123 (2026-10-14T20:13:20Z)

- REPORT-SOURCE - generate the hook line, output style and prompt skeleton from the ki-pmo standard with a ki dev command, make ki-delegation link to it, and have the existing test check the generated files

## Decision 124 (2026-10-14T20:13:20Z)

- LOG-WRITER - make the launcher the only writer of the thread folder's log and report files, and delete the "until then" sentence from the standard

## Decision 125 (2026-10-14T20:13:20Z)

- HOOK-BINDING - add a mechanical rubric item that the binding is present where ki-pmo is declared, and leave chezmoi as the binder for now

## Decision 126 (2026-10-14T20:13:20Z)

- RECAP-OWNER - ki-recap keeps the ordinary session recap only, and ki-pmo's standard carries the one sentence saying so

## Decision 127 (2026-10-14T20:13:20Z)

- THREAD-DIAGRAM - build thread-model as an Archify workflow diagram under docs/diagrams/, traced from ki-pmo and ki-delegation with the skills-map text diagram as its brief, in the same run as the area diagrams

## Decision 128 (2026-10-14T20:13:20Z)

- PRINCIPAL-COMMIT - the ways-of-working thread commits the two link edits by explicit path at its next mark, once the gate clears and the checkout is level with origin

## Decision 129 (2026-10-14T20:16:27Z)

- HEARTBEAT - while work runs, the thread's background check also wakes it every 5 minutes for a one-to-two-line timed update with each agent's current step; add it to the ki-pmo update cadence and the hook line, and apply it in this thread now

## Decision 130 (2026-10-14T20:24:33Z)

- RELAUNCH-MODEL - relaunch area-diagrams, gate-release, pmo-simplify and mark on claude-opus-5-5 at their same effort, each first picking up any partial work left in its repository, with log-writer and heartbeat queued behind pmo-simplify as before

## Decision 131 (2026-10-14T20:55:14Z)

- CI-STORE - adopt KI-TOOL-KI-CLI-126 into Now and plan it, so that ki repo repair reports an unbound store without failing, the audit step runs again, and CI goes red only on real findings

## Decision 132 (2026-10-14T20:55:14Z)

- GOV-192 - accept KI-HARNESS-GOV-192 as delivered, since v0.10.4 pins it and ki-principal's hook uses it, and prune it

## Decision 133 (2026-10-14T21:21:07Z)

- COMMIT-WORK - Kris, 22:20 BST: "I can't stress this enough and I'll be saying this to every single thread, but it's absolutely imperative that you commit your work."

## Decision 134 (2026-10-14T22:21:04Z)

- PUSH-HOLD - push ki-principal main fast-forward now, carrying a6685f7c with the ways-of-working commits, then launch eco014-close and report-repair

## Decision 135 (2026-10-14T22:21:04Z)

- AREA-ACCEPT - accept KI-HARNESS-GOV-193 as delivered and prune it. I am making small refinements working with a session directly in the agentic harness. Its more about fixing the visual representation so GOV-193 is done still, do not hold it back because I am treaking the layouts

## Decision 136 (2026-10-14T22:21:04Z)

- PRINCIPAL-LINKS - send an agent to make the ways-of-working Project note and the Engineering Practice Pillar describe the skill map, the eight area diagrams and the thread model, and mark the HTML-opt-in idea as delivered by KI-HARNESS-GOV-193

## Decision 137 (2026-10-14T22:21:04Z)

- CAP-2-DRIFT - a short agent regenerates skills/README.md with ki repo conform --skill ki-repo-harness, checks the ki-repo-harness audit passes, and pushes

## Decision 138 (2026-10-14T22:21:04Z)

- CLI126-DELIVER - implement KI-TOOL-KI-CLI-126 to awaiting review, release tools-ki, bump ki-principal's .github/ki-version, and confirm ki-principal CI reaches the audit step

## Decision 139 (2026-10-14T22:21:04Z)

- CLI131-SPLIT - keep the split and leave KI-TOOL-KI-CLI-131 at triage until the repair fix lands

## Decision 140 (2026-10-14T22:21:04Z)

- HARNESS-RECORD - no harness record for pmo-simplify: the decisions log and the run report hold the standard change, and KI-TOOL-KI-CLI-130 carries the product acceptance

## Decision 141 (2026-10-14T22:21:04Z)

- KI-RELEASE - accept KI-TOOL-KI-CLI-132 through ki-accept now, and release it in the same tools-ki release CLI126-DELIVER makes

## Decision 142 (2026-10-14T22:21:04Z)

- INCEPTION-TYPE - treat an inception Project as the evaluation-stage pattern, not a new type, with a ChatGPT seed-and-return loop owned by knowledge-acquisition, and settle it together with AREAS-PATTERN. However, I'd like to discuss the whole project: life cycle and a potential type field. Do we have different types as well for roadmap items? And what about initiatives? So I think any of these kind of comparable concepts across the hierarchy of initiatives, projects, and roadmap items I want to have a review of. So if you can come back to me with some details on that after you process the rest of the above, that would be great.

## Decision 143 (2026-10-14T22:21:04Z)

- THREADS-TMP - Oh, and I wanted to approach something about the +/_THREADS areas again. There seems to be a lot of files created in there. There's things like screenshots that are taken. A lot of them are very temporary based stuff. Temporary things should be in the tmp folder so they are not tracked by git. Maybe we need to be clearer about what kinds of things are in threads and what kinds of things are temporary.

## Decision 144 (2026-10-14T22:21:05Z)

- MARK-FIRST - Oh, actually as well, can you take a mark before you process those?

## Decision 145 (2026-10-15T02:05:34Z)

- HANDED-OFF - (Kris, 15 October, relayed by knowledge-acquisition) knowledge-acquisition no longer tracks DIAGRAMS or the lasting report-heading fix. Both are yours outright; report their outcomes in your own summaries, not back to knowledge-acquisition.

## Decision 146 (2026-10-15T09:52:55Z)

- DRAIN-SOL - (Kris, 15 October) I am moving working to sol next. Bring this thread to a clean, recoverable rest now. Do not start new work and do not launch new background agents.

## Decision 147 (2026-10-15T14:59:57Z)

- DRAIN-CHECK - (Kris, 15 October) A mark is a point in time. A drain is a mark plus stopping all work, so that the thread can be archived on terra and resumed on sol from the repository alone. KI Model: ways-of-working only, before anything else: capture this drain form in ki-pmo now and land it (commit and push), so that every thread draining after you uses it. Add Drain as a thread state and a report form ("Drain report") beside Summary, Recap, Full summary and Re-bootstrap, and add the DRAINED footer frame below beside REST, BUSY and DONE. A drain report has no reply block and no Context/Query/Options; the queries live in the checkpoint.

## Decision 148 (2026-10-15T21:23:19Z)

- RESUME-SOL - (Kris, 15 October) Resume `+/_CHECKPOINTS/knowledge-islands-model.ways-of-working.md`

## Decision 149 (2026-10-15T21:31:44Z)

- DEPS-HOLD - (Kris, 15 October) Authorise a run to adopt the four patch-level dev-tool updates (@biomejs/biome 2.5.15, @vitest/coverage-v8 5.0.3, knip 6.39.0, vitest 5.0.3) in tools-ki in its own chore(deps) commit, re-run every gate, move KI-TOOL-KI-CLI-126 to awaiting review, cut the patch release carrying it and KI-TOOL-KI-CLI-132, bump ki-principal's .github/ki-version and watch CI to the audit step.

## Decision 150 (2026-10-15T21:31:44Z)

- PMO-7-BACKLOG - (Kris, 15 October) Each thread relinks or deletes its own reports at its next mark under the thread-tidy rule, and the state-of-play thread tells each one so.

## Decision 151 (2026-10-15T21:31:44Z)

- AREAS-REFRESH - (Kris, 15 October) Send one agent to rewrite the ways-of-working Project note's and the Engineering Practice Pillar's diagram descriptions for the ten functional areas, linked at the pushed harness revision.

## Decision 152 (2026-10-15T21:31:44Z)

- RECORD-NAME - (Kris, 15 October) Keep the Project note's description and commit link, which pass the audit, without naming the delivering record.

## Decision 153 (2026-10-15T21:31:44Z)

- THREADS-CONTENT - (Kris, 15 October) A thread folder holds a closed list, decisions.md and <name>.report.md only; briefs live in the state folder, work products in their owning home, temporary output in the temporary location.

## Decision 154 (2026-10-15T21:31:44Z)

- THREADS-TMP-HOME - (Kris, 15 October) Temporary output goes in <primary checkout>/tmp/<run>/<name>/ in the repository the agent works in, ignored and deleted when the run closes or they are superflous to requirements; machine-only scratch may stay in the state folder as <name>.work/. Improve the ways-of-working via whichever skill to ensure that the threads are regularly trimmed back as needed.

## Decision 155 (2026-10-15T21:31:44Z)

- THREADS-TELL - (Kris, 15 October) Open one ki-agentic-harness record (closed list in the ki-delegation run packet, one run-prompt.md footer line, a ki-pmo rubric item) and one tools-ki record (ki agent launch creates tmp/<run>/<name>/, ki agent close removes it).

## Decision 156 (2026-10-15T21:31:44Z)

- THREADS-CLEAR - (Kris, 15 October) Each owning thread clears its own folder at its next mark, moving scratch to tmp/, homing or removing tracked work products and moving briefs to the state folder, told through its inbox by this thread.

## Decision 157 (2026-10-15T21:31:44Z)

- AREAS-OVERTAKE - (Kris, 15 October) Treat my AREAS-PATTERN answer of 15 October as answering IDEA-STAGE and IDEA-CAP and close both: an idea-stage Project is a planned Project whose Outcome is a decision, ideas in Notes, no records and no thread, at most one per Initiative and three across the territory.

## Decision 158 (2026-10-15T21:31:44Z)

- IDEA-STAGE - (Kris, 15 October) Adopt it as AREAS-PATTERN puts it, with delta-evaluation moving from paused to planned.

## Decision 159 (2026-10-15T21:31:44Z)

- IDEA-CAP - (Kris, 15 October) At most one idea-stage Project per Initiative and three across the territory, reviewed at each state-of-play mark.

## Decision 160 (2026-10-15T21:31:44Z)

- REGISTRY-RECORD - (Kris, 15 October) No new record: after pmo-hold, one agent carries ROOTING-MODEL, AREAS-PATTERN, TERRITORY-RULE, PAUSE-CONDITION and the types-review attribute rules into the ki-work Project registry standard and the ki-work-roadmap ideas-and-graduation section, with the decisions log and run report holding the change.

## Decision 161 (2026-10-15T21:31:44Z)

- PAUSE-CONDITION - (Kris, 15 October) A paused Project's ## Notes opens with one line giving its release condition and review date, reviewed by state-of-play after that date; no new front matter; carried with REGISTRY-RECORD.

## Decision 162 (2026-10-15T21:31:44Z)

- PRIORITY-FIELD - (Kris, 15 October) Remove priority from KI-PRINCIPAL-MOD-006 and KI-PRINCIPAL-MOD-008, and have the Streams checker and tools-ki warn on unknown record fields; horizon stays the only priority signal.

## Decision 163 (2026-10-15T21:31:44Z)

- STREAMS-INDEX - (Kris, 15 October) Dispatch a one-file run to align the Streams index note's two paragraphs with the Project registry standard, committed by explicit path, after REGISTRY-RECORD lands.

## Decision 164 (2026-10-15T21:31:44Z)

- SOP-DROPPED - (Kris, 15 October) Ask the state-of-play thread to cherry-pick 3b8c8303 onto origin/main in a temporary worktree and push it fast-forward, and tell the session that reset main that autostash and resets of shared main are not permitted.

## Decision 165 (2026-10-15T21:31:44Z)

- HEADING-LASTING - (Kris, 15 October) Widen KI-HARNESS-GOV-175 to add a mechanical ki-pmo rubric check that a saved report's first non-blank line is the # heading (or that record's front matter, then the heading) and one ki-delegation run-prompt.md footer line saying so; no new record.

## Decision 166 (2026-10-15T21:31:44Z)

- PRIORITIES - (Kris, 15 October) Some other things high on my list are: `+/_THREADS` vs `tmp`; Thread types and behaviours (conversational, coordination, state-of-play); Thread naming; Thread footer types, states and projects; Initiative naming in `knowledge-islands`; Ideas (Scratch Areas) vs Initiatives vs Projects vs Roadmap Items

## Decision 167 (2026-10-15T21:43:37Z)

- HARNESS-PIN - (Kris, 15 October) Authorise the Harness archive download and a fix(bootstrap) pin commit at Harness main as it stands once threads-records has landed, with its gates, then cut v0.10.5, bump ki-principal's .github/ki-version and watch CI to the audit step.

## Decision 168 (2026-10-15T21:50:16Z)

- THREAD-NAMES - (Kris, 15 October 22:45 BST, relayed by state-of-play) Showing the thread list `KI > SoP`, `KI > Model > ways of working`, `KI > Model > knowledge acquisition`, `KI > Rig > mac studio setup`, `KI > mics / webcams`, `Acquire > intake (sol)`, `Chezmoi > misc (sol)`: "this is a better way I think". On the host suffix: "no, the machine is only added if its limited to that machine, so intake and chezmoi misc are machine specific". State-of-play's direction: adopt it into ki-pmo's openers and the checkpoint labels; propose the label change to Kris before rewriting any checkpoint.

## Decision 169 (2026-10-15T22:50:48Z)

- LABEL-CHANGE - (Kris, 15 October) Relabel this thread's checkpoint to KI > Model > ways of working once thread-names lands, keeping the file and run names, and use it in the resume line.

## Decision 170 (2026-10-15T22:50:48Z)

- GATE-INACTIVE - (Kris, 15 October) Authorise one short harness-gate run to run bun install in ki-agentic-harness on sol, rerun bun run test and bunx tsc --noEmit, commit pmo-hold's and registry-model's files by explicit path through the gate, pull with rebase and push fast-forward; queued harness agents then commit through the gate as normal.

## Decision 171 (2026-10-15T22:50:48Z)

- PICKUP-HEADING - (Kris, 15 October) Keep the bold-line pick-up heading, so every checkpoint passes ki-checkpoint unchanged.

## Decision 172 (2026-10-15T23:22:00Z)

- SESSION-IDENTITY - (Kris, 16 October) "Take ownership of native session metadata and logical thread identity under Ways of working. I want our agents and tools to recognise what a session represents: its human name, logical thread, conversational or coordination role, repository, optional checkpoint and lifecycle state. This emerged in Acquire's `intake` conversation. Keep implementation and coordination here in Knowledge Islands; intake should remain focused on acquiring supplied material. Establish: Which metadata ChatGPT/Codex and Claude-based clients actually expose, read and update through supported interfaces. How an exact native session ID binds to our logical thread identity, including multiple sessions or hosts. How the binding is supplied to an agent when starting or resuming; a metadata file alone does not establish that connection. Which information belongs in portable repository records and which belongs in machine-local runtime bindings. How native names, our metadata and optional checkpoints remain consistent without duplicating queues or importing coordinator ceremony into conversational threads. Prior findings: `/rename` was unavailable in this ChatGPT input box. The installed Codex protocol supports `thread/name/set`, but its metadata-update schema did not expose an arbitrary custom metadata dictionary. No working integration was established. Verify actual client/version capabilities rather than assuming CLI commands apply to every interface. Read the existing checkpoint and conversational-lifecycle handoff first. Produce and agree a bounded plan before implementation, then pilot the agreed approach on `intake`. Keep native session identifiers outside portable checkpoints under the current contract."

## Decision 173 (2026-10-15T23:31:00Z)

- SESSION-ROLE - (Kris, 16 October) "Add explicit thread-role discovery to the session metadata and lifecycle work. An agent currently learns its role from owner instructions, the opener/bootstrap and repository guidance. There is no verified native session-type flag supplied to it. A title, repository location or checkpoint alone does not establish coordination status; the current standard defaults an unspecified thread to conversational. Clarify: Where the authoritative role declaration lives and how it reaches the agent on startup, resume and after compaction. How conflicting or stale declarations are resolved. How any future native-session binding reflects that role without becoming a competing authority. How role determines responses to requests such as "summary": a coordination thread applies the ki-pmo Summary form; a conversational thread does not inherit coordinator reporting merely because it has a checkpoint. Include this in the existing bounded plan rather than creating a separate initiative. Verify the behaviour with conversational intake and an existing coordination thread."

## Decision 174 (2026-10-15T23:45:00Z)

- REPORTING-FORMS - (Kris, 16 October, relayed "from another machines conversational thread") "Please make the reporting rules explicitly distinguish ordinary conversational replies, completed-work reports, and coordinator summaries. A conversational thread can do bounded work directly without becoming a coordination thread. Routine answers and acknowledgements should stay plain, without empty reporting sections or a "No reply needed" block. When a completed-work report is required, use the owner-report format. Coordinator checkpoints, marks and banners apply only to coordinating threads. Please align personal AGENTS guidance, skills and generated prompts around that distinction, including what counts as a completed unit of work."

## Decision 175 (2026-10-16T21:06:00Z)

- ROUTINE - (Kris, 16 October) "Take the recommended option a) for OTHER-PUSH, REPIN, GATE-PRINCIPAL, PMO-CI, CI-FINDINGS, MSG-LANDED, MSG-ORPHANS, THREADS-TRIM and TMP-CLOSE, including pushing other sessions' commits that sit beneath this thread's in ki-agentic-harness and ki-principal."

## Decision 176 (2026-10-16T21:06:00Z)

- REPLY-FORMS - (Kris, 16 October) "Take the recommended option a) for FORMS-AGREE, FORMS-OWNER, UNIT-TRIVIAL, NO-REPLY-BLOCK, CONV-CHECKPOINT, CONVRUN-NARROW (which answers CONVERSATIONAL-RUN), FORMS-PHASE and FORMS-RECORD; withdraw ROLE-REPORT; land the reply forms first as Phase 1a."

## Decision 177 (2026-10-16T21:06:00Z)

- SESSION-IDENTITY - (Kris, 16 October) "Take the recommended option a) for PLAN-AGREE, THREAD-KEY, BINDING-HOME, SUPPLY-CHANNEL, NAME-AUTHORITY, RECORD-OWNERS, ROLE-FIELD and ROLE-STYLE (mechanism only); capture the three records and start Phase 1 after REPLY-FORMS lands." Then: "Then we will look at NAMING and IDEAS-ROOTING".

## Decision 178 (2026-10-16T21:14:00Z)

- REGISTRY-SHAPE and STATE-HOMES - (Kris, 16 October, spoken) "whether or not we put projects under their initiatives. So there's a more natural structure. I mean, theoretically projects could span multiple initiatives, but I'm not sure that makes sense. And it's certainly not in our model anyway, so yeah, initiatives are effectively groups of projects, but they're a little bit more than that, right? And so, I think if you do that, you don't need so much underneath the initiative details, but also the initiative names become folders and I think also the projects become folders. You don't need projects as a label under the initiatives heading, you just have those as the next level down. We tended to get quite a lot of design sections. I'm not sure what they're ready for. That's another thing that's bugging me and quite long names for initiatives. So I think you've got Knowledge Islands Model, for example, but that can just be model or philosophy or something like that, right? And platform foundations can just be foundations. And the thing that's really bugging me the most is the use of this `+/_THREADS` and how it all sits with XDG and what is durable state vs temporary "caache"". Taken as two read-only reviews with proposals; NAMING's INITIATIVE-NAMES is re-posed with REGISTRY-SHAPE.

## Decision 179 (2026-10-17T00:33:00Z)

- THREAD-IDS - (Kris, 17 October) "I'd like to think of threads as having an id, slug, and title based around this:
  - state-of-play: `$territory.sop
  - coordination: `$territory.$initiatiave.$project
  - conversation: `$territory.$slug

  Variations of that are then used for the title or label etc". Taken as the basis of the thread-naming model; a read-only run drafts the id, slug and title rules from it and re-poses NAMING, and PILOT-LABEL with it.
