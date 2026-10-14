# ITEM-2 initiative handle: owner report

## Done

- Reproduced read-only: `ki repo audit --repo ~/.local/share/chezmoi` gives one `ki-work-roadmap` ITEM-2 warning, "territory 'ki-principal' is not a registered Capital handle". Audit otherwise PASS=18 WARN=3 FAIL=0.
- Found the rule in [project-registry.ts](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/change-management/ki-work-roadmap/scripts/rubric/contexts/project-registry.ts) (`territoryRoot`). A territory handle is the Capital's declared `territory_prefix`, falling back to its registry key only when no prefix is declared. The `ki-principal` Capital declares `territory_prefix = "knowledge-islands"`, so the registry key `ki-principal` is deliberately rejected.
- Checked the correct form: `loadTerritoryRegistry('knowledge-islands')` resolves and its registry contains the `rig` Initiative; `ki-principal` does not resolve.
- **Conclusion: the harness rule and the registry are current. The fix belongs in the chezmoi records.** In the four `docs/roadmap/` records that carry `initiative: ki-principal/rig`, change the value to `initiative: knowledge-islands/rig`. The four `docs/housekeeping/` records use bare `initiative: rig` and are not warned on; leave them unless chezmoi wants them qualified the same way.
- No harness record captured, no files edited, no commits. `rumdl` and the harness audit were not needed because nothing changed.

## In progress

Nothing.

## Outstanding queries

- **Needs: chezmoi-handle-edit.** Should a chezmoi session rewrite `ki-principal/rig` to `knowledge-islands/rig` in the four roadmap records? Default: yes, in the next chezmoi session.

```text
chezmoi-handle-edit: yes | no | other: …
```
