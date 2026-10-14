# KB-IDS — rename the ki-kb-fs knowledge-base IDs (Decisions 76, 117, 118)

## Done

- **Map renamed.** The `kit-mcp-ki-kb-fs` map in chezmoi `.chezmoidata/mcp-servers.yaml` now uses repository names: `ki-principal`, `apps-knowledgeislands.info`, `hnr-principal`, `hnr-shared`, `legal-principal`, `personal-principal`, `va-principal`, `apps-vallearmonia.com`. Committed as chezmoi `7121fae`.
- **Three bases added:** `er-principal`, `si-principal` and `tmx-principal`. The server's README supports any local KI knowledge-base directory, and all three are registered `ki-repo-kb` Capitals with the standard zones.
- **Targets applied:** only `~/Library/Application Support/Claude/claude_desktop_config.json` and `~/.mcporter/mcporter.json`. Each diff was the single map line; mcporter.json needed `--force` because it had changed since chezmoi last wrote it, and the diff showed nothing else would be lost. `~/.codex/config.toml` and `~/.claude.json` don't carry the map (Codex and Claude Code reach the server through `ki-mcporter`).
- **Smoke test passed:** the built server (`dist/`) started over local stdio with the new map, listed all 11 bases with their zones, and answered `kb_config` for `personal-principal` without error.
- **mcp-ki-kb-fs `4e87685`:** example and test aliases changed from `kit-pkb`/`kit-legal` to `personal-principal`/`legal-principal` in `.env.example`, `AGENTS.md`, `claude-config-sample.json`, the user guides and `src/config`. Checks passed: `tsc`, 356 tests, coverage, build, `ki:test:smoke`, and `ki repo audit` with no failures.
- **hnr-principal `9ace88f`:** 15 files updated, covering the activity prompts, the HNR Streams Tracker, Email Pulse and Council live artifacts, and the Integrations note (its stale per-KB server rows now name the consolidated server and the `kb` alias).
- **legal-principal `3ea82773`:** 16 files updated, covering `kb:` arguments in `AGENTS.md`, `CLAUDE.md`, `CLAUDE-CODE.md`, Admin notes, the live artifacts and the slash commands. The `kit-legal-notes`/`kit-legal-sources` store names and the Cowork `/mnt/kit-legal` mount were left alone because they aren't KB IDs.
- **personal-principal `baa8613`:** 9 files updated, covering the activity prompts and the Integrations note.
- **Left as historical record on purpose:** dated Calendar notes, dated reports, roadmap records, checkpoints, `Mistakes and Lessons`, and the sampling footnotes in ki-agentic-harness `ki-repo-kb/references/sources.md`. No harness skill passes an old alias, and hnr-agentic-harness has no references, so no harness commits were needed.

## Failed

- Nothing failed.

## Needs the owner

- **Nothing is pushed.** The brief said push on fast-forward, but the appended footer said no fetch or push, so I took the stricter rule. These local commits need pushing from terra:
  - chezmoi `main` `7121fae`
  - mcp-ki-kb-fs `main` `4e87685`
  - hnr-principal `main` `9ace88f`
  - legal-principal `main` `3ea82773`
  - personal-principal `main` `baa8613`
- **Restarts needed (not done):** quit and reopen Claude Desktop so it reads the new map. Then run `mcporter daemon restart` so Claude Code and Codex get it too.
- **Cowork copies still use the old aliases.** The deployed live artifacts (HNR Streams Tracker, Email Pulse and Council; Legal Command Centre, Hearing Dashboard and Activity Status) and any Cowork scheduled tasks copied from the activity notes still carry the old aliases. They need redeploying or resyncing from the updated repo notes. A Cowork space memory (`reference_pkb_key_notes.md`) also still names `kit-pkb`.
- **Unrelated chezmoi drift left unapplied:** `~/.bashrc`, `~/.gitconfig`, `~/.config/rig/conf.d/16-homebrew.toml` and `~/.config/rig/conf.d/40-macos.toml`.
