# Build DOTFILES-UE-073 — report

Record: `~/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-073-cheztoi-host-profile.md`, now `awaiting-review` (not accepted).

Commits in `~/.local/share/chezmoi` (local only, not pushed): `b3fb600` feat(cheztoi): render a host-safe profile payload for vega; `ef20d72` docs(roadmap): move DOTFILES-UE-073 to awaiting review. Baseline `d2500e6`.

Checks: `node --test tests/*.test.mjs` 202 pass, 2 skipped, 0 fail (20 new); `rumdl check .` clean; `ki repo audit --repo .` FAIL=0 WARN=2 (unchanged from baseline); `rig doctor` (live) 0 findings before and 0 after (healthy), and identical with and without the mgit change in a scratch copy run from the same folder; `chezmoi diff` on the changed targets shows only the intended lines.

## Done

- The Mac can now render vega's personal setup bundle with `scripts/cheztoi-render --host vega`; it is rendered at `~/.cache/cheztoi/vega/` and passes its own checks.
- The bundle carries the minimal zsh setup, Claude and Codex instructions that tell the truth about the host (no detached agents; edit on the Mac), and a Rig file that installs mgit on Linux by direct download, with no Homebrew.
- The host file is named `vega.toml` as asked, with no `target_host` until the host is renamed.
- The Mac's own files are unchanged apart from two "source lives at" lines that now name the renamed `.tmpl` sources.
- A guide section explains how to render and check the bundle.

## Failed

- Nothing failed. Not done: the check against the harness's own validator. TECHNE-TOOLS-OPS-015 hasn't written that validator yet, so the build-015 run should do this check (with `--validator`, or on `~/.cache/cheztoi/vega/`) and record it in both records.

## Needs the owner

- This Mac's chezmoi settings have the profile typed as `lapto`, not `laptop`, so `chezmoi status` and a full `chezmoi diff` fail. Fixing it needs `chezmoi init` with the right profile name. I left it alone because this run may not change the environment.
- Review DOTFILES-UE-073 once TECHNE-TOOLS-OPS-015 has run its offline check against this bundle.
