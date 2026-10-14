# baseline-fixes report - 2026-10-11

Authority: state-of-play Decision 51. Every commit listed is pushed fast-forward to `origin/main`. All worktrees and `bf/*` branches are removed.

## Done

1. **ESTATE-LABEL** - ki-arcadia-principal `4aa544f`: the checkpoint `label` is now `'Fnd: estate-factorisation'` and `updated_at` is bumped. Nothing else changed. The thread had moved on in the meantime, so the rebase hit a timestamp conflict, which was resolved with a fresh `updated_at`.
2. **OLD-HANDLES** - the `ki` territory selector is replaced with `knowledge-islands` in every named document:
   - ki-arcadia-principal `09aca5f`
   - tools-ki `3e926e9`
   - tools-mgit `c444341`
   - ki-website `99419e4`
   - apps-observatory `dd4afcc`

   Test fixtures are unchanged. The tools-ki selection tests build a self-contained "Example territory" with prefix `ki`, and the observatory `territory:ki-*` fixtures are synthetic. The Arcadia design-decisions note (`territory-selection-decisions.md`) and all roadmap and decision records are left as they were.

   Checks: tools-ki vitest 1104/1104 passed; tools-mgit bats 89 ok (the producer proof is skipped by design), `git diff --check` clean, rumdl clean; ki-website and apps-observatory turbo tests pass (8/8 and 2/2 tasks); rumdl is clean on every changed file; all commit hooks passed.
3. **README-H1** - the README H1 now matches the `title`. FILES-2 no longer appears among the audit failures.
   - kit-techmedix `5883311`
   - kit-legal `bcd879a6`
   - kit-principal `186bae7`
4. **ER-THEMES** - er-research `381d0d7` removes `themes` but keeps the empty `[skills.ki-work-roadmap]` header. The full audit is identical before and after (same findings, 168/209 criteria). Removing the whole table would have stopped the `ki-work-roadmap` audit from running, so the header stays.
5. **STALE-PATHS**
   - kit-principal `1668232`: DDR-KIT-001 gets a dated "Amended 2026-10-11" line pointing to `sources-personal`. The historical path text is kept.
   - Confirmed that `sources-vallearmonia-website` and `sources-kit-midnight.ninja` do not exist. Neither is in chezmoi `.chezmoidata/trusted-folders.yaml`; the stale entries were left behind in the live files, because the chezmoi modify scripts keep entries they do not manage. I edited the path strings directly in `~/.claude/settings.json`, `~/.codex/config.toml` (two `[projects."…"]` tables) and the Claude Desktop config. JSON and TOML still parse, and `chezmoi diff` is empty for all three targets. No chezmoi commit was needed.
6. **HNR-PRIMARY** - `git pull --rebase` rebased cleanly. Kris's commit is now `78e49f3`, and I pushed it fast-forward. kit-hnr has no pre-commit hook directory, so as the gate I ran rumdl on the changed file (clean) and `ki repo audit`. That audit has two failures unrelated to the change: MD-mech from one line in `Calendar/2026/2026-06 June/2026-06-25 Session - MSF Architecture.md`, and LINK-1 ambiguous wikilinks. `ki territory audit -t humans-not-robots`: REPOSITORIES=8 FINDINGS=0.
7. **ROUTE-TO-MASTERS** - for each Capital, an issue-ledger reservation commit, then a record-plus-checkpoint commit:
   - kit-hnr: `3d8d0ab`, `5844347` - [HNR-KB-KM-017](/Users/krisbrown/workspaces/hnr/kis/kit-hnr/Streams/Roadmap/HNR-KB-KM-017-review-repository-naming.md)
   - er-research: `6906061`, `25d16f3` - [ER-RESEARCH-013](/Users/krisbrown/workspaces/kit/equalremedy/er-research/Streams/Roadmap/ER-RESEARCH-013-review-repository-naming.md)
   - kit-techmedix: `e3b8117`, `670950c` - [TMX-KB-006](/Users/krisbrown/workspaces/kit/techmedix/kit-techmedix/Streams/Roadmap/TMX-KB-006-review-repository-naming.md)
   - kit-legal: `8cfc2992`, `054064b6` - [KIT-LEGAL-OPS-026](/Users/krisbrown/workspaces/kit/legal/kit-legal/Streams/Roadmap/KIT-LEGAL-OPS-026-review-repository-naming.md)
   - kit-principal: `40f1aa9`, `526c900` - [KIT-037](/Users/krisbrown/workspaces/kit/personal/kit-principal/Streams/Roadmap/KIT-037-review-repository-naming.md)
   - vallearmonia-principal (worktree only): `41af7b3`, `af63b0f` - [VA-PRINCIPAL-GOV-006](/Users/krisbrown/workspaces/kit/vallearmonia/vallearmonia-principal/Streams/Roadmap/VA-PRINCIPAL-GOV-006-review-repository-naming.md)

   All six are `status: triage` with no Project. The owner (`Master: state-of-play`) is named in the body, and each record proposes a short alias: `hnr`, `er`, `tmx`, `legal`, `personal` or `va`. The er-research record questions the Capital's name.

   Dated Open-questions bullets were added: ROAD-6 for the five `5g-emerge-*` repositories, `vallearmonia-website` and `kit-midnight.ninja`; the TMX-CO-002 delegation-packet blocker; and kit-hnr's four unlabelled checkpoints. Each Next step links its record.

   Audits: `ki-checkpoint`, `ki-work-roadmap` (where active) and `ki-repo-kb-streams` pass in all six. kit-hnr shows only the four expected RECORD-3 label warnings.

Primaries fast-forwarded: ki-arcadia-principal, tools-ki, tools-mgit, ki-website, apps-observatory, er-research, kit-legal, kit-techmedix and kit-hnr. vallearmonia-principal was not touched.

## Failed

- None.

## Needs Kris

- **kit-principal primary not fast-forwarded:** it is ahead 1 (`756cc54 docs(inbox): capture family court reading candidate`, not mine) and behind 4. It needs a `git pull --rebase` and a push by its owner.
- **Audit failures that predate this run (not caused by it):**
  - kit-legal and er-research worktrees: MD-mech (MD013 in WhatsApp evidence notes in kit-legal).
  - kit-principal: BODY-11 in DDR-KIT-001 and GDR-KIT-001 (links outside the decision collection), plus LINK-1.
  - kit-techmedix: LINK-1.
  - kit-hnr: MD-mech and LINK-1.
  - Fresh worktrees also show RUNTIMES-2, because local runtime activation is not present in a new checkout.
- **Process slip, recovered:** during item 3 I ran a bare `git stash` in three worktrees (kit-techmedix, kit-legal, kit-principal). Each entry was restored by SHA and dropped straight away. Nothing was lost, and no other session's stash was affected (each stack is per repository and was otherwise empty). Ledger rebases also used `--autostash` briefly, and every one applied cleanly.
