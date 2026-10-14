# Bundle walkthrough report

## Done

- Wrote Streams/Projects/agent-host/design/workstation-bundle-walkthrough.md in ki-arcadia-principal, with a design/design.md index and a pointer bullet in the agent-host Project note. Commit 2b6ed04 (local, not pushed).
- Recommendation: option (iv), chezmoi-native. One manifest file per target host in the chezmoi source, rendered with `chezmoi archive <targets>` plus `--override-data`; `scripts/cheztoi-render` shrinks to a thin wrapper. No Rig extension and no change to ki-binding-chezmoi; once a second owner uses the pattern, write it up as a standard in ki-repo-dotfiles-chezmoi.
- Effect on DOTFILES-UE-073: the flat allowlist becomes a per-host manifest; it uses one archive call instead of `chezmoi cat` per file; host variants become templated sources keyed on a `cheztoi` data value. Effect on TECHNE-TOOLS-OPS-015: the contract is unchanged except for an optional `target_host` field that is checked against host.id.
- Checks: `ki repo audit` PASS=21 WARN=3 FAIL=0. All three warnings were already present (CI-1, HOOK-1, STREAM-10) and none is on the new files. rumdl is clean. A local `chezmoi archive` test emitted exactly the eight files it was given, with their modes.

## Needs the owner

- Read the walkthrough and accept, amend or reject the recommendation before DOTFILES-UE-073 and TECHNE-TOOLS-OPS-015 are approved. No record status was changed.
