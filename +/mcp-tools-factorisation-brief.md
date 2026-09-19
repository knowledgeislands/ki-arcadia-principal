# Brief: factorisation and packaging of KI tools and MCP servers

Status: open question, captured for triage. Prepared 2026-09-19 to be put to several high-reasoning models independently, then reconciled.

## What we want from you

Assess whether the Knowledge Islands estate has the right factorisation for its command-line tools and its MCP servers, and recommend a target structure. Give a clear recommendation rather than a survey of possibilities. Where you disagree with the framing below, say so directly. The evidence in this brief was gathered by inspection of the working trees, so treat it as reliable but not exhaustive.

## The estate as it stands

Seventeen separate top-level repositories under a single GitHub organisation (`knowledgeislands`), all actively maintained by one person with AI agents.

| Group | Repos | Language | Scale |
| --- | --- | --- | --- |
| CLI tools | `tools-ki`, `tools-mgit`, `tools-rig`, `tools-git-almanac` | 2 TypeScript, 2 shell | 70 to 1219 commits |
| MCP servers | `mcp-m365`, `mcp-gsuite`, `mcp-git-audit`, `mcp-ki-kb-fs`, `mcp-ki-kb-notion-mirror`, `mcp-acquire-whatsapp`, `mcp-housekeeping-claude`, `mcp-housekeeping-chatgpt`, `mcp-housekeeping-codex` | TypeScript (Bun) | 13 to 195 commits |
| Distribution | `homebrew-tap` | Ruby formulae | 4 formulae |
| Governance | `ki-agentic-harness` (skills, hooks), `ki-arcadia-principal` (knowledge base) | Markdown, shell, TS | large |

## How they are actually built and distributed

This matters more than it first appears, and it is the fact that most often gets assumed wrongly.

The MCP servers are **not published anywhere**. Every one of them 404s on the npm registry, no CI workflow contains a publish step, and the runtime launches each server directly from a local build in the working tree, for example `node /Users/.../mcp-m365/dist/mcp-server/index.js` via an MCPorter daemon. There is no distribution step at all: they are built in place and pointed at. Several are marked `private: false` but none has ever been released.

The CLI tools are distributed through Homebrew. Each formula in the tap pins a versioned release tarball for one tool, so each tool needs an independent tag and release. Two of the four tools (`mgit`, `rig`) are single shell scripts with bats tests and no `package.json` at all.

## The observed problem

Nine MCP repositories each carry their own copy of the same scaffolding, and the copies have drifted.

| File | Copies | Distinct contents | Size spread |
| --- | --- | --- | --- |
| `src/utils/audit-log.ts` | 9 | 9 | 175 to 217 lines |
| `src/utils/annotations.ts` | 9 | 8 | 12 to 80 lines |
| `src/utils/access-level.ts` | 9 | 5 | 52 to 64 lines |
| `src/config/index.ts` | 9 | 9 | 63 to 219 lines |

Inspection of the contents shows the variation is mostly not meaningful:

- `access-level.ts` is one implementation in all nine. `levelFromAnnotations` is the same four lines everywhere and `makeAccessGatedRegister` is the same Proxy. The five distinct hashes are reworded doc comments plus one differing import line.
- `audit-log.ts` exports an identical surface in all nine (`AuditConfig`, `AuditEvent`, `appendAuditEvent`, `withAuditLog`). A comment-stripped diff between two of them is 33 lines out of roughly 200, and decomposes into the source of `SERVER_NAME`, the redaction field list, and a log-rotation rename that one inlined.
- `annotations.ts` is a set of constants whose own doc comment states that it is a "canonical preset set across sibling MCPs (each repo exports the subset its tools need)". A shared contract has been declared in prose and then hand-copied nine times.
- `config/index.ts` is genuinely per-server, except for the `AccessLevel` type and `ACCESS_LEVEL_RANK` map that everything else imports.

Two concrete costs are already visible:

1. **A migration stranded.** `mcp-git-audit` has moved to `@modelcontextprotocol/server@2.0.0`; the other eight remain on `@modelcontextprotocol/sdk@^1.30.0`. Duplication did not let them migrate independently, it meant the migration happened once and stopped.
2. **A security control diverging silently.** These specific files are the access gate, the audit trail and the argument redaction. `mcp-housekeeping-claude` redacts eight field names; `mcp-m365` redacts one. Whether or not that gap is deliberate, it is invisible, and a fail-safe fix landing in one copy misses the other eight.

## Why it was built this way

The separation was deliberate. Each server was to be installable and runnable with no upstream dependency and no coupling to anyone else's release cycle. Duplication was accepted as the price of that independence. This is a real and defensible position, not an accident, and any recommendation needs to engage with it rather than dismiss it.

## Constraints any answer must respect

