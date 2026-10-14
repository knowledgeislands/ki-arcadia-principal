# naming3 report

## Done

- `ki-techne-harness` `27c5427` docs(roadmap): add the vega host rename to TECHNE-TOOLS-OPS-017. The goal, context and boundary now include renaming the host to `vega`: OS hostname, Tailscale name, SSH alias and known_hosts, AWS `Name` tag, binding host name, and the bundle manifest with its `target_host`. Parts owned by chezmoi go there as handoffs. Status stays `triage`.
- `ki-arcadia-principal` `da093f5` docs(checkpoint): bring techne.agent-host current with builds and naming. It records the build outcomes (TECHNE-TOOLS-OPS-015, TECHNE-TOOLS-OPS-022 and DOTFILES-UE-073 are all `awaiting-review`, unpushed, with their live steps still open), the `vega` and `terra` names, the `direct-host`/`agent-host` question, and a next step that hands the naming convention (Decision 29(a)) to `rig.mac-studio-bootstrap`.
- Checks: `rumdl` is clean on both files. `ki repo audit` on `ki-arcadia-principal` gives FAIL=0 WARN=3. On `ki-techne-harness` it gives FAIL=1 WARN=2. The one fail is the existing ITEM-3 on TECHNE-TOOLS-OPS-022, whose live step is deliberately left open; this run did not add it.

## Failed

- Nothing.

## Needs the owner

- The decisions log already settles the one name: Decision 30 (17:23) chose `agent-host`. So the checkpoint records the name as chosen and the rename as **not yet applied**, rather than as an open choice. `rename-agent-host2` stopped without changes because it was waiting on `naming2`. This run replaces `naming2`, so you can now relaunch the rename from that run's survey.
- Push both repositories when you are ready. Nothing was pushed.
- The Rig thread (`rig.mac-studio-bootstrap`) should record the naming convention durably. This run did not touch the Rig checkpoint.
