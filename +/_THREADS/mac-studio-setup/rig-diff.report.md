# rig-diff - sol (studio) against terra (laptop) - owner report

Thread [rig.mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.mac-studio-setup.md), Project [mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md), Initiative [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md). Run on sol, locally, 2026-10-14, about 17:40 to 18:00 BST (sol's clock). State: done. Authority: Kris, 2026-10-14, "I want to add to this projects remit that it needs to look at the rig differences" (decisions log, RIG-DIFF).

Read-only throughout. No commits, applies, installs, setting writes or pushes on either machine; no secrets read. The only network use was one SSH attempt to terra, refused before any key exchange.

## What has been done

- **terra could not be read live.** terra is up on the tailnet (Tailscale shows it active, direct), but port 22 refuses connections at both its name and its tailnet address: Remote Login is off. So terra's column comes from the chezmoi source (which declares the laptop profile) and earlier reports: `sol-dock-zed` (terra's Dock and `rig doctor`, today), `local-mode-plan` and `sol-build` (terra's tool links), `sol-headroom` (terra's Headroom), `sol-apply-failures` (terra's Telegram) and [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) (terra's unmanaged items, 13 October). Rows marked "unknown" need TERRA-READ.
- **sol read live:** `rig doctor`, `rig show --profile studio` and `--profile laptop` (same config, so the profile difference is exact), `rig capture --provider homebrew --dry-run`, `mas list`, `/Applications`, `dockutil --list`, `~/Library/LaunchAgents` and `launchctl list`, `mise ls`, global npm, skill and output-style links, tool links, `chezmoi status`.
- **Main findings:**
  - The profile split is exactly as intended: studio adds Lightroom Classic and DaVinci Resolve; laptop adds Delta, RendApp, The Tower, the held Paperclip tool, service and port, the WhatsApp spool and 5G-EMERGE jobs, and the Dock layout.
  - **SOL-TELEGRAM is smaller than parked:** the Homebrew cask record is already gone on sol, so only the App Store install is left.
  - **The Dock is six apps short of the laptop order:** NordVPN, ChatGPT Classic, Zed, LaunchControl and draw.io are installed but not on the Dock, and Telegram is missing. Lightroom Classic is extra, and Warp sits before Visual Studio Code. Otherwise the order already matches.
  - **New Dock-link catch for KI-TOOL-RIG-CORE-042:** the Dock item `chatgpt-current` (ChatGPT.app) maps to a tool selected by no profile. Once Dock items are filtered by profile, ChatGPT would drop off both Docks. The Dock item `chatgpt-classic` also has no tool of that name, because the tool is `chatgpt`.
  - **Unrecorded sol extras:** most of sol's undeclared software is already on the KB-DOTFILES-UE-086 removal list. Ten items are on no record: Photoshop 2023 to 2026, Creative Cloud, Canon Utilities, ABBYY FineReader, Keynote, Numbers, Pages, Google Docs, Sheets and Slides, and the Simulator apps. The Hermes launch agent would also survive removal of its formula.
  - **mise:** rust and the 8 cargo tools are pinned but missing on sol, and four old unpinned runtimes remain.

### Differences

Known rows from `rig-guide.report.md` are cited by D-number rather than restated.

