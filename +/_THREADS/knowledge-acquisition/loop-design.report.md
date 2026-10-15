# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Knowledge acquisition](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/knowledge-acquisition.md) › loop-design

**Run report at 03:15 BST · last mark 03:15 BST**

---

## Done

- Drafted the seed-and-return loop design below for Kris's review. Nothing is implemented, committed or published; this report is the only file written. No provider call, no edit to Pillars, Streams, acquire or any other repository.
- Read the three decisions in the knowledge-acquisition checkpoint, [KI-PRINCIPAL-MOD-006](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-MOD-006-knowledge-acquisition-lifecycle.md) and the [Acquisition Process](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Pillars/Philosophy/Model/Processes/Acquisition%20Process/Acquisition%20Process.md) note it delivered, acquire's `CAPTURE-CHATGPT.md`, README and `context/chatgpt/README.md`, the [Enactment Process](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Operations/Processes/Enactment%20Process.md), the [Known World](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Pillars/Philosophy/Emerging%20Concepts/Known%20World.md) note and section 4 of the foundations-coherence report.
- Checks: ASCII hyphens only; no commit made, so no commit identifier.

### The design in one view

The loop has four moves: **publish** a seed, **discuss** in ChatGPT, **capture** with a pointer back, **fold back** into the target. Each move has one owner; ki-principal owns the first and last, acquire owns the middle two.

**Material the design builds on (all observed).**

- ChatGPT bootstraps from acquire's README, then `context/chatgpt/README.md`, then one territory summary. That summary is a small dated export owned by acquire-dispatch and refreshed after Capitals reconcile. It says "Capture remains inbound evidence until reconciled".
- A whole-chat capture is `captures/<territory-key>/chatgpt/<YYYY-MM-DD>-<topic>/README.md` with a fixed front-matter list and a Summary, Decisions, Facts and findings, Open items, Key passages, Attachments and Omissions body. It is "a reviewed summary", not a transcript.
- The Acquisition Process names harvest as the stage that turns a staged capture into durable knowledge, and says a handoff "grants no acceptance authority".
- Changes to `Admin`, `Pillars` or `Resources` need a record or an explicit owner instruction; `Streams/Projects` notes are outside that rule.

#### 1. Outbound seed

**What is published.** One seed pack per target, never the live note. It holds, in this order:

1. A front-matter block: `ki_seed` (an id such as `SEED-2026-10-15-known-world`), the target (`ki_project` or `ki_concept`), `ki_island`, `territory_key`, `source_paths` with the source commit SHA, `source_sha256` for each included note, `published`, and `status: open`.
2. The **seed prompt**, verbatim, written to be pasted or read as the chat's opening brief.
3. The **return instruction**: tell the chat to end with its summary of what was settled, left open and coined, and to write the `ki_*` fields (below) into the capture's README front matter, copying `ki_seed` exactly.
4. The **Notes snapshot**: the target's body, verbatim, under a heading that says it is a dated snapshot, not the source of truth.

The seed carries only what the island's own governance already permits to leave the island. Known World writes hosts by role, not machine name, so it qualifies; a later seed that names private identities fails this test and is refused at build time.

**Where it lives in acquire's ChatGPT context.** Recommended: `context/chatgpt/<territory-key>/seeds/<seed-slug>.md`, with a short "Open seeds" line added to that territory's `README.md` pointing at it. This reuses the stable discovery path (README, then context README, then one territory summary), needs no new top-level folder, and keeps the seed outside `captures/`, so it survives spool cleanup like the other context exports. The Known World seed therefore lands under `context/chatgpt/knowledge-islands/seeds/`.

**Who writes it.** ki-principal builds the pack and stages it for outbound in its own `-` area (see [Outbound](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/-/Outbound.md)). It does not write into acquire. acquire-intake commits the staged file into acquire and updates the territory summary line; that is a handoff, not work in this thread.

**Alternative that needs no acquire change.** Kris pastes the seed prompt by hand into the Knowledge Islands ChatGPT project, as the foundations-coherence report already suggests. The loop then differs only in that the capture is tagged by hand. This is the fallback while the handoff is pending, and nothing in the pilot waits on the handoff.

#### 2. Return capture

Capture keeps its existing front-matter list and gains optional fields. The chat copies them from the seed, so Kris does not retype them:

```yaml
ki_seed: SEED-2026-10-15-known-world
ki_island: ki-principal
ki_project: island-model-and-tending
ki_concept: Known World
```

