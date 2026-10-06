---
type: ki-checkpoint
thread: estate-factorisation
state: active
created_at: 2026-10-06T20:32:17Z
updated_at: 2026-10-06T20:42:00Z
---

# estate-factorisation

## Objective

Finish the Knowledge Islands estate factorisation that came out of the 2026-09-20 brief and reviews: a consistent repository structure vocabulary, explicit ownership seams, behavioural MCP policy evidence, a single OpenAI housekeeping product, observable copies and running systems, and one alignment item per surviving repository. Arcadia coordinates; each item is delivered through a work record in its owning repository. Nothing here is adopted or Ready.

## Current state

Status was observed read-only on 2026-10-05; recheck before acting.

| Item | Status | Owner | Waiting on |
| --- | --- | --- | --- |
| FND-3 - repository structure vocabulary | Mostly done; all 21 local `knowledgeislands` checkouts declare `repo_type`, no checked estate structure register | Agentic Harness standards; Arcadia register | - |
| FND-4 - documentary and configuration drift | Partly moot, rest unverified | Each affected repository | - |
| FND-5 - ownership seams and dissemination | No evidence found | Arcadia, with Harness, `tools-ki`, `ki-techne-harness`, Rig and chezmoi | - |
| MCP-1 - MCP access and audit policy | Open; Harness MCP standards exist, no policy fixtures | Agentic Harness | FND-5 |
| MCP-2 - black-box conformance suite | Open | Agentic Harness | MCP-1 |
| MCP-3 - baseline the MCPs | Partial; shared-code inventory of 2026-09-24 in `ki-repo-mcp` `standards-mcp-shared-code.md`, no conformance results | Arcadia coordinates; each MCP | MCP-2 |
| OAI-1 - merge Codex into `mcp-housekeeping-chatgpt` | Partial; `src/tools/codex` exists, `mcp-housekeeping-codex` not archived and still committed to on 2026-10-05 | `mcp-housekeeping-chatgpt` | MCP-3 |
| MCP-4 to MCP-7 - shared MCP implementation | Open; extract-or-retain decision first | Arcadia coordinates; each MCP | MCP-3 |
| PROJ-1 - projection register | Open; smaller now `ki-plugins` is retired | Each source repository | MCP-5 for kit manifests |
| OPS-1 - active bindings and builds | Open | chezmoi; each product | FND-5, after OAI-1 |
| DIST-1 - tool distribution | Open; tap formulae exist for `ki`, `mgit`, `rig`, `git-almanac` and `techne` | Each tool; `homebrew-tap` | FND-5 |
| ALIGN-1 - one alignment item per repository | Open | Arcadia issues; each repository owns | FND-3, FND-5, OAI-1 |
| EVAL-1 and EVAL-2 - measure and reconsider | Open | Arcadia | ALIGN-1 |

Related work records already exist in their owning repositories, observed read-only on 2026-10-06. They are owned and scheduled there; this table only maps them to the items above.

| Record | Status | Relates to |
| --- | --- | --- |
| `KI-HARNESS-GOV-134` - align MCP safety contracts | ready, now | MCP-1: authentication recovery and dry-run rules in the MCP standard |
| `KI-HARNESS-GOV-140` - define MCP release procedure | draft, triage | DIST-1 extended to the MCPs, none of which has a tag or release workflow |
| `KI-HARNESS-GOV-141` - auto-bump released `ki` pin | draft, triage | FND-4 stale CI `KI_VERSION` pins; DIST-1 |
| `homebrew-tap` `BREW-011` - register `ki` pin consumers | draft, triage | Pairs with `KI-HARNESS-GOV-141` |
| `ki-website` `KI-WEB-SITE-042` - auto-accept verified tool versions | awaiting-review, now | DIST-1 website release presentation |
| `KI-ARCADIA-ECO-009` - legacy serve fallback evidence | ready, now | OPS-1: per-client MCP binding evidence |
| `KI-HARNESS-GOV-127` - adopt Dependency Cruiser estatewide | in-progress, now | ALIGN-1 pattern of per-repository adoption; lists `mcp-housekeeping-codex` as an adopter, so OAI-1 retirement must update it |
| chezmoi `DOTFILES-UE-028` - tidy retired software remnants | draft, waiting-for | Named in FND-4's roadmap-shape drift set; recheck |
| `KI-ARCADIA-GOV-010` - assess estate tooling commonality | draft, future | Follows completion; feeds EVAL-2 |

`ki-techne-principal` and `ki-plugins` are retired, so phase-spec references to them are moot; Arcadia now owns Techne engineering knowledge. The full phase specifications (purpose, justification, deliverables, completion gates) are in Git at `25be451:+/knowledge-islands-factorisation-roadmap.md`, and the untrimmed original is reachable through `git log -- "+/knowledge-islands-factorisation-roadmap.md"`.

## Decisions made

- The responsibility model, routing map and estate decisions live in `GDR-KI-FUNDAMENTALS-001`.
- Delivered so far: FND-1 (`KI-ARCADIA-GOV-009`), FND-2 (`KI-ARCADIA-ECO-001`), Agora rehoming (`KI-ARCADIA-ECO-002`), MCP and tools backlog dispositions (`KI-ARCADIA-ECO-003`, `ECO-004`), `ki-plugins` retirement (`KI-ARCADIA-ECO-010`), and Techne Principal consolidation and retirement (`KI-ARCADIA-ECO-007`, `ECO-008`). All accepted and pruned.
- Out of scope before V1: estate-wide KIPs, KIS documents, schemas or portable specifications; legacy compatibility, migration, rollback or dual-running; public package registries; treating MCP products as Harness capability; a third "harness" or "principal" base structure; treating repository, worktree or visibility as runtime isolation; replacing decision records solely for vocabulary; making `tools-ki` own MCP behaviour; and making this record a second work tracker.

## Files touched

None beyond this record, which replaces `+/knowledge-islands-factorisation-roadmap.md`.

## Open questions

- Which repository first carries FND-5, given it unblocks MCP-1, OPS-1, DIST-1 and ALIGN-1.
- Whether MCP-4 extracts shared MCP source or settles for conformance only; any extracted source needs an explicit owner and does not default to the Harness, `tools-ki` or `ki-techne-harness`.
- EVAL-2 deferred choices: OpenAI repository visibility, an MCP workspace, Git-ref dependencies, broader consolidation, portable specifications, and the scope of the shared fundamentals projection.

## Next step

Recheck the status table, then use `ki-next` to capture FND-5 as an Arcadia work record. FND-3 (estate structure register) and FND-4 (drift recheck) can be captured alongside it, in their owning repositories, as independent non-blocking work. Before capturing anything, check the related records above so new work does not duplicate them.
