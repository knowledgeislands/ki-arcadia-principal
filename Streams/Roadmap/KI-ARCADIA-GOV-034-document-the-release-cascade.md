---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-034
area: GOV
title: Document the release cascade
kind: deliver
purpose: governance
project: estate-factorisation
component: operations
status: done
blocks: []
blocked_by: []
baseline_ref: 61f86c072cb6c03158f6640ef88e797405f9a8f1
created_at: 2026-10-09T07:23:29Z
updated_at: 2026-10-09T07:50:00Z
---

# Document the Release Cascade

## Goal

Arcadia holds one canonical, admin-side overview of how a change in any Knowledge Islands tooling project is released, published, announced and taken on by every other project and by Kris's machines, marking what is automatic today, what is manual, and what Kris has approved to become automatic.

## Context

Kris Brown, 2026-10-09 (gov-020 decisions log, Decision 7): how release cycles work across the tooling projects is important, durable admin knowledge for Arcadia, not published on the website. It must show the cascade from a change in any tooling project, through its release, to how every other project is notified and takes the change on, drawn with Archify. The same decision approves automatic `ki` pin bumps and their automatic merge, and the release bot across all `knowledgeislands` repositories only, deciding KI-HARNESS-GOV-161.

Evidence already gathered in the harness and tools-ki:

- the `ki-repo-tools` release-on-demand policy (KI-HARNESS release-policy work, 2026-10-08);
- the tools-ki v0.10.0 release and its tap and website propagation (2026-10-08);
- the KI-HARNESS-GOV-161 decision brief and delivery: XDR-KI-HARNESS-001 amended, the harness `update-ki-pin.yml` requesting auto-merge behind guards, and KI-HARNESS-GOV-168 captured for the twenty inline-pin repositories;
- the tools-ki user guide "How releases reach your repositories" (`0ab3c20`), which duplicates the overview this record makes canonical.

The cascade spans tools-ki, ki-agentic-harness, homebrew-tap, tools-mgit, tools-git-almanac, tools-rig, tools-techne, the nine `mcp-*` servers, ki-website, and the unreleased ki-techne-harness and apps-observatory.

## Steps

1. Add `Admin/Operations/Processes/Release Cascade.md` as an `admin-process` note: the projects, the six stages, the automatic, manual and approved table, and "What Kris does, and when".
2. Keep its Archify source `Release Cascade.archify.json` and exported `Release Cascade.svg` beside it, following the Agent Host Prototype Rollout pattern.
3. Add a section for it to the `Processes` index note.
4. Outside Arcadia, under each repository's own authority: link the note as the overview from the tools-ki releasing guide and the harness `ki-repo-tools` release-on-demand policy, and retire the duplicating tools-ki user guide.

## Files touched

- `Admin/Operations/Processes/Release Cascade.md`
- `Admin/Operations/Processes/Release Cascade.archify.json`
- `Admin/Operations/Processes/Release Cascade.svg`
- `Admin/Operations/Processes/Processes.md`
- This record

## Verify

- The note's facts match the cited reports and the live repositories, and every tooling project in the registry appears.
- Archify `finalize` passes at `showcase` quality and the SVG renders.
- The commit hooks' Markdown gate passes, and `ki repo audit` passes `ki-repo-kb`, `ki-repo-kb-streams` and `ki-repo-kb-principal`.

## Dependencies / blocks

None. Changes no GitHub settings, workflows or pins.

## Discussion

### Capture

Captured on Kris's instruction (gov-020 decisions log, Decision 7).

### Adoption and plan

Adopted Now and planned Ready on 2026-10-09: Kris's instruction is the approval of its outcome, so the record is captured, planned, delivered, accepted and pruned in one run.

## Review

### Delivered

`Admin/Operations/Processes/Release Cascade.md` is the canonical overview: the project table, the six stages from a change landing to Kris's machines, the automatic, manual and approved table, and "What Kris does, and when". Its Archify source and exported SVG sit beside it, and the `Processes` index introduces it. The draft and diagram from the first run were reused and brought up to date with KI-HARNESS-GOV-161's delivery: the Harness updater's guarded auto-merge request, XDR-KI-HARNESS-001's exception, and KI-HARNESS-GOV-168's rollout.

### Verification

- Facts checked against the live checkouts: twenty inline `KI_VERSION: v0.8.4` pins, the Harness receiver file at `v0.8.4`, nine `mcp-*` servers with no tags, the tap's single release consumer `ki-website`, and each tool's release trigger.
- Archify `finalize` passed at `showcase` quality (validate, deliver, check and browser-check gates), and the SVG renders with its custom legend.
- `ki repo audit` gives PASS=21 WARN=3 FAIL=0; all three warnings (CI-1, HOOK-1, STREAM-10) predate this record. The commit hooks' Markdown gate passes.

### Outstanding concerns

None. No GitHub settings, workflows or pins were changed.

### Post-change review

The note, its source and SVG, and the index section landed in the planned files only. The tools-ki and harness links are made under those repositories' own authority.

### Mini recap

The release cascade now has one Arcadia home; follow-up automation is already captured as KI-HARNESS-GOV-168.

### Acceptance

Accepted done on 2026-10-09 under Kris's instruction (gov-020 decisions log, Decision 7). The tools-ki releasing guide (`1852c07`, retiring the duplicate user guide) and the harness release-on-demand policy (`96a144a3`) now link the note as the overview.

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