| Item | sol (studio) | terra (laptop) | Declared? | Intended or drift | Proposed settlement and owner |
| --- | --- | --- | --- | --- | --- |
| Rig profile | `studio`, Rig 0.6.3+dev from the checkout link | `laptop`, Rig 0.6.3 checkout link (as of 14 Oct) | yes (`rig.toml`, from `chezmoi init`) | intended | none |
| Profile selections | 175 tools, 64 resources, 3 ports; studio-only Lightroom Classic, DaVinci Resolve | 177 tools, 68 resources, 4 ports; laptop-only Delta, RendApp, The Tower, Paperclip (tool, held service, port), WhatsApp spool and 5G-EMERGE jobs, Dock layout | yes | intended; the laptop-only Dock is temporary until KI-TOOL-RIG-CORE-042 (D31) | none beyond DOCK-CONSUMER |
| `rig doctor` | unhealthy, 3 findings: Telegram missing, SVG handler drifted, `port.headroom` false conflict | last read today in `sol-dock-zed`, no findings reported; live state unknown | n/a | drift on sol | SOL-APPLY (Telegram, SVG); KI-TOOL-RIG-CORE-055 (port, D13) |
| Telegram | not installed; **Homebrew cask record already gone** | App Store copy (747648890) | yes, `core`, App Store | drift on sol (D3) | SOL-APPLY: App Store install via `rig apply` at sol's screen; Kris |
| SVG handler | ImageOptim holds `.svg`; declaration wants Chrome | declaration came from terra; live state unknown | yes (`40-macos.toml`, applied on sol today) | drift on sol | SOL-APPLY; Kris |
| Pending chezmoi target | `10-applications.toml`: Telegram rationale wording only (`bd82eda`) | unknown | yes | harmless lag | apply in the SOL-APPLY pass; Kris |
| Dock membership | 28 apps; missing NordVPN, ChatGPT Classic, Zed, LaunchControl, draw.io (all installed) and Telegram; extra Lightroom Classic | 36 apps, matches the declared list (14 Oct) | laptop only | drift on sol, waiting on KI-TOOL-RIG-CORE-042 (D31) | [KI-TOOL-RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md) (Now), then DOCK-CONSUMER; Lightroom after Photos (DOCK-LIGHTROOM) |
| Dock order | same order as laptop for every shared item except Warp before Visual Studio Code | Visual Studio Code, then Warp | laptop only | drift on sol | fixed by the 042 apply on sol; no separate action |
| Dock-item tool links | n/a | n/a | `dock-item.chatgpt-classic` matches no tool id (tool is `chatgpt`); `chatgpt-current` (ChatGPT.app, cask `chatgpt`) is selected by no profile, though both Macs have it in the Dock | **new**: latent bug once 042 filters by tool | DOCK-CONSUMER: link `chatgpt-classic` to `chatgpt`, give `chatgpt-current` the `core` profile; chezmoi |
| Claude and Codex skill links | 10 ki skills incl. `ki-pmo`, `ki-pmo-design`, plus `archify`, `caveman`, in both `~/.claude/skills` and `~/.agents/skills`; `ki-delegation` links to the released harness copy while the rest link to the checkout | lacks `38d0f00`: no `ki-pmo`/`ki-pmo-design`, dead `ki-design-loop` link (14 Oct) | yes (`~/.config/ki/config.toml`) | drift on terra until it pulls (D15); two link forms on sol (D16) | CHEZMOI-PUSH, then terra pull, apply, `ki repair --apply`; link form stays with K1 and sol-scope's LOCAL-MODE-CHECK |
| Output style | `ki-coordinator` linked to checkout | same (`319f6ae`) | yes | same | none (D14) |
| KI tool sources | `ki`, `rig`, `mgit`, `techne`, `git-almanac` from checkouts in `~/.local/bin`, Homebrew underneath; `mcporter` via chezmoi wrapper; `claude`, `codex` Homebrew casks | same five checkout links (made the same way) | no | same on both, undeclared (D24) | [KB-DOTFILES-UE-089](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-089-ki-tool-release-channels.md); no new action |
| HNR Harness | missing | installed, local mode on | yes | drift on sol (D19) | SOL-HNR-HARNESS (parked) |
| WhatsApp MCP and spool | MCP fails, no spool job | working, spool job laptop-only | yes (job laptop-only) | intended split (D30) | SOL-WHATSAPP (parked) |
| Headroom | hand deployment `com.headroom.init-user` (15:31 today), 8787, Python | same hand deployment | program yes (`uv`, `core`); deployment no | undeclared on both (D12, D13) | [KB-DOTFILES-UE-090](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-090-close-rig-bring-up-gaps.md) with [KB-DOTFILES-UE-087](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-087-manage-headroom-profile-arguments.md); connection-critical, no new action |
| Firewall | none | live pf rules from the dev test copy `~/.local/state/rig-firewall-test`; declaration parked outside chezmoi | no | intended temporary (D33, FW-LIVE) | commit the declaration after the FW-LIVE comparison under KI-TOOL-RIG-CORE-047; coordinator |
| Undeclared Homebrew on sol, on UE-086 list | `hermes-agent`, `libtiff`, `actual`, `moom`, `jordanbaird-ice@beta`, `node`, `uv`, `python@3.10/3.13/3.14` (`python@3.10` and `uv` have no dependants) | `cloudflare-wrangler`, `node`, `uv`, `python@3.10` (13 Oct) | no | drift on both, already decided | UE086-SOL-PASS (sections C4, C7d, C7f, C7h at sol); laptop section B at terra; Kris |
| Hermes launch agent | `ai.hermes.gateway` loaded, failing (exit 78) | unknown | no | **new**: UE-086 C7f removes the formula but not the agent | UE086-AMEND: add the plist removal to C7f; chezmoi |
| Undeclared apps on sol, on UE-086 list | PTGui Pro, PhotoSweeper, Blackmagic Disk Speed Test, ScanSnap Home and helpers, Synology Drive, Dropbox, OneNote, iTerm | OneNote, iTerm and laptop extras (13 Oct) | no | drift, already decided | UE086-SOL-PASS (C7a to C7c); Kris |
| Undeclared apps on sol, **on no record** | Photoshop 2023, 2024, 2025, 2026 and Creative Cloud; Canon Utilities; ABBYY FineReader for ScanSnap; Keynote, Numbers, Pages (App Store); Google Docs, Sheets, Slides (Chrome apps); Simulator, Simulator (Watch) | unknown | no | **new** | UE086-AMEND: declare Photoshop and Creative Cloud studio artefact-only like Lightroom; remove older Photoshops via Creative Cloud; ABBYY goes with ScanSnap (C7b); declare Keynote, Numbers, Pages in `core` from the App Store like GarageBand and iMovie; leave Canon Utilities, the Chrome apps and Simulator undeclared; chezmoi, then Kris at sol |
| DaVinci Resolve | installed from the App Store (571213070) | not selected | artefact only, `studio` | **new**: Rig can't reinstall it | UE086-AMEND: add the App Store id; chezmoi |
| Diagram | not installed | unknown | `core`, catalogue-only | intended (Rig never installs catalogue-only items) | none |
| Homebrew autoupdate agent | `com.github.domt4.homebrew-autoupdate` loaded, last exit 1; untrusted tap | unknown | no; `rig doctor` lists it as information only | drift (D41); Rig's own `rig-update` job does updates | AUTOUPDATE-REMOVE at sol; check terra in TERRA-READ; Kris |
| Rig scheduled jobs and services | all 8 studio launch agents present (`claude-swap-auto`, `good-morning`, `observatory`, `rotate-logs`, `update`, `workstation-health`, two `mcporter`) | laptop set plus the WhatsApp spool and 5G-EMERGE jobs and held Paperclip | yes | intended | none |
| Other launch agents | vendor agents for Adobe, Dropbox, Google, Synology, iMazing, Zoom, Microsoft | unknown | no | app-owned, out of Rig's scope | none (Dropbox and Synology go with UE-086 C7c) |
| mise runtimes | pinned and present: node 24.21.0, bun 1.4.2, python 3.15.0, uv 0.13.0, actionlint, zig; **pinned but missing:** rust 1.96.0 and 8 cargo tools; **unpinned leftovers:** bun 1.3.14, node 22.23.3, 24.18.0, 24.19.0 | rust and cargo tools present since August; python 3.15.0 and uv 0.13.0 pending (UE-086 B1, 13 Oct) | yes (`~/.config/mise/config.toml`) | drift on both, in progress | UE086-SOL-PASS: C2 at sol after SOL-CLT (cargo tools compile), then `mise prune` for the leftovers (D21); Kris |
| npm globals | `codex-multi-auth`, `skills`, `wrangler`, `imageoptim-cli`, `npm-check-updates`, `turbo`, `typescript` | unknown | yes, all `core` | same as declared | none |
| chezmoi checkout | 7 commits ahead of `origin/main`, unpushed (Codex render fix, skills config, guide, Telegram rationale, UE-090) | at `4d07f9c` or later, not level (14 Oct); every host before the Codex fix fails the Codex render | n/a | drift between Macs | CHEZMOI-PUSH; Kris |
| Remote reach | sol accepts SSH from terra | Remote Login off, so sol can't read terra | no | intended so far (KI-TOOL-RIG-CORE-046 cancelled) | TERRA-READ from terra's own session, no Remote Login change; coordinator |

