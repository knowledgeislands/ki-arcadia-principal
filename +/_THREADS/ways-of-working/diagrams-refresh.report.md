# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › diagrams-refresh

**Run report at 20:57 BST · last mark 19:56 BST**

---

## Done

- Pre-flight: `pmo-tidy` and `skills-map` had both finished; the harness was pulled and was already level with origin. `ki-principal` could not be rebased because another session holds staged, uncommitted files there (three new reports under `+/_THREADS/knowledge-acquisition/`, `gate-scope` and `skills-map` reports, three checkpoints and three decisions logs); it was fetched and is one commit behind origin. Those files were not touched.
- Read the [skills-map report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/skills-map.report.md), section Diagram. It draws the thread model as a text diagram and lists no stale diagram items by name and makes no recommendation to add a thread-model diagram to `docs/diagrams/`; see the query below.
- The untracked harness `+/diagrams/` folder is `ki-diagrams` generated output (finalized HTML, Archify receipts and a `mark.toml` written by the earlier `mark-tidy` agent), not another session's unfinished work. It was neither committed, moved nor deleted. The refresh rewrote the two HTML files and their receipts in place, as the standard's refresh procedure directs, and Archify's browser check, which refuses to overwrite evidence owned by a previous build, wrote its fresh evidence under `+/diagrams/<slug>/refresh-daa63224/` as Archify's delivery contract prescribes. `mark.toml` is untouched and now describes an earlier build.
- Stale item found and fixed: both committed sources already traced the `ki-pmo` skill (traced at revision `6d3e2f34`) but both SVGs predated it (last exported at `122b34be`), so neither drawing showed `ki-pmo` or `ki-pmo-design`. Regenerated under `ki-diagrams` REFRESH: `skill-graph.ts --write` (sources unchanged apart from revision), Archify finalize at showcase quality with validate, deliver, check and browser check all passing for both diagrams, SVGs re-exported through `export-svg.ts`, `last_checked` advanced to `daa63224`. Reviewed both SVGs by eye in the light theme: the map now shows `pmo` and `pmo-design` in Change Management, the graph shows `pmo` above `checkpoint`, `implement`, `plan`, `pmo-design` and `recap`; no overlaps or crossings. Limitation: the dark theme was not reviewed by eye.
- Kris's recorded decisions were honoured and nothing else changed. From [KI-HARNESS-GOV-183 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/731580841ce5be89687784284a432e84a187646f/docs/roadmap/KI-HARNESS-GOV-183-generated-skill-map.md): the layout stays two diagrams, as Kris chose "Two diagrams (Recommended)" and "Leave them out (Recommended)" for hand-drawn context edges and boxes, and the `runtime-bound` marker stays dropped, the record stating the "runtime-bound tag dropped 48px node cannot hold third text row without overlap, and capability catalogue already publishes runtime binding". From [KI-HARNESS-GOV-179 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/731580841ce5be89687784284a432e84a187646f/docs/roadmap/KI-HARNESS-GOV-179-diagram-html-commit-opt-in.md): no HTML was committed, the record being held "until 2026-11-16" and parked, with Kris's direction "HTML-COMMIT - (a) manifest opt-in to commit the HTML; harness opts in." kept as an idea in the Project note. The skill graph's height (3212 px), which GOV-183 records Kris "finds too long read", is a recorded open follow-on and was not changed here. Nothing was drawn by hand.
- Record threshold under `ki-work-roadmap`: no record raised. This is a regeneration under an existing standard with no behaviour change, below the threshold, and Kris's instruction stands in for the authority: "after skills-map reports, an agent refreshes them there, first checking with the Master who owns the untracked harness +/diagrams/ folder".
- Harness gates: `ki repo audit --skill ki-diagrams` PASS (the two DIAG-4 warnings cleared); `bun run test` 1152 pass, 0 fail; `skill-graph.ts --check` both in sync; `ki repo audit --skill ki-work-roadmap` PASS. Pre-commit hook passed.
- Harness commit `f847248b` "docs(diagrams): refresh the skill map and skill graph after the ki-pmo extraction", five files under `docs/diagrams/` by explicit path. `origin/main..HEAD` held only that commit; pushed fast-forward. The [diagrams index](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/diagrams/README.md) is the link target.
- `ki-principal`: read the [Enactment Process](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Operations/Processes/Enactment%20Process.md); under its "Owner instruction" rule ("An explicit instruction from the owner for a bounded change stands in for a record: the change is made directly, within the instruction's bounds") the Pillar edit is made directly under Kris's words "ki-principal's Engineering Practice Pillar and the ways-of-working Project note link to them". Added one paragraph to [Engineering Practice](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Pillars/Engineering%20Practice/Engineering%20Practice.md) after the `ki` tool paragraph and one **Skill diagrams** bullet to the [ways-of-working Project note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) Notes, quoting Kris's DIAGRAMS instruction, both linking the harness diagrams index on GitHub `main`, and bumped both `updated` stamps.
- `ki-principal` commit not made, as the brief directs: the pre-commit gate fails STREAM-9 on another thread's file, `Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md` ("Registry note lists work records ... records name their Project or Initiative instead"). The two edits are left uncommitted in the working tree; nothing else there was staged or touched.

