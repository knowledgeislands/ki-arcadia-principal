# Knowledge Islands factorisation evidence — 2026-09-20

Status: FND-1 evidence appendix for review

Campaign: `KI-ARCADIA-GOV-009`

## Purpose

This appendix re-verifies the point-in-time facts needed to plan FND-2, MCP-1, and OAI-1 in [the consolidated factorisation roadmap](knowledge-islands-factorisation-roadmap.md). It records whether evidence came from a local committed revision, a live worktree, or GitHub main rather than collapsing those states into one claim of currency.

The pass was read-only across the estate. The only repository changes made by the coordinating session are the Arcadia working documents and roadmap intake record named in its review packet.

## Measurement boundary

The estate was not a single immutable snapshot during measurement:

- Techne Principal advanced through multiple revisions while the pass ran and was observed moving from `1598e3150a2e` to `576ba957f846`.
- `mcp-acquire-whatsapp` acquired two concurrent uncommitted source edits after the initial clean-worktree check.
- Several local repositories are ahead of GitHub main, while Homebrew Tap and KI Website had two-way local/remote differences when measured.

These are not failures in themselves. They mean each result below names its evidence surface and that moving results are not promoted into a stable baseline.

## Estate inventory and visibility

The initial GitHub inventory contained 21 active Knowledge Islands organisation repositories. Eighteen were public and three were private. The private repositories were:

- `mcp-acquire-whatsapp`;
- `mcp-housekeeping-chatgpt`; and
- `mcp-housekeeping-codex`.

`krisb/dotfiles` was also private and active. At that evidence cut, the factorisation scope was therefore 22 repositories before the OpenAI merge and 21 after it: 20 Knowledge Islands repositories plus dotfiles. The later structure recheck below supersedes those inventory counts after `tools-techne` was created.

Evidence was obtained with GitHub repository metadata queries and local Git revision checks. Local and GitHub-main revisions differed for Homebrew Tap, Harness, Arcadia, Techne Principal, Techne Harness, Website, WhatsApp, Git Audit, Rig, and dotfiles. Any implementation campaign must reread the receiving repository immediately before creating or applying work.

## Repository structure recheck

The initial evidence pass covered 22 governed repositories: 21 in the Knowledge Islands organisation plus `krisb/dotfiles`. A new `knowledgeislands/tools-techne` repository then appeared at commit `46be296837b6`; it contains only `README.md`, has no `.ki.toml`, and is not yet a governed KI repository.

The live physical inventory is therefore 23 repositories before the OpenAI merge. The post-merge target is 22: 21 in the Knowledge Islands organisation plus dotfiles. The new repository belongs in the inventory and receiver planning, but no current evidence supports calling it operational or assigning authority before its source and repository contract exist.

The 22 currently governed repositories have exactly two formal base structures:

- two Knowledge Bases: Arcadia Principal and Techne Principal, both with the principal and KB-feature overlays; and
- 20 Projects, with composable Harness, MCP, tool, Website, plugin, Specifications, Homebrew, dotfiles, or no specialised structural overlay.

The OpenAI merge and `tools-techne` onboarding offset one another numerically, so the post-merge target remains two Knowledge Bases and 20 Projects. `ki-techne-harness` is currently Project plus engineering with no specialised structural overlay. Its accepted local direction at `0cf5236b24ca` calls it the Techne execution harness and reserves `tools-techne` for the independently released operator CLI. That product use of “harness” is not the compatible agentic-Harness overlay.

The recheck also identified vocabulary that must not be conflated:

- base structure is Project or Knowledge Base;
- a structural overlay is a composable `ki-repo-*` shape;
- an adapter is a replaceable implementation, hosting, provider, runtime, or work-tracker binding;
- an estate role is authority and routing recorded in the shared fundamentals record; and
- `ki-engineering` is a cross-cutting implementation standard, not a repository type.

The current standard calls the ordinary base both `repository` and Project and permits its `repo_type` to be omitted. Because the estate is V0.x, the roadmap can directly target explicit `repo_type = "project" | "kb"` with one matching primary declaration. This is a proposed standards change, not a claim about present conformance.

## Shared fundamentals projections

There are exactly six current `GDR-KI-FUNDAMENTALS-001` projections:

- Arcadia Principal and Techne Principal under `Admin/Governance/Decisions/`;
- Agentic Harness, `tools-ki`, Specifications, and Website under `docs/decisions/`.

The Harness projector gives all six the same SHA-256 value:

```text
2a3ecbc42fc0931dd8360bf6f662872e2dadf31433515ffb86d16cfa8c6bd0b6
```

