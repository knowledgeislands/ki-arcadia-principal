# Step 9d - re-key tools-ki to KI-TOOL-KI: report

Authority: Decision 100. Method from `s9-rekey.report.md`. Git history is untouched.

## Done

- **Re-keyed tools-ki** `KI-TOOL` → `KI-TOOL-KI` in current HEAD and pushed fast-forward to `main`: 522 tokens in 20 files and 11 file renames: four work records, seven Decision Records, plus `.ki.toml`, the decisions index, the releasing guide and six test files. No other old code was present.
  - `b1079e1` `chore(repo): re-key repository code KI-TOOL to KI-TOOL-KI`: file renames only. A staging slip left the content edits out of this commit.
  - `f540c23` `chore(repo): rewrite KI-TOOL references to KI-TOOL-KI`: the content edits. Together the two commits make the complete re-key.
- **Records now**: [KI-TOOL-KI-CLI-115](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-115-enforce-roadmap-writing-checkout.md), [KI-TOOL-KI-CLI-116](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-116-launcher-held-wait-gates.md), [KI-TOOL-KI-CLI-118](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-118-capital-stores-and-territory-aliases.md), [KI-TOOL-KI-CLI-120](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-120-personal-territory-ranking.md).
- **Checks**: vitest passes 1130 of 1130 tests with 100% coverage. `tsc --noEmit` and Biome are clean, and so are the commit hooks (commitlint, lint-staged, syncpack). A final sweep finds no old code left.
- **`ki repo audit`**: FAIL=1 WARN=3. The single failure is Knip (KNIP-2), caused by unused exports in `src/core/estate/index.ts`. It fails the same way on the HEAD before the change, so it does not come from this run.

## Needs Kris

- Knip has been failing in tools-ki since before this run, because of unused exports in `src/core/estate/index.ts`. Whoever owns that estate work should clear it.
