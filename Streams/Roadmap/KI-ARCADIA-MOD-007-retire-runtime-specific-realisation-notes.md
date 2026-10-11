---
note_type: stream-roadmap
id: KI-ARCADIA-MOD-007
area: MOD
title: Retire runtime-specific realisation notes
kind: deliver
project: island-model-and-tending
status: done
blocks: []
blocked_by: []
baseline_ref: 8e4ec432f59401c141e2850d3d3819e7797b2a3f
created_at: 2026-10-09T06:52:41Z
updated_at: 2026-10-11T01:38:04Z
---

# Retire Runtime-Specific Realisation Notes

## Goal

The island holds no Claude- or Codex-specific notes. Whatever such notes carry today either points back to the runtime-neutral knowledge-base notes or lives in the skills that realise them.

## Context

Several Pillars notes restate a runtime-neutral note for one agent runtime. The clearest case is the Claude activity prompts, which duplicate the model Activity notes they realise. Two links show the cost: `[[Health Check]]` and `[[Knowledge Rebuild]]` could resolve to either the model note or its Claude realisation. Commit `ac79533` qualified them to point at the model notes (ki-repo-kb LINK-1). Kris's direction, recorded in the GOV-020 decisions log (Decision 5, 2026-10-09), is that the island should ideally hold no Claude- or Codex-specific notes.

Runtime-specific notes in the island today:

- Claude activity realisations under `Pillars/Philosophy/Model/Tools/Claude/Activities/`:
  - `Activities.md`
  - `Constitutional/Constitutional.md`
  - `Constitutional/Conformance.md`
  - `Tending/Tending.md`
  - `Tending/Health Check.md`, which realises [[Model/Activities/Tending/Health Check|Health Check]]
  - `Tending/Knowledge Rebuild.md`, which realises [[Model/Activities/Tending/Knowledge Rebuild|Knowledge Rebuild]]
  - `Tending/Convergence Check.md`
  - `Tending/Scheduled Task Audit.md`
- Other Claude tool notes under `Pillars/Philosophy/Model/Tools/Claude/`: `Claude.md`, `Cowork Configuration Layers.md`, `Live Artifacts/Live Artifacts.md` and `Mistakes and Lessons.md`.
- `Pillars/Philosophy/Model/Tools/Claude Housekeeping/Claude Housekeeping.md`.
- `Pillars/Philosophy/Model/Tools/ChatGPT/ChatGPT.md`.
- Agent notes: `Pillars/Philosophy/Model/Agents/Claude/Claude.md` and `Pillars/Philosophy/Model/Agents/ChatGPT/ChatGPT.md`.

Several model notes link into this tree, including [[Model/Activities/Activities|Activities]], [[Model/Activities/Tending/Tending|Tending]], [[What Keeps an Island Alive]], [[Agentic AI]], [[Structural Audit]] and the [[Admin/Governance/Charter|Charter]]. Some links reach the Claude-only notes `Scheduled Task Audit` and `Mistakes and Lessons`. The root `AGENTS.md` and `CLAUDE.md` also cite `Mistakes and Lessons`.

## Boundary

- In scope: deciding the line between a realisation note that should go and a descriptive note that may legitimately describe an external tool or agent; folding any unique content into the runtime-neutral notes or the owning skills; retiring the realisation notes; and repointing the links to them.
- Out of scope: the root `CLAUDE.md` runtime file, the `+/` and `-/` staging areas, and skill content in other repositories, which those repositories own.

## Current state

Planned against `origin/main` at `dbc66e8a638b86705e307f8e949b0295559f2ebb` (2026-10-10). Implementation records its own `baseline_ref` when it starts and re-verifies each step against the live file.

