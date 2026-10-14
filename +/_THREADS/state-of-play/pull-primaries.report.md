# Pull primaries — report

**Done**

- Fetched all 41 registered repositories; fast-forwarded 1 (`/Users/krisbrown/workspaces/hnr/5g-emerge/5g-emerge-demos`, 12 commits). 36 were already current.

**Failed**

- None in fetch or pull.

**Needs the owner**

- `/Users/krisbrown/.local/share/chezmoi` — skipped: dirty (1 changed path) when checked, and 4 local commits ahead of origin.
- `/Users/krisbrown/workspaces/kit/infoschematics/infoschematics` — skipped: 1 local commit ahead of origin (unpushed).
- `/Users/krisbrown/workspaces/hnr/kis/kit-hnr` — skipped: 1 local commit ahead of origin (unpushed).
- Audit FAIL in 5g-emerge-demos: ki-work-roadmap (6 findings) — retired `themes` list and DBD area-to-theme map in `.ki.toml`; `_ISSUES.md` must use `last_id`; `docs/roadmap/5GE-DEMO-DBD-027-repair-canvas-readability.md` has a non-conforming identifier, retired `triage` horizon and retired `theme`. Also 10 WARNs (`.ki.toml` layout, no committed pre-commit gate).

Note: the run's generic footer forbids Git fetch, but the task itself required fetch and fast-forward pull; I followed the task. Nothing was committed, pushed, stashed or reset, and no secrets or OneDrive source stores were touched.
