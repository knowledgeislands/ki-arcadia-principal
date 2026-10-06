---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-019
area: GOV
title: Align the veto wording with the current layout
theme: governance
tags:
  - topic/knowledge-islands
  - topic/automation
horizon: now
status: in-progress
blocks: []
blocked_by: []
baseline_ref: 101c0280207b24f304028da55ecd5a159d574ce1
created_at: 2026-10-06T19:53:25Z
updated_at: 2026-10-06T19:54:37Z
author: Written with Claude
---

# Align the Veto Wording with the Current Layout

## Goal

The Charter's `## Activity Groups` paragraph and the Authoring Guidelines `## Adoption Requirements` format text describe the veto contract that the Conformance Check actually verifies: a vetoed group is recorded in `Admin/Governance/Charter.md` and acknowledged in its Activity Definition note, `Admin/Operations/Activities/<Group> Activity.md`, rather than through pre-GDR-KI-ARCADIA-002 Knowledge Capital stub paths.

---

## Context

Follow-up named in the Boundary, Outstanding concerns and Roadmap sections of [[KI-ARCADIA-OPS-011-rewrite-conformance-adoption-model|OPS-011]]. That record rewrote the Conformance prompt, its activity definition and the Tending adoption contract to the current layout. Two governance texts still describe the older contract: a per-note "KC index stub at its group path" plus "N/A stub" for each additional required note, and, in the Charter, "a corresponding stub in `Admin/`". The prompt now checks only that the linked Activity Definition note exists and explicitly states the veto, so the guidance and the check disagree.

Kris approved capturing and delivering this item on 2026-10-06.

---

## Boundary

- Veto-mechanism wording only: the Charter `## Activity Groups` framing paragraph, and in `Authoring Guidelines.md` the `## Adoption Requirements` section plus the one sentence in `## Constitutional and Adoptable Groups` that says which notes an island must create "to adopt or veto the group".
- No change to the Charter's meaning: every non-constitutional group still needs an explicit `adopted` or `vetoed` position, a veto still needs an explicit acknowledgement, and Conformance stays constitutional and cannot be vetoed. The Activity Groups table, Scheduled Activities table and every other Charter section are untouched.
- Out of scope, because they use Knowledge Capital terminology without describing the veto stub mechanism: `Constitutional/Constitutional.md` (lines 19, 21 and 28), the Authoring Guidelines path examples and design steps (lines 31, 32, 84, 113 and 168), and `Tending/Convergence Check.md`. No other activity definition describes veto stubs.
- No change to the Conformance prompt, the Tending adoption table, any Activity note, the live scheduled tasks, `+/_Voice Notes/` or any other repository. No remote operation under the [[Techne Programme Hold]].

---

## Current state

- `Admin/Governance/Charter.md` line 57: "A vetoed group must have a corresponding stub in `Admin/` acknowledging the decision." The table beside it already links each group to `Admin/Operations/Activities/<Group> Activity`.
- `Pillars/Philosophy/Model/Activities/Authoring Guidelines/Authoring Guidelines.md`:
  - line 141: the Adoption Requirements section "declares exactly what Knowledge Capital notes an island must create to adopt or veto the group";
  - line 147: "the machine-readable declaration of what KC notes the Conformance Check will verify";
  - line 149: Path is "the canonical KC path", and the veto note says "what stub an island must create if it vetoes the group";
  - line 153: "List every KC note ...", with the example `Knowledge Capital/Activities/Schedule`;
  - line 155: "**Veto stubs:** A vetoed group must have a KC index stub at its group path acknowledging the veto. If the group has additional required notes, each needs a corresponding N/A stub."
- The Conformance prompt (Step 3) reads the Charter's linked Activity Definition note for a vetoed group and requires it to exist and explicitly state the veto; required-note Paths are checked only for adopted groups. `Email Activity.md` and `Linear Activity.md` already state their vetoes, and the Tending `## Adoption Requirements` text already uses this contract.

---

## Steps

- [ ] Charter line 57: replace the stub sentence with one requiring the vetoed group's Activity Definition note, `Admin/Operations/Activities/<Group> Activity.md`, to explicitly acknowledge the veto. Leave every other sentence of the paragraph unchanged.
- [ ] Authoring Guidelines line 141: say the section declares which notes an island must create to adopt the group and how a veto is recorded, without the Knowledge Capital label.
- [ ] Authoring Guidelines lines 147, 149 and 153: replace "KC note" and "KC path" with required-note wording in the current layout, use `Admin/Operations/Activities/Schedule` as the shared-note example, and point the veto-case note at the veto acknowledgement paragraph.
- [ ] Authoring Guidelines line 155: rename **Veto stubs** to **Veto acknowledgement** and describe the current contract: the Charter records the `vetoed` position, the group's Activity Definition note explicitly states the veto, and no stub or N/A notes are created for the group's other required notes.
- [ ] Refresh the Authoring Guidelines `status` to `current - October 2026`.

---

## Files touched

- `Admin/Governance/Charter.md` (`## Activity Groups` framing paragraph only)
- `Pillars/Philosophy/Model/Activities/Authoring Guidelines/Authoring Guidelines.md` (frontmatter `status`, line 141, and the `## Adoption Requirements` section)
- `Streams/Roadmap/KI-ARCADIA-GOV-019-align-veto-wording-with-current-layout.md`

---

## Verify

- `grep -n "stub" Admin/Governance/Charter.md` returns nothing.
- `grep -n "Knowledge Capital\|KC " "Pillars/Philosophy/Model/Activities/Authoring Guidelines/Authoring Guidelines.md"` returns only the out-of-scope lines 31, 32, 84, 113 and 168.
- `git diff -U0` on the Charter changes one line only, inside `## Activity Groups`; the table rows and the "Constitutional activities ... are pre-adoptive" sentence are unchanged.
- The new veto wording matches the Conformance prompt's vetoed-group check and the Tending `## Adoption Requirements` text.
- No em or en dashes in the changed notes.
- `ki repo audit --repo . --progress never` PASS.

---

## Dependencies / blocks

No blocking dependency. Follows [[KI-ARCADIA-OPS-011-rewrite-conformance-adoption-model|OPS-011]], which is `done`.

---

## Documentation impact

### Decision Records

None. Aligning governance wording with the layout decided in GDR-KI-ARCADIA-002 and the contract delivered in OPS-011 is routine; no activity is adopted, vetoed or enabled.

### Specifications

The Authoring Guidelines `## Adoption Requirements` format is the specification every adoptable group index follows; its veto clause changes to the contract the Conformance Check already verifies.

### Guides

None beyond the Authoring Guidelines text above.

### Roadmap

Closes the follow-up named in [[KI-ARCADIA-OPS-011-rewrite-conformance-adoption-model|OPS-011]]. A wider Knowledge Capital terminology sweep of the Model notes remains uncaptured.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