- The 16 runtime-specific notes listed under Context all exist. The Claude activity prompts are written for Cowork: they locate the island with `find /sessions/*/mnt ... "Knowledge Capital.md"`, a folder that no longer exists, and read `Pillars/Philosophy/Model/Agents/Claude/Island Skill.md`, which does not exist either.
- The model Activity notes already carry the outcome of each prompt, but not every check. The gaps are listed under Steps.
- [[Admin/Governance/Conventions/Canonical Meta Notes|Canonical Meta Notes]] lists four stale paths under `Pillars/Philosophy/Tools/Claude/` and `Pillars/Philosophy/Agents/Claude/`, including `Claude Behaviour.md` and `Memory Architecture.md`, which no longer exist. [[Model/Activities/Tending/Knowledge Rebuild|Knowledge Rebuild]] still relies on `Memory Architecture.md` for its mapping-table check; the only mapping table today is in `Agents/Claude/Claude.md`.
- [[Agentic AI]] says that [[AI Automation Patterns]] covers the live artifact baseline, the two-mechanic update protocol, parallel MCP fetch and the rolling time window. In fact only the execution and change ratio and the JSON5 cache are there; the rest is in `Agents/Claude/Claude.md` under Live Artifact Patterns.
- The [[Admin/Governance/Charter|Charter]] Convergence Check row links `Pillars/Philosophy/Activities/Tending/Convergence Check`, a path that is missing the `Model/` segment. This record does not cause the fault, but its link check touches that row.
- `ki repo audit --skill ki-repo-kb-streams` shows WARN only, with three STREAM-10 close-out warnings on other Projects; `ki repo audit --skill ki-work` passes.

## Steps

Paths are relative to `Pillars/Philosophy/Model/` unless they start at the repository root. Wording follows root `AGENTS.md`: British English, ASCII hyphens only, and no Claude- or Codex-specific framing in the receiving notes.

- [x] **1. Fold the missing activity checks into the model notes.** Before deleting the prompts, add each runtime-neutral check that the prompt has and the model note lacks. Leave out runtime mechanics such as Cowork paths, `find /sessions/*/mnt`, `mcp__scheduled-tasks__*`, `$MEMORY_DIR` shell steps and Knowledge Capital discovery.
  - `Activities/Constitutional/Conformance.md` from `Tools/Claude/Activities/Constitutional/Conformance.md`:
    - The Charter sections required for the baseline: `## Identity` with island name, skill name and task prefix; a non-empty `## Activity Groups` table; `## Scheduled Activities`; and `## Tools`.
    - The rule that identifies a framework group: an `Activities/` subfolder whose index carries an `## Adoption Requirements` table, excluding Constitutional.
    - The stub test: a note that says "not applicable" or "vetoed" fails for an adopted group.
    - The three overall statuses: `CONFORMANT`, `NON-CONFORMANT (CRITICAL)` and `NON-CONFORMANT`.
    - The rule that the check is read-only and proposes no fixes.
  - `Activities/Tending/Health Check.md` from the Health Check prompt:
    - Load [[Mistakes and Lessons]] before reviewing.
    - Flag inbox items in `+/` older than a week for routing.
    - Flag content that contradicts the root agent instructions.
    - Reword the runtime-specific "CLAUDE.md vs Island Skill alignment" bullet as an alignment check between root `AGENTS.md` and the island's installed skills, and remove the path to the non-existent `Agents/Claude/Island Skill.md`.
  - `Activities/Tending/Knowledge Rebuild.md` from the Knowledge Rebuild prompt and the `Agents/Claude/Claude.md` Memory section:
    - The five canonical memory files and what each contains: user profile, structure, note format, operations and key notes.
    - The required memory-file frontmatter (`name`, `description`, `type`) and the mandatory `## KI Sources` section.
    - The `MEMORY.md` index rewrite, covering both canonical and auxiliary files.
    - The closing session digest, referenced from the daily note.
    - Replace "requires `Memory Architecture.md`" with the note's own canonical-file list together with the `memory_file:` frontmatter convention in [[Residency]].
    - Describe the memory location as the runtime's memory directory, not `/sessions/*/mnt/.auto-memory/`.
  - `Activities/Tending/Convergence Check.md` from the Convergence Check prompt:
    - Stop when fewer than two islands are found.
    - Check that the tag superset is respected: flag tags in use that are missing from the shared Tags note.
    - List all findings before proposing any change.
    - Write confirmed shared-note changes to every island at once.
- [x] **2. Retire Scheduled Task Audit.**
  - Remove its row from the [[Admin/Governance/Charter|Charter]] Scheduled Activities table (line 75).
  - In [[Tending Activity]], change "All nine activities are enabled - three scheduled automations (Scheduled Task Audit, Health Check, Knowledge Rebuild)" to eight activities and two scheduled automations.
  - In [[Model/Activities/Tending/Tending|Tending]], remove the `## Scheduled Task Audit` section and change the cadence sentence (line 19) to two scheduled automations.
  - In [[What Keeps an Island Alive]], remove the table row (line 45) and its `‡` footnote (line 55).
  - In [[Knowledge Islands]], remove the list entry (line 90).
  - Confirm that [[Schedule]] has no Scheduled Task Audit entry. It had none at planning.
