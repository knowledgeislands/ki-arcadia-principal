---
tags:
  - card/note
  - topic/ai
  - topic/productivity
  - topic/automation
  - topic/web-development
  - source/claude
status: current - April 2026
purpose: Reusable recipe for the Cowork "Valle Armonia Guides" artifact - a static tab-navigated viewer for the six living guide documents in the vallearmonia-website repository
author: Written with Claude
---

# Valle Armonia Guides Artifact

## Overview

A self-contained Cowork HTML artifact that renders the six living guides from the Valle Armonia website repository (`docs/guides/`) as a tab-navigated panel in the Cowork sidebar. Unlike connected-service artifacts, this one uses embedded content rather than runtime MCP tool calls - all guide text is read by Claude at update time and embedded as a JS data object in the HTML. The artifact persists across sessions and renders instantly with no external dependencies.

---

## What It Produces

- **Header** - dark-green branding bar ("Valle Armonia · Site Guides") with an "Updated DD MMM YYYY" timestamp on the right.
- **Tab navigation** - one tab per guide, sorted live guides first (alphabetically), then stubs alphabetically. Active tab is underlined in the brand green.
- **Live guide tab** - renders the Markdown content with an amber "Live" pill. Sections, tables, code blocks, blockquotes, bullet/ordered lists, and inline formatting are all rendered via a self-contained JS Markdown parser (no CDN).
- **Stub tab** - renders a "Content coming soon" notice in a dashed box, naming the change document that will fill it. Labelled with a green "Stub" pill.

---

## Key Design Decisions

- **Embedded content, not runtime tool calls.** The artifact cannot call `mcp__workspace__bash` - that is a Claude sandbox tool, not a user MCP connector, and is inaccessible from artifact JavaScript. Instead, all guide files are read by Claude in the Cowork session at update time and embedded as a `const RAW = { slug: "markdown string", … }` object directly in the HTML. The artifact is a static snapshot; to refresh, ask Claude to re-read the guide files and push an `mcp__cowork__update_artifact` call.
- **No CDN dependencies.** CDN scripts (including `cdnjs.cloudflare.com`) are blocked in the Cowork artifact iframe. The Markdown renderer is a self-contained ~100-line JS parser inlined in the script tag. No `<script src="">` for any library.
- **Inline Markdown renderer.** A two-pass parser: pass 1 splits the source into `code` and `line` blocks (preserving fenced code verbatim); pass 2 classifies lines into headings, horizontal rules, blockquotes, tables, lists, and paragraphs. Inline formatting (bold, italic, code, links) is applied last. H1 headings are suppressed - the guide title is shown as the `guide-title` element above the content. Pre/code blocks use a dark-green monospace style; tables have column alternation and header shading.
- **Live vs stub detection.** A guide is treated as a stub if its Markdown source matches `/Content to be added/i`. Live guides are sorted before stubs; within each group, alphabetical by slug.
- **`window.cowork.callMcpTool` is only for external connectors.** Slack, Linear, Calendar, and similar connected services work via this API. Workspace file tools do not - they are Claude's own sandbox tools, not user connectors. See [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/AI Automation Patterns|AI Automation Patterns]].
- **Light-mode, storage-free, inline.** `:root { color-scheme: light }`, warm off-white background (`#f8f7f4`), brand green (`#1F3D2B`) for headers and active tabs, amber-toned highlights for the "Live" pill. No `localStorage`. All CSS and JS inlined in a single file.

---

## Reusable Prompt

Paste this to rebuild or adapt the artifact:

