# legal-prune report - legal-principal build tooling prune (Decision 130)

**Open Dependabot alerts: 2 -> 0.**

## Done

- Confirmed unused: `@11ty/eleventy`, `@tailwindcss/cli`, `wrangler`, `concurrently`. They are not called by any config, script, CI (there is no `.github/`), hook (there is no `.githooks/`), doc, `.claude`/`.codex`/`.agents`/`.meta` file or Live Artifact. The only mentions outside `package.json` are the history in `LGL-PRINCIPAL-OPS-025` and the ordinary English word "concurrently" in notes. All four removed with `npm uninstall`, and `package-lock.json` refreshed (npm reports 0 vulnerabilities).
- Deleted the stale tracked `bun.lock`. Nothing in any doc or script expects Bun.
- Checks: `tsc --noEmit` passed. `rumdl check .` passed (7354 files, no issues). `ki repo audit` gave PASS=22, WARN=1, FAIL=0. The warning is HOOK-1 (no committed `.githooks/pre-commit`), which was already there and is unrelated to this change.
- Commit `4b35bdc2` `build(deps): remove unused build tooling and stale bun.lock` (`package.json`, `package-lock.json`, `bun.lock`), pushed fast-forward to `origin/main`.
- Dependabot re-query: 0 open. Alerts #55 `braces` and #57 `sprintf-js` were auto-closed as fixed at 2026-10-12T06:51:28Z. Nothing was dismissed.

## Failed

- None.

## Needs the owner

- None.
