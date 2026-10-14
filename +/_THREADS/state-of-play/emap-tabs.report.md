# Estate map - territory ordering, planned rows, Desktop projects and Warp tabs

**Done**

- Map published: personal-principal `e803207` on `main`, pushed, level with origin. Committed `Estate Map.html` and `Estate Targets.json`. The only change to `Estate Targets.json` is `krisb/dotfiles` code_to `KB-DOTFILES`, from the correction added to `src/estate-map-corrections-merged.json` at 05:12.
- Territory tables: a new first column shows the organisation pill, and the Repository column shows the bare name. The Capital comes first, then registered and planned repositories by name, then grey unregistered or unadopted rows by organisation and then name. A bare-name edit keeps the target's organisation when it is applied as a correction. A row registered since the baseline, such as si-principal, now shows as registered.
- Planned rows: tmx-, va-, legal-, personal- and si-agentic-harness each have a dashed blue "planned - not yet created" row with the `new` badge. Each row is in its territory table and its organisation table, and the organisations summary has a new Planned column. Each row shows the title, code and path taken from its Decision 81 note. A row switches to registered once the repository exists live.
- New tabs:
  - **Desktop projects** lists one table per app with columns for on disk, in chezmoi source, target, state and content beyond the README.
  - **Warp tabs** lists the eight target tabs with their working directories.
  - Both read live state when the map is generated and save it in the snapshot as `/tmp/emap-live/desktop-projects.json`, `warp.json` and `territories.txt`.
- Live snapshot refreshed, git worktrees excluded. Checks passed: section ordering is correct, no "today" appears, and the regenerated targets differ only in the dotfiles code.
- Desktop projects differences (these match the 05:12 record):
  - Claude Desktop: Humans Not Robots - unmanaged (on disk, no chezmoi README)
  - Claude Desktop: Personal - unmanaged
  - Claude Desktop: Sacred Inquiry - unmanaged
  - Claude Desktop: Techmedix - unmanaged
  - Claude Desktop: HNR - legacy, README only
  - Claude Desktop: Kit - legacy, README only
  - Codex: Humans Not Robots - missing
  - Codex: Personal - missing
  - Codex: Sacred Inquiry - missing
  - Codex: Techmedix - missing
  - Codex: HNR - legacy, README only
  - Codex: Kit - legacy, holds content beyond the README (7 files: AGENTS.md, .codex/config.toml, two proposal notes, two blocked-run notes and others)
- Warp: no launch configurations or tab configs exist in `~/.warp/`, Warp's Application Support folder or chezmoi `dot_warp/`. All eight target tabs show as missing; every target folder exists. Setting them up is left to step 10.

**Needs Kris**

- Check the five planned harness names on the Territories tab (Decision 86). Harness creation in step 9 waits for that check.
- Codex `Kit` holds real content. Decide whether it moves (for example to Knowledge Islands) before the legacy folder is retired.
