---
type: stream-proposal
tags:
  - topic/knowledge-islands
  - topic/knowledge-management
  - topic/conventions
status: background
---

# Conventions: Make Implicit Explicit

Systematically identify conventions in ki-arcadia-principal that are asserted without documented rationale, and add the _why_ alongside the _what_ for each one.

## Governance

Follows the [[Philosophy/Model/Processes/Enactment Process|Enactment Process]].

---

## Problem

Several structural conventions are in active use but have no rationale written down:

- **Digest routing**: digests go to `-/_DIGESTS/` (produced artefacts, not work-in-motion), but this is codified without explanation. The `session-digest` type is not in the frontmatter type taxonomy at all.
- **Staging zone distinctions**: the `+/` and `-/` staging zones have meaning, but the rules for what goes where and why are implicit.
- **Stream status vocabulary** (`future`, `background`, `active`, `ratified`): the progression is used but not formally defined.
- Others may surface as the island is used more systematically by agents.

The risk is that these conventions become load-bearing infrastructure that no one can safely change or explain. Each one that gets an _explicit_ rationale becomes a decision that can be revisited, extended, and correctly applied.

## Scope

For each identified convention:

1. Locate the note (or notes) that assert it
2. Add a rationale section: the _why_ behind the rule, not just the rule itself
3. Where the convention belongs in the type taxonomy but is absent, add it
4. Cross-link related conventions so the picture is navigable

## Sequencing

Background priority. Work starts when the Agentic Tool Documentation stream is ratified — that stream is the simpler first pass and will surface additional conventions that need rationale.

## Tracking

Known gaps to address:

- [ ] Digest routing and `session-digest` type gap
- [ ] Staging zone distinctions (`+/` vs `-/`)
- [ ] Stream status vocabulary and progression rules