1. **Strong preference against publishing to the public npm registry.** Reasons: publication is effectively irreversible, it is a public global namespace requiring account, tokens and 2FA, it places a third party in the critical path of builds that currently have none, and a public package implies a support posture toward strangers for what is personal infrastructure. Solutions requiring a registry publish step start at a significant disadvantage. Git-ref dependencies, vendoring and workspaces are all available.
2. **One writer per working tree.** The working practice assigns at most one agent or human writer per checkout, because concurrent writers in one tree corrupt each other's test tooling. Seventeen repos means seventeen possible concurrent writers; a monorepo means one, or a permanent worktree discipline.
3. **Per-repo governance is the existing mechanism.** Each repo carries a `.ki.toml` declaring which repo-structure skills govern it (`ki-repo-tools`, `ki-repo-mcp`, `ki-repo-homebrew-tap`, `ki-repo-kb`, and so on), audited by `ki repo audit --repo .`. A single `.ki.toml` cannot currently declare a different primary kind per subdirectory, so consolidation implies reworking the repository contract around subtrees.
4. **Homebrew needs per-tool versioned tarballs.** Each formula pins one tool's release archive. Consolidating the tools implies scoped tags and formulae that download an archive containing unrelated tools.
5. **The harness has already reserved a place for this.** `ki-agentic-harness/mcp/README.md` states the directory is "empty for now" and is "where they would consolidate as Bun workspace packages (`mcp/<name>/`) if the harness takes them in, each conforming to the workspace-MCP standard `ki-repo-mcp` defines". The consolidation question is therefore already staged, not new.
6. **The harness already ships executable code, not only skills.** `ki-agentic-harness/hooks/` contains shell scripts with TypeScript tests, distributed as a harness payload installed by the `ki` CLI. There is precedent for shared executable material living in the harness and being delivered by `ki`.

## Options under consideration

**A. Status quo.** Keep nine independent copies. Zero coupling, zero release ceremony, continued silent drift in a security-relevant surface.

**B. Vendor with drift detection.** One canonical copy (likely in the harness), a `ki` command that syncs it into each repo, and a repo audit check that fails when a copy diverges. No dependency, no install-time resolution, no release cycle; the code stays physically present in each repo exactly as now. Per-server variation (`SERVER_NAME`, redaction fields) becomes injected parameters rather than file edits. Cost: syncing is deliberate, and a local edit becomes a drift signal to be promoted or reverted.

**C. Shared package by git ref.** A `mcp-kit` package consumed as `github:knowledgeislands/mcp-kit#v1.4.2`. True single source, resolvable by Bun and npm with no registry. Cost: reintroduces a release cycle (tag, then bump each consumer), which is the specific ceremony the maintainer wants to avoid.

**D. Consolidate MCP servers into the harness as Bun workspace packages.** The path the harness README already anticipates. Maximum deduplication and a single toolchain. Cost: collides with constraints 2 and 3, and mixes governance material with runtime servers.

**E. Partial consolidation.** Merge only `mcp-housekeeping-{claude,chatgpt,codex}`, which are one product with three adapters (13 to 14 commits each, `access-level.ts` byte-identical across all three), and leave the rest separate.

The tools are a separate question from the MCP servers and probably need a separate answer. They share almost no code: the two TypeScript tools share exactly one source filename (`src/version.ts`) between them, and the two shell tools share only repo scaffolding such as `.editorconfig`, CI workflow and docs skeletons. There is no duplication problem to solve there.

## Questions we would like answered

1. Is the duplication above a problem worth solving at all, given a single maintainer and no external consumers? Argue the case for leaving it alone if that is the right answer.
2. Which of options A to E, or what else, is the right target? Does the answer differ for the security-relevant files (`access-level`, `audit-log`) versus the merely repetitive ones (`annotations`, toolchain config)?
3. If shared code is extracted, where should the canonical copy live: the governance harness (`ki-agentic-harness`, which already distributes hooks via `ki`), a new dedicated repo, or one of the existing tools repos? What principle should decide that?
4. Is "no shared dependency" actually buying independence here, given the evidence that a dependency upgrade stranded after one repo? What would independence have to look like to be real?
5. Does the answer change when the number of MCP servers doubles? Is there a threshold at which the current structure stops working?
6. Is seventeen top-level repositories the right granularity for a one-person estate with AI agents as the primary writers, or is repository count itself the thing to optimise?
7. What are we not asking that we should be?

## What we are trying to achieve

The underlying goal is an estate that one person plus agents can maintain indefinitely without ceremony, where each piece can be understood and changed on its own, where cross-cutting concerns (especially security controls) have exactly one definition, and where nothing depends on a third-party service or an irreversible publication step. Options that optimise one of those at the cost of the others are the failure mode to avoid.