- [x] **3. Move Mistakes and Lessons.**
  - Move `Tools/Claude/Mistakes and Lessons.md` to `Admin/Operations/Mistakes and Lessons.md` with `git mv`, so that the bare `[[Mistakes and Lessons]]` links in root `AGENTS.md` (line 87) and [[Structural Audit]] (line 94) still resolve.
  - Give it a `note_type` that `ki repo audit --skill ki-repo-kb` accepts for `Admin/Operations/` and drop `source/claude`.
  - Reword the Overview and How It Works in runtime-neutral terms: "the agent" and "memory", with no reference to "Claude" or `[[CLAUDE]]`.
  - Keep the resolved-lesson rows as a historical record, including the tool names they cite.
  - Keep the `memory_file:` frontmatter.
  - Add a row to the `Admin/Operations/Operations.md` Contents table.
  - In root `AGENTS.md`, change only the wording if it still names a runtime. The link needs no change.
- [x] **4. Fold the Claude agent note into Agentic AI.**
  - Add a runtime-neutral Behavioural Constraints section to [[Agentic AI]]. It carries the do and avoid lists from `Agents/Claude/Claude.md`, with "use em-dashes for pauses" replaced by the house ASCII-hyphen rule.
  - Add a Release Targets section to [[Agentic AI]]: draft in the source, push to the scheduled or published target in batches when the owner signals readiness, and flag any unpushed changes at session end.
  - Move the runtime-neutral Live Artifact Patterns into [[AI Automation Patterns]], whose existing summary already claims them: the live artifact baseline, parallel MCP fetch, the client-side rolling window and deterministic versus sampled synthesis. Leave out the Cowork-only mechanics: connector rewiring, `mcp__cowork__*` update calls and recipe self-synchronisation.
  - The five operating modes stay with `ki-repo-kb`, and the memory mapping goes to step 1 (Knowledge Rebuild).
- [x] **5. Fold the tool-note points.**
  - Add one runtime-neutral sentence to [[How Tools Connect]]: a runtime without file access reads island context loaded into it and returns work only through manual routing under [[Structure]].
  - Add one sentence to the [[Admin/Operations/Live Artifacts/Live Artifacts|Admin Live Artifacts]] overview: after each approved change, the HTML render is refreshed so that the repository copy matches what is deployed.
  - `ki-repo-kb-live-artifacts` already owns the pair convention and the rule that the render must not lag its source, so nothing else moves.
- [x] **6. Delete the 16 runtime-specific notes and their now-empty folders.**
  - `Tools/Claude/` in full: `Claude.md`, `Cowork Configuration Layers.md`, `Live Artifacts/Live Artifacts.md`, and `Activities/` in full (eight notes: three indexes and five prompts, including Scheduled Task Audit). `Mistakes and Lessons.md` has already moved in step 3.
  - `Tools/Claude Housekeeping/Claude Housekeeping.md`.
  - `Tools/ChatGPT/ChatGPT.md`.
  - `Agents/Claude/Claude.md` and `Agents/ChatGPT/ChatGPT.md`.
