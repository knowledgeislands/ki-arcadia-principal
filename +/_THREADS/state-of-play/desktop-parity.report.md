# Desktop projects parity - report

## Done

- Claude Desktop and ChatGPT/Codex each now hold exactly eight Projects, one per territory: Personal, Knowledge Islands, Legal, Humans Not Robots, Valle Armonia, Sacred Inquiry, Techmedix and Equal Remedy. Each has a chezmoi-managed README that names its territory, Capital and checkout root. The two apps' READMEs match apart from two app notes, both in ChatGPT/Codex: Knowledge Islands keeps its architecture pointer, and Personal now carries the "Project sources" guidance from Kit.
- Claude Desktop: Personal, Humans Not Robots, Sacred Inquiry and Techmedix are now under chezmoi (README only). Legacy `HNR` and `Kit` held nothing but a README; both are removed from source and listed in `.chezmoiremove`.
- ChatGPT/Codex: added the four missing Projects. Retired `HNR` (README only). Retired `Kit`:
  - Moved the two idea notes to Personal, and the two 2026-09-09 blocked-run notes to Knowledge Islands.
  - Moved `.codex/config.toml` to Personal. Its writable root pointed at `~/kis/kit-personal/kit-pkb`, which no longer exists, so it now points at `personal-principal`.
  - Folded the one point unique to `AGENTS.md` (keep exploratory drafts in the project) into the Personal README, then dropped `AGENTS.md` and `CLAUDE.md`. `CLAUDE.md` only imported `AGENTS.md` and noted its own restoration. Also removed `.DS_Store`.
- Reviewed `chezmoi diff` and applied only `~/workspaces/claude-desktop/Projects` and `~/workspaces/chatgpt-codex/Projects`. `chezmoi status` is now clean for both.
- Committed chezmoi on `main` as `45a6fa7` (`feat(workspaces): one desktop Project per territory`), staging only these paths. Other threads' uncommitted changes are untouched.

## Failed

- Not pushed. The brief conflicts: its first rules say pull, rebase and push, while the closing rules forbid any push or remote call. I took the stricter reading. `45a6fa7` is unpushed on `main` in chezmoi on terra.

## Needs the owner

- Push chezmoi `main` on terra (`45a6fa7`), or tell me to.
- ChatGPT app (Projects live in the cloud): open the sidebar and make the Projects match, in this order: Personal, Knowledge Islands, Legal, Humans Not Robots, Valle Armonia, Sacred Inquiry, Techmedix, Equal Remedy.
  1. Create Personal, Humans Not Robots, Sacred Inquiry and Techmedix.
  2. If a Kit Project exists, move its chats and files into Personal (idea notes) and Knowledge Islands (blocked-run notes), then archive or delete Kit.
  3. If an HNR Project exists, rename it to Humans Not Robots, or move its chats into Humans Not Robots and archive it.
  4. Rename any Project whose name differs from the territory name, for example "KI" to Knowledge Islands.
- Claude Desktop app: in Projects, rename any Project named HNR to Humans Not Robots and any named Kit to Personal (or merge into the existing one and archive the old). Then create any of the eight that are missing and point each at its folder under `~/workspaces/claude-desktop/Projects/`. I did not read the app's databases, so I could not check its current Project names.
