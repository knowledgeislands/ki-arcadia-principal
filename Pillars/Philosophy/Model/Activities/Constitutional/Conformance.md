---
note_type: pillars/note
tags:
  - card/activity
  - topic/knowledge-islands
  - topic/governance
status: current - October 2026
author: Written with Claude
---

# Conformance

## Overview

The Conformance Check verifies that a Knowledge Island continues to meet its constitutional baseline and that its adoption record is complete and internally consistent. It is the sole constitutional activity: required of any island running Knowledge Islands, not subject to the adoption framework, and self-grounding - the mechanism that checks conformance is itself part of what conformance means.

Unlike tending activities, which check the health of a running island, Conformance checks whether the island is valid at all.

---

## Trigger

Scheduled. Conformance should run at least weekly - daily on working days is the recommended cadence. Because it is constitutional, any gap longer than a week means the island has gone without verification of its own validity. The actual cron is defined in the island's [[Admin/Governance/Charter|Charter]].

---

## Outcome

A conformance report covering three areas:

**Constitutional baseline** - verifies that the two constitutional elements exist and are correctly populated:

- The Charter (`Admin/Governance/Charter.md`) exists, contains the required Identity parameters, and declares adoption positions for all known non-constitutional activity groups. The baseline requires an `## Identity` section with the island name, the skill name and the task prefix; an `## Activity Groups` table with at least one row; a `## Scheduled Activities` table; and a `## Tools` section
- This activity (Conformance) is present in the island's scheduled task configuration

**Adoption completeness** - for every non-constitutional activity group defined in `Activities/`, which is a subfolder whose same-name index carries an `## Adoption Requirements` table (Constitutional is excluded), verifies that the island's Charter carries an explicit `adopted` or `vetoed` position. Any group with no position is flagged as non-conformant (unknown).

**Adoption consistency** - for every group marked `adopted` in the Charter:

- Verifies that the group's Activity Definition note linked from the Charter exists, and that every note declared in its framework group's Adoption Requirements exists
- Verifies that the required notes are populated, not empty stubs. A note that says "not applicable" or "vetoed" counts as a stub and fails for an adopted group

A vetoed group's Activity Definition note must explicitly acknowledge the veto. Any veto without such a note is flagged. A Charter group with no framework group index is reported as island-local and informational.

The report distinguishes **critical** non-conformances (constitutional baseline failures) from **standard** non-conformances (adoption gaps or consistency failures). Critical failures are surfaced first. The overall status is `CONFORMANT` when all three areas pass, `NON-CONFORMANT (CRITICAL)` when the constitutional baseline has any failure, and `NON-CONFORMANT` when only standard non-conformances exist.

The check is read-only. It modifies no file and proposes no fixes; it presents the report for human review.
