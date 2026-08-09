---
tags:
  - card/note
  - topic/knowledge-islands
type: admin-process
title: Enactment Process
description: How content reaches Arcadia's canonical stores. The canonical process is implemented through shared change-management skills and the Streams adapter; this note records Arcadia's local specifics.
status: current - June 2026
author: Written with Claude
---

# Enactment Process

Arcadia runs the canonical **Enactment Process** - Knowledge Islands' change process for how content reaches the canonical stores. Nothing reaches a canonical store except through it: finite work is iterated in a `Streams/Roadmap/` record, approved for delivery, implemented, reviewed, and retained as a `done` record until explicitly pruned. Recurring obligations are templates in `Streams/Housekeeping/` and spawn ordinary roadmap work when due. Authority to edit a Stream is granted by presence in the workspace; authority to edit a store is granted only by explicit user approval of a `ready` record that specifies the change.

The full definition is canonical in **`ki-repo-kb-streams`** and the shared change-management skills - the Streams structure, lifecycle (`draft → ready → in-progress → awaiting-review → done`), priority (`urgent` / `high` / `medium` / `low`), roadmap-record anatomy, rollout discipline, and post-change review. This note records only **Arcadia's local specifics**.

---

## Arcadia local specifics

- **Approver.** Kris Brown (sole Council member and island owner).
- **Stores.** Internal canonical knowledge lives in `Pillars/` (methodology, approach, domain reference); external reference in `Resources/`. The `Admin/` zone (Governance and Operations) is also a canonical store - structural and policy changes to it require a proposal.
- **Working area.** For complex or destructive rollout steps, stage the intended output as a preview in the Cowork working area before applying it to the repository - a review checkpoint and a concrete artefact for the post-change review (intended vs. executed).
- **Git interaction.** Perform no state-changing git commands without explicit per-command instruction: use file tools (write / edit / delete) unless `git mv` is explicitly approved. After rollout, `git add` / `commit` is left to the user unless the session is operating under broader approval.
- **In scope** (proposal required): changes to `Pillars/`, `Resources/`, `Admin/Governance/` structure or policy, Decision Records, activity definitions in `Admin/Operations/`, skill configuration or trigger updates, and any batch rename or structural reorganisation.
- **Out of scope** (no proposal needed): `Calendar/` entries; inbound `+/` triage (where routing is non-trivial, the triage may itself be a proposal); trivial typo and formatting fixes. When in doubt, prefer a proposal - the cost of a lightweight one is low, the cost of an unauthorised change to canonical content is high.

---

## Roadmap governance footer

Every roadmap record carries a short footer declaring adherence to this process. Suggested form:

```markdown
## Governance

This roadmap record adheres to the [[Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
```

---

## Related conventions

- [[Streams Conventions/Streams Conventions|Streams Conventions]] - the Streams zone structure and routing conventions.
- [[Admin Conventions/Routing Rules|Routing Rules]] - where content belongs across zones.
