# steering-rule report

## Done

- Steering rule added to `skills/governance/ki-delegation/references/standards-background-runs.md` § Coordinator responsiveness: a new owner message is steering, not a stop; work is stopped or aborted only on an express instruction naming it.
- RUN-3 (`scripts/rubric/items/background-runs.ts`) description and review prompt updated to match; `references/rubric.md` updated in step.
- Commit `cfa9c458` `feat(ki-delegation): treat a new owner message as steering, not a stop` — pushed fast-forward to `origin/main` (5ee647aa..cfa9c458).
- Checks: `bun run test` 1062 pass / 0 fail; `bunx tsc --noEmit` clean; `ki repo audit --skill ki-delegation` PASS. Pre-commit staged audit showed one pre-existing fleet WARN on `ki-skills` (LONG-3 stale source refresh), unrelated.
- Primary checkout was clean and not ahead; fast-forwarded to `cfa9c458`. Worktree and `steering-rule` branch removed.

## Failed

- None. Note: `ki dev skill rubric` resolves to the dev-linked primary checkout, so it could not render from the worktree; `rubric.md` was edited by hand to match the item, and the test suite (which checks rubric sync) passed.

## Needs Kris

- Nothing.
