---
tags:
  - card/note
  - topic/ai
  - topic/productivity
  - topic/automation
  - source/claude
status: current - April 2026
purpose: Index and convention reference for all Cowork live-artifact HTML pages - each artifact is represented by a recipe note and a colocated HTML backup
author: Written with Claude
---

# Live Artifacts

## Overview

This folder is the canonical home for all Cowork live artifacts - self-contained HTML pages that persist in the Cowork sidebar, survive across sessions, and re-fetch data from connected MCP tools each time they're opened. For each artifact, two sibling files live here: an `<Artifact Name> Artifact.md` recipe note documenting the design decisions, reusable prompt, and adaptation points; and an `<Artifact Name>.html` backup of the most recently approved version of the artifact HTML. The recipe note is the documentation; the `.html` is the recoverable copy.

---

## Colocation Convention

Each live artifact is represented by a pair of sibling files:

- `<Artifact Name> Artifact.md` - the recipe note: overview, what it produces, key design decisions, reusable prompt, updating instructions, and potential enhancements.
- `<Artifact Name>.html` - a backup of the approved artifact HTML. Written after every `update_artifact` approval. Provides a recoverable copy if the Cowork artifact store is cleared, and a diffable history if this folder is version-controlled.

**The update sequence for any live artifact change:**

1. Call `mcp__cowork__update_artifact` with the revised HTML - get it approved.
2. Write the HTML backup: read the artifact from its path on disk and write it to `<Artifact Name>.html` in this folder. The recipe note's `## Updating` section specifies the exact paths.
3. Update the recipe note with whatever changed - use the `hnrkb` skill in UPDATE mode, read first and merge in.

Do not skip step 2. The vault backup should always reflect the currently deployed version.

---

## Contents

- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Week at a Glance Artifact|Week at a Glance Artifact]] - rolling next-7-days multi-calendar overview with per-day summaries
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Slack Digest Artifact|Slack Digest Artifact]] - last 24 hours of channel conversations (discovered by name prefix) and DMs, with a 2-3 sentence per-channel summary and one-liner DMs
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Linear Open Issues Tracker Artifact|Linear Open Issues Tracker Artifact]] - workspace-wide open-issues view grouped by project and priority
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Email Pulse Artifact|Email Pulse Artifact]] - live, read-only companion to [[Email Status|Email Status]], with an optional per-folder message drill-down
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Valle Armonia Guides Artifact|Valle Armonia Guides Artifact]] - static tab-navigated viewer for the six living guides in the vallearmonia-website repo; content embedded at update time, no runtime tool calls

---

## Capturing a New Recipe

Paste the following into any live-artifact conversation to write a recipe note and initial HTML backup back to this folder. It leans on the `hnrkb` skill and the canonical shape of [[Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Week at a Glance Artifact|Week at a Glance Artifact]], so it produces a sibling note without re-specifying the whole format each time.

```markdown
Save this artifact as a recipe note in my HNR island.

Use the hnrkb skill in SAVE mode. If the HNR KB folder isn't mounted in this session, call `request_cowork_directory` first; the host path is `~/obsidian/vaults/hnr-knowledge-base`.

Recipe note path: `Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/<Artifact Name> Artifact.md`

Reference note with the canonical shape: [[Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Week at a Glance Artifact|Week at a Glance Artifact]] - follow its structure exactly.

Required sections, in this order:

1. `## Overview` - one paragraph: what the artifact produces, where it lives (Cowork sidebar), and that it re-fetches on open via `window.cowork.callMcpTool`.
2. `## What It Produces` - bullets describing the user-visible output (layout, per-section content, footer), not the code.
3. `## Key Design Decisions` - bullets with bold lead-ins. Cover any that apply: rolling/dynamic vs fixed inputs, parallel vs serial MCP calls, what gets suppressed or de-emphasised, deterministic vs `sample()`-driven synthesis, light-mode styling, no browser storage. Omit the rest.
4. `## Reusable Prompt` - a fenced code block with a paste-ready prompt that would rebuild the artifact from scratch, followed by a one-liner trigger + clarification answers if the artifact has one.
5. `## Updating` - four parts: (a) the two mechanics (regenerate via `mcp__cowork__create_artifact` with the same `id`; patch via `mcp__cowork__update_artifact`); (b) common in-place edits naming the specific constants/arrays to change; (c) a verification checklist; (d) the colocation backup step - after every approved `update_artifact`, read the artifact HTML from disk and write it to `<Artifact Name>.html` in this folder.
6. `## Potential Enhancements` - 5-9 ideas, ordered practical → creative, each with a bold name and a one-sentence description of the value.
7. `## Related Topics` - wikilinks to `[[Live Artifacts]]` as parent, plus any domain-relevant notes.

Frontmatter: standard HNR KB YAML properties (`status`, `purpose`, `author: Written with Claude`). Tags must include `card/note`, `topic/ai`, `topic/productivity`, `topic/automation`, `source/claude`, plus one or two domain tags that fit the artifact's subject.

After writing the recipe note, also write the current artifact HTML to `Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/<Artifact Name>.html` as the initial colocation backup.

Then add a bullet for the new artifact to the parent index at `Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Live Artifacts.md`.

Embed the comment

  <!-- Recipe: Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/<Artifact Name> Artifact.md -->

as the first line of the artifact's <head>; preserve it through any regeneration or patch.

Tone: British English throughout. Structured and direct. No emojis. Use backticks for identifiers, tool names, and constants. Confirm the draft with me before writing.
```

Notes:

- If the other conversation has lost track of what its artifact does (e.g. context has since been trimmed), ask it to re-open the artifact from the sidebar and re-inspect before drafting - otherwise the recipe will be generic.
- Once three or four recipes are collected, skim the set together to factor any recurring cross-cutting patterns into [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/AI Automation Patterns|AI Automation Patterns]] rather than repeating them in each recipe.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Claude|Claude]] - parent index
- [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/AI Automation Patterns|AI Automation Patterns]] - general patterns for recurring AI automations
- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Cowork Configuration Layers|Cowork Configuration Layers]] - where Cowork preferences and rules live
