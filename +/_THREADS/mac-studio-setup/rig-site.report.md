# The Rig site: what it shows, what is stale, and how to show Rig per host - owner report

## What has been done

I surveyed the Rig site and compared it with Rig today. Everything was read-only. Nothing was built, committed, pushed or deployed, and there were no remote calls. The only writes were throwaway exports into temporary folders, deleted straight after.

### What the site is today

- **What it shows.** One page at `rig.midnight.ninja`: every tool in Rig's `public` view, grouped by area, with what each tool is for and why it was chosen, plus two agent skills. Three hand-written guides sit beside it (bootstrapping a new Mac, macOS power tools, software choices). The tagline says it is "the working setup of one personal Mac".
- **Where the content comes from.** `bun run self:rig:pull` runs `rig export --profile public` on terra and commits the result as `apps/site-rig/data/rig.json`. Vendor homepage links are curated by hand in `data/tool-links.json`. The guides are hand-written Markdown. There is no Observatory feed.
- **How it is built and published.** Eleventy builds static HTML. Workers Builds deploys it to the Cloudflare Worker `midnight-ninja-rig` on every push to `main`. The site is unindexed, but anyone with the URL can open it. Local `main` matches `origin/main`, so what is live is what is committed.
- **Its privacy boundary.** The repository's own rules say the export carries no versions, no install details, no services, no ports and no machine identity. Tools are opt-in per tool, through `profiles = ["…", "public"]` in the chezmoi-managed Rig config. The pull script refuses an export with fields named like `version`, `hostname`, `port`, `path` and similar.

### What is stale

| What | Site now | Rig today |
| --- | --- | --- |
| Catalogue | Last pulled 25 September 2026 | A fresh export has 100 tools, not 96 |
| New tools missing | — | Activity Monitor (built-in), Finder (built-in), Delta, ProcessSpy |
| Changed tools | — | `spark` is now Spark by Shadowlab (a shortcut launcher), but the site still says Spark Mail and links to sparkmailapp.com; Path Finder's rationale changed; Telegram's rationale changed |
| Hosts | "One personal Mac" | Two Macs (terra on `laptop`, sol on `studio`) plus vega (`agent-host`) |
| Bootstrap guide | Tells you to use `brew bundle` with a Brewfile, `rig bootstrap`, `rig run workstation audit` and `machine apply` | Brewfile handling is retired, and none of those three commands exist in Rig 0.6.3 |
| Weekly refresh | [MIDNIGHT-HK-001](/Users/krisbrown/workspaces/personal/apps-rig.midnight.ninja/docs/housekeeping/MIDNIGHT-HK-001-refresh-the-rig-catalogue.md) is set to weekly, but `last-run` is still empty | It has never run since the split |

Two more points:

- **Telegram's new rationale would publish internal references.** It now ends "([KB-DOTFILES-UE-079 (pruned)](https://github.com/krisb/dotfiles/blob/02ef54dfec0f59f2635089304b624fc64026db81/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md), chezmoi thread Decision 49)". Fix that in the Rig config through chezmoi before the next pull, not on the site.
- **Rig itself never appears on the site.** Rig's version, release or checkout, firewall and local mode don't show anywhere. The page lists tools, not Rig's state. The committed file says export format version 2, but Rig 0.6.3 writes version 1. The site doesn't check that number, so nothing breaks.

### What "how Rig is available on different hosts" would need

There are two different things here, and only the first is safe for a site anyone can reach by URL.

1. **What each host is meant to carry (declared, safe to publish).** On each public tool card, show which roles carry it: laptop, studio, agent host. Add a short hosts section with role, platform and profile name. This needs no Rig change. `rig show --profile laptop --format json` (and the same for `studio`) already lists each profile's tools; I checked it read-only and got 178 for laptop and 175 for studio. The pull can keep only the IDs that are also in the public view, so nothing private gets through. vega's `agent-host` profile is in a separate file, [recipes/agent-host/rig.toml](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/recipes/agent-host/rig.toml), and it has no public view. For now, a hand-written line is enough for vega.
2. **What each host is actually running (live state, private).** This means Rig version and channel (checkout or release), and the last apply, update or upgrade result and when. Today: terra and sol run `0.6.3+dev` from their checkouts. vega is pinned to Rig 0.4.0, and its `rig` link is broken ([KI-TOOL-RIG-DIST-011](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-DIST-011-stale-terra-rig-link.md)). The data is on each host: `rig diag` gives version and install mode, and `~/.local/state/rig/last-update` and `last-upgrade` hold the receipts. Collecting it means reaching each host over the tailnet. It also crosses the site's own boundary: no versions, no machine identity. Host names, Tailscale addresses and full per-host app lists must not go on the public site. Live state belongs on the private Observatory, or nowhere for now.

