# mcp-conformance: Codex retirement and MCP/tooling currency

Run: 2026-10-11 03:26 BST. Read-only; no edits, commits, pushes, fetches or remote calls. Authority: state-of-play Decision 37.

All 15 primary checkouts were clean, on `main`, and level with their local `origin/main` ref. That ref was last fetched before this run, since this run makes no fetch. Audits therefore ran in the primary checkouts with `ki` 0.10.0; no temporary worktree was needed.

## 1. Retiring mcp-housekeeping-codex

### Codex is already served by mcp-housekeeping-chatgpt (confirmed)

- `mcp-housekeeping-chatgpt` registers `codex_sessions_discover`, `codex_sessions_list`, `codex_session_read` and `codex_sessions_checkpoint` through Codex's app server (`src/main/codex/app-server.ts`, README lines 3–15).
- In the live `~/.codex/config.toml`, the only housekeeping MCP server is `[mcp_servers.kit-mcp-housekeeping-chatgpt]`. The same holds for `~/.mcporter/mcporter.json`. Neither `~/.claude.json` nor the Claude Desktop config references a Codex server.
- No live MCP client config launches `mcp-housekeeping-codex`, and its repository has no open work. Its `docs/roadmap/` holds only `_ISSUES.md` (FND reserved through 004, with no records left), `+/_TRADES/` holds only a README, and it has a single worktree and no branches beyond `main`.

### References found

| Owner | Location | State |
| --- | --- | --- |
| chezmoi | `dot_mgit.toml`, `dot_config/ki/config.toml`, `.chezmoidata/trusted-folders.yaml`, VS Code workspace, `.chezmoiremove` | **Done in source** in local commit `dd55a2e`, which is not pushed (`main` ahead 1). |
| chezmoi (applied targets) | `~/.codex/config.toml:264` `[projects."…/mcp-housekeeping-codex"] trust_level = "trusted"` | Still live: the source change has not been applied yet. The VS Code workspace file is already gone, and the live `~/.config/ki/config.toml` and `knowledgeislands/.mgit.toml` no longer mention the repository. |
| `ki` registry (machine) | `ki registry list` still lists `…/knowledgeislands/mcp-housekeeping-codex` | Unregister last. |
| ki-arcadia-principal | `.ki.toml:46` (repository list); `Admin/Governance/Known Lands.md:40,88`; `Streams/Projects/estate-factorisation.md:34` (OAI-1); `+/_CHECKPOINTS/_state-of-play.md:70`; `+/_CHECKPOINTS/rig.chezmoi.md:20` | The `.ki.toml` and Known Lands entries need removing or marking as archived. Mark OAI-1 delivered. The checkpoints are history and update as normal. |
| ki-agentic-harness | `skills/repo-structure/ki-repo-mcp/references/standards-mcp-shared-code.md:22,23,36,57` (shared-code table and pilot rule naming `MCP-HC-FND-001`, which has been pruned) | Remove the row and rule, and move the legacy access and result clusters to `mcp-housekeeping-chatgpt` alone. |
| ki-agentic-harness | `skills/repo-structure/ki-repo-mcp/references/sources.md:39,64` | Update the sibling-repository list and count. |
| ki-agentic-harness | `docs/decisions/ADR-KI-HARNESS-SKILLS-007…md:16` names `ki-housekeeping-codex`, a skill that no longer exists (the harness has `ki-housekeeping-chatgpt`) | Needs a decision-record supersession or amendment through `ki-decision-records`, not an inline edit. |
| ki-agentic-harness | `docs/roadmap/KI-HARNESS-GOV-168-roll-out-ki-pin-receivers.md:41` | Drop the repository from the in-scope list. |
| ki-agentic-harness | `skills/environment/ki-housekeeping-chatgpt/scripts/app-server.ts:268` clientInfo `ki_housekeeping_codex` | Cosmetic client name only, so optional. |
| ki-techne-harness | `operations/aws/agent-host/host/repositories.txt:15` | Remove the line, or the agent host keeps cloning an archived repository. |
| mcp-housekeeping-chatgpt | `bun.lock:6` workspace name `@knowledgeislands/mcp-housekeeping-codex` (`package.json` is already `…-chatgpt`) | Regenerate the lockfile (quick fix). `src/main/codex/app-server.ts:376` clientInfo `ki_housekeeping_codex` and the test temp-directory prefixes are cosmetic. |
| tools-ki, other `mcp-*`/`tools-*` repositories, the 42 registered repositories | none | No reference. |

