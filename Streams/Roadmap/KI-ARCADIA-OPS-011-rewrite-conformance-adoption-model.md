---
note_type: stream-roadmap
id: KI-ARCADIA-OPS-011
area: OPS
title: Rewrite the Conformance prompt's adoption model
theme: operational-tooling
tags:
  - topic/knowledge-islands
  - topic/automation
horizon: now
status: ready
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-05T08:44:07Z
updated_at: 2026-10-05T08:44:07Z
author: Written with Claude
---

# Rewrite the Conformance Prompt's Adoption Model

## Goal

The scheduled Conformance Check prompt verifies Arcadia against the governance layout that actually exists - `Admin/Governance/Charter.md` and its Activity Groups table linking `Admin/Operations/Activities/` notes - so a run on today's tree reports real findings instead of failing on paths removed by the Knowledge Capital migration.

---

## Context

Split from [[KI-ARCADIA-OPS-008-scheduled-automations|OPS-008]] on the Fable reviewer's advice (2026-10-05). OPS-008 repairs the Step 0 locator in the three Tending prompts; the Conformance prompt has no locator, but its whole adoption model still assumes the pre-GDR-KI-ARCADIA-002 Knowledge Capital layout, so fixing it is a checker rewrite rather than a path repair.

Conformance is constitutional: the Charter Scheduled Activities table runs it every work-day at 04:30 with status `enabled`, and it cannot be vetoed. While its prompt asserts a missing Charter path, every run either reports a false CRITICAL failure or depends on the model silently correcting the prompt, so the island has no trustworthy verification of its own baseline.

---

## Boundary

- Prompt and adoption-contract edits only. Pushing the edited prompt to the live Cowork scheduled task follows the Scheduled Task Audit Sync Protocol and happens only on Kris's explicit "push it" signal; it is not part of this record's acceptance.
- No Charter change: the Activity Groups and Scheduled Activities tables are read, not edited.
- Keep every prompt heading an automation reads: `## Prompt`, `### Preparation`, the three numbered `### Step` headings and `### Reporting`.
- The wider "Knowledge Capital" terminology in other Model notes (`Constitutional.md`, the Authoring Guidelines `## Adoption Requirements` format text, other activity definitions) is out of scope beyond the edits listed in Steps.
- No new scheduled task, no spend, no remote operation under the [[Techne Programme Hold]], no cross-repository change.

---

## Current state

- The prompt is `Pillars/Philosophy/Model/Tools/Claude/Activities/Constitutional/Conformance.md`. Preparation item 1 (line 34) and Step 1 (line 41) name `Pillars/Knowledge Capital/Charter.md`, which does not exist. Step 3 (lines 64 and 66) reads "the file path given in the Knowledge Capital column" and "the group's KC index note"; the Reporting template names "the specific KC note".
- The live Charter is `Admin/Governance/Charter.md`. Its `## Identity` table carries Island name, Skill name and Task ID prefix; `## Activity Groups` has columns Group, Position and Activity Definition, with Tending and Briefings `adopted` and Email and Linear `vetoed`, each linking `Admin/Operations/Activities/<Group> Activity.md`; `## Scheduled Activities` lists Conformance as `enabled`; `## Tools` exists.
- `Admin/Operations/Activities/Email Activity.md` and `Linear Activity.md` explicitly state the veto. `Tending Activity.md`, `Briefings Activity.md` and `Schedule.md` exist.
- `Pillars/Philosophy/Model/Activities/Activities.md` has H2 sections for What Keeps an Island Alive, Constitutional, Tending and Authoring Guidelines. Only `Tending/Tending.md` carries an `## Adoption Requirements` Note | Path | Purpose table; `Authoring Guidelines.md` has a section of that name that documents the format but has no table. There is no framework group index for Briefings, Email or Linear.
- The Tending `## Adoption Requirements` table still declares `Knowledge Capital/Activities/Tending/Tending` and `Knowledge Capital/Activities/Schedule`, and its veto sentence names a `Knowledge Capital/...` stub path.
- The activity definition `Pillars/Philosophy/Model/Activities/Constitutional/Conformance.md` describes the check in terms of `Knowledge Capital/Charter` and "Knowledge Capital configuration notes" (lines 33, 40 and 43).

---

## Steps

