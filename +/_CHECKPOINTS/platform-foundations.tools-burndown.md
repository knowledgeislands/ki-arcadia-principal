---
type: ki-checkpoint
thread: platform-foundations.tools-burndown
label: 'Fnd: tools-burndown'
state: rest
created_at: 2026-10-16T00:05:00Z
updated_at: 2026-10-16T02:25:00Z
---

# platform-foundations.tools-burndown

**Messages from Master: state-of-play** - none pending.

## Pick-up

- Status: rest. Nothing running or queued; eleven owner queries open (below).
- Resume line: `Resume Fnd: tools-burndown under current ki-pmo and ki-delegation since 2026-10-16T00:05:00Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.`
- Next steps: on Kris's answers, push tools-ki (PUSH-ORDER); dispatch an independent review of the seven Awaiting-review records, then bring them to Kris for ki-accept (ACCEPT-WAVE); once KI-TOOL-KI-CLI-126 is accepted, plan and deliver KI-TOOL-KI-CLI-131 then -136; on TMP-HOME, deliver -137; on FOOTER-GRANTS, -134; adopt the @types/node patch (DEPS-1-TYPES-NODE); run the branch and PR clean-down only on STALE-BRANCHES and AUTOMATION-BRANCHES answers. Ask Kris before any ki or mgit release or remote branch delete.

## Objective

Burn down the open roadmap work of [tools-burndown](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/tools-burndown.md) under [Platform foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md): tools-ki, tools-mgit, tools-git-almanac and the CLI-shaped ki-agentic-harness records, excluding tools-rig and tools-techne, ending with the ki and mgit releases.

## Current state

- Running: nothing. Queued: nothing.
- Mark: none yet; thread opened 2026-10-16T00:05:00Z.
- Awaiting review in tools-ki: KI-TOOL-KI-CLI-126 (Verify 4 passed), -130, -133, -135, -123, -127, -138. Adopted and planned draft: -131, -136 (wait on -126 acceptance), -137 (TMP-HOME), -134 (FOOTER-GRANTS); -140 adopted, unplanned (waits on ki-git rubric); -139 adopted under knowledge-acquisition; -125 on Hold, outside the burn-to-zero.
- tools-ki main: 22 local commits, all this thread's runs, unpushed (PUSH-ORDER). Installed `ki` runs from this working tree, so the delivered changes are live before review.
- ki-principal: this thread's commits sit above other sessions' unpushed commits; push is Kris's (UNPUSHED-COMMITS).
- Hygiene done: KI-TOOL-KI-CLI-140 captured; rubric rule routed to ways-of-working; website and ki-principal leftovers cleared; kw-website ignores tmp/; 14 behind-only checkouts fast-forwarded. No branch or PR deleted or closed.
- Reports: `+/_THREADS/tools-burndown/` inventory, git-hygiene, store-repair, cli-130, cli-133, triage-plan, implement-wave, ki-principal-notes, estate-hygiene.

**Thread working rules.** Coordinate only under ki-pmo; delegate every unit of work through `ki agent` in run `tools-burndown`. No new feature records beyond KI-TOOL-KI-CLI-140. Ask Kris before any ki or mgit release and before any remote branch delete. One tools-ki writer at a time; other repositories in parallel, about three running. While tools-ki changes land, `ki agent wait` can replay old events: poll `ki agent status` instead.

## Decisions made

- 2026-10-16: thread reopened, TOOLS-PROJECT, REPO-GIT-HYGIENE and BURN-OVERNIGHT (option a for OWNER-LANE, STORE-REPAIR up to evidence, RETIRED-REPORTS, TRIAGE-ADOPT, RELEASE-CONTRACT, MGIT-RELEASE, STAGING-LEFTOVERS and the ff-only levelling): see `+/_THREADS/tools-burndown/decisions.md`.

## Open queries

- ACCEPT-WAVE: independent review of seven Awaiting-review records, then Kris accepts; recommended a). Folds STORE-REPAIR, VERIFY4-CI, CLI-130-ACCEPT and ACCEPT-133.
- PUSH-ORDER: push tools-ki's 22 own commits fast-forward; recommended a).
- UNPUSHED-COMMITS: Kris decides the ki-principal mixed-stack push; recommended a) push.
- STALE-BRANCHES: delete chezmoi local agent/add-hermes-agent and origin phase7-sweep, ki-principal hold/2026-10-15/working-state (patch-equivalent); recommended a).
- AUTOMATION-BRANCHES: close PR #23 and #27 as superseded, delete five automation branches; recommended a).
- TMP-HOME: $TMPDIR/ki-agents/<run>/<name>/ for KI-TOOL-KI-CLI-137; recommended a).
- FOOTER-GRANTS: separate --allow fetch and --allow machine grants for KI-TOOL-KI-CLI-134; recommended a).
- GOV-195-COLLISION: the harness session renumbers its local KI-HARNESS-GOV-195 on rebase; recommended a).
- HARNESS-FOLLOW-ONS: the next harness session folds the four wording follow-ons into KI-HARNESS-GOV-175; recommended a).
- DEPS-1-TYPES-NODE: next tools-ki run adopts @types/node 26.6.4; recommended a).
- DIGESTS-SCAFFOLD: keep -/_DIGESTS/ as the declared scaffold; recommended a).
