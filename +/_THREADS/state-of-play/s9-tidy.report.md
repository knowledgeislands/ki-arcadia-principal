# Step 9 tidy - report

Authority: Decision 124. Every commit below was pushed to `main` as a fast-forward. Each repository ended level with origin, and every rebase was clean.

## Done

- **Known Lands domains.** Each of the six Capitals' Known Lands now has a `## Domains` table with columns Domain, Purpose, Hosting and Serving repository. The table sits before Estate territories.
  - personal-principal `2914873`
  - ki-principal `794f42d`
  - hnr-principal `bdfe948`
  - va-principal `8dffa23`, with a later wording fix in `99f26c4`
  - tmx-principal `f27d6c9`
  - er-principal `e09d455`
  - Specific entries:
    - yorkphotosoc.org: Squarespace, probably carries mail, no change planned.
    - childhealthyorkshire.co.uk: not registered; its repository is archived.
    - knowledgeislands.info and vallearmonia.com: the www-to-apex redirect is approved and follows once a Cloudflare token exists.
  - legal-principal and si-principal are unchanged.
- **Techmedix members.**
  - `apps-yorkphotosoc.org` and `apps-childhealthyorkshire.co.uk` are now in tmx-principal's `territory_members` and in its Known Lands Internal territory table (`f27d6c9`).
  - Neither repository had a checkout or a `.ki.toml`. I cloned both under `~/workspaces/techmedix/` and added a minimal `.ki.toml`: website project shape, Capital tmx-principal, codes `TMX-YPS` and `TMX-CHY`. Commits: apps-yorkphotosoc.org `355f968`, apps-childhealthyorkshire.co.uk `5fb1ec4`. I then registered both in the KI registry.
  - Checks:
    - `ki territory show -t techmedix` lists 4 repositories.
    - `ki territory audit -t techmedix`: healthy, 0 findings.
    - `ki territory audit --estate`: healthy, 51 repositories, 0 findings.
- **childhealthyorkshire archived.** Before archiving I checked: no open PRs or issues, only the `main` branch, no roadmap folder, a clean checkout, and a last code commit on 2023-05-31. I then ran `gh repo archive techmedix/apps-childhealthyorkshire.co.uk`; `isArchived` is true. Known Lands records it as archived. The registry has no archived field, so the entry stays as an ordinary registration.
- **Stale names sweep.**
  - ki-principal `1b5308e`:
    - GitHub Apps convention.
    - Release Cascade process note, Archify source and SVG. The SVG node label was renamed and its font reduced so the longer name fits.
    - Streams Projects (8 notes). Changes: `ki-website` to `apps-knowledgeislands.info`, `apps-observatory` to `apps-observatory.local`, kit-hnr to hnr-principal, kit-legal to legal-principal, kit-principal to personal-principal and kit-midnight.ninja to apps-midnight.ninja.
  - va-principal `99f26c4`:
    - Draft change note: `vallearmonia-website` to `apps-vallearmonia.com`.
    - Known Lands now says the Cloudflare Worker keeps the name `vallearmonia-website`. That is still the Worker's real name.
  - personal-principal `066bb8e`:
    - Project Portfolio: four repository names.
    - Tower game notes (Pillars and Resources): now point to `apps-tower.midnight.ninja`, with paths `apps/site-tower/` and the `reference/notes` link.
    - KB Specifics Integrations: the alias roster now matches the server's live list.
- **Live artifacts in repositories.**
  - All KB calls in the HNR Streams Tracker, Email Pulse and Council, and in the Legal Command Centre, Hearing Dashboard and Activity Status, already used the `hnr-principal` and `legal-principal` aliases.
  - What remained was labels and metadata, now fixed: `kbRepository: "kit-hnr"`, footers, descriptions and error text.
  - Commits: hnr-principal `435b5dc`, legal-principal `47c37359`.
  - Nothing was deployed to Cowork.

## Failed

- None.

## Needs the owner

- **Server name kept.** `kit-mcp-ki-kb-fs` is still the KB filesystem server's live ID in mcporter, so references to it in live notes and artifact code were left alone. Renaming the server is a separate decision.
- **Tower layout table.** The table in [The Tower - Idle Tower Defense](~/workspaces/personal/personal-principal/Pillars/Games/The%20Tower%20-%20Idle%20Tower%20Defense.md) still describes the old `index.njk`, `notes/` and `runs/` layout, and the dashboard URL `midnight.ninja/experiments/tower/` may be out of date. Rewriting it is beyond a name sweep.
- **Left as historical, but some still steer live work:**
  - VA-PRINCIPAL-GOV-003 is `in-progress` and names `va-site-markhowarth.com` and `va-site-vallearmonia.com`.
  - VA-PRINCIPAL-GOV-006 and VA-PRINCIPAL-GOV-002 name `vallearmonia-website`.
  - KI-PRINCIPAL-MOD-008 is a draft.
  - personal-principal records KB-PRINCIPAL-036 and KB-PRINCIPAL-037 name kit-*.
  - The Estate Targets JSON and the Estate Map still carry the old names; the final map run owns them.
  - GDR-KI-PRINCIPAL-006 and the checkpoints are unchanged.
- **Not swept.** Several personal-principal live notes (Regular Activities, Email Approach, KB Identity, Physical Locations, the Claude Live Artifacts notes and the cowork-audit files) still use `kit-*` names. Most are Cowork scheduled-task IDs or the archived `kit-principal-archived` checkout, so they may be real IDs. They were not in this sweep's scope.
- **Security alert seen on push.** GitHub reported 22 Dependabot alerts on `krisb/legal-principal` (1 critical). Not acted on.
