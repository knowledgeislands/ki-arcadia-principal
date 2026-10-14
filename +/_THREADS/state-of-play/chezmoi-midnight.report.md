# chezmoi — midnight split follow-ups and step 9 apply

## Done

- **New checkouts listed:** `apps-rig.midnight.ninja` and `apps-tower.midnight.ninja` now sit beside `apps-midnight.ninja` in the personal `.mgit.toml`, trusted folders, `ki` config paths and two new VS Code workspaces.
- **Tower Save Nudge:** the Rig declaration comment, [the integration guide](file:///Users/krisbrown/.local/share/chezmoi/docs/guides/tools/tower-save-nudge.md), the tools index and [KB-DOTFILES-UE-071](file:///Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-071-audit-macos-privacy-permissions.md) now point at `apps-tower.midnight.ninja`. They used to say `kit-midnight.ninja`. The wrapper, its test and its fixtures never named the build location, so they needed no change. Affected tests: 30 pass, 2 skipped.
- **Sweep:** no live step 9 names remain. I left two on purpose. `ki-website` is still a key in `MCP_KI_KB_FS_KNOWLEDGE_BASES`: it is a knowledge-base identifier, its path is already updated, and renaming it would break whatever uses it. `-/rig-rationale-review.md` is a dated evidence worksheet that cites `kit-midnight.ninja` as it was then.
- **Commit:** `79cfc59`, pushed fast-forward to `main`. Gate: `ki repo audit` PASS 19 / WARN 2 / FAIL 0 (both warnings are in ki-agentic-harness). `node --test` 210 pass / 0 fail. `rumdl` clean.
- **Applied** after checking each diff. Each one held only the expected path changes, and two Rig files also carried the already-committed record re-key:
  - `.claude/settings.json`, `.codex/config.toml` and the Claude Desktop config: old site/website/observatory folder paths swapped for the `apps-*` paths, plus the two new trusted folders.
  - `~/.config/ki/config.toml`: renamed paths and the two new ones.
  - Rig `10-applications.toml` and `50-services.toml`: the Tower comment, the Observatory working directory and the record-ID re-key text.
  - The four territory `.mgit.toml` files: member names and sources.
  - `~/workspaces/vscode/`: 9 workspaces added. The 7 old ones were removed through the `.chezmoiremove` entries.
  - `.mcporter/mcporter.json` already matched (its only hit is the `ki-website` key above).
- **`rig doctor`:** 3 findings before, 2 after. Applying `50-services.toml` cleared the `service.observatory` plist drift, so the Observatory service needs no restart. mcporter's rendered config did not change, so it needs no restart either.
- **`ki territory audit --estate`:** healthy, 49 repositories, 0 findings.
- **`mgit status`:** 49 repositories, all clean except as below.

## Failed

- None.

## Needs Kris

- **Not applied, unrelated drift on this machine:** `.bashrc`, `.gitconfig` (changed on the target too), `.config/rig/conf.d/16-homebrew.toml` and `40-macos.toml`.
- **`rig doctor` still reports `paperclip-agents: drifted`**, with one historical apply failure from 01:44 UTC today. Doctor gives no detail. Clearing it needs a reviewed `rig apply`, which was outside this run.
- **mgit:** `tools-ki` is 2 commits ahead of origin and has uncommitted changes in `src/agents/*`, `src/context.ts` and `src/core/agent/runs.ts`. That looks like another thread's work, so I left it alone. Behind origin and can fast-forward: `hnr-benchmarks` (10), `hnr-frontend` (25), `kw-website` (2), `acquire` (1).
