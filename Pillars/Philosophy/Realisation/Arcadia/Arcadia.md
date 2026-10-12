---
note_type: pillars/index
updated: 2026-10-12T06:01:00Z
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
source: claude
status: current - June 2026
---

# Arcadia

## Overview

Arcadia is the Capital of the Knowledge Islands territory and the home of the model; its `Pillars/` zone is the [[Great Library of Arcadia]], named as the library of all libraries. The Knowledge Islands website (`apps-knowledgeislands.info`, at knowledgeislands.info) is the public publication for the framework. It makes selected knowledge from this base visible beyond the KB and also publishes the agentic harness and KI Specifications. The website is framework-level rather than Arcadia-territory-scoped; the canonical sources remain this KB for philosophy and model, `ki-agentic-harness` for reusable tooling, and `ki-specifications` for normative portable contracts.

## The publication principle

The website is an independently deployable publication, not a third source of truth. It vendors selected source material so it can build and operate autonomously, while retaining the canonical source for every published item.

The publication flows are:

```text
ki-principal -> ki-agentic-harness
ki-principal -> ki-specifications
ki-principal -> apps-knowledgeislands.info
ki-agentic-harness   -> ki-specifications
ki-agentic-harness   -> apps-knowledgeislands.info
ki-specifications    -> apps-knowledgeislands.info
```

The base informs the website directly for philosophy and model. The harness informs the website for practical tooling documentation. Arcadia and the harness also inform Specifications, whose normative contracts are published through the website. The website does not author canonical material for any source.

## Current state

The website currently contains its own curated public pages. It should acquire material through explicit, source-labelled vendor paths from this base, the harness, and Specifications. The intended pipeline is source note, guide, or specification -> curated vendor input -> website build. The vendor input is a deployable copy, never a replacement for its source.

## Great Library of Arcadia

[[Great Library of Arcadia]] closes Realisation by showing the model's Library made real: Arcadia's `Pillars/` zone, organised into the Philosophy, Aesthetics, Engineering Practice and Technē pillars. The name is Arcadia's own - any island may name its library or parts of it after buildings, artefacts or landscape - and it plays on the Great Library of Alexandria: as the home of the model, Arcadia's is the library of all libraries. The note explains why other islands treat it as a reference rather than a jurisdiction and how it grows only through the Enactment Process; the name changes nothing about knowledge-base structure.

## Related

- [[Tool Ecosystem Map]] - how the harness, MCPs, KB, and website interrelate as a system
- [[Realisation/Integrations/Integrations|Integrations]] - island-specific connection configuration
