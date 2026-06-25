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

Whilst activites can be pretty straightforward, designing and maintaining a coherent system of activities across multiple islands and agents
is complex. This note is the framework for that system - it defines the layers that structure where different types of information live, the
format for activity notes, the discipline for iterating on scheduled task prompts, and the contract for adoptable activity groups.

---

## Content Layers

Every activity is designed in consideration of four distinct layers, each at a different level of generality. The full picture of an
activity's design is the combination of all layers; the layers themselves are modular and reusable.

The layers are `Definition`, `Configuration`, `Behaviour`, and `Script`. Each layer has a specific purpose. Activities have canonical
locations in the repository based on the combination of its specificity for activity, agent, and island.

Notes considered are at:

- `/Pillars/Philosophy/Model/Activities/{activity-group-name}/{activity-name}`
- `/Pillars/Philosophy/Model/Agents/{agent-name}/{activity-group-name}/{activity-name}`
- `/Pillars/Knowledge Capital/Model/Activities/{activity-group-name}/{activity-name}`
- `/Pillars/Knowledge Capital/Model/Agents/{agent-name}/{activity-group-name}/{activity-name}`

The rule is: **design is split across layers such that the scope of each element in the design lives at the most generic layer that provides
the widest applicability whilst accurately describing them**.

The layer types are:

- **Definition** - what the agent needs to know about the activity, such as what it does, why it exists, the goals, and how to know if it's
  done
- **Configuration** - what the agent performing the activity needs to know for it to be done
- **Behaviour** - what are the expected behaviours of the agent when performing the activity - language, caching, parallelism, rolling
  windows, artefact lifecycle
- **Script** - a structured understanding of the steps the agent should take when doing the activity taking into account all the earlier
  layers

Where multiple layers would be at the same location, they are combined in the note and grouped under the layer heading.

The following are reserved names.

- For the activity group, `All` maps to all activity groups; it cannot be used for a specific activity group
- For the activity name, `All` maps to all activities; it cannot be used for a specific activity
- For the agent name, `All` maps to all agents; it cannot be used for a specific agent

Note to Reviewer: can we make this self referencing and effectively this is the `/Pillars/Philosophy/Model/Activities/All/All/All.md` note?

### Examples

#### Universal Groups

This would be some definition that applies to all activities, for example, adding a definition of additional reserved names that have
special meaning in the framework, such as `Human` and `Agentic AI` for agent names

For example:

- For the agent name, `Human` maps to all human agents; it cannot be used for a specific agent. Human agents tag themselves with
  `agent:human` in their Agent note frontmatter to be included in this group.
- For the agent name, `Agentic AI` maps to all agentic AI agents; it cannot be used for a specific agent. Agentic AI agents tag themselves
  with `agent:agentic` in their Agent note frontmatter to be included in this group.

This would be in a Definition section in a note located at `/Pillars/Philosophy/Model/Activities/All/All/All.md`, and would be inherited by
all agents and all activities on all islands. As such it should be used sparingly and only for truly universal behaviours.

#### Universal Behaviours

This would be some behaviour or pattern that applies to all activities.

For example:

> at the end of any activity, provide a digest of what was done and why, and link it back to confirmation of the goals

This would be in a Behaviour section in a note located at `/Pillars/Philosophy/Model/Activities/All/All/All.md`, and would be inherited by
all agents and all activities on all islands. As such it should be used sparingly and only for truly universal behaviours.

#### Island Wide Specific Behaviours

This would be some behaviour or pattern that applies to all activities for a specific island.

For example:

> at the end of any activity, ensure that any outputs contain the company name and the date, to ensure traceability and context for future
> reference

This would be in a Behaviour section in a note located at `/Pillars/Knowledge Capital/Model/Activities/All/All/All.md`, and would be
inherited by all agents and all activities on all islands. As such it should be used sparingly and only for truly universal behaviours.

#### Abstract Activities

This would be an activity that is shared across multiple islands, but the details of how to do it are island-specific.

For example:

> Email Route Triage is the activity of triaging email from a location on a schedule and deciding on a recommended action based on criteria.
>
> Required Configuration:
>
> - the location to check for email
> - the schedule for when to check it
> - the criteria for triage decisions

#### Definitive Activities

### Behaviour

