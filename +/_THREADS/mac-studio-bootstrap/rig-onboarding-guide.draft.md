# Bring a new Mac up as a Rig - draft

Draft from the mac-studio-bootstrap thread, 2026-10-14. It sets out the order that actually worked when `sol`, the Mac Studio, was brought up as the second Rig after the laptop, with the hand repairs that order needed. Not yet reviewed; its permanent home is an open question (`RIG-GUIDE-HOME`).

A Rig is one of Kris's workstations brought up with Rig (`tools-rig`) and the chezmoi source (`krisb/dotfiles`). A thread-ready Rig can host a coordinating Claude Code thread and its detached `ki agent` runs.

Each step is marked:

- **[screen]** - Kris, at the machine's own screen or over Screen Sharing in the logged-in session. Credentials, admin passwords, macOS prompts and anything needing the unlocked login Keychain belong here.
- **[remote]** - an agent over SSH from another Rig, with Kris's approval for that run. SSH sessions run outside the logged-in GUI session, so the login Keychain is locked and the 1Password desktop integration is unreachable there.

Host addresses are not written here. Use the host's tailnet name or the entry in the managed SSH configuration.

## Stage 1 - First login and macOS [screen]

1. Create the user account `krisbrown` and sign in to the Apple Account (needed for the App Store and for Handoff and Universal Control).
2. Turn on FileVault and keep the recovery key in 1Password. After any restart, nothing - Tailscale included - comes up until someone unlocks the disk at the screen.
3. Install every macOS update offered.
4. **Install the Command Line Tools that match this macOS.** Software Update offers "Command Line Tools for Xcode NN"; if it doesn't, run `sudo rm -rf /Library/Developer/CommandLineTools` and then `sudo xcode-select --install`. Repeat this after every major macOS upgrade.
5. Set the time zone you want reports to use (System Settings > General > Date & Time).
6. Install Homebrew by its native procedure.
7. Install and sign in to the 1Password app. In Settings > Developer, turn on "Integrate with 1Password CLI". While you will approve prompts over Screen Sharing, also turn off Touch ID and Apple Watch unlock in Settings > Security, so the prompt asks for the account password; turn them back on later.
8. Install Tailscale (the standalone app), sign in, and turn on "Launch at login". In System Settings > General > Login Items, check that Tailscale has both "Open at Login" and "Allow in the Background".
9. Turn on Remote Login (System Settings > General > Sharing), allowing only your own user. Turn on Screen Sharing only for a desktop that stays at home, as the macOS workstation guide describes, with "Only these users" and no VNC password.
10. Sign in to OneDrive and make the `sources-<group>` folders available on this Mac. The first chezmoi apply copies the GitHub SSH key from OneDrive, and repositories use the source stores.

**Check:** `xcode-select -p` prints a path and `brew doctor` raises no Command Line Tools warning; `tailscale status` lists the machine; from another Rig, `ssh` to the new host by its tailnet name answers.

**Pitfalls:**

- Old Command Line Tools after a macOS upgrade break every Homebrew install and upgrade, because Homebrew rebuilds `pkgconf` first and refuses. On `sol` this was 82 to 83 of 84 `rig upgrade` failures, each reported separately.
- Tailscale's own launch setting can stay off even when the Login Items switch is on. Only a restart test proves it (Stage 7).

## Stage 2 - chezmoi, first pass [screen]

1. `brew install chezmoi gh`, then `gh auth login` (GitHub.com, browser) and let it set up Git's credentials.
2. Initialise with the Rig profile: `chezmoi init --promptString rigProfile=<laptop|studio> https://github.com/krisb/dotfiles.git`. An unknown or missing profile stops the apply. (Unverified: the reports don't say how `sol`'s first clone authenticated. HTTPS through `gh` avoids needing the SSH key, which only arrives with the first apply.)
3. `chezmoi apply --keep-going`. The first apply cannot finish: some templates need tools Rig has not installed yet.
4. Load the GitHub key into the Keychain once: `ssh-add --apple-use-keychain ~/.ssh/kris@kris.me.uk`, then `ssh -T git@github.com` should greet `krisb`.

**Check:** `ls -l ~/.ssh/kris@kris.me.uk*` shows modes 600 and 644; `chezmoi status` lists only the targets that waited for tools.

**Pitfalls:**

