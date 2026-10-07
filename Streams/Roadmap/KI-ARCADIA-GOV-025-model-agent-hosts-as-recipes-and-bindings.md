---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-025
area: GOV
title: Model agent hosts as recipes and bindings
theme: governance
horizon: triage
status: draft
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-07T08:49:50Z
updated_at: 2026-10-07T08:49:50Z
---

# Model Agent Hosts as Recipes and Bindings

## Goal

Techné describes agent hosts as harness-defined **recipes** that a person **binds** through configuration into named, configured instances, so one person can hold more than one agent host and the `techne` command structure makes that model visible.

## Context

Kris Brown, 2026-10-07 (paraphrased from speech): the Techne harness should offer different recipes - harness-defined kinds of agent host. A person binds a recipe through configuration to get a named, configured instance, and nothing stops one person having two agent hosts. The current agent host is the first such footprint, built from a prototype recipe. What sets that recipe apart is that agents run directly on the host, not inside a runtime that can delegate agent work. The `techne` command structure should make the model visible, so it is clear how it works.

Decided by Kris, 2026-10-07:

- **Terms.** A **recipe** is a harness-defined kind of agent host. A **binding** is a person's named, configured instance of a recipe. **Footprint** remains the word for what a binding leaves in AWS and on the host, as in `TECHNE-TOOLS-OPS-011`.
- **Prototype recipe.** The prototype recipe is named `direct-host`. The existing host - tag `ki-agent-host-id=agent-host`, stack `ki-techne-agent-host` - is its first binding.

Today the single host's identity is hard-coded across its tags, stack name, `/ki/techne/agent-host/` SSM parameters, Tailscale name and AWS profile. The standing exemption from the [[Techne Programme Hold]] ([[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]], via [[KI-ARCADIA-GOV-023-widen-the-agent-host-exemption-to-a-standing-one|KI-ARCADIA-GOV-023]]) covers that one host only.

Related records:

- Arcadia: [[KI-ARCADIA-GOV-020-limited-remote-agent-prototype|KI-ARCADIA-GOV-020]], [[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|KI-ARCADIA-GOV-021]] (scheduled review of the standing exemption), [[KI-ARCADIA-GOV-022-file-the-agent-host-prototype-diagrams|KI-ARCADIA-GOV-022]], [[KI-ARCADIA-GOV-023-widen-the-agent-host-exemption-to-a-standing-one|KI-ARCADIA-GOV-023]], [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] and [[ADR-TECHNE-003-techne-implementation-ownership|ADR-TECHNE-003]].
- `ki-techne-harness`: `TECHNE-TOOLS-OPS-009` (prepare the agent-host build, done), `TECHNE-TOOLS-OPS-010` (diagram the agent-host runbook, done) and `TECHNE-TOOLS-OPS-011` (manage the agent-host footprint, awaiting review).
- `tools-techne`: `TECHNE-TOOL-CLI-004` (add the `techne host` command group, in progress).

## Boundary

- In scope: the recipe and binding model and its vocabulary; the `direct-host` recipe and its first binding; how the `techne` command structure exposes recipes and bindings; where recipe and binding definitions live and who owns them; the authority a second binding or a new recipe would need.
- Out of scope: deciding the open questions below before this record is adopted and planned; editing `ki-techne-harness` or `tools-techne`, whose own records own any implementation; reciprocal handoff items in those repositories, which are a later step; any AWS, Tailscale or other remote change; a second binding under the current exemption.

## Open questions

- **Binding selection grammar.** How a `techne` command picks a binding: a positional name with a default, a `--host` flag, or the name before the verb. Kris wants to look at more examples before choosing.
- **Where recipes live.** Recipe definitions sit naturally in `ki-techne-harness`, which owns the stack, host setup and runbook under [[ADR-TECHNE-003-techne-implementation-ownership|ADR-TECHNE-003]]; the shape of a recipe definition is open.
- **Where bindings live.** Bindings are per-person configuration. Open: which repository or configuration surface owns them, and how a binding name maps to the tags, stack names, SSM paths, Tailscale names and AWS profiles that are currently hard-coded to the single host.
- **Decision Record.** Whether the model needs an ADR amending or extending [[ADR-TECHNE-003-techne-implementation-ownership|ADR-TECHNE-003]].
- **Hold authority.** The standing exemption under [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] and [[KI-ARCADIA-GOV-023-widen-the-agent-host-exemption-to-a-standing-one|KI-ARCADIA-GOV-023]] covers one host. A second binding, or a binding of any other recipe, would need its own authority under the [[Techne Programme Hold]]; how that authority is granted is open, and [[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|KI-ARCADIA-GOV-021]] is one natural place to consider it.
- **Delegation-capable recipes.** How a future recipe whose runtime can delegate agent work relates to the held personal controller and execution fabric.

## Discussion

### Capture

Captured as Triage on Kris's instruction, 2026-10-07. No plan yet.

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
