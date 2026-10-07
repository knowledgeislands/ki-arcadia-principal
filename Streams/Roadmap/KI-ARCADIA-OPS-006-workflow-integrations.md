---
note_type: stream-roadmap
id: KI-ARCADIA-OPS-006
area: OPS
title: Workflow integrations
kind: investigate
purpose: learning
project: island-model-and-tending
component: resources
tags:
  - topic/knowledge-islands
  - topic/automation
status: ready
priority: low
horizon: now
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-04-28T18:32:31Z
updated_at: 2026-10-07T14:08:03Z
author: Written with Claude
---

# Workflow Integrations Proposal

## Goal

Arcadia holds a short, evidence-based reference for n8n and Node-RED and a recorded fit judgement against the current Cowork scheduled-task stack, so the question "should we add a workflow automation layer?" has a written answer instead of an open idea.

---

## Context

The record was captured in April 2026 as two investigation ideas: n8n as a workflow automation layer, and Node-RED as a flow-based tool for wiring integrations and event-driven island automation. Nothing has been trialled. Each was flagged as needing a dedicated session to assess fit before any adoption decision.

Arcadia's automation today is the Cowork scheduled-task suite declared in the [[Admin/Governance/Charter|Charter]] Scheduled Activities table (Conformance, Scheduled Task Audit, Health Check, Knowledge Rebuild, Morning Briefing), with prompts under `Pillars/Philosophy/Model/Tools/Claude/Activities/`. Both tools are external products that exist independently of the island, so their reference notes belong in `Resources/`, not `Pillars/`.

---

## Boundary

- Desk assessment only: public documentation, licensing and hosting model. No installation, local container, hosted trial, account creation or credential handling.
- No adoption. The outcome is a recommendation recorded in this record; any adoption is a separate owner decision through a new record and the Charter.
- No new scheduled task, no scheduler change and no spend. No remote operation under the [[Techne Programme Hold]].
- No cross-repository change.

---

## Current state

- `Resources/` contains only `Resources/Resources.md`, an index with an empty `## Overview` and `## Contents`; there is no existing Resources subfolder.
- No note in Arcadia `Pillars/`, `Admin/` or `Streams/` and no harness skill mentions n8n or Node-RED (repository grep, 2026-10-05). The harness's [ADR-KI-HARNESS-TOOLCHAIN-002](https://github.com/knowledgeislands/ki-agentic-harness/blob/main/docs/decisions/ADR-KI-HARNESS-TOOLCHAIN-002-complementary-tooling-current-adoptions.md) records current complementary-tooling adoptions and declines but does not assess either tool.
- The Cowork stack is the baseline for comparison; [[How Tools Connect]] and [[Cowork Configuration Layers]] describe it.

---

## Steps

- [ ] Create `Resources/Workflow Automation/Workflow Automation.md` as the folder index (`## Overview` plus one substantive H2 per child), following `ki-repo-kb` index rules.
- [ ] Create `Resources/Workflow Automation/n8n.md`: what it is, licence as currently published, self-hosted versus cloud, trigger and node model, AI/agent nodes, MCP support if documented, and source links with the access date.
- [ ] Create `Resources/Workflow Automation/Node-RED.md`: what it is, licence as currently published, runtime model (Node.js flows), event and integration nodes, and source links with the access date.
- [ ] Add a `## Workflow Automation` section to `Resources/Resources.md` and fill its empty `## Overview` with one paragraph on the folder's purpose.
- [ ] In this record's Discussion, add a fit assessment table comparing n8n, Node-RED and the Cowork scheduled-task stack on: trigger types (cron, event, webhook), hosting and always-on requirement, credential handling, auditability in Git, cost, and overlap with existing KI MCP servers.
- [ ] Record the recommendation in Discussion, stating explicitly "no adoption" and naming any trigger that would justify revisiting (for example an event-driven need Cowork cannot meet).

---

## Files touched

- `Resources/Workflow Automation/Workflow Automation.md` (new)
- `Resources/Workflow Automation/n8n.md` (new)
- `Resources/Workflow Automation/Node-RED.md` (new)
- `Resources/Resources.md`
- `Streams/Roadmap/KI-ARCADIA-OPS-006-workflow-integrations.md`

---

## Verify

- The three new notes exist, and `Resources/Resources.md` has a `## Workflow Automation` section and a non-empty `## Overview`.
- Discussion contains the fit assessment table and a recommendation that includes the words "no adoption".
- `git diff --quiet HEAD -- Admin/Governance/Charter.md` succeeds: no scheduled activity was added.
- New prose uses British English and ASCII hyphens only (`grep -nP '[\x{2013}\x{2014}]'` on the new and edited notes returns nothing).
- `ki repo audit --skill ki-repo-kb --repo . --progress never` PASS.
- `ki repo audit --progress never` PASS.

---

## Dependencies / blocks

No local or cross-repository dependency. If a later owner decision adopts either tool, that is a new record that would touch the Charter and possibly the harness complementary-tooling ADR through a handoff.

[[KI-ARCADIA-OPS-004-bullet-journal-support|OPS-004]] also seeds the `Resources/Resources.md` `## Overview` and adds a section to it; whichever record delivers second must merge into, not overwrite, the index created by the other.

---

## Documentation impact

### Decision Records

None. A desk assessment ending in "no adoption" is a routine content addition; a Decision Record would be warranted only if a later owner decision adopts a workflow engine.

### Specifications

None. No KI specification covers third-party workflow engines.

### Guides

The two Resources notes and their folder index are the reference material; `Resources/Resources.md` gains a section.

### Roadmap

This record moves to awaiting-review on delivery. Any future adoption would be captured as a new Triage record.

---

## Discussion

### Decisions under delegated autonomy

- Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: the work is a desk assessment only, with no installation, hosted trial or adoption; the recommendation is recorded here as "no adoption" unless the assessment surfaces a need Cowork cannot meet.
- Folder name `Resources/Workflow Automation/` chosen at planning because `Resources/` has no existing subfolder to extend; reversible by renaming before delivery.

### Original checklist

- n8n: investigate as a workflow automation layer; assess whether it adds value over the Cowork scheduled-task approach or solves problems the current stack cannot.
- Node-RED: investigate as a flow-based programming tool for wiring integrations; assess fit for event-driven island automation.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
