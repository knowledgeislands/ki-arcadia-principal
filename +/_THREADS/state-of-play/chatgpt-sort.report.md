# chatgpt-sort report

Authority: Decision 137 (naming per Decision 135). Backups: `backups/chatgpt-sort-20261012T1043/` in this run folder (Codex `state_5.sqlite`, `.codex-global-state.json`, `config.toml`, cloud project list before and after).

## Done

- **ChatGPT desktop (unified Codex app), local projects.** Before: Valle Armonia, Kit Legal, Kit, HNR, Equal Remedy, Knowledge Islands — one folder each, and the Kit, Kit Legal and HNR folders no longer existed. After: eight pinned projects — Techmedix, Sacred Inquiry, Valle Armonia, Legal, Personal, Humans Not Robots, Equal Remedy, Knowledge Islands — each rooted at `~/workspaces/chatgpt-codex/Projects/<Territory>` (primary) plus the territory's `*-principal` checkout. The app owns this state in `~/.codex/state_5.sqlite`, so it isn't a chezmoi source.
- **ChatGPT cloud projects.** All 17 renamed to the naming convention, and no chats were moved or deleted: 12 `Kit: X` → `Personal - X` ("Side Hussle" corrected to "Side Hustle"), `HNR: 5G Emerge`/`HNR: Product` → `Humans Not Robots - …`, and `Knowledge Islands: General`, `Legal: General` and `Equal Remedy: General` → `<Territory> - General`. No duplicate cloud territory projects were created, because the local projects already provide them.
- **Claude Desktop.** Before: eight conforming pinned projects; Legal linked two missing folders (`kit-legal`, `sources-kit-legal`) and Valle Armonia linked a missing `vallearmonia-website`. After: each project links only its `~/workspaces/claude-desktop/Projects/<Territory>` folder. Unlinking deletes nothing on disk, and "Move folders to the cloud" was not used. The app is quit again, as it was before.
- **Parity.** Codex reaches every Claude Desktop MCP server (git-audit, gsuite, m365, notion-mirror, kb-fs, housekeeping) through `ki-mcporter`, plus `headroom` and `computer-use`. Cloud ChatGPT connectors were not changed.
- **Codex trust (chezmoi `62ebeaa`, pushed).** Removed the `chatgpt-codex` tag from `~/.claude`, the WhatsApp spool, the 7 OneDrive `sources-*` stores and the 5 `Resources` folders. Inventory entries without the tag are now pruned from Codex's config by both the modify template and `chezmoi_codex_trust`. Applied only `~/.codex/config.toml` and `~/bin/chezmoi_codex_trust`: Codex projects went from 89 to 73. Deleted the two empty `~/Documents/Codex` scratch folders (0 files each) and the then-empty parent; their threads remain.
- **Gate:** `ki repo audit` PASS=18 WARN=3 FAIL=0 (the warnings are in ki-agentic-harness and predate this run); `node --test` 217 tests, 215 pass, 0 fail; `rumdl check .` clean.

## Failed

- Possible stray keystrokes in Granola at about 10:44 BST: Granola took focus during one rename. The keys were Cmd+Right, up to 30 backspaces and the text "Personal". This can't be verified because Granola's data is encrypted.

## Needs the owner

- Open the Granola note that was active at about 10:44 BST and undo any change with Cmd+Z.
- Optional: rename `Personal - Spirituality` to `Sacred Inquiry - Spirituality` if it belongs to that territory.
- Seven old Codex chats whose folder is `Projects/Kit` are no longer grouped under a project. They are kept; reassign them by hand if wanted.
- `ChatGPT Classic.app` (`com.openai.chat`) is still installed; decide whether to retire it through the Rig lifecycle.
