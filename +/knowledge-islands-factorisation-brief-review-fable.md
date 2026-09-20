# Knowledge Islands factorisation review: Fable 5.1

## Review header

**Model.** Fable 5.1, model identifier `claude-fable-5-1`, running under Claude Code 2.1.267 with a 200k context window. A more precise build string is not exposed to the model and cannot be confirmed from inside the session.

**Review date.** 2026-09-19.

**Independence.** This is an independent recommendation from one reviewer. It is not an adopted decision. It was formed without reading any other reviewer's response or any consolidated synthesis. The brief was read in full; the Phase A evidence dossier at `/tmp/ki-fable/evidence.md` was read in full and treated as inspected evidence; a small number of source files were read directly to check specific points and are listed below.

**Evidence inspected.**

Measured (counts, hashes and file contents taken from working checkouts at HEAD on 2026-09-19, read-only):

- Per-repository inventory for all 21 organisation repositories: tracked files, commit counts, last commit, dirty state, Markdown and TypeScript line counts, `package.json` presence and version, CI workflow files (dossier section 1.1).
- `.ki.toml` declarations for all 21 organisation repositories and for `krisb/dotfiles`: repo codes, visibility, licence, structure skills, adapters, trades, agoras (dossier section 1.2).
- Nine MCP repositories: line counts and sha256 prefixes of `src/utils/audit-log.ts`, `src/utils/annotations.ts`, `src/utils/access-level.ts`, `src/config/index.ts`; the same after stripping comments and whitespace; SDK and zod versions; build and test scripts; test file and test case counts; which repositories carry `access-level.test.ts`, `audit-log.test.ts` and `config/index.test.ts`; annotation preset names exported per repository; audit log default paths and redaction sets; access level environment variable names (dossier section 5).
- `mcp-gsuite/src/utils/access-level.ts` in full (read directly): the annotation-to-level derivation, the fail-safe default to `destructive`, and the Proxy gate on `registerTool`.
- `mcp-housekeeping-claude/src/utils/annotations.ts` lines 1-45 (read directly): the documented canonical preset set and the values of `READ_ONLY`, `DESTRUCTIVE`, `DESTRUCTIVE_ONESHOT`.
- `ki-agentic-harness/skills/repo-structure/ki-repo-mcp/references/rubric.md` item UTIL-1 (read directly): a presence check with a manual review prompt.
- `ki-agentic-harness/mcp/README.md` line 5 (read directly): the Bun workspace consolidation option.
- `ki-agentic-harness/docs/decisions/references/governance-boundary-matrix.md` in full (read directly).
- `GDR-KI-FUNDAMENTALS-001` in full from the Arcadia copy (read directly), plus the dossier's six-copy hash comparison.
- `ADR-TECHNE-003` in full (read directly); `ADR-KI-HARNESS-SKILLS-012` body (read directly).
- `tools-ki` command tree, core module line counts, in-process rubric loading at `src/core/rubric/loader.ts:208`, release packaging and signing, CI `KI_VERSION` pins across the estate (dossier section 6).
- `ki-techne-tools` tracked layout at HEAD and the fact of extensive uncommitted work by another writer (dossier section 7).
- Release mechanisms for `rig`, `mgit`, `git-almanac`, `ki` and the four Homebrew formulae, the tap's `notify-website` dispatch, and the website's `update-tool-release.yml` receiver (dossier sections 8 and 10).
- `ki-plugins` generator location, marketplace manifest, projected skill counts versus harness skill counts, and the timing of the last projection relative to the newest harness skill (dossier section 9).
- `krisb/dotfiles`: `.ki.toml`, Brewfile tap lines, Claude Code hook binding templates, `.chezmoidata/mcp-servers.yaml` registrations by absolute `dist` path, `.chezmoiignore` entries, rendered `.mgit.toml` (dossier section 11).
- Cross-repository drift table: wrong ADR citation in `ki-plugins/README.md`, wrong script name in two places, references to non-existent `mcp-ki-repo-kb*` repositories, `mcp-kb-fs` naming residue, `ki space acquire` references, `.ki-meta` residue, `knowledgeislands.org` in schema identifiers, `KI_VERSION` pin split, live ADR divergences flagged by harness roadmap items, an orphan worktree directory (dossier section 12.1).

Declared (taken from decision records, READMEs and roadmap text rather than from behaviour):

- The six-authority allocation in `GDR-KI-FUNDAMENTALS-001` and its structure diagram.
- `ADR-TECHNE-001` controller and tier model; `ADR-TECHNE-003` implementation ownership.
- Harness ADRs 002, 005, 006, 010, 011, 013, 014, SKILLS-006, SKILLS-007, SKILLS-012, SDR-001, SDR-002, ODR-001, GDR-001 as summarised in the dossier.
- `ki-specifications` lifecycle, KIS and KIP statuses, tooling README, roadmap items RGV-001 and RGV-002.
- Website README claim of vendoring; `docs/guides/guidance-ownership.md` ownership test.
- Agora membership lists (from `.ki.toml` dumps, not from `ki agora show`, which was not run).

Not verified, and treated as such throughout: `ki-plugins` rebuild determinism (a rebuild would write into a repository and was prohibited); the `mcp-acquire-whatsapp` audit log path; `ki-techne-tools` CI (dirty tree); the tenth `ki-fnd` member; whether same-named annotation presets carry identical hint values in all nine MCP repositories; whether `marketplace.json` records the harness commit it was built from; why the `mcp-housekeeping-chatgpt` lockfile carries `@modelcontextprotocol/server@2.0.0`; the exact name of the tap's structure skill and theme.

**Assumptions.**

- The maintainer is one person working with several agents, and that will remain true for the planning horizon of this review. The recommendation is tuned to that, not to a team.
- Constraint 1 (no public registry by default) is treated as binding, not merely a preference.
- Cross-repository work stays choreographed (each repository accepts its own commits) unless a decision record changes that.
- The two repositories with another writer active at capture (`ki-agentic-harness`, `ki-techne-tools`) and the one with uncommitted foreign files (`mcp-housekeeping-chatgpt`) are described at their captured state; their in-flight work is out of scope and not assessed.

**Material uncertainties.**

- The behavioural equivalence of the nine `access-level.ts` copies is inferred from the dossier's normalised diff description and one full read; it is not proven by a test that exercises all nine servers. The recommendation makes such a test the first deliverable precisely because this is uncertain.
- The annotation preset values (the four boolean hints) have been read in one repository only. If any repository exports a same-named preset with different values, that is a behavioural divergence in a security control and changes the migration order (see section 10).
- The dossier does not measure how often the shared MCP files change, so the coordination cost of the present model is stated in artefacts and commits rather than in hours.
- No measurement exists of CI wall-clock time in any repository, so CI cost consequences are stated as counts of jobs and checkouts, not minutes.

## 1. Executive recommendation

**Target operating model.** Keep the estate as a federation of independently accepted repositories, with one explicit rule deciding every boundary, one executable owner for the shared MCP security controls, one behavioural conformance suite that every MCP must pass, and pinned, checked projections. Reduce the repository count by exactly one (merge the two OpenAI-family housekeeping MCPs), and add no new repositories. Restate the six-authority decision so that it separates normative authority from executable ownership and names the two owners it currently leaves implicit: product repositories for executable behaviour, and `krisb/dotfiles` for machine binding state.

**The governing rule for a repository boundary.** A Git repository boundary exists where, and only where, at least one of the following holds:

- R1, release: the content is an independently accepted and released unit with its own consumers and its own version line.
- R2, trust: the content carries a distinct trust class: visibility, licence, credential scope, or personal-data class.
- R3, host mandate: the content is a projection whose consuming host requires a repository at a fixed location and layout.

Authority never creates a repository by itself. Authority is recorded in decision records, may span repositories through shared records, and may subdivide a repository through subtree ownership declared in `.ki.toml`. Where none of R1 to R3 distinguishes two bodies of content, they share a repository, and the burden of proof falls on separation. This rule is applied to all 22 repositories in section 5 and gives the same answer for each of them that the operational evidence gives; where it did not, the rule would be wrong, not the evidence.

**The five most important changes, in order.**

1. Write a behavioural conformance suite for MCP access gating, annotation semantics and audit redaction, owned by `ki-agentic-harness` under `mcp/conformance/`, and run it in every MCP repository's CI against the built server. This must come before any code sharing. Today four of nine MCPs, including the two largest remote-API adapters (`mcp-gsuite`, `mcp-m365`), have no test of the access gate at all. Conformance today is a presence check (`UTIL-1`: the file exists), not a behaviour check.
2. Make `ki-agentic-harness` the executable owner of three SDK-agnostic shared modules (`access-level`, `annotations`, `audit-log`) under `mcp/shared/`, with server policy injected as configuration, materialised into each MCP as pinned regular-file copies by `ki repo conform` (the `ki-repo-mcp` skill), and checked for drift by `ki repo audit`. No package, no registry, no Git-ref dependency, no runtime resolution. This extends the vendoring pattern of `ADR-KI-HARNESS-SKILLS-012` under a new, separate decision, because that ADR explicitly excludes runtime library code.
3. Promote the conformance suite's assertions into `KIS-0003` in `ki-specifications` and take it to Active once all public MCPs pass. This is the first contract in the estate that would have nine real conforming implementations, and it is how Specifications stops being an authority with zero Active contracts.
4. Merge `mcp-housekeeping-codex` into `mcp-housekeeping-chatgpt` and rename the result `mcp-housekeeping-openai`. Keep `mcp-housekeeping-claude` separate. The rule decides this: the two OpenAI-family servers share visibility (private), access profile (read-only, four tools each), runtime support (`chatgpt-codex` only), release state (both `v0.1.0`, neither with CI), and user outcome; the Claude server differs on every one of those axes.
5. Make every projection pinned and checked: the harness CI rebuilds `ki-plugins` and fails on drift; the projection commit records the harness commit it was built from; the website gains a provenance check on page frontmatter; the six copies of `GDR-KI-FUNDAMENTALS-001` keep their byte-identity check with Arcadia named as canonical. Fix the twelve documented drifts listed in section 2.4 as a single low-risk stage.

**What does not change.** Twenty of the twenty-two repositories keep their boundaries. Each MCP keeps building locally with no internal package dependency. Each tool keeps its own tags and Homebrew formula. The Arcadia and Techne knowledge bases stay separate. `ki-plugins` and `homebrew-tap` stay as host-mandated projection and distribution repositories. The harness does not become an MCP monorepo; its `mcp/README.md` consolidation option is retired.

**Why this and not a workspace.** The measured evidence shows the duplication problem is a missing owner and a missing test, not a missing monorepo. The nine `access-level.ts` copies are semantically one implementation in five byte-variants; the nine `audit-log.ts` copies differ mainly in policy (which fields to redact) and configuration (path, rotation), which are legitimately per-server; `config/index.ts` is legitimately per-server apart from two small shared items. A workspace would force a visibility split (three private repositories against six public), would have to absorb `mcp-acquire-whatsapp` (36k lines, 631 tests, its own ADRs, personal data), and would still not give you a conformance test. Vendored shared modules plus a conformance suite fix the actual defect and leave every R1 and R2 boundary intact.

## 2. Facts, assumptions, and uncertainties

### 2.1 Verified facts that drive the recommendation

