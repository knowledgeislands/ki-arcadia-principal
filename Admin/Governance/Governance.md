---
note_type: admin/index
updated: 2026-10-11T01:41:00Z
tags:
  - card/note
  - topic/knowledge-islands
status: current - June 2026
author: Written with Claude
---

# Governance

## Overview

The `Admin/Governance/` arm holds the artefacts that define **what the island is and how it must be structured** - the Charter, the territory inventory, conventions, policies, templates and Decision Records. These are things that must be true for the island to be what it is; they do not describe day-to-day operations, which live in [[Admin/Operations/Operations|Operations]]. Arcadia is the Capital of the Knowledge Islands territory, so several notes here carry territorial as well as island authority. The Charter and Known Lands were populated by migration from Knowledge Capital per [[Admin/Governance/Decisions/GDR-KI-ARCADIA-002-admin-zone-governance-and-operations|GDR-KI-ARCADIA-002]].

## Charter

The [[Admin/Governance/Charter|Charter]] is the authoritative declaration of what Arcadia is and what it has adopted. Its static Identity section fixes the territory name, the Capital, the canonical repository and the prefixes that automations and skill prompts read instead of hardcoding. Its operational sections record the adoption position on every activity group, and the Conformance Check uses it as its source of truth.

## Conformance

[[Admin/Governance/Conformance|Conformance]] names the Knowledge Islands standards Arcadia follows, as declared in `.ki.toml`: repository, authoring, engineering, Knowledge Base, Streams, activity, live-artifact, principal, decision-record, tokenomics and Git. Mechanical conformance to those declarations is checked with `ki repo audit --repo .`. It also records that judgmental changes to canonical knowledge still require the Enactment Process.

## Conventions

[[Admin/Governance/Conventions/Conventions|Conventions]] holds Arcadia's island-specific vocabulary, authoring decisions and routing rules, layered on top of the portable framework in the Knowledge Islands model. It carries general conventions that apply across all zones - the Glossary, Communication Style, local Authoring decisions and the Canonical Meta Notes list - and one sub-folder of conventions per zone.

## Decisions

[[Admin/Governance/Decisions/Decisions|Decisions]] is the index of Arcadia's Decision Records, typed by `decision_type` and numbered per prefix within the `KI-ARCADIA` scope. Each record is a living present-state account of a significant structural choice, adopted instrument or cross-repository commitment. The index orders the records in reveal order and lists separately the engineering decisions Arcadia maintains for Techné.

## Known Lands

[[Known Lands]] is the Capital's governed inventory of the territory and its signposting of external lands. It lists the canonical KI repository identities - Arcadia and its member islands - with each one's role and owned concern, in agreement with the roster in `.ki.toml`. External entries describe relationships to independent authorities without claiming jurisdiction over them.

## Note Templates

[[Admin/Governance/Note Templates/Note Templates|Note Templates]] is reserved for canonical templates of the structured note types used across Arcadia, defining their expected frontmatter, headings and sections. No templates have yet been formalised here; the Obsidian templates in the portable model currently serve that purpose.

## Policies

[[Admin/Governance/Policies/Policies|Policies]] holds persistent operating constraints under Arcadia's governance. Its principal policy is the [[Techne Programme Hold]], which restricts remote agent execution and remote-environment management across the Techné products, together with a diagram of how the hold's single agent-host exemption is used. A policy's presence does not replace its owner's approval; substantive changes follow the Enactment Process.
