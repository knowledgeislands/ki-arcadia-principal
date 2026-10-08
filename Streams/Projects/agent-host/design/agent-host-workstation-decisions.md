# Agent host as Kris's working machine: decisions

**Owner:** Kris Brown - **Report:** [agent-host-workstation-report.md](agent-host-workstation-report.md) - **Date:** 2026-10-08

These are the owner's own words, numbered against the report's decisions. Where they differ from the report, they win. Kris answered the report as a whole:

> all, but can you show me them or state what they are at least

"All" accepts each of the seven decisions as the report recommends. Kris's request to see them is answered here: each decision below carries Kris's words verbatim, followed by the option they accept.

## Decisions

1. **The Cheztoi record.** "all, but can you show me them or state what they are at least" - accepts (a): capture a fresh chezmoi record named Cheztoi now, keeping the name.
2. **Where tool versions and skills are declared.** "all, but can you show me them or state what they are at least" - accepts (c), Rig staged: the recipe's pin file becomes a Rig fragment declaring the `direct-host` profile, observed for drift through TECHNE-TOOLS-OPS-014 (stage 1); the pilot installs Kris's personal tools, `mgit` first, through a Rig fragment delivered by Cheztoi; `converge.sh`'s own installs move to `rig apply` (stage 3) once Rig can install `ki`'s signed release and the drift check has run clean through one pin bump.
3. **How Rig installs `ki`.** "all, but can you show me them or state what they are at least" - accepts (a): a small harness custom provider under `rig-provider-v1` wraps `ki`'s own signed installer.
4. **How zsh becomes the login shell.** "all, but can you show me them or state what they are at least" - accepts (a): a guarded hand-off from `.bashrc` to `zsh -l` now, with `--shell /bin/zsh` set in the stack at the next rebuild that happens for another reason.
5. **Detached delegation on the host.** "all, but can you show me them or state what they are at least" - accepts (b): the host gets a variant of the delegation instructions without detached agents until `KI-HARNESS-GOV-144` settles supervision and termination.
6. **`techne` and chezmoi binaries on the host.** "all, but can you show me them or state what they are at least" - accepts (a): neither binary on the host; `techne` runs from its checkout through `bun run`, and Rig is the only new binary.
7. **The pilot.** "all, but can you show me them or state what they are at least" - accepts (a): one harness record plus one paired Cheztoi record, delivered after the durability pilot and stage 1.

## Authority

- **Grant:** recorded in the coordinator's decisions log for the run (Decision 7, 2026-10-08): "write the workstation decisions file and Decision Record in Arcadia, capture the rollout records through ki-next in their owning repositories (ki-techne-harness, chezmoi, tools-rig if needed), fold the Rig profile change into TECHNE-TOOLS-OPS-014, select the pilot, update the Project note. Commit locally; push only repositories with no other session's unpushed commits ahead. No acceptance or pruning."
- **Completion target:** none - the grant captures and selects records but delivers none.
- **Push scope:** this run's own commits, fast-forward only, in each repository it changes where no other session's commits are ahead of `origin`; not Arcadia while another session's commit is ahead there.
- **Prune scope:** none.
