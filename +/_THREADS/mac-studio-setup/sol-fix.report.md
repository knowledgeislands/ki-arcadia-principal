# sol-fix - finish sol as a working Rig (SOL-AGENT-FIX and CODEX-GROUPS) - owner report

Thread [rig.mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.mac-studio-setup.md), Project [mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md), Initiative [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md). Run on sol, locally, 2026-10-14 16:00 to 16:20 (sol's clock shows BST). Authority: Kris, 2026-10-14, "can I leave it to you to get this rig up and running?" (decisions log).

sol is now a working Rig apart from three things that need you: the Codex chezmoi template (CODEX-GROUPS), the `ki-pmo` skill link (SKILLS-CONFIG), and Telegram, which is still parked. No commits, no pushes, no `brew`, no `rig apply` or `rig upgrade`, no reboot, nothing in hnr-org, and `~/.config/ki/config.toml` untouched. No secrets read or printed. Evidence files are in this folder, named `sol-fix-*.txt`. The earlier report with the same name, from the first sol-fix run, is kept as `sol-fix.report.prev-2026-10-14.md`.

## What has been done

- **Checkouts fast-forwarded.** I fetched all 56 checkouts under `~/workspaces/<group>/<repo>` and skipped `_old`. None was dirty or diverged. Five were behind and were fast-forwarded: `humans-not-robots/hnr-backend` (5 commits), `personal/acquire` (16), and `personal/apps-midnight.ninja`, `apps-rig.midnight.ninja` and `apps-tower.midnight.ninja` (1 each). 50 were already level. I skipped `knowledge-islands/paperclip`, which is on `ki/stable` rather than `main` (it is level with its upstream). Results are in `sol-fix-ff.txt`. "hnr-org" is the AWS organisation, so the `humansnotrobots` GitHub checkouts were in scope.
- **KI tools checked, no rebuild needed.** None of the tool checkouts moved in this run. `tools-ki` (0.10.2 to 0.10.3), `tools-rig` and `tools-techne` had moved since the sol-build run through an earlier pull at 15:37. Their lockfiles are unchanged, and `bun install --frozen-lockfile` reported "no changes". The links in `~/.local/bin` run the checkouts directly, so they are current: `ki` 0.10.3, `rig` 0.6.3+dev, `techne` 0.2.0, `mgit` 0.17.0, `git-almanac` 0.2.0.
- **Dead skill links removed, by hand.** These are `ki-delegate` (pointing into the old `kit` tree) and `ki-design-loop` (renamed in the harness), in both `~/.claude/skills` and `~/.agents/skills`. Nothing dead remains. Their old targets are in `sol-fix-removed-links.txt`. ki's own mechanism, `ki skill remove`, rewrites `~/.config/ki/config.toml`, which this run may not touch, so I unlinked the dead links directly. `ki-pmo` is **not** linked: see SKILLS-CONFIG.
- **Old `mise` claude shim removed.** The cause was an old global npm `@anthropic-ai/claude-code` 2.1.220 inside an inactive mise Node, 24.18.0 (from July). I uninstalled that one npm package and ran `mise reshim`. Now `claude` resolves only to `/opt/homebrew/bin/claude` (2.1.287). The other packages in Node 24.18.0 were left alone.
- **Old paths cleared from Claude settings.** `~/.claude/settings.json` had 82 `~/workspaces/kit|hnr|kis` entries in `permissions.additionalDirectories`, out of 146. I removed them, leaving 64, and checked that every other key is identical. The backup is `~/.claude/settings.json.bak-2026-10-14`. `chezmoi status` shows no drift for `~/.claude`, so the source does not put them back. `~/.claude.json` and the per-project `.claude/settings*.json` files had none.
- **CODEX-GROUPS diagnosed** (no change): see the query below.
- **Checks re-run** (outputs in `sol-fix-check-*.txt`):

| Check | Result |
| --- | --- |
| `rig doctor` | unhealthy: pass=228 fail=2 skipped=19. The failures are `telegram` missing (parked, SOL-TELEGRAM) and `port.headroom` "conflicting (owner: Python; expected: headroom-ai)". The second is a false finding: Headroom works, but your hand install runs as a Python process. I left it alone because it is connection-critical |
| `chezmoi status` | aborts on the Codex template (CODEX-GROUPS). With `~/.codex/config.toml` left out, it shows 11 `M` targets, all from upstream commit `8a58442` (15:46 today, pulled but not applied): `~/.config/rig/conf.d/40-macos.toml` (adds the SVG default-app handler) and 10 `workspaces/**/.mgit.toml` manifests (mgit schema change) |
| `chezmoi diff --exclude=scripts` | same 11 files, 565 lines, nothing else |
| `mcporter list` | 12 servers: 9 healthy (the 7 KI servers plus `obscura` and `granola`), `linear` needs auth, `project-rend` offline, `kb-mcp-acquire-whatsapp` CONNECTION_CLOSED (parked, SOL-WHATSAPP) |
| `ki doctor` | unhealthy: pass=12 fail=2. The HNR Harness is missing (SOL-HNR-HARNESS) and `ki-design-loop` is declared but can't be resolved (SKILLS-CONFIG) |
| `claude --version` / `codex --version` | 2.1.287 (Homebrew) / codex-cli 0.162.1 (Homebrew) |

## What is in progress

Nothing. The run has finished.

## Outstanding queries

### CODEX-GROUPS - Codex template reads the old mgit schema

**Summary:** the territory manifests are fine. The failing manifest is the **root** one, `workspaces/dot_mgit.toml` in the chezmoi source. Commit `8a58442` ("chore: update mgit config", 2026-10-14 15:46, made elsewhere and pulled to sol 10 seconds later) re-registered every manifest with current mgit. That rewrote the root from schema 1 (`schema = 1`, `default = "default"`, `[groups.default.members."<territory>"]`) to the path-keyed schema (`locations = ["local"]`, `[members."<territory>"]`). Line 23 of `.chezmoitemplates/codex-trusted-projects-json` still reads `$root.groups.default.members`. Line 28 already reads the territory manifests as `.members`, so only the root lookup is stale. chezmoi runs with `missingkey=error`, so the whole `~/.codex/config.toml` render fails. That failure also aborts plain `chezmoi status` and `chezmoi diff`. sol's target `~/workspaces/.mgit.toml` is still schema 1, because the new manifests aren't applied yet. Every machine on `8a58442` fails the same way, terra included.

**Need from you:** approval for a one-line source fix in the chezmoi repository, committed locally, then an apply on sol.

**Recommendation:** replace line 23 with a lookup that reads either schema:

```gotemplate
{{- range $territory, $_ := dig "members" (dig "groups" "default" "members" (dict) $root) $root -}}
```

I dry-rendered it with `chezmoi execute-template`, writing nothing. Against the current source it gives 73 trusted paths, and a schema-1 sample gives the right territory. Then on sol run `chezmoi diff ~/.codex ~/workspaces ~/.config/rig`, followed by `chezmoi apply ~/.codex ~/workspaces ~/.config/rig/conf.d/40-macos.toml`. Add a render check to the chezmoi pre-commit, for example `chezmoi execute-template` over each template or `chezmoi diff` with a non-zero exit check, so a manifest regeneration can't break rendering again.

### SKILLS-CONFIG - `ki-pmo` is not linked because the skill list in chezmoi is stale

**Summary:** the user skill set comes from `[skills.*]` in `~/.config/ki/config.toml`, which chezmoi manages (`dot_config/ki/config.toml`). It matches the source, so there is no drift. The source still declares `ki-design-loop`, which the harness renamed to `ki-pmo-design`. It declares neither `ki-pmo` nor `ki-pmo-design`, though ki's bootstrap minimum includes `ki-pmo-design`. ki's mechanisms, `ki skill add` and `remove`, write that file, so I stopped this step rather than hand-linking.

**Need from you:** approval for the source fix and the apply.

**Recommendation:** in the chezmoi source, replace `[skills.ki-design-loop]` with `[skills.ki-pmo-design]` and add `[skills.ki-pmo]`, both on `knowledgeislands/ki-agentic-harness`, as a local commit. Then on sol run `chezmoi apply ~/.config/ki/config.toml`, `ki repair --apply` and `ki doctor`. That clears the `ki-design-loop` failure and links both skills for Claude and Codex. It also settles the skills part of SOL-KI-CONFIG-DRIFT.

### OLD-SOURCE-DIRS - six more stale Claude directories

**Summary:** after the clean-up, six `additionalDirectories` entries in `~/.claude/settings.json` point at OneDrive folders that don't exist and that the source no longer declares: `sources-kit-hnr`, `sources-kit-legal`, `sources-kit-principal`, `sources-kit-techmedix`, `sources-er-research` and `sources-vallearmonia-principal`. A seventh, the WhatsApp spool, is declared and is only missing because of SOL-WHATSAPP. They were outside this run's `kit`/`hnr`/`kis` scope.

**Need from you:** whether to remove the six.

**Recommendation:** remove them the same way, with a backup, in the next sol run.

### Reply block

```text
CODEX-GROUPS - approved: commit the dig-based line-23 fix in the chezmoi source locally, then chezmoi diff and apply ~/.codex, ~/workspaces and ~/.config/rig/conf.d/40-macos.toml on sol; add a template render check to pre-commit
SKILLS-CONFIG - approved: in the chezmoi ki config replace ki-design-loop with ki-pmo-design and add ki-pmo, commit locally, apply ~/.config/ki/config.toml on sol, then ki repair --apply and ki doctor
OLD-SOURCE-DIRS - remove the six stale OneDrive source entries from sol's Claude settings, with a backup
```

## Differences

These are the places where sol needed hand work that the bootstrap, chezmoi or the tools should have done themselves. Each gives the symptom, the cause, and where the fix belongs.

1. **Dead skill links after a rename or a tree move.** Symptom: `ki-design-loop` and `ki-delegate` links pointed at nothing in `~/.claude/skills` and `~/.agents/skills`. Cause: ki links only declared skills and never removes links whose targets have gone; the rename wasn't carried into the chezmoi skill list; `ki-delegate` dates from the July `kit` layout. Fix: `tools-ki` (`ki repair` should find and offer to remove dead links into harness paths) and the chezmoi source `dot_config/ki/config.toml` (SKILLS-CONFIG).
2. **Coordinator skills missing on a new host.** Symptom: `ki-pmo` and `ki-pmo-design` were not linked, and `ki doctor` fails on `ki-design-loop`. Cause: the skill list in chezmoi lags the harness, and nothing checks it against ki's bootstrap minimum. Fix: the chezmoi source now, plus a check in `tools-ki` or chezmoi CI that compares the declared skills with the harness inventory.
3. **Old claude shim shadowing Homebrew.** Symptom: `~/.local/share/mise/shims/claude` came first on PATH. Cause: a global npm `claude-code` stayed in an old mise Node (24.18.0). mise makes shims from every installed version, and nothing prunes old Node versions. Fix: tools-rig (a doctor check for PATH shadowing of declared tools) and the chezmoi mise configuration (`mise prune`, or a bootstrap step).
4. **Claude trusted directories only ever grow.** Symptom: 82 of 146 `additionalDirectories` were retired `kit`/`hnr`/`kis` paths, plus six retired OneDrive source folders. Cause: chezmoi's `transform-claude-code-settings-fragments` merges by union (`bin/chezmoi/executable_json`, `[...new Set([...existing, ...desired])]`), so removing a declared directory never removes it from the target. Fix: the chezmoi source. Record the previously managed set and remove what leaves the declaration, or at least prune entries under `~/workspaces` and the OneDrive sources that no longer exist.
5. **mgit schema change broke a chezmoi template (CODEX-GROUPS).** Symptom: `chezmoi apply ~/.codex` fails. Cause: `mgit register` rewrote the root manifest to the path-keyed schema, and the template still reads schema-1 `groups.default.members`. Fix: the chezmoi template, plus a pre-commit render check. tools-mgit could also note the schema change in its CHANGELOG for consumers.
6. **One bad template hides all other drift.** Symptom: plain `chezmoi status` and `chezmoi diff` abort, so the 11 genuinely pending files were invisible until each target was listed by hand. Cause: chezmoi stops at the first render error. Fix: a chezmoi pre-commit or CI render check, and the `audit-chezmoi-health` routine should fall back to per-target status.
7. **Declared harness not installed.** Symptom: `ki doctor` reports `humansnotrobots/hnr-agentic-harness` missing. Cause: the chezmoi ki config declares it, but the host bootstrap never ran `ki bootstrap` for it (SOL-HNR-HARNESS). Fix: the host bootstrap in the chezmoi repository, which should run `ki bootstrap` after the config is applied.
8. **Headroom port reported as a conflict.** Symptom: `rig doctor` reports `port.headroom: conflicting (owner: Python; expected: headroom-ai)` while Headroom works. Cause: Headroom was installed by hand (`headroom install apply`), and its process shows as `Python`. Fix: tools-rig (port-owner matching for Python entry points) and the chezmoi Headroom declaration (SOL-RECORDS).
9. **Dev-channel checkouts drift.** Symptom: five checkouts were behind, and three tool checkouts had moved since their last build. Cause: nothing pulls `main` on a schedule or rebuilds after a lockfile change on the dev channel. Fix: [KB-DOTFILES-UE-089](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-089-ki-tool-release-channels.md): a scheduled `ff-only` pull that skips dirty or diverged checkouts, and `bun install` when `bun.lock` changes.
10. **Upstream chezmoi commits land unapplied.** Symptom: `8a58442` was pulled at 15:46 but not applied, which left 11 files of drift. Cause: pulling the source and applying it are separate, with no prompt between them. Fix: the chezmoi workflow and guide, for example a pull hook that runs `chezmoi diff` and reports.
11. **Harness skill links point two ways.** Symptom: `ki-delegation` links through `~/.local/share/ki/harnesses/...` (itself a link to the checkout), while the other KI skills link straight to the checkout. Both work. Cause: links made before and after `ki dev local on`. Fix: tools-ki (`ki repair` could normalise links to one form). Low priority.
12. **The run footer contradicted the brief.** Symptom: the brief approved `git fetch` and machine changes, while the generic footer said "no Git fetch… make no environment change" and named a different report path. Cause: `ki agent launch` appends a fixed authority footer that doesn't reflect the approved tier. Fix: ki-agentic-harness `ki-delegation` and tools-ki `ki agent` should pick the footer from the authority tier. I followed the brief and the decisions-log approval, and wrote the report to both paths.
13. **A reused run name overwrote an earlier report.** Symptom: `sol-fix.report.md` already held an earlier run's report. Cause: run names are reused within a run folder. Fix: tools-ki `ki agent` should refuse or suffix an existing run name. I kept the old report as `sol-fix.report.prev-2026-10-14.md`.
14. **sol's clock zone differs from terra's.** Symptom: `date` on sol prints BST, while the thread reports in CEST. Cause: sol's time zone is Europe/London. Fix: chezmoi or Rig macOS settings, if one zone is wanted; otherwise state the zone in the guide.
