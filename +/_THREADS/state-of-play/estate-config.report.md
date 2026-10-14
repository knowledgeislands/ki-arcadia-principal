# estate-config report — 2026-10-11

Authority: state-of-play Decisions 48 and 49. Every commit touches only `.ki.toml` and was pushed fast-forward to `origin/main`. No pull requests were needed and no repository refused a direct push. All worktrees and `estate-config-cfg` branches have been removed.

## Done

| Repository | Change | Commit | Pushed |
| --- | --- | --- | --- |
| ki-arcadia-principal | `territory_prefix` `ki` → `knowledge-islands` | `3712205` (rebased over 4 upstream checkpoint commits) | yes |
| kit-hnr | `territory_prefix = "humans-not-robots"`; layout | `a14645e` | yes |
| er-research | `territory_prefix = "equal-remedy"`; layout | `1e6c18e` | yes |
| vallearmonia-principal | `territory_prefix = "valle-armonia"`; layout | `246ad95` | yes |
| kit-techmedix | `territory_prefix = "techmedix"`; title "TechMedix Knowledge Base"; layout | `43b6a04` | yes |
| kit-legal | `territory_prefix = "legal"`; title "Legal Knowledge Base" | `00d473bf` | yes |
| kit-principal | `territory_prefix = "personal"`; title "Personal Principal"; layout | `af942b9` | yes |
| 5g-emerge-apex | layout (FILES-10) | `6d59869` | yes |
| 5g-emerge-demos | retired `ki-work-roadmap.themes` removed; layout | `82f26c7` | yes |
| 5g-emerge-phase2 | layout | `6d0f4b8` | yes |
| 5g-emerge-phase3 | retired `themes` removed; layout | `97daa21` | yes |
| 5g-emerge-testbed | layout | `6f97350` | yes |
| dafacts-website | retired `themes` removed; layout | `55b00cf` | yes |
| er-agentic-harness | retired `themes` removed; layout | `f7add72` | yes |
| hnr-agentic-harness | retired `themes` removed; layout | `6872f74` | yes |
| infoschematics | layout; declared `[skills.ki-work-roadmap]` root before its `.areas` child (FILES-9) | `8b4e3b03` | yes |
| kit-kris.me.uk | retired `themes` removed; layout | `fc08b5d` | yes |
| kit-midnight.ninja | layout | `47f551e` | yes |
| mark-markhowarth.com | retired `themes` removed; layout | `432e3ae` | yes |

"Layout" means the FILES-10 mechanical rules: exactly one blank line before each table, and arrays written one element per line with a trailing comma. Each rewrite was checked to parse to identical TOML data, apart from the intentional removals.

The other 22 registered repositories had no findings confined to `.ki.toml`. The exception is vallearmonia-website (see Needs Kris).

Checks:

- Re-audit of every changed worktree: no `.ki.toml` findings remain, apart from the ones listed under Needs Kris.
- `ki territory list` shows seven handles and no collisions.
- `ki territory show` succeeds for all seven handles.
- `ki territory audit` gives `FINDINGS=0` for equal-remedy (3 repositories), knowledge-islands (20), legal (1), personal (5) and techmedix (1).
- Membership cross-check: every member URL is a registered repository, and every registered repository is in exactly one territory's members, consistent with its `capital`.
- Commit gates: husky and `.githooks` gates ran after `bun install --frozen-lockfile`. No `--no-verify` was used.

Primary checkouts were fast-forwarded where they were clean and not ahead: 37 of 41.

## Failed

- `ki registry list --territory <handle>` does not exist in this `ki` version. It fails with "does not accept repository selectors", so I verified with `ki territory show` and `ki territory audit` instead.
- 5g-emerge-demos: `bun install --frozen-lockfile` reported "Failed to install 6 packages". The husky gate was installed anyway and the commit passed. kit-legal's frozen install failed because its lockfile is out of date, but kit-legal has no hook path set, so nothing was gated. I fixed neither, as briefed.

## Needs Kris

- **Primary checkouts not fast-forwarded, because they hold unpushed local commits.**
  - kit-hnr is 1 ahead (`d81fead` docs(checkpoints)).
  - vallearmonia-principal is 3 ahead (`6c7e8e5`, `efccc59`, `d54c2a0`).
  - Until each is pulled and rebased, the registry still shows `kit-hnr` and `vallearmonia-principal` as handles. After that they become `humans-not-robots` and `valle-armonia`, and both need a re-check with `ki territory audit -t <handle>`.
  - kit-acquire is 2 ahead. tools-rig is 1 ahead and has 15 uncommitted changes. Neither was changed by this run.
