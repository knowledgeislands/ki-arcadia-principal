# [Platform foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md) › [tools-burndown](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/tools-burndown.md) › mgit-members

**Run report at 22:16 BST · last mark none**

---

## Done

- **Model delivered.** In tools-mgit, an external repository is now an ordinary `[members."PATH"]` entry with `kind`, `type` and `source`, for example `[members."../../.local/share/chezmoi"]`. `locations` stays the discovery instruction: `repo:` and `territory:` say where to look, and `mgit register` writes what it finds as members. A root that the local scan already records is not written twice. The record is [KI-TOOL-MGIT-CLI-017](/Users/krisbrown/workspaces/knowledge-islands/tools-mgit/docs/roadmap/KI-TOOL-MGIT-CLI-017-unified-external-members.md), now Awaiting review.
- **Path validation.** A repository member path may climb out of the workspace with one or more leading `../` segments, but only if a safe path follows them. Workspace members and old grouped members must stay inside the workspace.
- **Dispatch and deduplication.** Repositories are matched by their real physical path. An external member that more than one workspace reaches, or that also sits behind a navigation symlink, is dispatched once. Two local members that resolve to the same repository still fail, as before. Local members are listed first, then external ones.
- **Repair.** `mgit repair` checks external members that are present, including their type. It never clones a missing external member: it reports it and carries on. There is no opt-in to clone one.
- **Migration decision.** Old `[registered.members]` tables are still read, with one deprecation warning per manifest. `mgit doctor` shows them as a warning. A plain `mgit register` rewrites them as typed members, and `--dry-run` previews that. There is no separate migrate command. The guide warns that a manifest managed by chezmoi should migrate only once every machine that applies it runs a release that can read the new form.
- **Commits** (tools-mgit `main`, local only): `438722c` reserves the record number, `8703652` readies the record, `bcac3d1` is the feature and `2b66457` submits the record for review. Each commit was staged by explicit path.
- **Checks.** All passed, run on the final tree:
  - `ki repo audit --repo .` passes, keeping its existing warning about the missing pre-commit hook.
  - `shellcheck`, `bash -n`, `mandoc -T lint` and `git diff --check` are clean.
  - `bats tests/` passes 98 of 98. Five tests are new and two were updated.
  - The territory producer proof, run with the installed `ki`, passes 10 of 10.
- **"Dispatched exactly once" proof.**
  - In test fixtures, dotfiles is dispatched once from both `workspaces/personal` and `workspaces`, with and without the navigation symlink. A second workspace reaching dotfiles through its own location does not change that, and neither does discovery that follows symlinks.
  - Live, the working-tree build lists the unchanged real manifests: 7 repositories from `~/workspaces/personal` and 54 from `~/workspaces`, and `mgit doctor` reports healthy for both. `register add --repo ~/.local/share/chezmoi --dry-run` from `~/workspaces/personal` previews "7 local and 1 external member(s)" and writes nothing.
  - I also built a throwaway set of manifests outside the estate that point at the real repositories. With it, the real dotfiles checkout was dispatched exactly once from both levels, with and without a symlink to it, and under symlink-following discovery. Those files are deleted.
- **Live symlink.** `~/workspaces/personal/dotfiles` does not exist, and chezmoi does not manage it: the source has no entry for it. I did not create it.
- **Consumer manifest left as it is.** The chezmoi source `workspaces/personal/dot_mgit.toml` and the live `~/workspaces/personal/.mgit.toml` are identical. Neither has a `registered.members` table or a dotfiles entry, so there was nothing to migrate. Nothing was applied, edited or committed in chezmoi, and its working tree is clean. See CONSUMER-MIGRATE.

## In Progress

Nothing is running.

The brief said earlier that dotfiles was registered with the personal workspace. That registration is not on this machine (sol), in either the chezmoi source or the live manifest. If another machine or session holds it as an unpushed `[registered.members]` table, the new build reads it and `mgit register` rewrites it.

The installed `mgit` on sol is not the v0.17.0 release. It is a development link to the tools-mgit working tree that reports `0.17.0`, so it already reads the new form. The query below handles that.

