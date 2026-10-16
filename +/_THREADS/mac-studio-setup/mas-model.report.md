# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › mas-model

**Run report 02:13 BST · last mark 17:47 BST**

---

## Done

This was a read-only run on `sol`. Nothing was changed, installed, applied or committed, and no network call was made. The evidence comes from `mas list`, the chezmoi Git history (all 47 versions of the old Brewfile), the Rig declarations and the tools-rig source, specs and decision records.

### Why five App Store apps are not declared with an App Store route

`mas list` on `sol` shows 18 apps. Rig declares 13 of them with `install.kind = "mas"`. Each of the other five has a recorded reason:

| App | In Rig? | Why | Where it is recorded |
| --- | --- | --- | --- |
| Keynote (409183694), Numbers (409203825), Pages (409201541) | **Yes, but catalogue-only.** Each is declared in `core` with its `/Applications` artefact and no `install` route | `mas` could not resolve the iWork App Store ids: `mas info 409183694` said no such app, although `mas list` showed it installed. That made every `rig apply` fail three installs, so on 2026-09-27 the route was taken out of both Rig and the Brewfile | chezmoi `16e7ab7` ("declare the bundled iWork apps catalogue-only"); a comment above `[tool.keynote]` in `private_10-applications.toml`; `docs/guides/agents/audits.md` |
| PhotoSweeper (463362050) | No | Kris decided to remove it: "others not needed anymore" (2026-10-09) | [DOTFILES-UE-079 (pruned)](https://github.com/krisb/dotfiles/blob/02ef54dfec0f59f2635089304b624fc64026db81/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md) (pruned in chezmoi `d362812`); removal list and step C7a of [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) |
| Blackmagic Disk Speed Test (425264550) | No | Decided as remove: "One-off benchmark, reinstall when needed" | [DOTFILES-UE-079 (pruned)](https://github.com/krisb/dotfiles/blob/02ef54dfec0f59f2635089304b624fc64026db81/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md) decision table; [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) removal list and step C7a |

Neither PhotoSweeper nor Disk Speed Test was ever in a Brewfile. Both are still installed only because step 7 of the [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) at-screen instructions has not been run yet.

**Keynote, Numbers and Pages came from the App Store.** They are not part of macOS. On this Mac they sit in `/Applications`, not `/System/Applications`, and each has an App Store receipt and a `mas list` entry. Apple gives them away free and may preinstall them on a new Mac, but they are installed and updated as App Store apps. The comment in the declaration says "Bundled with the Mac", which is wrong for this Mac. The 14 October amendment to [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) ("declare in `core` from the App Store") is the decision that has not been carried out yet; it is the KEYNOTE-ROUTE query that is already open. This run made no network call, so it did not check whether `mas` can resolve the iWork ids today.

### The old Brewfile against Rig now

The Brewfile started as `dot_Brewfile` (2026-05-09) and moved to `dot_config/private_homebrew/Brewfile`. Chezmoi `9ec3781` retired it on 2026-10-01. Its last version, `a23e125` of 2026-09-28, had 190 entries: 9 `tap`, 73 `brew`, 60 `cask`, 9 `mas` and 39 `vscode`. The retirement kept the full list as evidence in `tests/fixtures/brewfile-retirement.json`. It also set two rules: unused taps do not become prerequisites, and Homebrew autoupdate is never reinstalled just because it used to exist.

**From that last version, 183 of 190 carry over as they were.** The App Store apps are all there: all 9 `mas` lines are still declared, and Rig has since added DaisyDisk, DaVinci Resolve, Home Assistant and HP, which makes 13. The 39 VS Code extensions are in chezmoi's `dot_config/vscode/private_extensions.txt`. That list is reviewed by hand, and neither Rig nor chezmoi installs from it. The other seven taps survive through fully qualified locators, because Rig has no tap entries. Seven entries changed:

| Entry | Now | Reason |
| --- | --- | --- |
| cask `daisydisk` | App Store 411643860 | chezmoi `a81a5f2` (2026-10-10): App Store copy on both Macs |
| brew `uv` | mise tool | chezmoi `06857f5`: [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) section A |
| brew `python@3.10`, `python@3.13`, `python@3.14` | Dropped | Kept in Rig in 2026-10-01 "with no recorded reason", then dropped in chezmoi `06857f5` when mise took over Python. 3.13 and 3.14 stay installed as dependencies ([KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md)) |
| tap `domt4/autoupdate` | Dropped, and removed from `sol` | The retirement rule above, plus the AUTOUPDATE-REMOVE decision (2026-10-14) |
| tap `wunderlandmedia/tap` | Dropped | HotkeyClash was retired on 2026-09-16 (`3ecd73d`), which left the tap unused; the retirement rule says unused taps are not carried |

**It was wider earlier, as Kris remembers.** The largest version had 197 entries (`7e62ea4`, 2026-09-15). Across its whole history the Brewfile held 49 entries that were gone before the last version. 8 of those are still in Rig in the same form: granted under `fwdcloudsec`, and corepack, imageoptim-cli, npm-check-updates, turbo, typescript, `wrangler` and `headroom-ai[all]` through npm or uv. The other 41 are no longer declared as they were. One of them, Codexbar, is now a cask and is not listed again; the other 40 are:

| Kind | Dropped | Reason |
| --- | --- | --- |
| cask | Actual; Moom; Ice; HotkeyClash; OpenClaw | Retired: `04abf5b`, `cc7ecc7` ("for native tiling"), `14df387`, `3ecd73d`, `b6d7ddc` |
| cask | `telegram` | Moved to App Store 747648890 on 2026-08-23 (`9fb623c`) |
| mas | Spark Mail 6445813049 | Replaced by a cask on 2026-09-01 (`ab02e9b`); Rig now declares Spark Desktop (cask `readdle-spark`) |
| mas | Keynote, Numbers, Pages | Made catalogue-only (`16e7ab7`, above) |
| brew | `hermes-agent` | Retired: "retire Pi and Hermes" (`418c7f8`) |
| brew | `node`, `cloudflare-wrangler` | Removed when the operation wrappers were retired (`b55d905`). `node` is now a mise tool and `wrangler` comes from npm |
| brew and tap | `direnv`, `fnm`, `oven-sh/bun/bun` and its tap | "move to mise" (`27d4b21`, 2026-06-14); `bun` is a mise tool |
| brew | `pipx` | Moved to uv tools (`b18cd0d`) |
| brew | `dasel`, `mr`, `yakitrak/yakitrak/obsidian-cli` and its tap | **No recorded reason** (`7a321bd`, `f7e85cd`, `163e647`; the commit messages are "Update dot_Brewfile" or unrelated) |
| tap | `common-fate/granted` | granted moved to the `fwdcloudsec` tap (`d416bb8`, message "updated") |
| npm | `@anthropic-ai/claude-code` | "drop npm claude code" (`eefb333`); Claude Code is now a cask |
| npm | `pi-coding-agent`, `openclaw` | Retired (`337e1e5` then `418c7f8`; `b6d7ddc`) |
| vscode | 12 Python, Jupyter, ESLint, styled-components and autoimport extensions | **No recorded reason** (`4f430ed`, 2026-06-14, message "updated") |
| vscode | `github.copilot-chat`, `zaucy.symlink-follow` | **No recorded reason** (`5f41938`, `6a582d3`) |

The Brewfile never had `whalebrew`, `go` or `cargo` lines. Today the cargo tools are declared through mise.

**Why Telegram kept switching.** The declaration has said App Store since 2026-08-23. On 2026-10-14 the decision to replace sol's App Store Telegram with the Homebrew cask went against that declaration. Kris installed the cask, and SOL-TELEGRAM-DIRECTION then put the App Store copy back. Every Rig run along the way printed "homebrew" for the App Store copy (for example `telegram homebrew present`), which made it look as if both routes were Homebrew.

### Why Rig files App Store apps under the Homebrew provider

- **Where it started.** tools-rig `50decc2` ("add provider adapters and public export", 2026-09-16) brought in the adapter table as `homebrew | formula, cask, mas | brew; mas for mas | Homebrew and Mac App Store state`. The commit has no message body. No decision record or roadmap record explains the grouping. The likely reason, which is not written down anywhere, is that it copied the Brewfile, where `brew bundle` ran the `mas` lines, and that `mas` is itself a Homebrew formula. `tool.mas` is declared as a Homebrew formula "with no recorded rationale".
- **How it runs.** Homebrew is not involved in App Store work. `rig_provider_executable` (`src/rig/21-provider-state.bash:429`) picks the `mas` executable for `homebrew:mas` and `brew` only for the other Homebrew kinds:
  - **Check:** `mas list`, matching the exact numeric id.
  - **Install:** `mas install <id>`.
  - **Upgrade:** `mas upgrade <id>`. Runs with nobody watching skip it as `interactive-required`, because it needs someone signed in to the App Store.
  - **Remove:** `sudo -n -- mas uninstall <id>`, using only an existing sudo grant.
  - **Validation:** the locator must be numeric.
- **What fixes it in place.** The configuration spec (`docs/specs/configuration.md:131`) says: "Built-in kinds MUST include Homebrew `formula`, `cask`, and `mas`". The orchestration, removal and state specs and the Bats tests all assume the same grouping. Under [ADR-KI-TOOL-RIG-005](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/decisions/ADR-KI-TOOL-RIG-005-provider-execution-contract.md) people "declare intent and ownership rather than adapter mechanics", and under [XDR-KI-TOOL-RIG-001](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/decisions/XDR-KI-TOOL-RIG-001-executable-provider-boundary.md) built-in adapters have fixed provider identities. So a provider of its own would be a spec and configuration change with a migration of all 13 declarations. No App Store app declares `requires = ["mas"]`.
- **No earlier discussion.** No ADR, spec, live or pruned roadmap record, or commit message in tools-rig talks about a separate `mas` or App Store provider. The nearest is the [KI-TOOL-RIG-CORE-041 (pruned)](https://github.com/knowledgeislands/tools-rig/blob/ea7c3b626a2c0de34fe2c1154dc594806926ee3b/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md) removal design (pruned), which only lists "Homebrew formula/cask/App Store" removals.

## In Progress

Nothing is running from this run. KEYNOTE-ROUTE, from the ue086-rest report, is still open, and the first query below adds to it.

## Queries

### MAS-UNDECLARED - The five App Store apps with no App Store route

**Context.** On 2026-10-09 Kris decided to remove PhotoSweeper and Blackmagic Disk Speed Test ([KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) step C7a, step 7 of the at-screen instructions). Keynote, Numbers and Pages are declared catalogue-only, because `mas` could not resolve their ids on 2026-09-27 and every apply then failed. The 14 October amendment says to give them the App Store route, which is the open KEYNOTE-ROUTE query. If that is done as written, the apply failures from 2026-09-27 could come back on a Mac that lacks the apps. Checking whether `mas` resolves the ids now is an App Store lookup, which needs approval.

**Query.** Should any of the five be declared with an App Store route, and how should KEYNOTE-ROUTE go ahead?

**Options.** a) (recommended) Keep the recorded decisions. PhotoSweeper and Disk Speed Test stay undeclared and Kris removes them at step 7 of the [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) instructions. KEYNOTE-ROUTE a) gets a new first step: an agent on `sol` runs `mas info 409183694`, `mas info 409203825` and `mas info 409201541` (App Store lookups). Only if all three resolve does it add the route. If they do not, the three stay catalogue-only, the "Bundled with the Mac" comment is corrected to "App Store, not resolvable by mas", and A8 closes on that basis. b) Declare all five in `core` with App Store routes, which reverses the removal decision for two of them. c) Keep PhotoSweeper or Disk Speed Test (Kris names which) and declare it with its App Store id; the iWork apps go as in a). d) Answer KEYNOTE-ROUTE a) as written, without the check.