- **Do not start Claude Code yet.** The applied `~/.zsh/50_headroom` sends Claude Code to the Headroom proxy on port 8787, which does not exist until Stage 4, so `claude` fails with ECONNREFUSED. If you need it before then, use `env -u ANTHROPIC_BASE_URL claude`.
- The ki-coordinator output style is a link into the `ki-agentic-harness` checkout, which is not cloned until Stage 5. Until then it is a dead link; nothing warns you.
- Accepting a host key at a prompt doesn't last: chezmoi manages `known_hosts` and overwrites it on the next apply. Add new host keys to the source.

## Stage 3 - Rig [screen]

1. Sign in to the Mac App Store.
2. Keep sudo fresh for the long run, from the same window: `sudo -v; while sudo -n true; do sleep 60; kill -0 $$ || exit; done 2>/dev/null &`.
3. `rig apply --dry-run`, review it, then `rig apply`. Click through the system-extension and privacy prompts as they appear. Never accept a restart prompt unless you can unlock FileVault in person.
4. `chezmoi apply` again, to render what the first pass skipped.
5. `mise install` (Rig doesn't install `rust` or the `cargo:` tools; this compiles them and takes a while).
6. `mise prune`, then `which -a claude`: the first entry must be `/opt/homebrew/bin/claude`.

**Check:** `rig doctor` - read every finding rather than counting them. `chezmoi status` should be empty, or name only targets you have a reason for.

**Pitfalls:**

- An app that has already updated itself past the catalogued version may make its installer refuse (OneDrive did). That is harmless; don't uninstall it.
- An app bound to one source but present from another (Telegram as a Homebrew cask where Rig expects the App Store copy) fails until you choose one source.
- If `chezmoi status` or `chezmoi diff` aborts with a template error, one bad template is hiding all other drift. On `sol` the Codex trusted-projects template still read the old mgit manifest schema. Check targets one at a time (`chezmoi status ~/.claude ~/.config ...`) to see the rest, and report the template.
- `rig upgrade` run by hand leaves no receipt; copy its summary if it fails.

## Stage 4 - Headroom [screen]

1. From a plain Terminal window, not from inside Claude Code, create the `init-user` deployment with the `headroom install apply` command in the chezmoi Headroom guide (`docs/guides/tools/headroom.md`, "Deployment ownership").
2. `lsof -nP -iTCP:8787 -sTCP:LISTEN` shows a listener, and `"$HOME/.local/bin/headroom" doctor` passes.

**Check:** a new terminal's `claude` starts and answers.

**Pitfalls:**

- `rig doctor` then reports `port.headroom` as "conflicting (owner: Python)". Headroom runs as a Python process; the finding is false. Leave it: the proxy is connection-critical.
- Undo is `"$HOME/.local/bin/headroom" install remove --profile init-user`; while the proxy is down, `env -u ANTHROPIC_BASE_URL claude` still works.

## Stage 5 - Sign-ins [screen]

Credentials stay manual. With the login Keychain unlocked, in one sitting:

1. `gh auth status`; if it fails, `gh auth login`.
2. 1Password CLI: `op vault list` lists your vaults. **Do not use `op whoami` as the check**: under the desktop-app integration it reports "not signed in" even when the CLI works.
3. Claude Code: run `claude` in `~/workspaces/knowledge-islands/ki-principal`, check `/status`; only if signed out, `/login`.
4. Codex: run `codex` once and confirm it is signed in.
5. Zed: open the Agent panel and check that both Claude Code and Codex start; the first start downloads the ACP adapters.

**Check:** each of the five answers without a sign-in prompt in a fresh terminal.

## Stage 6 - Workspaces and KI tools [remote]

An agent does this over SSH with agent forwarding from the connecting Rig (forwarding is configured for named hosts only, never `Host *`). Kris approves the run, including Git fetches and any downloads.

1. **Clone the workspaces.** For each group, `mgit repair --apply` clones the declared repositories into `~/workspaces/<group>/<repo>`. If a folder already holds only its chezmoi-managed `.mgit.toml`, mgit refuses to clone over it: initialise the repository in place and check out `main`.
2. **Pull the harness, then re-apply its links.** With `knowledge-islands/ki-agentic-harness` cloned and current, `chezmoi apply ~/.claude` makes the output-style link resolve.
3. **Build and link the KI tools (dev channel).** In `tools-ki`, `tools-rig`, `tools-mgit`, `tools-techne` and `tools-git-almanac`: `bun install --frozen-lockfile` where there is a lockfile, then `./install.sh --link`. Homebrew releases stay underneath as the fallback.
4. **Build the MCP checkouts** that the Claude and Codex configurations launch (`bun install` and their build), so each has its `dist/`.
5. **Harness local mode and bootstrap.** `ki dev local on knowledgeislands/ki-agentic-harness`, and `ki bootstrap` for every harness the ki configuration declares (on `sol` the HNR Harness was never installed).
6. **mcporter.** If its launch agent keeps exiting, `mcporter daemon migrate --stop-legacy --confirmed-drained` fixes the daemon folder's permissions; restart the launch agent.
7. **Observatory.** `bun install` in `knowledge-islands/apps-observatory.local`, then restart its launch agent.
8. **Skills.** `ki doctor` must be healthy, and `ki-pmo` and `ki-pmo-design` must be linked in `~/.claude/skills`. Find dead links with `find ~/.claude/skills ~/.agents/skills -type l ! -exec test -e {} \; -print`.
9. **Registry.** Register the checkouts with `ki registry add` (dry run first, compared with the laptop's registry), so territory selection and repository audits work.

**Check:** `rig doctor`, `ki doctor`, `mcporter list` and `chezmoi status` all read as expected; `ki`, `rig`, `mgit`, `techne` and `git-almanac` resolve to `~/.local/bin` and report their versions.

**Pitfalls:**

- `ki dev local on` rewrites `~/.config/ki/config.toml`, which chezmoi manages. Don't apply that target afterwards until the source catches up, or local mode is undone.
- The chezmoi skill list may lag the harness (`ki-design-loop` was renamed `ki-pmo-design`, and `ki-pmo` is missing). Fix it in the source, then `chezmoi apply ~/.config/ki/config.toml` and `ki repair --apply`; don't hand-link.
- A previously used Mac keeps old trees and their trail: dead skill links into old layouts, an old `mgit` link, and dozens of stale Claude Code `additionalDirectories`, which chezmoi never removes. Retire the old trees by moving them aside (not deleting), then clean the settings with a backup.
- Nothing yet pulls `main` or rebuilds on a schedule on the dev channel, so checkouts and tools drift until someone pulls.

## Stage 7 - Thread-ready [screen, then remote]

1. **[remote]** Run the readiness checks: `rig doctor`, `ki doctor`, `chezmoi status`, `mcporter list`, `which -a claude`, `ls -L ~/.claude/output-styles/ki-coordinator.md`, `ki agent status`, and Headroom listening on 8787.
2. **[screen]** Restart test, with Kris present: restart, unlock FileVault, and check that Tailscale reconnects on its own and SSH from another Rig works. Any later restart of a remote Rig needs Kris's approval and presence.
3. **[screen]** Start a Claude Code thread in `ki-principal` with the ki-coordinator output style.

**Check:** the thread starts with the coordinator style, `ki agent status` answers, and an approved trial run can launch and report.

**Moving a thread to the new Rig:** on the old host, launch nothing new and let running agents finish; write queued work back into the checkpoint; commit and push the checkpoint and thread folder; copy the run's decisions log (`~/.local/state/ki/agents/<run>/decisions.md`, machine-local and not in Git) and its reports to the same path on the new host; then pull `ki-principal` there and paste the resume line. The checkpoint should say which host now holds the live decisions log.

## Afterwards

- After every macOS upgrade, update the Command Line Tools before the next `rig upgrade`.
- After a chezmoi source pull, review `chezmoi diff` and apply; a pull alone changes nothing on the machine.
- The daily `rig-update` job runs whichever `rig` is first on PATH; on a dev-channel Rig that is the checkout.

## Known gaps and their records

| Gap | Record |
| --- | --- |
| Headroom deployment, sign-ins step and check, output-style ordering, skill list, template render check, stale Claude directories, harness bootstrap and MCP builds, mise shims, unapplied pulls | KB-DOTFILES-UE-090 (chezmoi, triage) |
| First chezmoi apply needs `--keep-going` | KB-DOTFILES-UE-082 (chezmoi) |
| `ssh <host>` by name | KB-DOTFILES-UE-088 (chezmoi, triage) |
| Dev-channel sync, declared tool links, `ki dev local` config rewrite | KB-DOTFILES-UE-089 (chezmoi, triage) |
| Moving a thread and its decisions log | KI-HARNESS-GOV-189 (ki-agentic-harness, triage) |
| Studio Dock items | KI-TOOL-RIG-CORE-042 (tools-rig) |
| Tailnet-only Screen Sharing | KI-TOOL-RIG-CORE-047 (tools-rig) |
| Doctor service launch prerequisites | KI-TOOL-RIG-CORE-052 (tools-rig, triage) |
| Command Line Tools detection, shared-failure reporting, Headroom port owner, PATH shadowing | proposed only, not yet recorded (`RIG-RECORDS`) |