- [x] **7. Repoint or remove the remaining inbound links.** These were re-checked on 2026-10-10 with a fresh search of tracked Markdown, excluding `Calendar/`, `+/`, `-/` and the retired notes themselves.
  - [[Tools]]: remove the `## Claude` (line 32), `## ChatGPT` (line 38) and `## Claude Housekeeping` (line 80) sections, and edit the Overview sentence on line 16 that names Claude and ChatGPT as adopted tools.
  - [[How Tools Connect]]: replace the `## Claude` and `## ChatGPT` sections (lines 27 to 33) with the step 5 sentence, and remove `## Claude Housekeeping` (line 63).
  - [[Model/Agents/Agents|Agents]]: remove the `## Claude` (line 40) and `## ChatGPT` (line 46) sections.
  - [[Who Acts on the Island]]: rewrite the `## Claude` (line 31) and `## ChatGPT` (line 35) sections to point at [[Agentic AI]], or remove them.
  - [[Agentic AI]]: in What Lives Here (lines 39 and 41), route agent-specific and prompt-specific content to the owning skills instead of the retired notes.
  - [[Knowledge Islands]]: remove the entries on lines 107, 108, 114 and 115.
  - [[Model/Activities/Activities|Activities]] (line 16), [[What Keeps an Island Alive]] (lines 19 and 25) and [[Authoring Guidelines]] (line 161): say that executable procedure lives in the skill that realises each activity, not in `Tools/Claude/Activities/`.
  - [[Authoring Guidelines]]: rewrite the agent-specific Behaviour layer bullets (lines 106 to 109) and the Script layer (lines 111 to 116, which also cite the retired `Pillars/Knowledge Capital/` path) in the same way.
  - [[Model/Activities/Tending/Health Check|Health Check]] (line 25): already rewritten in step 1.
  - [[Model/Activities/Tending/Knowledge Rebuild|Knowledge Rebuild]] (line 50): already rewritten in step 1.
  - [[Model/Activities/Tending/Tending|Tending]] (line 25): already removed in step 2.
  - [[Admin/Governance/Conventions/Canonical Meta Notes|Canonical Meta Notes]]: replace lines 28 to 34 with the new `Admin/Operations/Mistakes and Lessons.md` path and remove the three retired or non-existent entries.
  - [[Admin/Governance/Charter|Charter]]: the Scheduled Task Audit row goes in step 2. Correct the Convergence Check row's link to `Model/Activities/Tending/Convergence Check`.
  - [KI-ARCADIA-MOD-006](KI-ARCADIA-MOD-006-knowledge-acquisition-lifecycle.md) (Current state, line 46): replace "Arcadia describes it in `[[Claude Housekeeping]]`" with a reference to the `mcp-housekeeping-claude` README.
- [x] **8. Add two non-blocking handoffs to `ki-agentic-harness`.** Add each as a `status: triage` record in `docs/roadmap/` in area `GOV`, allocating the next serial from that repository's `_ISSUES.md` at the time and bumping the ledger in the same commit. Each record names Arcadia Principal as the origin, says plainly that it blocks nothing, and links no Arcadia roadmap record. Arcadia's notes are deleted in step 6 regardless, because each handoff carries its point in its own text.
  - To `ki-tokenomics`, from the retired `Tools/Claude/Claude.md`: two standing-surface design rules, plus two tending triggers.
    - Design rules: keep one routing authority, so that a skill defers to the root instructions instead of restating them; and carry resolved lessons in memory, not as a note read at load time.
    - Tending triggers: review the instructions file as it nears its budget (the note used about 10,000 bytes, roughly 2,500 tokens, which matches `instructions = 2500`); and before adding a permanent always-loaded section, ask whether it could be read only when it is needed.
  - To `ki-tokenomics-claude`, from the retired `Cowork Configuration Layers.md`: how reliably each Claude context layer fires.
    - The system prompt and project instructions are always on. The memory index is always loaded, but memory files are read only on demand, so their rules apply only conditionally. `CLAUDE.md` loads only when its folder is mounted. Skills load only when invoked.
    - Hence rules meant to hold every time belong in an always-on layer. The receiving repository decides whether this belongs in the audit standard or in guidance.
  - Commit and push in `ki-agentic-harness` only under that repository's own authority and conventions.
- [x] **9. Verify** as set out under Verify. Prepare the review packet, then set the record to `awaiting-review`.

## Files touched

- Fold targets: `Activities/Constitutional/Conformance.md`, `Activities/Tending/Health Check.md`, `Activities/Tending/Knowledge Rebuild.md`, `Activities/Tending/Convergence Check.md`, `Agents/Agentic AI/Agentic AI.md`, `Agents/Agentic AI/AI Automation Patterns.md`, `Tools/How Tools Connect.md` and `Admin/Operations/Live Artifacts/Live Artifacts.md`.
- Move: `Tools/Claude/Mistakes and Lessons.md` to `Admin/Operations/Mistakes and Lessons.md`, plus `Admin/Operations/Operations.md`.
- Delete: the 15 remaining notes under `Tools/Claude/`, `Tools/Claude Housekeeping/`, `Tools/ChatGPT/`, `Agents/Claude/` and `Agents/ChatGPT/`, and their folders.
- Repoint: `Tools/Tools.md`, `Agents/Agents.md`, `Agents/Who Acts on the Island.md`, `Activities/Activities.md`, `Activities/Tending/Tending.md`, `Activities/What Keeps an Island Alive.md`, `Activities/Authoring Guidelines/Authoring Guidelines.md`, `Pillars/Philosophy/Knowledge Islands.md`, `Admin/Governance/Charter.md`, `Admin/Operations/Activities/Tending Activity.md`, `Admin/Governance/Conventions/Canonical Meta Notes.md`, root `AGENTS.md` (wording only, if needed) and `Streams/Roadmap/KI-ARCADIA-MOD-006-knowledge-acquisition-lifecycle.md`.
- In `ki-agentic-harness`: two new `docs/roadmap/KI-HARNESS-GOV-<NNN>-*.md` triage records and `docs/roadmap/_ISSUES.md`.
- This record.

