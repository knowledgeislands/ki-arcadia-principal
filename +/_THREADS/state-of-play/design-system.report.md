# Design-system rollout assessment — report

**Done**

- Wrote the assessment to `design-system-assess.md`: a table of the nine apps-* targets, the prerequisites, the rollout order and the record shape. No commits were made and no checks were run against code: the run was read-only.
- 7 of 9 assessed from local checkouts. None declares `[skills.ki-design-system]`, so the mechanical audit refuses everywhere.
- Proposed order: vallearmonia (pilot, small) → observatory → knowledgeislands.info → midnight.ninja → markhowarth (after identity) → kris.me.uk. Defer dafacts and the two Techmedix sites.

**Failed**

- apps-childhealthyorkshire.co.uk and apps-yorkphotosoc.org were not assessed. They have no checkout, and the brief's rules forbid GitHub API calls, which conflicts with the task's "read through gh".

**Needs the owner**

- Allow a `gh` read of `techmedix/childhealthyorkshire` and `techmedix/yps`, or defer them until they are adopted.
- `ki-design-system` cannot yet be resolved by the installed `ki` 0.10.1. It needs a release or install before any repository can pass the audit.
- `Estate Targets.json` still shows the `site-*` targets, not Decision 97's `apps-*` names.
- Owner decisions: kris.me.uk (light conformance or defer), midnight tower (shared palette or separate), markhowarth (`VA-MARK-001` identity first). `VA-WEB-SITE-003` awaits acceptance before the vallearmonia pilot.
