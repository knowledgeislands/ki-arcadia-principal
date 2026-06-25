---
type: admin/governance/decision
decision_type: architecture
status: current - June 2026
author: Written with Claude
---

# ADR-ARCADIA-002: Three Arcadia Project Roles

**Status:** Accepted

**Date:** 2026-06-25

## Context

Three sibling repos operate under the Arcadia umbrella and the broader Knowledge Islands banner. They were created and evolved without an
explicit statement of their roles or the boundaries between them. Without this, decisions about where new work belongs and how changes flow
across the repos rely on implicit shared understanding that erodes over time.

The three repos are:

- **arcadia-principal** -- this repo; the home of the Knowledge Islands philosophy and model
- **arcadia-agentic-harness** -- the canonical home for KI agent skills, patterns, and tooling
- **arcadia-website** -- the public-facing outlet for the philosophy

The relationship between them has not been captured as a decision.

## Decision

Each repo has a distinct, non-overlapping role:

- **arcadia-principal** owns the Knowledge Islands philosophy and model. It is the exemplar island: the living instance that validates the
  model in practice. New KI concepts are developed and proven here before being generalised elsewhere. Its Pillars are the authoritative
  source for the KI model.
- **arcadia-agentic-harness** owns the general-purpose KI tooling -- skills, agent definitions, evals -- that any island can adopt. It
  receives patterns proven in arcadia-principal and generalises them. It does not encode Arcadia-specific behaviour.
- **arcadia-website** is the public outlet. It publishes what emerges from arcadia-principal to the world. It does not originate philosophy
  -- it translates and disseminates it.

## Consequences

- The canonical flow of change is: arcadia-principal (prove and model) to arcadia-agentic-harness (generalise into reusable tooling) to
  arcadia-website (publish outward).
- The harness pulls patterns from principal; it does not push decisions back into it.
- Content decisions about the KI model are made in arcadia-principal and are subject to its Enactment Process.
- Skills in the harness that extract patterns from arcadia-principal cite their source notes; they do not fork them.
- The website does not independently develop knowledge -- it is fed from arcadia-principal via a deliberate publishing step.

## References

- [Knowledge Islands](../../../Pillars/Knowledge%20Islands/Knowledge%20Islands.md) -- the philosophy arcadia-principal owns
- [Great Library of Arcadia](../../../Pillars/Knowledge%20Islands/Realisation/Arcadia/Great%20Library%20of%20Arcadia/Great%20Library%20of%20Arcadia.md)
  -- the living instantiation of the model in this repo
