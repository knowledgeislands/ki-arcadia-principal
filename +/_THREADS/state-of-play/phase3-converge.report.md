# Phase 3 — `ki estate converge` report (terra)

## Command synopsis

```text
ki estate converge <manifest> [--apply] [--clone] [--allow-busy <path>]...
ki estate converge --rollback <log> [--apply]
```

- It previews by default. `--apply` writes `~/.local/state/ki/converge/<timestamp>.json`, plus `<timestamp>.registry.toml` and `<timestamp>.claude.json` backups, and records the log after each action.
- `--rollback <log>` previews the reversed actions; add `--apply` to run them. It refuses any step whose recorded state has changed, keeps clones, and writes its own `.rollback.json` log.
- Every run ends with a report-only sweep. It prints the file, the line and the matched pattern, never the line text.
- Manifest entries with empty `path_to` and `register: false` count as having no local placement. They show as `absent`, or as `skip` if a checkout exists. A `register: true` entry still needs `path_to`.

## Tests

- 11 CLI tests in `src/tests/cli/estate/converge.test.ts`, using a fake HOME:
  - preview changes nothing;
  - apply, then re-apply as a no-op, then rollback preview, rollback apply, and rollback of the rollback;
  - skips for a dirty tree, a busy checkout (also accepted with `--allow-busy`), a target collision, a duplicate destination, several checkouts, a registry key collision, an occupied clone target, and an unplaced entry;
  - discovery after a GitHub rename, where the remote already equals `to`, and a remote-only change;
  - clone only with `--clone`, with the clone retained on rollback;
  - a move outside `~/workspaces`;
  - rollback refusals;
  - Claude history it will not merge;
  - the sweep;
  - grammar and manifest errors, log errors, and a missing lsof;
  - stopping and logging when a git step fails.
- Full suite: 65 files and 1115 tests pass, with 100% coverage of statements, branches, functions and lines. tsc, biome, `mandoc -T lint` and the commit hooks are clean.

## Commits (tools-ki `main`, pushed fast-forward to origin)

- `5e858a3` feat(estate): add ki estate converge to reshape local checkouts
- `56f1053` fix(estate): report manifest entries without a local placement

## Install method

`bun run build && install -m 755 dist/ki ~/.local/bin/ki && install -m 644 man/ki.1 ~/.local/share/man/man1/ki.1`, as in `docs/guides/developer/local-development.md`. There was no release, tag, Homebrew or registry publish.

## Dry-run summary

- **Full output:** `phase3-dryrun-terra.txt`.
- **Command:** `ki estate converge "~/workspaces/kit/personal/kit-principal/Admin/Operations/Live Artifacts/Estate Targets.json"`.
- **Not run:** `--apply`. No converge log was written.

```text
summary: 39 converge, 1 no-op, 7 skip, 1 to clone, 10 absent; 1497 symlink rewrite(s), 7 tracked symlink(s), 12 leftover parent(s)
sweep: 333 remaining occurrence(s), report only
```

### Skips and their reasons

- skip knowledgeislands/apps-observatory (Knowledge Islands Observatory): busy: a process is working in ~/workspaces/kit/knowledgeislands/apps-observatory/apps/site
- skip knowledgeislands/ki-principal (Knowledge Islands Principal): busy: a process is working in ~/workspaces/kit/knowledgeislands/ki-arcadia-principal
- skip knowledgeislands/tools-ki (ki): busy: a process is working in ~/workspaces/kit/knowledgeislands/tools-ki
- skip krisb/hnr-principal (HNR Principal): busy: a process is working in ~/workspaces/hnr/kis/kit-hnr
- skip krisb/site-midnight.ninja (midnight.ninja): busy: a process is working in ~/workspaces/kit/personal/kit-midnight.ninja/apps/site-tower/dist
- skip krisb/personal-principal (Personal Principal): busy: a process is working in ~/workspaces/kit/personal/kit-principal
- skip vallearmonia/va-principal (Valle Armonia Principal): busy: a process is working in ~/workspaces/kit/vallearmonia/vallearmonia-principal

### To clone

- to clone sacred-inquiry/si-principal (Sacred Inquiry Principal) -> ~/workspaces/sacred-inquiry/si-principal (use --clone)

### No-op

- no-op krisb/dotfiles (dotfiles (chezmoi))

### Absent (no local checkout, nothing to do)

- humansnotrobots/eslint-plugin-canonical
- humansnotrobots/hnr-automation-tooling
- humansnotrobots/hnr-responsive-html-email-signature
- humansnotrobots/influxdb-experiment
- humansnotrobots/joi-to-json
- humansnotrobots/live-channel-reference-architecture
- humansnotrobots/lucas-claude-notes
- humansnotrobots/slack-standup
- techmedix/childhealthyorkshire
- techmedix/yps

