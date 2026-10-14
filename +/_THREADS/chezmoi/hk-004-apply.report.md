# DOTFILES-UE-083 apply report

Record: [`DOTFILES-UE-083`](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-083-refresh-macos-settings.md), now `awaiting-review`.

## Done

- Recorded Kris's decisions (sheet accepted as recommended, 2026-10-11, Decision 44). The six departures with no recorded reason are kept, reason not given.
- Added 20 settings from the 14 `add` rows to `private_40-macos.toml`, all in profile `core`, each with a rationale citing its upstream line at `b7c7894` and the sheet's reason. No existing setting changed. Settings: `global-toolbar-title-rollover-delay` (45), `global-sidebar-icon-size` (35), `global-expand-save-panel` and `-2` (55, 56), `global-expand-print-panel` and `-2` (59, 60), `global-save-to-disk` (63), `trackpad-tap-to-click` (128), `global-tap-to-click` (130), `finder-quit-menu-item` (248), `finder-disable-animations` (251), `finder-posix-path-in-title` (277), `global-spring-loading` (289), `global-spring-loading-delay` (292), `diskimages-open-read-only` (304), `diskimages-open-read-write` (305), `finder-open-new-removable-disk` (306), `finder-no-empty-trash-warning` (336), `airdrop-all-interfaces` (339), `dock-mission-control-animation` (392).
- Left out: upstream line 129, `defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1`. Rig's `macos-defaults` provider has no per-host form. The key is already 1 on this Mac; Rig just doesn't watch it.
- Provenance: `-/rig-rationale-review.md` gained an upstream table. `tests/rig-macos-provenance.test.mjs` now requires the two tables to cover exactly the 55 settings, each new value to match its quoted upstream command literally, and each rationale to cite its line, the commit and the approval. The historical assertions are unchanged. `tests/rig-catalogue.test.mjs` also pinned the count of 35 and the laptop selection, so it was updated to 55 plus the 20 IDs.
- Applied: `chezmoi apply --recursive=false ~/.config/rig/conf.d/40-macos.toml`, then `rig apply` with the 20 targets only (20 completed, 0 failed). 18 were already live. The two new ones (title hover delay 0, Mission Control 0.1) now read correctly.
- `rig doctor`: 0 findings before (pass 213) and 0 after (pass 233), healthy, exit 0 both times.
- Checks: `node --test tests/*.test.mjs` had 203 passing, 0 failing and 2 skipped. `rumdl check .` was clean. `ki repo audit --repo .` had 0 failures and 3 warnings that were already there and are unrelated (no pre-commit hook, two unavailable registries).
- Commits (local, not pushed): `98deb94` feat(rig) for the settings, provenance and tests; `d247651` docs(roadmap) for the record.
- `baseline_ref` already held `79d4b529…` from the spawn and was left alone because it is immutable. The template's `last-run` was not touched.

## Needs Kris

- Review and accept `DOTFILES-UE-083`. Acceptance updates `DOTFILES-HK-004`'s `last-run`.
