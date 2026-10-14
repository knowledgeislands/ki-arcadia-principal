# acquire-capture-v2: owner report

## Done

- **acquire** (local `main`, commit `8eadb71`, **not pushed**): [CAPTURE-CHATGPT.md](/Users/krisbrown/workspaces/personal/acquire/CAPTURE-CHATGPT.md) now commits README.md on its own first (attachments marked `pending`), then each attachment one at a time with read-back and one retry, then an updated README with included/omitted counts and reasons. A ZIP holds only the attachments that failed; a whole-folder ZIP is the last resort when nothing can be written. An existing folder gets `-2` rather than stopping. Uncertain or mixed chats go to `_review`, now named the triage territory in [README.md](/Users/krisbrown/workspaces/personal/acquire/README.md), rather than `personal`. Front matter gains `source_system` (replacing `source`) and `session_id` (the conversation ID after `/c/` in the chat URL, else `unknown`). README.md now defines a success banner and an incomplete banner: seven lines in a `text` code block with a heading, title, territory, date, GitHub path, and attachments (or Missing and Next). The one-line message is unchanged. rumdl is clean.
- **chezmoi** (commit `91f1583`, pushed): [Bringing chats into acquire](/Users/krisbrown/.local/share/chezmoi/docs/guides/tools/chatgpt.md#bringing-chats-into-acquire) now describes text first and the attachments-only ZIP, and adds `git pull --ff-only` to ZIP intake. I did not run `chezmoi apply`.
- **Chat 1 check** (`ef6e5e9` on origin, [capture](/Users/krisbrown/workspaces/personal/acquire/captures/personal/chatgpt/2026-10-14-chatgpt-context-corrections/README.md)): the folder follows the old rule. All 14 front matter fields and all seven sections are present. It is correct against the old instructions, with these flaws:
  - It was routed `personal` because the chat had no project, and the old rule defaulted to Personal. Under the new rule it would go to `_review`, or to `knowledge-islands` as clearly KI.
  - The banner date was "unknown" because the chat could not see its first message date. The new banner falls back to "captured <today>".
  - The commit message reads "from ChatGPT none" because there was no project.
  - The summary calls Kris "he".
- **Why the chats differed** (from the evidence): chat 1 had no attachments, so the one combined commit held only text and went through. Chat 2 had nine photographs, and the old step 6 demanded README.md and every attachment in a single commit. A failure on any binary sent the whole capture to the ZIP, so even the text never landed. Earlier successful binary commits (`5e9302c`, `9300068`, 2026-10-10) carried files of 0.2–1.8 MB, four at a time. Nine phone photos are probably several MB each. Inference, not verified: that commit was too large for one GitHub app write call.
- **ChatGPT GitHub app limits that apply** (from the 2026-10-12 checked sources in the guide; I made no new web check under the no-remote rule):
  - Write actions must be enabled for `krisb/acquire` in Settings > Apps. They have worked since chat 1 committed.
  - File bytes pass through the app's tool call, so large or many binaries in one write can fail. Hence the change to one file per commit.
  - A chat can commit only bytes it can still reach. Older uploads and generated images may be unreachable and are listed as omitted.
  - Generated ZIP links expire quickly.
  - Voice mode has no sandbox for attachments or ZIPs.
  - GitHub's own 100 MB per-file limit is far above phone photos.

## In progress

Nothing.

## Needs the owner

- **ACQ-PUSH-BLOCKED**: acquire's `8eadb71` sits on three unpushed commits from another thread (`f5f64d0` checkpoint refresh, `b5c471f` and `5332599` Granola migration drafting, rebased over chat 1's capture). A chat reads CAPTURE-CHATGPT.md from GitHub `main`, so the new behaviour takes effect only once pushed. Recommendation: authorise pushing all four together, or have the Granola thread push first.
- **ACQ-CONTEXT-ROUTING**: [context/chatgpt/personal/README.md](/Users/krisbrown/workspaces/personal/acquire/context/chatgpt/personal/README.md) still says "otherwise use Personal". The README's bootstrap makes the root README authoritative, but acquire-dispatch owns that file. Recommendation: have acquire-dispatch change it to the `_review` triage rule at its next refresh.
- **ACQ-CHAT2-RETRY**: chat 2 (Acer laptop, Windows 11, nine photos) has nothing in the repository. Recommendation: after the push, paste the same one-line message into chat 2 again. It should land the text and then as many photos as commit.

```text
ACQ-PUSH-BLOCKED: push all four / wait for Granola thread
ACQ-CONTEXT-ROUTING: yes via acquire-dispatch / leave
ACQ-CHAT2-RETRY: will retry / other
```
