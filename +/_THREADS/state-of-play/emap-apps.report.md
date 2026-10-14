# Estate map - apps-<domain> renames and new codes

**Done**

- Map published: personal-principal `f4d4803` on `main`, pushed fast-forward and level with origin. Only `Estate Map.html` and `Estate Targets.json` were committed. `git pull --rebase` was clean this time.
- All 28 corrections are applied, and each of the 23 new ones shows as a target in the map and in `Estate Targets.json`: the new repository names (`apps-kris.me.uk`, `apps-midnight.ninja`, `apps-knowledgeislands.info`, `apps-observatory.local`, `apps-dafacts.org`, `apps-markhowarth.com`, `apps-vallearmonia.com`, `apps-childhealthyorkshire.co.uk`, `apps-yorkphotosoc.org`), their checkout paths, and the codes KI-WEBSITE, VA-WEBSITE, KB-DOTFILES, KI-OBSERVA, KI-BREWTAP, KI-TOOL-GIT-ALMANAC, KI-TOOL-KI, KI-TOOL-MGIT, KI-TOOL-RIG and KI-TOOL-TECHNE. Bare names kept their organisation.
- The `site-*` names that the rollout already reached are now superseded by `apps-*` targets. They appear only as the live `now:` values beneath each target. The `krisb/acquire` rename (already done) is unchanged.
- Plan step 9 now lists the nine `apps-<domain>` renames and folder moves in place of the `site-*` line, plus all ten code changes. It also has the line saying that code changes re-key open records and references inside each repository and that history is left untouched.
- Checks:
  - The live snapshot was refreshed with git worktrees excluded. The checkouts were unchanged.
  - The generator ran cleanly ("applied 28 corrections").
  - No repository name, path or code is duplicated, either in the targets or in the manifest.
  - The page does not contain "today".
- Backups: `/tmp/estate-map-targets.json.bak-apps`, `/tmp/estate-map-plan.html.bak-apps`, `/tmp/EstateMap.html.bak-apps`, `/tmp/EstateTargets.json.bak-apps`, `/tmp/emap-live.bak-apps`.

**Needs Kris**

- No collisions were found. One thing to note: `techmedix/childhealthyorkshire` and `techmedix/yps` are unregistered and have no checkout on terra, so their targets carry the new GitHub name only. They have no path, code or title. Say whether they should be registered, with codes, as part of the rename.
