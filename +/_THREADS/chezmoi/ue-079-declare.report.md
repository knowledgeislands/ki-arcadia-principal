# DOTFILES-UE-079 declare slice: report

Record: /Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md (adopted, horizon now, status in-progress). Commit: 190e7f2 feat(rig): declare DOTFILES-UE-079's core applications (local only, not pushed).

## Done

- Adopted DOTFILES-UE-079 for this slice, with its plan, steps, evidence and the removal list for RIG-CORE-041 written into it. Declared rows in the tables are marked done or skipped.
- Declared in `core`: Diagram (artefact only, because it has no cask or App Store listing), Home Assistant (App Store 1099568401) and HP (App Store 1474276998). Each identity was checked against the installed app bundle and its App Store receipt.
- "Align on both": the 1Password CLI (`1password/tap/1password-cli`) and Telegram (App Store 747648890) declarations already match how the laptop has them installed, so I added to their rationales that both machines use those routes.
- Skipped because they were already declared: DaVinci Resolve (`studio`) and Spark Desktop (`core`).
- Applied only `~/.config/rig/conf.d/10-applications.toml` with chezmoi. I did not run `rig apply` and did not install anything.
- rig doctor before: 0 findings (pass 233, warn 0, fail 0, skipped 20). After: 0 findings (pass 235, warn 0, fail 0, skipped 21). Home Assistant and HP are present; Diagram counts as catalogue-only. Nothing new is failing.
- Checks: `node --test tests/*.test.mjs` 210 pass, 0 fail (the catalogue test's expected laptop selection now includes the three new tools); `rumdl check .` clean; `ki repo audit --repo .` no failures, with 2 warnings that were already there (no committed pre-commit hook; territory registry for ki-arcadia-principal not available).

## Failed

- Nothing failed.
- Network: running `brew info --cask google-drive home-assistant hp-easy-start` wrote per-cask files to the Homebrew API cache. Homebrew may have downloaded them, so I can't rule out one read-only network fetch from Homebrew's API.

## Needs Kris

- Google Drive (you chose `core`) is not declared yet. It is not on the laptop, and the local cask metadata installs a package without naming the app path, so I could not confirm its artefact path offline. Next step: confirm `/Applications/Google Drive.app` on sol, then declare it as cask `google-drive` in `core`.
- The mise items (`actionlint`, `rust`, `zig`, the cargo tools, `python`, `uv`) are not declared. `mise ls --global` lists only node and bun; the others are installed but have no global pin. If you want them in `core`, they first need to be added to `~/.config/mise/config.toml` (managed in chezmoi), which is a separate change.
- Aligning sol (1Password CLI from the tap, Telegram from the App Store, and the laptop's mise approach) means uninstalling and installing on sol. That is still to do.
- Decision 49 also asks for a one-line note in RIG-CORE-041 in tools-rig. That was outside this task, so I have not done it.
- Open questions still in the record: Mercury, `pipx:maturin`, Clockology and Prime Video.
