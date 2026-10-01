---
note_type: pillars/index
updated: 2026-10-01T22:07:06Z
author: AI-assisted
---

# Engineering Practice

Techné is the engineering discipline maintained in Arcadia for the Knowledge Islands ecosystem.

It defines the engineering practice required to design, operate, and evolve AI-native systems with governed knowledge.

Arcadia holds the philosophy of Knowledge Islands and its Techné engineering practice: architecture, operating models, engineering workflows, and implementation patterns.

[[Agentic Operating Approach]] introduces how a person coordinates agentic work through one enduring persona, explicit working contexts, bounded authority and portable execution.

The architecture separates stable roles before mapping products onto them. Personal coordination and reasoning, governance, deterministic operations, fabric operation, task execution, human interaction, governed knowledge, connectivity and model inference can evolve independently behind explicit boundaries.

The Techne Fabric, described in [[AI Execution Fabric]], is the execution part of that architecture.

It provides a provider-neutral model for matching context-eligible agent footprints and bounded assignments with local, managed, elastic or dedicated targets. Controller placement, worker placement and model-inference placement remain independent choices.

Each routing decision balances capability, latency, privacy, cost, context length, locality, and availability.

Current and candidate implementation mappings include Zed, Hermes Agent, tools-mgit, Herdr, Tailscale, llama.cpp and MLX-LM. Knowledge Islands supplies governed repositories and relationships. These names describe the present estate and options under evaluation; they do not define the architectural roles or make a particular provider, runtime, interface or model mandatory.

The `ki` tool implements governance workflows. A distinct execution-fabric operator may later implement provisioning, dispatch, lifecycle and evidence-return operations, with implementation ownership assigned by ADR-TECHNE-003 to `ki-techne-harness` and the operator interface to `tools-techne`. Those product boundaries do not merge the architectural roles.

Arcadia maintains Engineering Practice as living canonical knowledge rather than a fixed design document.

Its architecture, decisions, evaluations, and operating guidance evolve through small, reviewable changes that preserve context and record consequences.

## Contents

- [[Pillars/Engineering Practice/Foundations/Foundations|Foundations]] establishes the intent, outcomes, boundaries, and principles of the discipline.
- [[Pillars/Engineering Practice/Architecture/Architecture|Architecture]] defines the agentic operating approach, engineering estate, Techne Fabric, knowledge architecture, and their diagrams.
- [[Pillars/Engineering Practice/Operating Model/Operating Model|Operating Model]] defines how engineering work is performed and evolved.
- [[Pillars/Engineering Practice/Technology/Technology|Technology]] records the current technology posture.

## Provenance

Adopted into Arcadia from [the retained Techné source](https://github.com/knowledgeislands/ki-techne-principal/blob/b25e9c950fd87715d12f76b69bb2079c3a4fc054/Pillars/Engineering%20Practice/Engineering%20Practice.md) at revision `b25e9c950fd87715d12f76b69bb2079c3a4fc054`. Arcadia owns this canonical engineering knowledge; the original source revision remains evidence.
