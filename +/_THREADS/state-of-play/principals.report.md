# tools-ki --principals selector — report

**Done**

- `--principals` added wherever `--estate` exists: `ki territory show|roots|audit|open|inspect`, `ki repo` (all operations, trade aggregation) and `ki registry add`; rejected by `ki repo init` and `ki registry list|remove`. Mutually exclusive with `--repo`, `--territory`, `--estate`; `--filter` narrows it like `--estate`.
- Order rule (derived, not hard-coded): the Capital whose `territory_members` include the canonical KI Harness `knowledgeislands/ki-agentic-harness` comes first (Knowledge Islands Principal), then the rest by territory name, ties by handle. Live result: ki, er, hnr, legal, personal, si, tmx, va.
- Target order: Zed prepends each folder, so `ki` opens in reverse and the project list reads in principals order; VS Code gets one `--new-window` call in order; Delta opens sequentially in order. All three are proven by recorded-invocation tests.
- Roadmap record [KI-TOOL-CLI-119](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-CLI-119-principals-territory-selector.md) is `awaiting-review` with its review packet. Specs (TERRITORY-002, new TERRITORY-005, REPO-AUDIT-009, REGISTRY-004), guides, README, man page and command inventory are updated. KI Specifications has no selector text, so no handoff was needed.
- Commits on `main`, fast-forwarded and pushed to origin (5444ab6..0e8b317): 3de097d (reserve CLI-119), 753795e (plan), 311c762 (feature), 0e8b317 (submit for review). No release or Homebrew publish.
- Checks: 1,120/1,120 tests passed with 100% coverage; TypeScript, Biome (no new diagnostics), mandoc lint, the command inventory and the roadmap audit passed. Remaining `ki repo audit` failures were already on `main`: KNIP-2 (unused `RollbackPlan`/`ConvergeOptions` from estate converge) and eight RUNTIMES-2 activation findings.

**Needs Kris**

- Try it with the source launcher. The installed `ki` is the released build and does not have the selector yet: `~/workspaces/knowledge-islands/tools-ki/bin/ki territory open --principals --target zed`
- Review and accept [KI-TOOL-CLI-119](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-CLI-119-principals-territory-selector.md).
- Optional: the accepted territory-selection decision in the KI Principal names only two primary scopes. Decide whether it should record `--principals`.
