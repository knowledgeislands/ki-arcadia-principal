# Phase 5a - repository identity configuration

## Done

- 40 registered repositories updated, committed and pushed fast-forward; every checkout is clean and level with `origin/main`. `krisb/dotfiles` needed no change (its `.ki.toml` names no renamed repository).
- All seven cloned Capitals list their members by new identity, sorted (TERR-2). `krisb/acquire` now names `krisb/personal-principal`, which clears the TERR-3 finding.
- Knowledge Islands Principal: Charter identity parameters (adds a Repository code row), AGENTS.md H1 and first line, and new [GDR-KI-PRINCIPAL-008](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Admin/Governance/Decisions/GDR-KI-PRINCIPAL-008-capital-naming.md) "Capital Naming", indexed under a new "Estate decisions" section in `Decisions.md`. Prose mentions of Arcadia were left for phase 7.
- No `ki` command renames record identifiers (`ki repo roadmap` offers only demote/list/migrate/promote/prune/stats/summary; `ki kb` is index/search), so the renames were done with `git mv` plus a reference rewrite inside each repository.

| Repository | Commit | Code change | Renamed | Audit after† |
| --- | --- | --- | --- | --- |
| `5g-emerge/5g-emerge-apex` → `5g-emerge/5g-emerge-apex` | ab873bc | unchanged | 0 records, 0 DRs | FAIL=2 WARN=4; no new finding‡ |
| `5g-emerge/5g-emerge-demos` → `5g-emerge/5g-emerge-demos` | edc9fb5 | unchanged | 0 records, 0 DRs | FAIL=5 WARN=4; no new finding‡ |
| `5g-emerge/5g-emerge-phase2` → `5g-emerge/5g-emerge-phase2` | 21807ab | unchanged | 0 records, 0 DRs | FAIL=17 WARN=4; no new finding‡ |
| `5g-emerge/5g-emerge-phase3` → `5g-emerge/5g-emerge-phase3` | ff3b34e | unchanged | 0 records, 0 DRs | FAIL=46 WARN=9; no new finding‡ |
| `5g-emerge/5g-emerge-testbed` → `5g-emerge/5g-emerge-testbed` | 0816e86 | unchanged | 0 records, 0 DRs | FAIL=2 WARN=4; no new finding‡ |
| `equalremedy/dafacts-website` → `equalremedy/er-site-dafacts` | 988acdf | DAFACTS → ER-DAFACTS | 0 records, 0 DRs | FAIL=0 WARN=4; no new finding‡ |
| `equalremedy/er-agentic-harness` → `equalremedy/er-agentic-harness` | 4c12d1b | unchanged | 0 records, 0 DRs | FAIL=22 WARN=26; no new finding‡ |
| `equalremedy/er-research` → `equalremedy/er-principal` | 289f5c7 | ER-RESEARCH → ER-PRINCIPAL | 7 records, 1 DRs | FAIL=1 WARN=3; no new finding‡ |
| `humansnotrobots/hnr-agentic-harness` → `humansnotrobots/hnr-agentic-harness` | 2c2b9a2 | unchanged | 0 records, 0 DRs | FAIL=7 WARN=5; no new finding‡ |
| `infoschematics/infoschematics` → `infoschematics/infoschematics` | cc418c03 | unchanged | 0 records, 0 DRs | FAIL=89 WARN=4; no new finding‡ |
| `knowledgeislands/apps-observatory` → `knowledgeislands/apps-observatory` | 8c5db4f | unchanged | 0 records, 0 DRs | FAIL=0 WARN=4; no new finding‡ |
| `knowledgeislands/homebrew-tap` → `knowledgeislands/homebrew-tap` | a162c04 | BREW → KI-BREW | 0 records, 0 DRs | FAIL=0 WARN=3; no new finding‡ |
| `knowledgeislands/ki-agentic-harness` → `knowledgeislands/ki-agentic-harness` | 487c9717 | unchanged | 0 records, 0 DRs | FAIL=0 WARN=9; no new finding‡ |
| `knowledgeislands/ki-arcadia-principal` → `knowledgeislands/ki-principal` | 1f4ce92 | KI-ARCADIA → KI-PRINCIPAL | 3 records, 21 DRs | FAIL=1 WARN=6; no new finding‡ |
| `knowledgeislands/ki-specifications` → `knowledgeislands/ki-specifications` | 214a6a0 | unchanged | 0 records, 0 DRs | FAIL=0 WARN=3; no new finding‡ |
| `knowledgeislands/ki-techne-harness` → `knowledgeislands/ki-techne-harness` | c977ef2 | TECHNE-TOOLS → KI-TECHNE | 6 records, 0 DRs | FAIL=3 WARN=4; no new finding‡ |
| `knowledgeislands/ki-website` → `knowledgeislands/ki-website` | a66a00e | unchanged | 0 records, 0 DRs | FAIL=0 WARN=4; no new finding‡ |
| `knowledgeislands/mcp-acquire-whatsapp` → `knowledgeislands/mcp-acquire-whatsapp` | a04e5ea | MCP-WA → KI-MCP-WA | 0 records, 9 DRs | FAIL=0 WARN=4; no new finding‡ |
| `knowledgeislands/mcp-git-audit` → `knowledgeislands/mcp-git-audit` | 2e6edbe | MCP-GIT → KI-MCP-GIT | 0 records, 2 DRs | FAIL=0 WARN=4; no new finding‡ |
| `knowledgeislands/mcp-gsuite` → `knowledgeislands/mcp-gsuite` | 03da528 + de7a2ad | MCP-GSUITE → KI-MCP-GSUITE | 0 records, 1 DRs | FAIL=0 WARN=4; no new finding‡ |
| `knowledgeislands/mcp-housekeeping-chatgpt` → `knowledgeislands/mcp-housekeeping-chatgpt` | 3485f55 | MCP-HG → KI-MCP-HG | 0 records, 1 DRs | FAIL=4 WARN=3; no new finding‡ |
| `knowledgeislands/mcp-housekeeping-claude` → `knowledgeislands/mcp-housekeeping-claude` | 0f04565 | MCP-CH → KI-MCP-HC | 0 records, 1 DRs | FAIL=0 WARN=4; no new finding‡ |
| `knowledgeislands/mcp-ki-kb-fs` → `knowledgeislands/mcp-ki-kb-fs` | cc9680c | MCP-KBFS → KI-MCP-KBFS | 0 records, 2 DRs | FAIL=0 WARN=4; no new finding‡ |
| `knowledgeislands/mcp-ki-kb-notion-mirror` → `knowledgeislands/mcp-ki-kb-notion-mirror` | 9e69d49 | MCP-NOTION → KI-MCP-NOTION | 0 records, 1 DRs | FAIL=0 WARN=4; no new finding‡ |
| `knowledgeislands/mcp-m365` → `knowledgeislands/mcp-m365` | 7d7e651 | MCP-M365 → KI-MCP-M365 | 0 records, 2 DRs | FAIL=0 WARN=4; no new finding‡ |
| `knowledgeislands/tools-git-almanac` → `knowledgeislands/tools-git-almanac` | de02848 | ALMANAC → KI-ALMANAC | 0 records, 2 DRs | FAIL=0 WARN=4; no new finding‡ |
| `knowledgeislands/tools-ki` → `knowledgeislands/tools-ki` | 5444ab6 | unchanged | 0 records, 0 DRs | FAIL=1 WARN=4; no new finding‡ |
| `knowledgeislands/tools-mgit` → `knowledgeislands/tools-mgit` | ac1b66c | MGIT → KI-MGIT | 0 records, 0 DRs | FAIL=0 WARN=3; no new finding‡ |
| `knowledgeislands/tools-rig` → `knowledgeislands/tools-rig` | 4bf66e7 | RIG → KI-RIG | 1 records, 11 DRs | FAIL=0 WARN=3; no new finding‡ |
| `knowledgeislands/tools-techne` → `knowledgeislands/tools-techne` | 170938d | TECHNE-TOOL → KI-TECHNE-TOOL | 2 records, 0 DRs | FAIL=0 WARN=4; no new finding‡ |
| `krisb/dotfiles` → `krisb/dotfiles` | none (no change) | unchanged | 0 records, 0 DRs | not run (no change) |
| `krisb/kit-acquire` → `krisb/acquire` | 44b0d0b | KIT-ACQUIRE → KB-ACQUIRE | 0 records, 0 DRs | FAIL=8 WARN=3; no new finding‡ |
| `krisb/kit-hnr` → `krisb/hnr-principal` | a1a072e | HNR-KB → HNR-PRINCIPAL | 16 records, 1 DRs | FAIL=2 WARN=8; no new finding‡ |
| `krisb/kit-kris.me.uk` → `krisb/site-kris.me.uk` | 0892f6c | KRIS → KB-KRISMEUK | 0 records, 0 DRs | FAIL=0 WARN=4; no new finding‡ |
| `krisb/kit-legal` → `krisb/legal-principal` | caa98848 | KIT-LEGAL → LGL-PRINCIPAL | 25 records, 1 DRs | FAIL=0 WARN=4; no new finding‡ |
| `krisb/kit-midnight.ninja` → `krisb/site-midnight.ninja` | 38353f0 | MIDNIGHT → KB-MIDNIGHT | 0 records, 0 DRs | FAIL=2 WARN=5; no new finding‡ |
| `krisb/kit-principal` → `krisb/personal-principal` | a528ee1 | KIT → KB-PRINCIPAL | 30 records, 2 DRs | FAIL=6 WARN=7; no new finding‡ |
| `krisb/kit-techmedix` → `techmedix/tmx-principal` | fa5bcca | TMX → TMX-PRINCIPAL | 5 records, 1 DRs | FAIL=2 WARN=3; new GH-3 (see Needs Kris) |
| `vallearmonia/mark-markhowarth.com` → `vallearmonia/va-site-markhowarth.com` | 76955d5 | unchanged | 0 records, 0 DRs | FAIL=8 WARN=5; no new finding‡ |
| `vallearmonia/vallearmonia-principal` → `vallearmonia/va-principal` | 33208f0 | unchanged | 0 records, 0 DRs | FAIL=0 WARN=3; no new finding‡ |
| `vallearmonia/vallearmonia-website` → `vallearmonia/va-site-vallearmonia.com` | 62dbe40 | unchanged | 0 records, 0 DRs | FAIL=63 WARN=10; no new finding‡ |

