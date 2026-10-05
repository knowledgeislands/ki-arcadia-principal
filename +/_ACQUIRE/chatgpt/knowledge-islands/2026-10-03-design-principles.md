# Knowledge Islands / Techne — Design Principles

Date: 2026-10-03 Source: ChatGPT acquisition

## 1. Durable knowledge outlives runtimes

Knowledge must not be trapped in an agent, model, chat session, application database or compute instance. Durable knowledge belongs in portable, governed stores, with Git currently serving as a core distributed backbone.

Agents and tools may disappear; civilisation knowledge should remain.

## 2. Tool-agnostic, not lowest-common-denominator

Knowledge Islands should remain independent of any one model, agent framework, IDE, orchestrator or vendor, while still exploiting the distinctive capabilities of good tools.

Portability must not mean reducing every tool to the weakest shared feature set.

## 3. Reuse before rebuilding

Existing tools such as Paperclip should be treated as useful, replaceable components. Techne should integrate and amplify capable software rather than recreate it without a strong reason.

No workload should quietly become the Realm itself.

## 4. FOSS-first and inspectable

Prefer Free and Open Source Software and open standards where practical. High-quality freemium components may be appropriate, but avoid unnecessary proprietary lock-in.

Core contracts should remain inspectable and portable.

## 5. Kubernetes is a contract, not the architecture

Kubernetes provides a portable workload/deployment contract across compute footprints. It is substrate, not the conceptual model of a Realm.

K3s is appropriate for the first lightweight footprint; other conformant implementations can be used where appropriate.

## 6. Separate Realm from Footprint

A Realm is logical and governed. A Footprint is the physical/virtual compute currently realising it.

A Realm may move, recover or span footprints without changing its conceptual identity.

## 7. Continuity lives beyond the Rig

A Rig is an access environment and entry point, not the home of persistent agency.

The Avatar, delegated work and Realm services must be able to continue when a laptop or other Rig disconnects or shuts down, and continuity should be recoverable from another authorised Rig.

## 8. Principal location with a distributed horizon

Keep the first implementation understandable: a Realm should have a clear principal location/authority.

The architecture should nevertheless allow future redundancy and distribution across cloud, Mac Studio, home gateway, edge systems and other footprints without making multi-site complexity a prerequisite.

## 9. Replaceable workloads and explicit boundaries

Paperclip, messaging adapters, models, agents and other services are workloads/components.

Kitteth must sit outside Paperclip sufficiently to observe, manage or repair it. Privilege boundaries must be deliberate rather than accidental.

## 10. Secure authorisation is fundamental

Identity, authentication, authorisation and capability boundaries are part of the Realm model, not later add-ons.

Remote operational access and Avatar interaction should be secured independently. Moving an Avatar into another Realm must not imply unrestricted capability transfer.

## 11. Deterministic where possible; AI where valuable

Use deterministic/mechanical processes for operations that can be reliably specified. Use AI to accelerate reasoning, interpretation and agency where it adds value.

The system should not require AI for mechanisms that are better implemented as predictable infrastructure.

## 12. Human authority and auditable delegation

The human remains the ultimate source of intent. The system should distinguish direct human actions, Avatar actions and further delegated agent/worker actions.

Delegation should be observable and governable.

## 13. Design for reconstruction

A footprint should be rebuildable from durable knowledge, configuration and governed state rather than depending on irreplaceable runtime mutation.

Resilience begins with the ability to reconstruct, not merely with keeping a particular server alive.