### Records that already cover this

None do. I checked the site's roadmap (empty, `SITE` area at 000), tools-rig's 7 open records, Observatory's roadmap (empty), the agent-host records [KI-TECHNE-OPS-018](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-018-converge-tools-through-rig.md) and [KI-TECHNE-OPS-024](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-024-weekly-pin-bump.md), and the chezmoi roadmap. A few are related without covering this. [KI-TOOL-RIG-DIST-011](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-DIST-011-stale-terra-rig-link.md) covers vega's broken Rig. [KB-DOTFILES-UE-027](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-027-honest-rationales-per-tool.md) covers rationales; it is on hold.

### Smallest plan

| Step | What | Owner | Record |
| --- | --- | --- | --- |
| 1 | Remove the internal references from Telegram's rationale | chezmoi (Rig config) | none, a one-line edit |
| 2 | Run the weekly refresh: pull, add links for the 4 new tools, fix the Spark link, check typecheck and tests, commit | site repo | none: [MIDNIGHT-HK-001](/Users/krisbrown/workspaces/personal/apps-rig.midnight.ninja/docs/housekeeping/MIDNIGHT-HK-001-refresh-the-rig-catalogue.md) already covers it |
| 3 | Per-host view: the pull also reads `rig show --profile laptop` and `studio`, cards get role chips, a hosts section is added, the tagline changes from "one personal Mac" to the hosts, and the bootstrap guide is replaced with a short pointer to the chezmoi [macOS workstation guide](/Users/krisbrown/.local/share/chezmoi/docs/guides/user/macos-workstation.md) | site repo | **one new record, proposed:** [KB-MIDNIGHT-RIG-SITE-001](/Users/krisbrown/workspaces/personal/apps-rig.midnight.ninja/docs/roadmap/KB-MIDNIGHT-RIG-SITE-001-show-hosts-per-tool.md), "Show which hosts carry each tool" |
| 4 | Deploy: push `main`, which Workers Builds deploys | you | — |
| later | Live per-host Rig state (version, channel, last result) on Observatory | Observatory | not now; only if you want it |

No change to Rig is needed for steps 1 to 3. Steps 1 and 2 can run today. Step 3 needs the record.

### Side finding

On terra, `~/.local/state/rig/last-update` was last written on 30 September and says profile `default`. `last-upgrade` runs daily, and its newest run was this morning. Either the scheduled `rig update` hasn't saved a receipt for two weeks, or it hasn't run. I didn't look into it.

## What is in progress

Nothing. This run has finished.

## Outstanding queries

### RIG-SITE-REFRESH - Refresh the catalogue now

**Summary:** the published catalogue is three weeks old. It is missing 4 tools, and Spark is wrong. Telegram's rationale needs its internal references removed first.

**Need from you:** approve a short run that edits the Telegram rationale in chezmoi, runs [MIDNIGHT-HK-001](/Users/krisbrown/workspaces/personal/apps-rig.midnight.ninja/docs/housekeeping/MIDNIGHT-HK-001-refresh-the-rig-catalogue.md) on terra and commits locally. You would then approve the push, which deploys the site.

**Recommendation:** approve. The push stays your call.

```text
RIG-SITE-REFRESH: run it / wait — <notes>
```

### RIG-SITE-HOSTS - Record for the per-host view

**Summary:** showing which hosts carry each public tool needs no Rig change and publishes nothing private. Live versions and last results would cross the site's privacy boundary.

**Need from you:** decide whether to capture [KB-MIDNIGHT-RIG-SITE-001](/Users/krisbrown/workspaces/personal/apps-rig.midnight.ninja/docs/roadmap/KB-MIDNIGHT-RIG-SITE-001-show-hosts-per-tool.md) "Show which hosts carry each tool" in the site repo, covering the declared view only.

**Recommendation:** capture it, for the declared view only. Keep live Rig versions and results off the public site. Put them on Observatory later if you still want them.

```text
RIG-SITE-HOSTS: capture (declared only) / capture incl. live state / drop — <notes>
```

### RIG-SITE-HOSTNAMES - Host names on the site

**Summary:** the hosts section can name hosts by role (laptop, studio, agent host) or by host name (terra, sol, vega). The page is unindexed but anyone with the URL can open it.

**Need from you:** choose which.

**Recommendation:** roles only.

```text
RIG-SITE-HOSTNAMES: roles only / host names too — <notes>
```

### Reply block

```text
RIG-SITE-REFRESH: run it / wait — <notes>
RIG-SITE-HOSTS: capture (declared only) / capture incl. live state / drop — <notes>
RIG-SITE-HOSTNAMES: roles only / host names too — <notes>
```
