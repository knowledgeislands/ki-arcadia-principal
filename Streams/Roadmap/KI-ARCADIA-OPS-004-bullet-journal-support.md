---
note_type: stream-roadmap
id: KI-ARCADIA-OPS-004
area: OPS
title: Bullet Journal support
kind: deliver
project: island-model-and-tending
component: calendar
tags:
  - topic/knowledge-islands
status: done
priority: low
blocks: []
blocked_by: []
baseline_ref: 3eb0dae827aa6d611a044e69025f1b40c4023582
created_at: 2026-04-28T18:32:31Z
updated_at: 2026-10-08T08:51:27Z
author: Written with Claude
---

# Bullet Journal Support Proposal

## Goal

Give the Daily, Weekly and Monthly Calendar templates a Bullet Journal shape - rapid logging and migration markers - without breaking any automation that reads those notes, and capture the method itself as external reference.

---

## Context

The Calendar templates are minimal placeholders: a daily note has an Overview and a Tasks list, and the weekly and monthly notes list their child notes. Ryder Carroll's Bullet Journal method offers a proven structure for the same job: rapid logging with typed bullets (task, event, note), signifiers, and monthly migration that forces each open task to be carried forward, scheduled or dropped. Adapting rapid logging and migration markers to Obsidian Markdown gives the daily note a working log and the monthly note a migration review, while collections map onto the island's existing Pillars and Resources rather than new Calendar structures.

The templates are not free-standing: the daily template is read and extended by automations and agent procedures, so its frontmatter and the headings those procedures rely on must survive unchanged.

---

## Boundary

- Additive only: preserve all frontmatter keys (`note_type`, tags, `status`, `author`, and `day_type` on the daily template) and every existing heading in each template.
- Add rapid-logging and migration markers only; do not introduce BuJo collections, index or future-log structures as new Calendar note types.
- No change to the Session, Meeting or Yearly templates, to Calendar note placement rules, or to any activity prompt.
- No scheduled task change and no cross-repository write.
- The BuJo method itself is external reference and lives in `Resources/`; the island's adaptation of it lives with the templates in Pillars.

---

## Current state

- `Pillars/Philosophy/Model/Tools/Obsidian/Templates/Calendar - Daily.md`: frontmatter includes `day_type: work-day` and `calendar/daily` tag; headings `## Overview`, `## Contents`, `### Tasks`.
- `Calendar - Weekly.md`: `## Overview`, `## Contents`, `### Daily Notes`. `Calendar - Monthly.md`: `## Overview`, `## Contents`, `### Daily Notes`, `### Weekly Notes`.
- Consumers of the daily note: `Admin/Operations/Activities/Schedule.md` reads `day_type`; the Scheduled Task Audit prompt writes under `## KI` / `### Scheduled Task Audit`; the Knowledge Rebuild prompt locates or adds `### Sessions`; `Pillars/Philosophy/Model/Agents/Claude/Claude.md` Mode E creates the daily note from the template. `## KI` and `### Sessions` are added at runtime, not by the template.
- Calendar convention text is the `Calendar` passage under `### Top-Level Folders` in `Pillars/Philosophy/Model/Conventions/Structure/Structure.md`; `Pillars/Philosophy/Model/Tools/Obsidian/Templates/Templates.md` describes each template.
- `Resources/` holds only `Resources/Resources.md`, an index with an empty `## Overview` and `## Contents`; there are no Resources subfolders.

---

## Steps

