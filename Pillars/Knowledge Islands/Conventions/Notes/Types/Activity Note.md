---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
  - topic/automation
status: current - April 2026
author: Written with Claude
---

# Activity Note

## Overview

Defines the delta from [[Notes]] for Layer 1 activity notes - notes that document what an island activity does and why. These live under `Activities/{group}/` and are agent-agnostic: they describe the activity, not the prompt or implementation.

For the five-layer model and how activity notes relate to the other four layers, see [[Authoring Activities]].

---

## Frontmatter

Required tags:

- `topic/automation`

Optional (add when relevant):

- `topic/ai` - for activities that run as AI agent sessions
- `topic/productivity` - for activities with direct productivity outcomes

---

## Structure

### Required sections

- **Overview** - one paragraph: what the activity does, why it exists, and how often it runs
- **Trigger** - for scheduled activities: schedule and Cowork task name. For conversational activities: trigger phrase(s) and who initiates
- **Outcome** - what a successful run produces: files written, state updated, output delivered

### Optional sections

- **Prompt** - the executable prompt, when the prompt lives here rather than in `Tools/Claude/Activities/{group}/`. Use for lightweight activities. For substantial prompts (Route Triage, Knowledge Rebuild), omit this section and link to the Layer 5 note instead
- **Known Limitations** - documented constraints on what the automation can and cannot do with current tooling

### Footer

`## Related Topics` must include:

1. The parent group index - `[[Activities/{group}/{group}|{group}]]`
2. `[[Pillars/Knowledge Islands/Activities/Activities|Activities]]` - grandparent index
3. The corresponding Layer 5 prompt note at `[[Tools/Claude/Activities/{group}/...]]`, once created
4. Any Knowledge Capital notes the activity reads (Layer 2 config)

---

## Prompt Section Convention

When the prompt is embedded here, it lives in a fenced code block with language hint `txt`:

````
## Prompt

```txt
You are running...
```
````

The KI note is the canonical source. The Cowork scheduled task is a deployment artefact - push to it only when the prompt is stable. See [[Authoring Activities]] § Prompt Editing Discipline for the sync protocol.

---

## Exceptions

- `## Contents` - never used; activity notes have no sub-notes
- `## Further Reading` - rarely used; prefer Related Topics

---

## Related Topics

- [[Pillars/Knowledge Islands/Conventions/Notes/Types/Types|Types]] - parent index
- [[Pillars/Knowledge Islands/Activities/Authoring Activities|Authoring Activities]] - five-layer model and activity design process
- [[Pillars/Knowledge Islands/Activities/Activities|Activities]] - index of all island activities
