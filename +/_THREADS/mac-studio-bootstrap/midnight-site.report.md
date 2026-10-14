# Rig site refresh and per-host record - owner report

## What has been done

Both approved items are done on sol and committed locally. Nothing was pushed or deployed.

- **Repository.** The Rig site now lives in its own repository, `apps-rig.midnight.ninja`, split out of `apps-midnight.ninja`. The brief named the parent, but it no longer holds the Rig site or MIDNIGHT-HK-001, so all the site work is in `apps-rig.midnight.ninja`.
- **Telegram's description (RIG-SITE-REFRESH).** I removed "(KB-DOTFILES-UE-079, chezmoi thread Decision 49)" at its source, the Rig config in chezmoi. Committed as `bd82eda` in the chezmoi repository. `rig doctor` showed the same 2 findings before and after the edit. Neither comes from this change: Telegram is not installed on sol (SOL-TELEGRAM, parked), and the second was already there. The chezmoi tests have 4 failures, and the same 4 fail on a clean copy of the code without my edit.
- **Catalogue refresh (MIDNIGHT-HK-001).** This did not need terra. sol's Rig config matches the chezmoi source except for one macOS file-handler setting that is not published, and the export reads only the shared config. I ran the export from the committed chezmoi source without applying anything to sol. The catalogue went from 96 to 100 tools. Activity Monitor, Finder, Delta and ProcessSpy are new. Spark is now Spark by Shadowlab, linked to shadowlab.org. ProcessSpy links to process-spy.app. Activity Monitor, Finder and Delta have no link yet, because I could not confirm their pages without going online. The renamed Spark gave a broken "S(" tile label, so I fixed the label helper; no other tile changed. No internal references remain in the catalogue. Typecheck, the tests (30 pass), the build and Biome all pass. Committed as `e18eeb8`.
- **Per-host record (RIG-SITE-HOSTS).** I captured [KB-MIDNIGHT-RIG-SITE-001](/Users/krisbrown/workspaces/personal/apps-rig.midnight.ninja/docs/roadmap/KB-MIDNIGHT-RIG-SITE-001-show-hosts-per-tool.md) "Show hosts per tool" as a triage record. It covers only what each host is declared to carry, with your RIG-SITE-HOSTNAMES decision to show host names with roles: terra - laptop, sol - studio, vega - agent host. It also notes that the site's "no machine identity" wording in `AGENTS.md` needs adjusting when this is planned. The number reservation is `1cce263` and the record is `189928e`. The roadmap and authoring checks pass.
- **Side effects.** To build the site, I installed its locked dependencies into the checkout's ignored `node_modules`, which downloaded packages. The refresh script also downloads Biome itself. The temporary config copy and the temporary worktree are removed.
- **Checks that still fail.** The full `ki repo audit` fails in both repositories. The causes are that sol has no local KI registry and is missing some runtime skill activations, plus GUIDE-4 failures in chezmoi's new `setup-mac-rig.md`. None of these comes from this work.

## What is in progress

Nothing. This run has finished.

- **apps-rig.midnight.ninja on sol:** 3 commits ahead of `origin/main` on `main`. Pushing deploys the live site.
- **chezmoi on sol:** `main` is ahead of `origin/main`, including `bd82eda` and other runs' commits.
- **sol's applied Rig config** still has the old Telegram description until the next chezmoi apply. That does no harm, because the catalogue was pulled from the source.

## Outstanding queries

### MIDNIGHT-PUSH - Publish the refreshed site

**Summary:** the refresh and the record are committed on sol only. Pushing `apps-rig.midnight.ninja` deploys rig.midnight.ninja.

**Need from you:** approve or hold the push. The chezmoi commit can travel with the next chezmoi push.

**Recommendation:** push once terra's checkout of this repository is confirmed level. Its roadmap ledger was at 000 when last checked, so no number clash is expected.

```text
MIDNIGHT-PUSH: push / hold — <notes>
```

### MIDNIGHT-HK-RECORD - Record the refresh as a run

**Summary:** the repository's process records a weekly refresh as a spawned run, and acceptance then sets the template's `last-run`. This run was not allowed to accept records. Spawning a run first would also have taken the SITE-001 number you wanted for the per-host record. So the refresh is evidenced only by commit `e18eeb8`, and `last-run` is still empty.

**Need from you:** choose whether to set `last-run` to 2026-10-14 with reference `e18eeb8` directly (one small commit), or leave it for the next weekly run.

**Recommendation:** set it directly. Otherwise the next ki-next pass will treat the refresh as overdue.

```text
MIDNIGHT-HK-RECORD: set last-run / leave — <notes>
```

### MIDNIGHT-LINKS - Links for the built-ins and Delta

**Summary:** Activity Monitor and Finder could link to Apple support pages, as the other built-ins do. Delta has no public page.

**Need from you:** decide whether to allow a short online check to confirm the Apple support pages for those two.

**Recommendation:** allow it, as part of KB-MIDNIGHT-RIG-SITE-001's work. Delta stays unlinked.

```text
MIDNIGHT-LINKS: check online / leave unlinked — <notes>
```

### Reply block

```text
MIDNIGHT-PUSH: push / hold — <notes>
MIDNIGHT-HK-RECORD: set last-run / leave — <notes>
MIDNIGHT-LINKS: check online / leave unlinked — <notes>
```