## Queries

### CONSUMER-MIGRATE: when the personal workspace manifest gains dotfiles

**Context:** On sol, `~/.local/bin/mgit` links to the tools-mgit working tree, so it already reads external members. The released v0.17.0 does not: it rejects `../../.local/share/chezmoi` as an unsafe member path, and that stops `mgit` in both `~/workspaces/personal` and `~/workspaces`. Any machine that applies the chezmoi source while running the release would break. So I left the source and live manifests on the current form, and they agree. Here is the prepared `workspaces/personal/dot_mgit.toml`:

```toml
# Generated by `mgit register`.
kind = "workspace"
locations = ["local", "repo:../../.local/share/chezmoi"]

[members."acquire"]
kind = "repository"
type = "standard"
source = "git@github.com:krisb/acquire.git"

[members."apps-kris.me.uk"]
kind = "repository"
type = "standard"
source = "git@github.com:krisb/apps-kris.me.uk.git"

[members."apps-midnight.ninja"]
kind = "repository"
type = "standard"
source = "git@github.com:krisb/apps-midnight.ninja.git"

[members."apps-rig.midnight.ninja"]
kind = "repository"
type = "standard"
source = "git@github.com:krisb/apps-rig.midnight.ninja.git"

[members."apps-tower.midnight.ninja"]
kind = "repository"
type = "standard"
source = "git@github.com:krisb/apps-tower.midnight.ninja.git"

[members."personal-agentic-harness"]
kind = "repository"
type = "standard"
source = "git@github.com:krisb/personal-agentic-harness.git"

[members."personal-principal"]
kind = "repository"
type = "standard"
source = "git@github.com:krisb/personal-principal.git"

[members."../../.local/share/chezmoi"]
kind = "repository"
type = "standard"
source = "git@github.com:krisb/dotfiles.git"
```

**Query:** Should the consumer manifest wait for an mgit release, or change now on sol only?

**Options:**

a) (recommended) Wait for the release. Once you accept KI-TOOL-MGIT-CLI-017, a release containing it ships. When every machine that applies the chezmoi source runs that release, a run puts the prepared content into `workspaces/personal/dot_mgit.toml`, reviews `chezmoi diff ~/workspaces/personal/.mgit.toml`, applies only that target, and commits only that file.

b) Change it now on sol. Sol's development link reads the new form, but once the chezmoi commit is pushed, any other machine still on v0.17.0 fails in `~/workspaces/personal` and `~/workspaces`.

```text
CONSUMER-MIGRATE

a) Wait for an mgit release. After Kris accepts KI-TOOL-MGIT-CLI-017, release mgit with it. When every machine that applies the chezmoi source runs that release, a run writes the prepared content from the mgit-members report into workspaces/personal/dot_mgit.toml in the chezmoi source, reviews chezmoi diff ~/workspaces/personal/.mgit.toml, applies only that target with chezmoi apply ~/workspaces/personal/.mgit.toml, and commits only that file in the chezmoi source. Do not create the ~/workspaces/personal/dotfiles symlink in that run.
```

```text
╭─ run report · 2026-10-16T21:16:00Z ──────────────────────╮
│                                                          │
│  █ █ █▀▀█ █    █▀▀▄   · run mgit-members finished        │
│  █▀█ █  █ █    █  █   · 4 commits, nothing pushed        │
│  █ █ █▄▄█ █▄▄▄ █▄▄▀   · consumer migration on hold       │
│                                                          │
╰──────────────────────────────────────────────────────────╯
```

- [awaiting review] KI-TOOL-MGIT-CLI-017
- [waiting] CONSUMER-MIGRATE
- [unpushed] tools-mgit `main` on sol, 4 commits ahead of `origin/main`, up to `2b66457`
- [untouched] chezmoi source on sol: clean, nothing committed
- [uncommitted] this report, as briefed

Resume line: `Resume Fnd: tools-burndown under current ki-pmo and ki-delegation since 2026-10-16T21:16:00Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.`
