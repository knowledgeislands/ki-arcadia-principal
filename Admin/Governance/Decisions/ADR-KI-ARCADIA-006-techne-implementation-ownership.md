---
note_type: admin/governance/decision
id: ADR-KI-ARCADIA-006
title: Techne implementation ownership
date: 2026-10-07
status: current
decision_type: architecture
decision_type_url: https://knowledgeislands.info/specifications/decision-records/adr
decision_depends_on: [GDR-KI-ARCADIA-007, ADR-KI-ARCADIA-004, ADR-KI-ARCADIA-005]
---

# ADR-KI-ARCADIA-006: Techne implementation ownership

## Context

Arcadia defines the engineering architecture for personal controllers and execution-fabric operators, but a knowledge base is not an appropriate long-term home for runnable services, installation artefacts, deployment resources or provider adapters. Implementation therefore needs an independently governed home.

Two independently versioned products exist: the runnable controller and execution-fabric harness, and the `techne` operator interface. Coupling their releases would make an operator-tool update depend on unrelated harness application or image changes.

One person may hold more than one agent host, of more than one kind and on more than one provider, so the repositories need a model that separates what the harness defines, what a person configures and the infrastructure a host lands on.

## Decision

Techne assigns implementation ownership across two independently governed repositories:

- `knowledgeislands/ki-techne-harness` owns deployable personal-controller and execution-fabric applications, runtime payloads, deployment resources, provider operations, packaging and verification for the harness.
- `knowledgeislands/tools-techne` owns the `techne` operator interface: command grammar, local diagnostics, authentication coordination, installation, semantic versioning, release archives and downstream package-manager handoff.

Agent hosts follow one model with four terms:

- A **recipe** is a harness-defined kind of agent host. It declares the providers it supports and, for each, how a host of that kind is built and operated. The prototype recipe, `direct-host`, runs agents directly on the host rather than inside a runtime that can delegate agent work.
- A **binding** is a person's named, configured instance of a recipe. It names its provider by carrying exactly one provider table, and every provider-specific value sits in that table.
- A **provider** is the infrastructure a binding's footprint lives on. AWS is the first; no recipe field, binding field, derivation or command outside a provider's own section or adapter assumes it.
- A **footprint** is what a binding leaves on its provider and on the host.

Ownership of the model follows the repository split:

- `ki-techne-harness` owns the recipes as manifests, each recipe's provider sections and their resource selectors, the provider stacks, and the provision, destroy and host-side scripts that operate them.
- `tools-techne` owns the command grammar that exposes recipes and bindings, the binding loader and its schema, the provider-adapter interface and dispatch, and each adapter's operator-scoped lifecycle calls, driven only by the recipe manifest and the binding with no provider name hard-coded.
- The two repositories are joined only by the recipe manifest and the environment-variable contract through which binding values reach the harness scripts. A new provider lands as a harness provider section and stack plus a `tools-techne` adapter, each in its own repository and release.
- Bindings and the controller target are per-person configuration outside both repositories, read by the CLI from the person's configuration directory. Neither repository carries a built-in binding, controller target or person-specific default. Kris's own bindings and controller target are rendered by Kris's chezmoi source.

Provider neutrality of the recipe and binding schemas and of the CLI follows [ADR-KI-ARCADIA-004](ADR-KI-ARCADIA-004-provider-neutral-isolated-agent-execution.md), which keeps provider APIs as adapter concerns.

The CLI may operate or deploy harness capabilities only through explicit command and artefact contracts. It must not assume that harness source is co-located, that both repositories share a version, or that changing a harness image requires a CLI release. The harness must not publish a second authoritative `techne` executable.

Arcadia retains authority over engineering meaning, roles, invariants and decision criteria. Each implementation repository consumes that knowledge and owns implementation choices within its declared boundary, but none gains write authority over another.

## Consequences

- Runnable controller and execution-fabric work belongs in Techne Harness; operator-interface and CLI release work belongs in `tools-techne`.
- Harness applications and images can evolve independently from the installed operator tool.
- Cross-repository integration requires explicit, versioned or immutable interfaces rather than source-tree adjacency.
- Public CLI publication and Homebrew packaging begin only from an accepted `tools-techne` release and its immutable checksums.
- One person can hold several agent hosts of several recipes, each a separate binding with its own footprint; adding a binding, provider or recipe changes configuration, a harness provider section or a CLI adapter, not the other repository.
- Live agent-host authority is governed separately under the Techne Programme Hold; this record grants none.
- Persona identity, governed work, credentials, canonical execution evidence and accepted portable specifications remain outside both implementation repositories unless another governing decision assigns them.

Arcadia holds the only live copy of this decision record.

## References

- [GDR-KI-ARCADIA-007](GDR-KI-ARCADIA-007-adopting-decision-records.md) - records the engineering discipline's Decision Records instrument.
- [ADR-KI-ARCADIA-004](ADR-KI-ARCADIA-004-provider-neutral-isolated-agent-execution.md) - establishes provider-neutral controller and isolated execution boundaries.
- [ADR-KI-ARCADIA-005](ADR-KI-ARCADIA-005-one-persona-across-explicit-working-contexts.md) - establishes persona continuity across explicit working contexts.
- Techne Harness `TECHNE-TOOLS-OPS-006` - accepted the standalone CLI extraction and retained harness boundary.
- [KI-ARCADIA-GOV-025](https://github.com/knowledgeislands/ki-arcadia-principal/blob/50322d4af25e34af196384177b2762e7b1d3bc2a/Streams/Roadmap/KI-ARCADIA-GOV-025-model-agent-hosts-as-recipes-and-bindings.md) - established the recipe, binding, provider and footprint model and placed its delivery in Techne Harness `TECHNE-TOOLS-OPS-012`, `tools-techne` `TECHNE-TOOL-CLI-005` and chezmoi `DOTFILES-UE-070`.