† `ki repo audit --repo .` compared with a baseline taken before any change. Every repository still has pre-existing findings; the counts are the totals after the change. ‡ No new finding came from this change. Findings that only moved with a renamed record (for example ITEM-5 on `KI-TECHNE-OPS-017` and BODY-11 on the `KB-PRINCIPAL` Decision Records) were already there. Every repository picked up two machine-level warnings, CLAUDEBIND-1 and CODEXBIND-1, from the user MCP configuration (likely the concurrent chezmoi work). They are not repository content. The identity change cleared a FILES-2 failure in every renamed repository.

Commit gates (husky, lint-staged and rumdl hooks) passed on every commit; nothing was bypassed. The one remaining FAIL in ki-principal is RECORD-2 on the master's `+/_CHECKPOINTS/_state-of-play.md`, which I did not touch.

## Scope decisions I made

- **Decision Records renamed with the code.** The ROOT-3 audit rule requires every Decision Record's scope to equal `repo_code`, so changing the code without renaming them would fail the audit. I renamed the Decision Records the same way as the open records (filename, `id`, H1, index and in-repository references). This is the "DRs" column. I did not renumber or edit their content beyond the identifier.
- **Done records and history untouched.** No done record was edited. The `+/` working area (checkpoints, batches, authorisations, resume notes) and `-/` digests and logs were excluded from the reference rewrite. The one exception is the inbound trade `+/_TRADES/knowledgeislands/ki-agentic-harness/TRD-4c4d8f6c.md` in ki-principal: I updated its `receiver` and `retained_as` because AUTH-1 failed on the old identity.
- **H1 rule.** README H1 is set to the target title in every repository (FILES-2). An AGENTS.md H1 was changed only where it contained the old title.
- **Housekeeping IDs not renamed.** `MIDNIGHT-HK-001` and `MIDNIGHT-HK-002` in `kit-midnight.ninja/docs/housekeeping` are recurring-work records, not roadmap records, so they keep the old code.

