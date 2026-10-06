---
type: ki-checkpoint
thread: paperclip-bootstrap-and-recovery
state: active
created_at: 2026-09-27T23:55:22Z
updated_at: 2026-10-06T11:20:00Z
---

# paperclip-bootstrap-and-recovery

## Objective

Make Paperclip useful through reviewed roadmap work that lands in Kris's local main, not more rounds of setup. Prove one delivery in VA, establish useful reporting and review routines, then consider TMX. Completed work is in Git history; read live tasks before acting, because dated observations are not health guarantees.

## Current state

- VA delivery has no agent or runtime blocker; two of Kris's decision cards gate it (see Open questions).
- Rita (TMX), Vár (LGL) and Maketh (KIT) are hired, configured and idle; each still waits on a prerequisite listed in Next step.
- Saved staffing answers on VA-33 and HNR-50 have not yet been acted on. ER-7 is unchecked.
- No company has routines beyond two paused KIS changelog routines, and none has adopted the weekly knowledge-return review.
- Naming themes exist per company but none is recorded in its home repository.

## Decisions made

These constraints hold for now.

- **Ticket statuses.** Leave Paperclip ticket statuses as they are, including TMX-10, LGL-6 and KIT-3, until Kris says the fleet is in shape.
- **Authority.** Resuming this checkpoint does not authorise waking agents, hiring, creating tasks, activating schedules, deploying, pushing, lifting holds or KI acceptance. Reuse existing approvals; ask only for authority that is actually missing. Do not repeat answered cards.
- **Ownership.** Arcadia holds this handoff only, not other companies' knowledge or work. Generic rules stay in the harness [coordination skill](../../../ki-agentic-harness/skills/agentic-systems/ki-agent-coordination-paperclip/SKILL.md); company decisions and results go to their owning repositories.
- **Scope.** VA is the pilot, with Guru, Shilpin and Sakshi and no extra hire. TMX is next, but that is not authority to expand to every company. KIS autonomous work stays paused.
- **Structure.** One project per repository. Workspace-free Coordination only coordinates. A CEO cannot independently review their own work. HNR uses the kit-hnr consolidation; hnr-principal is gone.
- **Hires.** Claude is primary and Codex is backup. Every hire gets the [post-hire brief](../../../ki-agentic-harness/skills/agentic-systems/ki-agent-coordination-paperclip/assets/post-hire-task.md), least-necessary grants, KI/mise configuration, concurrency one, no timer heartbeat and a real run check. No direct database bypass. Future hires follow their company's naming theme.
- **Delivery.** Isolated implementation, exact-candidate independent review, then authorised integration into the primary checkout's main, with no push. Refresh diverged branches by merge. Paperclip completion is not KI acceptance. Record task associations in each roadmap item's `task_links`.
- **Routines.** Repository Activities define obligations; Paperclip routines run them. Scheduled and ad hoc runs share one definition and an active-run guard, with knowledge return under the [memory standard](../../../ki-agentic-harness/skills/agentic-systems/ki-agent-coordination-paperclip/references/standards-agent-memory.md). No automatic repairs or false clean-health reports.
- **Logins.** Keep the isolated VA and TMX logins. Shared logins and `claude-swap` are not adopted. Before any broker, check Anthropic's [credential-use rules](https://code.claude.com/docs/en/legal-and-compliance) and [subscription guidance](https://support.claude.com/en/articles/13189465-log-in-to-your-claude-account). API use is a separately priced option, not an approved switch.
- **Holds.** The [Techne Programme Hold](<../../Admin/Governance/Policies/Techne Programme Hold.md>) restricts remote running and remote-environment management only. Remote delivery needs its own policy.
- **Runtime.** The build is `ki/v2026.916.1-r1` from `/Users/krisbrown/workspaces/kit/paperclip` (branch `ki/stable`), installed under `~/.paperclip/cli/installs/fork/` with data under `~/.paperclip/instances/default`. Host procedures and the repair inventory live in `/Users/krisbrown/.local/share/chezmoi/docs/guides/tools/paperclip.md`. "Connected" is not proof that credentials work. Preserve intentional pauses, timers, retained worktrees and backups.
- **Reporting.** Use plain language: what changed, what is waiting, what happens next and the one decision needed.

