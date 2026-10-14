# legal-deps report - krisb/legal-principal Dependabot alerts (Decision 127)

**Alerts open: 22 before (1 critical, 11 high, 7 medium, 3 low) -> 2 after.** All 22 were npm `package-lock.json`, development scope.

## Done

- Commit `bfc8e13b` `fix(deps): resolve Dependabot security alerts`, pushed fast-forward to `origin/main`. `wrangler` ^4.149.0 (`sharp` 0.35.5, `undici` 7.29.1), `concurrently` ^10.0.6 (`shell-quote` 1.12.0, the critical alert), and in-range refreshes: `source-map-js` 1.2.2, `brace-expansion` 1.1.21, `markdown-it` 14.3.2, `js-yaml` 3.15.2 / 4.3.2. There were no major bumps. 20 alerts were closed (#38-#54, #56, #58, #59).
- Checks: `tsc --noEmit` passed, and `rumdl check .` passed (7354 files, no issues). `eleventy`, `wrangler` and `concurrently` all start. `ki repo audit` reported PASS=22, WARN=1, FAIL=0. The warning is HOOK-1 (no committed `.githooks/pre-commit`). It was there before this work and is unrelated.
- Dependabot PRs #4-#10 are covered by the commit, so none was merged. They are left for GitHub to close automatically and were still open when this report was written.

## Failed

- None.

## Needs the owner

- **#55 `braces` (high, GHSA-vfj7-8cjw-p6xm, <= 3.0.3)** and **#57 `sprintf-js` (medium, GHSA-hp3w-g68c-fv3c, <= 1.1.3)** have no patched release. They come in through `@11ty/eleventy` (chokidar, gray-matter/js-yaml@3/argparse) and `@tailwindcss/cli` (@parcel/watcher/micromatch). The only `npm audit` "fix" is a downgrade to eleventy 0.6, which is not viable. `@11ty/eleventy`, `@tailwindcss/cli`, `wrangler` and `concurrently` appear unused: the repository has no eleventy config, templates, Tailwind CSS, wrangler config or script that calls them.
- **Recommendation:** remove `@11ty/eleventy` and `@tailwindcss/cli` (and possibly `wrangler` and `concurrently`) from `devDependencies`. That clears both alerts. If they are kept, dismiss both as "vulnerable code not actually used" (dev-only build tooling that never touches untrusted input).
- `bun.lock` is tracked but was not updated after the 2026-09-04 refresh either, so it is stale. Either delete it or regenerate it with `bun install`. npm is the effective package manager.
