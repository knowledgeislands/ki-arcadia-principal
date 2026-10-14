# KEYCHAIN-SSH — owner report

## What has been done

- **op_cache reads the token from a file.** The Keychain lookup (`security find-generic-password`, `OP_CACHE_KEYCHAIN_SERVICE`) is gone. The order is now the caller's `OP_SERVICE_ACCOUNT_TOKEN`, then `${XDG_CONFIG_HOME:-$HOME/.config}/op-cache/service-account-automation`, which `OP_CACHE_TOKEN_FILE` overrides. The lookup is not OS-gated. The file is used only if it is a regular file (not a symlink), owned by the user, with no group or other bits. Otherwise op_cache prints one warning naming the path, never the contents, and falls back to the desktop app. A missing file falls back silently, and the trailing newline is stripped. Commit `afb1a82` in `~/.local/share/chezmoi` on `main`, local only and not pushed.
- **Tests.** In `tests/op-cache.test.mjs` the Keychain cases are replaced, and they now run on every platform:
  - the token file is used;
  - the environment variable wins without the file being read;
  - a missing file goes silently to the desktop app;
  - a group-readable or world-readable file is ignored, with one warning that names the path;
  - the token never appears in the cache or on stderr.

  Every test points `OP_CACHE_TOKEN_FILE` at a scratch path, so the real token file is never read.
- **Guides.**
  - `docs/guides/tools/chezmoi.md`, "Service account": rewritten. It covers storing the token with the zsh `install -d -m 700 … read -rs …` command, rotating it, removing it, and deleting the old Keychain entry.
  - `docs/guides/user/macos-workstation.md`: "Keychain secrets over SSH" is replaced by "The 1Password token over SSH".
  - ADR-KB-DOTFILES-003: it named the login Keychain, so I added one paragraph to the existing amendment.
- **Checks.**
  - `node --test tests/op-cache.test.mjs`: 9 of 9 pass.
  - Full suite: 228 tests, 226 pass, 0 fail, 2 skipped. The skips were already there.
  - `shellcheck`: only SC2088 on the three `"~/bin/chezmoi/op_cache: …"` messages, which follow the file's existing pattern. Two of those messages were already there.
  - `rumdl check .`: clean.
  - `ki repo audit --repo .`: PASS=18, WARN=3, FAIL=0. All three warnings were already there: BODY-12 on the ADR's existing "Amendment 2026-10-12" heading, HOOK-1 for having no pre-commit hook, and ITEM-2 because the `ki-principal` registry is unavailable.
  - No `chezmoi apply`, `rig apply` or SSH. I did not touch the real token, the real token file or any Keychain item.
- **No work record.** The two earlier op_cache service-account changes (`d2515f5`, `53990e6`) were made without one, and this change is the same size. Decisions 53 and 54 are cited in the commit message instead.

## What is in progress

Nothing. The coordinator still has to migrate the token on every Mac: write the file using the guide's command, then optionally delete the old Keychain entry. After that, a `chezmoi apply` over SSH on `sol` would prove the fix end to end.

## Outstanding queries

- **KEYCHAIN-SSH-PUSH**: should `afb1a82` be pushed to the chezmoi remote?

```text
KEYCHAIN-SSH-PUSH: yes / no
```