The raw files have two hashes because the two Knowledge Base copies carry the permitted receiver-local `note_type`. After excluding that field, their decision-owned frontmatter and bodies are identical. No current copy or configuration identifies Arcadia as the authoring source.

The existing fail-closed contract permits only `note_type` as receiver-local metadata. A new `canonical: true` field would therefore make the projection invalid. FND-2 should identify Arcadia in shared prose and local index glosses, update the current six-copy set, and leave broader distribution to post-merge ALIGN-1.

## MCP implementation baseline

### Harness product boundary

At Agentic Harness revision `23dcdc953492`, the only tracked file under `mcp/` is a README describing an empty possible consolidation shelf. The repository has no MCP workspace, server source, MCP SDK dependency, or server runtime dependency. Its compatible installed payload already contains only skills, subagents, and hooks, and the current host recognises only `skill` as a published capability kind.

The shared fundamentals record nevertheless names an MCP server as a typed Harness member, while the Harness purpose decision says product and sibling MCP artefacts live outside it. Current operation follows the latter model: every MCP product is independently governed, built, tested, released, and bound from its own repository.

The target should remove executable MCP products and server source from the Harness capability boundary. The Harness remains the owner of reusable MCP governance and conformance capabilities, including `ki-repo-mcp`, binding semantics, token policy, and the black-box suite. An MCP product does not become a Harness member because the Harness governs or tests it.

The Harness worktree acquired unrelated concurrent edits during this read-only inspection. No Harness file was changed by the factorisation review, and its live worktree must be reread before any receiver-owned implementation begins.

Eight MCP servers declare `@modelcontextprotocol/sdk ^1.30.0` and resolve version `1.30.0`. `mcp-git-audit` uses `@modelcontextprotocol/server` and client version `2.0.0`. The earlier eight-v1 and one-v2 observation remains correct.

The common-looking implementation surfaces are not one implementation:

- `access-level.ts` has five distinct hashes; ChatGPT, Claude, and Codex are byte-identical.
- `annotations.ts` has nine distinct hashes.
- `audit-log.ts` has nine distinct hashes.
- `config/index.ts` has nine distinct hashes.

This supports policy and behavioural conformance work before extracting a common MCP kit. File names alone do not prove shared semantics, while the nine-way hash split makes direct shared-source extraction premature.

## MCP test evidence

The following local committed worktrees produced stable passing test results:

- `mcp-git-audit` at `59c333f7fdd8`: 14 files and 161 tests;
- `mcp-gsuite` at `47599528599a`: 21 files and 466 tests;
- `mcp-housekeeping-chatgpt` at `033b466d2f70`: 6 files and 26 tests;
- `mcp-housekeeping-claude` at `8b0180ff325b`: 15 files and 315 tests;
- `mcp-housekeeping-codex` at `15e415242530`: 1 file and 8 tests;
- `mcp-ki-kb-fs` at `53cd14ada95e`: 12 files and 289 tests;
- `mcp-ki-kb-notion-mirror` at `138a7d961332`: 19 files and 288 tests; and
- `mcp-m365` at `4a73c07fc89d`: 33 files and 1,043 tests.

WhatsApp is explicitly unverified. Its stable HEAD was `4945a264c0f0`; 64 files and 694 tests passed, but two suites failed while another writer was changing provider source files. That result must not be used as product evidence until the worktree settles and the suite is rerun from a recorded revision.

The latest main CI runs for the six MCP repositories that have workflows failed uniformly at `ki repo audit --repo .`, not in their product test suites. ChatGPT, Codex, and WhatsApp have no workflow files or runs. Future baseline reporting should therefore distinguish repository-governance failure from product-test failure.

## OpenAI merge evidence

ChatGPT and Codex are both private, both use the v1 SDK line, and both pass their local tests at the revisions above. Codex has no dotfiles MCP registration or other observed deployment footprint. ChatGPT is registered from a local unversioned `dist/mcp-server/index.js` path.

The evidence continues to support renaming the ChatGPT repository to `mcp-housekeeping-openai`, merging Codex as a separate adapter, and retaining the existing stable roadmap code `MCP-HG`. The merge should preserve independent discovery and failure reporting for ChatGPT and Codex even though they share one server.

## Runtime and distribution attribution

Dotfiles registers eight MCPs through local `dist/mcp-server/index.js` paths. Codex is absent, although all nine MCP repositories are present in the dotfiles `mgit` workspace group. Every registered build exists locally, but the registrations contain no source revision or build hash and each `dist/` is untracked.

Registration therefore proves intended binding, not which revision is running. Process inspection was unavailable in the delegated sandbox, so this appendix does not claim that any registered build was a live process. `mcp-m365` also had a source file newer than its local build, which demonstrates why file presence is insufficient attribution.