- [x] Research the method from primary sources (bulletjournal.com and Ryder Carroll's published method) and record which concepts map cleanly to Obsidian daily, weekly and monthly notes and which need adaptation.
- [x] Create `Resources/Productivity/Productivity.md` (index: prose Overview and one H2 per child) and `Resources/Productivity/Bullet Journal.md` describing the method as external reference with source links.
- [x] Add a `## Productivity` section to `Resources/Resources.md` and give its `## Overview` a short orienting paragraph.
- [x] Revise `Calendar - Daily.md` additively: a rapid-log section using Obsidian-compatible markers (`- [ ]` task, `- [x]` done, `- [>]` migrated, `- [<]` scheduled, `- [-]` dropped, plain `-` note, `- o` event), keeping `## Overview`, `## Contents`, `### Tasks`, all frontmatter, and not adding `## KI` or `### Sessions`.
- [x] Revise `Calendar - Weekly.md` additively with a short review of open and migrated items, keeping existing headings and frontmatter.
- [x] Revise `Calendar - Monthly.md` additively with a migration section for carrying forward, scheduling or dropping open tasks, keeping existing headings and frontmatter.
- [x] Document the marker legend and migration convention in the `Calendar` passage of `Pillars/Philosophy/Model/Conventions/Structure/Structure.md` and update the three template descriptions in `Templates.md`, linking the new Bullet Journal note.

---

## Files touched

- `Pillars/Philosophy/Model/Tools/Obsidian/Templates/Calendar - Daily.md`
- `Pillars/Philosophy/Model/Tools/Obsidian/Templates/Calendar - Weekly.md`
- `Pillars/Philosophy/Model/Tools/Obsidian/Templates/Calendar - Monthly.md`
- `Pillars/Philosophy/Model/Tools/Obsidian/Templates/Templates.md`
- `Pillars/Philosophy/Model/Conventions/Structure/Structure.md`
- `Resources/Resources.md`
- `Resources/Productivity/Productivity.md` (new)
- `Resources/Productivity/Bullet Journal.md` (new)
- this record

---

## Verify

- Every heading present in each template at baseline is still present (`git diff <baseline> -- 'Pillars/Philosophy/Model/Tools/Obsidian/Templates/Calendar - *.md'` shows no removed heading or frontmatter line).
- `grep -rn -E '## KI|### Sessions|day_type' Pillars/Philosophy/Model/Tools/Claude/Activities Admin/Operations/Activities` lists the same consumers as at baseline, and the revised daily template neither removes `day_type` nor pre-creates `## KI` or `### Sessions`.
- Each template's frontmatter parses as YAML once Templater placeholders are substituted.
- `Resources/Productivity/` has a same-name index note and `Resources/Resources.md` has a `## Productivity` section.
- `ki repo audit --skill ki-repo-kb --repo . --progress never` PASS.
- `ki repo audit --progress never` PASS.

---

## Dependencies / blocks

No dependency. Calendar notes created before delivery are not migrated; the new shape applies to notes created afterwards.

`KI-ARCADIA-OPS-006` would also have seeded the `Resources/Resources.md` `## Overview`. It was cancelled on 2026-10-07, so this record no longer shares that index with another delivery.

---

## Documentation impact

### Decision Records

None. The change is a template refinement within existing Calendar conventions.

### Specifications

None.

### Guides

`Structure.md` gains the marker legend and migration convention; `Templates.md` updates three template descriptions; a new Resources note describes the external method.

### Roadmap

This record moves to awaiting-review on delivery; no follow-up record is expected.

---

## Review

### Delivered

The daily, weekly and monthly Calendar templates gain Bullet Journal rapid-logging and migration sections, additively, and the method itself is captured as external reference in a new `Resources/Productivity/` folder. Baseline `3eb0dae827aa6d611a044e69025f1b40c4023582`; the result is the delivery commit that sets this record to awaiting-review.

### Change Summary

- `Calendar - Daily.md`: new `### Log` rapid-log section after `### Tasks`, with the marker set from the plan. Frontmatter, including `day_type`, and every existing heading unchanged; no `## KI` or `### Sessions`.
- `Calendar - Weekly.md`: new `### Review` section for open and migrated tasks.
- `Calendar - Monthly.md`: new `### Migration` section giving every open task one outcome.
- `Structure.md`: the Calendar passage gains the marker legend and the migration convention, and states that collections, index and future log are not adopted as Calendar note types.
- `Templates.md`: the three template descriptions name the new sections, and the Calendar section links [[Bullet Journal]] and [[Structure]]; status month updated.
- `Resources/Productivity/Productivity.md` (new index) and `Resources/Productivity/Bullet Journal.md` (new): the method as external reference, with a mapping table of what fits Obsidian cleanly, what is adapted and what is not adopted, and source links.
- `Resources/Resources.md`: an orienting Overview and a `## Productivity` section; the empty `## Contents` heading is replaced, since the index now has a child section.
- Research was drawn from Ryder Carroll's published method and official channel as already summarised in kit-principal's `Bullet Journal Method` reference note; no live web fetch was made under the run's no-remote-call rule. The marker set is confirmed as the plan proposed; the mood bullet is described in the Resources note but not added to the templates.

### Verification

- `git diff` of the three Calendar templates against the baseline removes no line: no heading or frontmatter key lost.
- The consumer grep over `Pillars/Philosophy/Model/Tools/Claude/Activities` and `Admin/Operations/Activities` lists the same seven lines as at baseline; the daily template contains neither `## KI` nor `### Sessions`.
- Every template and new Resources note's frontmatter parses as YAML with Templater placeholders substituted.
- `Resources/Productivity/` has its same-name index; `Resources/Resources.md` has a `## Productivity` section.
- `rumdl check` on the touched notes: no issues. No en or em dash in any touched note.
- `ki repo audit --skill ki-repo-kb --repo . --progress never` on 2026-10-08: PASS, 4 skills.
- `ki repo audit --progress never` on 2026-10-08: PASS=22 WARN=2 FAIL=0. The warnings are the repository-wide missing pre-commit gate (HOOK-1) and the inline `KI_VERSION` pin in CI (CI-1), both unrelated to this record.

### Outstanding concerns

- `- [>]`, `- [<]` and `- [-]` render as ticked checkboxes in default Obsidian; distinct icons need a theme or CSS snippet, which this record does not add.
- Calendar notes created before delivery keep their old shape, as planned.

### Post-change review

The goal is met within the boundary: additive template sections only, no new Calendar note type, no Session, Meeting or Yearly template change, no prompt or scheduled-task change and no cross-repository write. Regression risk is low: the automations' headings and `day_type` are untouched. This is the implementing agent's own check, not an independent review.

### Mini recap

KI-ARCADIA-OPS-004 gives the Calendar templates a Bullet Journal shape and adds the method as Resources reference. Learning route: the marker legend in [[Structure]].

## Done

Accepted 2026-10-08 under Kris's standing decision in the state-of-play decisions log: Decision 17 (2026-10-07), "Delivered records count as done (Decision 12) and are pruned once verified", applied to this focus2 delivery by Decision 19. The checkbox-rendering concern needs no follow-up record unless Kris wants distinct marker icons.

## Discussion

### Decisions under delegated autonomy

- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: preserve all frontmatter (`day_type`, tags) and every heading that scheduled prompts and agent procedures read.
- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: add rapid-logging and migration markers only.
- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: capture the BuJo method as external reference under `Resources/`, creating a folder and index because Resources has no subfolders.

### Planning choices

- The Resources folder is named `Productivity`, matching the folder example in `AGENTS.md`; reversible at delivery if a better subject name emerges.
- The `## KI` and `### Sessions` headings are runtime additions by prompts. The template must leave room for them rather than pre-create them, since `AGENTS.md` asks for `### Sessions` to be omitted when a day has no sessions.
- The marker set follows the common Obsidian task-status convention so markers render as checkboxes without a plugin dependency; the exact set is confirmed during research.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
