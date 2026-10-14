# dispatch-assess: principal-to-territory command dispatch (assessment only)

Run: ways-of-working / dispatch-assess, 2026-10-13. Decision 12. No repository changed; no commits.

## Done

- Verdict: the interim subshell approach suffices, with one amendment. Resolve the target root from the registry rather than walking up to the workspace parent and into a sibling. The sibling walk breaks today for at least one member (the dotfiles repository lives at `~/.local/share/chezmoi`, not beside its Principal). With a registry-resolved root the pattern works in editor terminals and ordinary terminals alike, needs nothing new in `ki`, and keeps every command owned by Tower.
- A ready-made dispatch route already exists: `mgit -B` runs a bare command in each selected root, and `mgit -t <handle> -f <prefix>` already delegates selection to `ki`. `mgit -t personal -f apps-tower -B bun run self:tower:pull` runs Tower's own script in Tower's root from anywhere. Nothing needs inventing.
- The real gap is exact selection. `-f` is a `startsWith` test on the physical directory basename, with no exact mode and no match on registry key or canonical identity. One prefix can select several members, and a `cd "$(ki territory roots ...)"` subshell or an `mgit -B` run then fans out. Collisions are latent, not live: no registered basename is currently a strict prefix of another, so `-f apps-tower` is exact in practice but by accident.
- Minimal later capability: one exact-member selector on the shared selection grammar, for example `-m, --member <key|url>`, honoured by `ki territory roots`, `ki repo`, `ki registry` and therefore `mgit`. It must match exactly one member or fail. No new noun, no new `run` command, no task system. `ki territory roots --member X` already prints the one root a subshell needs; `mgit -B` already runs the command. A `ki repo exec` would duplicate `mgit -B` and is not recommended.

## Failed

- A probe had a side effect outside any repository. I ran `bun run self:tower:export --help` inside the subshell to confirm cwd handling. Tower's export script has no `--help` flag and ran the real export, writing `playerInfo-2026-10-13.dat` and `userData-2026-10-13.json` to `~/Downloads` at 05:06 BST. The files are routine export output from the current snapshot. Tower's working tree is clean. I left the files in place rather than delete them.

## Needs Kris

- Delete or keep the two `~/Downloads` files from the accidental export.
- Decide whether to adopt the `--member` selector recommendation into the brief's command-surface points (20 to 22), and whether it keys on the registry key, the canonical repository URL, or both. Recommendation: both, because the key is machine-local and the URL is the only portable identity.
- Note for the brief: installed `ki` 0.10.1 rejects `-t ki` ("territory ki is not declared by a registered Capital"). The alias code is in `tools-ki` source and neither Principal's `.ki.toml` declares `territory_aliases`, so the aliases listed in the brief are not yet usable from the shell on this machine.

---

## Evidence

### 1. The interim subshell approach on the Tower example

Tower's commands, owned by Tower (`apps-tower.midnight.ninja/package.json` scripts):

| Purpose | Script | Implementation |
| --- | --- | --- |
| Save pull | `bun run self:tower:pull` | `apps/site-tower/pipeline/pull-local.ts` reads the newest `playerInfo.dat` under `~/Library/Containers` and the Rend export, writes to `+/tower/` |
| Downloads export | `bun run self:tower:export [--to <dir>]` | `apps/site-tower/pipeline/export-share.ts` copies both to `~/Downloads` as dated files |

Both scripts anchor repository paths on `import.meta.dirname` (`pipeline/snapshot.ts:6`, `REPO_ROOT`), so they are cwd-safe once run through `bun run` in Tower's root. The `self:` prefix is the governed convention for repository-owned scripts (`ki-engineering` SCR-1, SCR-3), so "commands owned by the target repository" already has a name in the standard.

What works:

- Registry-resolved subshell, tested from `personal-principal`; the terminal returned to its original directory afterwards:

  ```sh
  ( cd "$(ki territory roots -t personal -f apps-tower.midnight.ninja)" && bun run self:tower:pull )
  ```

- Existing bare dispatch through mgit, tested with `pwd`; mgit prints the member label then the command output, with cwd set to the member root:

  ```sh
  mgit -t personal -f apps-tower -B bun run self:tower:pull
  ```

- Editor terminals: `ki territory open` places the Capital first in the Zed window on purpose (`tools-ki/src/core/territory/targets/zed.ts:151`), and the VS Code projection is a `folders` list with the same ordering (`targets/vscode.ts`). Zed and VS Code open new terminals in the first or active worktree root by default, so "terminals normally open in the Principal" holds and the subshell is unaffected. Both routes above depend only on `ki` and `mgit` being on `PATH`, which editor terminals inherit from the login shell.
- Cross-territory: Tower's Capital is `personal-principal`, not `ki-principal`. Because the registry is estate-wide, `-t personal` resolves from any directory, including a `ki-principal` terminal.