- The estate has 21 organisation repositories plus `krisb/dotfiles`, all with `.ki.toml` and none with `.ki-config.toml`; every one declares the harness `knowledgeislands/ki-agentic-harness`; none declares `repo_type`.
- Nine MCP repositories exist on disk. The brief's inventory and its duplication table both say nine. The dossier's aside that the brief says eight is not borne out by the brief text; nine is correct in both sources.
- `access-level.ts`: nine copies, five distinct hashes, still five groups after stripping comments and whitespace. The dossier's diff analysis attributes every inter-group difference to import path (SDK v1 versus v2), comment wording, variable naming, or whether the Proxy is returned directly or via a wrapping function. The derivation (`readOnlyHint` true gives `read`; `destructiveHint` true gives `destructive`; both false gives `write`; anything else gives `destructive`) and the rank gate are the same in all nine. The three housekeeping copies are byte-identical. One operator-facing difference exists: `WHATSAPP_ACCESS_LEVEL` versus `MCP_<APP>_ACCESS_LEVEL`.
- `annotations.ts`: nine copies, nine distinct hashes. The brief says eight distinct. The measurement wins. Each repository exports a hand-copied subset of a documented canonical preset set; the subsets differ, and the two twelve-line files (`hk-chatgpt`, `hk-codex`) differ from each other by hash despite the same length.
- `audit-log.ts`: nine copies, nine distinct, 175 to 217 lines. Differences are of three kinds: policy (redaction field sets: `hk-claude` redacts only `content`; `gsuite` redacts ten named fields; `m365` and `git-audit` have their own sets), configuration (default paths, rotation size and keep count, environment override names), and accident (`hk-claude` hard-codes `SERVER_NAME`; `gsuite` imports it from config).
- `config/index.ts`: nine copies, nine distinct, 63 to 413 lines, server-specific apart from the `AccessLevel` type and `ACCESS_LEVEL_RANK` map.
- Test coverage of the controls: `access-level.test.ts` exists in five of nine (whatsapp, git-audit, hk-chatgpt, hk-claude, notion) and is absent from `gsuite` (42 tools), `m365`, `kb-fs` and `hk-codex`. `audit-log.test.ts` is absent only from `hk-codex`.
- The `ki-repo-mcp` rubric item `UTIL-1` checks that `utils/audit-log.ts` "is present as the shared audit-log helper" and attaches a manual review prompt. It is a presence check.
- `mcp-git-audit` is on `@modelcontextprotocol/server@2.0.0`; the other eight are on `@modelcontextprotocol/sdk@^1.30.0`. Seven of those eight carry a declared `dependency_holds` entry pinning zod at 4.4.3 because 4.5.4 and later break SDK 1.30.0 schema types. This is an estate-wide dependency migration in progress with one pilot and seven held repositories.
- Runtime registration: `krisb/dotfiles` registers eight KI MCP servers by absolute `dist/mcp-server/index.js` path under the workspace checkouts; `mcp-housekeeping-codex` is not registered. The `mcporter` daemon and HTTP bridge are launchd agents rendered by chezmoi. Repositories therefore do not isolate anything at runtime; processes, environment variables and the 1Password reference for WhatsApp do.
- `tools-ki` loads harness rubric modules with a dynamic `import()` in-process (`src/core/rubric/loader.ts:208`). Harness code executes with the CLI's privileges. Separate repositories do not separate trust here.
- CI `KI_VERSION` is `v0.4.0` in `tools-ki` and `homebrew-tap` and `v0.3.6` in `ki-specifications`, `tools-mgit`, `tools-git-almanac` and `ki-agentic-harness`. The harness verifies itself against a host version that is one release behind the one it must be compatible with.
- `ki-specifications`: KIS-0001 and KIS-0002 are Draft; `tooling/README.md` says no dedicated tooling exists; the only external consumer of either KIS is `tools-ki` (`src/core/acquire/chatgpt/kep.ts` and its tests) plus one website page; no harness skill or ADR references either KIS; roadmap RGV-001 claims 42 `.ki-meta` files remain while HEAD has zero; the schema `$id` uses `knowledgeislands.org` while every other repository uses `knowledgeislands.info`.
- `ki-plugins`: 832 tracked files, no `package.json`, no CI, no scripts. The last projection commit is 2026-09-19 11:12; the harness skill `ki-housekeeping-granola` is dated 2026-09-19 12:43. The projection is stale relative to its source at the moment of capture. Nine harness skills are deliberately not projected. `SKILL.md` for `ki-repo-plugins` requires byte-for-byte generated output; nothing checks it.
- `ki-website`: README and `GDR-KI-FUNDAMENTALS-001` say it vendors source-labelled material; no vendoring or sync mechanism exists; provenance is carried only by frontmatter `source`, `provenance` and `canonical` fields; the only automation is the tap's `repository_dispatch` that opens a release PR.
- `GDR-KI-FUNDAMENTALS-001` exists in six repositories in two byte-variants that differ only by the `note_type` line; `ki-specifications` roadmap RGV-002 treats the harness copy as the canonical projection and verifies byte identity against it.
- `ki-techne-tools` has 57 tracked files and 7 commits at HEAD, a Python controller (514 lines) and a workspace root; the working tree carried an untracked TypeScript CLI and other changes by a different writer. `packages/bootstrap` is tracked at HEAD and deleted in the working tree.
- `homebrew-tap` carries four formulae (`ki`, `mgit`, `rig`, `git-almanac`), a script that parses formula URLs into tool, repository and version, and a CI job that dispatches `tool-release-published` to `ki-website`. `GDR-KI-FUNDAMENTALS-001` says the tap "implements release transport owned by `tools-ki`"; the tap's own `.ki.toml` imports work from four tool repositories.

### 2.2 Inferences

- The five `access-level.ts` groups are behaviourally equivalent. Basis: the dossier's normalised diff description plus one full read. Not proven by an executed test; that test is deliverable one.
- The audit-log redaction differences are mostly legitimate policy, because the field names being redacted are the field names each server's tools actually emit (`bodyHtml` for mail; `content` for filesystem reads). The hard-coded server name in `hk-claude` is accidental drift.
- `mcp-housekeeping-codex` is not in operational use, because it has no runtime registration in dotfiles and one test file with eight cases.
- The harness is the de facto owner of MCP standards but not of MCP servers: the `mcp/` shelf is empty, `ki-plugins` omits MCPs, and no MCP is a harness member. The claim in `GDR-KI-FUNDAMENTALS-001` that "a capability is a typed published harness member: a skill, agent, MCP server, hook, eval" is not matched by any published MCP.
- The six-authority model is a list of primary repositories with normative roles, not a complete authority model, because it does not name who owns executable behaviour for products (answered separately by `ADR-TECHNE-003` for one product) or who owns machine binding state (answered separately by `ADR-KI-HARNESS-010` and `-014`).

### 2.3 Missing evidence

- No executed test demonstrates that all nine access gates refuse the same registrations at the same level.
- No comparison of annotation preset values across the nine repositories.
- No change-frequency data for the four shared MCP files, so the rate of drift is unknown; only the present amount is known.
- No CI timing data anywhere.
- No record of the harness commit from which the current `ki-plugins` projection was built.
- No `ki agora show` output; membership is from `.ki.toml` declarations.
- No inspection of `ki-techne-tools` beyond HEAD because another writer was active.
- The `mcp-acquire-whatsapp` audit log path and mode wiring beyond the `WHATSAPP_AUDIT_LOG` environment variable.

### 2.4 Contradictions in the evidence and which record wins

| # | Records in conflict | Winner | Basis |
| --- | --- | --- | --- |
| C1 | Brief: `annotations.ts` 8 distinct. Dossier: 9 distinct | Dossier | Measured hashes at HEAD |
| C2 | Dossier aside: brief says 8 MCPs. Brief text: nine | Brief | Brief lists nine and tables nine copies |
| C3 | GDR-FUND-001 and website README: website vendors. Dossier: no mechanism | Dossier | Absence measured; text overstates † |
| C4 | `ki-plugins/README.md` cites ADR-005 for projection | ADR-002 | 002 is the source-versus-projection record |
| C5 | `ki:binding:build-plugin` in README and SKILL.md | `package.json` | The executable script name is `ki:binding:claude:build-plugin` |
| C6 | RGV-001: 42 `.ki-meta` files remain. HEAD: zero | HEAD | Roadmap text is stale |
| C7 | `mcp-kb-fs` in README title, badge, audit path text | Repo and package name | Code writes `mcp-ki-kb-fs` path; README misleads |
| C8 | Harness standard names `mcp-ki-repo-kb-fs`, `mcp-ki-repo-kb-notion-mirror` | Repo names | No such repositories exist |
| C9 | GDR-FUND-001: MCP server is a published harness member | Measured state | Harness publishes MCP standards, not servers ‡ |
| C10 | `ki space acquire` in harness roadmap and SKILLS-007 | `tools-ki` | The command is `ki acquire` |
| C11 | Arcadia `Pillars/Techne` (2 files) versus Techne Principal | GDR-FUND-001 | Dated 2026-09-16, status current, shared by six |
| C12 | GDR-FUND-001: tap transports releases owned by `tools-ki` | Tap `.ki.toml` | Tap serves four tools from four repositories |
| C13 | Schema `$id` on `knowledgeislands.org`; estate uses `.info` | Estate convention | Change at next schema version, not silently § |
| C14 | Canonical copy of GDR-FUND-001: matrix says Arcadia; RGV-002 says harness | Arcadia | Matrix assigns estate policy ¶ |
| C15 | SKILLS-007 and ARCADIA-001 flagged for amendment by harness roadmap | The ADRs | Roadmap items are proposals until superseded |
| C16 | Brief: `ki` exposes work commands. Measured: no `ki work` | Measured | Surfaces are `ki repo roadmap`, `ki trade`, `ki batch` |

† The correct statement is: the website copies selected material with frontmatter provenance and no automated sync. Either build the sync or amend the text; section 7 recommends a provenance check rather than a full vendoring pipeline.

‡ Amend the member list to "skill, agent, hook, eval, MCP standard and shared control" unless and until the harness publishes a server. Section 5 recommends it does not.

§ A schema `$id` is part of the contract; altering it is a versioned change to KIS-0001, not a typo fix. Do it at 1.1.0 or on the Active transition.

¶ The harness may host the byte-identity verifier as a reusable check; that does not make its copy canonical. Record the canonical location in the shared record's own frontmatter.

### 2.5 The brief's 15 questions

Direct answers are given in Appendix A, one per question, with cross-references into the body.

## 3. Target authority and ownership matrix

The matrix separates the five decisions the brief asks reviewers to keep apart. A row names the thing owned, then the normative authority (where the meaning is canonical), the executable owner (who owns behaviour and compatibility), the source repository, the distribution unit, and the runtime or security boundary. Where two columns coincide the coincidence is deliberate and the reason is given in the note.

### 3.1 Concepts and contracts

| Thing owned | Normative authority | Executable owner | Source repo | Distribution | Runtime boundary |
| --- | --- | --- | --- | --- | --- |
| KI philosophy, conceptual model, estate policy | `ki-arcadia-principal` | none (prose) | same | website copy | none |
| Engineering discipline, controller and fabric architecture | `ki-techne-principal` | none (prose) | same | website copy | none |
| Portable contracts: KIS, KIP, schemas, conformance rules | `ki-specifications` | none (prose, schema) | same | schema `$id` URL | none |
| MCP access, annotation, audit contract | `ki-specifications` † | harness | harness `mcp/shared/` | vendored per MCP | each MCP process |
| Capability content: skills, agents, hooks, evals | `ki-agentic-harness` | same | same | harness payload | in `ki` process ‡ |
| Rubric checks and remediation text | `ki-agentic-harness` | `ki-agentic-harness` | same | harness payload | in `ki` process ‡ |
| Shared decision records | `ki-arcadia-principal` | harness (verifier only) | Arcadia canonical, five projections | copies | none |
| Public user-guide prose and routes | `ki-website` | `ki-website` | same | Cloudflare deploy | Cloudflare |

† Until KIS-0003 is Active, the harness standard `standards-mcp-servers.md` is the working authority, and the conformance suite is the executable statement of it. The normative and executable owners are deliberately different repositories: the contract must outlive any one implementation, and Specifications is the only repository whose lifecycle (Draft, Active, Deprecated, Superseded) is designed for that.

‡ Harness code runs in-process inside `ki` (`loader.ts:208`). Executable ownership of the check is the harness; executable ownership of loading, transactions, progress and reporting is `tools-ki`. The runtime boundary is one process and one trust domain, which is why the compatibility contract between the two must be versioned and tested in both CIs (section 6, scenario 3).

### 3.2 Executable behaviour and products

| Thing owned | Normative authority | Executable owner | Source repo | Distribution | Runtime boundary |
| --- | --- | --- | --- | --- | --- |
| `ki` CLI: install, registry, activation, native ops | `tools-ki` † | `tools-ki` | same | signed tarballs, formula | user process, XDG |
| Shared-module materialiser and drift audit | harness (`ki-repo-mcp`) | `tools-ki` | `tools-ki` | with `ki` | user process |
| Controller: admission, leases, retries, evidence | `ki-techne-principal` ‡ | `ki-techne-tools` | same | bootstrap, K8s, AWS | cluster |
| Each MCP's tools, config, redaction policy, confinement | that MCP repo | same | same | local build, dist path | own process and env |
| Multi-repository command runner | `tools-mgit` | `tools-mgit` | same | source tag, tap formula | user process |
| Working-setup catalogue and provider materialisation | `tools-rig` | `tools-rig` | same | source tag, tap formula | user process |
| Git history reporting | `tools-git-almanac` | `tools-git-almanac` | same | release tarball, tap formula | user process |

