# cf-builds - Workers Builds re-link (Decision 120)

## Done

- **Valle Armonia ingress:** `GITHUB_REPO` now `vallearmonia/apps-vallearmonia.com` in `ingress/wrangler.jsonc` (and the example in `docs/guides/ops/ingress.md`). Commit `228a24f` in apps-vallearmonia.com, pushed fast-forward. Deployed with the documented `bun run self:ingress:deploy` (version `3ffef615`); `https://ingress.vallearmonia.com/` answers 200.
- **Repo-side checks, no fixes needed:** every repo's wrangler `name` matches its Worker. Apex has no remaining rig or tower references. Clean-export builds of apex, rig and tower pass (`bun install --frozen-lockfile` plus `self:site:<name>:build`, and `wrangler deploy --dry-run`). So the rig and tower failures come only from the stale repository connection.
- **5g-emerge-ibc2026:** its repository was renamed `5g-emerge/5g-emerge-ibc2026` → `5g-emerge/5g-emerge-demos` (GitHub redirects the old name). Re-link it too (see below).
- **Live routes, all 200 and each serving its own site:** midnight.ninja and www ("midnight.ninja"), rig.midnight.ninja ("rig — rig.midnight.ninja"), tower.midnight.ninja ("The Tower — Kitteth"), knowledgeislands.info and www, vallearmonia.com and www, mark-markhowarth-com.kris-08c.workers.dev, demo.5g-emerge.io and ibc2026.5g-emerge.io. These are still the last deployments; no new build has run yet.

## Failed

- **Workers Builds API refused (`10000 Authentication error`).** The `wrangler` OAuth login has no Workers Builds scope, and the secret store has no Cloudflare API token (1Password holds only the Cloudflare dashboard login). Under step 6 I read nothing and changed nothing in Workers Builds, so I could not record the "before" settings or trigger builds.

## Needs Kris

Re-link each Worker in the dashboard. For each one: **Workers & Pages → _Worker_ → Settings → Build → Git repository → Manage → Disconnect**, then **Connect** and pick the repository. Before you disconnect, note any **Build variables** that are set and add them back afterwards. Then set these values, press **Save**, and use **Deployments → Retry build** (or push) to run a build:

| Worker | Repository | Branch | Root dir | Build command | Deploy command |
| --- | --- | --- | --- | --- | --- |
| `midnight-ninja-apex` | `krisb/apps-midnight.ninja` | `main` | `/` | `bun run self:site:apex:build` | `bun run self:site:apex:deploy` |
| `midnight-ninja-rig` | `krisb/apps-rig.midnight.ninja` | `main` | `/` | `bun run self:site:rig:build` | `bun run self:site:rig:deploy` |
| `midnight-ninja-tower` | `krisb/apps-tower.midnight.ninja` | `main` | `/` | `bun run self:site:tower:build` | `bun run self:site:tower:deploy` |
| `ki-website` | `knowledgeislands/apps-knowledgeislands.info` | `main` | `/` | `bun run ki:site:build` | `bun run ki:site:deploy` |
| `vallearmonia-website` | `vallearmonia/apps-vallearmonia.com` | `main` | empty | `bun run ki:site:build` | `bun run ki:site:deploy` |
| `mark-markhowarth-com` | `vallearmonia/apps-markhowarth.com` | `main` | `/` | `bun run ki:site:build` | `bun run ki:site:deploy` |
| `5g-emerge-ibc2026` | `5g-emerge/5g-emerge-demos` | `main` | `/` | `bun run self:cf:build` | `bun run ki:site:deploy` |

- **Variables for 5g-emerge-ibc2026:** `NODE_VERSION=24`, `BUN_VERSION=1.4.2`, `SKIP_DEPENDENCY_INSTALL=1`. No other repo documents any required build variables.
- **GitHub access for rig and tower:** if `apps-rig.midnight.ninja` or `apps-tower.midnight.ninja` is missing from Cloudflare's repo picker, go to **GitHub → Settings → Applications → Installed GitHub Apps → Cloudflare Workers and Pages → Configure**. Under _Repository access_, add both repositories (or choose _All repositories_), then **Save**. I could not check the personal-account installation. The `vallearmonia`, `knowledgeislands` and `5g-emerge` org installations already cover all repositories.
- **Ingress Worker:** if `vallearmonia-ingress-receiver` has its own Build connection (`docs/guides/ops/ingress.md`, "Auto-deploy on push"), re-link it to `vallearmonia/apps-vallearmonia.com` the same way and keep its existing build and deploy commands.
- **Guide drift in apps-markhowarth.com:** `docs/guides/developer/cloudflare.md` says Workers Builds is "intentionally unconfigured", but the dashboard shows it connected. Once the re-link is settled, update that guide in the same change.
- **Observation, not changed:** `www.knowledgeislands.info` and `www.vallearmonia.com` answer 200 rather than the 301 to the apex that their guides describe.
- **Alternative to the clicks:** create an API token with _Workers Builds Configuration: Edit_ (plus _Workers Scripts: Read_), store it in 1Password, and I can re-run the re-link and build checks through the API.
- **Brief conflict, flagged:** the prompt appended a generic "no remote call, never push" footer under a garbled heading, and that contradicted the task body and Decision 120. I followed the task body. The only remote writes were the ingress push and deploy above.
