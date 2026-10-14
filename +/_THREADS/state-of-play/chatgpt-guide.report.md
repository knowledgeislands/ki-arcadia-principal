# chatgpt-guide report

Authority: Decision 142 (naming per Decision 135). Research checked on 2026-10-12. `help.openai.com` blocks direct fetches, so its content comes from search extracts of the cited pages.

## Answers

1. **Does chatgpt.com do what Classic does?**
   - **Moving a chat into a Project:** yes. Use the `•••` menu and **Move to project**, or drag the chat. Chats move one at a time, and chats started with a custom GPT cannot move. ([Projects in ChatGPT](https://help.openai.com/en/articles/10169521-projects-in-chatgpt))
   - **Archiving chats:** yes. Restore them from **Settings > Data controls > Archived chats**. ([Deleting and archiving chats](https://help.openai.com/en/articles/8809935-how-to-delete-and-archive-chats-in-chatgpt))
   - **Archiving Projects:** no client can do this. A Project can only be deleted, which deletes its chats and files. ([Projects in ChatGPT](https://help.openai.com/en/articles/10169521-projects-in-chatgpt))
   - **Recording meetings:** no. Record is "only available for the macOS desktop app", meaning Classic. ([ChatGPT Record](https://help.openai.com/en/articles/11487532-chatgpt-record)) The web has never had it. The Record button has been missing from the new unified app since July. ([openai/codex#32576](https://github.com/openai/codex/issues/32576), open, no staff reply) The replacement, the **Meetings** plugin, is a macOS beta for Pro and Business plans only. ([Meetings plugin](https://help.openai.com/en/articles/20001546-the-meetings-plugin-in-chatgpt))
   - **Classic's status:** Classic is not being withdrawn on a set date. It was renamed on 2026-07-09 and is still supported, but it gets no new agent features. ([Moving to the new ChatGPT desktop app](https://help.openai.com/en/articles/20001276-moving-to-the-new-chatgpt-desktop-app))
2. **Cloud Projects compared with Codex local Projects:**
   - **Cloud Projects** belong to the account. Each holds chats, files (25 on Plus, 40 on Pro and Business) and instructions. Memory is account-wide unless the Project is set to project-only memory. ([File uploads FAQ](https://help.openai.com/en/articles/8555545-file-uploads-faq))
   - **Codex Projects** are folders on this Mac, stored in `~/.codex/state_5.sqlite`. They have no ChatGPT memory; their context comes from the files and `AGENTS.md`.
   - The two kinds are separate and do not share chats.
3. **Archive, delete and export:**
   - **Cloud chats:** archive, restore from Settings, or delete permanently.
   - **Cloud Projects:** delete only. OpenAI purges the contents within 30 days. ([Chat and file retention](https://help.openai.com/en/articles/8983778-chat-and-file-retention-policies-in-chatgpt))
   - **Export:** **Settings > Data controls > Export data** produces a ZIP of JSON and HTML. Uploaded files are listed but not included.
   - **Codex threads:** archive them; they appear under **Settings > Archived chats**. On disk they are in `~/.codex/sessions` and `~/.codex/archived_sessions`. ([Codex troubleshooting](https://learn.chatgpt.com/docs/reference/troubleshooting))
   - **Codex Projects:** **Remove** affects only the sidebar.
4. **Can a Codex thread move between Projects?** No. The feature requests [openai/codex#50882](https://github.com/openai/codex/issues/50882) (2026-10-04) and [#28530](https://github.com/openai/codex/issues/28530) are open. The workaround is a handoff summary into a new thread, then archiving the old one.

## Done

- Added the guide [docs/guides/tools/chatgpt.md](/Users/krisbrown/.local/share/chezmoi/docs/guides/tools/chatgpt.md). It covers when to use a plain chat, a cloud Project or a Codex Project; filing and archiving; the territory mapping (Decision 135); and why durable knowledge belongs in the Capitals rather than in ChatGPT memory. Sources are cited.
- Linked the guide from `codex.md` and the tools README. Corrected the Project-naming checklist in `codex.md`: an empty cloud Project now gets deleted, because it cannot be archived, and territory Projects are created as Codex Projects only.
- Committed and pushed `ea66ce1` on chezmoi `main` as a fast-forward.
- Checks:
  - `ki repo audit`: PASS=18, WARN=3, FAIL=0. The 3 warnings were already there.
  - `node --test`: 215 passed, 0 failed, 2 skipped.
  - `rumdl check .`: clean.

## Failed

- None.

## Needs Kris

- **ChatGPT Classic: keep it for now.** The web and the new app do not cover everything Classic does. Record is Classic-only. The Option+Space Chat Bar and Work with Apps also come from Classic, and OpenAI has not said whether the new app keeps them. Remove Classic through Rig only if Kris does not use Record, or once the Meetings plugin reaches his plan.
