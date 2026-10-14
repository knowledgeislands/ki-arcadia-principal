# sweep-approvals report (Decision 31, 2026-10-09)

## Done

- Open records, before → after: ki-agentic-harness 6 → 5; ki-techne-harness 7 → 5; tools-techne 3 → 2; apps-observatory 1 → 0; ki-website 3 → 2; ki-arcadia-principal 5 → 4.
- IDEA-1: KI-HARNESS-GOV-163 cancelled (rejected) and pruned. It is now an idea in [baseline-rollout](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/baseline-rollout.md). Commits ki-agentic-harness f3798cd4, 132a7bca.
- IDEA-2 and IDEA-3: TECHNE-TOOLS-OPS-020 and TECHNE-TOOLS-OPS-021 cancelled and pruned (ki-techne-harness 09e257c, b731255, made in a worktree from origin/main). TECHNE-TOOL-CLI-007 cancelled and pruned (tools-techne b65fc44, 171c336). The [agent-host](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/agent-host/agent-host.md) note now holds two ideas: the owned-host provider and the operator-guide split. The operator guide's one mention of TECHNE-TOOLS-OPS-021 now points to that idea.
- ORPHAN-5: KI-WEB-SITE-043 done as a direct change. Commit ki-website db3f668 adds a ki-diagrams route to the skills-by-outcome page and cites the Diagrams standard as a source. The record was then cancelled (obsolete) and pruned: 1014435, 87617b6.
- ORPHAN-4: KI-OBS-OPS-002 was not small, so I made it an idea in baseline-rollout instead. The work covers a manifest for seven diagrams, a README rewrite and retiring the exporter, and the staleness checker may then flag diagrams. Record cancelled (rejected) and pruned: apps-observatory 6f81a58, d92cef8. In the same cancel commit I raised the OPS issue ledger to 002, so the number is not reused after pruning.
- DUP-1: KI-ARCADIA-ECO-011 cancelled (rejected) and pruned. Its measurement step is now in the baseline-rollout close-out text.
- THREAD-1: [secrets-hygiene](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/secrets-hygiene.md) is now active. The [master checkpoint](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/_state-of-play.md) names Rig: chezmoi as its thread.
- THREAD-2: knowledge-acquisition is queued third, after baseline-rollout; ways-of-working moves to fourth. Paperclip-bootstrap-and-recovery is noted as waiting on the Techne Programme Hold.
- The ki-arcadia-principal changes are commits 090d11e and 5b30f6c, made in a worktree and rebased onto the latest origin/main.
- Checks: the ki-work-roadmap audit passes in all five repositories. The ki-repo-kb-streams audit in Arcadia has no failures and three warnings; the secrets-hygiene warning appears because its records live in chezmoi. The ki-website provenance, docs and prose checks pass. Commit hooks passed.
- All commits were pushed fast-forward to origin. The ki-techne-harness primary was fast-forwarded. Worktrees were removed.

## Failed

- None.

## Needs Kris

- The ki-arcadia-principal primary was not fast-forwarded. It is 1 ahead and 3 behind origin, with a clean tree. Its local commits from another thread include "strike a mark in the state-of-play checkpoint", which also edits [_state-of-play](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/_state-of-play.md). That thread's owner should rebase; expect a possible conflict in the checkpoint's queue and Active threads lines.
- Two other thread checkpoints still mention the pruned identifiers as plain text, not links. [techne.agent-host](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/techne.agent-host.md) mentions TECHNE-TOOLS-OPS-020, TECHNE-TOOLS-OPS-021 and TECHNE-TOOL-CLI-007. [platform-foundations.baseline-rollout](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/platform-foundations.baseline-rollout.md) mentions KI-HARNESS-GOV-163. I left both alone because only the owning threads may edit them.