## Verify

- `find Pillars/Philosophy/Model/Tools/Claude "Pillars/Philosophy/Model/Tools/Claude Housekeeping" Pillars/Philosophy/Model/Tools/ChatGPT Pillars/Philosophy/Model/Agents/Claude Pillars/Philosophy/Model/Agents/ChatGPT 2>/dev/null` returns nothing.
- `git grep -nE 'Tools/Claude|Agents/Claude|Claude/Activities|Tools/ChatGPT|Agents/ChatGPT|Claude Housekeeping\]\]|Cowork Configuration Layers|Scheduled Task Audit' -- ':!Calendar' ':!+' ':!-' ':!Streams/Roadmap/KI-ARCADIA-MOD-007-*'` returns nothing.
- No dangling wikilinks: `ki repo audit --skill ki-repo-kb --repo . --progress never` shows no new link failure, and every changed note's wikilinks resolve to a single existing note (checked with a script over the changed paths). `[[Mistakes and Lessons]]` resolves to `Admin/Operations/Mistakes and Lessons.md`.
- `grep -nP '[\x{2013}\x{2014}]'` over the changed and new notes returns nothing.
- `rumdl check .` is clean.
- `ki repo audit --repo . --progress never` shows no new FAIL compared with the baseline, which has three STREAM-10 warnings on other Projects.
- The two harness handoff records exist as `status: triage`, say they are non-blocking, and pass `ki repo audit --skill ki-work-roadmap --repo <ki-agentic-harness>`.
- The review packet lists, for each retired note, what was folded where and what was deliberately dropped.

## Dependencies / blocks

No local prerequisite. The two harness handoffs are non-blocking in both directions: this record deletes the source notes whatever the harness does, because each handoff carries its content in its own text. The single Enactment pass over index-note Overviews and the placeholder Realisation notes (INDEX-OVERVIEW and PLACEHOLDERS, island-model-and-tending decisions log, Decision 8) comes after this record, because steps 4 to 7 rewrite several of those indexes. It is sequenced after this record, but it is not captured as a record yet, so `blocks` stays empty.

Placeholder Realisation notes: `Pillars/Philosophy/Realisation/` holds four placeholders, not three: `Charter/Charter.md`, `Council/Council.md`, `Integrations/Integrations.md` and `Configuration/Configuration.md`. None of them is Claude- or Codex-specific, and none links into the retired tree, so all four stay outside this record and go to the PLACEHOLDERS pass.

## Documentation impact

### Decision Records

None. The disposition is recorded in this record and in Decision 9 of the decisions log. No structural precedent needs a standalone DR beyond Kris's existing direction.

### Specifications

None.

### Guides

None in Arcadia. The receiving skills in `ki-agentic-harness` own any guidance change that comes from the handoffs.

### Roadmap

- Two handoff records in `ki-agentic-harness` (step 8), added as non-blocking triage: standing-surface design rules for `ki-tokenomics`, and Claude context layer reliability for `ki-tokenomics-claude`. Each names Arcadia Principal as its origin in plain words; neither repository cites the other's record identifier, per the cross-repository choreography rule in root `AGENTS.md`.
- The [[Model/Activities/Tending/Knowledge Rebuild|Knowledge Rebuild]] model note will still describe runtime auto-memory after step 1. Whether that whole activity should become runtime-neutral or move into a skill is a separate question. If the review raises it, capture it as Triage rather than widening this record.
- The [[Admin/Governance/Charter|Charter]] Agents table names a Cowork memory location. That is island configuration in `Admin/`, outside this record's Pillars scope, and should be captured as Triage if it needs revisiting.

## Review

### Delivered

The approved boundary from Decisions 9 and 10 of the island-model-and-tending decisions log: fold the missing checks and points into runtime-neutral notes, retire Scheduled Task Audit, move Mistakes and Lessons to `Admin/Operations/`, delete the 15 remaining Claude- and ChatGPT-specific notes, repoint every inbound link, correct the Charter's Convergence Check link, and add two non-blocking harness handoffs. Root `CLAUDE.md`, `Calendar/`, `+/` and `-/` were left alone. Baseline: `8e4ec432f59401c141e2850d3d3819e7797b2a3f`.

