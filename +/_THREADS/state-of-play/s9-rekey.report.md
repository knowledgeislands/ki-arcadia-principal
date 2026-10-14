# Step 9c - re-key repository codes in current HEAD: report

Authority: Decisions 90, 97 and 100. Git history is untouched; tools-ki was skipped.

## Done

- **Re-keyed 14 repositories**, each in one commit (`chore(repo): re-key repository codes in current HEAD`), pulled with rebase and pushed fast-forward to `main`:

  | Repository | Commit | Codes | Tokens | Files | Renames |
  | --- | --- | --- | --: | --: | --: |
  | apps-observatory.local | `5114927` | KI-OBS, KI-TOOL | 370 | 67 | 7 |
  | chezmoi (`krisb/dotfiles`) | `0e740c1` | DOTFILES | 140 | 47 | 24 |
  | apps-vallearmonia.com | `ad68bb3` | VA-WEB, KI-TOOL | 118 | 48 | 24 |
  | tools-rig | `1a41fe6` | KI-RIG, DOTFILES | 106 | 21 | 12 |
  | apps-knowledgeislands.info | `ccecd63` | KI-WEB, KI-TOOL | 103 | 38 | 7 |
  | ki-agentic-harness | `92ea2097` | KI-TOOL, KI-WEB, DOTFILES, KI-OBS | 28 | 10 | 0 |
  | tools-git-almanac | `00cc916` | KI-ALMANAC | 12 | 5 | 2 |
  | ki-principal | `7f79644` | DOTFILES, KI-WEB, KI-RIG | 7 | 4 | 0 |
  | hnr-agentic-harness | `f2b72f2` | DOTFILES | 4 | 1 | 0 |
  | tools-techne | `cc56c4c` | KI-TECHNE-TOOL | 3 | 3 | 2 |
  | va-principal | `0ee5d0f` | VA-WEB | 3 | 2 | 0 |
  | homebrew-tap | `695f862` | KI-WEB, KI-BREW | 2 | 2 | 0 |
  | tools-mgit | `f26eca9` | KI-MGIT | 1 | 1 | 0 |
  | 5g-emerge-phase2 | `77f3cd4` | KI-TOOL | 1 | 1 | 0 |

  "Tokens" counts the old codes replaced in file contents. "Renames" counts files renamed: roadmap, housekeeping, batch and Decision Record files. The other 38 repositories held no old codes.
- **Final sweep**: no old code is left in the current HEAD of any repository except tools-ki and the exclusions below.
- **Checks**:
  - `ki repo audit`: each repository's findings match its baseline taken before the change. The failures that remain were already there.
  - Test suites pass in ki-agentic-harness (1072 tests), apps-observatory.local and apps-knowledgeislands.info, and so do the two affected chezmoi tests. Type checks pass in both apps, and Biome is clean in apps-observatory.local.
  - chezmoi `step9-renames` still merges cleanly onto the new `main`.

### Method (for s9-rekey-ki)

- Match whole tokens, longest prefix first: `(?<![A-Za-z0-9_\-])((?:[A-Z]DR-)?)(KI-TECHNE-TOOL|KI-ALMANAC|DOTFILES|KI-BREW|KI-MGIT|KI-WEB|VA-WEB|KI-OBS|KI-RIG|KI-TOOL(?!-(?:KI|MGIT|RIG|TECHNE|GIT)(?![A-Za-z0-9])))(?![A-Za-z0-9_])`. The optional `[A-Z]DR-` group catches Decision Record IDs such as `GDR-KI-TOOL-001` and `ADR-KI-TOOL-CLI-001`, which a plain left boundary misses. The `KI-TOOL` lookahead stops already-new codes from being rewritten again.
- Apply the pattern to the contents of tracked files, then `git mv` any tracked path that contains a code.
- Test fixtures can hold a scope as split segments, such as `['KI', 'OBS']`. The regex misses these, so fix them by hand. Then rerun the formatter, because the longer IDs can push lines past the width limit.

## Not changed (by rule)

- Other threads' checkpoints under `+/_CHECKPOINTS/`, including `_state-of-play`, in ki-principal, va-principal and personal-principal.
- The Estate Map and `Estate Targets.json` in personal-principal.
- tools-ki, which s9-rekey-ki will re-key.

## Needs Kris

- Other repositories now cite tools-ki records as `KI-TOOL-KI-…`. Those links resolve only after s9-rekey-ki re-keys tools-ki.
- The Estate Map and the checkpoints listed above still use the old codes. The final map run, and each thread's next checkpoint, should pick up the new ones.
