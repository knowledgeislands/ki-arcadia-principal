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

How to design, document, and maintain island activities. Covers the content layers that determine where each type of content lives, the standard format for activity notes, and the discipline for iterating on scheduled task prompts.

---

## Content Layers

Every activity is composed of content in five distinct layers, each at a different level of generality. The rule is: **notes live at the most generic layer that accurately describes them**.

| Layer | Location | Generality | Contains |
| --- | --- | --- | --- |
| Definition | `Activities/{group}/` | Activity-specific, agent-agnostic, island-agnostic | What the activity does, why it exists, trigger phrases, outcome definition |
| Configuration | `Knowledge Capital/Activities/{group}/` | Activity-specific, island-specific, agent-agnostic | Island configuration the activity reads - routing rules, config files, data models |
| Pattern | `Agents/Agentic AI/` | Activity-agnostic, island-agnostic, agent-agnostic | General AI operating patterns - caching, parallelism, rolling windows, artefact lifecycle |
| Agent Behaviour | `Agents/Claude/` | Activity-agnostic, island-agnostic, Claude-specific | Claude's implementation - five modes, behavioural constraints, memory architecture |
| Prompt | `Tools/Claude/Activities/{group}/` | Activity-specific, island-specific, Claude-specific | The actual prompt text; references the other layers at runtime |

A piece of content that is "what this activity does" → Definition. A piece that is "how Claude does it for this island" → Prompt. Content that would apply to any island's email triage → Pattern or Agent Behaviour. Content that is this island's routing config → Configuration.

### The Lattice

The three generality axes - activity, island, agent - form a 2x2x2 lattice with eight corners. The five layers populate five of those corners; the remaining three are empty by design.

| Generality                       | Activity-specific | Activity-agnostic   |
| -------------------------------- | ----------------- | ------------------- |
| island-agnostic, agent-agnostic  | **Definition**    | **Pattern**         |
| island-specific, agent-agnostic  | **Configuration** | —                   |
| island-agnostic, Claude-specific | —                 | **Agent Behaviour** |
| island-specific, Claude-specific | **Prompt**        | —                   |

The empty corners are informative. There is no "Claude-specific definition of an activity" because activity definitions are agent-agnostic by construction; if Claude needs to do it differently from another agent, that lives in the Prompt. There is no "island-specific generic agentic pattern" because patterns are by definition portable across islands; an island that needs to bend a pattern records the exception in its Configuration. There is no "island-specific Claude behaviour without an activity" because Claude's island-specific behaviour is always in service of an activity, and therefore lives in the Prompt.

---

## Constitutional and Adoptable Groups

Activity groups divide into two categories that are treated differently throughout this guide.

**Constitutional groups** are prior to the adoption framework - they define what it means to be a Knowledge Island and cannot be vetoed. Currently there is one constitutional group: [[Model/Activities/Constitutional/Constitutional|Constitutional]], which contains the Conformance Check. Constitutional group indexes do not carry an Adoption Requirements section.

**Adoptable groups** are everything else. Each island takes an explicit `adopted` or `vetoed` position on each adoptable group; absence of a position is non-conformant. Every adoptable group index note must carry an Adoption Requirements section (see below) that declares exactly what Knowledge Capital notes an island must create to adopt or veto the group. This makes the adoption contract explicit and machine-verifiable by the Conformance Check.

---

## Activity Note Format (Definition)

The canonical format for Definition notes is defined in [[Activity Note]] under `Conventions/Notes/Types/`. Required sections are Overview, Trigger, and Outcome. The optional `## Prompt` section holds the executable prompt when the activity is lightweight enough to keep it inline - for substantial prompts (Route Triage, Knowledge Rebuild), the prompt migrates to `Tools/Claude/Activities/{group}/` and the Definition note links to it.

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

1. **Identify the layer** - is this truly a new activity (new Definition note needed) or a new prompt variant of an existing one (Prompt only)?
2. **Check Knowledge Capital** - does island-specific Configuration for this activity already exist, or does it need a new Configuration note?
3. **Check Agentic AI patterns** - does the activity need caching, parallel MCP calls, or a rolling window? Use existing Patterns; don't re-derive them in the prompt.
4. **Write the Definition first** - document what and why before writing the prompt. If you can't articulate a clear outcome, the activity isn't ready to prompt yet.
5. **Write the Prompt** - reference Configuration by path; invoke Patterns by name. Avoid duplicating logic that already exists at a higher layer.
6. **Create the scheduled task last** - only when the prompt is stable. The scheduled task is a deployment artefact, not a scratchpad.
