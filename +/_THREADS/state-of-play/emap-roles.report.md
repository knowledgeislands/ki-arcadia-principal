# Estate map - Capital and harness row roles

**Done**

- Map published: personal-principal `896f190` on `main`, pushed fast-forward, level with origin. Only `Estate Map.html` committed; `Estate Targets.json` regenerated identical.
- Territory tables: Capital first, the territory's agentic harness second (detected by the `-agentic-harness` suffix, planned ones included), then registered and planned repositories by name; grey rows unchanged at the bottom, by organisation then name.
- GitHub organisation tables: same order and colours. Roles are judged on the target name, so baseline names such as `kit-principal` or `er-research` show as Capitals.
- Colours: Capital violet (tint `#f5f3ff`, 5px left border `#7c3aed`, bold); harness indigo (tint `#eef2ff`, border `#4f46e5`). Planned harness rows keep the dashed blue treatment and add the indigo border. Both roles are in the Territories and GitHub organisations keys. Print colour forced on.
- Consistency fix: the organisation tables now count a repository registered since the baseline as registered, matching the territory tables. `sacred-inquiry/si-principal` therefore shows as a registered Capital rather than a grey row, and the Sacred Inquiry summary now counts 1 registered.
- Checks: live snapshot refreshed with git worktrees excluded (registry, territories and checkouts unchanged); the generator ran cleanly; every territory table starts with Capital then harness; no "today" on the page; the diff touches only row classes and order, CSS, keys and the timestamp.
- Generator backup: `/tmp/estate-map-gen.py.bak-emaproles`.

**Failed**

- `git pull --rebase` refused because of other people's uncommitted changes in personal-principal. `git fetch` showed the branch was not behind, so the push went ahead fast-forward and those changes were left alone.