### Change Summary

What each retired note became, with paths relative to `Pillars/Philosophy/Model/`:

| Retired note | Folded into | Deliberately dropped |
| --- | --- | --- |
| `Tools/Claude/Activities/Activities.md`, `Constitutional/Constitutional.md`, `Tending/Tending.md` | Nothing; they only indexed the prompts | The index text |
| `Tools/Claude/Activities/Constitutional/Conformance.md` | [[Model/Activities/Constitutional/Conformance\|Conformance]]: the required Charter sections, the framework-group rule, the stub test, the three overall statuses and the read-only rule | Cowork discovery and report template wording |
| `Tools/Claude/Activities/Tending/Health Check.md` | [[Model/Activities/Tending/Health Check\|Health Check]]: load [[Mistakes and Lessons]] first, flag `+/` items older than a week, flag content contradicting the root instructions, and an `AGENTS.md`-to-skills alignment check replacing the `CLAUDE.md` vs Island Skill bullet | The path to the non-existent `Island Skill.md`, Cowork paths |
| `Tools/Claude/Activities/Tending/Knowledge Rebuild.md` and the Memory section of `Agents/Claude/Claude.md` | [[Model/Activities/Tending/Knowledge Rebuild\|Knowledge Rebuild]]: a Canonical Memory Files section (five files and their contents, required frontmatter, mandatory `## KI Sources`), the `MEMORY.md` rewrite, the closing session digest, and a canonical-file check replacing the `Memory Architecture.md` mapping-table check; memory now "the runtime's memory directory" | `/sessions/*/mnt/.auto-memory/`, `$MEMORY_DIR` shell steps, the auxiliary-file mapping table, the Cowork `type` vocabulary |
| `Tools/Claude/Activities/Tending/Convergence Check.md` | [[Model/Activities/Tending/Convergence Check\|Convergence Check]]: stop below two islands, the tag-superset check, list findings before proposing, write shared changes to every island at once | Island discovery mechanics |
| `Tools/Claude/Activities/Tending/Scheduled Task Audit.md` | Retired: removed from the [[Admin/Governance/Charter\|Charter]] roster, [[Tending Activity]] (now eight activities, two scheduled), [[Model/Activities/Tending/Tending\|Tending]], [[What Keeps an Island Alive]] and [[Knowledge Islands]]; [[Schedule]] had no entry | The whole activity, by Kris's choice |
| `Tools/Claude/Mistakes and Lessons.md` | Moved with `git mv` to [[Mistakes and Lessons]] in `Admin/Operations/`, `note_type: admin/operations/process`, `source/claude` dropped, Overview and How It Works reworded to "the agent" and "memory", `memory_file:` and the historical lesson rows kept; row added to [[Operations]] | The `[[CLAUDE]]` link |
| `Tools/Claude/Claude.md` | Two design rules and two tending triggers handed to `ki-tokenomics` | Cowork connection and token detail |
| `Tools/Claude/Cowork Configuration Layers.md` | Layer reliability handed to `ki-tokenomics-claude` | Cowork-specific configuration detail |
| `Tools/Claude/Live Artifacts/Live Artifacts.md` | One sentence in the [[Admin/Operations/Live Artifacts/Live Artifacts\|Admin Live Artifacts]] overview on refreshing the render after each approved change | The pair convention, already owned by `ki-repo-kb-live-artifacts` |
| `Agents/Claude/Claude.md` | [[Agentic AI]]: Behavioural Constraints (em-dash rule replaced by the house ASCII-hyphen rule) and Release Targets; [[AI Automation Patterns]]: Live Artifact Patterns (baseline, parallel MCP fetch, rolling window, deterministic vs sampled synthesis) | The five operating modes (owned by `ki-repo-kb`), connector rewiring, `mcp__cowork__*` update calls, recipe self-synchronisation |
| `Tools/Claude Housekeeping/Claude Housekeeping.md` | Nothing; [[Tools]] and [[How Tools Connect]] entries removed, and KI-ARCADIA-MOD-006 now points to the `mcp-housekeeping-claude` README | The catalogue, which the README owns |
| `Tools/ChatGPT/ChatGPT.md`, `Agents/ChatGPT/ChatGPT.md` | One sentence in [[How Tools Connect]] on runtimes without file access | ChatGPT-specific detail |

