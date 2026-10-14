---
note_type: pillars/note
updated: 2026-10-14T14:00:00Z
author: Written with Claude
---

# Paperclip Operating Lessons

## Purpose

What running Paperclip on `terra` taught Knowledge Islands, kept so a fresh rebuild repeats the approach without repeating the failures. Paperclip coordinated agents in companies, projects, issues and routines while repositories kept knowledge and work authority. The structure to recreate is in [[paperclip-rebuild-structure]]; the open rebuild questions are in [[paperclip-capture-and-rebuild]]. Generic coordination rules stay with the harness skill `ki-agent-coordination-paperclip`.

## Timeline

- **2026-09-25.** Companies and agents onboarded on the npm release, with one project per repository and a workspace-free Coordination project per company.
- **2026-09-27.** Release 2026.916.1 renamed company codes; local repairs followed for issue keys, OpenAI project authentication and embedded PostgreSQL libraries.
- **2026-10-01.** The service moved to a Knowledge Islands fork build (`ki/stable`) so repairs could carry tests.
- **October.** A VA pilot aimed to land one reviewed delivery in Kris's local main before TMX.
- **2026-10-14.** Kris stopped the service, kept the approach and dropped the history: 'I want to recreate it with the same approach but fresh'.

## The approach

- **Organisation.** Seven companies, one per territory as it then stood: KIS, VA, HNR, TMX, LGL, KIT and ER. Each had a CEO agent, a project per repository and a Coordination project without a workspace for routines and cross-repository coordination.
- **Agents.** The `claude_local` adapter on Kris's subscription, concurrency one, on-demand wakes rather than timer heartbeats, a managed `AGENTS.md` instruction bundle and the KI environment. Each hire got the post-hire brief, least-necessary grants and a real run check; VA and TMX had isolated logins.
- **Delivery.** Implementation in an isolated git worktree, an independent reviewer judging the exact candidate, and authorised integration into the primary checkout's main with no push. Paperclip completion was never KI acceptance; roadmap records carried the task links.
- **Routines.** Repository Activities defined the obligation and a Paperclip routine ran it, with one definition for scheduled and ad hoc runs, `skip_if_active` and `skip_missed`. All routines were paused at shutdown.
- **Operations.** Rig declared the launchd service and loopback port; chezmoi owned installation, the desired agent state and the repair inventory. The chezmoi Paperclip guide (`docs/guides/tools/paperclip.md`) holds the drain-and-restart procedure, the repair gates and the fork build.

## Failures and lessons

- **A company-code rename broke 151 issue keys.** The 2026.916.1 rename (HUM to HNR, KNO to KIS) dropped old issue lookups, and a local alias patch had to carry them. Choose codes once, before the first issue, and never rename them.
- **Vendor guards reached outside the instance.** The OpenAI project-authentication check read the host user's Codex configuration and rejected it. Isolate agent runtimes from the operator's personal configuration.
- **The packaged database was incomplete.** Embedded PostgreSQL needed arm64 library aliases supplied at setup. Verify the database binary as part of installation, not at first failure.
- **Agent grant updates could not be written.** Both permission routes rejected agent members, and a successful write would still have returned 404. A repair belongs in the fork with route-level tests; never grant directly in the database.
- **A 200 response is not proof a configuration write applied.** Read the state back after every change.
- **Restarts interrupted runs.** A restart without a drain cut active runs. Drain to quiescence, check live runs, then restart.
- **Agents sat in error unnoticed.** Four agents ended in error, one with its timer heartbeat still on. Health must surface agent error states, not only service health.
- **Review did not reach main.** Thirty-three issues sat in review without landing in local main. A delivery is not done until the reviewed candidate is integrated, so the integration step needs an owner and a check.
- **Agent paths went stale silently.** The workspace re-layout moved every repository, but agent working directories and project workspaces still pointed at the old `~/workspaces/kit/...` and `~/workspaces/hnr/...` paths. Rig's apply of `tool.paperclip-agents` then failed on 2026-10-12 against paths that no longer existed. A path inside another system's configuration needs a check that runs when the estate moves, and a move needs a sweep of every system that records paths.
- **Projects outlived their repositories.** Projects still pointed at retired or renamed repositories. Derive projects from the registry, or audit them against it.
- **`local_trusted` has no login.** Anyone who can reach the port has full board access. Use authenticated mode, or restrict reachability to Kris's own devices, before exposing it beyond loopback.
- **A CEO cannot review their own work.** Independent review needs a separate agent, and Coordination only coordinates; it never implements.

## What worked

- One writer per checkout, isolated worktrees and exact-candidate review kept agent work safe to integrate.
- Declaring the service through Rig and chezmoi made stop and start a reviewed declaration change; the 2026-10-14 shutdown and stop-start rehearsal used only that path.
- The fork with repair-specific regression tests turned local patches into maintained, checkable changes.
- On-demand wakes with concurrency one kept cost and interference low.

## Evidence

- The chezmoi Paperclip guide, `docs/guides/tools/paperclip.md` in the chezmoi source.
- Agent instruction bundles and configuration, minus secrets, in the Knowledge Islands source store under `paperclip/2026-10-approach/`.
- The fork at `knowledgeislands/paperclip`, branch `ki/stable`.
