# Owner report: trailer (Decision 17 TRAILER)

## Decided

- Decision 17 (`TRAILER`) in `/Users/krisbrown/.local/state/ki/agents/ways-of-working/decisions.md`: an agent's co-author trailer names the model that made the commit; update the briefs.

## What has been done

- The `ki-delegation` background-run standard now owns the rule in one line under Coordination ("Commit trailer"): the trailer names the model that actually made the commit, read from the agent's launch record or runtime, never the coordinator's model or one copied from the brief. File: `/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md`.
- The four authority footers (`rules-none.md`, `rules-push.md`, `rules-prune.md`, `rules-release.md` under `/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/assets/`) no longer say "your runtime's co-author trailer"; they point to the standard's commit-trailer rule.
- The run packet table in the standard now lists `<name>.launch.json` (runtime, model, effort), which `ki agent` already writes and which the rule refers to.
- `tools-ki` sets no trailer text anywhere (`rg` for `Co-Authored-By`, `co-author`, `trailer`, `attribution` found nothing), so no change was made there. Its launch record already stores the model passed with `--model`.
- The chezmoi source contains no co-author or attribution text. The user-level attribution instruction arrives from Claude Code itself and names the model the session runs on, which agrees with Decision 17. No conflict.
- Commit `629448c5` on `ki-agentic-harness` `main`, pushed fast-forward to `origin/main` (branch level with origin after push).
- Checks: `bun run test` 1083 pass, 0 fail; `bunx tsc --noEmit` clean; `ki repo audit --skill ki-delegation` PASS; pre-commit hooks (lint-staged, rumdl, staged-snapshot `ki-skills` audit) passed. The hook's `ki-skills` audit reported two pre-existing WARN findings about stale refresh cadence in `ki-skills`'s own `sources.md`, a fleet finding unrelated to this change.

## What is in progress

- Nothing.

## Outstanding queries

- None. The remote printed "Required status check 'build' is expected" on push; the push itself succeeded. Watch the GitHub `build` check for `629448c5` if CI matters to you.

```text
Reply: none needed
```
