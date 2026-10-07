---
note_type: streams/project
slug: estate-factorisation
title: Estate factorisation
outcome: The Knowledge Islands estate is factorised - consistent repository structure vocabulary, explicit ownership seams, behavioural MCP policy evidence, a single OpenAI housekeeping product, observable copies and running systems, and one alignment item per surviving repository.
initiative: platform-foundations
lifecycle: active
lead: Kris Brown
target: null
updated: 2026-10-07T16:59:06Z
author: Written with Claude
---

# Estate Factorisation

## Outcome

Finish Knowledge Islands estate factorisation: consistent repository structure vocabulary, explicit ownership seams, behavioural MCP policy evidence, a single OpenAI housekeeping product, observable copies and running systems, and one alignment item per surviving repository. Arcadia coordinates; each item is delivered through a work record in its owning repository. The test is the phase gates below, ending with EVAL-1 and EVAL-2.

This Project sits in [[platform-foundations|Platform foundations]]. [[baseline-rollout]] and the Techne [[agent-host]] work do not wait on it.

---

## Update

Item status observed read-only on 2026-10-05, related records on 2026-10-07; recheck before acting.

- **Health.** At risk: no factorisation item is adopted or Ready yet, and FND-5 has no owner. A stated judgement for Kris to confirm.

### Phase items

- **FND-3 - repository structure vocabulary.** Mostly done: all 21 local `knowledgeislands` checkouts declare `repo_type`; no checked estate structure register. Owner: Agentic Harness standards; Arcadia register.
- **FND-4 - documentary and configuration drift.** Unverified. Owner: each affected repository.
- **FND-5 - ownership seams and dissemination.** No evidence found. Owner: Arcadia, with Harness, `tools-ki`, `ki-techne-harness`, Rig and chezmoi.
- **MCP-1 - MCP access and audit policy.** Open; Harness MCP standards exist, no policy fixtures. Owner: Agentic Harness. Waits on FND-5.
- **MCP-2 - black-box conformance suite.** Open. Owner: Agentic Harness. Waits on MCP-1.
- **MCP-3 - baseline the MCPs.** Partial; shared-code inventory in `ki-repo-mcp` `standards-mcp-shared-code.md`, no conformance results. Arcadia coordinates; each MCP owns. Waits on MCP-2.
- **OAI-1 - merge Codex into `mcp-housekeeping-chatgpt`.** Partial; `src/tools/codex` exists, `mcp-housekeeping-codex` still active. Owner: `mcp-housekeeping-chatgpt`. Waits on MCP-3.
- **MCP-4 to MCP-7 - shared MCP implementation.** Open; extract-or-retain decision first. Arcadia coordinates; each MCP owns. Waits on MCP-3.
- **PROJ-1 - projection register.** Open. Owner: each source repository. Waits on MCP-5 for kit manifests.
- **OPS-1 - active bindings and builds.** Open. Owner: chezmoi; each product. Waits on FND-5, after OAI-1.
- **DIST-1 - tool distribution.** Open; tap formulae exist for `ki`, `mgit`, `rig`, `git-almanac` and `techne`. Owner: each tool; `homebrew-tap`. Waits on FND-5.
- **ALIGN-1 - one alignment item per repository.** Open. Arcadia issues; each repository owns. Waits on FND-3, FND-5 and OAI-1.
- **EVAL-1 and EVAL-2 - measure and reconsider.** Open. Owner: Arcadia. Waits on ALIGN-1.

### How the open records relate

- **GOV-134** - MCP-1: authentication recovery and dry-run rules in the MCP standard.
- **GOV-140** - DIST-1 extended to the MCPs, none of which has a tag or release workflow.
- **Arcadia GOV-018** - cancelled as obsolete and pruned on 2026-10-07; **GOV-141** keeps the mechanical half (FND-4 stale CI `KI_VERSION` pins).
- **BREW-011** - folded into GOV-141; cancelled and pruned.
- **ECO-009** - OPS-1: per-client MCP binding evidence.
- **CLI-110** - PROJ-1 and FND-4; replaces withdrawn trade `TRD-8004751b`. Arcadia's own skill projections still hold such links.
- **Arcadia GOV-010** - folded into this Project; cancelled and pruned on 2026-10-07.
- Also related, held elsewhere: harness GOV-127 (ALIGN-1 pattern of per-repository adoption, in [[baseline-rollout]]; it lists `mcp-housekeeping-codex` as an adopter, so OAI-1 retirement must update it), and chezmoi `DOTFILES-UE-028` (FND-4 roadmap-shape drift, in Rig workstation hygiene). `ki-website` `KI-WEB-SITE-042` (DIST-1 website release presentation) is done and pruned.

Phase specifications (purpose, deliverables, completion gates, dependencies) are at `25be451:+/knowledge-islands-factorisation-roadmap.md`. Where they mention `ki-techne-principal` or `ki-plugins`, read Arcadia and "no plugin projection" instead.

### Decision

Which repository first carries FND-5, given it unblocks MCP-1, OPS-1, DIST-1 and ALIGN-1. The test: FND-5 exists as an adopted work record in that repository.

### Next step

Recheck the phase items and related records, then use `ki-next` to capture FND-5 as an Arcadia work record. FND-3 (estate structure register) and FND-4 (drift recheck) can be captured alongside it, in their owning repositories, as independent non-blocking work. Check the related records first so new work does not duplicate them.

---

## Constraints

- The responsibility model, routing map and estate decisions live in `GDR-KI-FUNDAMENTALS-001`.
- Arcadia owns Techne engineering knowledge.
- Out of scope before V1: estate-wide KIPs, KIS documents, schemas or portable specifications; legacy compatibility, migration, rollback or dual-running; public package registries; treating MCP products as Harness capability; a third "harness" or "principal" base structure; treating repository, worktree or visibility as runtime isolation; replacing decision records solely for vocabulary; making `tools-ki` own MCP behaviour; and making this note a second work tracker.

---

## Open records

Membership is classification, not authority; each owning repository decides whether its record joins when the migration tags it. Status lives in each record.

- [BREW-012](../../../homebrew-tap/docs/roadmap/BREW-012-document-release-app-operations.md) - Document release app operations
- [KI-HARNESS-GOV-134](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-134-align-mcp-recovery-and-dry-run-contracts.md) - Align MCP safety contracts
- [KI-HARNESS-GOV-140](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-140-define-mcp-release-procedure.md) - Define MCP release procedure
- [KI-HARNESS-GOV-141](../../../ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-141-auto-bump-released-ki-pin.md) - Auto-bump released ki pin
- [KI-TOOL-CLI-110](../../../tools-ki/docs/roadmap/KI-TOOL-CLI-110-report-dangling-projection-links.md) - Report dangling projection links
- [[KI-ARCADIA-ECO-009-legacy-serve-fallback-policy|KI-ARCADIA-ECO-009]] - Gather evidence for a legacy serve fallback policy

---

## Ideas

- MCP-4: extract shared MCP source, or settle for conformance only? Any extracted source needs an explicit owner and does not default to the Harness, `tools-ki` or `ki-techne-harness`.
- EVAL-2 deferred choices: OpenAI repository visibility, an MCP workspace, Git-ref dependencies, broader consolidation, portable specifications, and the scope of the shared fundamentals projection.

---

## Sources

Seeded by KI-ARCADIA-GOV-026 from `+/_CHECKPOINTS/estate-factorisation.md` at `53633b2`.
