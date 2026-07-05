---
type: resume-prompt
title: Fable Review Session - Consolidate Knowledge Islands Concepts and Reconcile Streams
description: Prompt to run in a Fable session (plan mode) that builds up the Knowledge Islands concept knowledge in Pillars and reconciles Streams into a logical, actionable rollout sequence
created: 2026-07-04T00:00:00Z
---

# Fable Review Session - Consolidate Knowledge Islands Concepts and Reconcile Streams

Paste the block below into a **Fable** session run **inside the `arcadia-principal` repo** (so `CLAUDE.md` auto-loads). Set effort to **xhigh**. **Start the session in plan mode** - this session must produce and get sign-off on a plan before writing anything to the island; do not touch `Pillars`, `Streams`, or any other canonical zone until the plan is agreed.

Decisions already baked in (from the session that produced this prompt): the **survey is read-only** across `Pillars`, `Resources`, `Admin`, and `Streams` - read and reconcile understanding, change nothing while investigating - but the **deliverable is a plan-mode proposal** that (a) strengthens the Knowledge Islands concept material in `Pillars`, and (b) reconciles the entire `Streams` zone (all five sub-folders) into a logical, sequenced, actionable state. Fable is being used here for its **reasoning** - do the hard judgement of what the concept model actually needs and how the in-flight Streams work should be sequenced, once, so a cheaper tier can execute each step without re-deriving it.

---

**Context.** You are working in `arcadia-principal`, the principal Knowledge Islands repository - the island itself, not a piece of tooling. The repo's `CLAUDE.md` operating mandates apply in full, including the **Enactment Process** for any change to a canonical zone (`Admin`, `Pillars`, `Resources`) and the Streams lifecycle (`Active` → `Background` → `Dormant` → `Future` → `Settled`). Orient yourself first: read `README.md`, [[Introduction/Introduction|Introduction]], [[Structure]], [[Pillars/Philosophy/Model/Conventions/Structure/Library/Library|Library]] (the Pillars/Resources boundary), [[Philosophy/Model/Processes/Enactment Process|Enactment Process]], [[Admin/Governance/Charter|Charter]], and [[Streams/Streams|Streams]] (the zone index and its live Proposals Index table). Then read every stream note across all five sub-folders of `Streams/` in full, not just the index table - the index can drift from what the notes actually say.

**What I want from this session is a concept foundation and a reconciled Streams zone I can act on - not a standalone report.** This is a knowledge base, not a piece of software: the "features" being rolled out are the island's own concepts, conventions, and structures becoming well-documented and load-bearing in `Pillars`, and the mechanism for building them is the Streams proposals that are already tracking that work. Two things must come out of this session:

1. **Concept knowledge build-up** - identify where the Knowledge Islands model itself (the concepts in [[Introduction/Introduction|Introduction]], [[Structure]], the Pillars/Resources boundary, the Enactment Process, tagging and frontmatter conventions, the Streams lifecycle, wikilink and note-format conventions) is thin, scattered, only living in `CLAUDE.md` rather than in `Pillars`, or referenced but not yet written up. Propose the notes or note-updates needed to make `Pillars/Philosophy` (and any other relevant Pillar) a complete, self-sufficient account of how this island works - so a new contributor or a fresh agent session could learn the model from `Pillars` alone.
2. **Streams reconciliation** - go through every proposal in every sub-folder and, for each, determine: is it already done (the thing it proposed now exists in the island, verify by checking the actual `Pillars`/`Admin`/`Resources` content, not just vibes) - if so it should move to `Settled` with status `completed`, or be deleted outright if it has no reference value once absorbed; is it still live but under-specified - if so it needs planning detail added directly to its note (a clear ordered rollout sequence, files/notes it will touch, what "done" looks like); is it mis-classified across Active/Background/Dormant/Future given what you now know about its actual state; or does it overlap/duplicate another proposal and should be merged. The `Proposals Index` table in [[Streams/Streams|Streams]] must end this session as an accurate reflection of every stream's true state.

