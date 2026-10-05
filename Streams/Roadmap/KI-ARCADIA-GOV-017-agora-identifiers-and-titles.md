---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-017
area: GOV
title: Agora identifiers and titles
theme: governance
horizon: triage
status: draft
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-05T23:47:54Z
updated_at: 2026-10-05T23:47:54Z
---

# Agora Identifiers and Titles

## Goal

Separate an Agora's stable identifier from its readable title, so callers use one consistent identifier for context and acquisition folders while showing the owner-declared title to people.

## Context

The owner requested this work on 6 October 2026 while aligning the ChatGPT capture surface in Kit Principal. That surface serves conversations through one repository, with small local context summaries for several Agoras. Its context folder names were readable titles while some acquisition folders used repository names or different slugs.

The agreed local convention is to use the existing Agora identifier for both `-/_CONTEXT/chatgpt/<agora-id>/` and `+/_ACQUIRE/chatgpt/<agora-id>/`, retaining readable headings such as Personal and Legal. Agora identifiers remain unchanged. The owner also requested a declared Agora title matching the context heading; that shared-contract work is captured here rather than implemented during the local folder correction.

## Boundary

- Define identifier and title as separate owner-declared meanings; keep purpose as the explanation of the group.
- Govern the portable Agora contract and the expectations for CLI validation, resolution and presentation.
- Coordinate later delivery in the KI Agentic Harness and tools-ki, followed by explicitly scoped owner-declaration and consumer updates.
- Preserve existing identifiers, memberships, inclusions, repository identities and authority boundaries. A title grants no access, exchange or capture permission.
- Do not implement the shared schema, rename Agoras, activate cross-repository capture, publish changes or select this work through intake alone.

## Current state

Agora child-table names already provide stable, globally unique lower-case identifiers. The declaration currently accepts `purpose`, `members` and optional `includes`; a `title` key is rejected. CLI profiles expose an identifier and a name, but no separately declared owner title. Kit Principal's local context and capture folders have been aligned with existing Agora identifiers without changing this contract.

Related work remains distinct: [[KI-ARCADIA-ECO-006-simplify-ecosystem-agora-declarations|ECO-006]] concerns the existing ecosystem membership declaration; [[KI-ARCADIA-GOV-016-territorial-classification-and-exchange|GOV-016]] owns territorial classification and exchange authority. This item adds readable Agora identity metadata and its consumer convention.

## Discussion

### Identifier, title and purpose

The identifier is the stable machine key used in declarations, lookups and folder paths. The title is a non-empty readable label declared by the Agora owner and mirrored by context headings. A title change does not rename the identifier or move captured material. Purpose continues to describe why the working set exists. Repository identity and territorial authority remain separate from Agora identity.

### Compatibility and delivery questions

Plan whether title is initially optional with an identifier fallback for older declarations, or required with an explicitly approved migration. Specify how the CLI presents identifier and title in human and structured output, without silently changing existing machine keys. Define how derived context headings are refreshed when an owner changes its title; capture should preserve the identifier and the title observed at capture time.

The shared skill and its checks belong to the KI Agentic Harness; the native declaration parser, resolution and presentation belong to tools-ki. Each receiving repository owns its eventual delivery and acceptance. This draft records the owner's requested outcome and does not schedule those implementations.
