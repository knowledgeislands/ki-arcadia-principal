---
note_type: streams/project
slug: secrets-hygiene
title: Secrets hygiene
outcome: Kris's 1Password vaults follow a clear layout and precedence, chezmoi reads secrets through one logical-name map from a dedicated Rig vault with a pre-apply reference check, and a monthly triage keeps it that way.
initiative: rig
lifecycle: active
lead: Kris Brown
target: null
updated: 2026-10-09T21:35:00Z
author: Written with Claude
---

# Secrets Hygiene

## Outcome

Kris's 1Password vaults are organised by a clear layout and precedence, and chezmoi depends on them through one narrow, checked seam. The test: every vault has a stated purpose and a precedence for where an item belongs; chezmoi reads every secret through one logical-name map from a dedicated `Rig` vault rather than scattered `op://` references; a pre-apply check catches a reference that no longer resolves before `chezmoi apply` renders; and a monthly triage keeps the vaults and the map in that state.

This Project sits in [[rig|Rig]], because the secrets chezmoi renders are part of the workstation. Kris agreed it on 2026-10-09 (Decision 26 of the chezmoi thread).

---

## Notes

- Kris made the Project active on 2026-10-09 (Decision 31); the Rig: chezmoi thread carries it.
- The work record that reorganises the vaults safely lives in the chezmoi roadmap and names this Project.
- **Idea: repeatable 1Password triage.** A mostly read-only triage on a cadence, realised as a recurring Activity or a chezmoi housekeeping template, that files the inbox vault, catches misplaced, duplicate and stale items, bad titles and URLs and `^` follow-up tags, checks every `op://` reference still resolves, and applies only what Kris approves. Kept as an idea on 2026-10-11 in place of a cancelled chezmoi work record (Decision 47 of the chezmoi thread). If revived, it carries the rules Kris has already settled: the Rig vault holds anything Kris uses on a machine or connects to, Wi-Fi and unlock codes included; items sharing a service are named with a bracketed qualifier; URL fixes point to the service's home page; nothing goes to 1Password's Archive during triage - an item to retire gets `^archive` and Kris archives it; and an item in the wrong category is recreated in the right one with the same fields and tags, its `op://` references repointed and the render confirmed unchanged, before the original is archived. Values are compared by hash, never printed.
- Notes and records here name vaults by purpose only - never item titles or personal names.