† `tools-ki` owns the public command grammar and host mechanics. Capability semantics remain with `ki-agentic-harness` (section 3.1).

‡ ADR-TECHNE-001 for the architecture; ADR-TECHNE-003 for implementation ownership by `ki-techne-tools`.

### 3.3 Mutable state

| State | Owner (sole writer) | Where it lives | Checked by |
| --- | --- | --- | --- |
| Repository governance contract (`.ki.toml`) | that repository | repository root | `ki repo audit` |
| Installed harness registry and active payload | `tools-ki` | XDG data and state | `ki manage diag`, `ki manage doctor` |
| Machine binding: MCP registrations, hooks, settings, Brewfile | `krisb/dotfiles` (chezmoi) | chezmoi source and targets | `chezmoi diff` |
| Catalogue intent for a machine | `tools-rig` semantics; dotfiles holds the catalogue files | `~/.config/rig/conf.d` | `rig --dry-run` |
| Provider state (Homebrew cellar, launchd, XDG state dirs) | the provider | provider locations | provider tools |
| MCP audit logs | each MCP process | `~/.local/state/mcp-<name>/audit.jsonl` | conformance suite, rotation test |
| Controller execution journal, leases, job records | `ki-techne-tools` controller | SQLite in cluster | controller tests and proof guide |
| Governed work state (roadmaps, trades, handoffs) | the receiving repository | Git | `ki repo roadmap`, `ki trade` |
| Credentials | machine-local secret authority (1Password, secret files) | outside Git | never copied |

### 3.4 Projections and copies

| Copy | Faithful or lossy | Pinned or floating | Editable | Checked | Target state |
| --- | --- | --- | --- | --- | --- |
| `ki-plugins` | lossy (52 of 60 skills; no MCPs) | floating | prohibited | unchecked | pinned to harness SHA; checked by harness CI diff |
| Website copied pages | lossy (selected) | floating | copies prohibited; guide prose editable | unchecked | provenance check |
| Installed harness (XDG) | faithful | pinned (`active.json`) | prohibited | `ki manage diag` | unchanged |
| GDR-FUND-001 five projections | faithful | unpinned | prohibited | byte identity (RGV-002) | add canonical pointer; keep check |
| MCP shared modules (target) | faithful | pinned (manifest sha256 and harness SHA) | prohibited | `ki repo audit` | new |
| MCP conformance suite (target) | faithful | pinned | prohibited | runs in MCP CI | new |
| SKILLS-012 shared skill modules | faithful | pinned by declaration | prohibited | materialiser | unchanged |
| Rendered `.mgit.toml`, vscode files | generated | pinned to chezmoi source | only in chezmoi source | `chezmoi diff` | unchanged |
| Tap formulae | generated by hand from release URLs | pinned to tag | editable in tap | tap CI installs `ki` | unchanged |

## 4. Target estate map

### 4.1 Directions

```text
NORMATIVE (prose and schema; no executable)
  ki-arcadia-principal --informs--> ki-techne-principal
  ki-arcadia-principal --informs--> ki-agentic-harness, tools-ki, ki-specifications
  ki-techne-principal  --informs--> ki-agentic-harness, tools-ki, ki-techne-tools
  ki-specifications    --constrains (Active KIS only)--> every repo that claims conformance
  ki-agentic-harness, tools-ki, each mcp-* --evidence--> ki-specifications

EXECUTABLE SOURCE
  ki-agentic-harness (skills, agents, hooks, evals, rubric modules, mcp/shared, mcp/conformance)
  tools-ki (ki CLI; loads harness payload in-process; materialises shared modules)
  ki-techne-tools (controller, bootstrap, deploy, adapters)
  mcp-* x8 after merge (each: tools + config + vendored shared modules + vendored conformance)
  tools-mgit, tools-rig, tools-git-almanac

BUILD AND MATERIALISE
  harness mcp/shared/*.ts --ki repo conform--> mcp-*/src/shared/*.ts   (regular files, manifest-pinned)
  harness mcp/conformance --ki repo conform--> mcp-*/test/conformance/ (regular files, manifest-pinned)
  harness skills --build-plugin.ts--> ki-plugins (lossy; records harness SHA)
  each mcp-* --tsc--> dist/mcp-server/index.js (local only)
  tools-ki --bun build --compile--> signed per-target tarballs
  tools-git-almanac --bun build--> tarball + SHA256SUMS
  tools-mgit, tools-rig --tag--> source archive

DISTRIBUTION AND INSTALLATION
  tools-ki, mgit, rig, git-almanac --release--> homebrew-tap formulae --brew--> machine
  homebrew-tap --repository_dispatch--> ki-website (release PR)
  tools-ki install.sh --> ~/.local/bin/ki (link mode on this machine)
  ki harness install --> XDG registry (installed harness payload)
  mcp-* --no distribution unit--> run from checkout dist path (see reverser T3 in section 10)

BINDING AND RUNTIME
  krisb/dotfiles (chezmoi) --sole writer--> Claude settings, hooks, mcp-servers.yaml, launchd, Brewfile
  mcporter daemon (launchd) --spawns--> each mcp-* process with its own env and access level
  ki-techne-tools controller --spawns--> K8s Jobs (workload pods receive no tokens)
  Jobs --invoke--> ki, mgit inside task environments; results --commits--> Git

PUBLICATION
  arcadia, techne, harness, specs, tools-ki --selected copies with provenance--> ki-website --deploy--> Cloudflare

FEEDBACK
  mcp-* CI conformance results --evidence--> KIS-0003 Draft-to-Active decision
  ki repo audit drift findings --> harness roadmap (owner of shared modules)
  harness CI ki-plugins diff --> harness (rebuild and commit projection)
  ki manage doctor --> user; ADR-014 routes proposals back to Git, never silently
```

### 4.2 What the map deliberately does not contain

- No runtime dependency resolution between KI repositories. Every executable builds from its own checkout plus public third-party packages.
- No package published to any registry. The tap consumes GitHub release assets and source archives.
- No repository that is authoritative for something it does not build. `ki-plugins` and the website carry copies with recorded provenance.
- No second writer for machine binding state. `ki bootstrap` does not register hooks or MCP servers (ADR-KI-HARNESS-010); rig does not write provider state; chezmoi does both.

## 5. Repository-by-repository disposition

Each entry applies the rule from section 1 (R1 release, R2 trust, R3 host mandate), states the disposition, and gives the operational consequence. Twenty-two entries, none omitted.

### 5.1 `ki-arcadia-principal`: keep

Rule: R1. An independently accepted knowledge base with its own change acceptance, published to the website. Trust class public MIT.

Consequence: no change to boundary. Required edits: mark `Pillars/Techne` (2 files) as historical with a pointer to `ki-techne-principal` (C11); add a `canonical: true` marker to its copy of `GDR-KI-FUNDAMENTALS-001` and record that the other five are projections (C14); author the superseding fundamentals record (Appendix B). The toolchain files present in a repository with zero application code (biome, knip, commitlint, husky, mise) are a cost but not a factorisation question; leave them.

### 5.2 `ki-techne-principal`: keep

Rule: R1. A separate knowledge package (`manifest.yaml`, `knowledge_package: true`) with its own decision series and its own consumers (`ki-techne-tools`, `tools-ki`). Splitting it from Arcadia is decided (GDR-FUND-001, ADR-TECHNE-003) and the evidence supports the split: 21 engineering-practice notes and three ADRs that no philosophy reader needs.

Consequence: no change. It remains the normative owner of the controller architecture; it must not acquire runnable code again (ADR-TECHNE-003 already moved it out).

### 5.3 `ki-specifications`: keep, and give it something to govern

Rule: R1. A versioned contract repository with a designed lifecycle. Its distinctness is not in doubt; its effectiveness is. Today it has two Draft KIS, one consumer, no tooling, a stale roadmap claim (C6), a CI pin one release behind, and a schema host that no other repository uses (C13).

Consequence: keep the boundary and make it real. KIS-0003 (MCP access, annotation and audit contract) becomes its first contract with nine implementations and an executable conformance suite. Fix RGV-001, pin CI to `v0.4.0`, decide the `$id` host at the next schema version. Merging Specifications into Arcadia was considered and rejected: a knowledge base has no Draft-to-Active lifecycle and the matrix's boundary test ("constrains every implementation claiming conformance") is a different kind of authority from philosophy.

### 5.4 `ki-agentic-harness`: keep, widen executable ownership explicitly, retire the workspace option

