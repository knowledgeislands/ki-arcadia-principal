---
note_type: admin/governance/convention
updated: 2026-10-11T01:41:00Z
tags:
  - card/note
  - topic/knowledge-islands
status: current - June 2026
author: Written with Claude
---

# Conventions

## Overview

Arcadia's island-specific conventions - the vocabulary, authoring decisions and routing rules that supplement the portable Knowledge Islands framework in [[Model/Conventions/Conventions|Conventions]]. Four notes apply across every zone; two sub-folders hold conventions specific to a single zone. Conventions for the `Pillars/` zone - how notes are structured, named and organised within each pillar - have not been formalised beyond the portable model; they gain a sub-folder here when they are. Activity prompts and agents read these notes at runtime rather than hardcoding the values they record, so a change here takes effect on the next run.

## Admin Conventions

[[Admin Conventions/Admin Conventions|Admin Conventions]] covers configuration and context for how Arcadia operates. It holds the island's routing rules across Pillars, Governance and Operations, its integrations, the GitHub Apps and automated identities acting on the organisation's repositories, and its physical store locations. Activity prompts resolve tool prefixes, inbox paths and service identifiers from here.

## Authoring

[[Authoring]] records Arcadia's local authoring decisions on top of the generic [[Authoring Guidelines]]. None are currently recorded: Arcadia follows the framework as written. The note explains what would qualify as a local decision and where more specific choices belong instead.

## Canonical Meta Notes

[[Canonical Meta Notes]] is the ordered list of notes that [[Model/Activities/Tending/Knowledge Rebuild|Knowledge Rebuild]] loads to reconstruct the island's operational context. It names the root instructions, the Charter, the core model and convention notes, and the operational register in the order a rebuild should read them.

## Communication Style

[[Communication Style]] gives agents a reference for the owner's voice, rhythm and habits across different writing contexts. Its aim is alignment rather than impersonation: responses should read as consistent with how the owner thinks and writes, not as generic AI register. It covers voice and tone, sentence rhythm and the habits that distinguish one writing context from another.

## Glossary

[[Glossary]] is the decoder ring for Knowledge Islands terminology - islands, archipelagos, territories, Capitals, councils, custodians, Known Lands and the other structural terms used across Arcadia and the wider territory. Footnotes carry the distinctions that matter, such as the difference between an archipelago and a territory. It is the first place to resolve an unfamiliar term.

## Streams Conventions

[[Streams Conventions/Streams Conventions|Streams Conventions]] records how Arcadia applies the shared Streams model. It states that `Streams/Roadmap/` holds flat finite work records whose horizon and lifecycle are frontmatter metadata, that every roadmap write happens in the primary checkout, and how identifiers are reserved. It also names the skills that own the container, Activity definitions and record lifecycle.