## In Progress

Nothing is running.

Outstanding - no action requested now

- The two `ki-principal` edits await a commit once the `mac-studio-bootstrap` registry note passes STREAM-9 and the checkout is reconciled with origin (one commit behind, with another session's staged files); see PRINCIPAL-COMMIT below for who commits.
- Archify reports an update, 3.0.1 to 3.1.0; the harness-side REFRESH step that re-examines `sources.md` is a separate item and was not run.
- `+/diagrams/<slug>/mark.toml`, the early working-area mark from [KI-HARNESS-GOV-184 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/731580841ce5be89687784284a432e84a187646f/docs/roadmap/KI-HARNESS-GOV-184-working-area-marks.md), now describes the earlier build; this run did not rewrite it because the brief said to leave the folder as it is.

## Queries

### THREAD-DIAGRAM - whether to add a thread-model diagram to the harness

**Context:** Kris's instruction names "any new thread-model diagram" as living in the harness `docs/diagrams/` under `ki-diagrams`, and the brief said to add one if the skills-map report recommended it. The [skills-map report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/ways-of-working/skills-map.report.md) drew the thread model as a text diagram (Kris's message to the coordinating thread, the decisions log, checkpoint and brief, `ki agent` launch to a detached agent, the run report back, the owner Summary, the mark and Project close) but made no recommendation, so nothing was added. The `ki-diagrams` standard would draw it as an Archify workflow diagram traced from the `ki-pmo` and `ki-delegation` skill files, registered in `diagrams.toml` with a README section, finalized and exported like the two skill diagrams. It needs an authoring run with Archify, about one agent.

**Query:** Should a follow-up run author the thread-model diagram in the harness now, or should it wait?

**Options:** a) (recommended) Launch a follow-up run to author `thread-model` as an Archify workflow diagram under `docs/diagrams/`, traced from the `ki-pmo` and `ki-delegation` skills, registered in `diagrams.toml`, with the skills-map text diagram as its brief. b) Wait until the `ki-pmo` and `ki-delegation` split has settled and the open skills-map queries are answered, then author it. c) Keep the thread model as the text diagram in the skills-map report and design folder; add no Archify diagram.

### PRINCIPAL-COMMIT - who commits the two ki-principal link edits

**Context:** The Pillar paragraph and the Project-note bullet are in the `ki-principal` working tree, uncommitted, because the pre-commit gate fails on `mac-studio-bootstrap.md`, a file another thread owns, and the brief forbade committing in that case. The checkout is also one commit behind origin and holds another session's staged files, so no rebase was possible. The edits are two files, clean and ready to stage by explicit path.

**Query:** Who commits the two edits once the gate clears?

**Options:** a) (recommended) The ways-of-working thread commits the two files by explicit path at its next mark, once the `mac-studio-bootstrap` thread has fixed its registry note and the checkout is reconciled with origin. b) Kris commits them directly with the other pending `ki-principal` changes. c) Revert the two edits and re-run this step later from a clean checkout.

```text
THREAD-DIAGRAM

Launch a follow-up run to author thread-model as an Archify workflow diagram under docs/diagrams/ in ki-agentic-harness, traced from skills/change-management/ki-pmo/SKILL.md and skills/governance/ki-delegation/SKILL.md, registered in docs/diagrams/diagrams.toml with a README section, finalized at showcase quality and exported under ki-diagrams, using the Diagram section of +/_THREADS/ways-of-working/skills-map.report.md as its brief.

---

PRINCIPAL-COMMIT

The ways-of-working thread commits Pillars/Engineering Practice/Engineering Practice.md and Streams/Projects/ways-of-working/ways-of-working.md in ki-principal by explicit path at its next mark, once the mac-studio-bootstrap registry note passes STREAM-9 and the checkout is reconciled with origin.
```

╭─ run report · 2026-10-14T19:57:56Z ──────────────╮ │ │ │ █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀ · thread at rest │ │ █▀▀▄ █▀▀ ▀▀▀█ █    · nothing running │ │ █ █ █▄▄▄ ▄▄▄█ █    · nothing queued │ │ │ ╰──────────────────────────────────────────────────╯

- [at rest] nothing running or queued
- [waiting] THREAD-DIAGRAM
- [waiting] PRINCIPAL-COMMIT
- [uncommitted] ki-principal Pillar and Project-note edits, gate blocked by another thread's file
- [committed] harness docs/diagrams, pushed

```text
Resume KI Model: ways-of-working under current ki-pmo and ki-delegation since 19:56 BST: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
