---
tags:
  - card/note
  - topic/knowledge-islands
note_type: admin-process
title: Enactment Process
description: How content reaches Arcadia's canonical stores. The canonical process is implemented through shared change-management skills and the Streams adapter; this note records Arcadia's local specifics.
status: current - October 2026
author: Mixed
---

# Enactment Process

Arcadia runs the canonical **Enactment Process** - Knowledge Islands' change process for how content reaches the canonical stores. Nothing reaches a canonical store except through it: finite work is iterated in a `Streams/Roadmap/` record, approved for delivery, implemented, reviewed, and retained as a `done` record until explicitly pruned. Recurring obligations are defined once in the configured Activity collection, currently `Admin/Operations/Activities/`; opted-in housekeeping Activities create ordinary roadmap runs when due. Draft capture follows the shared process; adoption and delivery require the applicable owner approval. Authority to change a canonical store comes from an explicitly approved scope, not workspace presence or territorial membership.

The full definition is canonical in **`ki-repo-kb-streams`** and the shared change-management skills - the Streams structure, lifecycle (`draft -> ready -> in-progress -> awaiting-review -> done`), horizon, roadmap-record anatomy, rollout discipline, and post-change review. `ki-work-roadmap` owns horizon and finite-work metadata; this note adds no local priority field. This note records only **Arcadia's local specifics**.

---

## Arcadia local specifics

- **Approver.** Kris Brown (sole Council member and island owner).
- **Stores.** Internal canonical knowledge lives in `Pillars/` (methodology, approach, domain reference); external reference in `Resources/`. The `Admin/` zone (Governance and Operations) is also a canonical store - structural and policy changes to it require a proposal.
- **Repository authority.** Arcadia is the Knowledge Islands Capital, but each island owns source access, canonical acceptance and delivery under its applicable process. A handoff to another island offers work or knowledge; it grants no implementation or acceptance authority.
- **Record owners.** `ki-work-roadmap` owns finite-work metadata and lifecycle; `ki-repo-kb-streams` owns its KB container. `ki-repo-kb-activities` owns Activity definitions and `ki-work-housekeeping` governs opted-in cadence, due-run identity and evidence. Decision Record and trade metadata follow their own owning skills rather than ordinary note frontmatter.
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
