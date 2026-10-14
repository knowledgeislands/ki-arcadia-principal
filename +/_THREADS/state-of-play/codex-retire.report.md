# codex-retire report

Authority: state-of-play Decisions 37 and 40. All commits pushed fast-forward to `origin/main`; each primary was clean and fast-forwarded; worktrees and `codex-retire` branches removed.

## Commits

| Repository | Commit | Change |
| --- | --- | --- |
| ki-agentic-harness | `5ee647aa` | Removed codex row and pilot rule from `standards-mcp-shared-code.md` (clusters now `mcp-housekeeping-chatgpt` alone; steps renumbered; "nine" → "eight" records); `sources.md` lists and counts three → two v1 repositories; dropped from KI-HARNESS-GOV-168 in-scope list (20 → 19). ADR-KI-HARNESS-SKILLS-007 untouched. |
| ki-techne-harness | `7f1b708` | Removed line from `operations/aws/agent-host/host/repositories.txt`. Local file only; no host or AWS operation. |
| ki-arcadia-principal | `93e9e9c` | Removed from `.ki.toml` roster; removed Known Lands table row, counts 21/20 → 20/19, added a retirement paragraph matching the ki-plugins / ki-techne-principal pattern (link reference kept); OAI-1 marked delivered in `estate-factorisation.md` (bullet and close-out). Checkpoints not edited. |
| mcp-housekeeping-chatgpt | `0c53b5c` | `bun.lock` workspace name now `@knowledgeislands/mcp-housekeeping-chatgpt`; `bun install --frozen-lockfile` reports no changes. |
| mcp-git-audit | `590b5d7` | `working-on-the-code.md` opening lengthened (145 chars). |
| mcp-gsuite | `a9a5217` | Outcome-first openings for `local-development.md` (171) and `outbound-and-settings-review.md` (205). |
| mcp-ki-kb-notion-mirror | `d1e16f5` | `definition-of-done.md` opening lengthened (175). |

## Checks

- ki-agentic-harness: `bun run test` 1062 pass / 0 fail (re-run after rebase); `bunx tsc --noEmit` clean; `ki repo audit` findings identical to the primary checkout apart from worktree-only RUNTIMES-2 and REPO-REG-1 (path not registered). Pre-commit audit: FAIL=0.
- ki-arcadia-principal: `ki repo audit` findings identical before and after the change; pre-commit gate passed.
- mcp-housekeeping-chatgpt: 9 files / 77 tests pass.
- mcp-git-audit, mcp-gsuite, mcp-ki-kb-notion-mirror: GUIDE-6 no longer reported; remaining FAILs are worktree-only RUNTIMES-2 and registration findings.
- ki-agentic-harness and ki-arcadia-principal moved on `origin` during the run (other threads); my single commit was rebased onto the new `origin/main` before a fast-forward push. No force-push, no skipped hooks.

## Done

- `mcp-housekeeping-codex` removed from Harness standards and GOV-168, Techne host list, and Arcadia roster/Known Lands; OAI-1 marked delivered.
- `mcp-housekeeping-chatgpt` lockfile name fixed; four GUIDE-6 openings fixed.
- GitHub: issues disabled on `knowledgeislands/mcp-housekeeping-codex`, no open PRs, README already superseded (no README commit) → archived (`isArchived: true`).
- Unregistered from the `ki` registry (key `mcp-housekeeping-codex`). Local checkout left at `/Users/krisbrown/workspaces/kit/knowledgeislands/mcp-housekeeping-codex`.

## Failed

- None.

## Needs Kris

- Decide whether to delete or move aside the local checkout at `/Users/krisbrown/workspaces/kit/knowledgeislands/mcp-housekeeping-codex`.
- ADR-KI-HARNESS-SKILLS-007 still names `ki-housekeeping-codex`; left untouched as instructed.
- `sources.md` dated REFRESH note (2026-10-06) still says "The fleet now also includes three v1 repositories"; left as a historical record.
- chezmoi `dd55a2e` (and the live `~/.codex/config.toml` trusted-project entry) remain with the Rig: chezmoi thread.