Inbound links repointed or removed in [[Tools]], [[How Tools Connect]], [[Model/Agents/Agents\|Agents]], [[Who Acts on the Island]], [[Agentic AI]], [[Knowledge Islands]], [[Model/Activities/Activities\|Activities]], [[What Keeps an Island Alive]], [[Authoring Guidelines]] (Behaviour and Script layers, and the Definition-note paragraph), [[Canonical Meta Notes]] (new path; three retired or non-existent entries removed), the [[Admin/Governance/Charter\|Charter]] (Convergence Check link now `Model/Activities/Tending/Convergence Check`) and KI-ARCADIA-MOD-006. Root `AGENTS.md` needed no change: its `[[Mistakes and Lessons]]` link resolves and its wording names no runtime.

Approved deviations and small judgements:

- [[AI Automation Patterns]] had a broken code fence (a four-backtick opener that turned most of the note into code); it was corrected while appending, and its Overview no longer says "Claude-powered". Its summary in [[Agentic AI]] now lists the patterns actually present.
- The harness ledger reserves numbers in a commit of its own before the record is written, so the two records landed in two harness commits rather than one.
- The handoffs name Arcadia Principal as origin in plain words and cite no Arcadia record identifier, per both repositories' cross-repository rule; this record likewise describes them without citing harness identifiers.

### Verification

- `find` over the five retired folders returns nothing.
- The Verify `git grep` for retired paths and names, excluding `Calendar/`, `+/`, `-/` and this record, returns nothing.
- Wikilink script over all 22 changed notes: every link resolves to exactly one note, except three pre-existing faults present at baseline (see Outstanding concerns); `[[Mistakes and Lessons]]` resolves to `Admin/Operations/Mistakes and Lessons.md`.
- No en-dash or em-dash in any changed or new note.
- `rumdl check .` clean.
- `ki repo audit --repo . --progress never`: no new content failure against the baseline. The only new finding during delivery was COORD-15 on the delivery worktree's base, cleared by rebasing onto `origin/main` before push.
- Harness: both records are `status: triage`, say they block nothing, and `ki repo audit --skill ki-work-roadmap` passes; the full harness audit shows no new failure.

### Outstanding concerns

- Pre-existing broken links, not caused by this record: the [[Admin/Governance/Charter\|Charter]] links Conformance as `Philosophy/Activities/Constitutional/Conformance` twice (missing `Model/`), and [[How Tools Connect]] links a non-existent `Tool Ecosystem Map`. Worth a trivial follow-up fix.
- [[Canonical Meta Notes]] still lists other stale `Pillars/Knowledge Capital/` and pre-`Model/` paths outside this record's scope.
- [[Model/Activities/Tending/Knowledge Rebuild\|Knowledge Rebuild]] still describes runtime memory, as foreseen under Roadmap.

### Post-change review

The goal holds: no Claude- or ChatGPT-specific note remains in `Pillars`, and each runtime-neutral point now lives in a model note, an Admin note or a harness handoff. Scope held to the approved disposition plus the corrected code fence. Regression risk is low: the changes are documentation, links were checked by script and audit, and Calendar history keeps its old links by design. Ready for acceptance review.

### Mini recap

Delivered the full disposition, retired 15 notes, moved one, and handed two points to the harness. Checks pass with no new failure. Proposed learning routes, not promoted: a trivial link fix for the Charter Conformance and Tool Ecosystem Map links, and a Canonical Meta Notes path refresh, each as Triage if Kris wants them.

## Done

Accepted 2026-10-11 by Kris Brown, by Decision 16 of the island-model-and-tending thread ("accept KI-ARCADIA-MOD-007 as done"), against the Review packet above. The outstanding concerns it names stay unaddressed by this closure and remain available for capture as Triage.

## Discussion

### Capture

Captured as Triage from the GOV-020 owner answers (batch 4). Changes to `Pillars` go through the Enactment Process once the record is adopted.

### Adoption

Adopted by Kris on 2026-10-09 (state-of-play decisions log, Decision 9) for planning: the knowledge base keeps no Claude- or Codex-specific notes.

### Approval of the disposition

