---
note_type: stream-roadmap
id: KI-ARCADIA-OPS-008
area: OPS
title: Scheduled automations
theme: operational-tooling
tags:
  - topic/knowledge-islands
  - topic/automation
status: ready
priority: low
horizon: now
candidate: true
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-04-28T18:32:31Z
updated_at: 2026-10-05T08:41:00Z
author: Written with Claude
---

# Scheduled Automations Proposal

## Goal

The weekly Health Check surfaces stale draft notes, and Arcadia's existing scheduled prompts stop early and cheaply on days with nothing to do, without adding any new scheduled task.

---

## Context

The record was captured in April 2026 as five ideas for the automation suite: a meeting-prep heartbeat, email intelligence in the morning briefing, a nightly repository organiser, a decay-aware draft review, and a pre-invocation gate for scheduled tasks. The first three would each add a new scheduled task or data source and therefore new spend; the last two improve what already runs. This record carries the two low-risk improvements and leaves the three new tasks as an owner adoption choice.

The active schedule is the Charter Scheduled Activities table: Conformance (work-day 04:30), Scheduled Task Audit (work-day 05:00), Morning Briefing (work-day 06:00), Health Check (Monday 08:00) and Knowledge Rebuild (Wednesday 07:00). The gate pattern itself is defined by [[KI-ARCADIA-OPS-009-token-economics|OPS-009]] in a new Token Economics note.

---

## Boundary

- No new scheduled task and no Charter change: the meeting-prep heartbeat, email scan and nightly organiser are out of scope.
- Prompt-note edits only. Pushing edited prompts to the live Cowork scheduled tasks follows the Scheduled Task Audit Sync Protocol and happens only on Kris's explicit "push it" signal; it is not part of this record's acceptance.
- No prompt may lose a heading that an automation reads (`## Schedule`, `## Prompt` and the numbered `Step` headings Scheduled Task Audit compares).
- The Morning Briefing prompt is not held in this island, so it is out of scope.
- No spend, no remote operation under the [[Techne Programme Hold]], no cross-repository change.

---

## Current state

