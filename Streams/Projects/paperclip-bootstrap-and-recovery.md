---
note_type: streams/project
slug: paperclip-bootstrap-and-recovery
title: Paperclip bootstrap and recovery
outcome: Paperclip is useful - one reviewed roadmap delivery lands in Kris's local main in VA, with reporting and review routines established there, before TMX is considered.
initiative: techne
lifecycle: active
lead: Kris Brown
target: null
updated: 2026-10-07T14:05:00Z
author: Written with Claude
---

# Paperclip Bootstrap and Recovery

## Outcome

Make Paperclip useful through reviewed roadmap work that lands in Kris's local main, not more rounds of setup. Prove one delivery in VA, establish useful reporting and review routines, then consider TMX. Read live tasks and roadmap records before acting; this note is not a health guarantee.

This Project sits in [[Initiatives/techne|Techne]]. VA delivery also supplies the first Techne Programme Hold prerequisite, which the [[agent-host]] work tracks with the cloud move.

---

## Update

Seeded on 2026-10-07 from the checkpoint of that date; recheck before acting.

- **Health.** At risk: two of Kris's decision cards gate VA delivery. There is no agent or runtime blocker. A stated judgement for Kris to confirm.
- Rita (TMX), Var (LGL) and Maketh (KIT) are configured and idle; each waits on a prerequisite in the next steps.
- Saved staffing answers on VA-33 and HNR-50 are not yet acted on. ER-7 is unchecked.
- No company has routines beyond two paused KIS changelog routines, and none has adopted the weekly knowledge-return review.
- Each company has a naming theme, but none is recorded in its home repository.
- On 2026-10-07, with Kris's approval, the retained Paperclip worktrees and branches in the harness, `ki-techne-harness` and chezmoi were removed; only harness `KIS-70` (for `KI-HARNESS-GOV-115`) and `tools-ki` `KIS-46` (for `KI-TOOL-CLI-109`) remain.
- VA-13 and the agent permission-update defect have no roadmap record.

### Decision

Who performs the local integration of VA-13 `94ef12c`? Kris answers on card `ce6c380e` (VA-31). The test: VA-13 lands in local main without a push, with commit, checks and `task_links` returned.

### Open questions

- Will Kris review and integrate VA-6 `256251c`? Card `e08907db`.
- Does VA-13 need a roadmap record in vallearmonia-website to carry its `task_links`?
- When should LGL-6 close, releasing Var's first review LGL-7?
- Should LGL and KIS adopt their inferred naming themes?
- What timezone, cadence and budget should VA routines use?
- Which companies justify continuous operation?
- Which owner should hold the constraints below? Several exist only here, and a Project note may point to decisions but should not be their only copy. Candidates are the harness coordination skill or an Arcadia Decision Record.
- Which roadmap owns the agent permission-update defect: chezmoi or the Paperclip fork?

### Next steps

Work through these in order; items 1 and 2 wait on the decision and first open question.

