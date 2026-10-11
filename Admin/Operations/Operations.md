---
note_type: admin/index
updated: 2026-10-11T01:41:00Z
tags:
  - card/note
  - topic/knowledge-islands
status: current - June 2026
author: Written with Claude
---

# Operations

## Overview

The `Admin/Operations/` arm holds the artefacts that describe **how Arcadia runs day to day** - activities, processes, live artifacts and the operational lessons register. The active agent skill set is not recorded here: it is declared in `.ki.toml` and listed in [[Admin/Governance/Conformance|Conformance]]. These are live, mutable artefacts specific to Arcadia's integrations and conventions; what the island must be is defined in [[Admin/Governance/Governance|Governance]]. The arm was populated by migration from `Pillars/Knowledge Capital/` per [[Admin/Governance/Decisions/GDR-KI-ARCADIA-002-admin-zone-governance-and-operations|GDR-KI-ARCADIA-002]].

## Activities

[[Admin/Operations/Activities/Activities|Activities]] holds Arcadia's Activity notes and its timing model. Its Schedule defines the day-type taxonomy automations read from each daily note, and each Activity note records one group's adoption and configuration, including those adopted only to record a veto. The authoritative roster of enabled activities remains the Charter; this folder holds the definitions and timing.

## Live Artifacts

[[Admin/Operations/Live Artifacts/Live Artifacts|Live Artifacts]] is reserved for dynamic operational documents - dashboards, status boards, queues and trackers - that are updated in place as the island's state changes. Each is meant to pair a Markdown source with a refreshed HTML render. None is adopted yet; the collection stays because the adopted `ki-repo-kb-live-artifacts` skill expects it.

## Mistakes and Lessons

[[Mistakes and Lessons]] is a closed-loop register of mistakes made during island operations. When an agent gets something wrong, the incident is logged, the fix is applied to the relevant memory or island file, and the resolved lesson is kept in a permanent table. The incident log is meant to be empty most of the time.

## Processes

[[Admin/Operations/Processes/Processes|Processes]] holds Arcadia's realisations of generic Knowledge Islands processes and its territory-wide operating processes. The [[Admin/Operations/Processes/Enactment Process|Enactment Process]] is the ratification mechanism for changes to canonical knowledge; the Release Cascade shows how a tooling release reaches the tap, the website registry and every consuming repository.