- `ki_project` is the **Project slug**, the file stem of `Streams/Projects/<slug>.md` (so `island-model-and-tending`). This is the field Kris decided.
- `ki_concept` is the equivalent for an Emerging Concepts note: the note's title as it appears in its filename under `Pillars/Philosophy/Emerging Concepts/`, here `Known World`. Using the title rather than a slug matches how those notes are already linked, and they have no slug field.
- `ki_island` names the receiving island, because a Project slug is only unique within an island; today it is always `ki-principal`.
- `ki_seed` ties the capture to the exact seed, so a fold-back can say which snapshot the discussion started from and detect that the source note has since moved.
- A capture sets `ki_project`, `ki_concept` or both (the Known World pilot sets both, because the model lives in a Project that holds it as an emerging concept). A capture with neither is an ordinary capture and the loop ignores it.
- The fields are optional and additive, so older captures stay valid. The territory key is unchanged: a Known World capture still routes to `captures/knowledge-islands/chatgpt/`.

acquire's `CAPTURE-CHATGPT.md` must be amended to list these four fields in step 3 and to say the chat copies them from the seed if one was given. That amendment is acquire-intake's.

#### 3. Fold-back step

**Who folds back.** A ki-principal agent run, started by this thread when Kris says a capture is ready, never automatically. It reads the capture from acquire read-only and writes only inside ki-principal. The capture stays immutable evidence in acquire; the fold-back never edits it.

**What it does, in order:**

1. Find captures with a `ki_project` or `ki_concept` field and no fold-back marker (by listing `captures/*/chatgpt/*/README.md` front matter in acquire, read-only).
2. Check the capture against the Acquisition Process harvest checkpoint (source identity, timestamps, hashes of originals, declared omissions) and stop on an incomplete capture. An incomplete banner means no fold-back.
3. Compare `ki_seed`'s `source_sha256` with the target's current content. If the target moved, say so and fold into the current note, not the snapshot.
4. Draft a **fold-back proposal**: the capture's Decisions, Open items and coined terms mapped onto the target note, with key passages quoted verbatim and each marked as ChatGPT's or Kris's. The proposal separates what Kris decided in the chat from what ChatGPT suggested. Suggestions and coined terms are recorded as candidates and are never adopted by the fold-back; the Known World note keeps `status: emerging - not adopted`.
5. Show the proposal to Kris. On approval, apply it to the target.

**Passing the Enactment Process.**

- A **Project's Notes** live under `Streams/Projects/`, outside the Enactment gate. They need Kris's approval of the proposal, not a record.
- An **Emerging Concepts note** is under `Pillars/` and does pass the gate. Recommended route: Kris's approval of the specific proposal is the "explicit owner instruction for a bounded change" that the Enactment Process says stands in for a record, so no new roadmap record is captured (consistent with the standing rule to capture no new feature records). The instruction names the target note and the capture, which bounds the change. If a fold-back would add a new note, restructure a folder or touch `Admin/`, it grows beyond that bound and needs a record.
- Folding back into an Emerging Concepts note never changes its adoption status. Adoption is the whole-philosophy review's decision, not the loop's.

**Provenance links.**

- Forward link, in the target note: a `folded_from` front-matter list, one entry per fold-back, each giving the acquire capture folder path, the acquire commit SHA the capture was read at, the `ki_seed` id, the fold-back date and the ki-principal commit that applied it. In the body, the folded passage carries a short "Source" line pointing to the same entry. acquire is a private repository outside the island, so the link is a path and SHA, not a wikilink.
- Back link, in acquire: the capture and its intake receipt record the disposition `folded` with the ki-principal commit SHA, in the way the Granola ledger already keeps a harvest `disposition`. acquire-intake writes this, not ki-principal, because the capture folder is acquire's evidence and acquire-intake owns all work there. Until it does, ki-principal keeps the fold-back list in the target's `folded_from`, and the step 1 scan treats a capture whose path appears there as already folded.
- The seed's `status` moves from `open` to `folded` when its capture folds back. A seed with several captures stays `open` until Kris closes it.

#### 4. Known World pilot steps

