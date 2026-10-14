# Claude path memory: moved into repositories and retired

Authority: Decision 142.

## Done

- Inventoried all 38 files under `~/.claude/projects/*/memory/`. 37 were in 10 stale folders and one was in the live `~/.claude` folder. Each file was routed as shown in the table below.
- Moved the guidance into three repositories. Each change is a separate commit, pulled with rebase and pushed fast-forward:
  - **chezmoi** `cf5c1e9`: adds cross-project preferences, Claude Code runtime cautions and delegation-brief rules to `dot_claude/`, plus an "Effects on Claude Code" section in `docs/guides/tools/headroom.md`. Gate: `ki repo audit` gave PASS=18 WARN=3 FAIL=0, all three warnings pre-existing. `node --test` gave 215 pass, 0 fail. `rumdl check .` was clean.
  - **hnr-principal** `934b3c3`: the README now warns against `git mv` across the `hnr-shared` symlinks. The repository has no gate. `prettier --check README.md` flags formatting drift that was already in the file before this commit.
  - **legal-principal** `7c03fddb`: `CLAUDE.md` gains a "Clickable File Links" section on encoding paths. `rumdl check` was clean.
- Archived everything to `backups/claude-projects-20261012-192427.tar.gz` (18.6 MB, 193 entries, gzip integrity checked). That covers every `memory/` folder and all 16 stale project folders. These are the 10 stale memory folders, plus `hnr-kis`, `kit`, `kit-knowledgeislands`, `kit-knowledgeislands--wt-harness-c`, two `claude-bg` worktrees and `/private/tmp/gov144-smoke`.
- Then deleted the 16 stale folders, `-Users-krisbrown--claude/memory/` and two empty `memory/` folders (`-private-tmp`, `-Users-krisbrown--paperclip-runtime`). No `memory/` folder remains. 45 live project folders remain. This thread's transcript folder was not touched.
- Four folders whose transcripts record an old working directory were kept: `apps-knowledgeislands.info`, `apps-observatory.local`, `apps-midnight.ninja` and `apps-vallearmonia.com`. Their folder names match current checkouts.

## Routing table

| Memory file (old project) | Decision | Target |
| --- | --- | --- |
| `~/.claude` MEMORY.md (Headroom learn block) | Drop | Machine-generated error-recovery noise |
| ibc-2026 config-in-typescript-not-json | Merge | chezmoi `private_CLAUDE.md.tmpl`, cross-project preferences |
| ibc-2026 ibc-cf-push-deploy-broken | Drop, stale | Status from 7 Sep 2026. The repo is now `5g-emerge-demos`, and `docs/guides/developer/cloudflare.md` holds the intended values |
| ibc-2026, testbed-website, ki-website MEMORY.md | Drop | Empty indexes |
| kit-hnr feedback_last_reviewed_format | Drop | Only four notes still carry the line and all use full dates. The current Note Format no longer documents it |
| kit-hnr feedback_mcp_no_version_bumps | Drop, superseded | `mcp-ki-kb-notion-mirror` is now versioned (0.9.0) |
| kit-hnr feedback_mirror_full_width_unusable | Drop, obsolete | The current MCP has no `full_width` argument |
| kit-hnr feedback_no_git_mv_across_symlinks | Move | hnr-principal `README.md`, "Shared content" section |
| kit-hnr feedback_scripts_typescript_only | Merge | Already covered for KI repos by `ki-engineering`. The general preference went to chezmoi with the config item |
| kit-hnr MEMORY.md (learn block: sequential agents) | Drop | Covered by delegation preferences, which ask before fanning out |
| kit-hnr project_frontend_react_not_nextjs | Drop, done | No "Next.js" text remains, and the ADRs say React SPA |
| kit-hnr project_streams_decoupled_from_linear | Drop, done | No `## Linear` sections remain. Streams are now roadmap records |
| kit-legal vscode-file-link-encoding (+ MEMORY.md) | Move | legal-principal `CLAUDE.md` |
| harness ai-cost-optimisation-tools | Drop, covered | ADR-KI-HARNESS-TOOLCHAIN-002 records each tool's disposition |
| harness cognitive-model-clarity | Merge | chezmoi cross-project preferences |
| harness feedback-adversarial-review-for-hooks | Merge | chezmoi `private_delegation.md.tmpl` |
| harness feedback-concurrent-session-writes | Merge | chezmoi, Claude Code runtime section |
| harness feedback-cwd-resets-additional-dirs | Merge | chezmoi, Claude Code runtime section |
| harness feedback-delegation-briefs-repo-idiom | Merge | chezmoi `private_delegation.md.tmpl` |
| harness feedback-fake-compaction-injection | Drop, covered | Built-in injection handling. The Headroom artefact warning is now in `headroom.md` |
| harness feedback-verify-flags-against-binary | Merge | chezmoi, Claude Code runtime section |
| harness headroom-config | Merge | chezmoi `docs/guides/tools/headroom.md`: tool search, injected artefacts, compressed `Read`, `--learn`. The old flag list was dropped because the guide owns deployment |
| harness MEMORY.md, mcp-git-audit, tools-ki MEMORY.md | Drop | Indexes and learn-block noise |
| harness project-harness-runtime-strategy | Drop, covered | SDR-KI-HARNESS-002 is authoritative. The background digest stays in the archive only |
| harness project-mcp-gsuite-shared-oauth | Drop | `mcp-gmail` is gone from the estate. The caveat about keeping the shared OAuth client stays in the archive |
| harness project-skill-script-installation | Drop, covered | Codified as SCRIPT-7 in the `ki-skills` rubric |
| harness read-only-audit-no-lint-md | Merge | chezmoi `private_delegation.md.tmpl` |
| harness reference-mcporter-connector-mapping | Drop, covered | ADR-KI-HARNESS-TOOLCHAIN-003, `ki-binding` `clients:` and the harness ROADMAP |
| vallearmonia feedback_bulk_git_push_delete_blocked | Drop | It describes working around a safety classifier and should not be codified |
| vallearmonia feedback_test_at_boundaries | Drop, covered | ADR-VA-WEBSITE-003, plus `ki-engineering` boundary and mutation evidence |
| vallearmonia project_deploy_workflow (+ MEMORY.md) | Drop, covered | `docs/guides/ops/ingress.md` § "Auto-deploy on push (Workers Builds)" and the deploy guides |
| vallearmonia user_github_handle | Merge | chezmoi cross-project preferences (`krisb`) |

## Recommendation: auto-memory

Claude Code's auto-memory is already off and chezmoi-managed: `autoMemoryEnabled: false` is one of the core keys that `bin/chezmoi/executable_json` owns. No settings change is needed.

The source that still writes path memory is Headroom. Launchd agent `com.headroom.default` is running with `--learn`, and it writes "Headroom Learned Patterns" blocks into `~/.claude/projects/*/memory/MEMORY.md`. It also writes them into tracked repository `CLAUDE.md` files, for example in hnr-principal and legal-principal. The Headroom guide treats `init-user` as the owned deployment, and that profile has no `--learn` and is not running. I recommend retiring the `default` profile, or at least dropping its `--learn`, so that path memory stops accruing. I made no change.

## Needs the owner

- Review `chezmoi diff` for `~/.claude/CLAUDE.md` and `~/.claude/delegation.md`, then apply. I committed the source but did not apply it.
- Decide whether to retire Headroom's `default` profile or its `--learn` flag, per the recommendation above.
- Optional: enact the runtime-strategy background digest into the ki-principal knowledge base through its Enactment Process. It is in the archive under the old harness folder.