Where it breaks:

- Sibling walk (`cd ../apps-tower...`) assumes the member is beside the Principal. The personal territory member `https://github.com/krisb/dotfiles` is registered under key `chezmoi` at `~/.local/share/chezmoi` (`ki territory show -t personal -v`). Neither `../dotfiles` nor `../chezmoi` exists under `~/workspaces/personal`. Registry resolution is the fix, and it also covers machines with different layouts because `registry.toml` is machine-local (`~/.local/state/ki/registry.toml`, 59 entries here).
- Prefix fan-out: `ki territory roots -t personal -f apps` prints four roots; inside `cd "$(...)"` that is one multi-line string and the subshell fails or lands in the wrong place; `mgit -f apps -B <cmd>` runs the command in all four. Exactness today depends on choosing a prefix no other basename shares.
- Different checkout names across machines: `-f` matches the physical basename, not the canonical identity, so a member checked out under another directory name elsewhere needs a different filter. Registry keys are also assigned per machine at `ki registry add`, so only the repository URL is portable.
- `bun run` needs the target's dependencies installed; `self:tower:pull` is macOS-only by nature (container paths). Neither is a dispatch problem, but both are reasons the command must stay the target's own.
- Minor surprise: `self:tower:export --to <relative>` resolves against `process.cwd()` (`export-share.ts:21`), which inside the subshell is Tower's root, not the terminal's directory. Use an absolute or `~/` path.

### 2. The gap in `ki`'s territory resolution

- The filter is a prefix test on the directory basename and nothing else (`tools-ki/src/core/territory/filters.ts:7-8`):

  ```ts
  export const matchesDirectoryName = (path: string, filters: readonly string[]): boolean =>
    !filters.length || filters.some((filter) => basename(path).startsWith(filter))
  ```

- Territory membership is exact and canonical: the Capital declares `territory_members` as repository URLs (`personal-principal/.ki.toml:34-43`), `resolveTerritory` maps each identity to its registry entry and fails if any is unregistered (`resolution.ts`, "Registration completeness is authoritative before a basename filter can exclude anything"), then applies `matchesDirectoryName` to the physical path. Each `TerritoryMember` carries `key`, `repository` and `root`, so exact data exists at the point of filtering; the grammar simply has no selector that uses `key` or `repository`.
- The same selection options (`--repo`, `-t`, `-f`, `--estate`, `--principals`) are shared by `ki repo`, `ki registry` and `ki territory` (`core/repository/selection.ts` `selectRepositoryTargets`; `commands/territory/selection.ts`), and `mgit` reuses `ki`'s roots for `-t`. One selector added there reaches every surface.
- `--repo <path-or-pattern>` is exact but path-based and relative to cwd, so it reintroduces the layout dependency the registry removes.
- `ki territory roots` is already described as "write selected physical roots for machine consumption" and has `-0` for NUL separation. It is the right output surface for a subshell; it only lacks a guarantee of one line.
- Observed: no registered basename is a strict prefix of another today (`ki registry list`), so no live collision. The `ki-` family (`ki-agentic-harness`, `ki-principal`, `ki-specifications`, `ki-techne-harness`) and the `apps-` family show how easily a short prefix fans out.

### 3. Minimal later capability

Recommendation, in order of cost:

1. Exact-member selector on the shared grammar: `-m, --member <key|url>`, repeatable, combinable with `-t`, `--estate` or `--principals`, matching `TerritoryMember.key` or `TerritoryMember.repository` exactly, and erroring when a value matches nothing. Implementation touches `filters.ts`, `resolution.ts` and `repository/selection.ts`; `mgit` inherits it. This closes the gap for `ki territory roots`, `ki repo`, `ki registry` and `mgit -B` at once.
2. No new command. `ki territory roots -t personal --member apps-tower.midnight.ninja` prints one root for a subshell; `mgit -t personal --member apps-tower.midnight.ninja -B bun run self:tower:export` runs the target's own script in its root. Under brief point 20 (`ki repo` acts on a selection), `roots` would later sit under `ki repo` as `ki repo roots` or `ki repo list --paths`; that rename is independent of this recommendation.
3. Optional shell sugar, outside `ki`: a two-line function in the chezmoi-managed shell config, for example `kiat <territory> <member> <command...>`, that does the subshell. It is personal convenience, not a capability, and it should not be documented as a KI command.

Not recommended: a `ki repo exec`/`ki run` command (duplicates `mgit -B`), a command catalogue or task registry (the `self:` script namespace and each repository's `package.json` already own and document the commands), or renaming `-f`.

### Checks

- No repository modified; `git status` clean in `tools-ki`, `ki-principal`, `personal-principal` and `apps-tower.midnight.ninja` at the end of the run. No commits.
- Read-only commands only, except the accidental export recorded under Failed.
- No remote calls.
