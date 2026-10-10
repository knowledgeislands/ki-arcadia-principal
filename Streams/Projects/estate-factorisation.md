---
note_type: streams/project
slug: estate-factorisation
title: Estate factorisation
outcome: The Knowledge Islands estate is factorised - consistent repository structure vocabulary, explicit ownership seams, behavioural MCP policy evidence, a single OpenAI housekeeping product, observable copies and running systems, and one alignment item per surviving repository.
initiative: platform-foundations
lifecycle: active
lead: Kris Brown
target: null
updated: 2026-10-10T16:39:00Z
author: Written with Claude
---

# Estate Factorisation

## Outcome

Finish Knowledge Islands estate factorisation: consistent repository structure vocabulary, explicit ownership seams, behavioural MCP policy evidence, a single OpenAI housekeeping product, observable copies and running systems, and one alignment item per surviving repository. Arcadia coordinates; each item is delivered through a work record in its owning repository. The test is the phase gates below, ending with EVAL-1 and EVAL-2.

This Project sits in [[platform-foundations|Platform foundations]]. [[baseline-rollout]] and the Techne [[agent-host]] work do not wait on it.

---

## Notes

### Phases

- **FND-3 - repository structure vocabulary.** Owner: Agentic Harness standards; Arcadia keeps the estate structure register.
- **FND-4 - documentary and configuration drift.** Owner: each affected repository.
- **FND-5 - ownership seams and dissemination.** Owner: Arcadia, with Harness, `tools-ki`, `ki-techne-harness`, Rig and chezmoi. It unblocks MCP-1, OPS-1, DIST-1 and ALIGN-1, so which repository first carries it is the opening choice.
- **MCP-1 - MCP access and audit policy.** Owner: Agentic Harness. Waits on FND-5.
- **MCP-2 - black-box conformance suite.** Owner: Agentic Harness. Waits on MCP-1.
- **MCP-3 - baseline the MCPs.** Arcadia coordinates; each MCP owns. Waits on MCP-2.
- **OAI-1 - merge Codex into `mcp-housekeeping-chatgpt`.** Owner: `mcp-housekeeping-chatgpt`. Waits on MCP-3. Retiring `mcp-housekeeping-codex` must update any per-repository adoption list that names it.
- **MCP-4 to MCP-7 - shared MCP implementation.** An extract-or-retain decision comes first. Arcadia coordinates; each MCP owns. Waits on MCP-3.
- **PROJ-1 - projection register.** Owner: each source repository. Waits on MCP-5 for kit manifests.
- **OPS-1 - active bindings and builds.** Owner: chezmoi; each product. Waits on FND-5, after OAI-1.
- **DIST-1 - tool distribution.** Owner: each tool; `homebrew-tap`. Extends to the MCPs. Waits on FND-5.
- **ALIGN-1 - one alignment item per repository.** Arcadia issues; each repository owns. Waits on FND-3, FND-5 and OAI-1.
- **EVAL-1 and EVAL-2 - measure and reconsider.** Owner: Arcadia. Waits on ALIGN-1.

Phase specifications (purpose, deliverables, completion gates, dependencies) are at `25be451:+/knowledge-islands-factorisation-roadmap.md`. Where they mention `ki-techne-principal` or `ki-plugins`, read Arcadia and "no plugin projection" instead.

### Boundaries

- The responsibility model, routing map and estate decisions live in `GDR-KI-ARCADIA-006`.
- Arcadia owns Techne engineering knowledge.
- Out of scope before V1: estate-wide KIPs, KIS documents, schemas or portable specifications; legacy compatibility, migration, rollback or dual-running; public package registries; treating MCP products as Harness capability; a third "harness" or "principal" base structure; treating repository, worktree or visibility as runtime isolation; replacing decision records solely for vocabulary; making `tools-ki` own MCP behaviour; and making this note a second work tracker.

### Open questions

- MCP-4: extract shared MCP source, or settle for conformance only? Any extracted source needs an explicit owner and does not default to the Harness, `tools-ki` or `ki-techne-harness`.
- EVAL-2 deferred choices: OpenAI repository visibility, an MCP workspace, Git-ref dependencies, broader consolidation, portable specifications, and the scope of the shared fundamentals projection.

### Close-out assessment

Only early groundwork has been delivered against the Outcome. Four records finished: the Harness and its MCPs share one recovery and dry-run safety contract, released `ki` pins bump automatically through a receiver workflow, and Arcadia now documents the release bot App and the release cascade. None of the phase gates is met. FND-3 to EVAL-2 remain untracked ideas in the Phases list above; none has graduated into a record, including FND-5, which opens the rest, and OAI-1, retiring `mcp-housekeeping-codex` into `mcp-housekeeping-chatgpt`. No follow-up has been captured. The Project stays `active` until Kris decides whether to capture the next phase in its owning repository or to close the Project and leave the phases as ideas.