### Ordered plan

1. **Rig: chezmoi thread:** push `dd55a2e` when Kris asks, then run `chezmoi apply`, after reviewing `chezmoi diff`. That removes the trusted-project entry from `~/.codex/config.toml` and confirms the workspace removal.
2. **mcp-housekeeping-chatgpt:** regenerate `bun.lock` so its workspace name matches `package.json`. Optionally rename clientInfo `ki_housekeeping_codex` to `ki_housekeeping_chatgpt`, mirrored in the harness copy.
3. **ki-agentic-harness:**
   - Update `standards-mcp-shared-code.md` and `sources.md`.
   - Remove the repository from KI-HARNESS-GOV-168's list.
   - Supersede or amend ADR-KI-HARNESS-SKILLS-007's `ki-housekeeping-codex` pairing to `ki-housekeeping-chatgpt` ↔ `mcp-housekeeping-chatgpt`.
4. **ki-techne-harness:** drop the line from `repositories.txt`.
5. **ki-arcadia-principal:**
   - Remove the repository from `.ki.toml` `repositories`.
   - Mark it archived or remove it in Known Lands.
   - Record OAI-1 as delivered in estate-factorisation.
   - Note the retirement in the state-of-play checkpoint.
6. **Records and issues to close:** the repository has no open local roadmap records or trades. GitHub issues and PRs could not be checked, because this run makes no remote calls. Kris or a networked run should list and close any before archiving.
7. **GitHub (Kris):** archive `knowledgeislands/mcp-housekeeping-codex`, after steps 1–6 land so that no consumer clones or audits it. It is not a tap dispatch consumer.
8. **Machine:** run `ki registry remove` for `…/knowledgeislands/mcp-housekeeping-codex`, then delete or move aside the local clone, with Kris's confirmation.

## 2. Currency

Latest `ki` release: v0.10.0. Every repository below pins `KI_VERSION: v0.8.4` inline in `.github/workflows/ci.yml`. None has `.github/ki-version` or `update-ki-pin.yml`. Audit counts are findings from `ki repo audit --repo .`.

| Repository | ki pin | Audit FAIL | Audit WARN | Findings | Concept gaps |
| --- | --- | --- | --- | --- | --- |
| apps-observatory | v0.8.4 inline | 0 | 2 | CI-1 inline pin; HOOK-1 no pre-commit | pin receiver (needs-work); delegation (needs-work†) |
| mcp-acquire-whatsapp | v0.8.4 inline | 0 | 2 | CI-1; HOOK-1 | pin receiver |
| mcp-git-audit | v0.8.4 inline | 1 | 2 | GUIDE-6 `working-on-the-code.md` (112/120 chars); CI-1; HOOK-1 | pin receiver |
| mcp-gsuite | v0.8.4 inline | 2 | 2 | GUIDE-6 `local-development.md` (90), `outbound-and-settings-review.md` (0); CI-1; HOOK-1 | pin receiver |
| mcp-housekeeping-chatgpt | v0.8.4 inline | 0 | 2 | CI-1; HOOK-1 | pin receiver; stale `bun.lock` name |
| mcp-housekeeping-claude | v0.8.4 inline | 0 | 2 | CI-1; HOOK-1 | pin receiver |
| mcp-housekeeping-codex | v0.8.4 inline | 0 | 2 | CI-1; HOOK-1 | retire; do not modernise |
| mcp-ki-kb-fs | v0.8.4 inline | 0 | 2 | CI-1; HOOK-1 | pin receiver |
| mcp-ki-kb-notion-mirror | v0.8.4 inline | 1 | 2 | GUIDE-6 `definition-of-done.md` (72); CI-1; HOOK-1 | pin receiver |
| mcp-m365 | v0.8.4 inline | 0 | 2 | CI-1; HOOK-1 | pin receiver |
| tools-git-almanac | v0.8.4 inline | 0 | 2 | CI-1; HOOK-1 | pin receiver |
| tools-ki | v0.8.4 inline | 0 | 2 | CI-1; HOOK-1 | pin receiver: self-tracking or build from source, Kris to decide (KI-HARNESS-GOV-168) |
| tools-mgit | v0.8.4 inline | 0 | 1 | HOOK-1 (CI-1 not raised‡) | pin receiver |
| tools-rig | v0.8.4 inline | 0 | 1 | HOOK-1 (CI-1 not raised‡) | pin receiver |
| tools-techne | v0.8.4 inline | 0 | 2 | CI-1; HOOK-1 | pin receiver |