## Files touched

None in this repository beyond this checkpoint. Paperclip configuration changes are snapshotted under `~/.paperclip/repairs/2026-10-06-post-hire/`, and host procedures live in the chezmoi Paperclip guide named above.

## Open questions

- Who performs the local integration of VA-13 `94ef12c`? Kris answers on card `ce6c380e` (VA-31).
- Will Kris review and integrate VA-6 `256251c`? Card `e08907db`.
- When should LGL-6 close, releasing Vár's first review LGL-7?
- Should LGL and KIS adopt their inferred naming themes?
- What timezone, cadence and budget should VA routines use?
- Which companies justify continuous operation?

## Next step

Work through these in order; items 1 and 2 wait on the open questions above.

1. **Land VA-13 (`94ef12c`).** Waiting on Kris to name the local integrator on card `ce6c380e` (VA-31). Then Shilpin refreshes the branch by merge, Sakshi re-reviews the exact candidate, and the named owner fast-forwards local main without pushing. Guru returns the commit, checks and `task_links`.
2. **Land VA-6 (`256251c`).** Waiting on Kris's review and integration card `e08907db`. Same refresh, re-review and integrate cycle; GOV-003 is in progress.
3. **Act on saved staffing answers.** [VA-33](http://127.0.0.1:3100/VA/issues/VA-33): move VA-6 to Shilpin. [HNR-50](http://127.0.0.1:3100/HNR/issues/HNR-50): adopt the cross-review pairings and keep Sarge in reserve. Check [ER-7](http://127.0.0.1:3100/ER/issues/ER-7), where Praxidike and Astraea are proposed.
4. **Clear new-hire prerequisites.** Rita needs isolated implementation workspaces in kit-techmedix, and TMX-8 is still blocked. Maketh's first task needs the kit-principal project, held under KIT-1. Vár's first review, LGL-7, is released when Kris chooses to close LGL-6.
5. **Record naming themes.** Write each company's theme into its home repository:
   - VA: Sanskrit role-nouns (confirmed).
   - HNR: one-word nicknames (proposed).
   - TMX: ordinary first names, capped at three (Kris's choice).
   - KIT: archaic `-eth` work verbs (proposed).
   - ER: Greek personifications of justice (proposed).
   - LGL (Norse law and oath deities) and KIS (English trade and office nouns) are inferred only; decide whether to adopt them.
6. **Set up VA routines once delivery is proven.** Daily audit/conform dry-run, 08:00 report/changelog, next-work review and weekly review/changelog with knowledge return, using the [repository-review checklist](../../../ki-agentic-harness/skills/keystone/ki-repo/references/mode-review.md). Timezone, cadence and budget are undecided; the 07:30 preflight and Friday 09:00 review were only proposals.
7. **Roll out memory.** No company has adopted the weekly knowledge-return review. Roll the repository-first memory clause out beyond VA.
8. **Close runtime gaps.** HNR's login and startup handshake failures, and Wren's terminal access failures on HNR-50. ER's renewable sign-in. Guru's and Sakshi's `error` labels, which are not proof of a current failure. Fleet environment and runtime verification.
9. **Repeat in TMX, then assess the rest.** Decide which companies justify continuous operation. Verify KIT's home-project setup and ER's newer projects; LGL owns kit-legal.
10. **Route repairs.** The agent permission-update defect, and held-workspace visibility through [GOV-114](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-114-surface-held-workspaces.md).
11. **Deferred.** [KIS-105](http://127.0.0.1:3100/KIS/issues/KIS-105) and KIS autonomous work stay paused. A shared-login broker and cloud policy are separate decisions, not prerequisites for VA.
