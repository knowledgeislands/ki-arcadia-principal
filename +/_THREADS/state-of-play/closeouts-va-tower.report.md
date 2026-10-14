# Close-outs: VA-WEBSITE-SITE-003 and the Tower audit findings

## Done

- **Tower audit findings:** recorded WEB-9 and WEB-19 as accepted deviations in `apps-tower.midnight.ninja` (`apps/site-tower/AGENTS.md`, linked from the root `AGENTS.md`). The follow-on warnings WEB-20, WEB-26, WEB-30 and WEB-40 are recorded too. `ki-repo-website-content` is still declared. Commit `75e0698`, pushed to `origin/main` as a fast-forward. Checks: rumdl clean, `ki-authoring` audit PASS, and `self:typecheck` and `test` passed (5/5 tasks). The push will trigger a Workers Builds deploy, but only Markdown changed.

## Failed

- **The audit can't express an accepted deviation.** `[skills.ki-repo-website-content]` takes no keys, and `ki repo audit` has no waiver or exception mechanism. The rubric only says to "record the owning design decision". So `ki repo audit` still reports WEB-9 and WEB-19 as FAIL, now with a written acceptance beside them.
- **[VA-WEBSITE-SITE-003](/Users/krisbrown/workspaces/valle-armonia/apps-vallearmonia.com/docs/roadmap/VA-WEBSITE-SITE-003-consolidate-the-design-system.md) was not accepted. Nothing was committed, pruned or pushed in `apps-vallearmonia.com`.** Kris approved it, but the governing `ki-work-roadmap` audit fails on the record. `ki-accept` says that blocks closure, with no waiver:
  - The Review section lacks `### Change Summary`, `### Post-change review` and `### Mini recap`.
  - The body lacks `## Current state`, `## Files touched`, `## Dependencies / blocks` and `## Discussion`.
  - Writing the missing review sections now would mean inventing delivery evidence, which the procedure forbids.
  - The rest of that roadmap is also failing the audit (47 findings across most records: retired `theme` and `horizon` fields, and old body shapes). That is a separate cleanup.

## Needs Kris

- **VA-WEBSITE-SITE-003:** this belongs to the Valle Armonia master. Either the implementer completes the record (the missing Review sections and body headings), after which it can be accepted and pruned as already approved, or it goes back to `in-progress` as a failed review.
- **Records it would unblock:** none formally, since no record has VA-WEBSITE-SITE-003 in `blocked_by`. VA-WEBSITE-SITE-004 (choose the home page layout) reuses its card component and is its named follow-on, along with VA-WEBSITE-CONT-004 (Visit page). Neither was started.
- **Optional:** add a waiver or accepted-exception key to the `ki-repo-website-content` audit so that WEB-9 and WEB-19 stop showing as FAIL. That is a harness change, outside this run.