Rule: R1. The harness payload is an independently installed unit (XDG registry, `active.json`) with its own consumers (`ki`, every repository's `.ki.toml`).

Consequence: add `mcp/shared/` (three SDK-agnostic modules plus `manifest.toml`) and `mcp/conformance/` (vitest suite driving a built server through an MCP client), governed by a new decision (ADR-KI-HARNESS-MCP-001, Appendix B) that is explicitly separate from SKILLS-012. Rewrite `mcp/README.md` to retire the Bun workspace consolidation option (line 5). Amend SDR-KI-HARNESS-001 to say that shared MCP controls and their conformance suite are within scope and MCP servers are not. Fix `mcp-ki-repo-kb*` references (C8), `ki space acquire` (C10), and the `ki:binding:build-plugin` script name in `ki-repo-plugins/SKILL.md` (C5). Pin CI to `v0.4.0`. Add a CI job that rebuilds `ki-plugins` and fails on diff.

### 5.5 `tools-ki`: keep

Rule: R1 (29 tags, signed per-target tarballs, formula, `install.sh`). Public MIT.

Consequence: no boundary change. Implementation work: extend the shared-module materialiser so that `ki repo conform` under `ki-repo-mcp` can place `mcp/shared` modules and the conformance suite into an MCP repository at `src/shared/` and `test/conformance/`, recording the harness SHA and sha256 in a manifest, and `ki repo audit` reports drift. This is host mechanics, which is exactly what `tools-ki` owns. `tools-ki` does not own the module contents or the conformance assertions.

### 5.6 `ki-website`: keep

Rule: R1 (independent Cloudflare deployment on its own cadence, triggered by tap dispatch) and R3 (a static site host wants one repository).

Consequence: keep. Replace the unsubstantiated "vendors" claim (C3) with a provenance check: a script that reads every page's `source` and `canonical` frontmatter and fails the build if the referenced path does not exist in the named repository at the named commit. This is cheaper than a vendoring pipeline and gives the property the GDR actually wants (attributable copies). Guide prose remains editable in the website under the existing ownership test.

### 5.7 `ki-techne-tools`: keep

Rule: R1 (bootstrap script, K8s and AWS manifests, its own proof guide) and R2 (cluster and AWS credentials, controller service accounts). Decided by ADR-TECHNE-003 two days before this review.

Consequence: keep as the product monorepo. It is the estate's only workspace root, which is fine: workspace is a source-organisation choice inside one R1 unit. Not assessed further because another writer had extensive uncommitted work. Two items to check when the tree is quiet: `packages/bootstrap` is tracked at HEAD and deleted in the working tree, and no CI workflow was seen.

### 5.8 `tools-mgit`: keep

Rule: R1 (17 tags, `v0.13.0`, tap formula from source archive, `curl | bash` installer).

Consequence: keep. It is a general utility (a bash multi-repo runner) with estate-aware options (`--agora`, `--estate`, `--filter`) and is the operational instrument for choreographed cross-repository change (section 6 scenarios 2 and 7). Keep it in `ki-fnd`: foundational operationally, general semantically. Pin CI to `v0.4.0`.

### 5.9 `tools-rig`: keep

Rule: R1 (two tags in two days, tap formula, its own installer). Four dirty files at capture; not assessed.

Consequence: keep. It owns catalogue semantics and provider materialisation and explicitly defers state to Homebrew and chezmoi, which is the correct single-writer answer for bootstrap (section 3.3). `ki-fnd` membership is justified because a machine's KI tooling is declared through it. It is not an estate authority.

### 5.10 `tools-git-almanac`: keep

Rule: R1 (release workflow with tarball and SHA256SUMS, formula, installer with manifest verification).

Consequence: keep. Correctly in `ki-all` only; it is a general tool that happens to be delivered through the tap. Pin CI to `v0.4.0`.

### 5.11 `homebrew-tap`: keep

Rule: R3. Homebrew requires a tap repository named `homebrew-*` with formulae at a fixed layout. It cannot merge into anything without breaking `brew tap knowledgeislands/tap`.

Consequence: keep. Amend GDR-FUND-001's description (C12): the tap transports releases of four tools owned by four repositories. Its dispatch to the website is the estate's only automated cross-repository feedback edge and is a model for the drift reports proposed elsewhere. Verify the structure skill name (NOT VERIFIED in dossier).

### 5.12 `ki-plugins`: keep as a generated, pinned, checked projection

Rule: R3. The Claude and Cowork marketplace needs a repository whose root holds `.claude-plugin/marketplace.json`; the harness root cannot serve that without taking on a second layout contract.

Consequence: keep; nobody edits it by hand; the harness CI rebuilds it on every harness commit and fails on drift; each projection commit message records the harness SHA; `marketplace.json` gains a `source_commit` field if the generator does not already emit one (NOT VERIFIED). Fix the ADR citation (C4) and script name (C5). Archiving it and serving plugins from a harness branch was rejected: it would put a second root layout on the harness and would not remove the need for a fixed URL.

### 5.13 `mcp-m365`: keep

Rule: R1 (own version `v0.9.0`, own runtime registration) and R2 (Microsoft Graph credentials, mail bodies in audit scope). Public.

Consequence: keep. Receives vendored shared modules and the conformance suite. Its redaction set stays its own policy, declared in config. Gains an access-gate test for the first time.

### 5.14 `mcp-gsuite`: keep

Rule: R1 and R2 (Google credentials; 42 tools including remote destructive presets). Public.

Consequence: keep. Same as m365. Gains an access-gate test for the first time.

### 5.15 `mcp-git-audit`: keep

Rule: R1 and R2 (can mutate remotes: `WRITE_IDEMPOTENT_REMOTE`, `DESTRUCTIVE_REMOTE`). Public. The SDK v2 pilot.

Consequence: keep. Because the shared modules are SDK-agnostic (structural types for annotations and `registerTool`), it can vendor the same modules as the SDK v1 repositories; the only per-repository line is the import of the server type, which moves into a one-line local adapter. It becomes the proof that the shared modules work on both SDK majors.

### 5.16 `mcp-ki-kb-fs`: keep

Rule: R1 and R2 (path-confined access to knowledge bases including private ones; the private KB list lives in the dotfiles registration, not in the repository). Public.

Consequence: keep. Fix the `mcp-kb-fs` residue in README title, CI badge and documented audit path (C7); the documented path is wrong and operators will look in the wrong directory. Gains an access-gate test for the first time.

### 5.17 `mcp-ki-kb-notion-mirror`: keep

Rule: R1 and R2 (Notion credentials; writes URLs back into source notes). Public.

Consequence: keep. Receives vendored modules and conformance suite. Its `READ_ONLY_REMOTE` and `WRITE_REMOTE_IDEMPOTENT` presets must map onto the canonical set; the conformance suite will show whether its preset values agree with the others (uncertainty in section 2.3).

### 5.18 `mcp-acquire-whatsapp`: keep

Rule: R2 decisively (private, UNLICENSED, personal message data, 1Password-referenced auth key, its own ADR series including a fail-safe decision) and R1 (36k lines, 631 tests). It has no `ki-trades` table and is the only MCP with `ki-engineering`, `ki-decision-records`, `ki-specs` and `ki-guides` structure skills.

Consequence: keep. It is the strongest argument against any MCP workspace: its trust class and size would dominate one. It receives the shared modules and suite like the others; its `WHATSAPP_ACCESS_LEVEL` variable should gain the `MCP_WHATSAPP_ACCESS_LEVEL` alias with a deprecation note, decided by its own ADR series, not imposed.

### 5.19 `mcp-housekeeping-claude`: keep

Rule: R1 (`v0.9.0`, 193 commits, 315 tests, CI) and R2 (public; 42 tools including `DESTRUCTIVE` and `DESTRUCTIVE_ONESHOT` legacy housekeeping operations).

Consequence: keep separate from the other housekeeping servers. Fix the hard-coded `SERVER_NAME` by taking it from injected config when the shared audit module lands. The legacy destructive operations are its own product decision; the conformance suite will verify they are gated at `destructive` and absent at the default `read` level.

### 5.20 `mcp-housekeeping-chatgpt`: merge target; rename to `mcp-housekeeping-openai`

Rule: no R1, R2 or R3 distinction from `mcp-housekeeping-codex`. Both are private, read-only, four tools, `v0.1.0`, no CI, `supported_runtimes ["chatgpt-codex"]`, both inspect local state of OpenAI products, both have the byte-identical `access-level.ts`. The user outcome ("what is on my machine from OpenAI products") is one question.

Consequence: this repository survives as the merge target because it is registered in dotfiles and the codex server is not. Codex tools join as a second tool group. The repository is renamed `mcp-housekeeping-openai` (GitHub redirects the old name; the dotfiles registration path changes on one line). Result: one CI to add instead of two, one vendored control set instead of two, and codex gets a runtime registration it currently lacks. Precondition: the ten uncommitted foreign files must land first; the merge is not to be started while another writer is in the tree.

### 5.21 `mcp-housekeeping-codex`: merge into `mcp-housekeeping-openai`, then archive

Rule: as 5.20.

Consequence: history is preserved by merging with `--allow-unrelated-histories` under a path prefix (or `git subtree add`), so every codex commit remains reachable in the merged repository (Constraint 6). The old repository is archived on GitHub, not deleted, with a README pointer. Nothing installed refers to it (no dotfiles registration), so no stale installed state is left.

### 5.22 `krisb/dotfiles`: keep, external, and name its authority

Rule: R2 (private, UNLICENSED, secret references, personal machine state) and it is outside the organisation by design: it contains 293 files of which the KI-related part is a minority (42 files match KI terms).

Consequence: keep external. Classify it in the superseding fundamentals record as the sole writer of machine binding state (MCP registrations, hook bindings, managed settings, launchd, Brewfile, rendered `.mgit.toml`) and as an external consumer of every KI payload, never a semantic source. That classification already follows from ADR-KI-HARNESS-010 and ADR-KI-HARNESS-014; the fundamentals record should say it. Check whether the three `.chezmoiignore` entries for files that do not exist are stale (NOT VERIFIED).

### 5.23 Summary

| Disposition | Repositories |
| --- | --- |
| Keep: primary (6) | arcadia, techne-principal, specifications, harness, tools-ki, website |
| Keep: products and distribution (6) | techne-tools, mgit, rig, git-almanac, tap, ki-plugins |
| Keep: MCPs and external (8) | m365, gsuite, git-audit, kb-fs, notion-mirror, whatsapp, hk-claude, dotfiles |
| Merge target, rename (1) | hk-chatgpt becomes `mcp-housekeeping-openai` |
| Merge then archive (1) | hk-codex |
| Split | none |
| Move | none |
| Generate | ki-plugins stays generated; nothing new is generated |
| New repositories | none |

Estate count moves from 22 to 21.

## 6. Worked scenarios

Each scenario is traced through the target structure. For each: the authoritative edit, generated output, implementation change, test, release or install effect, approval boundary, and rollback point. Where a scenario touches many repositories, the trace says whether that is separation of authority or coordination overhead.

### Scenario 1: add a new acquisition provider and import its faithful source material into a knowledge base

- Authoritative edit: none in Arcadia unless the provider introduces a new lifecycle concept; `ADR-KI-ARCADIA-001` already governs provider-neutral acquisition. If the harness roadmap item OPS-006's proposed correction to that ADR is needed, Arcadia accepts it first (C15).
- Implementation change: a new repository `mcp-acquire-<provider>` created by `ki repo init` with `ki-repo-mcp`; `ki repo conform` materialises `src/shared/{access-level,annotations,audit-log}.ts` and `test/conformance/`; the provider's read and checkpoint tools are written with `READ_ONLY` and `READ_ONLY_ONESHOT` presets and a declared redaction set in `src/config/index.ts`. A skill in the harness (`ki-acquire-<provider>`) declares the procedure with `ki-acquire-*` frontmatter that `tools-ki` reads. Repository-context import is `ki acquire import` in `tools-ki`; if the provider needs a new import shape, that is a `tools-ki` change under `src/core/acquire/`.
- Generated output: the harness skill is projected into `ki-plugins` by the harness CI rebuild; the MCP is not projected (MCPs are omitted from the marketplace).
- Test: the vendored conformance suite must pass in the new repository's CI (gate refuses non-read tools at default level; audit events redact declared fields); provider-specific tests are the repository's own.
- Release or install effect: the MCP is registered in dotfiles `mcp-servers.yaml` by absolute dist path (one chezmoi commit); the harness payload version bumps so `ki harness install` picks up the new skill.
- Approval boundary: three repositories accept commits (new MCP, harness, dotfiles), plus `tools-ki` only if import mechanics change. This is separation of authority: the procedure (harness), the faithful adapter (MCP), and the binding (dotfiles) are owned by different things for good reasons. The `tools-ki` edit, when needed, is coordination overhead that the acquisition contract (`ki-acquire-*` frontmatter) is designed to minimise.
- Rollback: unregister in dotfiles (one line), archive the repository, remove the skill; nothing else refers to it.

### Scenario 2: change an access-control or audit-redaction invariant used by every MCP

- Authoritative edit: if the change alters what the levels mean, what unannotated tools default to, or which event fields are mandatory, it is a KIS-0003 change in `ki-specifications` (Draft revision or a new minor version once Active). If it alters only the implementation (a bug fix that preserves the contract), no Specifications edit.
- Implementation change: one edit in `ki-agentic-harness/mcp/shared/<module>.ts` and its unit test; the conformance suite gains or changes an assertion; `manifest.toml` version and sha256 update.
- Generated output: nothing generated in the harness; each MCP receives a new vendored copy.
- Test: harness unit tests for the module; then in each MCP, `ki repo conform` updates the copies, the repository's CI runs the vendored conformance suite against the built server. Byte identity of the copy is checked by `ki repo audit`; correctness is checked by the suite. These are different checks and both are needed.
- Release or install effect: nine (eight after merge) MCP commits, run with `mgit -a ki-mcps -- ki repo conform && bun test`. Each MCP's `dist` is rebuilt on next start; no release artefact exists for MCPs, so the change is live on the next daemon restart per server.
- Approval boundary: one semantic review (harness commit) and eight mechanical reviews (each MCP diff should be exactly the materialised change plus any config adaptation). Eight commits is the honest cost of eight source units; it is coordination overhead that is made cheap by making it mechanical, not eliminated. The count of commits does not fall compared with today; what falls is the number of distinct diffs a reviewer must read (from nine to one) and what rises is the assurance (a behavioural test where four repositories had none).
- Rollback: per MCP, revert the materialisation commit; the copy is a regular file and nothing else depends on it. Estate-wide, revert the harness commit and re-run conform. A partially rolled-out change is visible in `ki repo audit` as drift against the harness manifest.

### Scenario 3: add a runtime adapter for an existing harness capability without changing its portable semantics

- Authoritative edit: none in Specifications or Arcadia. The harness's `ki-<concern>-<runtime>` adapter pattern (governance matrix, row 4) owns the runtime delta.
- Implementation change: a new adapter skill in the harness (for example `ki-binding-<runtime>`) whose frontmatter declares `ki-supported-runtimes` and whose scripts emit the runtime's native configuration. If the runtime needs a new host mechanic (a new file location, a new registry entry), that is a `tools-ki` change and a compatibility contract bump: the harness declares a minimum `ki` version and `tools-ki` declares the harness contract version it supports.
- Generated output: `ki-plugins` if the runtime is Claude-family; otherwise none.
- Test: harness eval for the adapter; `tools-ki` CI runs against the current harness release (pin `v0.4.0` today, then whatever is current); harness CI runs against the current `ki` release. Both directions, because the rubric modules execute in-process and a mismatch fails at load time in the user's shell.
- Release or install effect: harness payload version bump; `ki harness install` on each machine; binding into the user environment is a dotfiles change if the runtime needs settings written (chezmoi remains sole writer).
- Approval boundary: harness only, unless host mechanics change (then `tools-ki`), unless bindings change (then dotfiles). Three boundaries, each owning a different thing. This is separation of authority.
- Rollback: `ki harness reinstall` at the previous payload; the registry keeps verified installs.

### Scenario 4: promote implementation evidence into a revised portable contract, including the Draft-to-Active path

Traced with KIS-0003 as the concrete case.

- Authoritative edit: `ki-specifications` creates `KIP-000003` (proposal) citing the harness conformance suite as evidence and listing the nine implementations; `KIS-0003` Draft 0.1.0 states the invariants in MUST language: level derivation, fail-safe default, rank gate, the preset value table, audit event fields, mandatory redaction declaration, path convention under XDG state.
- Implementation change: none required for Draft. For Active: the conformance suite in the harness is declared the reference conformance test for KIS-0003, and each MCP's CI publishes a pass result (a badge or a JSON report committed to `reports/`, the namespace ADR-KI-HARNESS-013 already reserves).
- Generated output: website page under `/specifications/` copied with provenance.
- Test: Active requires a measurable threshold. Proposed: all public MCPs pass the reference suite on the current harness manifest; private ones report status but do not block. That threshold is a policy choice for the maintainer; the review's recommendation is "all public" because private repositories cannot be seen by anyone who reads the Active claim.
- Release or install effect: none. A KIS does not ship.
- Approval boundary: Specifications accepts the promotion; the harness accepts the designation of its suite as reference; each MCP accepts its own conformance report. Three kinds of acceptance, each honest.
- Rollback: KIS status back to Draft; nothing installed changes. The lifecycle already provides Deprecated and Superseded for later.

### Scenario 5: run controller work unattended with isolated credentials, retries, leases, evidence, and cleanup

- Authoritative edit: `ki-techne-principal` if any invariant changes (ADR-TECHNE-001 already defines the unattended isolated tier and that workload pods receive no tokens). Otherwise none.
- Implementation change: `ki-techne-tools` controller (admission, work identity, lease and retry in the SQLite journal, Job creation, result integration, cleanup). Task environments invoke `ki` and `mgit` from inside the pod; `tools-ki` does not change unless the task needs a new `ki` command.
- Generated output: Kubernetes Job manifests from the controller; execution evidence written to the journal and to Git as commits on the receiving repository (Git is authoritative work state; the journal is authoritative execution state).
- Test: controller tests (`test_controller.py`) and the proof guide's checklist; `deploy/kubernetes/execution/job.example.json` as the fixture.
- Release or install effect: controller deployment (single-replica Recreate) via the bootstrap script; credentials delivered to the runtime store by bootstrap, never through Git or through `ki`.
- Approval boundary: `ki-techne-tools` alone for implementation; the receiving repository for the work result (choreography: the controller proposes a commit, the repository's own checks accept it). `tools-ki` is not on the path unless a command is missing. The boundary between `ki` and the controller is: `ki` reads and writes repository-scope work state and trade routing; the controller owns execution state and supervision. If `ki` ever supervises a process, that is a breach.
- Rollback: lease expiry and cleanup are the controller's responsibility; a failed job leaves evidence in the journal and no commit in Git. Controller version rollback is a redeploy of the previous image.

### Scenario 6: publish a revised Knowledge Islands concept to the website and update any host projections

- Authoritative edit: the concept note in `ki-arcadia-principal`. If the concept changes a cross-repository rule, the shared record is revised in Arcadia and re-projected to the five copies with the byte-identity check.
- Implementation change: none in code. If a harness skill's guidance quotes the concept, the skill is updated in the harness.
- Generated output: the website page (a copy with frontmatter `source` and `canonical` pointing at the Arcadia path and commit) and, if a skill changed, `ki-plugins` via the harness CI rebuild.
- Test: website provenance check passes; harness `ki-plugins` diff job passes; shared-record byte-identity check passes if a shared record moved.
- Release or install effect: Cloudflare deploy on website merge; harness payload bump only if a skill changed; `ki harness install` on machines that want the new guidance.
- Approval boundary: Arcadia for meaning; website for presentation; harness for any capability text. Three repositories, three kinds of ownership; this is separation of authority. Today's estate performs this scenario with two of the three checks missing.
- Rollback: revert the website page; the source remains; a stale page is detectable because its `canonical` commit no longer matches HEAD of the source path (the provenance check can warn on this without failing).

### Scenario 7: change a tool's release shape while preserving Homebrew installation and rollback

Traced with `tools-mgit` moving from a source-archive formula to a built asset, since that is the most likely change.

- Authoritative edit: none. Release shape is executable ownership of the tool repository; `PDR-KI-TOOLS-001` in `tools-ki` is the precedent for installer version pinning and should be cited rather than copied.
- Implementation change: `tools-mgit` gains a `release.yml` producing `mgit-vX.tar.gz` plus `SHA256SUMS` on the tag (the `tools-git-almanac` workflow is the template). The formula in `homebrew-tap` changes its `url` and `sha256` to the release asset. The website's `tools.json5` is updated by the existing dispatch PR.
- Generated output: release assets on GitHub; the tap's `website-release-events.rb` already parses formula URLs into tool, repository and version, so the dispatch continues to work as long as the URL still names the tag.
- Test: tap CI installs `ki` and runs `ki manage diag`; a formula audit (`brew audit --strict`) should be added to the tap CI for the changed formula if not present (NOT VERIFIED).
- Release or install effect: `brew upgrade mgit` on machines; `rig` catalogue entries that use `install.locator = "knowledgeislands/tap/mgit"` are unaffected because the locator names the formula, not the URL.
- Approval boundary: `tools-mgit` (release), `homebrew-tap` (formula), `ki-website` (auto PR). Two human acceptances and one bot PR. The tap and the tool are separate R1 and R3 units; this is not overhead, it is the distribution unit being distinct from the source unit (Constraint 4).
- Rollback: `brew install mgit@<previous>` is not available in a tap without versioned formulae; rollback is reverting the formula commit and `brew reinstall`. Previous release assets remain on GitHub. If versioned rollback matters, add `mgit@0.13` style formulae; that is a tap policy decision the dossier does not force.

### Scenario 8: retire a provider or projection without losing source history or leaving stale installed state

Traced with `mcp-housekeeping-codex` (the merge in section 5.21) and with `ki-plugins` (hypothetical retirement).

- Authoritative edit: a decision record in the retiring repository (or its home) stating the successor; the fundamentals record's inventory if it names the repository.
- Implementation change: for codex, merge history under a prefix into `mcp-housekeeping-openai`, archive the old repository, update Agora membership in the harness `.ki.toml` (ki-mcps, ki-all), update `mgit` group data in dotfiles. For `ki-plugins`, delete the marketplace entry from any host that lists it, archive the repository, remove the harness CI rebuild job, and record in the harness that no Claude marketplace projection exists.
- Generated output: none for codex; for `ki-plugins`, none after retirement.
- Test: `ki agora audit` shows no dangling member; `chezmoi diff` shows the registration removal; for codex nothing was registered.
- Release or install effect: codex had no installed state; for `ki-plugins`, users with the marketplace installed keep a stale local copy until they remove it, which is the host's behaviour and cannot be fixed from the estate side other than by a final projection commit whose README says "retired".
- Approval boundary: the retiring repository's owner, the Agora home (harness `.ki.toml`), and dotfiles. Three acceptances, all mechanical.
- Rollback: unarchive on GitHub; restore Agora membership; for a merged repository the history is intact in both places.

### 6.1 Reading across the scenarios

Scenarios 2 and 7 are the ones that touch many repositories. In scenario 2 the count of commits equals the count of MCP source units and cannot be reduced without merging source units, which the rule forbids on R1 and R2 grounds; the recommendation makes those commits mechanical and verifiable instead. In scenario 7 the multiple acceptances are the distribution unit being distinct from the source unit, which Constraint 4 accepts. Scenarios 1, 3 and 6 each touch three repositories owning three different things; that is the separation the brief asks for. Scenario 5 confirms the `ki` and controller boundary holds with `tools-ki` off the path. Scenario 4 is the one the present estate has never executed and the recommendation makes it the first thing Specifications does.

## 7. Migration

### 7.1 Ordered stages

Each stage is independently valuable, independently reversible, and leaves the estate working if the next stage never happens. Stages run on `main` in each repository (the maintainer's current practice), one writer per checkout, with `mgit` for fan-out.

**Stage 0: measure before moving (no source change).**

- Write and run a drift report script (in the harness under `mcp/conformance/scripts/`) that hashes the four files across the nine MCP checkouts, diffs the annotation preset values by name, lists access-level environment variable names, and lists audit paths and redaction sets. Commit the report to the harness `reports/` namespace.
- Outcome: the uncertainty in section 2.3 about preset values is closed. If any same-named preset differs in value, stage 2 must fix the divergent repository before stage 3 vendors anything.
- Checkpoint: a dated report. Rollback: none needed.

**Stage 1: fix documented drift (twelve edits, ten repositories, no behaviour change).**

- C4 and C5 in `ki-plugins/README.md`; C5 in harness `ki-repo-plugins/SKILL.md`; C8 and C10 in harness standards and roadmap text; C7 in `mcp-ki-kb-fs` README and badge; C6 in Specifications RGV-001; `KI_VERSION` to `v0.4.0` in four CI files; C11 historical marker in Arcadia; C12 wording queued for the superseding fundamentals record; the orphan `worktrees/ki-agentic-harness/solid-peony` directory removed from disk (not a repository change).
- Checkpoint: each is one commit in one repository. Rollback: revert the commit.

**Stage 2: conformance suite before sharing.**

- In the harness: `mcp/conformance/` vitest suite that starts a built server from a path argument through an MCP client and asserts: at `ACCESS_LEVEL=read` no tool with a non-read preset is listed; an unannotated tool is not listed at `read`; at `write`, `write` tools appear and `destructive` do not; an audit event is written with the declared redaction applied and no declared secret field present; preset values match the canonical table; the audit file rotates at the configured size. Keep it SDK-agnostic by talking over stdio to the built server.
- In each MCP: a CI step that checks out the harness at a pinned SHA (`actions/checkout` with `repository` and `ref`) and runs the suite against `dist/mcp-server/index.js`. This is a temporary form; stage 3 replaces it with a vendored copy so that no MCP CI depends on a second checkout. It is used here because it gives evidence fastest.
- Add `access-level.test.ts` to the four repositories that lack it, as a unit test independent of the suite.
- Checkpoint: nine CI results. Any failure is a real finding about the present estate, not about the migration. Rollback: remove the CI step.

**Stage 3: shared modules and materialiser.**

- Harness: `mcp/shared/access-level.ts` (structural types; no SDK import; exports `AccessLevel`, `ACCESS_LEVEL_RANK`, `levelFromAnnotations`, `makeAccessGatedRegister`), `mcp/shared/annotations.ts` (the full canonical preset table, all names), `mcp/shared/audit-log.ts` (event shape, modes, rotation, redaction mechanism; takes `{serverName, redactFields, path, maxBytes, keep}` as an injected policy object). `mcp/shared/manifest.toml` with module versions and sha256. Decision record ADR-KI-HARNESS-MCP-001.
- `tools-ki`: `ki repo conform` under `ki-repo-mcp` materialises the three modules to `src/shared/` and the suite to `test/conformance/`, writing `src/shared/manifest.toml` with harness SHA and hashes; `ki repo audit` reports drift. `UTIL-1` becomes a hash-and-manifest check with the conformance run as evidence; the manual review prompt stays.
- MCPs, one at a time, starting with `mcp-git-audit` (SDK v2, proves SDK-agnosticism) and `mcp-housekeeping-claude` (hard-coded server name, proves policy injection): run conform; delete the old `src/utils/{access-level,annotations,audit-log}.ts`; adapt imports; move the redaction set and server name into config; keep `config/index.ts` otherwise; run unit tests and the vendored suite; commit. Then the remaining seven.
- Checkpoint: after each MCP, `ki repo audit` clean and CI green. Rollback: revert that MCP's commit; the harness modules stay; other MCPs are unaffected. A half-migrated estate is a normal state visible in audit output, not a broken one.

**Stage 4: KIS-0003.**

- KIP-000003 and KIS-0003 Draft in Specifications, written from the suite's assertions. Active when all public MCPs pass on the current manifest (section 6, scenario 4).
- Checkpoint: Draft published. Rollback: status change only.

**Stage 5: housekeeping merge.**

- Wait for the foreign uncommitted work in `mcp-housekeeping-chatgpt` to land. Merge codex history under `src/codex/` (or a path the maintainer prefers) with history preserved; unify the server entry point with two tool groups; rename to `mcp-housekeeping-openai`; run conform, tests and suite; add CI (the repository had none). Update harness Agora membership, dotfiles registration path, dotfiles `mgit` group data. Archive `mcp-housekeeping-codex` with a pointer.
- Checkpoint: merged repository green; old repository archived. Rollback: unarchive; revert the harness and dotfiles membership commits; the merged repository can be kept or deleted (its history is a superset).

**Stage 6: projections pinned and checked.**

- Harness CI job: build the plugin projection to a temporary directory and diff against `ki-plugins` HEAD; fail on difference; projection commits record the harness SHA. Website: provenance check script and CI step. Shared records: `canonical: true` in the Arcadia copy and a pointer in the five projections; the byte-identity verifier lives in the harness as a reusable check.
- Checkpoint: first green run. Rollback: remove the job.

**Stage 7: supersede and amend records (Appendix B).**

- GDR-KI-FUNDAMENTALS-002 supersedes 001 with: executable-ownership class for product repositories; dotfiles as binding-state owner; harness as owner of MCP standards and shared controls (not servers); tap serving four tools; the repository boundary rule from section 1. Projected to the six primary repositories with the byte-identity check.
- Harness: `mcp/README.md` rewritten; SDR-KI-HARNESS-001 amended; ADR-KI-HARNESS-002 naming clarified.
- Checkpoint: six projections byte-identical. Rollback: 002 status set to superseded by 001 again (the lifecycle supports it).

### 7.2 Compatibility during transition

- MCPs on old and new control copies coexist indefinitely; nothing communicates between them. The only estate-wide artefact is the audit event shape, and the shared module preserves the existing exported `AuditEvent` and `AUDIT_LOG_MODES` names so log consumers do not change.
- `git-audit` on SDK v2 and the others on v1 remain as they are; the shared modules do not import the SDK, so the zod hold and the SDK migration are decoupled from this work.
- The environment variable names for access level are preserved per server; the shared module reads the name from injected config. WhatsApp keeps `WHATSAPP_ACCESS_LEVEL` and may add the aliased name by its own decision.
- The tap, the website, `ki-plugins` and dotfiles do not change in stages 0 to 4; stage 5 changes one dotfiles line and one harness membership list; stage 6 adds checks only.

### 7.3 How normal work continues

- Every stage is one commit in one repository at a time, on `main`, and never requires two repositories to change atomically. A repository with an active writer is simply skipped and revisited; `ki repo audit` shows which MCPs are behind the manifest.
- The conformance suite runs in each MCP's own CI and fails only that repository. A harness change to the shared modules never breaks a consumer until the consumer runs conform.
- The `ki` and harness compatibility pins are moved to the current release in stage 1, which removes the present situation of the harness verifying against a stale host.

## 8. Costs and risks

Where the dossier allows a number, it is given. Where it does not, the cost is stated in artefacts and the absence of a number is stated.

### 8.1 Maintenance

- Shared control surface today: four files times nine repositories, 36 hand-maintained files of which 27 carry security-relevant behaviour (access level, annotations, audit). After stage 3: three canonical modules, one manifest, one suite, and 24 materialised copies (eight repositories after the merge) that are never hand-edited. Hand-maintained security files fall from 27 to 3. `config/index.ts` stays per repository by design (eight files).
- Documentation drift found: twelve items across ten repositories (section 2.4), all cheap; the class of drift (script names, ADR numbers, repository names in prose) recurs unless the checks in stage 6 exist. No mechanism is proposed for prose-level cross-references beyond the two checks (plugins diff, website provenance) because a general link checker across 22 repositories is more machinery than the drift justifies at this scale.
- New records to maintain: one ADR, one KIP, one KIS, one superseding GDR. Existing records amended: four.

### 8.2 Release

- MCPs have no release unit today and none is added. Cost avoided: no tagging or asset pipeline for eight repositories. Cost accepted: MCPs run from checkout `dist` paths registered in dotfiles, which means a broken `main` is a broken server on next restart; this is the present state and is flagged as a reverser (T3) rather than fixed here.
- Tools: no change to four release lines and four formulae. Scenario 7 shows a release-shape change costs two commits and one bot PR.
- Harness payload: bumps on shared-module changes as it does on skill changes today; no new release form.

### 8.3 CI

- Added jobs: one conformance run per MCP (eight), one plugin diff job in the harness, one provenance check in the website, one drift report in the harness. Eleven jobs. Wall-clock cost unmeasured; the conformance suite starts one server process per assertion group and should be seconds, but no timing evidence exists.
- Removed: nothing. Changed: four `KI_VERSION` pins.
- Second-checkout dependency exists only during stage 2 and is removed in stage 3.

### 8.4 Security

- Gain: a behavioural test of the access gate in the four repositories that have none, including the two largest remote-API servers. This is the single largest risk reduction in the review and it is independent of every structural choice.
- Gain: redaction policy becomes declared per server rather than embedded in a copied file; a reviewer can read one config object per server to know what is redacted.
- Gain: the hard-coded server name in `hk-claude` (accidental drift) is removed by construction.
- Risk: a defect in the shared module propagates to eight servers on their next conform. Mitigation: the harness unit tests, the suite, and the fact that propagation is a per-repository commit that the repository's own CI must pass. Today a defect in one copy affects one server; the trade is accepted because today's nine copies also mean nine places to fix a defect and no test in four of them.
- Risk: in-process execution of harness rubric modules inside `ki` remains a single trust domain. The review does not change it and names it as a missing question (Appendix A, question 15).
- Unchanged: repositories are not security boundaries; processes, environment and the secret authority are. The housekeeping merge combines two credential-free read-only processes and does not weaken anything.

### 8.5 Migration

- Artefacts: 3 modules, 1 manifest, 1 suite of roughly six assertion groups, 1 materialiser extension in `tools-ki`, 8 to 9 materialisation commits, 1 merge with history, ~12 drift fixes, 4 new records, 4 amended records, 3 CI jobs, 1 drift script. Hours are not estimated because the dossier gives no basis for it; the maintainer's own velocity on comparable work (ADR-SKILLS-012 and its materialiser) is the right reference.
- Sequencing risk: stage 3 before stage 2 would vendor an untested implementation into eight repositories. The order is mandatory.
- Foreign work: two repositories had another writer at capture; stage 5 explicitly waits.

### 8.6 Discoverability

- Improved: one place to read the MCP control implementation; one place (KIS-0003) to read what it must do; `ki repo audit` says which servers are current.
- Cost: a reader of an MCP repository sees `src/shared/` files that say "do not edit; materialised from harness at SHA"; that is the same experience SKILLS-012 already gives skill authors.
- Unchanged: 21 repositories is still 21 places; the rule in section 1 is what makes the layout predictable, and it should be stated in the fundamentals record so that the next repository is placed by rule.

### 8.7 Concurrency

- Unchanged for agents: one writer per checkout, worktrees for parallelism within a repository. Fan-out across MCPs is eight independent commits that can be done by eight agents in eight checkouts without collision, which is a property the present layout has and a workspace would lose unless every agent used worktrees.
- Reduced by one: the merge removes one checkout to keep in sync.
- Estate-wide changes (stage 3 roll-out, SDK migrations, CI pin bumps) have no owner in the choreography model; `mgit` is the instrument and the maintainer is the owner by default. This is named as the missing question.

## 9. Rejected alternatives

### 9.1 Strongest competitor: an MCP Bun workspace (in the harness `mcp/` shelf or a new `mcp-workspace` repository)

What it offers: one lockfile, one SDK bump, one CI, shared modules as ordinary workspace imports with no materialiser, and one place to read all MCP code. The harness `mcp/README.md` records it as the intended consolidation path, and `ki-techne-tools` proves the estate can run a workspace.

Why it loses on the measured evidence:

- Trust split. Three of nine repositories are private and one is UNLICENSED with personal data. A workspace is one repository with one visibility. Either the six public servers go private, or the three private ones go public, or two workspaces are created, which reintroduces the duplication the workspace was meant to remove.
- Size and governance asymmetry. `mcp-acquire-whatsapp` has 36k lines, 631 tests and its own ADR series; `mcp-housekeeping-codex` has 1.3k lines and eight tests. A workspace whose `.ki.toml` must express both under one governance contract needs subtree scoping that `ki repo audit` does not have today (Constraint 3). Building that is more work than the materialiser.
- SDK major split. `mcp-git-audit` is on SDK v2 with a zod range the other seven cannot take. A workspace lockfile would either hold the pilot back or force the migration. Vendored SDK-agnostic modules sidestep it.
- Runtime registration. Dotfiles registers eight servers by absolute path under eight checkouts; a workspace changes all eight lines and the `mcporter` daemon configuration in one go, with no partial state possible.
- Concurrency. One writer per checkout means one writer for all MCP work unless every agent uses worktrees. Today eight agents can work on eight servers without coordination.
- It still does not test anything. The workspace gives shared code; it does not give a behavioural conformance check. Stage 2 is needed either way, and once it exists, the marginal benefit of the workspace is one lockfile.

### 9.2 Version-pinned Git-ref shared package

A small `mcp-shared` repository consumed as `github:knowledgeislands/mcp-shared#vX` by each MCP. Honest source owner, explicit consumer versions, no registry.

Why it loses: `bun install` becomes network-dependent on GitHub for a private-family repository; tags and changelogs are needed for roughly 400 lines of code; the SDK peer dependency question returns unless the package is SDK-agnostic (in which case the vendored version is the same code with less machinery); a 23rd repository is created for a unit that fails the R1 test (its only consumers are eight sibling repositories on the same machine) and the R2 test. The vendored approach gives the same source ownership and pinning through a manifest, with the copy visible in the consumer's own history.

### 9.3 Put shared MCP controls in `tools-ki`

`tools-ki` is the "executable platform" and already owns the materialiser. Why it loses: `tools-ki` owns host mechanics for the CLI; MCP server process behaviour is not CLI behaviour; the harness already owns the MCP standard, rubric and `ki-mcps` Agora home, so splitting the standard from the reference implementation across two repositories creates the exact drift the review is trying to remove.

### 9.4 Merge all three housekeeping servers

Why it loses: `mcp-housekeeping-claude` is public, `v0.9.0`, 42 tools with destructive operations and 315 tests; the other two are private, `v0.1.0`, four read-only tools each. R2 separates them. Merging would force a visibility decision and put destructive Claude housekeeping in the same process as read-only OpenAI inspection.

### 9.5 Merge Arcadia and Techne Principal, or Specifications into Arcadia

Why it loses: the split is three days old and decided by two records; the knowledge bases have separate consumers; Specifications has a lifecycle a knowledge base does not. The review's finding about Specifications is that it needs a real contract, not a different home.

### 9.6 Archive `ki-plugins` and serve the projection from a harness branch or release asset

Why it loses: the marketplace host wants a repository URL with a root manifest; a branch would carry a second root layout on the harness; a release asset is not a repository. R3 holds.

### 9.7 Retain everything and add drift reporting only (the baseline)

Considered fully in section 11. It loses because it leaves nine owners of a security control and no behavioural test in four of them.

## 10. Decision reversers

Thresholds or findings that would change the recommendation. Each names the evidence, the trigger, and what changes.

- T1, behavioural divergence found in stage 0 or stage 2. If any two servers derive different levels from the same annotations, or any same-named preset differs in value, the recommendation's order changes: the divergent server is fixed and its own ADR series consulted before vendoring, and KIS-0003's Draft must document the divergence as a known non-conformance. The structure does not change; the sequence does.
- T2, MCP count doubles to sixteen or more with the same SDK major and all public. At that point a workspace for the public, same-SDK subset becomes cheaper than sixteen materialisation commits per control change, provided `.ki.toml` has gained subtree governance and a per-package tag scheme exists. Below that count, materialisation stays cheaper. The private servers stay out of any workspace at any count.
- T3, MCPs gain a distribution unit. Today eight servers run from checkout `dist` paths registered by absolute path in dotfiles. If the maintainer decides that a broken `main` must not become a broken server, MCPs need release assets and the tap or `ki` becomes their installer. That changes section 4's distribution map and makes each MCP an R1 unit in the full sense; it strengthens the keep decisions, it does not weaken them.
- T4, the SDK v2 migration completes across all servers and the zod hold is lifted. The Git-ref package option becomes viable again with a single peer dependency. It would still fail R1 and R2 for a new repository; the change would be to consider hosting the shared modules as a package inside the harness consumed by Git ref, which trades the materialiser for network-dependent installs. The review would still prefer vendoring at eight consumers.
- T5, a second human maintainer joins. Per-repository review boundaries become more valuable and merges more expensive; the housekeeping merge should be re-examined if it has not yet happened, and the workspace alternative loses further.
- T6, `ki bootstrap` or `rig` begins writing MCP registrations or hook bindings. The binding-state owner answer changes and ADR-KI-HARNESS-010 must be superseded first; until then such a change is a breach, not a design.
- T7, KIS-0001 reaches Active with a second implementation outside `tools-ki`. Specifications' authority becomes demonstrated rather than declared, and the review's characterisation of it as a paper authority is withdrawn.
- T8, the conformance suite proves too slow or flaky to run per MCP in CI (no timing evidence exists). Fall back to running it in the harness CI against all servers built from pinned SHAs, which trades per-repository feedback for one estate-wide run; the modules and materialiser are unaffected.
- T9, the harness stops executing rubric modules in-process (for example by spawning them as the runner already does for scripts). The `ki` and harness compatibility contract can loosen; the trust note in section 3.1 is withdrawn.

## 11. No-change and minimal-change baseline

This section gives the cost of merely tightening the present model so the restructuring above can be compared against it.

### 11.1 No change

Keep 22 repositories, nine hand-copied control implementations, presence-only rubric checks, unchecked projections, CI pins one release behind in four repositories, and twelve documented drifts.

What it costs: nothing now. What it fails to fix: no authoritative implementation of access gating (nine owners); no behavioural test of the gate in `mcp-gsuite`, `mcp-m365`, `mcp-ki-kb-fs`, `mcp-housekeeping-codex`; audit redaction embedded in copied code; `ki-plugins` already stale at capture with no detector; the website's provenance claim unverifiable; Specifications with zero Active contracts and no plan to gain one; two private servers with no CI; dotfiles as an unnamed authority; the fundamentals record asserting MCP membership the harness does not publish.

### 11.2 Minimal change

Do stages 0, 1 and part of 2 only: the drift report, the twelve fixes, the four CI pins, `access-level.test.ts` in the four repositories that lack it, and the harness `ki-plugins` diff job. No shared modules, no materialiser, no KIS-0003, no merge, no record supersession beyond the two README fixes.

What it costs: roughly fifteen small commits across eleven repositories, one new script, one CI job, and four unit test files written by hand (each a copy of an existing sibling test with imports adjusted). No hours estimate is given; the artefact count is the honest measure.

What it fixes: the documented drift; the missing unit tests; stale projection detection; the stale CI pins.

What it fails to fix: the four new unit tests are themselves four more copies that will drift; there is still no authoritative implementation and no single edit point when the invariant changes (scenario 2 remains nine hand edits with nine reviews); the rubric still checks presence; the redaction policy remains embedded; the website claim remains unverified; Specifications remains ungrounded; the housekeeping pair remain two ungoverned private repositories; the fundamentals record remains incorrect on MCP membership, the tap, and dotfiles; and the next repository is placed by taste, not rule.

### 11.3 Comparison

| Property | No change | Minimal change | Recommendation |
| --- | --- | --- | --- |
| Owners of the access gate | 9 | 9 | 1 canonical, 8 pinned copies |
| Repositories with a behavioural gate test | 0 | 0 | 8 (suite) plus unit tests |
| Repositories with a unit test of the gate | 5 | 9 | 8 (after merge) |
| Hand-maintained security files | 27 | 27 | 3 |
| Edits when the invariant changes | 9 semantic | 9 semantic | 1 semantic, 8 mechanical |
| Projection drift detected | no | plugins only | plugins, website, shared records |
| Active portable contracts | 0 | 0 | 1 on completion |
| Repository count | 22 | 22 | 21 |
| Records superseded or amended | 0 | 0 | 4 new, 4 amended |
| Estate-wide change owner named | no | no | yes (Appendix A, Q15) |

The recommendation's additional cost over the minimal baseline is the materialiser extension, three modules, one suite, one merge, and eight new records or amendments. Its additional benefit is that the invariant has one owner, one test, and one contract, and that the estate has a boundary rule.

## Appendix A: the brief's fifteen questions

**Q1. Is the six-authority model coherent and complete?** Coherent for the six things it names; incomplete as an authority model. It is a list of primary repositories, not a map of ownership kinds. Add: an explicit executable-ownership class for product repositories (each MCP, `ki-techne-tools`, the three tools), of which ADR-TECHNE-003 is the only worked instance; `krisb/dotfiles` as sole writer of machine binding state; the harness as executable owner of shared MCP controls. Narrow: Specifications' claim to "an Active KIS governs" is true but currently vacuous, and the record should say what is Active. Correct: the harness publishes MCP standards, not MCP servers (C9); the tap serves four tools (C12). Remove or combine: nothing.

**Q2. What principle should determine a repository boundary?** Independent acceptance, tested by three conditions: R1 own release line and consumers; R2 distinct trust class (visibility, licence, credential scope, personal data); R3 host-mandated location. Authority is never the criterion; product is the usual carrier of R1; trust is the criterion that overrides code reuse. Applied to all 22 in section 5 without exception.

**Q3. Which repositories should be kept, merged, split, moved, generated, or archived?** Section 5.23: twenty kept; `mcp-housekeeping-chatgpt` becomes the merge target renamed `mcp-housekeeping-openai`; `mcp-housekeeping-codex` merged with history then archived; nothing split, moved or newly generated.

**Q4. Where should shared MCP security and protocol behaviour be authoritative, and how should consumers prove conformance?** Normative: KIS-0003 in `ki-specifications` (Draft now, Active when all public servers pass). Executable: `ki-agentic-harness/mcp/shared/` with the conformance suite in `mcp/conformance/`. Consumers prove conformance by running the vendored suite against their built server in their own CI and by `ki repo audit` showing their copies match the harness manifest. Byte identity proves the copy; the suite proves the behaviour; both are required and neither substitutes for the other.

**Q5. Should MCPs stay independent, form workspaces, live in the harness, live in Techne Tools, or use another structure?** Independent, with vendored shared controls and a shared conformance suite. Not a workspace (section 9.1); not in the harness as servers (the harness owns the standard, the modules and the suite, and its `mcp/` shelf is repurposed for those); not in Techne Tools (nothing in an MCP is controller or fabric).

**Q6. Where exactly is the boundary between harness capability semantics and `tools-ki` host mechanics?** The frontmatter and reference-file contract plus the rubric module interface. The harness owns everything declared in skill, agent, hook and eval content, the rubric checks and remediation text, the adapter deltas per runtime, and now the MCP shared modules and suite. `tools-ki` owns loading, resolution, registry, activation, materialisation, transactions, progress, reporting, error envelopes, the command grammar, and installation. Runnable rubric behaviour: harness owns what is checked; `ki` owns how it runs. Compatibility negotiation: `ki` owns it, as host and registry, and both CIs must test against the other's current release because the modules execute in one process. Failures crossing the boundary: `ki` owns the envelope and the report; the harness owns the fix.

**Q7. Where exactly is the boundary between `tools-ki` work operations and the Techne Tools controller?** `ki` owns repository-scope, Git-resident, declarative work state and cross-repository trade routing (`ki repo roadmap`, `ki trade`, `ki batch`). The controller owns admission, work identity, leases, retries, execution evidence, result integration and cleanup: machine- or cluster-resident mutable execution state in its journal. The controller invokes `ki` inside task environments; `ki` never supervises a process. Git is authoritative work state (ADR-TECHNE-001); the journal is authoritative execution state; result integration is the controller proposing commits that the receiving repository accepts by its own checks. There is no `ki work` command today (C16) and the review recommends none be added that supervises.

**Q8. Are `tools-mgit` and `tools-rig` foundational members, general utilities, or candidates for another home?** Both are general utilities that are operationally foundational: `mgit` is the fan-out instrument for every choreographed estate change and reads Agora membership; `rig` is the catalogue-intent owner for a machine and defers state to Homebrew and chezmoi. Keep both as `ki-fnd` members and as separate R1 repositories. Neither is a semantic authority for anything in Knowledge Islands.

**Q9. Can `ki-plugins`, website material, installed harness state, shared decisions, and runtime configuration be rebuilt and checked from their sources? Which copies may be edited?** Section 3.4. `ki-plugins`: rebuildable by the generator, not currently checked, stale at capture; target pinned and checked; never edited. Website: copied pages are not rebuildable (no mechanism) and not checked; target is a provenance check; guide prose is editable, copied material is not. Installed harness: rebuildable and checked by `ki manage diag`; never edited. Shared decisions: checked by byte identity; edited only in the Arcadia canonical. Runtime configuration: not a copy; authoritative in chezmoi source; edited only there. MCP shared modules and suite: rebuildable by conform, checked by audit, never edited in the consumer.

**Q10. Is dotfiles an estate authority, an operational projection, or an external consumer?** All three, for different things, and the fundamentals record should say which. It is the authoritative sole writer of machine binding state (which servers, which hooks, which settings, which formulae) under ADR-KI-HARNESS-010 and -014. It is an external consumer of every KI payload and tool. It is never a semantic source. What each answer changes: as binding authority, `ki bootstrap` and `rig` must not write bindings (T6); as consumer, it must pin what it consumes (it does, by Brewfile and by `active.json` check in the hook binding); as non-source, nothing in it may be cited as the definition of a capability.

**Q11. Which boundaries are justified by private data, credentials, visibility, or failure containment rather than code organisation?** `mcp-acquire-whatsapp` (private, personal data, 1Password); `mcp-housekeeping-openai` after merge (private, local state); each remote-API MCP (`m365`, `gsuite`, `notion-mirror`: separate credentials and separate audit scopes); `mcp-git-audit` (remote mutation capability); `mcp-ki-kb-fs` (confinement to a KB list that includes private KBs, held in dotfiles); `ki-techne-tools` (cluster and AWS credentials); `krisb/dotfiles` (secret references). Boundaries justified by code organisation or host mandate only: the four tool repositories (release cadence), `homebrew-tap`, `ki-plugins`, `ki-website`. The two knowledge bases are justified by authority kind and consumer set, not trust.

**Q12. What changes when MCP, tool, provider, and agent counts double?** What scales once: shared modules, suite, materialiser, drift script, KIS-0003. What scales linearly and is acceptable: `.ki.toml` files, CI files (templated by `ki repo conform`), Agora lists, formulae. What breaks: absolute-path registration of sixteen servers in dotfiles (T3 becomes pressing); the `ki-plugins` projection at 1,600 files; CI pin drift across 40 repositories (already two versions across four files at 22). At sixteen public same-SDK MCPs the workspace question reopens (T2). The choreography model has no estate-wide change owner, and doubling makes that the binding constraint (Q15).

**Q13. What should remain deliberately duplicated, and what evidence makes that independence real?** Per-server `config/index.ts` (server-specific by nature; the shared items move out); per-server redaction policy declared in config (the field names really differ); per-server tests of tools; per-repository `.ki.toml`; per-repository CI (generated by conform, so duplicated but not hand-maintained); the six copies of shared decision records (a verified duplication with a byte check); the SKILLS-012 shared skill modules (already pinned and checked). Evidence that makes the independence real: the conformance suite passing per server proves the shared part is equivalent; the drift report showing only expected differences in `config/index.ts` proves the per-server part is deliberate; `ki repo audit` clean proves the copies are current.

**Q14. Which existing decisions or documentation should be superseded if the recommendation is adopted?** Appendix B.

**Q15. What important question is still missing from the brief?** Two, and the first is the more important.

First: who owns estate-wide coordinated change, and with what mechanism? The brief asks structural questions about where things live but not the operational one about how a change that must land in many repositories is scheduled, sequenced, tracked and declared complete. The evidence shows three such changes in flight with no owner: the SDK v1 to v2 migration (one pilot, seven repositories on a zod hold), the `ki` v0.3.6 to v0.4.0 CI pin bump (two of six done), and the shared-control roll-out this review proposes. "Choreographed rather than centrally orchestrated" is a rule about who accepts commits; it says nothing about who runs the campaign. The answer the review gives: the maintainer owns each campaign explicitly, records it as a harness roadmap item with a checklist of repositories, uses `mgit` for fan-out and `ki repo audit` for completion, and the fundamentals record says so. Without that, doubling the estate (Q12) doubles the number of half-finished migrations.

Second: for each declared authority, what would be observably different if it were deleted? This is the test that separates a real authority from a declared one. Applying it now: delete Specifications and one `tools-ki` module and one website page change; delete the harness standard for MCPs and nothing in any server changes because nothing consumes it mechanically. The brief should ask reviewers to apply this test, because it is what exposed Specifications as ungrounded and the MCP standard as unenforced.

A third, smaller question is implied by the evidence but not asked: what is the trust consequence of `ki` executing harness rubric modules in-process, and who reviews harness code before it runs with the CLI's privileges on a machine that holds credentials for eight MCP servers? The review notes it (section 3.1, T9) and does not resolve it.

## Appendix B: decisions and documentation to supersede or amend

| Record | Action | Reason |
| --- | --- | --- |
| `GDR-KI-FUNDAMENTALS-001` | Supersede by 002 | Executable-ownership class, dotfiles binding owner, boundary rule, C9, C12 † |
| `ki-agentic-harness/mcp/README.md` | Rewrite | Retire the Bun workspace option; describe `mcp/shared` and `mcp/conformance` |
| `SDR-KI-HARNESS-001` | Amend | Shared MCP controls and suite are in scope; MCP servers are not |
| `ADR-KI-HARNESS-002` | Amend or annotate | `ki-repo-*` names denote skills; repositories are `ki-specifications`, `ki-website` |
| `ADR-KI-HARNESS-SKILLS-012` | Leave; cite | New `ADR-KI-HARNESS-MCP-001` is modelled on it and explicitly outside its scope |
| New `ADR-KI-HARNESS-MCP-001` | Create | Shared MCP controls as materialised modules; manifest; conformance suite as reference test |
| `ki-repo-mcp` rubric UTIL-1 and standards | Amend | Hash-and-manifest check with suite evidence; fix `mcp-ki-repo-kb*` |
| `ki-repo-plugins/SKILL.md` line 39 | Amend | Script name |
| `ki-plugins/README.md` lines 5 and 9 | Amend | ADR-002 not 005; script name |
| `ki-website` README and GDR text on vendoring | Amend | Copies with frontmatter provenance and a check, not vendoring |
| `ki-specifications` roadmap `KI-SPEC-RGV-001` | Amend | `.ki-meta` count is zero at HEAD |
| `ki-specifications` CI, `tools-mgit` CI, `tools-git-almanac` CI, harness CI | Amend | `KI_VERSION` to `v0.4.0` |
| `KIS-0001` schema `$id` host | Decide at next version | `.org` versus `.info` (C13) |
| New `KIP-000003`, `KIS-0003` | Create | MCP access, annotation and audit contract |
| `mcp-ki-kb-fs` README title, badge, audit path | Amend | Repository is `mcp-ki-kb-fs` |
| Arcadia `Pillars/Techne` | Mark historical | Superseded by GDR-FUND-001 and Techne Principal |
| `ADR-KI-HARNESS-SKILLS-007`, `ADR-KI-ARCADIA-001` | Owner decides | Roadmap proposes amendment; ADRs stand until superseded (C15) |
| `mcp-housekeeping-codex` README | Replace | Pointer to `mcp-housekeeping-openai`; repository archived |
| harness `.ki.toml` Agora lists, dotfiles `mcp-servers.yaml` and `mgit` data | Amend | Merge and rename |

† The superseding record should also state the estate-wide change ownership answer from Appendix A, Q15, and name Arcadia's copy as canonical for shared records (C14).

---

## Addendum: maintainer direction and reviewer response, 2026-09-20

**Status of this addendum.** Sections 1 to 11 and Appendices A and B above are the independent Fable 5.1 pass of 2026-09-19 and are preserved exactly as originally written, in line with the brief's instruction to preserve independent reviews that predate the maintainer direction. This addendum is a later, dependent record: it was written on 2026-09-20 by Claude Opus 5 (`claude-opus-5[1m]`) after reading the maintainer direction added to the brief, the GPT-6 Astra review, and fresh evidence from the working checkouts. It is not part of the independent pass and must not be read as one. Where it conflicts with a section above, this addendum is the later position and wins.

### A1. Maintainer direction received

Four constraints were confirmed by the maintainer on 2026-09-20. The first three are recorded in the brief under "Maintainer direction after the initial reviews"; the fourth was given directly.

1. Consolidate `mcp-housekeeping-chatgpt` and `mcp-housekeeping-codex` into one OpenAI-family MCP able to serve ChatGPT and Codex on the same machine, with separate adapters. Preferred name `mcp-housekeeping-openai`. Keep the combined repository private during the merge; review visibility separately afterwards.
2. Create no estate-wide KIPs, KIS documents, schemas, or comparable portable specifications before Knowledge Islands reaches overall V1. Use repository-local decisions, contracts, tests, and compatibility evidence instead. `ki-specifications` is not an active delivery target for this work.
3. Preserve the independent reviews as originally written where they predate this direction.
4. `GDR-KI-FUNDAMENTALS-001` must be updated in place and must not be superseded.

### A2. Recommendations above that are now withdrawn

| Location | Original recommendation | Disposition |
| --- | --- | --- |
| Section 1, change 3 | Promote the conformance assertions into `KIS-0003` and take it Active | Withdrawn under direction 2 |
| Section 5.3 | "Give it something to govern"; `KIS-0003` as first contract | Withdrawn; the R1 classification still stands † |
| Appendix B row 1 | `GDR-KI-FUNDAMENTALS-001`, supersede by 002 | Replaced by amendment in place under direction 4 |
| Appendix B | Create `KIP-000003` and `KIS-0003` | Withdrawn under direction 2 |
| Appendix B | Decide the `KIS-0001` schema host, `.org` versus `.info` | Moot; no KIS documents exist |
| Section 793 | "The superseding record should also state..." | Applies to the amendment instead |

† The repository's classification under R1 in section 5.3 is unaffected; only the proposed contract work inside it is withdrawn.

The conformance suite itself is not withdrawn. It remains the first deliverable, but it lives in `ki-agentic-harness` as a repository-local contract with tests, and it is not promoted to a portable specification before V1.

### A3. Evidence corrections since the independent pass

`ki-specifications` was reset to an empty scaffold at commit `1a140df` ("chore(specs): reset proposals and specifications to an empty scaffold"). The statement in section 5.3 and in the brief that it holds two Draft KIS documents is stale. There are now zero KIS documents, one schema file, and the template set. This strengthens the observation that Specifications constrains nothing today, and removes the proposed remedy.

`mcp-housekeeping-codex` has no deployment footprint. `.chezmoidata/mcp-servers.yaml` in `krisb/dotfiles` registers `kit-mcp-housekeeping-claude` and `kit-mcp-housekeeping-chatgpt` only; Codex is absent. Combined with its lack of CI and absence from the tap, the merge has no installed-state transition to manage beyond one renamed registration.

The two path roots that must coexist are `~/Library/Application Support/com.openai.chat` for ChatGPT and `~/.codex/` for Codex, as recorded in the dotfiles registration.

### A4. Confirmed disposition: the OpenAI-family merge

The merge recommended in section 5.20 and 5.21 is confirmed by the maintainer and is now a decision rather than a proposal. GPT-6 Astra's competing position, that all three housekeeping repositories should be kept pending further evidence, is rejected. Astra asked for evidence on visibility, permission model, release cadence, lifecycle, and user outcome before merging. Four of those axes were measured in the independent pass and all point the same way, and the Codex server has since been shown to have no registration, no CI, and no consumers. Astra's caution was well founded in the abstract and is answered by the specifics.

**Naming rule.** Name the repository after the smallest brand that accurately covers everything it inspects. `chatgpt` fails that test as soon as the server reads Codex state, because Codex is not ChatGPT-branded, so the merged repository is `mcp-housekeeping-openai`. `claude` passes the test today, because Claude Desktop, Cowork, and Claude Code are all Claude-branded, so `mcp-housekeeping-claude` is not renamed to `mcp-housekeeping-anthropic`. The resulting asymmetry between a product name and a vendor name reflects a real asymmetry in how the two vendors brand their coding tools. Scope accuracy beats cosmetic symmetry, consistent with the brief's preference for explicit contracts over aesthetic symmetry.

**Coexistence is a contract, not an adapter choice.** Both providers may be installed on one machine. The merged server detects each root independently, carries an independent access level per adapter, assumes neither the presence nor the absence of the other, and degrades to whichever is installed. This belongs in the conformance suite as a test, not in prose.

**Visibility.** Private during the merge, as directed. Recorded honestly: repository visibility is not a control over the session data these servers read, since that data sits on the machine either way. The real precondition for making them public is test-fixture hygiene. Note the knock-on for the boundary rule in section 1: visibility is one of the R2 trust axes currently separating the OpenAI pair from the Claude server, so if all housekeeping repositories become public, the Claude and OpenAI split then rests on runtime support and user outcome alone. It still holds, on narrower grounds.

### A5. Adjudicated difference: sequencing

Section 1 orders the work as conformance suite first, then vendored shared modules. GPT-6 Astra orders it as policy decision first, then a two-server pilot, then incremental migration. **Astra's order is adopted and the order in section 1 is not.**

The reason is Astra's observation that the desired common policy has not yet been established. The plan in section 1 assumes the common redaction and access policy can be recovered by reading the nine existing implementations. It cannot, because they disagree and none is authoritative. Redaction policy is a decision to be taken, not a fact to be discovered. Section 2.5 of this review already concedes the underlying uncertainty, noting that behavioural equivalence was inferred from a normalised diff rather than proven by test, without acting on it.

The adopted order is therefore: decide the access and redaction policy explicitly and record it in `ADR-KI-HARNESS-MCP-001`; then write the conformance suite that tests that policy; then vendor the shared modules; then migrate consumers incrementally, each remaining independently buildable and revertible.

### A6. Positions held unchanged

The governing boundary rule in section 1 stands: R1 release, R2 trust, R3 host mandate, with authority never creating a repository by itself. It is retained because it is the only proposal in either review that can decide a repository that does not yet exist, and because its negative clause severs conceptual authority from source organisation, which is the conflation the brief set out to break. Two caveats are recorded: the clauses were derived from this estate and so carry some risk of having been fitted to the answer, the test being whether they hold for repository 23; and the rule is falsifiable in the way section 1 states, namely that where it disagrees with operational evidence the rule is wrong.

The finding that four of the nine MCP servers, including `mcp-gsuite` and `mcp-m365`, have no test of the access gate, and that `UTIL-1` conformance asserts only that a file exists, stands as the sharpest evidence in the review. It reframes the duplication question: the defect is absent verification rather than repeated code.

### A7. The `GDR-KI-FUNDAMENTALS-001` amendment

The record is amended in place, retaining its identifier, its original `date: 2026-09-16`, and `status: current`, with a dated amendment entry for 2026-09-20 so that the history survives in the record itself, satisfying the brief's constraint 6. Amendment rather than supersession is also the better call on the record's own terms: every change identified is a completion rather than a reversal, and superseding a record carrying `shared_record: true` would produce a `-002` projected into six repositories while six copies of `-001` persist as historical, which is twelve artefacts and a standing risk that a stale projection is read as current.

The amendment carries four changes.

1. Executable ownership is named as a class distinct from normative authority. Each product repository owns its own behaviour, compatibility, and lifecycle state. Both independent reviews found this gap.
2. Machine and deployment state gains a named owner. `krisb/dotfiles` owns environment binding and registration; native providers own their own state. This is currently unowned in the record.
3. `ki-specifications` is narrowed to dormant until V1. The clause stating that an Active KIS governs implementations claiming conformance becomes explicitly forward-looking rather than a live mechanism.
4. The boundary rule is stated: R1, R2, R3, and authority never creating a repository by itself.

Mechanically, the record itself requires that any modification considers all six repositories and updates every projection coherently. So all six projections are updated in one pass, byte identity across the six copies is re-verified afterwards, and Arcadia's copy is marked canonical. Per Arcadia's `CLAUDE.md` this is a substantive change to a canonical zone and routes through the Enactment Process as a `Streams/Roadmap/` record rather than a direct edit.

### A8. Open question carried forward

GPT-6 Astra's strongest unique contribution is unanswered by this review and by the direction so far: can every deployed MCP and tool instance be identified, updated, and rolled back? The dotfiles registrations point at absolute `dist` paths, so the running version is whatever was last built locally in that checkout. Neither source reorganisation nor vendoring addresses this, and it is the most consequential gap in the estate's operational model.
