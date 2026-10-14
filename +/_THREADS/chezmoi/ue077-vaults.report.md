# DOTFILES-UE-077 vault layout — report

**Done**

- Recorded Kris's vault layout in [DOTFILES-UE-077](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-077-reorganise-1password-vaults-safely.md): a new "Vault layout" table with each vault's purpose (Rig, Personal, Finances, Family (Retford Browns), HNR (Exec), HNR (Kris), Kids, Oliver, Personal (Kris), Side Projects, Techmedix). The automation vault is now named Rig (Decision 10), and the old "Vault name" open question has been removed.
- Added open questions: a draft precedence order for Kris (Rig > Finances > company > person vaults > Personal (Kris) > Side Projects > Inbox), and whether a company secret a tool reads goes in Rig or the shared HNR (Exec) vault. Also: renaming Personal to Inbox and how 1Password picks the vault for new items, naming for sort order, pruning stale items, and the inventory held until Kris's tweaks are done (Decision 11).
- The record is still in triage and `updated_at` is 2026-10-09T07:27:04Z. 1Password was not touched.
- Commit `663e679` `docs(roadmap): record vault layout and precedence in DOTFILES-UE-077`: local only, that one path, not pushed.
- Checks: `ki repo audit --repo .` reported PASS=19 WARN=2 FAIL=0. Both warnings were already there: no committed pre-commit hook, and the territory registry is unavailable. `node --test tests/*.test.mjs` ran 176 tests: 174 passed, 0 failed, 2 did not run. `rumdl check .` found no issues.

**Needs Kris**

- Confirm or change the draft precedence order, and decide where a tool-read company secret goes (Rig or its company vault).
