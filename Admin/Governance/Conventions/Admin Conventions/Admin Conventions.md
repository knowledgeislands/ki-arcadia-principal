---
note_type: admin/governance/convention
updated: 2026-10-11T01:41:00Z
tags:
  - card/note
  - topic/knowledge-islands
status: current - June 2026
author: Written with Claude
---

# Admin Conventions

## Overview

Conventions specific to the `Admin/` zone - the configuration, routing and physical context for how Arcadia operates. Activity prompts and agents read these notes at runtime to resolve where content belongs, which tools are connected and where the island's stores live, rather than hardcoding those values. Credential names and custody may be recorded here; secret values never are.

## GitHub Apps

[[GitHub Apps]] records the GitHub Apps and automated identities acting on repositories in the `knowledgeislands` organisation, such as `ki-tools-release-bot` and its tool release chain. For each identity it records purpose, permissions, installation scope, credential names and who holds and rotates the keys. These are estate infrastructure rather than Arcadia integrations, so a change to any of them is a deliberate, visible act.

## Integrations

[[Admin Conventions/Integrations|Integrations]] lists the external tools connected to Arcadia and the identifiers activity prompts use to reach them. Arcadia's integration surface is deliberately minimal: its only configured tool is the `+/` inbox folder, with no calendar, task, issue or email integration. New integrations are added here as they are introduced, so that one edit updates every prompt that depends on them.

## Physical Locations

[[Physical Locations]] records where the island physically lives: a working folder for temporary files, the Git text store holding the Markdown notes, and a binary store that is not yet defined. The text and binary stores are meant to mirror one folder structure; the working folder has no structure requirement.

## Routing Rules

[[Routing Rules]] supplements the general routing in [[Structure]] with rules specific to Arcadia. Its central distinction separates the portable model in `Pillars/Philosophy/` from Arcadia's own governance in `Admin/Governance/` and its running in `Admin/Operations/`, each with a key question that decides where a note belongs. It lists the common routing decisions as worked examples.
