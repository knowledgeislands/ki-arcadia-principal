---
tags:
  - card/note
  - topic/knowledge-islands
status: current - April 2026
author: Written with Claude
memory_file: feedback_{ki_prefix}_enactment_process.md
---

# Enactment Process

## Overview

The Enactment Process is the island's governance in action. It is not a tool the council uses - it is _how the council operates_. The council's authority is expressed entirely through this process. Nothing reaches stable knowledge in Pillars or Resources except through the Enactment Process gate.

This process is a portable pattern: any island copies it as their governance baseline, localising only as needed (different working area, informal council for single-person islands, adjusted status vocabulary).

---

## Model

The Enactment Process works alongside Streams, Pillars and Resources in an iterative cycle. Work moves back and forth between them until the council ratifies or rejects.

```text
┌──────────────────────────────────────────────┐
│                                              │
│   Stream  ←→  Enactment Process (Council)    │
│               ↓ ratify                       │
│         Pillars / Resources                  │
│                                              │
└──────────────────────────────────────────────┘
```

In this model:

- **Streams** are the home of ongoing work; ideas develop, questions resolve, proposal documents iterate. Authority to work here is granted by its presence.
- **Pillars / Resources** are the home of stable, ratified knowledge. Nothing lands here except through the council's ratification of a proposal. Authority to edit here is granted by the council's ratification of a proposal document that specifies the change.

---

## Status Lifecycle

| Status        | Meaning                                                                               |
| ------------- | ------------------------------------------------------------------------------------- |
| `draft`       | Work in progress - iterating in a Stream's proposal document                          |
| `ready`       | Proposal stable; no open questions remaining; submitted to the council for review     |
| `rejected`    | Council has rejected; reasons documented; terminal                                    |
| `in-progress` | Council has ratified; rollout underway - writing final KI notes to their destinations |
| `rolled-out`  | Changes made; post-change review pending                                              |
| `reviewed`    | Post-change review complete                                                           |
| `completed`   | Confirmed complete; corresponding Stream settles                                      |

Statuses progress in order: `draft` → `ready` → ratification decision (`in-progress` or `rejected`) → `rolled-out` → `reviewed` → `completed`. A rejected proposal may be reopened as a new `draft` if circumstances change; the prior rejection and its reasons remain on record.

---

## The Cycle

1. A change is conceived and work begins in a **Stream**
2. A proposal folder and note are created in Streams under the appropriate Focus and Category (`Streams/$Focus/$Category/$ProposalName/`) - see [[Structure]] for path conventions - and a row is added to the proposals index
3. Work iterates: the proposal develops, questions resolve, open issues are closed with resolution notes, the proposal takes shape
4. When stable (no open issues remaining), verify all prerequisites are satisfied, then mark `ready` and submit to the council
5. The council reviews:
   - **Ratify** → status moves to `in-progress`; rollout begins
   - **Return to draft** → feedback is recorded; the cycle continues
   - **Reject** → status moves to `rejected`; reasons are documented; the proposal settles with a record of why
6. On ratification, the proposal's agreed changes are performed and any output is written to its Checklist
7. Status moves to `rolled-out`; a post-change review is conducted
8. Status moves to `reviewed`, then `completed`; the proposals index row is updated
9. The proposal document is deleted - its knowledge is now in Pillars or Resources, and the proposal document has no residual value

---

## Proposal Documents

Proposal documents are the physical carrier of an Enactment Process proposal.

Each proposal document carries `status`, `priority`, and `dependencies` in its front matter. The `dependencies` field lists prerequisite change document filenames as a machine-readable gate - used to verify all prerequisites have reached `rolled-out` status before a change moves to `ready`. It mirrors the `Prerequisite`-type rows in the Inputs section and must be kept in sync with them.

### Inputs and Outputs

**Inputs** are what the change draws on. Three types:

- `Document` - a source file, brief, or reference
- `Decision` - a prior agreement or sign-off that shapes this change
- `Prerequisite` - another change that must reach `rolled-out` status before this one can proceed

Fill in what is known at opening; update as further inputs are identified during iteration.

**Outputs** are what the change produces. Two types:

- `Decision` - a conclusion or agreement reached
- `Artefact` - a note or other asset created or modified

Outputs should be complete and accurate before the change moves to `ready`.

### Checklist

A list of the operations the change will perform. This section doubles as the rollout status - items are ticked off as they are executed.

### Open Questions

