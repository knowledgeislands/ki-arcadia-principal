# Step 9a - apps-<domain> renames - report

## Done

- **GitHub renames, all nine** (Decisions 97 and 106): `equalremedy/apps-dafacts.org`, `knowledgeislands/apps-observatory.local`, `knowledgeislands/apps-knowledgeislands.info`, `krisb/apps-kris.me.uk`, `krisb/apps-midnight.ninja`, `vallearmonia/apps-markhowarth.com`, `vallearmonia/apps-vallearmonia.com`, and the unadopted `techmedix/apps-childhealthyorkshire.co.uk` and `techmedix/apps-yorkphotosoc.org` (GitHub only).
- **Local moves**: `ki estate converge --apply` moved the seven checkouts and updated remotes, worktrees, the ki registry and Claude Code project folders. The shared targets file had stale `from` names and paths, so I ran it on a corrected copy at `s9-renames/targets.json`. The shared file is unchanged. Converge log: `~/.local/state/ki/converge/2026-10-12T05-29-44-263Z.json`.
- **App configs**: ran `src/phase6-rewrite-unmanaged.py --apply` with backups first (`backups/phase6-20261012-063013`). It updated `~/.claude/settings.json` trusted folders, `~/.codex/config.toml`, `~/.mcporter/mcporter.json` and the Claude Desktop config (folder permissions and MCP paths). A second run reported all files clean.
- **Observatory service**: the Rig launch agent ran from the old folder. I stopped it, changed the path in the rendered plist (backup in `backups/s9-renames-*`) and restarted it. It now runs from `apps-observatory.local`.
- **GitHub Desktop**: added the seven new paths through its URL handler, 3 seconds apart.
- **chezmoi**: pushed branch `step9-renames` (`2b0316c`), based on `origin/main` and not applied. It changes trusted folders, MCP knowledge-base paths, ki repository paths, the Rig Observatory service path, the mGit members, and the renamed VS Code workspaces, and adds `.chezmoiremove` entries for the old ones.
- **Repository identity** (`.ki.toml`, `package.json` and Cloudflare guides), all pushed fast-forward:
  - apps-dafacts.org `abed8ad`
  - apps-observatory.local `28069f6`
  - apps-knowledgeislands.info `e266d11` (also fixes the release-bot token scope in `update-tool-release.yml`, which is set by repository name)
  - apps-kris.me.uk `df71bb1`
  - apps-midnight.ninja `af625ad`
  - apps-markhowarth.com `fb28cb4`
  - apps-vallearmonia.com `b96ece4`
  - homebrew-tap `d6f3b0c` (release-consumer list now names `apps-knowledgeislands.info`)
- **VA-MARK-001** (Decision 110; the brief cited 111, corrected by Decision 112): added a dated note to [VA-MARK-001](/Users/krisbrown/workspaces/valle-armonia/apps-markhowarth.com/docs/roadmap/VA-MARK-001-agree-site-identity.md): keep the three themes for now, and a fourth combining them is coming soon. Commit `f40665d`, pushed.
- **Checks**:
  - `ki territory audit --estate`: healthy, 47 repositories, 0 findings.
  - `ki registry list`: 0 stale.
  - `mgit status`: techmedix and legal are clean. equal-remedy, knowledge-islands, personal and valle-armonia still list the old member paths, because the rendered `.mgit.toml` files only change when `step9-renames` is applied (checked against the branch). humans-not-robots shows two checkouts behind origin, which is unrelated.

## Deployment check (no hosting settings changed)

- **GitHub Pages**: none on any of the nine. **Cloudflare Pages**: no projects. GitHub Actions run under the new names.
- **Cloudflare Workers Builds connected to Git, which need re-link checks**:
  - `ki-website` Worker (knowledgeislands.info)
  - `vallearmonia-website` Worker (vallearmonia.com)
  - `midnight-ninja-apex`, `-rig` and `-tower` Workers

  Each was connected to the old repository name. markhowarth.com is deployed by hand, so it is not affected.
- **Valle Armonia ingress Worker**: its deployed `GITHUB_REPO` var still says `vallearmonia/va-site-vallearmonia.com`. GitHub redirects keep it working for now. I left `ingress/wrangler.jsonc` alone so as not to trigger a production change.
- **Techmedix webhooks** go to AWS API Gateway endpoints, one on each repository. Check whether the AWS side refers to the old repository names.
- **Badges**: none found.

## Needs Kris

- Review and merge chezmoi `step9-renames`, then `chezmoi apply`. That clears the mGit residue and makes the Observatory plist path durable.
- In Cloudflare, under Workers & Pages → Settings → Build, check or reconnect the Git repository for `ki-website` (→ `knowledgeislands/apps-knowledgeislands.info`), `vallearmonia-website` (→ `vallearmonia/apps-vallearmonia.com`) and the three `midnight-ninja-*` Workers (→ `krisb/apps-midnight.ninja`).
- Update the ingress Worker's `GITHUB_REPO` to `vallearmonia/apps-vallearmonia.com` and redeploy, when convenient.
- Check the two Techmedix AWS webhook targets.
- In GitHub Desktop, remove the seven old entries, which now show as missing. Removal can't be scripted.
- Not touched: references in history, authorisations, test fixtures and the `ki-website` project slug, and record codes (KI-WEB and others), which belong to s9-rekey.