## What is in progress

Nothing is running. This report is also copied to the thread folder, `+/_THREADS/mac-studio-bootstrap/rig-diff.report.md` in ki-principal, uncommitted, as the progress protocol asks. Every terra fact is from 9 to 14 October evidence, not a live read.

## Outstanding queries

### SOL-APPLY - One sol apply for Telegram and the SVG handler

**Summary:** sol's three `rig doctor` findings are Telegram, the SVG handler and the false Headroom port finding. The Telegram cask record is already gone, so SOL-TELEGRAM needs no Homebrew step. One attended apply settles both real findings. It needs no Command Line Tools, because App Store installs and handler changes don't compile anything. This supersedes the parked SOL-TELEGRAM and the open SVG-HANDLER.

**Need from you:** run it at sol's screen, signed in to the App Store.

**Recommendation:** run `chezmoi apply ~/.config/rig/conf.d/10-applications.toml`, then `rig apply --dry-run`. Check that the dry run plans only Telegram and the SVG handler, then run `rig apply`. If the dry run lists every item as planned, `rig status` gives the real change set.

### DOCK-CONSUMER - Fix the Dock links in the declaration record

**Summary:** the open DOCK-CONSUMER query (tool-records report) moves `dock.workstation` to `core` with tool links once KI-TOOL-RIG-CORE-042 lands. Two links would go wrong:

