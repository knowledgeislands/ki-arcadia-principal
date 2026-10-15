---

---

---

# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › favicons

**Run report at 13:26 BST · last mark 17:47 BST**

---

## Done

- **Port 1675 is the Knowledge Islands Observatory.** It is `bun run src/main.ts --no-open` running in `/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/apps/site`, which is the `uk.me.kris.rig.observatory` service. Before this run it had no favicon: no `<link rel="icon">`, and `/favicon.ico` returned 404. The page head is built in `apps/site/src/page.ts` and the routes in `apps/site/src/server.ts`.
- **Port 8787 is the Headroom proxy, which is third-party and connection-critical.** It runs `python -m headroom.cli proxy --port 8787 …` from the uv tool `headroom-ai` 0.41.0. Its icon comes from `headroom/proxy/server.py:4688`, which answers `/favicon.ico` with `204 No Content` on purpose (upstream GH #1787). It has no setting for an icon. `headroom/dashboard/templates/dashboard.html` has no icon link either. I did not patch it, restart it or change its configuration.
- **Observatory icon designed and committed locally:** `d9c66cd feat(site): give the Observatory a tab icon` on `main` in `apps-observatory.local`. The icon is an observatory dome in the repository's own colours from `packages/instruments/src/assets/design.ts`: a navy (`#0f2440`) tile, a gold (`#c8963c`) dome with a slit, a parchment (`#f5efe0`) base and a star. The source is `apps/site/src/favicon.svg`. It is embedded as text, so the compiled binary includes it. The server returns it at `/favicon.svg` under the sandboxed SVG policy it already uses for other SVGs, and the page head links to it. Server tests now check the route, its headers and the link.
  - Preview 16 px: ![Observatory 16](favicons-observatory-16.png) · 32 px: ![Observatory 32](favicons-observatory-32.png) · source: `/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/apps/site/src/favicon.svg`
- **Checks:**
  - `bun run test` passed: 8 of 8 tasks.
  - `bun run self:typecheck` passed.
  - `bun run build` passed, including the compiled binary.
  - Biome found nothing on the changed files apart from one warning that was already there (`server.ts` non-null assertion). Running `biome check .` on the whole repository still reports errors, but they are all in files this run did not touch.
  - The pre-commit hook (lint-staged and syncpack) passed.
  - `self:test:browser` skipped itself because Chromium is not installed for Playwright.
- **Checked against a running server:** I started my own copy on `127.0.0.1:16750`. Its page carried `<link rel="icon" href="/favicon.svg" type="image/svg+xml">`, and `/favicon.svg` answered `200 image/svg+xml` with the SVG policy, `nosniff` and `no-referrer`. I then stopped it. The live service on 1675 still returns 404 for `/favicon.svg`. That is expected: it serves the previous code until it is restarted, and this repository's AGENTS.md forbids a background run from restarting it. See OBS-RESTART.
- **Headroom concept icon (not installed anywhere):** a teal (`#317070`) tile with a parchment double up-chevron, meaning "headroom". At 16 px it is easy to tell apart from the navy and gold dome. It exists only to go with an upstream request (HEADROOM-ICON).
  - Preview 16 px: ![Headroom 16](favicons-headroom-16.png) · 32 px: ![Headroom 32](favicons-headroom-32.png) · source: `favicons-headroom.svg` in this folder
- **Limitations:**
  - There is no PNG or ICO fallback. Every current browser on macOS 27, Safari included, supports SVG favicons. Browsers that support them do not ask for `/favicon.ico` when an SVG link exists.
  - No roadmap record covers this change. The brief itself was the owner instruction.
  - My one `GET /` to 8787 was passed straight through by Headroom to its upstream provider, which returned an OpenAI welcome message. That was one remote request, with no credentials or content from me. I sent nothing more to 8787. Headroom's dashboard is at `/dashboard`.
  - The progress status lines I wrote before 13:22 said "12:xx BST" but the times were actually 13:xx BST.

## In Progress

Nothing is running.

Outstanding - no action requested now:

- `d9c66cd` is unpushed on `main` in `/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local` on sol.
- The preview files `favicons-observatory-{16,32}.png`, `favicons-headroom-{16,32}.png`, `favicons-headroom.svg` and this report are uncommitted in the thread folder.

## Queries

### OBS-RESTART - Restart the Observatory so port 1675 shows the new icon

**Context:** The icon is committed on `main` in the primary checkout, which the service runs. The service still has the old code loaded, so the tab has no icon until it restarts. This repository's AGENTS.md lets an interactive session restart it but not a background run.

**Query:** Should the Observatory service be restarted now so it serves the icon?

**Options:**

a) (recommended) In an interactive session on sol, run `launchctl kickstart -k "gui/$(id -u)/uk.me.kris.rig.observatory"`, then confirm that `http://127.0.0.1:1675/favicon.svg` answers 200 and the tab shows the dome.

b) Leave it, and let the icon appear at the next restart or delivery.

### HEADROOM-ICON - Ask Headroom upstream for a dashboard icon

**Context:** Headroom deliberately answers `/favicon.ico` with 204 and has no setting for an icon. A local patch would be lost on the next `uv tool upgrade` and would touch a connection-critical service. The concept icon in this folder shows what one could look like.

**Query:** How should Headroom get a better tab icon?

**Options:**

a) (recommended) Open a feature request on the Headroom repository asking it to serve an SVG icon from `/favicon.ico` or `/favicon.svg` and link it from `dashboard.html` and `settings.html`, attaching `favicons-headroom.svg` as a suggestion. Kris files it, or a run authorised to call GitHub does.

b) Leave Headroom with no icon.

```text
OBS-RESTART

a) In an interactive session on sol, run `launchctl kickstart -k "gui/$(id -u)/uk.me.kris.rig.observatory"`, then confirm that `http://127.0.0.1:1675/favicon.svg` answers 200 and the tab shows the dome.

---

HEADROOM-ICON

a) Open a feature request on the Headroom repository asking it to serve an SVG icon from `/favicon.ico` or `/favicon.svg` and link it from `dashboard.html` and `settings.html`, attaching `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/mac-studio-bootstrap/favicons-headroom.svg` as a suggestion. Kris files it, or a run authorised to call GitHub does.
```

```text
╭─ run report · 2026-10-15T12:26:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · 1 local commit          │
│  █  █ █▄▄▄ ▄▄▄█   █    · 2 queries               │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] favicons finished; nothing running from this run
- [waiting] OBS-RESTART
- [waiting] HEADROOM-ICON
- [unpushed] apps-observatory.local main d9c66cd on sol
- [uncommitted] favicons.report.md and favicon previews in the thread folder

```text
Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