### Converge (39)

- Moves: 39. Remote retargets: 7. Registry updates: 33. Linked worktrees: 0.
- Collisions (target exists, or another entry shares it): 0 among the skips.

### Claude folders and keys

- Folder renames: 16. `~/.claude.json` key renames: 1.
- Most active Claude projects are in the busy skips above, so their keys stay unchanged.

### Symlinks

- Untracked rewrites: 1497. Nearly all are `.agents/skills` links into ki-agentic-harness.
- Tracked symlinks (report only):
  - ~/workspaces/hnr/kis/kit-hnr/Resources: ~/workspaces/hnr/kis/hnr-shared/Resources -> ~/workspaces/humans-not-robots/hnr-shared/Resources
  - ~/workspaces/hnr/kis/kit-hnr/Pillars/Research: ~/workspaces/hnr/kis/hnr-shared/Pillars/Research -> ~/workspaces/humans-not-robots/hnr-shared/Pillars/Research
  - ~/workspaces/hnr/kis/kit-hnr/Pillars/Success: ~/workspaces/hnr/kis/hnr-shared/Pillars/Success -> ~/workspaces/humans-not-robots/hnr-shared/Pillars/Success
  - ~/workspaces/hnr/kis/kit-hnr/Pillars/Development: ~/workspaces/hnr/kis/hnr-shared/Pillars/Development -> ~/workspaces/humans-not-robots/hnr-shared/Pillars/Development
  - ~/workspaces/hnr/kis/kit-hnr/Pillars/Product: ~/workspaces/hnr/kis/hnr-shared/Pillars/Product -> ~/workspaces/humans-not-robots/hnr-shared/Pillars/Product
  - ~/workspaces/hnr/kis/kit-hnr/Pillars/Operations: ~/workspaces/hnr/kis/hnr-shared/Pillars/Operations -> ~/workspaces/humans-not-robots/hnr-shared/Pillars/Operations
  - ~/workspaces/hnr/kis/kit-hnr/Pillars/Engineering: ~/workspaces/hnr/kis/hnr-shared/Pillars/Engineering -> ~/workspaces/humans-not-robots/hnr-shared/Pillars/Engineering

### Former parents

- leftover ~/workspaces/hnr/5g-emerge: .DS_Store, .claude, .mgit.toml, 5g-emerge-testbed-website
- leftover ~/workspaces/hnr/kis: .DS_Store, .claude, .mgit.toml, kit-hnr
- leftover ~/workspaces/hnr/product: .mgit.toml
- leftover ~/workspaces/kit/equalremedy: .DS_Store, .mgit.toml
- leftover ~/workspaces/kit/infoschematics: .mgit.toml
- leftover ~/workspaces/kit/knowledgeislands: .mgit.toml, apps-observatory, ki-arcadia-principal, tools-ki
- leftover ~/workspaces/kit/legal: .DS_Store, .mgit.toml
- leftover ~/workspaces/kit/personal: .DS_Store, .mgit.toml, kit-midnight.ninja, kit-principal
- leftover ~/workspaces/kit/techmedix: .mgit.toml
- leftover ~/workspaces/kit/vallearmonia: .mgit.toml, vallearmonia-principal
- leftover ~/workspaces/kit: .DS_Store, .mgit.toml, equalremedy, infoschematics, knowledgeislands, legal, personal, techmedix, vallearmonia, worktrees
- leftover ~/workspaces/knowledge-wayfinder: .DS_Store, .mgit.toml

### Sweep hits by file