- **kit-acquire `.ki.toml` exists only in the unpushed local commit `a5ba21b`.** `origin/main` has no `.ki.toml`, so I could not audit or conform it from a fresh worktree.
- **Area-to-theme maps (ROAD-6 FAIL).** These need area titles chosen, for example `WEB = "Website"`, so I left them:
  - 5g-emerge-apex: WEB, GOV, HK, OPS
  - 5g-emerge-demos: DBD and others
  - 5g-emerge-phase2: DATA, GOV, HK, OPS
  - 5g-emerge-phase3: GOV and others
  - 5g-emerge-testbed: DATA and others
  - kit-midnight.ninja: APEX, RIG, TOWER
  - vallearmonia-website: GOV, SANC, SITE, SEO, CUR, OPS, CONT, MEM, WEB
- **er-research still has `[skills.ki-work-roadmap] themes = [...]`.** The audit does not flag it there, so I left it. Decide whether to remove it for consistency.
- **README H1 now differs from the new titles (FILES-2 FAIL).** This needs README edits, which are outside this run's scope. It affects kit-techmedix, kit-legal and kit-principal.
- **Audit noise to note.** Run in a worktree, RUNTIMES-2 "activation is missing" and REPO-REG-1 fail on every repository because worktrees have no projections and no registration. A primary-checkout audit does not show them, so I treated them as artefacts. Toolchain, Knip, TSC, ROAD-7 ledger and BODY-11 findings are not `.ki.toml`-confined and were left for owners.

## Old-handle references

Only `ki` appears as a selector. I found no uses of `kit-hnr`, `er-research`, `vallearmonia-principal`, `kit-techmedix`, `kit-legal` or `kit-principal` as selectors, and none in chezmoi. Paths below are relative to `~/workspaces/kit/knowledgeislands/`.

### ki-arcadia-principal

- `README.md:5`: `-t ki`
- `Admin/Governance/Charter.md:50`: `-t ki` and the prose "`territory_prefix = "ki"` as the short..."
- `Admin/Governance/Known Lands.md:71`: `-t ki`
- `Streams/Initiatives/knowledge-islands-model/design/territory-selection-decisions.md:65`: `-t ki` (a historical decision record)

### tools-ki

- `README.md:70, 72, 159`: `--territory ki`
- `docs/guides/user/territory-selection.md:7, 9, 13, 17, 19`: `-t ki`
- `docs/guides/user/repository-operations.md:17`: `ki repo -t ki -f tools- audit --concise`
- `src/tests/cli/territory/selection.test.ts:165, 167, 173, 176, 181, 183`: `-t ki`. These may be self-contained fixtures; check before changing.

### tools-mgit

- `README.md:65`: `mgit --territory ki status`
- `README.md:68`: `mgit -t ki -f tools- -f kit- status`
- `docs/guides/user/running-commands.md:53, 77`: `mgit --territory ki sync`
- `docs/guides/user/running-commands.md:76`: `-t ki`

### ki-website

- `apps/site/src/docs/ki/operator-guides.md:106`: `-t ki` (two occurrences)

### apps-observatory

Docs and records:

- `docs/guides/operator/run-the-observatory.md:33`: `--scope territory:ki`
- `docs/guides/operator/choose-what-to-observe.md:11`: example `territory:ki`
- `docs/roadmap/KI-OBS-APP-041-adopt-territory-selection.md:50, 102, 149, 167`: `--territory ki` and `territory:ki` (a work record)

Tests, as occurrence counts of `territory:ki`, which are probably fixtures:

| File | Occurrences |
| --- | --- |
| `apps/site/src/server.test.ts` | 49 |
| `apps/site/src/shell.test.ts` | 17 |
| `packages/instruments/src/beacon.test.ts` | 14 |
| `packages/evidence/src/scope.test.ts` | 7 |
| `packages/contracts/src/observation.test.ts` | 6 |
| `packages/instruments/src/roadmap.test.ts` | 6 |
| `packages/instruments/src/decisions.test.ts` | 5 |
| `packages/evidence/src/decisions.test.ts` | 5 |
| `apps/site/src/page.test.ts` | 4 |
| `apps/site/src/answers.test.ts` | 4 |
| `packages/evidence/src/roadmap.test.ts` | 3 |
| `apps/site/src/main.test.ts` | 2 |
| `packages/evidence/src/ki.test.ts` | 2 |
| `packages/contracts/src/history.test.ts` | 1 |
