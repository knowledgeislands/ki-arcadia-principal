# Accept KI-TOOL-RIG-CORE-050 and release tools-rig 0.6.2: owner report

Authority: Decision 170 (RIG050-ACCEPT, RIG050-RELEASE).

## Done

- **Closed KI-TOOL-RIG-CORE-050** (mise observed executables) through `ki-accept`: set to `done` with a `## Done` section citing Decision 170 (`d4ac1a2`), then pruned in its own prune-only commit (`591f0b9`). No other repository linked to the record. The repository audit has no failures; its one warning, about the missing commit hook, was already there.
- **Released Rig v0.6.2** the same way as 0.6.1:
  - The candidate commit (`5a418cf`) passed the full local check list, including all 543 tests, and passed CI on `main`.
  - Tag `v0.6.2` passed its CI, including the check that the tag matches the version.
  - The [GitHub release](https://github.com/knowledgeislands/tools-rig/releases/tag/v0.6.2) is published, and GitHub marks it immutable.
  - The release installer, run into a throwaway directory, reports `rig 0.6.2`.
  - The tap workflow ran, and the KI tap merged its "Advance rig to v0.6.2" pull request automatically (#36).
  - The checkout is back on `0.6.2+dev` (`0927f6c`). That commit was tested in a clean worktree: 543 of 543 tests passed. All my commits are pushed fast-forward; no other thread's commits were unpushed beneath them.
- **Verified on this Mac:**
  - `brew upgrade knowledgeislands/tap/rig` installed 0.6.2, and `/opt/homebrew/bin/rig --version` reports `rig 0.6.2`.
  - `install.executables` works read-only. I ran `rig status` against a throwaway catalogue and a temporary copy of chezmoi's mise config. `rust` (`rustc`, `cargo`) and `cargo:cargo-nextest` showed as present, and a fake executable showed as `missing-executable:NAME`. Nothing was applied.

**What chezmoi needs:**

- Your live `~/.config/mise/config.toml` holds only `node` and `bun`. chezmoi's version, which adds `rust`, the `cargo:` tools, `python`, `uv`, `zig` and `actionlint`, has not been applied, so mise does not treat those tools as active. Until it is applied, Rig correctly reports them missing.
- Once applied, chezmoi's Rig catalogue can declare `rust` with `install.executables = ["rustc", "cargo"]` and each `cargo:` tool with its binary name.
- Keep the tools in chezmoi's mise config as well: `rig apply` runs `mise install`, which installs a tool but does not make it active.

## Failed

Nothing.

## In progress

Nothing of mine. Another session has uncommitted Rig work in `tools-rig` (`src/rig/21-provider-state.bash`, the regenerated `bin/rig`, `docs/guides/user/commands.md`, `docs/specs/catalogue.md`, `tests/rig-application-updates.bats`, about Homebrew cask `auto_updates` metadata). I left it alone; my `0927f6c` changed only the version line in `bin/rig`. In chezmoi, `dot_config/rig/conf.d/private_40-macos.toml` is also modified by another thread and I did not touch it.

## Needs the owner

- **Needs: RIG062-CHEZMOI-MISE.** Should the chezmoi thread run `chezmoi apply` for `~/.config/mise/config.toml`, after its usual `chezmoi diff` review, and then move `rust` and the `cargo:` tools into the Rig catalogue with `install.executables`? Recommendation: yes, as one chezmoi task.

```text
RIG062-CHEZMOI-MISE: yes / no / other: ...
```
