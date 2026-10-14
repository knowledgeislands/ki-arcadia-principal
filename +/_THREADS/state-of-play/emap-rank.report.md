# Estate map - territory ranking order

**Done**

- Map published: personal-principal `276b073` on `main`, pushed fast-forward, level with origin. Committed only `Estate Map.html` and `Estate Targets.json`.
- `Estate Targets.json` now holds `territory_order` (Decision 95: personal, knowledge-islands, legal, humans-not-robots, valle-armonia, sacred-inquiry, techmedix, equal-remedy). The generator reads it from the manifest and writes it back each run. If it is unset, the generator falls back to the old derived order (Knowledge Islands first, then alphabetical).
- Ranked order now applies to:
  - the territory sections and the summary table's links
  - the GitHub organisation summary and organisation tables: each organisation follows its managing territory, so `krisb` comes first under personal, and unadopted organisations stay last, alphabetical
  - the Desktop projects target folders (legacy folders stay last)
  - the Warp target tabs
- The Desktop and Warp key notes now name the ranking rather than "Knowledge Islands first".
- Row order within each table is unchanged from emap-roles: in every territory the Capital comes first, then the harness.
- Checks:
  - Live snapshot refreshed with git worktrees excluded; the registry and checkouts are unchanged.
  - The generator ran cleanly, and every tab's order was verified.
  - The page does not contain "today".
  - The diff covers only ordering, the two key notes, the timestamp and `territory_order`.
- Generator backup: `/tmp/estate-map-gen.py.bak-emaprank`.

**Failed**

- `git pull --rebase` refused because of other people's uncommitted changes in personal-principal. `git fetch` showed the branch was not behind, so the push went ahead fast-forward and those changes were left alone.
