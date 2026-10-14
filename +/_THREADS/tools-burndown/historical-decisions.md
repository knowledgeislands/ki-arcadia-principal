# Decisions

## Decision 1 (2026-10-11)

- Bootstrap as a project thread under ki-delegation: Platform Foundations: tools-burndown, under estate-factorisation (platform-foundations). First step: read the checkpoint and each open record, then give one tagged batch of proposed dispositions with recommendations. Background agents use run tools-burndown. Close nothing without my approval. OBS-041 is approved for adoption and planning only; delivery waits for plan approval. Leave active-thread-owned records untouched. No remote agent or remote-environment operations. Push directly to main after tests and audit, using explicit paths, never force-push or --no-verify.

## Decision 2 (2026-10-11)

- Approved, and yours: OBS-041: adopt KI-OBS-APP-041 in apps-observatory. Move the observatory from the retired Agora scope to territory selection; ki 0.10.x has no agora command, so it probably fails today. Plan it, then deliver it after I approve the plan. Push directly to main after tests and audit. Make explicit-path commits, never force-push and never use --no-verify.

## Decision 3 (2026-10-11)

- I've not really read the records but I think based on what we've been discussing it should be okay. I'm hoping that we've captured them because typically we do capture things quite well. So maybe it's good just to get them done and then come back and see what's broken or needs remedial work. The key thing here is to get the roadmap under control. That's what we're heading towards across the board. So I want to try and get these things done rather than create more changes.

## Decision 4 (2026-10-11)

- No, I want as many of them doing as possible across all of the tooling, the apps and the MCPs. And I want you to use agents to make it happen? Are you following the KI delegation rules? Are you remaining open to steerage whilst getting helpers or sub-agents to do the work?

## Decision 5 (2026-10-11)

- From Master: state-of-play (2026-10-11, Decisions 49 and 50): repository names stay as they are, but every other name now follows the territory name. Territory names in Capitals change to knowledge-islands, humans-not-robots, equal-remedy, valle-armonia, techmedix, legal and personal. --territory ki becomes --territory knowledge-islands. Every repository .ki.toml is being updated to current ki; builds may break briefly. OneDrive source names, registry entries, chezmoi trusted folders/workspaces and Claude/Codex trust entries are being changed by the master. Do not edit .ki.toml or those chezmoi paths in the meantime. Once landed, pull, then fix your own repositories builds and old-name references. Master will send a remaining-reference list.

## Decision 6 (2026-10-11)

- Yeah, if you've done them, I'm happy to accept them, and we can get them pruned as well, and just keep going until you can get as much of this sorted out and done.

## Decision 7 (2026-10-11)

- The goal here is to have the roadmaps cleaned out for apps, MCPS, and tools, and the homebrew tap obviously as well.

## Decision 8 (2026-10-11)

- From Master: state-of-play (2026-10-11, Decision 51), two tools-ki pieces for you; add them to your burndown as one change if they fit: name new Capital source stores sources-<territory handle> from territory_prefix and find them in store scan; non-Capitals retain repository naming. Support optional territory aliases in Capitals' .ki.toml, usable with -t, reject duplicate aliases; ki maps to knowledge-islands now. Capture one record if needed, then plan it and show me the plan before delivery. PROTECTED ownership question stays with the master for Kris.

## Decision 9 (2026-10-12)

- Re-bootstrap as Fnd: estate-factorisation under ki-delegation, tools-burndown. Refresh checkpoint after overnight paths/rekeys. Master retains cli-118 delivery of KI-TOOL-KI-CLI-118 and -121; no parallel tools-ki work until its DONE/report. Prepare batch A for Kris approval: accept -116/-118/-121, propose cancel -115 with questions in agent-host checkpoint, prune selected records plus -120 and KI-OBSERVA-APP-041, formalise held Rig 042 and Techne 006/008 under Decision 83. Clear pre-existing KNIP-2 after producer completes; reconcile RIG-PRUNE. Ask KI-RELEASE once ki/mgit roadmaps zero; Project close-out once only holds remain. Use backup ki.bin for agent launch until -121 lands; restore chezmoi-managed config after any ki rewrite. Every acceptance/cancellation/release still needs Kris approval; no remote Techne operations, force or hook bypass.

## Decision 10 (2026-10-12)

- Consolidate previous understanding against the 2026-10-12 re-bootstrap handover, re-summarise the whole scope, and raise every triage item in the areas this thread owns so Kris can determine disposition and adoption. This is review/preparation authority; held-thread delivery, acceptance, cancellation and release still need the stated explicit authority.

## Decision 11 (2026-10-12)

- Kris: "I approve your recommendation, I can review it further later". Approves adopting KI-TOOL-KI-CLI-115, KI-TOOL-RIG-CORE-042 and KI-TOOL-TECHNE-CLI-006 as deliver/draft on Hold with explicit owner-release conditions, and KI-TOOL-TECHNE-CLI-008 as deliver/draft Next released for local planning only. Approves recommended acceptance of CLI-116 and CLI-121; no implementation or release authority.

