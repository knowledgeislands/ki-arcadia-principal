# Shrink the ChatGPT capture prompt to one line — owner report

Authority: Decision 161.

## Done

- **acquire** (`krisb/acquire`, local `main`, commit `984d7d6`): new [`CAPTURE-CHATGPT.md`](/Users/krisbrown/workspaces/personal/acquire/CAPTURE-CHATGPT.md) at the repository root holds the full procedure: territory, folder, front matter, sections, attachments with SHA-256, the single commit, read-back, ZIP fallback and banner. It tells the chat to ask Kris only when something is genuinely unclear, and to treat the README's routing and banner rules as winning in any conflict. [README.md](/Users/krisbrown/workspaces/personal/acquire/README.md) now links to the file instead of to the dotfiles prompt. rumdl check is clean.
- **chezmoi** (local `main`, commit `f62f1f2`): [Bringing chats into acquire](/Users/krisbrown/.local/share/chezmoi/docs/guides/tools/chatgpt.md#bringing-chats-into-acquire) now gives the one-line message plus a sentence on where the full instructions live. I trimmed Route and Before you paste and left ZIP intake as it was. rumdl check is clean. I did not run `chezmoi apply`.

The message to paste:

```text
Capture this chat into krisb/acquire: read and follow CAPTURE-CHATGPT.md on main.
```

You can add the chat URL on a second line.

## Failed / not done

- **Neither repository is pushed.** In each one, another thread's unpushed commit sits underneath mine, so a fast-forward push would publish it too: acquire `23c2e62` "docs(intake): record owner acceptance and resting checkpoint", and chezmoi `fba0911` "docs(roadmap): capture KB-DOTFILES-UE-088 SSH alias for sol". The footer forbids pushing commits I did not make without asking. **Until acquire is pushed, the short message will not work**: ChatGPT reads `CAPTURE-CHATGPT.md` from GitHub `main`.

## In progress

Nothing.

## Needs the owner

- **ACQUIRE-PUSH**: push acquire `main` (`23c2e62` + `984d7d6`). Recommendation: yes. `23c2e62` records your own acceptance, and the short message depends on this push.
- **DOTFILES-PUSH**: push chezmoi `main` (`fba0911` + `f62f1f2`). Recommendation: yes, unless the KB-DOTFILES-UE-088 thread wants to push its commit itself.

```text
ACQUIRE-PUSH: yes / no
DOTFILES-PUSH: yes / no
```
