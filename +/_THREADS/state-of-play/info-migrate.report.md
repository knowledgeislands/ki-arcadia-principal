# info-migrate report

Authority: state-of-play Decision 47 (Kris, 2026-10-11).

## Done

- `ki repo audit --skill ki-work-roadmap` in infoschematics: before FAIL=19 WARN=1; after PASS, FAIL=0 WARN=0 (15/15 criteria evaluated).
- Commit `af3b463d` `docs(roadmap): migrate records to the current roadmap format`, pushed fast-forward to `origin/main` (5386a7ea..af3b463d). Primary checkout fast-forwarded to it and clean.
- `.ki.toml`: the retired area-to-theme map became a code-to-title map (`SITE = "Site experience and consumer guide"`, `TOOL = "Product tooling, packages and documentation"`). This also cleared the ITEM-1 identity and ROAD-7 `_ISSUES.md` failures, which followed from the unreadable area map; `_ISSUES.md` and `_IDEAS.md` needed no change.
- INFOSCHEMATICS-SITE-032, INFOSCHEMATICS-TOOL-148, -149, -150: `horizon: triage` + `status: draft` became `status: triage` with no horizon (the standard's stated mapping); `theme` removed.
- INFOSCHEMATICS-TOOL-041: `horizon: waiting-for` became `horizon: hold` with `hold.reason: waiting-for` and `hold.condition` restating its existing `## Waiting condition`; status stays `draft`; `kind: deliver` added; `theme` removed.
- INFOSCHEMATICS-TOOL-135: `theme` replaced by `kind: deliver`; status `in-progress`, horizon `now` and `baseline_ref` unchanged.
- Discussion sections gained `###` topic headings (Origin, Open questions, and similar) over the existing prose; no text was reworded or removed.
- Checks: `bunx rumdl check docs/roadmap` clean; `scripts/command-surface.test.ts` (the one test that reads `.ki.toml`) 10/10 pass; pre-commit hook (lint-staged, syncpack) passed. Full `bun run self:check` not run: the change touches no code, and the worktree had no installed workspace.
- Worktree and `info-migrate` branch removed.

## Failed

- None.

## Needs Kris

- Confirm the two area titles, which I wrote from the old theme slugs (`site-experience`, `tool`).
- `theme` carried only the same grouping as `area`, so it now lives in the area title rather than in a classification field. No `components` vocabulary was invented; add one if you want per-record `component` tags.
- `updated_at` was left unchanged on every record, treating this as a format normalisation rather than a semantic change.
- Other skills already failing on `main` and out of scope: `ki-decision-records` FAIL=89.