Unresolved decisions that must be answered before the proposal is `ready`. Close each with a resolution note as decisions are made.

### Design Sections

The substance of the proposal: analysis, diagrams, draft content. May be extensive for complex changes - that is expected and correct.

### Stream Notes

Every stream operating under this process carries a `Governance` section in its stream note. That section declares the stream's adherence to the Enactment Process and links back to this note. This makes the governing model discoverable from the stream and confirms the stream is a participant in the formal cycle.

---

## Proposals Index

[[Streams]] maintains a proposals index as a live tracking view of all proposals. The index records each change's topic, current status, and priority. Update it whenever a change is created, its status changes, or its priority changes. The index has no value if it lags.

---

## Priority

Every proposal document carries a priority, set at creation and reviewed whenever context shifts.

| Priority | Meaning                                                             |
| -------- | ------------------------------------------------------------------- |
| `urgent` | Blocking something live or causing active harm; address immediately |
| `high`   | Important near-term work; should be picked up in the current sprint |
| `medium` | Valuable but not time-pressured; pick up after high-priority items  |
| `low`    | Background or nice-to-have; address when nothing higher is pending  |

Priority may increase over time (e.g. `medium` → `urgent` as a launch approaches) - update the proposal document and the change index when this happens.

---

## Rollout

Rollout means writing the operations from their Checklist. It is not complete until:

- All creates, updates, and deletes listed in the proposal document have been executed
- Index notes for any new folders have been created
- Existing notes that reference moved or renamed content have been updated
- The proposal document itself has been deleted

### Working Area Previews

**Storage boundary:** Proposal documents live in the text repository (in Streams), version-controlled alongside the KI. The agent's working area is for previews only - temporary staging files that are never committed. Each island's agent configuration specifies where the working area is located.

For complex or destructive rollout steps, stage the intended output as a preview file in the agent's working area before applying changes to the KI. This creates a review checkpoint - the user can inspect the output before it lands permanently, and the preview serves as a concrete artefact for the post-change review: what was intended vs. what was executed.

---

## Post-Change Review

After rollout, a post-change review is conducted before the change moves to `reviewed`.

**How to run the review:**

1. Claude prepares an initial review summary - what went well, issues encountered, and lessons observed - and presents it as a starting point for discussion
2. The review is conducted as an interactive conversation; the initial summary is input, not output - the user should challenge, correct, and add to it
3. Outputs of the review may include revisions to the summary itself, immediate improvements to the proposal document (e.g. correcting rollout steps based on what actually happened), and new change documents or process improvements triggered by lessons learned

Record the final review in the change document under a Post-Change Review section, or as a note in the relevant process or governance doc if the lesson is structural.

---

## Rejection

A rejection is a first-class outcome - not a failure. The council's reasons are documented in the Stream note, and the Stream settles with a `rejected` status. A rejected proposal may be reopened as a new `draft` if circumstances change; the prior rejection and its reasons remain on record.

---

## Working Rules

These rules apply to every change and are enforced by Claude:

- **Keep the proposal document current.** The proposal document is the canonical source for any in-progress change. Update it immediately when a decision is made in conversation; it must never lag behind the current state of the change.
- **Keep the proposals index current.** Update it whenever a change is created, its status changes, or its priority changes.
- **Load before editing.** Ensure the proposal document is freshly loaded before starting work, to avoid acting on a cached version.
- **Check prerequisites before marking ready.** A change may not move to `ready` while any prerequisite has not reached `rolled-out` status. Verify the current status of each listed prerequisite before proceeding.
- **Do not begin rollout without explicit authorisation.** Claude must not execute rollout steps until the user explicitly instructs it - e.g. "roll this out", "go ahead", "execute". The `ready` status is a necessary condition, not a sufficient one. Exploratory language ("let's look at this", "let's work through it") is iteration, not authorisation.
- **Re-verify each rollout item against the live file.** Plans can drift between drafting and execution. Confirm each item still applies before making the edit.
- **Delete the proposal document on completion.** Once content is in the KI, the proposal document has no residual value. The test: if it were deleted today, would any knowledge be lost? If not, delete it.
- **Iterate freely.** Use the proposal document to work through the change, closing open issues as decisions are made. No pressure to get it right immediately.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Processes/Processes|Processes]] - parent index
- [[Pillars/Knowledge Islands/Governance/Processes/Contribution Process|Contribution Process]] - who can propose changes
