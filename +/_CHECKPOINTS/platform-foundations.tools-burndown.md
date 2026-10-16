---
type: ki-checkpoint
thread: platform-foundations.tools-burndown
label: 'Fnd: tools-burndown'
state: busy
created_at: 2026-10-16T00:05:00Z
updated_at: 2026-10-16T21:02:00Z
---

# platform-foundations.tools-burndown

**Messages from Master: state-of-play** - the receiving thread acts on each line, then removes it.

- 2026-10-16 · STALE-PRS · Kris, 16 October 01:40 BST: "Fnd: tools-burndown closes apps-knowledgeislands.info #23 and ki-agentic-harness #27 with the comment "superseded by a later release", then deletes their branches with the rest of STALE-BRANCHES." Logged in the [state-of-play decisions log](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/decisions.md); query in the [query-review report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/query-review.report.md).
- 2026-10-16 · CLI-139-FRONTMATTER · Master: state-of-play, from Kris's `ki repo roadmap summary` at about 22:00 BST: [KI-TOOL-KI-CLI-139](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-139-ebu-sources-sync.md) was reported as "frontmatter must contain simple key-value fields", so the summary does not count it; rewrite its frontmatter to simple key-value fields. At 22:04 BST the defect did not reproduce: the local and `origin/main` copies both parse, and the local `tools-ki` `main` is 22 ahead and 9 behind `origin/main` with both sides changing this record (`46392f1a` local, `2ed4ca02` remote), so check the merged frontmatter when that divergence is reconciled · detail: [roadmap-diag report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/roadmap-diag.report.md)

## Pick-up

- Status: busy. Running rebase-push, principal-audit, mgit-members; queued tools-ki-follow (after rebase-push). Open queries: TMP-HOME, DIGESTS-SCAFFOLD.
- Resume line: `Resume Fnd: tools-burndown under current ki-pmo and ki-delegation since 2026-10-16T00:05:00Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.`
- Next steps: after rebase-push, Kris runs ki-accept on KI-TOOL-KI-CLI-126, -130, -133, -135, -138, -123, -127; coordinator moves the tools-burndown events.seen marker past event 21; then plan and deliver KI-TOOL-KI-CLI-131 then -136; update -137's harness reference once Ways of working renumbers; bring mgit-members to Kris (any mgit release asks first). Push ki-principal at each resting point.

## Objective

Burn down the open roadmap work of [tools-burndown](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/tools-burndown.md) under [Platform foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md): tools-ki, tools-mgit, tools-git-almanac and the CLI-shaped ki-agentic-harness records, excluding tools-rig and tools-techne, ending with the ki and mgit releases.

## Current state

- Running: rebase-push, principal-audit, mgit-members. Queued: tools-ki-follow.
- Mark: none yet; thread opened 2026-10-16T00:05:00Z.
- Awaiting review in tools-ki: KI-TOOL-KI-CLI-126 (Verify 4 passed), -130, -133, -135, -123, -127, -138. Adopted and planned draft: -131, -136 (wait on -126 acceptance), -137 (TMP-HOME), -134 (FOOTER-GRANTS); -140 adopted, unplanned (waits on ki-git rubric); -139 adopted under knowledge-acquisition; -125 on Hold, outside the burn-to-zero.
- tools-ki main: 22 local commits, all this thread's runs, unpushed (PUSH-ORDER). Installed `ki` runs from this working tree, so the delivered changes are live before review.
- ki-principal: this thread's commits sit above other sessions' unpushed commits; push is Kris's (UNPUSHED-COMMITS).
- Hygiene done: KI-TOOL-KI-CLI-140 captured; rubric rule routed to ways-of-working; website and ki-principal leftovers cleared; kw-website ignores tmp/; 14 behind-only checkouts fast-forwarded. No branch or PR deleted or closed.
- Reports: `+/_THREADS/tools-burndown/` inventory, git-hygiene, store-repair, cli-130, cli-133, triage-plan, implement-wave, ki-principal-notes, estate-hygiene.

**Thread working rules.** Coordinate only under ki-pmo; delegate every unit of work through `ki agent` in run `tools-burndown`. No new feature records beyond KI-TOOL-KI-CLI-140. Ask Kris before any ki or mgit release and before any remote branch delete. One tools-ki writer at a time; other repositories in parallel, about three running. While tools-ki changes land, `ki agent wait` can replay old events: poll `ki agent status` instead.

## Decisions made

- 2026-10-16: thread reopened, TOOLS-PROJECT, REPO-GIT-HYGIENE and BURN-OVERNIGHT (option a for OWNER-LANE, STORE-REPAIR up to evidence, RETIRED-REPORTS, TRIAGE-ADOPT, RELEASE-CONTRACT, MGIT-RELEASE, STAGING-LEFTOVERS and the ff-only levelling): see `+/_THREADS/tools-burndown/decisions.md`.
- 2026-10-16 21:40 BST: Kris answered ACCEPT-WAVE, PUSH-ORDER, UNPUSHED-COMMITS (push ki-principal at each resting point), STALE-BRANCHES, AUTOMATION-BRANCHES, FOOTER-GRANTS, GOV-195-COLLISION, HARNESS-FOLLOW-ONS and DEPS-1-TYPES-NODE, all a): see decisions.md.

- 2026-10-16 22:01 BST: PUSH-REBASE, ACCEPT-CLEAN, EVENTS-REPLAY, LIVE-CHECKS, GOV-195-RENUMBER, TOOLS-KI-BRANCHES, CI-RED-PRINCIPAL all a); MGIT-MEMBERS requested: see decisions.md.

## Open queries

- TMP-HOME: $TMPDIR/ki-agents/<run>/<name>/ for KI-TOOL-KI-CLI-137; recommended a).
- DIGESTS-SCAFFOLD: keep -/_DIGESTS/ as the declared scaffold; recommended a).