```
Create a Cowork HTML artifact called "Valle Armonia Guides" (id: valle-armonia-guides) that:

- Reads the following files from the vallearmonia-website repo and embeds their content as a
  const RAW = { slug: "markdown string", … } in the HTML:
    - docs/guides/architecture.md        → slug: "architecture"
    - docs/guides/content-admin.md       → slug: "content-admin"
    - docs/guides/design-system.md       → slug: "design-system"
    - docs/guides/evolution.md           → slug: "evolution"
    - docs/guides/inspiration.md         → slug: "inspiration"
    - docs/guides/site-structure.md      → slug: "site-structure"
- Tab navigation: one tab per guide, live guides first (alphabetical), then stubs (alphabetical).
  A guide is a stub if its source matches /Content to be added/i.
- Render each guide using a self-contained inline Markdown parser - no CDN, no external scripts.
  Parser handles: fenced code blocks (verbatim), H2-H4 headings (suppress H1), HR, blockquotes,
  tables (with separator-row detection), unordered lists, ordered lists, inline bold/italic/code/links,
  and plain paragraphs. Pre/code blocks: dark-green monospace on #1a2e20.
- Status pills: "Live" (amber, #f0ead9 bg) for live guides, "Stub" (green, #f0f4f0 bg) for stubs.
- Stub tab body: dashed notice box with "Content coming soon" and the name of the change that will
  fill it (extracted from the "Filled in by:" blockquote in the Markdown source).
- Header: dark-green bar (#1F3D2B), "Valle Armonia · Site Guides", "Updated DD MMM YYYY" on the right.
- Light-mode only; no localStorage; all CSS/JS inlined.
- Embed the comment <!-- Recipe: Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Valle Armonia Guides Artifact.md --> as the first line of the <head>; preserve it through regeneration or patch.
```

To rebuild after guides change, say: "Update the Valle Armonia Guides artifact" - Claude reads the current guide files and calls `mcp__cowork__update_artifact` with the fresh embedded content.

---

## Updating

The artifact has no runtime data fetching - content is frozen at the time of the last update. To refresh it:

1. **Regenerate** - ask Claude to re-read all six guide files from `vallearmonia-website/docs/guides/` and call `mcp__cowork__update_artifact` with `id: valle-armonia-guides` and the new HTML. The `const RAW` object is replaced wholesale. Update the "Updated DD MMM YYYY" timestamp in the header.
2. **Patch a single guide** - ask Claude to read the changed guide file and patch just its entry in the `const RAW` object, then push `mcp__cowork__update_artifact`.

Common in-place changes:

- **Add a new guide** - add the file path and a new slug to `const RAW`, and extend the `TAB` display-name map.
- **Rename a tab label** - update the entry in the `TAB` constant (e.g. `'architecture':'Architecture'`).
- **Adjust live/stub detection** - change the regex in `parseGuide` (currently `/Content to be added/i`).
- **Reskin colours** - the brand green is `#1F3D2B` throughout; the amber pill background is `#f0ead9`.

Verify: open the artifact, confirm the Architecture tab renders the full guide with the Knowledge Islands diagram visible in a code block, tables display with column shading, and stub tabs show the "Content coming soon" notice. Then apply **Recipe Self-Synchronisation** - update this note if the artifact structure changed materially.

---

## Potential Enhancements

Ordered roughly by effort - practical first, creative last.

- **Diagnostics footer** - generated-at timestamp and a count of live vs stub guides, to confirm the last update date and spot a missed re-embed at a glance.
- **In-artifact refresh button** - a "Refresh" control that calls `sendPrompt('Update the Valle Armonia Guides artifact')` to trigger a re-embed from the sidebar without switching to the chat pane.
- **Search across guides** - a text input that filters the rendered content across all tabs, highlighting matching passages.
- **Change-status badge per guide** - pull the `status:` frontmatter field from each guide file and surface it as a second pill alongside Live/Stub.
- **Linked cross-references** - detect `[[wikilinks]]` in the guide Markdown and render them as in-artifact navigation (click to switch tab) rather than broken links.
- **Print/export view** - a "Print all guides" button that renders all tabs sequentially as a single-page document for offline reference.
- **Auto-update on file change** - a scheduled Cowork task that detects changes to `docs/guides/` via a git diff check and prompts for an artifact re-embed.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Tools/Claude/Live Artifacts/Live Artifacts|Live Artifacts]] - parent index
- [[Pillars/Knowledge Islands/Governance/Agents/Agentic AI/AI Automation Patterns|AI Automation Patterns]] - general patterns for recurring AI automations; see Live Artifact Baseline
