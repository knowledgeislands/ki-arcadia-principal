# Principals acceptance and territory ranking: report

**Done**

- Closed [KI-TOOL-CLI-119](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-CLI-119-principals-territory-selector.md) (`24d9fd9`) and [KI-MGIT-CLI-016](/Users/krisbrown/workspaces/knowledge-islands/tools-mgit/docs/roadmap/KI-MGIT-CLI-016-principals-selector.md) (`0b0ef33`) as `done` under Decision 94. Both were committed separately and pushed, and neither was pruned.
- Delivered the territory ranking as [KI-TOOL-CLI-120](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-CLI-120-personal-territory-ranking.md). It is now `awaiting-review`, committed to tools-ki `main` and pushed in four commits: `104ab7b` reserves the number, `bd8b008` adds the plan, `ce92db6` adds the feature and `20259d3` submits the review. There was no release and no Homebrew publish.
  - **Setting:** `[territories] ranking` in the ki user configuration.
  - **What follows the ranking:** `--principals`, `ki territory list` and `--estate`. The estate groups repositories by their ranked territory, in path order within each. The `ki repo` scopes follow it too.
  - **Unset or incomplete ranking:** territories that are not ranked keep the current order, Knowledge Islands first and then by name.
  - **Single territory:** selecting one territory with `-t` is unchanged.
  - **Unknown handles:** `ki territory` commands print a warning and carry on.
  - **Malformed ranking:** the command fails with a configuration error.
  - **Documents updated:** TERRITORY-005 and a new TERRITORY-006, the territory-selection guide, the man page and the README.
- Checks:
  - tools-ki coverage gate: 1,125 out of 1,125 tests pass with 100% coverage.
  - TypeScript, Biome, mandoc, the command inventory and rumdl all pass.
  - The compiled `ki`, run against the live registry with your ranking, gives personal, knowledge-islands, legal, humans-not-robots, valle-armonia, sacred-inquiry, techmedix, equal-remedy. With no ranking set, the order is unchanged.
- mgit needed no code change:
  - Running `mgit --principals` through the committed ki visits the Capitals in the ranked order.
  - All 93 mgit tests pass with the committed ki as the producer.
- One small behaviour change applies even with no ranking: `ki territory list` now uses the same order as `--principals`, with Knowledge Islands first, instead of alphabetical handle order.

**Failed**

- None in this work. `ki repo audit` still reports the KNIP-2 failure that was already on `main`: unused `src/core/estate` exports from `ki estate converge`. One audit run also saw a roadmap-prune test fail once. It passed on rerun and in the full gate.

**Needs Kris**

1. Review and accept [KI-TOOL-CLI-120](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-CLI-120-personal-territory-ranking.md).
2. Master thread: after reviewing `chezmoi diff`, add this to `~/.local/share/chezmoi/dot_config/ki/config.toml`. The installed released `ki` ignores it until the next release; use `~/workspaces/knowledge-islands/tools-ki/bin/ki` until then.

```toml
[territories]

ranking = [
  "personal",
  "knowledge-islands",
  "legal",
  "humans-not-robots",
  "valle-armonia",
  "sacred-inquiry",
  "techmedix",
  "equal-remedy",
]
```

3. Out of scope here: Warp tabs, also named in Decision 95, are not driven by `ki`.
