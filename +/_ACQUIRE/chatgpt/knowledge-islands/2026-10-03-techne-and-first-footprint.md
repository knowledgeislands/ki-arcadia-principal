# Techne — First Persistent Footprint

Date: 2026-10-03
Source: ChatGPT acquisition

## Purpose of Techne

Techne is a set of tools, contracts and operating practices for realising and managing Knowledge Islands environments on compute.

Techne is not itself the Realm and should not be confused with Kubernetes or a particular cloud.

## Kubernetes as the workload contract

For the current direction, Kubernetes is the transferable contract for workloads within a compute footprint.

This provides:

- a consistent deployment model across cloud, local and edge environments;
- workload isolation and orchestration;
- a basis for security controls;
- observability and analytics integration;
- a path to distributed and resilient footprints;
- reduced coupling to a single infrastructure provider.

The first prototype uses **K3s** because full managed Kubernetes/EKS adds cost and complexity that are not currently justified.

The portability target is important enough that the model should plausibly extend to constrained/edge systems and, eventually, devices such as capable home gateways.

## Initial AWS footprint

The first practical implementation should be deliberately small:

- AWS account;
- one EC2 instance initially;
- K3s on the instance;
- vertical scaling before introducing unnecessary distributed complexity.

The purpose is to prove the operating model, not to reproduce hyperscale infrastructure.

## Workloads

### Paperclip

Paperclip runs as one workload and can host/co-ordinate the organisations currently being modelled.

Paperclip must remain replaceable and must not own the Realm.

### Kitteth

Kitteth runs alongside Paperclip as the Avatar handoff and management point.

Kitteth must have explicitly designed privileged capabilities for administering the environment when required, including cases where an application such as Paperclip cannot repair itself.

Those privileges should be governed and auditable rather than treated as an undefined permanent "god mode".

## Persistent operation

The defining prototype behaviour is:

1. Kit connects from a Rig.
2. Kit interacts operationally or through the Avatar.
3. Work is initiated inside the footprint.
4. The Rig disconnects or shuts down.
5. Work continues.
6. Kit reconnects later, potentially from another Rig, and regains continuity.

This is more important to prove than sophisticated multi-node resilience in the first iteration.

## Future distributed footprint

A later Realm footprint could span:

- AWS/cloud compute;
- Mac Studio;
- home gateway;
- laptop/other Rigs where appropriate;
- other edge compute.

Potential future patterns include:

- workload placement by territory or organisation;
- redundancy across locations;
- dormant failover instances;
- meshed compute;
- secure disconnected/edge environments.

A Realm should still have a clear principal location or authority model even when its compute is distributed.

## Durable knowledge backbone

Runtime compute is replaceable. Durable knowledge should be distributed and recoverable.

Git is a key current mechanism for this: knowledge and configuration can survive the loss or replacement of a particular runtime footprint.

## Security and deployment horizon

Experience from secure Kubernetes/edge deployment patterns, including work around secure application delivery, informs the direction without becoming a current dependency.

The project should prefer FOSS and open approaches where practical. Proprietary systems may provide inspiration, but portable/open contracts should be favoured.

## First milestone acceptance criteria

The prototype succeeds when:

- K3s runs reliably on the AWS footprint;
- Paperclip runs as a workload;
- Kitteth runs independently alongside it;
- Kitteth has controlled management capability beyond Paperclip;
- Kit can connect securely from a Rig;
- a conversational channel can instruct Kitteth and return updates;
- work survives Rig disconnection;
- persistent knowledge/configuration is not trapped in the EC2 instance.
