# apply-groups: owner report

Run `apply-groups`, chezmoi source `/Users/krisbrown/.local/share/chezmoi`, 2026-10-14. Defect: `chezmoi apply` failed on `.codex/config.toml` with `map has no entry for key "groups"`.

## Done

- **Cause.** Commit `8a58442` (`chore: update mgit config`) carried an `mgit register` rewrite of [workspaces/dot_mgit.toml](/Users/krisbrown/.local/share/chezmoi/workspaces/dot_mgit.toml) from the schema-1 `[groups.default.members."…"]` shape into direct `[members."…"]` tables, and dropped `schema = 1` from the territory manifests. mgit 0.17.0 documents this as its intended migration; the territory manifests already used `members`. [codex-trusted-projects-json](/Users/krisbrown/.local/share/chezmoi/.chezmoitemplates/codex-trusted-projects-json) still read `$root.groups.default.members`. The data lives in this repository, so no other repository needs to change.
- **coord-style is not the cause.** Its commit `319f6ae` only adds the `ki-coordinator` output-style symlink and does not touch the Codex template or the mgit manifests.
- **Fix.** Commit `9b587ce` (local, `main`): the template now reads `$root.members`. It stays strict, so a future reshape fails loudly rather than silently trusting nothing.
- **Test.** New [codex-trusted-projects.test.mjs](/Users/krisbrown/.local/share/chezmoi/tests/codex-trusted-projects.test.mjs) renders both Codex trust templates with `chezmoi execute-template` against this source, using an empty config and state. It checks that every territory workspace and one repository per territory are trusted, and that the untrusted set is disjoint from the trusted set. Against the old template it fails with the exact apply error; with the fix it passes.

### Checks

- `node --test tests/*.test.mjs`: 233 tests, 229 pass, **2 fail**, 2 skipped. Both failures are in `tests/rig-catalogue.test.mjs` and existed before this fix. They come from `4d07f9c` (Paperclip stopped and taken out of the laptop profile), which changed the Rig declarations but not the tests. The tests still expect `tool.paperclip-agents` in core+laptop (line 346) and the `port.paperclip` mode `required`, where the declaration now says `on-demand` (line 389). I left them alone because they belong to that thread; see Needs RIGTEST.
- `ki repo audit --repo .`: PASS=19 WARN=2 FAIL=0. These are the same two warnings as before, BODY-12 on `ADR-KB-DOTFILES-003` and HOOK-1 (no committed pre-commit gate).
- `rumdl check .`: no issues in 85 files.
- Full `chezmoi diff`: exits 0 with no template error. `.codex/config.toml` is **not** in the diff, so the corrected template renders exactly the trust list that is already live.
- No `.git/*.lock` files were left behind, and the working tree is clean.

### What the next `chezmoi apply` will change

The failed apply stopped early, so earlier commits that were never applied are still pending:

| Target | Change | Source commit |
| --- | --- | --- |
| `~/.config/mise/config.toml` | Adds pins for python 3.15.0, uv, actionlint, rust, zig and eight cargo tools | `06857f5` |
| `~/.config/rig/conf.d/15-command-line.toml` | Adds Rig declarations for the mise toolchain (actionlint, zig, python and others), and the Paperclip-agents profile change | `06857f5`, `4d07f9c` |
| `~/.config/rig/conf.d/16-homebrew.toml` | Removes Homebrew `python@3.14` and similar entries in favour of mise | `06857f5` |
| `~/bin/chezmoi/json` | Adds the coordinator reminder hook registration and its enabled switch | `645a03d`, `62116c8` |
| `~/bin/chezmoi/op_cache` | Reads the 1Password service-account token from a file rather than the Keychain | `afb1a82` |

The `op_cache` change affects how secrets are resolved during apply. If the token file is missing on the laptop, later templates that read secrets may fail or prompt. The Rig changes call for a `rig doctor` before and after the apply.

### Other observations

- The `dot_config/rig/conf.d/private_40-macos.toml` change (the SVG default handler) is no longer uncommitted: Kris's `8a58442` committed it alongside the mgit reshape. I did not touch it.

## In progress

Nothing.

## Outstanding queries

- **Needs PUSH**: `9b587ce`, together with `319f6ae` and `4d07f9c` from earlier runs, is unpushed on `main` in `/Users/krisbrown/.local/share/chezmoi` on the laptop. Push it?
- **Needs RIGTEST**: the two `rig-catalogue` test failures left by `4d07f9c`. (a) Update the tests to match the stopped-Paperclip declarations in a follow-up run, or (b) leave them for the Paperclip thread.
- **Needs APPLY**: rerun `chezmoi apply` yourself, ideally with `rig doctor` before and after, and with the service-account token file in place for `op_cache`.

```text
PUSH - (a) push now / (b) hold
RIGTEST - (a) fix the rig-catalogue tests in a follow-up run / (b) leave for the Paperclip thread
APPLY - (a) applied cleanly / (b) failed: <error>
```