- [ ] Preparation and Step 1: point both at `Admin/Governance/Charter.md`; keep the Identity check (island name, skill identifier, task prefix) and the Activity Groups, Scheduled Activities and Tools section checks, matching the live Charter headings.
- [ ] Step 2: define an adoptable framework group as a subfolder of `Pillars/Philosophy/Model/Activities/` whose same-name index carries an `## Adoption Requirements` Note | Path | Purpose table, excluding `Constitutional`; each such group must have an `adopted` or `vetoed` Charter row. Add that a Charter group with no framework group index (today Briefings, Email, Linear) is reported as island-local and informational, not non-conformant.
- [ ] Step 3: replace the "Knowledge Capital column" with the Charter's Activity Definition column. A vetoed group's linked note must exist and explicitly state the veto. An adopted group's linked note must exist; where a framework group index exists, each Path in its Adoption Requirements table must resolve to an existing, non-stub note relative to the repository root.
- [ ] Reporting: replace "KC note" with "required note"; leave the three-section structure and status values unchanged.
- [ ] Update the Tending `## Adoption Requirements` table Paths to `Admin/Operations/Activities/Tending Activity` and `Admin/Operations/Activities/Schedule`, and the veto sentence to name the group's Activity note, so the contract the prompt reads matches the layout.
- [ ] Update the three Knowledge Capital lines (33, 40, 43) in the Conformance activity definition to describe the Charter, Activity Definition notes and required notes in the current layout.
- [ ] Apply the [[KI-ARCADIA-OPS-009-token-economics|OPS-009]] pre-invocation gate decision to the Conformance prompt: add the gate as the first step with an explicit early exit if a cheap signal exists (for example no commits to the Charter, `Admin/Operations/Activities/` or the Model activity indexes since the last run), otherwise record "gate not applicable" and the reason in Discussion.
- [ ] Run the rewritten prompt read-only against the working tree and record the resulting report (expected CONFORMANT, with Briefings, Email and Linear listed as island-local) in Discussion.
- [ ] Record in Discussion that live-task sync awaits Kris's signal, and that Scheduled Task Audit will report prompt drift for Conformance until then.

---

## Files touched

- `Pillars/Philosophy/Model/Tools/Claude/Activities/Constitutional/Conformance.md`
- `Pillars/Philosophy/Model/Activities/Constitutional/Conformance.md`
- `Pillars/Philosophy/Model/Activities/Tending/Tending.md` (`## Adoption Requirements` section only)
- `Streams/Roadmap/KI-ARCADIA-OPS-011-rewrite-conformance-adoption-model.md`

---

## Verify

- `grep -n "Knowledge Capital\|KC " Pillars/Philosophy/Model/Tools/Claude/Activities/Constitutional/Conformance.md` returns nothing.
- `grep -n "Knowledge Capital" Pillars/Philosophy/Model/Activities/Constitutional/Conformance.md` returns nothing, and the Tending `## Adoption Requirements` section contains no `Knowledge Capital/` path.
- Every Path in the Tending Adoption Requirements table resolves to an existing file once `.md` is appended.
- `git diff -U0 HEAD -- Pillars/Philosophy/Model/Tools/Claude/Activities/Constitutional/Conformance.md | grep '^-#'` returns nothing: no heading was removed or renamed.
- `git diff --quiet HEAD -- Admin/Governance/Charter.md` succeeds.
- Discussion holds the dry-run report and the gate or "not applicable" outcome.
- `ki repo audit --skill ki-repo-kb-activities --repo . --progress never` PASS.
- `ki repo audit --skill ki-repo-kb-streams --repo . --progress never` PASS.
- `ki repo audit --progress never` PASS.

---

## Dependencies / blocks

No blocking dependency. Preferably delivered after [[KI-ARCADIA-OPS-009-token-economics|OPS-009]], which defines the gate pattern; the pattern is already specified in that record's Steps, so this is sequencing, not a blocker. It does not touch the files [[KI-ARCADIA-OPS-008-scheduled-automations|OPS-008]] edits, so the two can be delivered in either order. Live-task sync is a later owner-signalled action outside this record.

---

## Documentation impact

### Decision Records

None. Aligning a prompt and its adoption contract with the layout already decided in GDR-KI-ARCADIA-002 is routine; no activity is adopted, vetoed or enabled.

### Specifications

The Tending `## Adoption Requirements` table is the machine-readable adoption contract the Conformance Check verifies; its Paths change to the current layout. The Conformance activity definition is aligned with the prompt.

### Guides

The Conformance prompt is the executable guide for the check and is rewritten in place; no other guide changes.

### Roadmap

New record split from [[KI-ARCADIA-OPS-008-scheduled-automations|OPS-008]]; moves to awaiting-review on delivery. A wider Knowledge Capital terminology sweep of the Model activity notes may be captured separately if wanted.

---

## Discussion

### Split from OPS-008 (2026-10-05)

The Fable reviewer found that OPS-008's path-repair step was in scope only for the Step 0 locator the gate depends on. The Conformance prompt's Preparation (line 34) and Step 1 (line 41) assert `Pillars/Knowledge Capital/Charter.md` must exist, and Step 3 (lines 64 and 66) reads a "Knowledge Capital column" and KC index paths that no longer exist in the Charter. Fixing that rewrites the checker's adoption model, so it became this record, together with the Conformance gate decision that OPS-008 would otherwise have made on the same file.

### Planning decisions

- Planning decision (2026-10-05), reversible: the Tending Adoption Requirements Paths are updated rather than translated inside the prompt, because the table is the declared adoption contract and a hidden mapping in the prompt would let the two drift again.
- Planning decision (2026-10-05), reversible: Charter groups with no framework group index (Briefings, Email, Linear) are reported as island-local and informational. Treating them as non-conformant would fail a correct island; ignoring them would hide them from the report.
- Planning decision (2026-10-05), reversible: framework groups are discovered by the presence of an Adoption Requirements table, not by H2 sections of the Activities index, because that index also introduces What Keeps an Island Alive and Authoring Guidelines, which are not groups.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
