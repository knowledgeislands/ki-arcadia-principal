# cf-tokens - every Workers Builds trigger on workers-builds-kit, old build tokens retired (Decision 133)

## Done

- **New token.** `workers-builds-kit` verifies as active. Its Cloudflare token ID is `5fc4923a…`. It is registered in Workers Builds as build token `31113534-5e9b-4b25-a826-bf366b18018f` (user-owned).
- **All 15 triggers on 13 Workers switched** to that build token. I re-read the triggers afterwards: all 15 show it and none still reference an old token.
- **All 13 Workers build green on `main`** with the new token. I checked every route.

| Worker | Trigger(s) switched | Build on `main` | Route |
| --- | --- | --- | --- |
| `5g-emerge-apex` | 1 | success | 5g-emerge.io 200 |
| `5g-emerge-ibc2026` | 1 | success | ibc2026. and demo.5g-emerge.io 200 |
| `5g-emerge-phase2` | 1 | success | phase2.5g-emerge.io 200 |
| `5g-emerge-phase3` | 1 | success | phase3.5g-emerge.io 302 to its Cloudflare Access login (expected) |
| `infoschematics-website` | 1 | **fixed**: success at `f09ea728` | infoschematics.info 200, www 301 |
| `ki-website` | 1 | success | knowledgeislands.info 200, www 301 |
| `kw-alejandro` | 2 (production and non-production) | **fixed**: success at `6bb628b` | knowledgewayfinder.info 200 |
| `mark-markhowarth-com` | 1 | success | workers.dev 200 |
| `midnight-ninja-apex` | 1 | success | midnight.ninja and www 200 |
| `midnight-ninja-rig` | 1 | success | rig.midnight.ninja 200 |
| `midnight-ninja-tower` | 1 | success | tower.midnight.ninja 200 |
| `vallearmonia-ingress-receiver` | 2 (production and non-production) | success | ingress.vallearmonia.com 200 |
| `vallearmonia-website` | 1 | success | vallearmonia.com 200, www 301 |

### The two broken builds

- **infoschematics-website** (`infoschematics/infoschematics`):
  - **Cause:** on a fresh clone, Bun does not link the `infoschematics` CLI binary, because its `dist/` does not exist yet at install time. So every example's `check` step exited with 127.
  - **Fix:** commit `f09ea728`, `fix(build): link the CLI before the Cloudflare build checks examples`. `self:cf:build` now builds the packages, reinstalls, then runs `build`. `docs/guides/developer/cloudflare.md` explains the reinstall. I tested it in a clean clone, and the push build succeeded.
  - **Builds config:** unchanged.
- **kw-alejandro** (`knowledge-wayfinder/kw-website`):
  - **Cause, part 1:** the triggers called the old `ki:site:*` scripts, but the repository renamed them to `site:*`.
  - **Fix, part 1 (Builds config):**
    - build command: `bun run site:build`
    - production deploy: `cd site && bunx wrangler deploy`
    - preview deploy: `cd site && bunx wrangler versions upload`

    The wrangler config lives in `site/`.
  - **Cause, part 2:** the Builds image has no `rsync`.
  - **Fix, part 2:** commit `6bb628b`, `fix(build): copy learnings without rsync`, which uses `mkdir` and `cp -R`. I tested it in a clean clone, and the push build succeeded.
- Both commits passed their hooks and were pushed fast-forward to `main`.

### Tokens removed

- **From Workers Builds** (account `08c2b231…`), all three build-token registrations are deleted:
  - `kw-website build token` (`f8a0746f…`, Cloudflare token `ce109cd9…`)
  - `Workers Builds - 2026-05-24 11:16` (`6c72a5a6…`, Cloudflare token `937e2a0d…`)
  - `vallearmonia-website build token` (`66ce6af6…`, Cloudflare token `064f7f6e…`)

  `workers-builds-kit` is now the account's only build token.

## Failed

- **Deleting the underlying user API tokens** returned `9109 Unauthorized` for all three, as expected: agentic-access lacks _User → API Tokens: Edit_. I did not ask for more access.

## Needs Kris

- **Delete three user tokens in the dashboard.** Go to **My Profile → API Tokens**, then for each token use **… → Delete**:
  - `kw-website build token`
  - `Workers Builds - 2026-05-24 11:16`
  - `vallearmonia-website build token`

  Workers Builds no longer references any of them.

## Notes

- **Remote writes made:**
  - registered one build token
  - patched 15 triggers to the new token
  - fixed the commands on the two kw-alejandro triggers
  - ran 14 manual builds; two more ran automatically on push
  - deleted three build-token registrations
  - pushed two repository commits
- Neither secret touched disk or output. Each was read from 1Password inside the single command that used it.
- **Brief conflict:** the prompt again appended the generic "local only, no remote call" footer. I followed the task body under Decision 133.
