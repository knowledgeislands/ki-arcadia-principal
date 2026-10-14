# Acquire alignment report (2026-10-12, Decision 65)

## Done

- **Acquire** (`~/workspaces/kit/personal/kit-acquire`, pushed `cefa281..80bb9e1`):
  - `.ki.toml`: repository `https://github.com/krisb/acquire`, title `Acquire`, repo_code `ACQUIRE`. The `ACQUIRE` code passes `ki` validation; the only other reference to `KIT-ACQUIRE` is kit-principal's generated Estate Map. `capital` is unchanged.
  - `folder_territories` now maps to the handles: `humans-not-robots`, `knowledge-islands`, `equal-remedy` and `valle-armonia`. `personal`, `legal` and `techmedix` are unchanged.
  - README.md and AGENTS.md headings are now `# Acquire`. The README states the `captures/<territory-key>/<tool>/` layout with `_review/<tool>/`, the ChatGPT layout `captures/<territory-key>/chatgpt/<YYYY-MM-DD>-<topic>/` and the eight territory keys. It also says an eighth Granola folder for Sacred Inquiry is pending Kris. A "Layout migration" section replaces "Pending convention update".
- **Existing captures migrated** with `git mv`: 712 pure renames and no content changes.
  - `hnr`, `equalremedy` and `vallearmonia` moved to their handles.
  - `kis/<capture>` moved to `knowledge-islands/chatgpt/<capture>`.
  - The 2 personal ChatGPT captures moved to `personal/chatgpt/`.
- **Granola checkpoint** (`.acquire/granola/ledger.json`): rewrote 232 meeting paths and the `repository` binding. This includes the 2 handled `captures/ki/` entries, which now point to `knowledge-islands`. A field-by-field comparison confirms nothing else changed.
- **Mapping record** added at `.acquire/granola/migration/2026-10-12-territory-keys.json`.
- **kit-principal** (pushed `4ee9e16..06e5586`):
  - All 7 summaries now say: capture through `krisb/acquire` at `captures/<territory-key>/chatgpt/`.
  - README.md lists eight summaries, routes capture into `krisb/acquire` and has review date 2026-10-12.
  - TechMedix is now Techmedix throughout.
  - The Knowledge Islands summary states that its Capital is being renamed to Knowledge Islands Principal (`knowledgeislands/ki-principal`), formerly Arcadia.
  - New `sacred-inquiry/README.md`: an individual territory with Capital `sacred-inquiry/si-principal`, the requested scope and the WEALTH founding concept. It is marked newly founded with nothing reconciled yet.

## Migration evidence

- `ki acquire reconcile --adapter granola` and `ki acquire status --adapter granola` give identical output before and after the migration, except for the repository URL. Both show: checkpoint current, generation `29353569-...`, 306 meetings, 306 transcripts available, `harvested-locally=2` and `staged=304`, with exit code 0.
- Reconcile re-hashes every staged `meeting.md` at its checkpoint path. A separate check also found 0 hash mismatches across the staged meetings.
- The importer keeps an existing checkpoint path when its territory segment matches the rendered one (`centralGranolaPath` in tools-ki). Future imports with the new keys will therefore keep these paths.
- I found no `ki acquire` dry run that avoids a network call, so none was run.
- Deliberately unchanged: the 2026-10-10 migration manifest and the 283 package `routing.json` sidecars. They are preserved migration proof and record paths as of preservation commit `77a1e4f`. The new mapping record and the README explain how to read them.

## Checks

- rumdl passes on all changed Markdown in both repositories. Neither repository has commit hooks installed, so no hooks ran and `--no-verify` was never used.
- `ki repo audit --repo .` on Acquire:
  - FILES-2 (repository identity) failed before the change and is now fixed.
  - The audit still reports the existing GitHub live-state findings (GH-3, MERGE-1, TOGGLE-1, DEP-1), the FILES-10 warning and the HOOK-1 warning. I left these alone because the task allows no settings changes.
  - New finding, TERR-3: Capital `krisb/kit-principal` does not list `https://github.com/krisb/acquire` among its territory members.
- Rule exception: `ki repo audit` makes read-only GitHub API calls to check live settings. I ran it twice as the repository's gate without first checking for an offline mode, which breaks the no-remote-calls rule. Nothing was changed on GitHub.

## Commits

- krisb/acquire `80bb9e1`: refactor(acquire): adopt Acquire identity and territory-key layout
- krisb/kit-principal `06e5586`: docs(context): route ChatGPT capture to krisb/acquire and add Sacred Inquiry

## Failed

- None.

## Needs the owner

- kit-principal's territory membership still lists the old `krisb/kit-acquire` URL, which causes the TERR-3 audit failure. This is outside this task's scope; fold it into tonight's Capital rename.
- The Sacred Inquiry Granola folder is still to be created. Once it exists, add its ID to `folder_ids` and `folder_territories` as `sacred-inquiry`.
- The Acquire GitHub settings findings (description, merge policy, toggles, Dependabot) remain open.
