# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › registry-bind

**Run report at 10:35 BST · last mark 17:47 BST**

---

## Done

sol now has the same eight `sources` bindings as terra. Authority: Kris's REGISTRY-STORES decision of 2026-10-15, "fix them and don't worry about a backup", so no backup was taken. Only `~/.local/state/ki/registry.toml` changed; nothing was committed, pushed or applied, and no secrets were read.

- **Bound, previewed first.** Each principal's `sources` store now points at its OneDrive folder: `er` → `sources-equal-remedy`, `hnr` → `sources-humans-not-robots`, `ki` → `sources-knowledge-islands`, `legal` → `sources-legal`, `personal` → `sources-personal`, `si` → `sources-sacred-inquiry`, `tmx` → `sources-techmedix`, `va` → `sources-valle-armonia`, all under `~/Library/CloudStorage/OneDrive-Personal/`. All eight previews and all eight writes exited cleanly.
- **Checked.** `ki repo --principals store list` reports `REPOSITORIES=8 STORES=16 BOUND=16`, with nothing unbound. `ki doctor` reports healthy, `pass=15 warn=0 fail=0`, the same as before the change.
- **Left alone.** `sources-hnr-principal` is untouched and does not appear in the registry.
- **Folder choice.** terra was not contacted, as this run allowed no network calls. The folders were matched by territory name; they are the only `sources-*` folders on sol besides `sources-hnr-principal`, and readonly-checks found terra binds "the matching" folder for each. To undo one binding, run `ki repo --repo <checkout> store unbind sources`.

## Friction

These go to the ki-tolerance run (KI-STORE-TOLERANCE):

1. **`ki doctor` cannot see unbound stores.** Before the change, eight declared `sources` stores were unbound, yet `ki doctor` said `healthy`, `warn=0`. It has no check for declared but unbound stores, so it gives no warning and no hint.
2. **`store list` says `unbound` with no next step.** It does not suggest the `ki repo --repo <checkout> store bind sources <path> --write` command, and it does not offer the obvious candidate even when a matching `OneDrive-Personal/sources-<territory>` folder exists.
3. **`--repo` is hidden from the subcommand's help.** `ki repo store bind --help` and `ki repo store list --help` do not mention `--repo`, `--principals` or `--territory`, because those options belong to `ki repo`. Nothing in the help shows how to choose which repository to bind.
4. **An unclear message when nothing is selected.** Run from `~/workspaces`, which is not a repository, with no selection, `ki repo store list` printed lines such as `not /Users/krisbrown/workspaces/equal-remedy/apps-dafacts.org`. It did not say what "not" means or what to do.
5. **The preview hides the file.** It says `would write registry.toml` without the full path (`~/.local/state/ki/registry.toml`). After `--write`, it gives no undo hint (`store unbind sources`).
6. **Unclear argument help.** `bind`'s help describes `<absolute-path>` as an "existing direct directory". "Direct" is not explained.
7. **Folder names cannot be derived from repository codes.** Each folder is named after its territory (`sources-sacred-inquiry`), not the repository code (`si`). Earlier reports still carry stale names (`sources-kit-*`, `sources-er-research`, `sources-vallearmonia-principal`). Neither `.ki.toml` nor `ki` records the expected folder, so matching another machine's bindings meant guessing by name. A per-territory hint, or a way to list another machine's bindings, would remove the guess.

## In Progress

Nothing is running. This report is uncommitted, in the state folder and the thread folder.

## Queries

None. The REGISTRY-STORES query is closed by this run.

```text
╭─ run report · 2026-10-15T09:35:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · 8 stores bound on sol   │
│  █  █ █▄▄▄ ▄▄▄█   █    · 0 queries               │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] registry-bind finished; nothing running from this run
- [handoff] Friction section ready for ki-tolerance
- [uncommitted] this report (state folder and thread folder)

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
