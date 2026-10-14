# acquire-prompt report (Decision 147)

## Done

- Route chosen: chats push straight into `krisb/acquire` through ChatGPT's GitHub app. Chats have already committed captures and original images there since 2026-10-10 (commits `5e9302c` and `9300068`). If GitHub write is unavailable, the same prompt falls back to a ZIP, which Kris downloads and unpacks with a few local commands. Bulk export was rejected for this job: it has no project names, and the 2026-10-04 inspection found its assets incomplete (45 of 857 asset pointers resolved). It stays the complete-acquisition source under [KI-HARNESS-OPS-005 Acquire AI sessions](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md). That record's model is unchanged: a summary capture is a reviewed summary, not a complete copy, so archive the chat after the banner rather than deleting it.
- Guide: new section "Bringing chats into acquire" in [chatgpt.md](/Users/krisbrown/.local/share/chezmoi/docs/guides/tools/chatgpt.md#bringing-chats-into-acquire). It covers the route, setup, the paste-ready prompt, ZIP intake and dated OpenAI sources. chezmoi commit `207d93c`, pushed.
- acquire README: one paragraph describing the whole-chat capture shape, with a link to the prompt. Commit `0b70d94`, pushed. No acquire code changed and no helper was needed.
- Checks: rumdl clean in both repositories. chezmoi node tests: 215 passed, 0 failed. `ki repo audit` fails in both, but neither failure comes from these changes. In chezmoi, the failures are roadmap body-shape findings in KB-DOTFILES-UE-076, KB-DOTFILES-UE-077, KB-DOTFILES-UE-082 and KB-DOTFILES-UE-086, which another thread has left uncommitted. In acquire, they are GitHub live-state toggles and Dependabot settings.
- Docs evidence (checked 2026-10-12): OpenAI's GitHub plugin page lists write actions. A May 2026 community answer says write actions arrived about spring 2026, though some support replies still call the app read-only. Generated download links expire quickly. The account export arrives as a ZIP within up to 7 days, and its link lasts 24 hours.

## Failed

- None. In chezmoi, `git pull --rebase` was blocked by the other thread's uncommitted roadmap edits. I left them alone. The push was still a fast-forward, and both repositories are level with `origin/main`.

## Needs the owner

- Check once that ChatGPT Settings > Apps > GitHub lists file and commit write actions for `krisb/acquire`. Otherwise every chat will fall back to the ZIP.
- Images: a chat can commit only bytes it can still reach. Older uploads and generated images may be listed as omitted. Fetch those from Library, using the ZIP intake steps in the guide.

## Prompt

Paste this into each thread (replace the URL line or leave it as is):

```text
Capture this whole chat into my GitHub repository krisb/acquire.

Chat URL: <paste URL, or leave as is>

1. Read README.md on main of krisb/acquire first and follow it. Where it differs from this prompt, the README wins.
2. Territory: take it from this chat's project name, "<Territory> - <Sub-area>". The territory key is the territory in lower-case kebab-case: personal, legal, knowledge-islands, humans-not-robots, equal-remedy, techmedix, valle-armonia or sacred-inquiry. If the chat is in no project or the territory is unclear, use personal. Use _review only for deliberately mixed subjects. Tell me which key you chose and why.
3. Folder: captures/<territory-key>/chatgpt/<YYYY-MM-DD>-<topic>/. The date is the chat's first message, and the topic is a short kebab-case slug. If the folder already exists, stop and ask me.
4. Write README.md in that folder. Start with YAML front matter:
   source: chatgpt
   project: exact project name, or "none"
   territory: territory title
   territory_key: the key
   chat_title: exact chat title
   agora_title: a short descriptive title for this capture
   chat_url: the URL above, or "not supplied"
   started: first message date
   last_message: last message date before this prompt
   captured: today's date
   capture_route: github or zip
   attachments_included: number
   attachments_omitted: number
   Use dates you can actually see. Write "unknown" rather than guess.
5. Then write these sections, in British English:
   - Summary: a detailed, chronological account of the whole conversation. Cover the reasoning, the options considered and why they were kept or dropped. Write it so that someone who never saw the chat loses nothing of value.
   - Decisions: each decision, who made it and when.
   - Facts and findings: each one stated plainly. Mark anything unverified or assumed.
   - Open items: unanswered questions, next actions and anything deferred.
   - Key passages: verbatim quotations of the passages that matter, each labelled with its speaker (me or ChatGPT) and its date. Quote exactly. Do not tidy them.
   - Attachments and images: a table listing every file or image I uploaded or pasted and every image or file you generated. For each one give the file path under attachments/, the kind (uploaded, pasted or generated), what it shows, its SHA-256 and whether it is included. For generated images, add the prompt that made them.
   - Omissions: anything you could not capture, and why.
   Do not include this capture prompt or your replies to it.
6. Assets: save the original bytes of every listed file under attachments/. Keep the original filenames, prefixed 01-, 02- and so on in conversation order. Use the original bytes, never a re-rendering, screenshot or redraw. Compute each SHA-256 from those bytes with Python. If you cannot reach a file's bytes, do not invent a substitute. List it as omitted, with its filename, message date and a description, so that I can fetch it from Library.
7. Commit README.md and attachments/ to main of krisb/acquire in one commit, with the message "Capture <agora_title> from ChatGPT <project>". Then read every file back from GitHub and check its size and hash against what you wrote.
8. If you cannot write to GitHub, or a binary will not commit: build <YYYY-MM-DD>-<topic>.zip instead. It must contain the folder <YYYY-MM-DD>-<topic>/ with README.md, attachments/ and a SHA256SUMS file in shasum format. Give me the download link and the territory key, and say "Fallback ZIP - not yet captured".
9. Only when step 7's commit is verified, end your reply with this line and nothing after it:
   ✓ Knowledge captured — <agora_title> · krisb/acquire · <started date>
   Otherwise, say plainly what is still missing.
```
