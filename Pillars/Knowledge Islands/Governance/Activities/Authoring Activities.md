---
tags:
  - card/note
  - topic/ai
  - topic/automation
  - topic/knowledge-management
  - source/claude
status: current - April 2026
purpose: Guide for designing and maintaining island activities — the five-layer content model, activity note format, and prompt editing discipline
author: Written with Claude
---

# Authoring Activities

## Overview

How to design, document, and maintain island activities. Covers the five-layer model that determines where each type of content lives, the standard format for activity notes, and the discipline for iterating on scheduled task prompts.

---

## Five-Layer Content Model

Every activity involves five layers of content, each at a different level of generality. The rule is: **notes live at the most generic layer that accurately describes them**.

| Layer | Location                           | Generality                                          | Contains                                                                                  |
| ----- | ---------------------------------- | --------------------------------------------------- | ----------------------------------------------------------------------------------------- |
| 1     | `Activities/{group}/`              | Activity-specific, agent-agnostic, island-agnostic  | What the activity does, why it exists, trigger phrases, outcome definition                |
| 2     | `Knowledge Capital/{group}/`       | Activity-specific, island-specific, agent-agnostic  | Island configuration the activity reads — routing rules, config files, data models        |
| 3     | `Agents/Agentic AI/`               | Activity-agnostic, island-agnostic, agent-agnostic  | General AI operating patterns — caching, parallelism, rolling windows, artifact lifecycle |
| 4     | `Agents/Claude/`                   | Activity-agnostic, island-agnostic, Claude-specific | Claude's implementation — five modes, behavioural constraints, memory architecture        |
| 5     | `Tools/Claude/Activities/{group}/` | Activity-specific, island-specific, Claude-specific | The actual prompt text; references Layers 2–4 at runtime                                  |

A piece of content that is "what this activity does" → Layer 1. A piece that is "how Claude does it for this island" → Layer 5. Content that would apply to any island's email triage → Layer 3 or 4. Content that is this island's routing config → Layer 2.

---

## Activity Note Format (Layer 1)

Activity notes at Layer 1 follow a consistent format:

```
---
[standard frontmatter]
---

# Activity Name

## Overview

One paragraph: what this activity does, why it exists, and how often it runs.

---

## Trigger

For scheduled activities: schedule and Cowork task name.
For conversational activities: trigger phrase(s) and who initiates.

---

## Outcome

What a successful run produces — files written, state updated, output delivered.

---

## Prompt

[For activities where the prompt lives here rather than in Tools/Claude/Activities/]
Full prompt text.

---

## Related Topics

- [[Activities]] - parent index
- [[Authoring Activities]] - authoring and maintenance guide
- [relevant Knowledge Capital notes]
- [relevant Tools/Claude/Activities/ prompt note, once created]
```

The `## Prompt` section is used when the activity is straightforward and its prompt has no complex versioning or variant needs. For activities with substantial prompts (Route Triage, Knowledge Rebuild), the prompt migrates to `Tools/Claude/Activities/{group}/` and the Layer 1 note links to it.

---

## Prompt Editing Discipline

When iterating on a scheduled task's prompt via its activity note:

- Edit the KB note freely — treat it as the draft. As many iterations as needed.
- Do **not** call `update_scheduled_task` after every edit. The scheduled task is a release target, not a live editor.
- Only push accumulated changes to the scheduled task when the user signals readiness: _"push it"_, _"sync the task"_, _"ready to run"_, or equivalent.
- At the end of any session where prompt changes were made without a push, flag that the push is still pending.

Pushing every small edit wastes API calls, creates noisy scheduler state, and risks a half-baked prompt running if a schedule fires mid-iteration.

For the sync protocol between KB notes and scheduled task prompts, see [[Pillars/Knowledge Islands/Governance/KB Specifics/KB Specifics|KB Specifics]].

---

## Designing a New Activity

1. **Identify the layer** — is this truly a new activity (new Layer 1 note needed) or a new prompt variant of an existing one (Layer 5 only)?
2. **Check Knowledge Capital** — does island-specific config for this activity already exist, or does it need a new Layer 2 note?
3. **Check Agentic AI patterns** — does the activity need caching, parallel MCP calls, or a rolling window? Use existing Layer 3 patterns; don't re-derive them in the prompt.
4. **Write Layer 1 first** — document what and why before writing the prompt. If you can't articulate a clear outcome, the activity isn't ready to prompt yet.
5. **Write the prompt at Layer 5** — reference Layer 2 config by path; invoke Layer 3 patterns by name. Avoid duplicating logic that already exists at a higher layer.
6. **Create the scheduled task last** — only when the prompt is stable. The scheduled task is a deployment artefact, not a scratchpad.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Activities/Activities|Activities]] - the full activity index
- [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/AI Automation Patterns|AI Automation Patterns]] - Layer 3 patterns for activity design
- [[Pillars/Knowledge Islands/Governance/Agents/Claude/Claude|Agents/Claude]] - Layer 4: Claude-specific operating conventions
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Activities/Activities|Tools/Claude/Activities]] - Layer 5: the prompt library
- [[Pillars/Knowledge Capital/Knowledge Capital|Knowledge Capital]] - Layer 2: island configuration for activities
