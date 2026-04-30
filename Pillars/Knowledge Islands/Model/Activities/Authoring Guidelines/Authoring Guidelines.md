---
tags:
  - card/note
  - topic/ai
  - topic/automation
  - topic/knowledge-management
  - source/claude
status: current - April 2026
author: Written with Claude
---

# Authoring Guidelines

## Overview

How to design, document, and maintain island activities. Covers the five-layer model that determines where each type of content lives, the standard format for activity notes, and the discipline for iterating on scheduled task prompts.

---

## Five-Layer Content Model

Every activity involves five layers of content, each at a different level of generality. The rule is: **notes live at the most generic layer that accurately describes them**.

| Layer | Location                                | Generality                                          | Contains                                                                                  |
| ----- | --------------------------------------- | --------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| 1     | `Activities/{group}/`                   | Activity-specific, agent-agnostic, island-agnostic  | What the activity does, why it exists, trigger phrases, outcome definition                |
| 2     | `Knowledge Capital/Activities/{group}/` | Activity-specific, island-specific, agent-agnostic  | Island configuration the activity reads - routing rules, config files, data models        |
| 3     | `Agents/Agentic AI/`                    | Activity-agnostic, island-agnostic, agent-agnostic  | General AI operating patterns - caching, parallelism, rolling windows, artefact lifecycle |
| 4     | `Agents/Claude/`                        | Activity-agnostic, island-agnostic, Claude-specific | Claude's implementation - five modes, behavioural constraints, memory architecture        |
| 5     | `Tools/Claude/Activities/{group}/`      | Activity-specific, island-specific, Claude-specific | The actual prompt text; references Layers 2-4 at runtime                                  |

A piece of content that is "what this activity does" → Layer 1. A piece that is "how Claude does it for this island" → Layer 5. Content that would apply to any island's email triage → Layer 3 or 4. Content that is this island's routing config → Layer 2.

---

## Constitutional and Adoptable Groups

Activity groups divide into two categories that are treated differently throughout this guide.

**Constitutional groups** are prior to the adoption framework - they define what it means to be a Knowledge Island and cannot be vetoed. Currently there is one constitutional group: [[Model/Activities/Constitutional/Constitutional|Constitutional]], which contains the Conformance Check. Constitutional group indexes do not carry an Adoption Requirements section.

**Adoptable groups** are everything else. Each island takes an explicit `adopted` or `vetoed` position on each adoptable group; absence of a position is non-conformant. Every adoptable group index note must carry an Adoption Requirements section (see below) that declares exactly what Knowledge Capital notes an island must create to adopt or veto the group. This makes the adoption contract explicit and machine-verifiable by the Conformance Check.

---

## Activity Note Format (Layer 1)

The canonical format for Layer 1 activity notes is defined in [[Activity Note]] under `Conventions/Notes/Types/`. Required sections are Overview, Trigger, and Outcome. The optional `## Prompt` section holds the executable prompt when the activity is lightweight enough to keep it inline - for substantial prompts (Route Triage, Knowledge Rebuild), the prompt migrates to `Tools/Claude/Activities/{group}/` and the Layer 1 note links to it.

---

## Adoption Requirements

Every adoptable group index note must include an Adoption Requirements section. It is the adoption contract - the machine-readable declaration of what KC notes the Conformance Check will verify.

**Format:** A short framing sentence, then a table with three columns: Note (a short label), Path (the canonical KC path, relative to the repository root, no `.md` extension), and Purpose (one-sentence description of what the note contains and why it is needed). Follow the table with a note for the veto case: what stub an island must create if it vetoes the group.

**Placement:** At the end of the note, separated by `---`.

**What to include:** List every KC note the group's activities read at runtime. Notes shared across groups (e.g. `Knowledge Capital/Activities/Schedule`) should still be listed in each group that requires them - the Conformance Check verifies each group's requirements independently.

**Veto stubs:** A vetoed group must have a KC index stub at its group path acknowledging the veto. If the group has additional required notes, each needs a corresponding N/A stub. State this explicitly in the adoption requirements text.

---

## Prompt Editing Discipline

When iterating on a scheduled task's prompt via its activity note:

- Edit the island note freely - treat it as the draft. As many iterations as needed.
- Do **not** call `update_scheduled_task` after every edit. The scheduled task is a release target, not a live editor.
- Only push accumulated changes to the scheduled task when the user signals readiness: _"push it"_, _"sync the task"_, _"ready to run"_, or equivalent.
- At the end of any session where prompt changes were made without a push, flag that the push is still pending.

Pushing every small edit wastes API calls, creates noisy scheduler state, and risks a half-baked prompt running if a schedule fires mid-iteration.

---

## Designing a New Activity

1. **Identify the layer** - is this truly a new activity (new Layer 1 note needed) or a new prompt variant of an existing one (Layer 5 only)?
2. **Check Knowledge Capital** - does island-specific config for this activity already exist, or does it need a new Layer 2 note?
3. **Check Agentic AI patterns** - does the activity need caching, parallel MCP calls, or a rolling window? Use existing Layer 3 patterns; don't re-derive them in the prompt.
4. **Write Layer 1 first** - document what and why before writing the prompt. If you can't articulate a clear outcome, the activity isn't ready to prompt yet.
5. **Write the prompt at Layer 5** - reference Layer 2 config by path; invoke Layer 3 patterns by name. Avoid duplicating logic that already exists at a higher layer.
6. **Create the scheduled task last** - only when the prompt is stable. The scheduled task is a deployment artefact, not a scratchpad.