**Method - survey before you judge.**

- **Concept audit** - read `Pillars/Philosophy` in full (and `Pillars/Aesthetics`, `Pillars/Technē` for cross-references), compare against what `CLAUDE.md` and the Charter assert about the model, and list every concept that is operative (governs real behaviour in this repo) but not yet written up as a proper Pillars note with its own frontmatter and index-note placement.
- **Streams audit** - for each of the ~88 items under `Streams/`, read the note, not just its title in the index. Cross-check its claimed status against actual repository state (does the thing it proposes exist yet in `Pillars`/`Admin`/`Resources`?). Note duplicates, overlaps, and notes that reference each other so the eventual sequencing respects dependencies.
- **Cross-check the Enactment Process itself** - since every Streams change this session proposes must itself route through that process, confirm your plan's mechanics (draft → ready → ratify → rolled-out → reviewed → completed) match [[Philosophy/Model/Processes/Enactment Process|Enactment Process]] exactly; do not invent a different lifecycle.

**What each finding must carry once landed:**

- **Where it lives** - which Pillars note (existing or new, with its correct folder per [[Structure]] and its index-note update), or which Streams note and sub-folder.
- **Evidence** - the note, section, or absence thereof that establishes the finding; never from memory.
- **Definition of done** - one line per item.
- **Rollout sequence** - since several concept notes and several Streams reconciliations will depend on each other (e.g. a Streams proposal cannot be marked `completed` until the Pillars note it proposed actually exists), the plan must sequence work into clear ordered steps, not a flat list - this is the "clear steps to roll out at the end" the plan must deliver.

**The deliverable - the plan itself, agreed before any write:**

Because this session runs in plan mode, the outcome of the survey is a plan presented for approval, covering:

- The set of new/updated Pillars notes needed to fully document the Knowledge Islands concept model, each with its target path and a one-line scope.
- The full reconciliation table for every existing Stream: keep as-is / add planning detail / reclassify (Active↔Background↔Dormant↔Future) / move to Settled (`completed`) / delete. Streams already fully realised in the island's actual state should be identified explicitly and marked or removed rather than left to linger.
- For every Stream that needs planning detail added, the specific rollout steps to write directly into that note (so it becomes self-sufficient for a cheaper tier to execute later, without re-deriving why it matters).
- An explicit note of anything that must go through a fresh Enactment Process proposal versus anything that is house-keeping on an existing proposal.
- Confirmation that the `Proposals Index` table update and any Streams moves/deletions are included as explicit steps, not left implicit.

Only once I approve this plan should the session execute it - writing the Pillars notes, updating the Streams notes and their statuses/locations, and refreshing the `Proposals Index` table - each canonical-zone edit still gated through the Enactment Process as normal.

**Verify before finishing.** After executing the approved plan, run a fresh-context verification pass with a separate subagent: confirm every new or updated Pillars note has correct frontmatter (`status`, `author`), sits under the correct folder per the Pillars/Resources boundary, and that its parent index note has been updated per the Index Notes convention; confirm the `Proposals Index` table in [[Streams/Streams|Streams]] matches the true state of every stream note; confirm no Stream was deleted that still held knowledge not yet absorbed elsewhere; confirm any moved-to-Settled stream actually has `status: completed`. Apply a cold-reader test to each Streams note that now carries rollout steps - would a fresh agent session, given only that note, know what to do next without re-reading this whole session? Fix what the pass finds, then give me a short closing message: what moved, what was deleted, what remains open and in what order, and anything needing my decision.

**Style.** British English, ASCII hyphens only, no em/en-dashes. Tight prose in the process-and-reasoning register - no rhetorical characterisation. Structure with headings, tables, and numbered findings. Footnote markers `† ‡ § ¶` if needed, never `*`. Follow the island's own note-format and wikilink conventions ([[Notes]]) throughout, since this session is itself writing island content.

---

Delete this resume file once the Fable review session has reconciled Streams and built up the concept Pillars content.