1. **Build the seed pack** (ki-principal). Seed prompt: section 4 of the foundations-coherence report, unchanged except that the "tag the capture" sentence becomes the return instruction with `ki_seed`, `ki_project: island-model-and-tending` and `ki_concept: Known World`. Notes snapshot: the body of [Island model and Tending](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/island-model-and-tending.md), which already holds Known World as an emerging concept, with the Known World note included as its own snapshot section. Record both source SHA-256 values.
2. **Check the seed** (ki-principal) for private identities before it leaves; Known World already speaks of hosts by role.
3. **Publish** (handoff to acquire-intake): commit the pack to `context/chatgpt/knowledge-islands/seeds/` and add the "Open seeds" line to that territory's README. Fallback: Kris pastes the prompt by hand and types the four fields.
4. **Discuss** (Kris, when it suits them; nothing waits on this). The chat ends with the summary of what was settled, left open and coined, then captures itself under `CAPTURE-CHATGPT.md`, copying the `ki_*` fields.
5. **Fold back** (ki-principal agent, on Kris's word): steps 1 to 5 above, with the Known World note as the target and its Overview, layers, bindings and open questions as the places the proposal maps onto. The proposal also lists any change to the Island model and Tending Project's Notes, which Kris approves in the same turn.
6. **Close the seed and record the result** (ki-principal for `folded_from`, acquire-intake for the capture's disposition). Kris says whether the loop worked and what to change; that review is the pilot's output.

#### 5. Repository ownership

| Part | Owner | Note |
| --- | --- | --- |
| This design, then the seed pack builder (a procedure, not a tool) | ki-principal, knowledge-acquisition | Draft only now |
| Seed pack content and snapshot hashes | ki-principal | Staged in `-` |
| Fold-back proposal, `folded_from`, applying the fold | ki-principal | Pillars part passes the Enactment Process |
| Target Notes (Project) and Emerging Concepts notes | ki-principal | ROOTING-OWNER makes both fold-back targets |
| The idea-stage (inception) pattern and when to start a loop | ways-of-working | INCEPTION-SHAPE: no new kind of Project |
| `context/chatgpt/<territory-key>/seeds/` and the "Open seeds" line | acquire (acquire-intake, with acquire-dispatch for the context export) | Handoff |
| `CAPTURE-CHATGPT.md` front-matter amendment | acquire (acquire-intake) | Handoff |
| Capture disposition back link (`folded`) | acquire (acquire-intake) | Handoff |
| A `ki acquire` command to list unfolded tagged captures | tools-ki | Not requested; a later optional handoff once the manual pilot proves the shape |
| Browser-driven ChatGPT acquisition | ki-agentic-harness ([KI-HARNESS-OPS-005](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md)) | The loop does not depend on it |

#### 6. Risks and limits

- **Snapshot drift.** The chat works on a snapshot; the note may change before fold-back. The `source_sha256` comparison surfaces this and the fold goes into the current note.
- **ChatGPT omits or garbles the fields.** The capture then looks ordinary. The step 1 scan also lists tagged-by-hand captures that Kris names, so the loop is not blind to a missing tag.
- **A summary is not a transcript.** A capture is a reviewed summary, so the fold-back relies on Key passages for verbatim wording. Where a decision matters, the proposal flags that the verbatim source is only in the chat itself.
- **Territory context is dated.** Seeds are inbound evidence like captures; they never replace the territory summary, and acquire-dispatch's refresh rule is unchanged.
- **Related drift.** The MOD-006 review already notes that [ADR-KI-PRINCIPAL-001](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Decisions/ADR-KI-PRINCIPAL-001-provider-neutral-knowledge-acquisition.md) names staging in the receiving island's `+` area, whereas ChatGPT and Granola captures stage in acquire. The loop follows what acquire does; ADR-HARBOUR (already open) covers the amendment.

## In Progress

Nothing is running or queued from this run.

**Outstanding - no action requested now**

- The `acquire` primary checkout carries acquire-intake's own unpushed work; this design does not touch it.
- [KI-PRINCIPAL-MOD-006](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-MOD-006-knowledge-acquisition-lifecycle.md) is awaiting review with ADR-HARBOUR and AUDIT-GATE open from the mod-006 run report; unchanged by this design.

## Queries

### SEED-HOME - Where the seed is published in acquire

**Context:** ChatGPT bootstraps from acquire's README, then `context/chatgpt/README.md`, then one territory summary. A seed has to be found by that path, and acquire-dispatch owns the context exports. A per-territory `seeds/` folder with an "Open seeds" line in the territory README fits the discovery path and leaves `captures/` for evidence only.

**Query:** Where should a published seed live in acquire?

**Options:** a) (recommended) `context/chatgpt/<territory-key>/seeds/<seed-slug>.md`, with an "Open seeds" line in the territory README, committed by acquire-intake from the pack ki-principal stages in `-`. b) A new top-level `seeds/` folder in acquire, outside the context exports. c) No published seed for the pilot: Kris pastes the prompt by hand and types the fields.

### FIELD-SHAPE - The return capture fields

**Context:** INCEPTION-SHAPE fixes `ki_project`. The design adds `ki_concept` for Emerging Concepts notes (the note title), `ki_island` (a Project slug is only unique per island) and `ki_seed` (ties the capture to its snapshot). All are optional front-matter additions to the existing capture list, set by the chat from the seed.

**Query:** Do you accept `ki_project`, `ki_concept`, `ki_island` and `ki_seed` as the four optional capture fields?

