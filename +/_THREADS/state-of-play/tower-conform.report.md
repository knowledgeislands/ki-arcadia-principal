# Tower: conform to the website standard

Authority: Decision 142, with no waiver.

## Done

- `apps/site-tower` now meets `ki-repo-website-content` in full. It is commit `72b0bd1` on `krisb/apps-tower.midnight.ninja` `main`, pushed as a fast-forward with nothing to rebase.
- **Layouts:** `layouts/base.njk` is the one HTML shell. `layouts/reference.njk` serves the reference pages. `/reference/` is now an ordinary template (`src/reference.njk`) instead of HTML generated in TypeScript.
- **Partials:** `partials/nav.njk` renders the top bar from `site.nav` in `_data/site.ts`. `partials/seo-meta.njk` emits `noindex, nofollow` while `site.indexed` is false.
- **CSS:** `src/assets/css/main.css` imports Tailwind, then `tokens.css` (fonts, palette and `@theme inline`), then one file per surface: base, nav, dashboard and reference. Page rules are scoped with `:where(.dashboard)` / `:where(.reference)`, and a `defaults` layer reverts Preflight. Tailwind runs through the shared factory. `ki:site:dev` uses concurrently and `@tailwindcss/cli` is a dependency.
- **JS:** the inline script is now an ES module, `assets/js/dashboard.js`, which imports its helpers from `format.js`. Only the JSON data blob is still inline. The modules are Biome-clean, with one dead function removed, and knip now checks them.
- **Docs:** the "Accepted deviations" section in `apps/site-tower/AGENTS.md` is replaced by "How it meets `ki-repo-website-content`". The folder layout and page notes are updated, and so are the Tailwind and Standards bullets in the root `AGENTS.md`.
- **Same look and behaviour:**
  - Before/after screenshots of 7 views (4 tabs, the Reference tab, the `/reference/` index and a run note) at 1440px and 390px: 14/14 show 0 differing pixels, with no console errors.
  - A scripted interaction check (tab switching, run toggles, Compare, stored preferences, the Guide and scope buttons) gives identical results before and after.
- **Checks:**
  - `bun run self:typecheck && bun run test` passes: 79 + 14 tests, 0 failures.
  - knip and Biome are clean, and rumdl is clean.
  - `ki repo audit --skill ki-authoring` passes.
  - `ki repo audit --repo .`: FAIL=0, WARN=2. Before this change it reported 2 WEB failures and 4 WEB warnings, and all of them are gone.
- **Deploy is green:** Workers Builds put `72b0bd1` live at 19:41 BST, and `build-commit` on tower.midnight.ninja matches. The new CSS and JS assets return 200. Screenshots of production match the local build, 14/14 with 0 differing pixels.

## Warnings explained (both were there before this change)

- **TURBO-2:** `turbo.json` has a `dev` task that no package script matches. It is unrelated to the site structure.
- **HOOK-1:** there is no committed `.githooks/pre-commit`; the repo uses husky with lint-staged. This is a repo-wide question for the `ki-repo` owner.

## Needs the owner

- Nothing is blocking. The two warnings above are optional follow-ups.