Dotfiles declares all four tap products: Git Almanac `v0.1.0`, `ki` `v0.4.0`, `mgit` `v0.13.0`, and Rig `v0.2.0`. These are declared distribution bindings, not proof of installed versions.

## Configuration and projection drift

Four workflows still pin `KI_VERSION` `v0.3.6`: Harness, Specifications, Git Almanac, and `tools-mgit`. Homebrew Tap, Techne Harness, and `tools-ki` use `v0.4.0`.

The `ki-plugins` projection is measurably stale against local Harness revision `23dcdc953492`:

- expected projection: 870 files;
- current projection: 818 files;
- 68 expected files are missing;
- 16 current files are extra;
- 216 of 802 common files differ; and
- expected skill count is 55, while the projection has 52.

No projection-drift CI was found. The Plugins README also cites `ADR-KI-HARNESS-005` instead of source/projection decision `ADR-KI-HARNESS-002`, and names `ki:binding:build-plugin` instead of current script `ki:binding:claude:build-plugin`.

## Work-routing readiness

Twenty-one of the 23 current physical repositories resolve a work adapter. `ki-plugins` is the governed exception: it has no `[skills.ki-work]`, no `repo_code`, no issue ledger, and no usable roadmap destination. New `tools-techne` has not yet established the universal KI repository contract or a work adapter, so it is an onboarding target rather than a governed exception.

Dotfiles has a usable roadmap adapter, but its audit reports three pre-existing shape failures across `DOTFILES-UE-026` and `DOTFILES-UE-028`. Techne Principal's ledger records `OPS` high-water mark 008 even though `TECHNE-OPS-009` exists. The Harness Decision Records audit reports a non-canonical filename for `ADR-KI-HARNESS-SKILLS-009`.

Arcadia's current `ki-trades` declaration exports knowledge only, and only to Harness, Website, Specifications, and Techne Principal. FND-2 can still use explicitly approved repository-local handoffs under the existing cross-repository choreography, but the estate must not describe those knowledge routes as a general work transport.

## Specifications state

Specifications at `1a140df06b62` has no registered KIPs or KIS documents. It is accurate to call it dormant for portable specifications, but inaccurate to call the repository tree empty: schemas, examples, templates, process material, shared decisions, and three roadmap records remain.

This confirms the pre-V1 rule: do not route new portable specifications there, while preserving the repository as a scaffold and current shared-decision receiver.

## Corrections carried into the roadmap

The evidence supports these changes to the consolidated plan:

- update the six existing fundamentals projections in FND-2 and extend only through post-merge ALIGN-1;
- use the Decision Records living-record rule: advance the current as-of date and do not add amendment history;
- remove executable MCP products and the empty MCP source shelf from the Harness capability model while retaining MCP governance and conformance skills;
- rehome the estate coordination Agoras to Arcadia without changing independent repository ownership;
- describe Specifications as dormant for KIPs and KISs rather than literally empty;
- treat Plugins drift as measured, not merely suspected;
- add MCP build provenance as an operational gap;
- add `ki-plugins` work-adapter enablement and the confirmed ledger, roadmap, and Decision Record findings to FND-3; and
- retain WhatsApp and Techne Principal as moving observations until a final evidence cut.

## FND-1 disposition

### Final recheck

Techne Principal was observed clean at `4d276893b0f5` during the final planning recheck, confirming that its earlier movement was active concurrent delivery rather than an unresolved dirty worktree. WhatsApp had advanced to `4abf6a5f17bb` and still carried multiple user-owned modified and untracked acquisition files, so its test baseline remains deliberately unverified. The Harness remained at `23dcdc953492` with six unrelated AI-session and housekeeping files modified by another writer; no receiver-owned Harness change may begin from that worktree state.

The facts needed to plan FND-2 and OAI-1 are confirmed or corrected. MCP-1 has enough evidence to define its policy boundary, but WhatsApp remains explicitly unverified and live-process state remains unavailable. Neither gap should be converted into an assumption.

Before FND-1 is accepted as complete, record the final Arcadia commit containing this appendix. Rerun the WhatsApp product suite only after its owner settles the current worktree; that later MCP baseline is a prerequisite for MCP-3, not for the FND-2 responsibility amendment.

### Repository-structure recheck

After the earlier final recheck, the moving repositories settled again:

- Agentic Harness was clean at `aa487a960d1a`;
- `ki-techne-harness` was clean at `0cf5236b24ca` after accepting its execution-harness boundary review; and
- `tools-techne` was clean at its initial commit `46be296837b6`, still with only `README.md` and no KI contract.

These revisions supersede the earlier Harness and Techne Harness worktree warnings for structure planning only. Receiver-owned delivery must still re-read its own baseline immediately before implementation.
