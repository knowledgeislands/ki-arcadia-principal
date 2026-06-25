---
type: admin/index
status: current - June 2026
author: Written with Claude
---

# Decisions

## Overview

This folder holds the Decision Records (DRs) for Arcadia. A DR captures a significant structural decision about this island -- its
organisation, governance, tools, or cross-repo relationships -- in a permanent, standalone record. DRs use the Nygard five-section format
(Context, Decision, Consequences) with a `decision_type` field. Each `decision_type` has a corresponding prefix: `GDR-` (governance), `ADR-`
(architecture), `KDR-` (knowledge), `SDR-` (strategy), `PDR-` (product), `DDR-` (data), `XDR-` (security), `ODR-` (operations), `RDR-`
(research). Serials are global within the `ARCADIA` scope.

Not every change warrants a DR. Routine content additions, typo fixes, and minor configuration changes do not. DRs are for decisions with
standalone standing: structural choices, adoption of formats or instruments, cross-repo boundaries. A DR is typically the formal output of
an Enactment Process proposal whose `Decision` row warrants a permanent record.

Once `Accepted`, a DR is immutable -- it is superseded by a new record, never edited.

## Records

| DR ID           | Title                                                                                        | Type         | Status   | Date       |
| --------------- | -------------------------------------------------------------------------------------------- | ------------ | -------- | ---------- |
| ADR-ARCADIA-002 | [Three Arcadia Project Roles](ADR-ARCADIA-002-three-project-roles.md)                        | architecture | Accepted | 2026-06-25 |
| GDR-ARCADIA-001 | [Adopting Decision Records](GDR-ARCADIA-001-adopting-decision-records.md)                    | governance   | Accepted | 2026-06-25 |
| GDR-ARCADIA-003 | [Admin Zone Governance/Operations Structure](GDR-ARCADIA-003-admin-governance-operations.md) | governance   | Accepted | 2026-06-25 |
