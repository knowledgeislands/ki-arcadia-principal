---
note_type: admin/governance/policy
updated: 2026-10-04T17:20:00Z
author: AI-assisted
---

# Techne Programme Hold

## Authority

Arcadia maintains the remote-execution and remote-environment hold across the independent Techné harness and CLI products. The principal is the accountable human owner of this constraint; relocation of knowledge does not change that decision authority.

## Holding position

Techné tool-building is not generally on hold. Local design, implementation, architecture, testing, review and branch integration may proceed in `ki-techne-harness` and `tools-techne` under each repository's normal approval, review and Git rules. Keep the products building and current with their declared KI repository, engineering and tool-building standards: maintain the applicable lint, typecheck, test, build, package and governance checks rather than leaving the tooling frozen. Ordinary hosted CI is permitted when it exercises isolated build and test paths without operating live Techné environments.

The hold applies to using tooling to dispatch or run agents remotely and to provision, deploy, configure, change, stop or otherwise manage a remote runtime, service or environment. It applies whether initiated locally, from hosted CI or from another project. An approved local work record, a passing check or a Ready task does not authorise a remote operation. Read-only inspection may continue under normal access and secret-handling rules; existing remote services and state must be preserved.

The former `TECHNE-OPS-002` candidates `0f77071572aa649a936be3069f635ab8ea721858` and `eb7292a1f1bd515fcb7c44715caac48bfe5770ad` were never accepted. On the source's retirement they were preserved unaccepted on its archived remote; any later use must be captured afresh by an owning repository and gives no remote-operation authority.

Before remote execution or environment management resumes, the Convenor must bring back evidence of the local review-to-live-main cycle and recovery of accumulated output; a review of what Paperclip already supplies and what Techné still needs to add; and a repository-owned remote-delivery policy covering destination, visibility, review, integration, synchronisation and recovery. The `ki-agent-coordination-paperclip` skill owns the reusable policy boundary. The principal explicitly decides whether to authorise, reshape or retire the remote-running work. These remote-operation prerequisites do not suspend local tool-building.

## Knowledge-owner transition

The approved [[KI-ARCADIA-ECO-007-consolidate-techne-knowledge|knowledge consolidation]] transfers canonical engineering knowledge to [[Engineering Practice/Engineering Practice|Engineering Practice]] while retaining source evidence and existing work. The human's exception to the retiring source's Enactment prerequisite permits the scoped documentary authority transition only. It does not itself accept candidates, change source work records or permit remote operations.

The source `knowledgeislands/ki-techne-principal` was retired on 4 October 2026 under [[KI-ARCADIA-ECO-008-disposition-retained-techne-source|ECO-008]] and is archived read-only. Its snapshots, closed work records, frozen ledger and preserved candidate branches remain readable there as historical evidence; its own `AGENTS.md` and `README.md` now point to this policy rather than carrying a hold of their own. Retirement neither lifts nor broadens this hold.

## Provenance

The broader original hold is preserved as historical evidence in [the source instruction](https://github.com/knowledgeislands/ki-techne-principal/blob/b25e9c950fd87715d12f76b69bb2079c3a4fc054/AGENTS.md#techne-holding-position) at revision `b25e9c950fd87715d12f76b69bb2079c3a4fc054`. The principal narrowed its live scope on 2 October 2026 to remote running and remote-environment management. The local acceptance and prune commits for `KI-ARCADIA-GOV-013` preserve the delivery record in Git history.
