---
note_type: streams/project
slug: paperclip-bootstrap-and-recovery
title: Paperclip bootstrap and recovery
outcome: Paperclip is useful - one reviewed roadmap delivery lands in Kris's local main in VA, with reporting and review routines established there, before TMX is considered.
initiative: techne
lifecycle: active
lead: Kris Brown
target: null
updated: 2026-10-09T21:06:48Z
author: Written with Claude
---

# Paperclip Bootstrap and Recovery

## Outcome

Make Paperclip useful through reviewed roadmap work that lands in Kris's local main, not more rounds of setup. Prove one delivery in VA, establish useful reporting and review routines, then consider TMX. Read live tasks and roadmap records before acting.

This Project sits in [[Initiatives/techne|Techne]]. VA delivery also supplies the first Techne Programme Hold prerequisite, which the [[agent-host]] work tracks with the cloud move.

---

## Notes

### Constraints

Several of these exist only here. A Project note may point to decisions but should not be their only copy, so each needs an owner: the harness coordination skill or an Arcadia Decision Record.

- **Ticket statuses.** Leave Paperclip ticket statuses as they are until Kris says the fleet is in shape.
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

### Naming themes

Each company has a naming theme, to be written into its home repository:

- VA: Sanskrit role-nouns (confirmed).
- HNR: one-word nicknames (proposed).
- TMX: ordinary first names, capped at three (Kris's choice).
- KIT: archaic `-eth` work verbs (proposed).
- ER: Greek personifications of justice (proposed).
- LGL (Norse law and oath deities) and KIS (English trade and office nouns) are inferred only; Kris decides whether to adopt them.

### Ideas and open questions

- **VA routines, once delivery is proven.** A daily audit/conform dry-run, an 08:00 report/changelog, a next-work review and a weekly review/changelog with knowledge return, using the [repository-review checklist](../../../ki-agentic-harness/skills/keystone/ki-repo/references/mode-review.md). Timezone, cadence and budget are undecided; a 07:30 preflight and a Friday 09:00 review are only proposals.
- **Memory.** Adopt the weekly knowledge-return review and roll the repository-first memory clause out beyond VA.
- **Continuous operation.** Which companies justify it is open; repeat the VA cycle in TMX before assessing the rest.
- **Permission-update defect.** The agent permission-update defect has no owner yet: chezmoi or the Paperclip fork.
- **Deferred.** A shared-login broker and cloud policy are separate decisions, not prerequisites for VA.
- **Cite the coordination rules.** The three local Paperclip agent instruction files could cite the coordination standard's rule table instead of restating its seven rules, so the agents cannot act on a diverged copy. Kept as an idea on 2026-10-09 in place of a cancelled harness work record.