† apps-observatory `AGENTS.md:14` tells every delivery to `launchctl kickstart` the local service. That conflicts with the background-run rule of no environment change, and with running from a worktree. It needs a carve-out for interactive sessions only. ‡ tools-mgit and tools-rig carry the same inline pin, but their audit did not raise CI-1, so the CI-1 rule misses them. A harness follow-up should check why.

Concept checks, applied to all 15 repositories:

- **Checkpoint `label`:** no repository holds `+/_CHECKPOINTS/`, so not applicable.
- **ROOT-3 decision-record scope:** every decision-record identifier matches its `repo_code`. tools-mgit and tools-techne have no decision records. No gap.
- **Release-on-demand:**
  - `tools-*` repositories all have `docs/guides/developer/releasing.md` citing the policy. No gap.
  - `mcp-*` repositories and apps-observatory have no tags and no releasing guide. The policy applies only when a repository cuts releases, so there is no gap now. Add a guide pointer at the first release.
- **Pin receivers (KI-HARNESS-GOV-168):** every repository has a gap. The file conversion is mechanical, but the receiver stays inert until Kris completes the ruleset, App installation, credentials and auto-merge setup. Rate the conversion quick-fix and full adoption needs-work.
- **Granola central acquisition:** implemented in tools-ki at `94f3a37`. The paired KI-HARNESS-OPS-008 is `awaiting-review`. Other repositories mention Granola only in fixtures or vendor names. No gap.
- **Background-run worktree rules:** no repository-local rule contradicts them, apart from apps-observatory (†).

## 3. Quick fixes, by repository

Each is mechanical and fits one commit.

- **mcp-git-audit:** lengthen the opening of `docs/guides/developer/working-on-the-code.md` to at least 120 characters of prose (GUIDE-6).
- **mcp-gsuite:** add an outcome-first opening paragraph of at least 120 characters to `local-development.md` and `outbound-and-settings-review.md` (GUIDE-6).
- **mcp-ki-kb-notion-mirror:** lengthen the opening of `definition-of-done.md` (GUIDE-6).
- **mcp-housekeeping-chatgpt:** regenerate `bun.lock` (stale `@knowledgeislands/mcp-housekeeping-codex` name).
- **All except mcp-housekeeping-codex (14 repositories):**
  - Move `KI_VERSION` to `.github/ki-version` at `v0.10.0` and add `update-ki-pin.yml` from the `ki-engineering` exemplar (CI-1). This goes through KI-HARNESS-GOV-168's trades.
  - Add a committed `.githooks/pre-commit` gate (HOOK-1). This is quick per repository if the exemplar hook fits, but check each repository's gate command first.
- **ki-techne-harness:** drop the `mcp-housekeeping-codex` line from `repositories.txt`.
- **ki-agentic-harness:** drop `mcp-housekeeping-codex` from `standards-mcp-shared-code.md`, `sources.md`, and the KI-HARNESS-GOV-168 list.
- **ki-arcadia-principal:** drop the repository from `.ki.toml` and Known Lands.

Needs-work:

- ADR-KI-HARNESS-SKILLS-007 supersession.
- The `tools-ki` pin-receiver choice.
- Owner setup for each pin receiver.
- The apps-observatory restart rule.
- Why CI-1 misses tools-mgit and tools-rig.

## Done

- Swept the codex references and confirmed that `mcp-housekeeping-chatgpt` serves Codex.
- Wrote the eight-step retirement plan.
- Audited 15 repositories: 4 FAIL findings, 28 WARN findings.
- Checked the six harness concepts against every repository.
- No commits were made (read-only).

## Failed

- Could not check GitHub issues or PRs for `mcp-housekeeping-codex` (no remote calls allowed).
- Freshness against GitHub is unverified, since no fetch was made.

## Needs Kris

- **CODEX-push:** approve pushing chezmoi `dd55a2e`, then `chezmoi apply`.
- **CODEX-archive:** archive the GitHub repository after the reference clean-up; check for open issues first.
- **CODEX-ADR:** route the ADR-KI-HARNESS-SKILLS-007 amendment.
- **PIN-tools-ki:** decide self-tracking receiver or source build.
- **PIN-setup:** set up the ruleset, App installation and credentials for each converted repository.
- **OBS-restart:** limit apps-observatory's service restart to interactive sessions.
