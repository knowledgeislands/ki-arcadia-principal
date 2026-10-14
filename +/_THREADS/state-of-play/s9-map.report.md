# Estate map - step 9 results

**Done**

- Map published: personal-principal `972e3a0` on `main`, pushed fast-forward and level with origin; `git pull --rebase` was clean. Only `Estate Map.html` was committed, because regeneration left `Estate Targets.json` unchanged.
- The five new harness repositories show as registered (harness rows with the `new` badge, not planned) in their territory and organisation tables, and their Register rows are struck in the tracker.
- `krisb/apps-rig.midnight.ninja` (KB-MIDNIGHT-RIG) and `krisb/apps-tower.midnight.ninja` (KB-MIDNIGHT-TOWER) appear as registered rows with the `new` badge in Personal and under krisb. Their targets were added to `src/estate-map-targets.json`.
- Tracker: all 32 Code rows are struck as done, including the ten step 9 codes (KI-TOOL-KI and the others match the registry). The Legal and Personal alias rows and the Territory classes row are also struck, and the Sacred Inquiry row now records its harness and Known Lands listing.
- Plan step 9: struck repository codes, the agentic harnesses, territory aliases and classes, Sacred Inquiry in Known Lands, and a new item for the midnight.ninja split, each with a short status. The renames item stays visible as "mostly done", with what is still open. The project-folders item stays "awaiting Kris". The step's status now reads "in progress".
- Checks: the generator ran cleanly ("applied 28 corrections"), the page does not contain "today", and the diff covers only the expected rows, plan items and timestamp.
- Backups: `/tmp/*.bak-s9map` (generator, targets, plan, map, Estate Targets, live snapshot).

**Failed**

- `ki territory show` fails for knowledge-islands, equal-remedy, valle-armonia and personal. Their Capitals' `territory_members` still list the pre-rename names (`apps-observatory`, `ki-website`, `er-site-dafacts`, `va-site-*`, `site-kris.me.uk`, `site-midnight.ninja`), and s9-renames did not update them. For the map, I built those four live territory files from each Capital's `.ki.toml`, applying the GitHub renames. Each file is marked DERIVED in `/tmp/emap-live`.

**Needs Kris**

- Approve a small follow-up to update `territory_members` in ki-principal, er-principal, va-principal and personal-principal to the `apps-*` names. Until that is done, `ki territory show` fails for those four territories, and the renames item in step 9 stays open.
- The other renames work that remains open is already in the s9-renames and s9-midnight reports: merging and applying the chezmoi `step9-renames` branch, and re-linking the Cloudflare Workers builds.
- The tracker still shows the two Techmedix renames (`apps-childhealthyorkshire.co.uk`, `apps-yorkphotosoc.org`) as outstanding, even though they are done on GitHub. The generator only detects renames through the registry, and these repositories are unregistered.