- `dock-item.chatgpt-classic` has no tool of that name (the tool is `chatgpt`);
- `chatgpt-current` (ChatGPT.app) is selected by no profile, so ChatGPT would vanish from both Docks.

**Need from you:** approve the record with these links included.

**Recommendation:** capture the KB-DOTFILES triage record with `chatgpt-classic` linked to `chatgpt`, `chatgpt-current` given the `core` profile, and Lightroom Classic straight after Photos.

### UE086-AMEND - Settle sol's unrecorded extras in KB-DOTFILES-UE-086

**Summary:** the existing alignment record covers most of sol's extras. These are on no record:

- Photoshop 2023 to 2026 and Creative Cloud;
- Canon Utilities and ABBYY FineReader;
- Keynote, Numbers and Pages;
- Google Docs, Sheets and Slides;
- the Simulator apps;
- DaVinci Resolve's App Store id;
- the Hermes launch agent that would outlive its formula.

Amending the in-progress record keeps to the no-new-records rule.

**Need from you:** approve the amendment.

**Recommendation:** amend [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) as follows, with a local commit only:

- declare Photoshop and Creative Cloud as studio artefact-only items;
- remove Photoshop 2023 to 2025 through Creative Cloud;
- add ABBYY to C7b and the `ai.hermes.gateway` plist to C7f;
- declare Keynote, Numbers and Pages in `core` from the App Store;
- add App Store id 571213070 to DaVinci Resolve;
- leave Canon Utilities, the Chrome apps and Simulator undeclared.

### UE086-SOL-PASS - When to do sol's at-screen alignment

**Summary:** UE-086 section C is Kris-attended at sol: the rust and cargo toolchain, Homebrew Python and `uv`, the removals, Google Drive and Home Assistant. The cargo tools compile, so this needs the Command Line Tools first. Four old mise runtimes (D21) can go in the same pass.

**Need from you:** pick the session.

**Recommendation:** do it in the same sol session as SOL-CLT, straight after `rig upgrade`, adding `mise prune --dry-run`, then `mise prune`.

### AUTOUPDATE-REMOVE - The old Homebrew autoupdate agent on sol

**Summary:** `com.github.domt4.homebrew-autoupdate` is loaded on sol, failing (last exit 1) and from an untrusted tap (D41). Rig's own `rig-update` job already handles updates.

**Need from you:** approve removing it.

**Recommendation:** at sol, run `brew autoupdate delete`, then `brew untap domt4/autoupdate`. TERRA-READ checks whether terra has it too.

### CHEZMOI-PUSH - Level terra with sol's chezmoi commits

**Summary:** sol's chezmoi checkout is 7 commits ahead and unpushed. terra lacks the Codex render fix and the `ki-pmo`/`ki-pmo-design` skill config, so its Codex apply fails and it still has the dead `ki-design-loop` link.

**Need from you:** approve the push.

**Recommendation:** push sol's 7 chezmoi commits now. At terra's next session, `chezmoi git pull --ff-only`, then `chezmoi apply ~/.codex ~/.config/ki/config.toml ~/workspaces` after `chezmoi diff`, then `ki repair --apply`.

### TERRA-READ - Read terra's live state from terra

**Summary:** terra refuses SSH (Remote Login is off), so the terra column relies on 9 to 14 October evidence.

**Need from you:** approve a read-only run in terra's own session.

**Recommendation:** at terra's next session, one read-only run collects the same evidence there and appends it to this report: `rig doctor`, `rig status --unmanaged`, `rig capture --provider homebrew --dry-run`, `mas list`, `dockutil --list`, LaunchAgents, `mise ls` and the skill links. Leave Remote Login off.

```text
SOL-APPLY - I'll run it at sol: chezmoi apply 10-applications.toml, rig apply --dry-run (Telegram and SVG handler only), then rig apply, signed in to the App Store
DOCK-CONSUMER - capture the KB-DOTFILES record for the core Dock with tool links, including chatgpt-classic -> chatgpt, chatgpt-current in core, Lightroom Classic after Photos
UE086-AMEND - amend KB-DOTFILES-UE-086 as recommended (Photoshop and Creative Cloud studio artefacts, old Photoshops removed, ABBYY in C7b, hermes plist in C7f, iWork in core from the App Store, DaVinci App Store id, rest left undeclared); local commit only
UE086-SOL-PASS - do UE-086 section C plus mise prune in the same sol session as SOL-CLT
AUTOUPDATE-REMOVE - approved: brew autoupdate delete and untap domt4/autoupdate on sol
CHEZMOI-PUSH - push sol's 7 chezmoi commits now; terra pulls, applies after diff and runs ki repair --apply at its next session
TERRA-READ - run the read-only terra evidence pass from terra's next session and append it; leave Remote Login off
```
