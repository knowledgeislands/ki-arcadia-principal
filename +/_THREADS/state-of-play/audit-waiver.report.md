# Audit waiver capture

## Done

- **Owner: tools-ki.** It hosts the rubric contract and computes each finding's status and verdict (`src/core/rubric/index.ts`, `src/core/runtime/audit.ts`), and it parses `.ki.toml`. No existing record or Issue covered waivers or accepted exceptions in tools-ki, ki-agentic-harness or ki-specifications. tools-ki has Issues turned off.
- **Captured [KI-TOOL-KI-CLI-122](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-122-accepted-audit-deviations.md), "Accepted audit deviations"** as triage under Project `baseline-rollout`. It describes a rubric-agnostic, host-owned `.ki.toml` declaration (skill, criterion, reason and a decision link) that is reported as accepted rather than FAIL. Tower's WEB-9 and WEB-19 are named as the first consumer. Its Discussion recommends a host-owned table rather than `[skills.<name>]` keys, because several rubrics fail a marker table that has unknown keys.
- Commits `44fb7b7` (ledger reservation) and `b51a65b` (record) were pushed to `origin/main` as a fast-forward. The `ki-work-roadmap` and `ki-authoring` audits pass, and the rumdl hook was clean.

## Needs the owner

- Adoption: the record is triage only, so Kris needs to approve a horizon and `kind` before it can be planned.