- **Location:** `/Pillars/Philosophy/Model/Agents/Agentic AI/` or ``/Pillars/Philosophy/Model/Agents/{Agent}/`
- **Generality:** Activity-independent, island-independent, agent-independent
- **Contains:** General AI operating patterns - caching, parallelism, rolling windows, artefact lifecycle
- **Generality:** Activity-independent, island-independent, Agent-specific
- **Contains:** Claude's implementation - five modes, behavioural constraints, memory architecture
- **Rule of thumb:** Content that applies to Claude doing any activity on any island.

### Script

- **Location:** `/Pillars/Knowledge Capital/Model/Activities/{group}/`
- **Generality:** Activity-specific, island-specific, Agent-specific
- **Contains:** The actual prompt text; references the other layers at runtime
- **Rule of thumb:** Content that is "how an agent does it for this island".

Note: in the case of an island-specific, agent-specific activity, the Definition, Configuration and Script are in the same island-specific
note.

### The Lattice

The three generality axes - activity, island, agent - form a 2x2x2 lattice with eight corners. The five layers populate five of those
corners; the remaining three are empty by design.

| Generality                      | Activity-specific | Activity-agnostic   |
| ------------------------------- | ----------------- | ------------------- |
| island-agnostic, agent-agnostic | **Definition**    | **Pattern**         |
| island-specific, agent-agnostic | **Configuration** | —                   |
| island-agnostic, agent-specific | —                 | **Agent Behaviour** |
| island-specific, agent-specific | **Script**        | —                   |

The empty corners are informative. There is no "Agent-specific definition of an activity" because activity definitions are agent-agnostic by
construction; if an agent needs to do it differently from another agent, that lives in the Script. There is no "island-specific generic
agentic pattern" because patterns are by definition portable across islands; an island that needs to bend a pattern records the exception in
its Configuration. There is no "island-specific Agent behaviour without an activity" because an agent's island-specific behaviour is always
in service of an activity, and therefore lives in the Script.

---

## Constitutional and Adoptable Groups

Activity groups divide into two categories that are treated differently throughout this guide.

**Constitutional groups** are prior to the adoption framework - they define what it means to be a Knowledge Island and cannot be vetoed.
Currently there is one constitutional group: [[Model/Activities/Constitutional/Constitutional|Constitutional]], which contains the
Conformance Check. Constitutional group indexes do not carry an Adoption Requirements section.

**Adoptable groups** are everything else. Each island takes an explicit `adopted` or `vetoed` position on each adoptable group; absence of a
position is non-conformant. Every adoptable group index note must carry an Adoption Requirements section (see below) that declares exactly
what Knowledge Capital notes an island must create to adopt or veto the group. This makes the adoption contract explicit and
machine-verifiable by the Conformance Check.

---

## Adoption Requirements

Every adoptable group index note must include an Adoption Requirements section. It is the adoption contract - the machine-readable
declaration of what KC notes the Conformance Check will verify.

**Format:** A short framing sentence, then a table with three columns: Note (a short label), Path (the canonical KC path, relative to the
repository root, no `.md` extension), and Purpose (one-sentence description of what the note contains and why it is needed). Follow the
table with a note for the veto case: what stub an island must create if it vetoes the group.

**Placement:** At the end of the note, separated by `---`.

**What to include:** List every KC note the group's activities read at runtime. Notes shared across groups (e.g.
`Knowledge Capital/Activities/Schedule`) should still be listed in each group that requires them - the Conformance Check verifies each
group's requirements independently.

**Veto stubs:** A vetoed group must have a KC index stub at its group path acknowledging the veto. If the group has additional required
notes, each needs a corresponding N/A stub. State this explicitly in the adoption requirements text.

---

## Activity Note Format (Definition)

The canonical format for Definition notes is defined in [[Activity Note]] under `Conventions/Notes/Types/`. Required sections are Overview,
Trigger, and Outcome. The optional `## Script` section holds the executable prompt when the activity is lightweight enough to keep it
inline - for substantial prompts (Route Triage, Knowledge Rebuild), the prompt migrates to `Tools/Claude/Activities/{group}/` and the
Definition note links to it.

---

## Designing a New Activity

1. **Identify the layer** - is this truly a new activity (new Definition note needed) or a new variant of an existing one (Script only)?
2. **Check Knowledge Capital** - does island-specific Configuration for this activity already exist, or does it need a new Configuration
   note?
3. **Check Agentic AI patterns** - does the activity need caching, parallel MCP calls, or a rolling window? Use existing Patterns; don't
   re-derive them in the prompt.
4. **Write the Definition first** - document what and why before writing the prompt. If you can't articulate a clear outcome, the activity
   isn't ready to prompt yet.
5. **Write the Script** - reference Configuration by path; invoke Patterns by name. Avoid duplicating logic that already exists at a higher
   layer.
6. **Create the scheduled task last** - only when the prompt is stable. The scheduled task is a deployment artefact, not a scratchpad.
