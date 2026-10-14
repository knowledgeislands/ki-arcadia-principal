# Estate map - sticky toolbar

**Done**

- Map published: personal-principal `a953039` on `main`, pushed fast-forward, level with origin. Only `Estate Map.html` committed; `Estate Targets.json` was unchanged by regeneration. `git pull --rebase` was clean.
- The header is now one compact bar that sticks to the top (`position: sticky; top: 0`, solid background, subtle shadow once scrolled). It holds the title and timestamp in small type, the corrections count with Export / Copy / Clear, the tabs, and a jump list for the active tab:
  - Territories: the eight territories in ranking order (Personal, Knowledge Islands, Legal, Humans Not Robots, Valle Armonia, Sacred Inquiry, Techmedix, Equal Remedy).
  - GitHub organisations: the summary and each organisation; Renames and decisions: tracker, decisions and each item; Desktop projects: each app; Rollout plan: each phase and Safeguards. Warp tabs has a single section, so its jump list is hidden.
  - The link for the section in view is highlighted while scrolling.
- Headings, sections and plan rows use `scroll-margin-top` tied to the bar's measured height, so jumps (and the existing summary links) land just below the bar.
- Narrow windows: tabs and jump list scroll horizontally; the corrections controls wrap.
- Print hides the bar and shows a plain title and timestamp instead. The intro line and the corrections hint moved just below the bar.
- Checks (headless Chrome): bar at top 0 unscrolled; a jump to Valle Armonia leaves its heading 8px below the 106px bar, with the bar shadowed and the link highlighted; tab switching still updates the hash; the export, copy and clear functions and 337 editable fields are present; at 500px wide all controls fit; the print PDF shows no bar. Generator ran cleanly ("applied 28 corrections"); no "today"; diff covers only the header, styles, script and timestamp.
- Live snapshot refreshed with git worktrees excluded; registry, territories and checkouts unchanged.
- Backups: `/tmp/estate-map-gen.py.bak-emaptoolbar`, `/tmp/EstateMap.html.bak-emaptoolbar`, `/tmp/EstateTargets.json.bak-emaptoolbar`, `/tmp/emap-live.bak-emaptoolbar`.
