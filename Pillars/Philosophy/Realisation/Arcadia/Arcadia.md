---
note_type: pillars/index
updated: 2026-10-11T12:00:00Z
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
source: claude
status: current - June 2026
---

# Arcadia

## Overview

Arcadia is the Capital of the Knowledge Islands territory and the home of the model; its [[Great Library of Arcadia]], the library of all libraries, is the idea that explains that role. The Knowledge Islands website (`ki-website`, at knowledgeislands.info) is the public publication for the framework. It makes selected knowledge from this base visible beyond the KB and also publishes the agentic harness and KI Specifications. The website is framework-level rather than Arcadia-territory-scoped; the canonical sources remain this KB for philosophy and model, `ki-agentic-harness` for reusable tooling, and `ki-specifications` for normative portable contracts.

## The publication principle

The website is an independently deployable publication, not a third source of truth. It vendors selected source material so it can build and operate autonomously, while retaining the canonical source for every published item.

The publication flows are:

```text
ki-arcadia-principal -> ki-agentic-harness
ki-arcadia-principal -> ki-specifications
ki-arcadia-principal -> ki-website
ki-agentic-harness   -> ki-specifications
ki-agentic-harness   -> ki-website
ki-specifications    -> ki-website
```

The base informs the website directly for philosophy and model. The harness informs the website for practical tooling documentation. Arcadia and the harness also inform Specifications, whose normative contracts are published through the website. The website does not author canonical material for any source.

## Current state

The website currently contains its own curated public pages. It should acquire material through explicit, source-labelled vendor paths from this base, the harness, and Specifications. The intended pipeline is source note, guide, or specification -> curated vendor input -> website build. The vendor input is a deployable copy, never a replacement for its source.

## Great Library of Arcadia

[[Great Library of Arcadia]] closes Realisation with the idea behind Arcadia's role. Where the model treats every island's library as a source of knowledge, Arcadia's is the library of all libraries - a deliberate play on the Great Library of Alexandria. It is a philosophical idea rather than a structure: it explains why Arcadia matters and why other islands treat it as a reference rather than a jurisdiction, without prescribing how any knowledge base is laid out.

## Related

- [[Tool Ecosystem Map]] - how the harness, MCPs, KB, and website interrelate as a system
- [[Realisation/Integrations/Integrations|Integrations]] - island-specific connection configuration
