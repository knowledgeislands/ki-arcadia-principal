---
type: stream-proposal
tags:
  - topic/knowledge-islands
  - topic/governance
status: in-progress
priority: high
dependencies: []
author: Written with Codex
---

# Ecosystem Alignment Proposal

## Overview

The Knowledge Islands ecosystem operates through three related repositories: the Arcadia Principal knowledge base, the KI Agentic Harness, and the KI Website. Their individual roles are already partly documented, but they need one consistent account of authority, publication, bootstrap governance, and installer ownership.

## Governance

This stream follows the [[Pillars/Philosophy/Model/Processes/Enactment Process/Enactment Process|Enactment Process]]. The council has approved the direction: the base informs both the harness and website, and the harness also informs the website.

## Outputs

| Type                   | Detail                                                                                                         |
| ---------------------- | -------------------------------------------------------------------------------------------------------------- |
| Governance decision    | Shared GDR-KI-ECOSYSTEM-002 records the three-repository authority and publication model.                      |
| Base knowledge         | Update Arcadia's repository decision and realisation notes to describe the directed triangle.                  |
| Repository orientation | Add a tailored ecosystem section to the README of each repository.                                             |
| Working convention     | Add the same progress-update and verified-unit commit convention to each repository's AGENTS.md.               |
| Work choreography      | Add an explicit cross-repository handoff convention for Streams and project roadmaps.                          |
| Publication            | Add a KI Website harness landing page and navigation entry.                                                    |
| Installer route        | Publish `https://knowledgeislands.info/harness/install` as an edge redirect to the harness bootstrap artifact. |

## Checklist

- [x] Agree the authority model: base -> harness, base -> website, harness -> website.
- [x] Record the shared ecosystem decision in Arcadia.
- [ ] Record the shared ecosystem decision and Decision Records adoption in the harness and website.
- [ ] Add mutually reinforcing README orientation in all three repositories.
- [ ] Add the shared progress-update and verified-unit commit convention in all three repositories.
- [ ] Add the cross-repository choreography convention in all three repositories.
- [ ] Add the website harness landing page, navigation, and installer redirect.
- [ ] Run the relevant audit gates after the harness's bootstrap changes are settled.

## Decision

The Knowledge Islands website vendors source-labelled material from Arcadia Principal and the KI Agentic Harness so that it can deploy independently. Canonical ownership remains in the source repository. The stable public bootstrap address is `https://knowledgeislands.info/harness/install`; it redirects to the harness-owned bootstrap script.

Each repository owns its own prioritisation and execution. A repository may add a concrete handoff to another repository's Stream or roadmap, recording the origin and whether it blocks or is blocked by the recipient item. The preferred form is non-blocking, independently executable work; a blocking relationship is reserved for an actual prerequisite.
