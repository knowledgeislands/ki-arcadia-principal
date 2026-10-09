---
note_type: streams/project
slug: secrets-hygiene
title: Secrets hygiene
outcome: Kris's 1Password vaults follow a clear layout and precedence, chezmoi reads secrets through one logical-name map from a dedicated Rig vault with a pre-apply reference check, and a monthly triage keeps it that way.
initiative: rig
lifecycle: planned
lead: Kris Brown
target: null
updated: 2026-10-09T14:45:00Z
author: Written with Claude
---

# Secrets Hygiene

## Outcome

Kris's 1Password vaults are organised by a clear layout and precedence, and chezmoi depends on them through one narrow, checked seam. The test: every vault has a stated purpose and a precedence for where an item belongs; chezmoi reads every secret through one logical-name map from a dedicated `Rig` vault rather than scattered `op://` references; a pre-apply check catches a reference that no longer resolves before `chezmoi apply` renders; and a monthly triage keeps the vaults and the map in that state.

This Project sits in [[rig|Rig]], because the secrets chezmoi renders are part of the workstation. Kris agreed it on 2026-10-09 (Decision 26 of the chezmoi thread).

---

## Notes

- The work records live in the chezmoi roadmap and name this Project: one reorganises the vaults safely, and one, blocked by it, makes the triage repeatable.
- The triage record should realise the monthly triage as an Activity, so the cadence, due runs and run evidence follow the recurring-work model rather than a one-off procedure.
- The triage is mostly read-only: it proposes changes and applies only what Kris approves.
- Notes and records here name vaults by purpose only - never item titles or personal names.