Kris approved the disposition table row by row on 2026-10-10 (island-model-and-tending decisions log, Decision 9), every row as recommended: fold missing checks into the model Activity notes and delete the seven Claude activity prompt notes; retire Scheduled Task Audit and remove it from the Charter roster and Tending Activity; delete `Tools/Claude/Claude.md` and hand any missing point to `ki-tokenomics`; hand any missing Cowork Configuration Layers point to `ki-tokenomics-claude`, then delete the note; fold Live Artifacts into its owners and delete it; move Mistakes and Lessons to `Admin/Operations/` with runtime-neutral wording; delete Claude Housekeeping and its [[Tools]] entry; add one ChatGPT sentence to [[How Tools Connect]], fold the Claude agent constraints and release discipline into [[Agentic AI]], and delete all three agent and tool notes.

### Approved disposition

Paths are relative to `Pillars/Philosophy/Model/`. Kris approved every row as recommended on 2026-10-10; the Steps above apply them.

| Note | Worth keeping | Proposed home |
| --- | --- | --- |
| `Tools/Claude/Activities/` index notes: `Activities.md`, `Constitutional/Constitutional.md`, `Tending/Tending.md` | Nothing; they index the prompts below. | Delete. |
| `Tools/Claude/Activities/Constitutional/Conformance.md`, `Tending/Health Check.md`, `Tending/Knowledge Rebuild.md`, `Tending/Convergence Check.md` | Any step or check missing from the matching model Activity note. Runtime mechanics (Cowork paths, `CLAUDE.md` alignment, auto-memory steps) are not worth keeping. | Fold missing checks into the model notes under `Activities/`; executable procedure belongs in the skill that realises each Activity. Delete the prompts. |
| `Tools/Claude/Activities/Tending/Scheduled Task Audit.md` | Possibly the idea of auditing that scheduled automations match their Activity notes; it has no runtime-neutral definition and the [[Admin/Governance/Charter\|Charter]] roster and [[Tending Activity]] count it. | Retire it and remove it from the Charter roster and Tending Activity (Kris's choice). |
| `Tools/Claude/Claude.md` | The token-economics point that standing context costs tokens. | `ki-tokenomics`, which already owns standing-surface budgets. Delete the note. |
| `Tools/Claude/Cowork Configuration Layers.md` | The layering of always-on and on-demand context and how reliably each fires. | Fold any point the skill lacks into `ki-tokenomics-claude` through a harness handoff. Delete the note. |
| `Tools/Claude/Live Artifacts/Live Artifacts.md` | The pair convention and update sequence. | Already owned by `ki-repo-kb-live-artifacts` and [[Admin/Operations/Live Artifacts/Live Artifacts\|Admin Live Artifacts]]; fold any unique step there. Delete the note. |
| `Tools/Claude/Mistakes and Lessons.md` | The closed-loop incident register and its resolved lessons, which root `AGENTS.md` cites. | Move to `Admin/Operations/Mistakes and Lessons.md` with runtime-neutral wording ("the agent", "memory"), and repoint `AGENTS.md`. |
| `Tools/Claude Housekeeping/Claude Housekeeping.md` | Little; the `mcp-housekeeping-claude` README is the authoritative catalogue and `ki-housekeeping-claude` owns its use. | Delete and remove the [[Tools]] entry (Kris confirmed). |
| `Tools/ChatGPT/ChatGPT.md`, `Agents/ChatGPT/ChatGPT.md` | Only that a runtime without file access reads island context and returns work by manual routing. | One runtime-neutral sentence in [[How Tools Connect]]. Delete both notes. |
| `Agents/Claude/Claude.md` | The behavioural constraints and the draft-then-release discipline for scheduled or published targets, both runtime-neutral. The five operating modes are owned by `ki-repo-kb`, and memory by [[Admin/MEMORY\|MEMORY]]. | Fold the constraints and release discipline into [[Agentic AI]]. Delete the note. |

Inbound links named at proposal: [[Admin/Governance/Charter\|Charter]], [[Canonical Meta Notes]], [[Tending Activity]], [[Knowledge Islands]], [[Model/Activities/Activities\|Activities]], [[Authoring Guidelines]], [[Model/Activities/Tending/Health Check\|Health Check]], [[Structural Audit]], [[Model/Activities/Tending/Tending\|Tending]], [[What Keeps an Island Alive]], [[Agentic AI]], [[Model/Agents/Agents\|Agents]], [[How Tools Connect]], [[Tools]], root `AGENTS.md` and KI-ARCADIA-MOD-006. Root `CLAUDE.md` stays out of scope. Calendar notes keep their historical links. The re-checked list is under Steps.

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