- ~/.codex/config.toml — 47
- ~/.local/share/chezmoi/.chezmoidata/trusted-folders.yaml — 46
- ~/.claude/settings.json — 45
- ~/.local/share/chezmoi/dot_config/ki/config.toml — 22
- ~/.config/ki/config.toml — 22
- ~/.mcporter/mcporter.json — 16
- ~/.local/share/chezmoi/.chezmoidata/mcp-servers.yaml — 16
- ~/.local/share/chezmoi/workspaces/vscode/kis-er-research.code-workspace — 4
- ~/.local/share/chezmoi/workspaces/kit/vallearmonia/dot_mgit.toml — 3
- ~/.local/share/chezmoi/workspaces/kit/personal/dot_mgit.toml — 3
- ~/.claude.json — 3
- ~/.local/share/chezmoi/workspaces/vscode/kis-vallearmonia-website.code-workspace — 2
- ~/.local/share/chezmoi/workspaces/vscode/kis-vallearmonia-principal.code-workspace — 2
- ~/.local/share/chezmoi/workspaces/vscode/kis-mark-markhowarth.com.code-workspace — 2
- ~/.local/share/chezmoi/workspaces/vscode/kis-kit-techmedix.code-workspace — 2
- ~/.local/share/chezmoi/workspaces/vscode/kis-dafacts-website.code-workspace — 2
- ~/.local/share/chezmoi/workspaces/kit/equalremedy/dot_mgit.toml — 2
- ~/.local/share/chezmoi/dot_config/rig/conf.d/private_50-services.toml — 2
- ~/Library/LaunchAgents/uk.me.kris.rig.testbed-5g-emerge-sources-refresh.plist — 1
- ~/Library/LaunchAgents/uk.me.kris.rig.acquire-whatsapp-spool-refresh.plist — 1
- ~/.local/share/ki/harnesses/knowledgeislands/ki-agentic-harness — 1
- ~/.local/share/ki/harnesses/humansnotrobots/hnr-agentic-harness — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-tools-techne.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-tools-rig.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-tools-mgit.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-tools-git-almanac.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-mcp-m365.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-mcp-ki-kb-notion-mirror.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-mcp-ki-kb-fs.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-mcp-housekeeping-claude.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-mcp-housekeeping-chatgpt.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-mcp-gsuite.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-mcp-git-audit.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-mcp-acquire-whatsapp.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-kit-legal.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-kit-kris.me.uk.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-kit-hnr.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-ki-website.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-ki-techne-harness.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-ki-specifications.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-ki-arcadia-principal.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-ki-agentic-harness.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-infoschematics.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-homebrew-tap.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-hnr-shared.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-hnr-agentic-harness.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-er-agentic-harness.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-5g-emerge-testbed.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-5g-emerge-phase3.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-5g-emerge-phase2.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-5g-emerge-demos.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/kis-5g-emerge-apex.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/hnr-frontend.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/vscode/hnr-backend.code-workspace — 1
- ~/.local/share/chezmoi/workspaces/kit/techmedix/dot_mgit.toml — 1
- ~/.local/share/chezmoi/workspaces/kit/legal/dot_mgit.toml — 1
- ~/.local/share/chezmoi/workspaces/kit/knowledgeislands/dot_mgit.toml — 1
- ~/.local/share/chezmoi/workspaces/hnr/kis/dot_mgit.toml — 1
- ~/.local/share/chezmoi/tests/paperclip-reconcile.test.mjs — 1
- ~/.local/share/chezmoi/dot_config/paperclip/desired-state.json — 1
- ~/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-086-finish-software-alignment.md — 1
- ~/.local/share/chezmoi/docs/guides/tools/paperclip.md — 1
- ~/.local/share/chezmoi/bin/scheduled/executable_rig-testbed-5g-emerge-sources-refresh — 1
- ~/.local/share/chezmoi/bin/scheduled/executable_rig-acquire-whatsapp-spool-refresh — 1
- ~/.local/share/chezmoi/.ki.toml — 1
- ~/.local/share/chezmoi/.claude/skills/ki-work-roadmap — 1
- ~/.local/share/chezmoi/.claude/skills/ki-work-housekeeping — 1
- ~/.local/share/chezmoi/.claude/skills/ki-work — 1
- ~/.local/share/chezmoi/.claude/skills/ki-tokenomics-claude — 1
- ~/.local/share/chezmoi/.claude/skills/ki-tokenomics — 1
- ~/.local/share/chezmoi/.claude/skills/ki-specs — 1
- ~/.local/share/chezmoi/.claude/skills/ki-repo-project — 1
- ~/.local/share/chezmoi/.claude/skills/ki-repo-dotfiles-chezmoi — 1
- ~/.local/share/chezmoi/.claude/skills/ki-repo — 1
- ~/.local/share/chezmoi/.claude/skills/ki-housekeeping-claude — 1
- ~/.local/share/chezmoi/.claude/skills/ki-guides — 1
- ~/.local/share/chezmoi/.claude/skills/ki-git — 1
- ~/.local/share/chezmoi/.claude/skills/ki-decision-records — 1
- ~/.local/share/chezmoi/.claude/skills/ki-binding-claude — 1
- ~/.local/share/chezmoi/.claude/skills/ki-binding-chezmoi — 1
- ~/.local/share/chezmoi/.claude/skills/ki-binding — 1
- ~/.local/share/chezmoi/.claude/skills/ki-authoring — 1
- ~/.local/share/chezmoi/.claude/skills/ki-agent-coordination-paperclip — 1
- ~/.local/share/chezmoi/.agents/skills/ki-work-roadmap — 1
- ~/.local/share/chezmoi/.agents/skills/ki-work-housekeeping — 1
- ~/.local/share/chezmoi/.agents/skills/ki-work — 1
- ~/.local/share/chezmoi/.agents/skills/ki-tokenomics-chatgpt — 1
- ~/.local/share/chezmoi/.agents/skills/ki-tokenomics — 1
- ~/.local/share/chezmoi/.agents/skills/ki-specs — 1
- ~/.local/share/chezmoi/.agents/skills/ki-repo-project — 1
- ~/.local/share/chezmoi/.agents/skills/ki-repo-dotfiles-chezmoi — 1
- ~/.local/share/chezmoi/.agents/skills/ki-repo — 1
- ~/.local/share/chezmoi/.agents/skills/ki-housekeeping-chatgpt — 1
- ~/.local/share/chezmoi/.agents/skills/ki-guides — 1
- ~/.local/share/chezmoi/.agents/skills/ki-git — 1
- ~/.local/share/chezmoi/.agents/skills/ki-decision-records — 1
- ~/.local/share/chezmoi/.agents/skills/ki-binding-chezmoi — 1
- ~/.local/share/chezmoi/.agents/skills/ki-binding-chatgpt — 1
- ~/.local/share/chezmoi/.agents/skills/ki-binding — 1
- ~/.local/share/chezmoi/.agents/skills/ki-authoring — 1
- ~/.local/share/chezmoi/.agents/skills/ki-agent-coordination-paperclip — 1
- ~/.claude/skills/ki-recap — 1
- ~/.claude/skills/ki-plan — 1
- ~/.claude/skills/ki-next — 1
- ~/.claude/skills/ki-implement — 1
- ~/.claude/skills/ki-design-loop — 1
- ~/.claude/skills/ki-delegation — 1
- ~/.claude/skills/ki-bootstrap — 1
- ~/.claude/skills/ki-batch — 1
- ~/.claude/skills/ki-accept — 1