**Options:** a) (recommended) Accept all four as designed; hand acquire-intake the `CAPTURE-CHATGPT.md` amendment. b) Keep only `ki_project` and `ki_concept`, and drop `ki_island` and `ki_seed` until a second island or a second seed per target makes them necessary. c) A single field `ki_target` holding a path-like value such as `project:island-model-and-tending` or `concept:Known World`.

### FOLD-AUTHORITY - How a fold-back into Pillars passes the Enactment Process

**Context:** Project Notes under `Streams/Projects/` are outside the Enactment gate, but Known World is under `Pillars/` and is inside it. The Enactment Process lets an explicit owner instruction for a bounded change stand in for a record, and the standing rule is to capture no new feature records. A fold-back proposal approved by Kris, naming the note and the capture, is such an instruction.

**Query:** May Kris's approval of a named fold-back proposal stand in for a roadmap record when the target is an Emerging Concepts note?

**Options:** a) (recommended) Yes: approval of the specific proposal is the owner instruction; a fold-back that adds a note, restructures a folder or touches `Admin/` needs a record. b) No: every Pillars fold-back gets a roadmap record before it is applied. c) Yes for the Known World pilot only; decide the standing rule after the review.

### FOLD-TRIGGER - What starts a fold-back

**Context:** The design has the fold-back start only when Kris says a capture is ready, because a chat summary is a reviewed summary and Kris should see what moves into the island. The alternative is a scan on each thread turn that proposes folds without being asked.

**Query:** Should a fold-back start only on Kris's word?

**Options:** a) (recommended) Yes: on Kris's word only; the thread reports tagged, unfolded captures at a mark so none is forgotten. b) A scan proposes a fold-back whenever a tagged, complete capture appears, and Kris approves or declines it.

### BACK-LINK - Recording the fold-back in acquire

**Context:** The forward link (`folded_from` in the target) is ki-principal's. The back link (`folded` disposition on the capture and its intake receipt) is a write inside acquire, so it is acquire-intake's work and a handoff. Until it exists, `folded_from` alone marks a capture as folded.

**Query:** Do you want the back link in acquire, and should this thread hand it to acquire-intake?

**Options:** a) (recommended) Yes: hand acquire-intake the `CAPTURE-CHATGPT.md` field amendment, the seeds folder and the `folded` disposition as one handoff, written as a ki-principal item in its roadmap, not here. b) Hand over the field amendment and the seeds folder only; leave the back link until after the pilot. c) Hand over nothing until the pilot has run with a hand-pasted seed.

### PILOT-GO - Starting the Known World pilot build

**Context:** Nothing in the pilot waits on ChatGPT; Kris holds the discussion when it suits them. Building the seed pack is small mechanical work: the unchanged section 4 prompt with the return instruction, plus the Island model and Tending Notes snapshot with Known World, hashed and staged in `-`.

**Query:** May this thread build the Known World seed pack now and stage it in `-` for Kris to paste or for acquire-intake to publish?

**Options:** a) (recommended) Yes: build and stage the pack, then report; no publication to acquire until SEED-HOME and BACK-LINK are answered. b) Wait until all queries above are answered before building anything.

```text
SEED-HOME

Accept context/chatgpt/<territory-key>/seeds/<seed-slug>.md with an "Open seeds" line in the territory README, committed by acquire-intake from the pack ki-principal stages in the - area.

---

FIELD-SHAPE

Accept ki_project, ki_concept, ki_island and ki_seed as the four optional capture fields, and hand acquire-intake the CAPTURE-CHATGPT.md amendment.

---

FOLD-AUTHORITY

Yes: Kris's approval of a specific named fold-back proposal stands in for a roadmap record when the target is an Emerging Concepts note; a fold-back that adds a note, restructures a folder or touches Admin needs a record.

---

FOLD-TRIGGER

A fold-back starts only on Kris's word; the thread reports tagged, unfolded captures at a mark so none is forgotten.

---

BACK-LINK

Yes: hand acquire-intake the CAPTURE-CHATGPT.md field amendment, the seeds folder and the folded disposition as one handoff, written as a ki-principal item in its roadmap.

---

PILOT-GO

Build and stage the Known World seed pack in the - area and report; no publication to acquire until SEED-HOME and BACK-LINK are answered.
```

```text
╭─ run report · 2026-10-15T02:15:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] SEED-HOME
- [waiting] FIELD-SHAPE
- [waiting] FOLD-AUTHORITY
- [waiting] FOLD-TRIGGER
- [waiting] BACK-LINK
- [waiting] PILOT-GO
- [uncommitted] this report, left uncommitted as instructed

```text
Resume knowledge-acquisition under current ki-pmo and ki-delegation since 2026-10-14T23:26:00Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