### MAS-PROVIDER - Give the App Store its own provider

**Context.** The state-of-play rule from 2026-10-14 is to burn the roadmap down and capture no new feature records. The `homebrew` label on App Store apps is only a grouping in the configuration: Rig already runs `mas` directly and never runs `brew` for these apps. A provider of its own would change the configuration spec, every App Store declaration (13 now) and the tests, so it would be a new feature record. The real cost today is confusion, as with Telegram, where Rig output said "homebrew" for the App Store copy.

**Query.** Should Rig model the App Store as its own provider?

**Options.** a) (recommended) Not now, and capture no record, as the burn-down rule says. An agent adds one sentence each to the tools-rig `docs/guides/user/getting-started.md` and chezmoi's `docs/guides/tools/rig.md`: `install.provider = "homebrew"` with `install.kind = "mas"` means the Mac App Store, run through `mas`, never `brew`. It then runs both gates and commits locally. b) Make an exception to the burn-down rule and capture a tools-rig triage record for an `app-store` (or `mas`) built-in provider, with a migration of the existing declarations. c) Leave it as it is with no documentation change.

```text
MAS-UNDECLARED - a) keep the recorded decisions: PhotoSweeper and Blackmagic Disk Speed Test stay undeclared and Kris removes them at step 7 of the KB-DOTFILES-UE-086 instructions; KEYNOTE-ROUTE a) gets a new first step in which an agent on sol runs mas info 409183694, mas info 409203825 and mas info 409201541 (App Store lookups) and adds the route only if all three resolve; otherwise the three stay catalogue-only, the "Bundled with the Mac" comment is corrected to "App Store, not resolvable by mas", and A8 closes on that basis
MAS-PROVIDER - a) not now and no record, per the burn-down rule; an agent adds one sentence each to tools-rig docs/guides/user/getting-started.md and chezmoi docs/guides/tools/rig.md saying that install.provider = "homebrew" with install.kind = "mas" means the Mac App Store through mas, never brew, runs both gates and commits locally
```

```text
╭─ run report · 2026-10-15T01:13:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · mas model explained     │
│  █  █ █▄▄▄ ▄▄▄█   █    · 2 queries               │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] mas-model finished; nothing running from this run
- [waiting on Kris] [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) section C steps at sol's screen; KEYNOTE-ROUTE
- [queries] MAS-UNDECLARED, MAS-PROVIDER
- [uncommitted] this report (state folder and thread folder)

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
