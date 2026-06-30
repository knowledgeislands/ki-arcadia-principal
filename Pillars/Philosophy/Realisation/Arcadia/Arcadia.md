---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
source: claude
status: current - June 2026
---

# Arcadia

Arcadia is the public face of this Knowledge Islands island — the website that makes the island's knowledge visible beyond the KB itself. See [[Great Library of Arcadia]] for what the site hosts.

## The realisation principle

The website is a _realisation_ of arcadia-principal: the KB is the source of truth; the website renders and publishes that knowledge outward. Content should flow from KB notes to the website, not be authored directly in the site repository.

This mirrors the broader Knowledge Islands model: an island's knowledge capital lives in its KB; publications (websites, documents, reports) derive from it rather than standing alongside it as parallel sources.

## Current state

arcadia-website presently mirrors the agentic harness documentation (`docs/`) rather than KB content. The site's pages are maintained in `arcadia-agentic-harness` and copied into the website repository — a workable shortcut that predates the island having substantive KB content to publish.

This is known debt. The intended pipeline is: KB note → automated build step → arcadia-website page. When that pipeline exists, the harness docs mirror can be retired.

## Related

- [[Tool Ecosystem Map]] — how the harness, MCPs, KB, and website interrelate as a system
- [[Pillars/Philosophy/Realisation/Integrations|Integrations]] — island-specific connection configuration
