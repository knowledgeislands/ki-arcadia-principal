# Codex and ChatGPT project naming and Codex config clean-up - report

## Done

- **Codex trusted projects are now generated.** The new template [`.chezmoitemplates/codex-trusted-projects-json`](/Users/krisbrown/.local/share/chezmoi/.chezmoitemplates/codex-trusted-projects-json) builds the list from `workspaces/dot_mgit.toml` and each `workspaces/<territory>/dot_mgit.toml`. It covers the eight territory workspaces, their eight `chatgpt-codex/Projects/<Territory>` folders, every manifest repository, and the existing `chatgpt-codex` entries in `trusted-folders.yaml`, which include chezmoi and `~/.claude`. That makes 87 paths. A repository added with `mgit register` is trusted at the next apply.
- **Stale entries removed.** The Codex binding now drops any undeclared project whose folder no longer exists. This removed 10 grants: `Projects/Kit`, three under `hnr/5g-emerge`, five under `kit/`, and `knowledge-wayfinder/kw-alejandro`. It replaces the one-off `kit-pkb` removal. 27 grants were added. Two Codex-created scratch folders under `~/Documents/Codex/` still exist on disk, so they stay as app-managed.
- **Diff reviewed, then only `~/.codex/config.toml` applied.** The diff touched only `[projects]`. The live file now has 89 projects (87 managed and 2 scratch). `chezmoi_codex_trust diff` uses the same template and prune rule, and reports no change.
- **Projects folders already conform.** Both apps' folders already held exactly the eight territory folders. Kit and HNR had been retired by the earlier desktop-parity run, with their content, including the Knowledge Islands `architecture` folder, already moved. There was nothing to rename, remove or move. Each of the 16 READMEs now states the Project name and the sub-area form, and links to the guide.
- **Documented.** I added a `Project naming` section with the in-app checklist to [docs/guides/tools/codex.md](/Users/krisbrown/.local/share/chezmoi/docs/guides/tools/codex.md#project-naming). I also updated the trusted-project description there and in `config-fragments/codex-config.yaml`.
- **Checks and commit.** `ki repo audit` passed with 0 failures and 3 warnings. The warnings were already there and are unrelated: HOOK-1, ITEM-2 for the `ki-principal` registry, and BODY-12 on ADR-KB-DOTFILES-003. `node --test`: 215 passed, 0 failed, 2 skipped. `rumdl check .`: clean. Committed `48a175a` on `main` and pushed it as a fast-forward to `origin/main`.

## Needs Kris

- **Apply the 16 README targets.** The README sources changed, but the brief allowed applying only `~/.codex/config.toml`. They show as `M` in `chezmoi status`. Run `chezmoi apply ~/workspaces/chatgpt-codex/Projects ~/workspaces/claude-desktop/Projects`.
- **Keep or trim the extra Codex grants?** I kept the OneDrive `sources-*` folders, the WhatsApp spool and the `Resources` subfolders trusted for Codex. These are in `trusted-folders.yaml`, but outside the canonical set in the brief. Removing their `chatgpt-codex` tag would take away Codex access to them, so I did not do it without asking.
- **In-app checklist.** Chezmoi cannot set app Project names:
  1. In the ChatGPT app, rename each Project to the convention: `Valle Armonia`, or `Valle Armonia - Website`, with an ASCII hyphen and a space on each side. Renaming keeps the chats. To merge a duplicate, move its chats into the conforming Project and archive the empty one.
  2. Create any of the eight territory Projects that is missing: Personal, Knowledge Islands, Legal, Humans Not Robots, Valle Armonia, Sacred Inquiry, Techmedix and Equal Remedy.
  3. In the Codex app, rename or create the local Projects the same way. Point each territory Project at `~/workspaces/chatgpt-codex/Projects/<Territory>`, and each sub-area Project at its checkout.
  4. In Claude Desktop, use the same names. Point each territory Project at `~/workspaces/claude-desktop/Projects/<Territory>`.
  5. Check that no Project name contains an en dash, an em dash or a colon.
