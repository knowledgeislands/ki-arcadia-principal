# Estate map - "new" badge for genuinely new repositories

**Done**

- Map published: personal-principal `671ce2f` on `main`, pushed and level with origin. Only `Estate Map.html` was committed; `Estate Targets.json` did not change.
- The badge is a small blue `new` pill. The generator works out which repositories get it from the data in the pre-rollout GitHub snapshot (`/tmp/emap/gh-*.json`). A repository gets the badge if neither its current name nor any former name appears there, including names from target renames and the applied converge manifest. A legend entry is in the Territories key, the GitHub organisations key and a new key under the tracker.
- Badge carried by: `techmedix/tmx-agentic-harness`, `vallearmonia/va-agentic-harness`, `krisb/legal-agentic-harness`, `krisb/personal-agentic-harness`, `sacred-inquiry/si-agentic-harness`.
- No badge on any rename or transfer (`site-*`, `ki-principal`, `tmx-principal` and so on).
- Checks: the five badges appear on the tracker's Register rows only; the legend appears three times; no "today" on the page; the regenerated diff contains only the badge, legend, timestamp and the plan-tab change below.

**Needs Kris**

- `sacred-inquiry/si-principal` has no badge. It is in the baseline snapshot because Kris created it on GitHub on 2026-10-11 (decisions log) before the snapshot, so the data rule excludes it. Say if it should still count as new.
- The five planned harness repos appear only in the tracker. The territory and GitHub organisations tables list repositories from the pre-rollout snapshot, which does not include them, so those tables have no badges yet. Say if planned repos should get their own rows in those tables.

**Notes**

- The map now includes a plan-tab wording change that was already in `src/estate-map-plan.html`, made outside this run: "pending - Kris checks the names on this map before any are created".
- When the live snapshot was refreshed, it left out git worktrees (`tools-ki-principals` and `tools-mgit-principals` from another run). This avoids false `now:` path differences.
- Generator backup before this change: `/tmp/estate-map-gen.py.bak-emapnew`.
