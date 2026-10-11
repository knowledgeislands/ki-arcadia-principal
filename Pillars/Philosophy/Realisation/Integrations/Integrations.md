---
note_type: pillars/index
updated: 2026-10-11T01:47:00Z
tags:
  - card/note
  - topic/knowledge-islands
  - topic/tools
status: current - October 2026
author: Written with Claude
---

# Integrations

## Overview

An island's integrations record is the single declaration of the services it has connected - MCP tool prefixes, calendar sources, task managers, inbox paths and other service identifiers. Its governing principle is that activities read every tool identifier from this record at runtime and never embed one in a prompt. It bridges the portable tool documentation in [[Tools]], which describes what each tool does, and the specific services one island has actually connected. Arcadia's own record is [[Admin Conventions/Integrations|Admin Conventions/Integrations]].

---

## What the Record Holds

The record is a table with one row per purpose the island's activities need served - an inbox, a calendar, a task manager, an email account - naming the tool that serves it and the identifier activities use to reach it, such as an MCP tool prefix or a filesystem path. A purpose with no row has no integration, and an activity that depends on it cannot run. The record holds names and identifiers only; credentials and secret values belong in a proper secret store, never in the island.

---

## How Activities Use It

Activity prompts resolve platform-specific values from the integrations record rather than carrying them. When a service changes - a new tool prefix, a moved inbox, a replaced task manager - one edit to the record updates every activity that depends on it on its next run. This is what lets the same Activity definitions run unchanged on islands with different services.

The [[Realisation/Charter/Charter|Charter]] summarises which tools are connected; the integrations record says how to reach them. When the [[Model/Activities/Constitutional/Conformance|Conformance Check]] confirms that each adopted group has its required configuration, the integrations record is where the services part of that configuration is found.

---

## What Does Not Belong Here

The record covers the island's own runtime surface. Infrastructure that acts on the island's repositories without being part of that surface - such as GitHub Apps and other automated identities in a release chain - is recorded separately; Arcadia keeps it in [[GitHub Apps]]. Physical store locations are recorded in [[Physical Locations]], and routing rules in their own convention note.

---

## Arcadia's Integrations

Arcadia's integration surface is deliberately minimal, because it is a knowledge repository and framework custodian rather than an operational system. Its only configured integration is the `+/` inbox folder, reached through the filesystem, with `+/_Voice Notes/` excluded. It has no calendar, task, issue or email integration; the Email and Linear activity groups are vetoed in its Charter, so none is needed. New integrations are added to the record as they are introduced.
