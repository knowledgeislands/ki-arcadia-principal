---
note_type: pillars/index
updated: 2026-10-11T02:19:55Z
author: AI-assisted
---

# Engineering Practice

## Overview

Techné is the engineering discipline maintained in Arcadia for the Knowledge Islands ecosystem.

It defines the engineering practice required to design, operate, and evolve AI-native systems with governed knowledge.

Arcadia holds the philosophy of Knowledge Islands and its Techné engineering practice: architecture, operating models, engineering workflows, and implementation patterns.

[[Agentic Operating Approach]] introduces how a person coordinates agentic work through one enduring persona, explicit working contexts, bounded authority and portable execution.

The architecture separates stable roles before mapping products onto them. Personal coordination and reasoning, governance, deterministic operations, fabric operation, task execution, human interaction, governed knowledge, connectivity and model inference can evolve independently behind explicit boundaries.

The Techne Fabric, described in [[AI Execution Fabric]], is the execution part of that architecture.

It provides a provider-neutral model for matching context-eligible agent footprints and bounded assignments with local, managed, elastic or dedicated targets. Controller placement, worker placement and model-inference placement remain independent choices.

Each routing decision balances capability, latency, privacy, cost, context length, locality, and availability.

Current and candidate implementation mappings include Zed, Hermes Agent, tools-mgit, Herdr, Tailscale, llama.cpp and MLX-LM. Knowledge Islands supplies governed repositories and relationships. These names describe the present estate and options under evaluation; they do not define the architectural roles or make a particular provider, runtime, interface or model mandatory.

The `ki` tool implements governance workflows. A distinct execution-fabric operator may later implement provisioning, dispatch, lifecycle and evidence-return operations, with implementation ownership assigned by [[ADR-KI-ARCADIA-006-techne-implementation-ownership|ADR-KI-ARCADIA-006]] to `ki-techne-harness` and the operator interface to `tools-techne`. Those product boundaries do not merge the architectural roles.

Arcadia maintains Engineering Practice as living canonical knowledge rather than a fixed design document.

Its architecture, decisions, evaluations, and operating guidance evolve through small, reviewable changes that preserve context and record consequences.

## Architecture

[[Pillars/Engineering Practice/Architecture/Architecture|Architecture]] defines the roles and boundaries of the engineering estate before any product is mapped onto them. It covers the agentic operating approach, the governed work controller, the Techne Fabric and its execution contract, knowledge architecture, the first controller workload evaluation and the diagrams that illustrate them. Current products appear only as replaceable mappings onto those roles.

## Foundations

[[Pillars/Engineering Practice/Foundations/Foundations|Foundations]] establishes why Techné exists and how its trade-offs are judged. Its Vision, Goals, Non-Goals and Principles set the discipline's purpose, intended outcomes, boundaries and decision criteria. The other chapters cite these when a choice needs justifying.

## MEMORY

[[Engineering Practice/MEMORY|MEMORY]] is the scoped memory index for this pillar, loaded before substantive engineering knowledge work. It states the pillar's scope and its current boundaries, including the [[Techne Programme Hold]] and the separate implementation ownership of `ki-techne-harness` and `tools-techne`.

## Operating Model

[[Pillars/Engineering Practice/Operating Model/Operating Model|Operating Model]] defines how Techné turns an objective into reviewed work and durable knowledge. It sets out working contexts, the attached, persistent and unattended working modes, write ownership and human handover, a six-stage lifecycle from framing to evolution, and the control points that keep engineering disciplined. It also holds the Technology Investigation Programme for evidence-backed technology questions.

## Technology

[[Pillars/Engineering Practice/Technology/Technology|Technology]] records the current engineering posture toward technologies that affect the Knowledge Islands ecosystem. Its Technology Radar sorts them into Adopt, Trial, Assess and Hold, with a review practice for moving them between rings. Posture changes are informed by the Technology Investigation Programme rather than by automatic adoption.

## Provenance

Adopted into Arcadia from [the retained Techné source](https://github.com/knowledgeislands/ki-techne-principal/blob/b25e9c950fd87715d12f76b69bb2079c3a4fc054/Pillars/Engineering%20Practice/Engineering%20Practice.md) at revision `b25e9c950fd87715d12f76b69bb2079c3a4fc054`. Arcadia owns this canonical engineering knowledge; the original source revision remains evidence.