- Scheduled prompt notes held in the island: `Pillars/Philosophy/Model/Tools/Claude/Activities/Constitutional/Conformance.md`, and `Tending/Scheduled Task Audit.md`, `Tending/Health Check.md` and `Tending/Knowledge Rebuild.md` in the same `Activities/` tree. `Tending/Convergence Check.md` is ad hoc, not scheduled.
- The Health Check prompt's Step 3 checks "stale content" in general terms and Step 5 flags inbox items older than a week; nothing looks at `draft` status or last-modified age. The activity definition `Pillars/Philosophy/Model/Activities/Tending/Health Check.md` lists the checks under `## What It Does`.
- No scheduled prompt has an early-exit gate.
- All four scheduled prompts still locate the repository through `Knowledge Capital.md` or read `Pillars/Knowledge Capital/Charter.md`. No such file exists: governance moved to `Admin/Governance/` under GDR-KI-ARCADIA-002. In the three Tending prompts this is a Step 0 locator (`find ... -name "Knowledge Capital.md"`, plus the Charter path in Scheduled Task Audit's Preparation list), so Step 0 points at a missing path. In the Conformance prompt the references are its adoption model rather than a locator; that rewrite is [[KI-ARCADIA-OPS-011-rewrite-conformance-adoption-model|OPS-011]].

---

## Steps

- [ ] Confirm [[KI-ARCADIA-OPS-009-token-economics|OPS-009]] has delivered the gate pattern; if not, use the pattern as written in OPS-009's Steps and cite it.
- [ ] Add a `## Step 5b - Decay-aware draft review` to the Health Check prompt: list notes whose frontmatter `status` begins with `draft`, outside `+/`, `-/`, `Calendar/` and `Streams/Roadmap/`, with last-commit date from `git log -1 --format=%cs -- <path>`; report 30+ days as candidates for promotion, archiving or deletion and 60+ days as long-stale; propose only, write nothing.
- [ ] Add the decay-aware draft review to `## What It Does` in the Health Check activity definition.
- [ ] Repair the Step 0 / Preparation `Knowledge Capital.md` locator and Charter path in the three Tending prompts (Health Check, Knowledge Rebuild, Scheduled Task Audit) that the new gate depends on, so each resolves the repository root from `Admin/Governance/Charter.md`. Keep every existing heading text unchanged.
- [ ] For each of the three Tending scheduled prompts, decide whether a cheap pre-invocation signal exists (for example no commits to the inputs since the last run). Where it does, add the gate as the first step with an explicit early exit and one-line report. Where it does not, record "gate not applicable" and the reason in this record's Discussion.
- [ ] Confirm each edited prompt still carries every heading listed in the Boundary.
- [ ] Record in Discussion which prompt notes changed and that live-task sync awaits Kris's signal.

---

## Files touched

- `Pillars/Philosophy/Model/Tools/Claude/Activities/Tending/Health Check.md`
- `Pillars/Philosophy/Model/Activities/Tending/Health Check.md`
- `Pillars/Philosophy/Model/Tools/Claude/Activities/Tending/Knowledge Rebuild.md`
- `Pillars/Philosophy/Model/Tools/Claude/Activities/Tending/Scheduled Task Audit.md`
- `Streams/Roadmap/KI-ARCADIA-OPS-008-scheduled-automations.md`

---

## Verify

- `git diff --quiet HEAD -- Admin/Governance/Charter.md` succeeds: the Scheduled Activities table is unchanged.
- The Health Check prompt contains `## Step 5b - Decay-aware draft review` and the definition's `## What It Does` mentions decay-aware draft review.
- Each edited prompt still contains `## Schedule` (where it had one), `## Prompt` and every `Step` heading it had before, apart from the new ones (`git diff` shows no removed heading lines).
- `grep -nE 'Knowledge Capital(\.md|/)' Pillars/Philosophy/Model/Tools/Claude/Activities/Tending/{Health\ Check,Knowledge\ Rebuild,Scheduled\ Task\ Audit}.md` returns nothing (no stale locator or Charter path remains).
- `git diff --quiet HEAD -- Pillars/Philosophy/Model/Tools/Claude/Activities/Constitutional/Conformance.md` succeeds: the Conformance prompt belongs to OPS-011.
- Discussion records a gate or "not applicable" outcome for each of the three Tending prompts.
- `ki repo audit --skill ki-repo-kb-activities --repo . --progress never` PASS.
- `ki repo audit --progress never` PASS.

---

## Dependencies / blocks

Preferably delivered after [[KI-ARCADIA-OPS-009-token-economics|OPS-009]], which defines the gate pattern; this is sequencing, not a blocker, because the pattern is already specified in that record's Steps. Live-task sync is a later owner-signalled action outside this record.

---

## Documentation impact

### Decision Records

None. Adding a check to an existing activity and an early-exit step to existing prompts is routine; no activity is adopted or enabled.

### Specifications

None. Activity and prompt formats are owned by `ki-repo-kb-activities` and [[Authoring Guidelines]], and are unchanged.

### Guides

The Health Check definition and prompt gain the decay review; the three Tending scheduled prompts gain a gate or a recorded reason for none.

### Roadmap

This record moves to awaiting-review on delivery. The three deferred new-task ideas stay recorded below for a future owner adoption record. The Conformance prompt's adoption-model rewrite, including its gate decision, was split out as [[KI-ARCADIA-OPS-011-rewrite-conformance-adoption-model|OPS-011]].

---

## Discussion

### Decisions under delegated autonomy

- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: scope is bounded to the decay-aware draft review in Health Check and the pre-invocation gate on existing scheduled prompts.
- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: the meeting-prep heartbeat, email scan and nightly organiser are deferred as Kris's adoption and spend choice, noted here rather than asked.

### Planning addition

Planning found every scheduled prompt still resolving `Knowledge Capital.md`, which no longer exists after the GDR-KI-ARCADIA-002 migration to `Admin/Governance/`. The gate must sit in or after Step 0, so the locator repair is included as a bounded step rather than left broken under new edits.

### Conformance prompt split (2026-10-05)

On the Fable reviewer's advice (2026-10-05), the path-repair step is narrowed to the Step 0 / Preparation locator and Charter path in the three Tending prompts. The Conformance prompt has no locator: its Preparation and Step 1 assert that `Pillars/Knowledge Capital/Charter.md` must exist, and Step 3 reads a "Knowledge Capital column" and KC index paths that the current Charter no longer carries. Repairing that means rewriting the checker's adoption model, so it and the Conformance gate decision moved to [[KI-ARCADIA-OPS-011-rewrite-conformance-adoption-model|OPS-011]], and this record no longer touches the Conformance prompt.

### Deferred new-task ideas (April 2026)

- **Proactive meeting-prep heartbeat**: a check every 15-30 minutes in working hours (for example `*/15 9-18 * * 1-5`) that sends a prep brief from prior meeting notes and Calendar context when a meeting is imminent.
- **Email intelligence in the morning briefing**: a nightly inbox scan distilled into a 3-5 line awareness layer. Note that the Email activity group is vetoed in the Charter.
- **Nightly repository organiser**: a 01:00-02:00 pass over the day's notes that adds missing wikilinks, fills omitted tags and flags `draft` notes.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
