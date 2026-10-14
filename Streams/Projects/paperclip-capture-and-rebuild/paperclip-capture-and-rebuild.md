---
note_type: streams/project
slug: paperclip-capture-and-rebuild
title: Paperclip capture and rebuild
outcome: Paperclip's approach is captured in the island, the terra service is stopped, and a fresh rebuild is designed once the ways-of-working model settles.
initiative: techne
lifecycle: active
lead: Kris Brown
target: null
updated: 2026-10-14T23:30:00Z
author: Written with Claude
---

# Paperclip Capture and Rebuild

## Outcome

Paperclip's approach is captured in the island, the service on `terra` is stopped, and a fresh rebuild is designed once the [[ways-of-working]] model settles. Kris chose on 2026-10-14 to keep the approach and lose the history: 'I don't want the history or a database backup, I want to recreate it with the same approach but fresh'. The rebuild starts from the captured structure, not from the old instance.

This Project sits in [[Initiatives/techne|Techne]]. Hosting the rebuild on `sol` belongs to [[mac-studio-bootstrap]], and whether Paperclip may run there at all is governed by the [[Techne Programme Hold]]. It replaces the earlier bootstrap-and-recovery outcome, which aimed at one reviewed VA delivery; that aim is moot now the instance is stopped.

---

## Capture

Done on 2026-10-14.

- [[Paperclip Operating Lessons]] in `Pillars/Engineering Practice/Operating Model/` holds what worked, what failed and the rules worth keeping, including the constraints the instance ran under.
- [[paperclip-rebuild-structure]] in this Project's `design/` folder records the structure to recreate: companies and codes, projects per repository, agents with roles, routines and adapter settings.
- Agent instruction bundles and configuration, minus secrets, are in the Knowledge Islands source store under `paperclip/2026-10-approach/`. Issues, comments, runs, database backups and a cold copy were deliberately not kept.

## Shut down

Done on 2026-10-14. The chezmoi Rig declarations hold `service.paperclip` stopped with a manual start policy, `port.paperclip` on demand, and `tool.paperclip-agents` in no profile. A targeted `rig apply` stopped the service, and a stop-start flip of the declaration proved the switch works both ways. Nothing was deleted; what could go awaits Kris's decision.

## Design

Waits on the [[ways-of-working]] model. Questions to settle:

- **Organisations.** One per territory, with codes chosen once so issue keys never need renaming: KI, HNR, ER, TMX, VA, LGL, a personal code and SI.
- **Thread model.** Whether a territory master thread maps to a CEO agent or the board, a thread to an issue or a project, decisions to approvals, and owner reports to comments or documents.
- **Projects.** One per repository again, or one per Capital plus Coordination.
- **Routines.** Repository Activities define obligations and routines run them, with one definition for scheduled and ad hoc runs and an active-run guard.
- **Heartbeats and continuity.** Whether any timer heartbeat is justified, and which organisations run continuously.
- **Execution workspaces.** The worktree policy, and how a reviewed candidate reaches local main.
- **Logins, budgets and skills.** Login isolation per organisation, budgets, and KI skills through mise.
- **Coordination rules.** Agent instructions should cite the harness [coordination skill](../../../../ki-agentic-harness/skills/agentic-systems/ki-agent-coordination-paperclip/SKILL.md) rather than restate its rules, so agents cannot act on a diverged copy.
- **Run MCP connection.** Verify that a local Paperclip run reaches the host's mcporter bridge through a granted remote MCP connection, so coordination conformance rests on live evidence.
- **Naming themes.** Each company's agent naming theme belongs in its home repository: VA Sanskrit role-nouns (confirmed), TMX ordinary first names capped at three (Kris's choice); HNR one-word nicknames, the personal company archaic `-eth` verbs and ER Greek personifications of justice were proposed; LGL Norse law deities and KI trade and office nouns were only inferred.

## Rebuild

Waits on the Design phase and on the [[Techne Programme Hold]] decision for `sol`. Build fresh on `sol` from [[paperclip-rebuild-structure]], with current repository paths, no migration of the `terra` data, and the authenticated deployment mode or a tailnet access policy limited to Kris's own devices before any exposure beyond loopback.

---

## Notes

- **Deferred clean-up.** The `terra` instance data, rotating backups, the npm rollback payload, the repair snapshots and the `paperclip/aligned-20260926/*` agent branches are kept until Kris decides what goes.
- **Permission-update defect.** The agent permission-update defect has no owner; it goes with the fork if the rebuild keeps it.
- **One service per host, 2026-10-15.** Kris decided on 15 October, as this Project's part of the [[Known World]] model: 'one Paperclip service per host; each territory's company live only on its seat host and absent on the standby; the Knowledge Islands company live on the hub, with Terra reaching it over the tailnet. This replaces "build on Sol" in its Design phase and leaves the Techne Programme Hold unchanged.'
- **Old service files kept but inactive, 2026-10-15.** The old Paperclip service files in the chezmoi source (the launchd declaration, plist and scripts) stay there until the per-host rebuild is designed, but must not be active on `terra` or `sol`. Kris, 15 October: 'Keep them till the per host rebuild is designed. Ensure that it isn't used by either terra or sol for now though.' The Rig: chezmoi thread carries it.
- **Six agent branches kept, 2026-10-15.** Kris decided on 15 October to keep the six unmerged `paperclip/aligned-20260926/*` branches until the per-host rebuild is planned: hnr-principal HNR-15 and HNR-49, hnr-agentic-harness HNR-30 and HUM-21, hnr-shared HNR-38, and tools-ki KIS-46. When the rebuild is planned, one run per repository triages its branches, bringing each into that repository's roadmap or deleting it.
