# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › ghd-followup

**Run report at 00:38 BST · last mark 17:47 BST**

---

Run on sol, locally, 2026-10-15 about 00:30 to 00:38 BST, under decision 76 (Kris, 2026-10-15: "GHD-BACKUP - a) I have looked at the new list; an agent on sol deletes ~/Library/Application Support/GitHub Desktop.bak-2026-10-14" and "GHD-DECLARE - a) capture a tools-rig triage record ... and list it as a Rig difference in the mac-studio-bootstrap Project note"). Local commits only, nothing pushed. This report is not committed; the coordinator commits it with the thread folder. A copy sits at `~/.local/state/ki/agents/mac-studio-bootstrap/ghd-followup.report.md`, because the brief named both places.

## Done

- **GHD-BACKUP.** Checked the path first: `~/Library/Application Support/GitHub Desktop.bak-2026-10-14` was a real folder (not a link), 23 MB, and the live `GitHub Desktop` folder sat beside it. Deleted exactly that folder. Confirmed it is gone and the live `GitHub Desktop` folder remains. GitHub Desktop was not touched.
- **GHD-DECLARE.** Captured [KI-TOOL-RIG-CORE-057](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-057-github-desktop-repository-list.md), GitHub Desktop repository list, as a `triage` record with no horizon. It describes a Rig step that reads `~/workspaces/.mgit.toml` and the eight territory manifests, adds each checkout through the `github` shim with a pause between opens, never removes anything and changes nothing on a second run. It cites the gh-desktop report, including the eight opens dropped while an Add Repository dialog was open. No existing tools-rig record covered this. Following the ledger rule, the number was reserved in its own commit first.
  - tools-rig `db5ae29` chore(roadmap): reserve KI-TOOL-RIG-CORE-057
  - tools-rig `608eba9` docs(roadmap): capture KI-TOOL-RIG-CORE-057 GitHub Desktop repository list
  - Checks: `ki repo audit` PASS=19 WARN=1 FAIL=0. The one warning was already there (no committed pre-commit hook, which stays with KI-HARNESS-GOV-117). `git diff --check` was clean.
- **Project note.** Added a "Rig difference: GitHub Desktop's repository list" bullet to the Notes of the [mac-studio-bootstrap Project note](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md), next to the R2 and R4 Rig notes. It links KI-TOOL-RIG-CORE-057 by full identifier and absolute path, and I updated the note's `updated` time.
  - ki-principal `4bad9e4` docs(projects): list GitHub Desktop's repository list as a mac-studio-bootstrap Rig difference (that file only)
  - Checks: `rumdl` found no issues in the file. `ki repo audit` on ki-principal fails on findings that were already there and are not in this file: the Markdown gate, the checkpoint schema for `rig.mac-studio-bootstrap.md` and `knowledge-islands-model.observatory.md`, links in ADR-KI-PRINCIPAL-007, and tsc/knip.
- **Pulls.** Ran `git pull --ff-only` in both repositories before committing, as the brief asked. Both were already up to date.

## In Progress

Nothing from this run is still running.

- Unpushed: tools-rig is 2 commits ahead of origin, and ki-principal is 1 ahead, both on sol `main`.
- The ki-principal audit failures listed above are not new and were not changed by this run.

## Queries

This run raises no queries.

```text
╭─ run report · 2026-10-14T23:38:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · no queries waiting      │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] ghd-followup finished, nothing running from this run
- [waiting] no queries from this run
- [uncommitted] this report
- [unpushed] tools-rig `db5ae29`, `608eba9`; ki-principal `4bad9e4`; thread folder

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
