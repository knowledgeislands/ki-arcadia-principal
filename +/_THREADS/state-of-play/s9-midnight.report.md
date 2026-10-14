# Step 9e - midnight.ninja split - report

Authority: Decision 106. Plan: [s9-midnight.plan.md](s9-midnight.plan.md).

## Done

- **Rig split out:** the rig site now lives in `krisb/apps-rig.midnight.ninja` (private, code `KB-MIDNIGHT-RIG`), with its full history and a vendored `view-common` that has a drift check. Commits `1c8dd9e` and `0c5d525`, pushed. Local checkout: [~/workspaces/personal/apps-rig.midnight.ninja](file:///Users/krisbrown/workspaces/personal/apps-rig.midnight.ninja). Build, typecheck and test pass (5/5 Turbo tasks). Drift check matches. `ki repo audit`: PASS 18, WARN 3, FAIL 0.
- **Tower split out:** the tower site and the Swift Tower Save Nudge helper now live in `krisb/apps-tower.midnight.ninja` (private, code `KB-MIDNIGHT-TOWER`), with full history and the vendored `view-common`. Commit `3d99121`, pushed. Local checkout: [~/workspaces/personal/apps-tower.midnight.ninja](file:///Users/krisbrown/workspaces/personal/apps-tower.midnight.ninja). Build, typecheck and test pass (5/5). Drift check matches. `build.sh test` passes. Audit: FAIL 1, the tower WEB layout finding under Needs Kris. The ignored local Tower data was moved across with the site.
- **Apex trimmed:** `krisb/apps-midnight.ninja` now holds only the apex site and the canonical `view-common`. Commit `5020c1d`, pushed fast-forward. Checks:
  - build passes
  - typecheck passes (3/3)
  - test passes (5/5)
  - biome, rumdl and knip are clean (knip shows only configuration hints that were already there before the split)
  - audit: the only failures are TERR-3, because the territory still lists the old `site-midnight.ninja` name (that rename belongs to the renames thread), and a BIO-1 run-time format failure that the commit hook has since fixed
- **GitHub settings on both new repos, mirrored from apex:**
  - issues, wiki and projects off
  - squash merge only
  - delete branch on merge and allow update branch on
  - vulnerability alerts and automated security fixes on
- **Registry:** both new repos are registered in the KI registry.
- **Territory:** both new repos were added to personal-principal's `territory_members` and to [Known Lands](file:///Users/krisbrown/workspaces/personal/personal-principal/Admin/Governance/Known%20Lands.md). Commit `c4a0ed9`, pushed. TERR-3 now passes on both new repos.

## Failed

- None.

## Needs Kris

- **Re-point Cloudflare Workers Builds.** Hosting was left unchanged. Until the two Workers below are re-pointed, their builds from `apps-midnight.ninja` will fail; the live sites stay as last deployed.
  - `midnight-ninja-rig`: point it at `krisb/apps-rig.midnight.ninja`, root `/`, build `bun run self:site:rig:build`, deploy `bun run self:site:rig:deploy`.
  - `midnight-ninja-tower`: point it at `krisb/apps-tower.midnight.ninja`, root `/`, build `bun run self:site:tower:build`, deploy `bun run self:site:tower:deploy`.
  - `midnight-ninja-apex` stays on `krisb/apps-midnight.ninja` with no change.
- **Tower audit decision (WEB-9, WEB-19).** The tower site deliberately has no Tailwind and no `_includes/layouts` or `_includes/partials`. Either accept these findings, or drop `ki-repo-website-content` from the tower repo. Dropping it currently triggers COV-1, so that would need a coverage decision too.
- **chezmoi follow-up.** These still reference `site-midnight.ninja`: the mgit manifest, trusted folders, the ki config and the VS Code workspace. `dot_config/rig/conf.d/private_10-applications.toml` and `docs/guides/tools/tower-save-nudge.md` still give the Tower Save Nudge build location as the old repository. It now lives in `apps-tower.midnight.ninja/apps/macos-tower-save-nudge`. Fold this in after the pending `step9-renames` branch.
- **personal-principal stale names.** The territory and Known Lands still list `site-kris.me.uk` and `site-midnight.ninja` under their old names. These belong to the renames thread and were left alone.
- **GitHub Desktop.** Add the two new local checkouts if you want them there.
- **Pre-existing issue, not fixed.** The tower `pipeline/snapshot.ts` still names the source-store owner as `kit-principal`.
