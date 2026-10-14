# Domains by territory - report

**Done**

- Estate Map published with a **Domains** tab and `domains` per territory in `Estate Targets.json`: personal-principal `2f455dc` on `main`, pushed as a fast-forward and level with origin. The rebase was clean. Only `Admin/Operations/Live Artifacts/Estate Map.html` and `Estate Targets.json` were committed.
- The read-only inventory used the wrangler login. It found 10 zones, 13 Workers and their custom domains, and no Pages projects. No Cloudflare or registrar setting was changed.
- Results: 12 site, 3 mail only, 2 external host, 2 not registered, 1 local only, 1 parked.
  - **Personal**
    - kris.me.uk and krisbrown.co.uk: mail only (Cloudflare Email Routing). apps-kris.me.uk is not deployed.
    - midnight.ninja, rig. and tower.: Workers.
  - **Knowledge Islands**
    - knowledgeislands.info: `ki-website`.
    - knowledgewayfinder.info: `kw-alejandro` from `knowledge-wayfinder/kw-website`.
    - observatory.local: a local name only.
  - **Humans Not Robots**
    - 5g-emerge.io, plus the ibc2026/demo, phase2 and phase3 subdomains: four Workers.
    - infoschematics.info: Worker.
  - **Valle Armonia**
    - vallearmonia.com and ingress.vallearmonia.com: Workers.
    - markhowarth.com: outside Cloudflare (GoDaddy DNS and web, Microsoft 365 mail). `mark-markhowarth-com` runs only on workers.dev.
  - **Techmedix**
    - techmedix.co.uk: mail only.
    - truenorthvisual.co.uk: parked (no records).
    - yorkphotosoc.org: Squarespace, with DNS at Spaceship.
    - childhealthyorkshire.co.uk: not registered.
  - **Equal Remedy**
    - dafacts.org: not registered.
  - **Legal and Sacred Inquiry**: no domains.
- Generator changes: `src/estate-map-gen.py` now reads the new source file `src/estate-map-domains.json` and writes it into the manifest. The page was checked in headless Chrome: the tab, all eight territory sections and the jump list render. Backups are at `/tmp/*.bak-domains`.

**Failed**

- The wrangler OAuth login has no DNS-read or Workers Builds-read scope, and no Cloudflare API token is configured in the secret store.
  - DNS records therefore come from public resolution. Proxied web records show only as Cloudflare IPs.
  - Git connections come from repository guides and the s9-renames and s9-midnight reports. The connections for `kw-alejandro`, `5g-emerge-ibc2026` and `infoschematics-website` are unknown. Their repositories were not renamed, so no re-link is needed either way.

**Needs the owner**

- Workers Builds re-links (Workers & Pages → Worker → Settings → Build):
  - `midnight-ninja-rig` → `krisb/apps-rig.midnight.ninja` (required; builds fail until re-pointed).
  - `midnight-ninja-tower` → `krisb/apps-tower.midnight.ninja` (required).
  - `midnight-ninja-apex` → `krisb/apps-midnight.ninja` (check: was `krisb/kit-midnight.ninja`).
  - `ki-website` → `knowledgeislands/apps-knowledgeislands.info` (check: was `knowledgeislands/ki-website`).
  - `vallearmonia-website` → `vallearmonia/apps-vallearmonia.com` (check: was `vallearmonia/vallearmonia-website`).
  - Not a Builds link: `vallearmonia-ingress-receiver` still has `GITHUB_REPO` set to the old repository name.
- Questions:
  - Is yorkphotosoc.org a Techmedix domain, and who holds its Spaceship registrar account?
  - childhealthyorkshire.co.uk and dafacts.org are not registered: register them, or keep the repository names as they are?
  - Should markhowarth.com move to Cloudflare so the `mark-markhowarth-com` Worker can serve it?
- Proposed Known Lands domain entries (not written). Each Capital's Known Lands would gain a "Domains" table:
  - **personal-principal**: kris.me.uk (mail; site in `krisb/apps-kris.me.uk`, not deployed), krisbrown.co.uk (mail), midnight.ninja, rig.midnight.ninja, tower.midnight.ninja (Workers from `krisb/apps-midnight.ninja`, `apps-rig.midnight.ninja`, `apps-tower.midnight.ninja`).
  - **ki-principal**: knowledgeislands.info (`ki-website` from `knowledgeislands/apps-knowledgeislands.info`), knowledgewayfinder.info (`kw-alejandro` from `knowledge-wayfinder/kw-website`), observatory.local (local only).
  - **hnr-principal**: 5g-emerge.io and its ibc2026, demo, phase2 and phase3 subdomains (four `5g-emerge-*` Workers from the 5g-emerge repositories), infoschematics.info (`infoschematics-website` from `infoschematics/infoschematics`).
  - **va-principal**: vallearmonia.com and ingress.vallearmonia.com (from `vallearmonia/apps-vallearmonia.com`), markhowarth.com (GoDaddy-hosted; Worker on workers.dev from `vallearmonia/apps-markhowarth.com`).
  - **tmx-principal**: techmedix.co.uk (mail), truenorthvisual.co.uk (parked), yorkphotosoc.org (Squarespace; `techmedix/apps-yorkphotosoc.org`; question open), childhealthyorkshire.co.uk (not registered; question open).
  - **er-principal**: dafacts.org (not registered; `equalremedy/apps-dafacts.org`).
  - **legal-principal, si-principal**: none.
