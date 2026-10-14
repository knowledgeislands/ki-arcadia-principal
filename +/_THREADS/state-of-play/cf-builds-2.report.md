# cf-builds-2 - Workers Builds re-link, www redirects, build-token audit (Decisions 120, 124, 126)

## Done

### Re-link and builds

GitHub keeps a repository's numeric ID through a rename, and Workers Builds connects by ID. So the five renamed repositories needed only their connection name refreshed (`PUT /builds/repos/connections`). Rig and tower are new repositories with new IDs. A trigger's connection cannot be patched, so for each one I created a new connection, deleted the old trigger and recreated it with identical settings on the new connection. The Cloudflare GitHub App could already see both new repositories, so nothing is needed from Kris on GitHub. Branch `main`, root and token are unchanged everywhere. No build variables changed: only `5g-emerge-ibc2026` has any (`BUN_VERSION`, `NODE_VERSION`, `SKIP_DEPENDENCY_INSTALL`, names only), and they are kept.

| Worker | Before | After | Build (manual, `main`) | Route check |
| --- | --- | --- | --- | --- |
| `midnight-ninja-apex` | `krisb/kit-midnight.ninja`; apex scripts only | `krisb/apps-midnight.ninja` (same connection, renamed) | success, version `93c6a98e` | midnight.ninja and www 200, "midnight.ninja" |
| `midnight-ninja-rig` | `krisb/kit-midnight.ninja`; last build failed | `krisb/apps-rig.midnight.ninja`, new connection and trigger; `self:site:rig:build` / `:deploy`, root `/` | success, version `83de996a` | rig.midnight.ninja 200, "rig — rig.midnight.ninja" |
| `midnight-ninja-tower` | `krisb/kit-midnight.ninja`; last build failed | `krisb/apps-tower.midnight.ninja`, new connection and trigger; `self:site:tower:build` / `:deploy`, root `/` | success, version `5a9b9f51` | tower.midnight.ninja 200, "The Tower — Kitteth" |
| `ki-website` | `knowledgeislands/ki-website` | `knowledgeislands/apps-knowledgeislands.info` | success, version `6b150d36` | knowledgeislands.info 200 |
| `vallearmonia-website` | `vallearmonia/vallearmonia-website` | `vallearmonia/apps-vallearmonia.com` | success, version `20a9c3b5` | vallearmonia.com 200 |
| `mark-markhowarth-com` | `vallearmonia/mark-markhowarth.com` | `vallearmonia/apps-markhowarth.com` | success, version `bc82f721` | workers.dev 200, "Mark Howarth" |
| `5g-emerge-ibc2026` | `5g-emerge/5g-emerge-ibc2026` | `5g-emerge/5g-emerge-demos` | success at `7a52d22`, version `3008dee5` | ibc2026 and demo.5g-emerge.io 200 |
| `vallearmonia-ingress-receiver` | old repo name; both triggers ran the missing `ki:ingress:*` scripts, so every build failed | `vallearmonia/apps-vallearmonia.com`; `self:ingress:build`, production deploy `self:ingress:deploy` (per `docs/guides/ops/ingress.md`); the preview trigger keeps `npx wrangler versions upload` | success, version `1d0aacd6` | ingress.vallearmonia.com 200 |

There were no repository changes, commits or pushes. Wrangler names match their Workers, and apex no longer references rig or tower (checked in the first run).

### www redirects

- Both zones already had a proxied `www` record (AAAA `100::`) and a `www` Workers Custom Domain on the site Worker. That combination is the design both repositories' wrangler configs and guides describe ("www → apex via a Cloudflare redirect rule"), so it does not conflict. Neither zone had a redirect ruleset, and neither has any Workers routes.
- In each zone I created a Single Redirect entrypoint ruleset with one rule, "www to apex (301)": `http.host eq "www.<apex>"` → `wildcard_replace(full_uri, "http*://www.<apex>/*", "https://<apex>/${2}")`, status 301. The query string travels inside `full_uri`.
- `curl -sI` for both apexes:
  - `https://www.<apex>/` gives 301 to `https://<apex>/`.
  - `/about/?a=1&b=2` gives 301 to `https://<apex>/about/?a=1&b=2`.
  - `http://www.<apex>/x` gives 301 to `https://<apex>/x`.
  - Each apex answers 200.