## Failed

- First mcp-gsuite commit `03da528` left out the modified files: a script bug made `git add` stop at the rename's old path. Fixed with follow-up commit `de7a2ad` (no history rewrite) before any other repository ran.

## Needs Kris

- **Techmedix GitHub description (GH-3).** As asked, `.ki.toml` now says "Techmedix knowledge base.", but the GitHub description still says "TechMedix…", so GH-3 fails. Changing GitHub settings was outside my authority. Fix: `gh repo edit techmedix/tmx-principal --description "Techmedix knowledge base."`, or allow a conform run.
- **Lower-case titles from the manifest.** These target titles change the README H1 to lower case: `rig`, `ki`, `techne`, `git almanac`, `markhowarth.com`, `vallearmonia.com`. They also turned "Working in Rig" into "Working in rig" in tools-rig's AGENTS.md. Applied as written; confirm they are intended.
- **Stale identifiers left in working areas.** References to old record IDs remain in the `+/_CHECKPOINTS` files of er-principal, ki-principal, hnr-principal, legal-principal, personal-principal and tmx-principal (including the master `_state-of-play.md`). They also remain in legal-principal's `+/_BATCHES/KIT-LEGAL-BATCH-001`, `+/_AUTHORISATIONS`, `+/_RESUME` and `-/_DIGESTS`, and in er-principal's `+/_AUTHORISATIONS/ER-RESEARCH-BATCH-001`. The batch and authorisation records carry approved payload hashes, so I left them alone. The master thread should update its own checkpoint.
- **Decision Record identifiers changed.** `GDR-KI-ARCADIA-*`, `ADR-RIG-*`, `ADR-MCP-WA-*` and the others are now `GDR-KI-PRINCIPAL-*`, `ADR-KI-RIG-*` and so on. Links from other repositories (for example `tools-ki` roadmap records citing `ADR-KI-ARCADIA-002`) now point at old filenames until phase 6 and 7 sweep them.
