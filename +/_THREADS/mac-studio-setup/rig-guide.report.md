# rig-guide - sol bring-up differences, records and Rig onboarding guide - owner report

Thread [rig.mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.mac-studio-setup.md), Project [mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md), Initiative [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md). Run on sol, locally, 2026-10-14, finishing about 16:30 BST (sol's clock). State: resting. Authority: Kris, 2026-10-14, "I want to capture any differences and also make an onboarding guide for a rig" (decisions log).

No push, fetch, network call, environment change or secret read. The run did nothing on the machine itself apart from reading files and running the repositories' own checks.

## What has been done

- **Differences table built.** 41 rows, below. Each gives the symptom, cause, owning repository and record.
- **One chezmoi triage record captured:** [KB-DOTFILES-UE-090 Close Rig bring-up gaps](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-090-close-rig-bring-up-gaps.md), `status: triage`, unadopted. It covers nine gaps:
  - the undeclared Headroom deployment;
  - the sign-ins step, with `op vault list` as the check instead of `op whoami`;
  - output-style link ordering;
  - skill-list drift, including the missing `ki-pmo` and `ki-pmo-design`;
  - the CODEX-GROUPS template break, with a render check for the gate;
  - Claude `additionalDirectories` that only ever grow;
  - harness bootstrap and MCP builds;
  - old mise shims;
  - source pulls that are never applied.
- **Commits in `~/.local/share/chezmoi`**, all local, three ahead of `origin/main`, none pushed:
  - `df62013` reserves the number.
  - `929dfce` captures the record.
  - `81c1f1e` corrects its timestamps.
- **The decisions-log transfer is added to [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md)** as a new Discussion subsection. It covers what travels, which host holds the live log, and how a re-bootstrap proves it has the latest copy.
- **Commits in `ki-agentic-harness`**, local, two ahead, none pushed: `0b7138f4` adds the note and `854a1a0d` corrects `updated_at`. The pre-commit hook ran.
- **Correction, already fixed:** I first stamped both records with times an hour in the future, because I misread sol's clock. The two follow-up commits put that right.
- **Check results:**
  - chezmoi `ki repo audit`: FAIL=2 WARN=2, both failures from sol's environment rather than the record:
    - RUNTIMES-2/3 binding activations;
    - REPO-REG-1, because sol's ki registry is missing (SOL-REGISTRY).
  - The roadmap criteria report no failures.
  - `node --test`: 224 passed, 4 failed and 2 skipped. The same 4 fail on an exported copy of the source from before my commits, so they were there already: `ki-self-skill`, two `rig-catalogue` tests and one `scheduled-emerge-session` test. I didn't investigate them.
  - `rumdl check .`: clean.
  - Harness: the `ki-work-roadmap` audit has FAIL=0 and one warning (the missing registry). `rumdl` is clean on the file.
  - I didn't run `bun run test` or `tsc` for the harness, because the change is documentation only.
- **Onboarding guide drafted, not committed:** [rig-onboarding-guide.draft.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/mac-studio-setup/rig-onboarding-guide.draft.md).
  - Seven stages run from first login to thread-ready, with each step marked [screen] or [remote] and a check plus pitfalls after each stage.
  - It also covers moving a thread to the new Rig and ends with a table of known gaps against their records.
  - It is ASCII-only, contains no IP addresses and passes `rumdl`.
  - One step is marked unverified: how the first `chezmoi init` authenticates. The reports don't say how sol's first clone did.
- **tools-rig:** no records created, as the state-of-play rule requires. The proposals are under RIG-RECORDS. The tools-ki and tools-mgit proposals are under TOOL-RECORDS.

### Differences: what bringing up sol took beyond what Rig, chezmoi and the harness did themselves

| # | Symptom | Cause | Owner | Record |
| --- | --- | --- | --- | --- |
| D1 | 82 to 83 of 84 `rig upgrade` items fail; every Homebrew install fails | Command Line Tools for macOS 26.6 on macOS 27; Homebrew rebuilds `pkgconf` first and refuses | Kris at screen; detection tools-rig | none (SOL-CLT parked; proposed R1) |
| D2 | One shared cause is reported as 84 separate failures; a deleted app is shown as "failed"; a hand-run upgrade leaves no receipt | Rig reporting | tools-rig | none (proposed R2, the earlier RIG-UX) |
| D3 | Telegram fails apply and upgrade | Declared from the App Store, but the cask copy was present and was later deleted by hand | chezmoi catalogue, Kris's choice | none (SOL-TELEGRAM parked) |
| D4 | Self-updated or foreign-source apps (Spark, Slack, TickTick, OneDrive, Warp) fail apply | Rig counted only installs from its own provider | tools-rig | KI-TOOL-RIG-CORE-043 (done, pruned) |
| D5 | Insta360 Studio install fails | Empty root-owned bundle with a stale pkg receipt | Kris at screen (one-off) | none |
| D6 | The first `chezmoi apply` can't finish | Templates need tools that Rig hasn't installed yet | chezmoi | [KB-DOTFILES-UE-082](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-082-tolerate-missing-template-tools.md) |
| D7 | 1Password approval stalls over Screen Sharing | The app unlock method is Touch ID, which can't be used remotely | chezmoi guide | none (documented in the macOS workstation guide) |
| D8 | `op` over SSH: "no account found" | The CLI's app integration works only in the GUI session | chezmoi | none (KEYCHAIN-SSH token file, rig.chezmoi thread, done) |
| D9 | `op whoami` says "not signed in" while the CLI works | Wrong check; `op vault list` is the right one | chezmoi | [KB-DOTFILES-UE-090](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-090-close-rig-bring-up-gaps.md) |
| D10 | GitHub SSH from a sol SSH session: `Permission denied (publickey)` | The key's passphrase is in the login Keychain, which is locked over SSH; no agent | chezmoi | DOTFILES-UE-080 (local key copy, done, pruned) and agent forwarding (`2178335`); alias [KB-DOTFILES-UE-088](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-088-ssh-alias-for-sol.md) |
| D11 | `gh` not signed in; Claude Code, Codex and App Store sign-ins checked by hand | Credentials, with no written bring-up step | chezmoi | KB-DOTFILES-UE-090 |
| D12 | Claude Code: ECONNREFUSED | The Headroom `init-user` deployment isn't declared, and `dot_zsh/50_headroom` exports `ANTHROPIC_BASE_URL` regardless | chezmoi | KB-DOTFILES-UE-090 (adjacent [KB-DOTFILES-UE-087](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-087-manage-headroom-profile-arguments.md)) |
| D13 | `rig doctor`: `port.headroom` "conflicting (owner: Python)" while Headroom works | Port-owner matching doesn't recognise an interpreter entry point | tools-rig | none (proposed R3) |
| D14 | ki-coordinator output style missing, then a dead link | The chezmoi link points into a harness checkout that wasn't current | chezmoi | KB-DOTFILES-UE-090 |
| D15 | `ki-pmo` not linked; `ki-design-loop` dead; `ki doctor` fails | The chezmoi skill list lags the harness rename and lacks `ki-pmo` and `ki-pmo-design` | chezmoi | KB-DOTFILES-UE-090 (fix pending SKILLS-CONFIG) |
| D16 | Dead `ki-delegate` and `ki-design-loop` links stay; harness links take two forms | `ki repair` neither removes dead links into harness paths nor normalises them | tools-ki | none (proposed K1) |
| D17 | `chezmoi apply ~/.codex` fails; plain `chezmoi status` and `diff` abort, hiding 11 pending files | `codex-trusted-projects-json` line 23 reads the schema-1 `groups.default.members` after `8a58442` regenerated the mgit manifests; nothing renders templates in the gate | chezmoi (tools-mgit changelog) | KB-DOTFILES-UE-090 (fix pending CODEX-GROUPS) |
| D18 | 82 retired `kit`, `hnr` and `kis` paths and six retired OneDrive folders in Claude `additionalDirectories` | `bin/chezmoi/executable_json` merges by union, so entries are never removed | chezmoi | KB-DOTFILES-UE-090 (the six remain, OLD-SOURCE-DIRS) |
| D19 | `ki doctor`: HNR Harness missing | Declared, but no bring-up step runs `ki bootstrap` for it | chezmoi | KB-DOTFILES-UE-090 (SOL-HNR-HARNESS parked) |
| D20 | MCP servers wouldn't start after the fresh clone | No build step for launched MCP checkouts | chezmoi | KB-DOTFILES-UE-090 |
| D21 | An old mise `claude` shim came first on PATH | A global npm `claude-code` in an old mise Node; nothing prunes runtimes or flags the shadowing | chezmoi (prune), tools-rig (doctor) | KB-DOTFILES-UE-090; proposed R4 |
| D22 | 11 targets left unapplied after a source pull | No review prompt between pull and apply | chezmoi | KB-DOTFILES-UE-090 (related [KB-DOTFILES-UE-076](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-076-always-run-latest-source.md)) |
| D23 | `ki dev local on` rewrote the chezmoi-managed `~/.config/ki/config.toml` | Two owners for one file | chezmoi | [KB-DOTFILES-UE-089](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-089-ki-tool-release-channels.md) (SOL-KI-CONFIG-DRIFT parked) |
| D24 | Tools ran old Homebrew builds (Rig 0.5.0 rejected the firewall declaration); `mgit` linked into the old tree; checkouts behind | Dev-channel links and the scheduled pull aren't declared | chezmoi | KB-DOTFILES-UE-089 |
| D25 | mcporter launch agent kept exiting | mcporter 0.14.3 refuses a 0755 daemon folder | third party (mcporter) | none (one-off migrate) |
| D26 | Observatory not listening; doctor only said "start owner" | Its program folder didn't exist until the clone and `bun install` | tools-rig | [KI-TOOL-RIG-CORE-052](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-052-doctor-service-launch-prerequisites.md) |
| D27 | `mgit repair` refused to clone `hnr-principal` | The folder already held its chezmoi-managed `.mgit.toml` | tools-mgit | none (MGIT-PRESEED parked; proposed M1) |
| D28 | Territory selection and audits find no registry on sol | Nothing fills the ki registry on a new host | tools-ki | none (SOL-REGISTRY parked; proposed K4) |
| D29 | No `sources-*` OneDrive folders on sol | A per-machine sync choice in the app | Kris at screen | none (SOL-SOURCES parked) |
| D30 | WhatsApp MCP server: CONNECTION_CLOSED | No linked device on sol | Kris's decision | none (SOL-WHATSAPP parked) |
| D31 | Zed not on sol's Dock | Rig doesn't manage the studio Dock yet | tools-rig | [KI-TOOL-RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md) |
| D32 | Unclear whether Tailscale would return after a restart | Its own launch setting was off and the login-item approval couldn't be read | Kris at screen | KI-TOOL-RIG-CORE-046 (cancelled, carried into the Project note); restart test passed |
| D33 | Screen Sharing reachable beyond the tailnet | macOS listens on every interface | tools-rig | [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md) (awaiting review) |
| D34 | `ssh sol` fails | SSH config and `known_hosts` are keyed on the address | chezmoi | KB-DOTFILES-UE-088 |
| D35 | XDG variables unset in `zsh -c` | No `.zshenv` | chezmoi | fixed (`c0e1aee`); vega in [KB-DOTFILES-UE-084](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-084-render-zshenv-on-vega.md) |
| D36 | `beyond-compare`, `gitup`, `ollama`, `codex-multi-auth` and `skills-cli` reported missing | Intel-style artefact paths and npm observation | chezmoi catalogue | none (no longer in sol's `rig doctor` findings) |
| D37 | sol had no `~/.local/state/ki/agents/`; the decisions log had to be copied by hand | Run state is machine-local and not in Git | ki-agentic-harness | [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md) (note added) |
| D38 | A run's footer contradicted its brief's approved authority, and named a different report path | `ki agent launch` appends a fixed footer | tools-ki, ki-agentic-harness | none (proposed K2) |
| D39 | A reused run name overwrote an earlier report | `ki agent` accepts an existing run name | tools-ki | none (proposed K3) |
| D40 | sol prints BST while the thread reports CEST | sol's time zone is Europe/London | Kris | none (guide note) |
| D41 | Homebrew warns about the untrusted `domt4/autoupdate` source | A leftover source | Kris | none (SOL-AUTOUPDATE-TAP) |

## What is in progress

Nothing is running. The guide draft is uncommitted in the thread folder, as the brief asked. The commits in chezmoi (3) and `ki-agentic-harness` (2) are local and wait for a push decision from the coordinator.

**Outstanding - no action requested now:**

- These thread queries are still open: CODEX-GROUPS, SKILLS-CONFIG and OLD-SOURCE-DIRS from the sol-fix report.
- These stay parked: SOL-CLT, SOL-TELEGRAM, SOL-HNR-HARNESS, SOL-WHATSAPP, SOL-KI-CONFIG-DRIFT, SOL-REGISTRY, SOL-SOURCES and MGIT-PRESEED.
- KB-DOTFILES-UE-090 records these; it fixes none of them.
- The four failing chezmoi tests were already failing before this run.

## Outstanding queries

### RIG-GUIDE-HOME - Where the onboarding guide should live

**Summary:** the draft is a procedure for Kris's own estate. It spans chezmoi profiles, Rig, the KI tools, the harness and thread hand-off, so it is not portable Rig documentation.

**Need from you:** choose its permanent home.

**Recommendation:** make it `docs/guides/user/new-rig.md` in the chezmoi repository, and replace the "Set up a new machine" section of `macos-workstation.md` with a link to it. The reasons:

- chezmoi already owns Kris's Rig catalogue, profiles and reviewed procedures.
- The existing new-machine notes live there.
- KB-DOTFILES-UE-090 will change the same steps.
- It reaches every Rig through the source.

The tools-rig getting-started guide stays generic and public. ki-principal would need an Enactment record for `Pillars`.

### RIG-RECORDS - Proposed tools-rig records

**Summary:** four tools-rig gaps have no record. None was created, under the state-of-play rule:

- **R1 Command Line Tools doctor check:** `rig doctor` notices Command Line Tools older than the running macOS and names it as the shared cause, before an upgrade starts (D1).
- **R2 Shared-failure reporting:** `apply` and `upgrade` stop or collapse when a provider fails the same way for every item, report a removed declared app as missing rather than failed, and keep a receipt for interactive runs (D2).
- **R3 Interpreter port owners:** port-owner matching accepts an interpreter entry point, such as Headroom running as Python, so `port.headroom` stops reporting a false conflict (D13).
- **R4 PATH shadowing check:** `rig doctor` warns when another PATH entry shadows a declared tool's executable, such as a mise shim ahead of Homebrew (D21).

**Need from you:** whether to capture them as triage records in tools-rig.

**Recommendation:** capture R1 and R3 now, because both hit every new or upgraded Mac and both are small doctor changes. Fold R2 and R4 into the Project note's Notes until the roadmap burn-down allows new records.

### TOOL-RECORDS - Proposed tools-ki and tools-mgit records

**Summary:** five gaps in other tool repositories have no record:

- **K1 (tools-ki):** `ki repair` removes or offers to remove dead skill links into harness paths, and normalises link forms (D16).
- **K2 (tools-ki and ki-agentic-harness `ki-delegation`):** the launch footer follows the brief's authority tier and report path (D38).
- **K3 (tools-ki):** `ki agent` refuses or suffixes a reused run name (D39).
- **K4 (tools-ki):** a bring-up path fills the ki registry on a new host (D28).
- **M1 (tools-mgit):** `mgit repair` clones into a folder holding only its `.mgit.toml`, reworking the saved MGIT-PRESEED patch (D27).

**Need from you:** whether to capture any of them.

**Recommendation:** capture K2 and K3 in tools-ki, because both have already cost a report in this thread. Leave K1, K4 and M1 with their parked queries (SKILLS-CONFIG, SOL-REGISTRY and MGIT-PRESEED).

```text
RIG-GUIDE-HOME - move the guide to docs/guides/user/new-rig.md in the chezmoi repository, link it from macos-workstation.md in place of "Set up a new machine", commit locally under KB-DOTFILES-UE-090
RIG-RECORDS - capture R1 (Command Line Tools doctor check) and R3 (interpreter port owners) as tools-rig triage records; note R2 and R4 in the mac-studio-bootstrap Project note
TOOL-RECORDS - capture K2 (footer follows authority tier) and K3 (no reused run names) as tools-ki triage records; leave K1, K4 and M1 with SKILLS-CONFIG, SOL-REGISTRY and MGIT-PRESEED
```