### Differences from the manifest

- These entries are not in the ki registry, so no registry update is planned for them: `humansnotrobots/hnr-backend`, `humansnotrobots/hnr-benchmarks`, `humansnotrobots/hnr-frontend`, `humansnotrobots/hnr-shared`, `knowledge-wayfinder/kw-website`, `knowledgeislands/paperclip`.
- No checkout was found away from the manifest `path_from`. There are no target collisions.
- The manifest has 10 entries with empty `path_from` and `path_to`. The first build rejected them, so `56f1053` reports them as `absent` instead.
- The planned remote targets come from the manifest `to` field, which can differ from the earlier list of renames: for example `equalremedy/er-site-dafacts`, `vallearmonia/va-site-markhowarth.com` and `vallearmonia/va-site-vallearmonia.com`.

## Done / Failed / Needs the owner

**Done**

- `ki estate converge` is built, tested to 100% coverage, pushed (`5e858a3`, `56f1053`) and installed locally.
- The terra dry run is saved to `phase3-dryrun-terra.txt`. Nothing was applied.

**Failed**

- None.

**Needs the owner**

- Before `--apply`, close the sessions in the 7 busy checkouts. They include this run's Capital (personal-principal), ki-principal and tools-ki. You can also pass `--allow-busy <path>` to accept them knowingly.
- Applying while Claude Code runs is risky: Claude can overwrite the `~/.claude.json` key renames, and running sessions lose their cwd. Run it from a plain terminal with Claude Code closed.
- The manifest lives inside kit-principal, which moves to personal-principal. If you apply in more than one pass, pass the manifest's new path afterwards.
- The sweep found 333 remaining references, all report only. The main ones are `~/.codex/config.toml`, the chezmoi `trusted-folders.yaml`, `mcp-servers.yaml`, the ki and rig config, VS Code workspaces and `dot_mgit.toml`, `~/.claude/settings.json`, mcporter, and 2 LaunchAgents. These need a follow-up edit in chezmoi, plus `chezmoi apply`.
- 7 tracked symlinks in kit-hnr into hnr-shared are report only. They need a commit in kit-hnr after the move.
- 12 former parents keep leftovers such as `.mgit.toml`, `.DS_Store` and `.claude`, or busy checkouts, so they are not removed.
- `sacred-inquiry/si-principal` is waiting to be cloned. It is only cloned with `--clone`.
- 6 repositories that will move have no ki registry entry, as listed above. Decide whether to register them after the move.
