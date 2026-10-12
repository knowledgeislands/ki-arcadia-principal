---
note_type: admin/governance/decision
id: GDR-KI-PRINCIPAL-008
title: 'Capital Naming'
date: 2026-10-12
updated: 2026-10-12
status: current
decision_type: governance
decision_type_url: https://knowledgeislands.info/specifications/decision-records/gdr
---

# GDR-KI-PRINCIPAL-008: Capital Naming

## Context

Each territory has one Capital, the principal Knowledge Base that governs the territory. Capitals carried unrelated names and repository codes, so a Capital's name did not say which territory it governs and its code did not group with the territory's other repositories. The Knowledge Islands Capital was named Arcadia Principal.

On 2026-10-12 Kris instructed, as part of the estate reshape, that the Knowledge Islands Capital be renamed and that every Capital follow one naming form.

## Decision

The Knowledge Islands Capital is **Knowledge Islands Principal**, with canonical repository `knowledgeislands/ki-principal` and repository code `KI-PRINCIPAL`. It was formerly Arcadia Principal, with repository `knowledgeislands/ki-arcadia-principal` and code `KI-ARCADIA`.

Every Capital is named `<territory> Principal`, using the territory's name, and takes the repository code `<ALIAS>-PRINCIPAL`, using the territory's alias in upper case. For example, the Equal Remedy Capital is Equal Remedy Principal with code `ER-PRINCIPAL`, and the Legal Capital is Legal Principal with code `LGL-PRINCIPAL`.

## Consequences

- A Capital's title and code identify its territory without a lookup.
- A Capital's records and Decision Records take its `<ALIAS>-PRINCIPAL` code as their scope, so they group with the territory's alias.
- A new territory's Capital is named and coded by this form when it is created.
