---
note_type: stream-roadmap
id: KI-ARCADIA-EXT-002
area: EXT
title: Kit Principal inception
theme: ecosystem-adoption
tags:
  - topic/knowledge-islands
status: draft
priority: medium
horizon: waiting-for
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-04-27T19:18:58Z
updated_at: 2026-09-27T22:02:31Z
author: Written with Claude
---

# Kit Principal Inception Proposal

## Overview

Content that will need to exist in `kit-principal` to bring it into alignment with the Knowledge Islands model. This work is executed in a separate session once ki-arcadia-principal's governance is stable enough to provide a reliable baseline.

Historical local path: `~/kis/krisb/kit-principal`. Resolve the current checkout through the local KI registry before pickup.

---

## Governance

This stream follows the [[Philosophy/Model/Processes/Enactment Process|Enactment Process]] - the standard model for how streams enact change in the island.

---

## Items

| Item | Description | Derives from |
| --- | --- | --- |
| Kit's council membership | Personal context † | `Pillars/Admin/Governance/Charter.md` |
| Known Lands | Already created (`Pillars/Philosophy/Known Lands.md`); may need enriching ‡ | `Pillars/Admin/Governance/Known Lands.md` |
| Admin/Governance | `Pillars/Admin/Governance/` needs creating in kit-principal § | Phase B.3 output |
| Cross-island links | Notes linking kit-principal's streams/pillars to relevant ki-arcadia-principal concepts | Ongoing |

† Kit's role on the Arcadia council, what that means day-to-day. Kit appears in ki-arcadia-principal only as a council member - the personal depth lives here.

‡ Enriching once ki-arcadia-principal governance is stable.

§ Following the same pattern - Identity, Physical Locations, Routing Rules, Glossary, Governance instance.

### Pickup checkpoint - 2026-09-27

Before further implementation, reconcile the current destination branch, linked coordination tasks, and retained worktrees where applicable. Missing evidence does not release ownership or a hold; this checkpoint is guidance, not a mechanical execution block.

- **Observed:** The current `kit-principal` checkout has a `.ki.toml`, `AGENTS.md`, `CLAUDE.md`, and `Admin/Governance/Charter.md`; a Known Lands note is also present under its current knowledge layout. The Items table reflects an older baseline and its `Pillars/Admin/Governance/` missing-folder claim is no longer current.
- **Resolve:** Check the actual council-membership content, Known Lands coverage, Admin/Governance completeness, and cross-island links against the current KI contract. Identify any genuine remaining work and explicitly disposition obsolete table entries rather than recreating moved structures.
- **Close:** When the receiving repository's owner confirms those outcomes, prepare the review packet and seek owner acceptance through `ki-accept`. Retain the `done` record; pruning is a later explicit owner choice.

## Adherence

This stream adheres to the [[Enactment Process]]. Content reaches `Pillars/` or `Resources/` only on user approval of a `ready` proposal.
