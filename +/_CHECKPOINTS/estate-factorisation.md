---
type: ki-checkpoint
thread: estate-factorisation
state: active
created_at: 2026-10-06T20:32:17Z
updated_at: 2026-10-07T09:05:00Z
---

# estate-factorisation

## Objective

Finish the Knowledge Islands estate factorisation: a consistent repository structure vocabulary, explicit ownership seams, behavioural MCP policy evidence, a single OpenAI housekeeping product, observable copies and running systems, and one alignment item per surviving repository. Arcadia coordinates; each item is delivered through a work record in its owning repository. No factorisation item is adopted or Ready yet. The rollout baseline is tracked in `baseline` and the Techné cloud move in `techne`; neither waits on this thread.

## Current state

Item status was observed read-only on 2026-10-05; recheck before acting.

| Item | Status | Owner | Waiting on |
| --- | --- | --- | --- |
| FND-3 - repository structure vocabulary | Mostly done; all 21 local `knowledgeislands` checkouts declare `repo_type`, no checked estate structure register | Agentic Harness standards; Arcadia register | - |
| FND-4 - documentary and configuration drift | Unverified | Each affected repository | - |
| FND-5 - ownership seams and dissemination | No evidence found | Arcadia, with Harness, `tools-ki`, `ki-techne-harness`, Rig and chezmoi | - |
| MCP-1 - MCP access and audit policy | Open; Harness MCP standards exist, no policy fixtures | Agentic Harness | FND-5 |
| MCP-2 - black-box conformance suite | Open | Agentic Harness | MCP-1 |
| MCP-3 - baseline the MCPs | Partial; shared-code inventory in `ki-repo-mcp` `standards-mcp-shared-code.md`, no conformance results | Arcadia coordinates; each MCP | MCP-2 |
| OAI-1 - merge Codex into `mcp-housekeeping-chatgpt` | Partial; `src/tools/codex` exists, `mcp-housekeeping-codex` still active | `mcp-housekeeping-chatgpt` | MCP-3 |
| MCP-4 to MCP-7 - shared MCP implementation | Open; extract-or-retain decision first | Arcadia coordinates; each MCP | MCP-3 |
| PROJ-1 - projection register | Open | Each source repository | MCP-5 for kit manifests |
| OPS-1 - active bindings and builds | Open | chezmoi; each product | FND-5, after OAI-1 |
| DIST-1 - tool distribution | Open; tap formulae exist for `ki`, `mgit`, `rig`, `git-almanac` and `techne` | Each tool; `homebrew-tap` | FND-5 |
| ALIGN-1 - one alignment item per repository | Open | Arcadia issues; each repository owns | FND-3, FND-5, OAI-1 |
| EVAL-1 and EVAL-2 - measure and reconsider | Open | Arcadia | ALIGN-1 |

Related work already sits with its owners, observed read-only on 2026-10-07. Those repositories own priority and scheduling; this table only maps the work to the items above.

| Record | Status | Relates to |
| --- | --- | --- |
| `KI-HARNESS-GOV-134` - align MCP safety contracts | ready, now | MCP-1: authentication recovery and dry-run rules in the MCP standard |
| `KI-HARNESS-GOV-140` - define MCP release procedure | draft, triage; mapped to this thread | DIST-1 extended to the MCPs, none of which has a tag or release workflow |
| `KI-ARCADIA-GOV-018` - CI policy principle | draft, now | FND-4 stale CI `KI_VERSION` pins; DIST-1 |
| `KI-HARNESS-GOV-141` - auto-bump released `ki` pin | draft, next | Mechanical half of `KI-ARCADIA-GOV-018` |
| `homebrew-tap` `BREW-011` - register `ki` pin consumers | draft, triage; folded into `GOV-141` | Stays open until `GOV-141`'s plan places the tap work |
| `ki-website` `KI-WEB-SITE-042` - auto-accept verified tool versions | done, pruned | DIST-1 website release presentation |
| `KI-ARCADIA-ECO-009` - legacy serve fallback evidence | ready, now | OPS-1: per-client MCP binding evidence |
| `KI-HARNESS-GOV-127` - adopt Dependency Cruiser estatewide | in-progress, now | ALIGN-1 pattern of per-repository adoption; lists `mcp-housekeeping-codex` as an adopter, so OAI-1 retirement must update it |
| `tools-ki` `KI-TOOL-CLI-110` - report dangling projection links | draft, triage; replaces withdrawn trade `TRD-8004751b` | PROJ-1 and FND-4; Arcadia's own skill projections still hold such links |
| `tools-ki` `KI-TOOL-CLI-111` - surface undeliverable trades | draft, triage; replaces withdrawn trade `TRD-d03495e9`; now also requires sender-side withdrawal | FND-5 dissemination routes |
| chezmoi `DOTFILES-UE-028` - tidy retired software remnants | draft, waiting-for | Named in FND-4's roadmap-shape drift set; recheck |
| `KI-ARCADIA-GOV-010` - assess estate tooling commonality | draft, future; folds into this thread | Closes once this thread has a work record; feeds EVAL-2 |

Phase specifications (purpose, deliverables, completion gates, dependencies) are at `25be451:+/knowledge-islands-factorisation-roadmap.md`. Where they mention `ki-techne-principal` or `ki-plugins`, read Arcadia and "no plugin projection" instead.

## Decisions made

- The responsibility model, routing map and estate decisions live in `GDR-KI-FUNDAMENTALS-001`.
- Arcadia owns Techne engineering knowledge.
- Out of scope before V1: estate-wide KIPs, KIS documents, schemas or portable specifications; legacy compatibility, migration, rollback or dual-running; public package registries; treating MCP products as Harness capability; a third "harness" or "principal" base structure; treating repository, worktree or visibility as runtime isolation; replacing decision records solely for vocabulary; making `tools-ki` own MCP behaviour; and making this record a second work tracker.

## Files touched

None. Remaining work lands in the owning repositories.

## Open questions

- Which repository first carries FND-5, given it unblocks MCP-1, OPS-1, DIST-1 and ALIGN-1.
- Whether MCP-4 extracts shared MCP source or settles for conformance only; any extracted source needs an explicit owner and does not default to the Harness, `tools-ki` or `ki-techne-harness`.
- EVAL-2 deferred choices: OpenAI repository visibility, an MCP workspace, Git-ref dependencies, broader consolidation, portable specifications, and the scope of the shared fundamentals projection.

## Next step

Recheck both status tables, then use `ki-next` to capture FND-5 as an Arcadia work record. FND-3 (estate structure register) and FND-4 (drift recheck) can be captured alongside it, in their owning repositories, as independent non-blocking work. Check the related records first so new work does not duplicate them.
