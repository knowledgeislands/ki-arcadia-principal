---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
  - topic/automation
status: draft - April 2026
author: Written with Claude
---

# Activity Note

## Overview

Defines the delta from [[Notes]] for activity notes - notes that document what an island activity does and why. These live under `Activities/{group}/` and are agent-agnostic: they describe the activity, not the prompt or implementation.

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
- **Trigger** - for scheduled activities: schedule and task name. For conversational activities: trigger phrase(s) and who initiates
- **Outcome** - what a successful run produces: files written, state updated, output delivered

### Optional sections

- **Prompt** - the executable prompt, when it lives here rather than in a separate Prompt note. Use for lightweight activities; for substantial prompts, omit this section and link to the prompt note instead
- **Known Limitations** - documented constraints on what the automation can and cannot do with current tooling

---

## Prompt Section Convention

When the prompt is embedded here, it lives in a fenced code block with language hint `txt`:

````
## Prompt

```txt
You are running...
```
````

The island note is the canonical source. The scheduled task is a deployment artefact - push to it only when the prompt is stable.
