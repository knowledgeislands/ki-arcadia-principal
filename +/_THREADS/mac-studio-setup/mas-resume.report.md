# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › mas-resume

**Run report at 13:19 BST · last mark 17:47 BST**

---

## Done

migrate-mas had finished its work before it stopped. I completed its [report](migrate-mas.report.md) in place, and that report is now the full outcome, with checks, Kris's steps and queries.

- **Commit:** the run's chezmoi commit `8d86b58` is now `79d667f`, with identical content. At 11:31 BST another session pulled with a rebase and pushed it, so sol's `origin/main` includes it. This run did not push or commit anything.
- **Checks rerun on the current tree:** all fourteen App Store declarations use `provider = "mas"`, and no `kind = "mas"` remains. `node --test tests/rig-catalogue.test.mjs`: 14 pass, 2 skipped. `rumdl check .`: clean, 90 files. The run's saved `rig doctor` output goes from `warn=13` to `warn=0`, and its dry-run has `failed=0`.
- **Working tree:** nothing from this run is left uncommitted. The only commit ahead of `origin/main`, `5eb9309` (incognito launcher), belongs to another session, and I left it alone.

## In Progress

Nothing is running. The sol steps in the migrate-mas report are still waiting on Kris.

The push of chezmoi has introduced a new risk: the remote now has the `mas` declarations, but tools-rig's `mas` provider (`a9570bb`) is still unpushed. Until TERRA-ORDER is settled, do not run `chezmoi apply` on terra.

## Queries

The full queries are in the migrate-mas report. MAS-PUBLIC is unchanged. TERRA-ORDER is now limited to pushing tools-rig.

```text
MAS-PUBLIC - a) keep mas in the public view as committed in 79d667f
TERRA-ORDER - a) push tools-rig main from sol (b5011d5, 67328f4, a9570bb); I then run the terra steps (pull both, chezmoi diff, chezmoi apply ~/.config/rig, rig doctor shows warn=0)
```

```text
╭─ run report · 2026-10-15T12:19:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · report finished         │
│  █  █ █▄▄▄ ▄▄▄█   █    · 2 queries               │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] mas-resume and migrate-mas finished; nothing running
- [waiting on Kris] migrate-mas sol steps 1–3; no chezmoi apply on terra before TERRA-ORDER
- [queries] MAS-PUBLIC, TERRA-ORDER; carried: CORE-059-ACCEPT, UTM-SOL
- [uncommitted] both reports in the thread folder
- [unpushed] tools-rig `b5011d5`, `67328f4`, `a9570bb` on sol, `main`

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
