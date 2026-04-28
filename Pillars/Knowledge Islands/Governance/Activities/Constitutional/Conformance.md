---
tags:
  - card/activity
  - topic/knowledge-islands
  - topic/governance
status: current - April 2026
purpose: Constitutional activity — verifies that an island meets its Knowledge Islands baseline and that every non-constitutional activity group has an explicit adoption position
author: Written with Claude
---

# Conformance

## Overview

The Conformance Check verifies that a Knowledge Island continues to meet its constitutional baseline and that its adoption record is complete and internally consistent. It is the sole constitutional activity: required of any island running Knowledge Islands, not subject to the adoption framework, and self-grounding — the mechanism that checks conformance is itself part of what conformance means.

Unlike maintenance activities, which check the health of a running island, Conformance checks whether the island is valid at all. It runs prior to other checks in the maintenance sequence.

---

## Trigger

Scheduled. Conformance should run at least weekly — daily on working days is the recommended cadence. Because it is constitutional, any gap longer than a week means the island has gone without verification of its own validity. The actual cron is defined in the island's [[Pillars/Knowledge Capital/Charter|Charter]].

---

## Outcome

A conformance report covering three areas:

**Constitutional baseline** — verifies that the two constitutional elements exist and are correctly populated:
- `Knowledge Capital/Charter` exists, contains the required Identity parameters, and declares adoption positions for all known non-constitutional activity groups
- This activity (Conformance) is present in the island's scheduled task configuration

**Adoption completeness** — for every non-constitutional activity group defined in `Activities/`, verifies that the island's Charter carries an explicit `adopted` or `vetoed` position. Any group with no position is flagged as non-conformant (unknown).

**Adoption consistency** — for every group marked `adopted` in the Charter:
- Verifies that the required Knowledge Capital configuration notes exist (as declared in each group's Adoption Requirements)
- Verifies that the required KC notes are populated, not empty stubs

A vetoed group requires a corresponding stub in the Knowledge Capital acknowledging the veto. Any veto without a stub is flagged.

The report distinguishes **critical** non-conformances (constitutional baseline failures) from **standard** non-conformances (adoption gaps or consistency failures). Critical failures are surfaced first.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Activities/Constitutional/Constitutional|Constitutional]] - parent group index
- [[Pillars/Knowledge Islands/Governance/Activities/Activities|Activities]] - full activity index
- [[Pillars/Knowledge Islands/Governance/Activities/Authoring Activities|Authoring Activities]] - five-layer content model