## Decision 12 (2026-10-12)

- Kris: "can you approve/accept anything awaiting review and prune all done including those too please". Explicit approval to accept every complete evidenced awaiting-review delivery in this thread scope, including current KI-TOOL-KI-CLI-116, -118 and -121, and prune all eligible Done records after committed closure and cross-repository reference/trade preflight. For CLI-118 this newer approval covers the delivered registered-key fallback and read-only canonical-plus-historical scan; external owner governance alignment remains a rollout boundary, not alias-declaration authority. Does not cancel CLI-115, release held records other than approved CLI-008 local planning, or widen to other owner/territory roadmaps.

## Decision 13 (2026-10-12)

- Kris: "KI-TOOL-TECHNE-CLI-008 - we would need to create the agent-host again first. This time we can use the new vega hostname", followed by "try now". Records vega recreation as the desired prerequisite before taking patching work forward. Check current local binding and read-only AWS readiness now; no plan acceptance, remote-agent execution, provisioning, destruction, setup or wider owner-hold release is inferred. Route actual recreation through Techne agent-host and master; the owner checkpoint reserves live rebuilds to the binding owner. Read-only inspection is permitted by the current Techne Programme Hold.

## Decision 14 (2026-10-12)

- Kris first replied "ok - but before that, whats the command to kill the notification center so it restarts" to the concrete VEGA-REBUILD recommendation. After fixing that, Kris says "fixed it. whats left except the vega build? maybe that can be handed off to the Techne: agent-host thread?". Approves routing the prepared bounded owner-led vega rebuild through Techne: agent-host, carrying the accepted plan and missing-host discard decision, existing credential/controller preservation and fresh enrolment prerequisite. Prepare and publish the scoped owner-checkpoint handoff now; do not execute remote operations here or broadly release other held tooling. CLI-008 remains draft Next with separate implementation approval after vega readiness. Report all remaining roadmap and close-out work; no new records or false wider Project completion.

## Decision 15 (2026-10-12)

- Kris challenges KI-TOOL-KI-CLI-115: any host should be able to reserve by advancing the ledger and pushing successfully before creating its record; asks whether a better model exists. Authorises investigation/recommendation, not unilateral change to the current writing-checkout policy or self-acceptance. Kris explicitly releases KI-TOOL-RIG-CORE-042 ("lets get this done, no need to park it") and KI-TOOL-TECHNE-CLI-006 ("lets get it out of the way") for local planning toward delivery; prepare reviewable canonical plans first under the non-trivial plan-agreement rule. Kris says KI-TOOL-TECHNE-CLI-008 "sure", approving its published local plan/implementation; clarify whether the earlier vega-first ordering still applies, preserving it until answered. No remote operations or wider hold release, new record, release or additional acceptance grant. Requests rollup since the last mark; no mark is currently recorded, so the first-recap contract uses checkpoint created_at 2026-10-08T08:35:00Z and strikes the first mark with this recap.

## Decision 16 (2026-10-14)

- From Master: state-of-play (Decision 158, Kris 2026-10-14): the roadmap has grown about 50% since last measured. Standing focus: burn it down. Create no new feature records and do not widen scope; capture only blockers, defects or items Kris asks for, and prefer closing, merging or rejecting existing records.

## Decision 17 (2026-10-14)

- Re-bootstrap request from Master: state-of-play, on Kris's instruction (2026-10-14). Kris has seen threads regress after compaction (lost owner report, tool chatter) and the Headroom proxy was down 08:49-09:46 BST, so messages may have failed with "connection refused".

1. Re-read the ki-delegation skill (owner report, quiet level, background runs) and your own checkpoint now.
2. Add a short "Thread working rules" block to your own checkpoint (role, owner-report shape, quiet level, minimal visible tool use and outcomes only, standing rules) and re-read it after any compaction. Touch no other thread's checkpoint.
3. Recover anything missed: review your user messages since 08:45 BST and your run's decisions log, and act on anything unanswered or interrupted.
4. Standing rules now in force: burn the roadmap down, no new feature records (Decision 158); you may push other threads' committed work beneath yours when checks pass, naming it (Decision 165); connection-critical changes need a tested restore path (Decision 169); follow-up releases stop and ask first.
5. Then give Kris one owner report.

## Decision 18 (2026-10-14)

- Kris: "Re-bootstrap: re-read the ki-delegation skill and your checkpoint, add a \"Thread working rules\" block to your checkpoint and re-read it after any compaction, recover any messages missed since 08:45 BST today, then give one owner report." Authorises bounded checkpoint refresh and thread-specific local message recovery. Preserve the mark and existing approvals; no new implementation, acceptance, cancellation or release is inferred. The current personal instructions grant verified low-risk documentation publication with explicit-path normal-hook commits and non-force fast-forward pushes, subject to unpublished-ancestor inspection and repository safeguards.