1. **Land VA-13 (`94ef12c`).** Waiting on Kris to name the local integrator on card `ce6c380e` (VA-31). Then Shilpin refreshes the branch by merge, Sakshi re-reviews the exact candidate, and the named owner fast-forwards local main without pushing. Guru returns the commit, checks and `task_links`. Harness [KI-HARNESS-GOV-115](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-115-require-a-current-base-for-a-coordinated-worktree.md) would make this kind of base drift a reported fact.
2. **Land VA-6 (`256251c`).** Waiting on Kris's review and integration card `e08907db`. Same refresh, re-review and integrate cycle. It delivers [VA-PRINCIPAL-GOV-003](../../../../vallearmonia/vallearmonia-principal/Streams/Roadmap/VA-PRINCIPAL-GOV-003-company-operations.md).
3. **Act on saved staffing answers.** [VA-33](http://127.0.0.1:3100/VA/issues/VA-33): move VA-6 to Shilpin. [HNR-50](http://127.0.0.1:3100/HNR/issues/HNR-50): adopt the cross-review pairings and keep Sarge in reserve; HNR's roadmap-writing checkout is still undecided under [HNR-KB-KM-011](../../../../../hnr/kis/kit-hnr/Streams/Roadmap/HNR-KB-KM-011-designate-roadmap-writing-checkout.md). Check [ER-7](http://127.0.0.1:3100/ER/issues/ER-7), where Praxidike and Astraea are proposed.
4. **Clear new-hire prerequisites.** Rita needs isolated implementation workspaces in kit-techmedix; her blocked TMX-8 belongs to [TMX-CO-001](../../../../techmedix/kit-techmedix/Streams/Roadmap/TMX-CO-001-commercial-spine.md). Maketh's first task needs the kit-principal project, held under KIT-1. Var's first review, LGL-7, is released when Kris chooses to close LGL-6.
5. **Record naming themes.** Write each company's theme into its home repository:
   - VA: Sanskrit role-nouns (confirmed).
   - HNR: one-word nicknames (proposed).
   - TMX: ordinary first names, capped at three (Kris's choice).
   - KIT: archaic `-eth` work verbs (proposed).
   - ER: Greek personifications of justice (proposed).
   - LGL (Norse law and oath deities) and KIS (English trade and office nouns) are inferred only; decide whether to adopt them.
6. **Set up VA routines once delivery is proven.** Daily audit/conform dry-run, 08:00 report/changelog, next-work review and weekly review/changelog with knowledge return, using the [repository-review checklist](../../../ki-agentic-harness/skills/keystone/ki-repo/references/mode-review.md). Timezone, cadence and budget are undecided; a 07:30 preflight and Friday 09:00 review are only proposals.
7. **Roll out memory.** Adopt the weekly knowledge-return review and roll the repository-first memory clause out beyond VA.
8. **Close runtime gaps.**
   - HNR login and startup handshake failures, and Wren's terminal access failures on HNR-50. HNR agents cannot run KI audits under the remapped home: [HNR-HARNESS-005](../../../../../hnr/kis/hnr-agentic-harness/docs/roadmap/HNR-HARNESS-005-agent-ki-audit-unavailable.md) with its host-side remedy `DOTFILES-UE-055` in the chezmoi roadmap.
   - ER's renewable sign-in, and Guru's and Sakshi's `error` labels, which are not proof of a current failure.
   - Fleet environment and runtime verification, including a live run reaching the mcporter bridge: [KI-HARNESS-RTP-015](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-RTP-015-verify-run-mcp-connection.md). `DOTFILES-UE-062` in the chezmoi roadmap covers the Paperclip port that `rig status` reports as not listening.
9. **Repeat in TMX, then assess the rest.** Decide which companies justify continuous operation. Verify KIT's home-project setup and ER's newer projects; LGL owns kit-legal.
10. **Route repairs.** The agent permission-update defect needs a roadmap record once its owner is chosen. Held-workspace visibility goes through [KI-HARNESS-GOV-114](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-114-surface-held-workspaces.md). The harness also owns coordination-standard work that is not a prerequisite here: GOV-103, GOV-107 and GOV-108.
11. **Deferred.** [KIS-105](http://127.0.0.1:3100/KIS/issues/KIS-105) and KIS autonomous work stay paused. A shared-login broker and cloud policy are separate decisions, not prerequisites for VA.

---

## Constraints

These hold for now.

- **Ticket statuses.** Leave Paperclip ticket statuses as they are, including TMX-10, LGL-6 and KIT-3, until Kris says the fleet is in shape.
- **Authority.** Resuming this Project does not authorise waking agents, hiring, creating tasks, activating schedules, deploying, pushing, lifting holds or KI acceptance. Reuse existing approvals; ask only for authority that is actually missing. Do not repeat answered cards.
- **Ownership.** Arcadia holds this handoff only, not other companies' knowledge or work. Generic rules stay in the harness [coordination skill](../../../ki-agentic-harness/skills/agentic-systems/ki-agent-coordination-paperclip/SKILL.md); company decisions and results go to their owning repositories.
- **Scope.** VA is the pilot, with Guru, Shilpin and Sakshi and no extra hire. TMX is next, but that is not authority to expand to every company. KIS autonomous work stays paused.
- **Structure.** One project per repository. Workspace-free Coordination only coordinates. A CEO cannot independently review their own work. HNR uses the kit-hnr consolidation, not hnr-principal.
- **Hires.** Claude is primary and Codex is backup. Every hire gets the [post-hire brief](../../../ki-agentic-harness/skills/agentic-systems/ki-agent-coordination-paperclip/assets/post-hire-task.md), least-necessary grants, KI/mise configuration, concurrency one, no timer heartbeat and a real run check. No direct database bypass. Future hires follow their company's naming theme.
- **Delivery.** Isolated implementation, exact-candidate independent review, then authorised integration into the primary checkout's main, with no push. Refresh diverged branches by merge. Paperclip completion is not KI acceptance. Record task associations in each roadmap item's `task_links`.
- **Routines.** Repository Activities define obligations; Paperclip routines run them. Scheduled and ad hoc runs share one definition and an active-run guard, with knowledge return under the [memory standard](../../../ki-agentic-harness/skills/agentic-systems/ki-agent-coordination-paperclip/references/standards-agent-memory.md). No automatic repairs or false clean-health reports.
- **Logins.** Keep the isolated VA and TMX logins. Shared logins and `claude-swap` are not adopted. Before any broker, check Anthropic's [credential-use rules](https://code.claude.com/docs/en/legal-and-compliance) and [subscription guidance](https://support.claude.com/en/articles/13189465-log-in-to-your-claude-account). API use is a separately priced option, not an approved switch.
- **Holds.** The [[Techne Programme Hold]] restricts remote running and remote-environment management only. Remote delivery needs its own policy.
- **Runtime.** The build is `ki/v2026.916.1-r1` from `/Users/krisbrown/workspaces/kit/paperclip` (branch `ki/stable`), installed under `~/.paperclip/cli/installs/fork/` with data under `~/.paperclip/instances/default`. Host procedures and the repair inventory live in the chezmoi Paperclip guide (`docs/guides/tools/paperclip.md`). "Connected" is not proof that credentials work. Preserve intentional pauses, timers, retained worktrees and backups. Configuration snapshots for any further agent change go under `~/.paperclip/repairs/`.
- **Reporting.** Use plain language: what changed, what is waiting, what happens next and the one decision needed.

---

## Open records

Membership is classification, not authority; each owning repository decides whether its record joins when the migration tags it. Status lives in each record.

- [KI-HARNESS-GOV-102](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-102-decide-role-record-serialization.md) - Decide role record serialization
- [KI-HARNESS-GOV-103](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-103-cite-coordination-rules-once.md) - Cite coordination rules once
- [KI-HARNESS-GOV-107](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-107-make-coordination-audit-mechanical.md) - Make coordination audit mechanical
- [KI-HARNESS-GOV-108](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-108-decide-coordination-declaration-scope.md) - Decide coordination declaration scope
- [KI-HARNESS-GOV-114](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-114-surface-held-workspaces.md) - Surface held workspaces
- [KI-HARNESS-GOV-115](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-115-require-a-current-base-for-a-coordinated-worktree.md) - Require current worktree base
- [KI-HARNESS-GOV-147](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-147-make-the-branch-durable.md) - Make the branch durable
- [KI-HARNESS-RTP-015](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-RTP-015-verify-run-mcp-connection.md) - Verify run MCP connection
- [KI-HARNESS-RTP-018](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-RTP-018-audit-inside-sandboxed-runs.md) - Audit inside sandboxed runs
- [KI-HARNESS-RTP-019](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-RTP-019-fit-sandbox-socket-paths.md) - Fit sandbox socket paths
- `DOTFILES-UE-055` (chezmoi) - Provision HNR agent audits

---

## Ideas

None beyond the open questions above.

---

## Sources

Seeded by KI-ARCADIA-GOV-026 from `+/_CHECKPOINTS/paperclip-bootstrap-and-recovery.md` at `53633b2`.