### Build-token map (from Workers Builds triggers)

All three build tokens are user-owned (`owner_type: user`).

| Build token | Cloudflare token ID | Used by (Worker / trigger) |
| --- | --- | --- |
| kw-website build token | `ce109cd9…` | `kw-alejandro` (both triggers: production and non-production) - **yes, it serves kw-alejandro**; `midnight-ninja-apex`, `-rig`, `-tower`; `mark-markhowarth-com`; `5g-emerge-apex`, `-phase2`, `-phase3`; `infoschematics-website` |
| Workers Builds - 2026-05-24 11:16 | `937e2a0d…` | `ki-website`; `5g-emerge-ibc2026`; `vallearmonia-ingress-receiver` (both triggers) |
| vallearmonia-website build token | `064f7f6e…` | `vallearmonia-website` |

## Failed

- **I could not read the token scopes.** `/user/tokens` returns `9109 Unauthorized`. The agentic-access token's "API Tokens Read" covers account-owned tokens, and these three are user-owned, which needs _User → API Tokens: Read_. The map above comes from the Builds API alone. The scopes, and whether anything outside Workers Builds uses these tokens, are unverified.
- **Outside this brief, not touched:** `infoschematics-website` and `kw-alejandro` have failing latest builds (2026-10-12 and 2026-10-08).

## Needs Kris

### Build-token consolidation (proposal only; nothing created, rolled or deleted)

1. **Create one token.** Go to **My Profile → API Tokens → Create Token → "Edit Cloudflare Workers" template**, name it `workers-builds-kit`, then trim it to:
   - _Account (Kit):_ Workers Scripts Edit, Account Settings Read
   - _Zone:_ Workers Routes Edit, limited to the zones the Workers deploy custom domains on (midnight.ninja, knowledgeislands.info, vallearmonia.com, 5g-emerge.io, plus the infoschematics and kw-alejandro zones)
   - _User:_ User Details Read, Memberships Read

   Drop KV, R2, Pages and Tail. No Worker binds KV or D1, and the ingress R2 and Durable Object bindings deploy under Workers Scripts Edit. An account-owned token, under **Manage Account → Account API Tokens**, is the tidier alternative if Workers Builds offers it in the token picker.
2. **Point every trigger at it.** For each of the 13 Workers above, go to **Workers & Pages → _Worker_ → Settings → Build → API token** and select `workers-builds-kit`. Kit has 15 triggers: kw-alejandro and the ingress Worker have two each, and both must change. Alternatively, tell me the token's name and I will set `build_token_uuid` on all 15 triggers through the API and run a build of each.
3. **Verify.** Run one build per Worker and confirm each succeeds.
4. **Delete the old tokens.** Then under **My Profile → API Tokens**, check that each old token's _Last used_ stays unchanged for a day; anything still using it outside Workers Builds would show there. Then these are safe to delete:
   - `kw-website build token`
   - `Workers Builds - 2026-05-24 11:16`
   - `vallearmonia-website build token`

### Other

- **Guide drift in apps-markhowarth.com:** `docs/guides/developer/cloudflare.md` still says Workers Builds is "intentionally unconfigured", but it is connected and building. The change belongs to the Valle Armonia master; I left it.
- **Optional:** to let the next audit read token scopes, add _User → API Tokens: Read_ to the agentic-access token.

## Notes

- **Remote writes made:**
  - five connection renames
  - two new connections, plus two triggers deleted and recreated (rig, tower)
  - two ingress trigger command fixes
  - eight manual builds
  - two redirect rulesets

  The token never touched disk or output: a helper script reads it from 1Password inside each call.
- The rig and tower trigger UUIDs changed: rig is now `93838dcf…` and tower `3bbc8258…`.
- **Brief conflict:** the prompt again appended a generic "no remote call, local only" footer, which contradicts the task body and Decisions 120, 124 and 126. I followed the task body.
