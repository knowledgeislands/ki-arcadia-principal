# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › readonly-checks

**Run report 02:43 BST · last mark 17:47 BST**

---

## Done

All three checks ran read-only from `sol`, with terra reached over SSH, between 02:39 and 02:43 BST. Nothing was applied, bound, pushed or committed. No secrets were read. Authority: Kris's decisions of 2026-10-15 on SSH-TAILNET, TERRA-HARNESS-AHEAD and REGISTRY-STORES.

- **SSH-TAILNET: both Macs accept passwords.** Each Mac runs the stock macOS SSH configuration: `sshd_config` holds only `Include /etc/ssh/sshd_config.d/*` and `AuthorizedKeysFile`, and the one drop-in, `100-macos.conf`, sets `UsePAM yes`. The defaults therefore leave password and keyboard-interactive logins on. The probe from `sol` to `100.90.130.74` and to `100.96.126.29` offered `publickey,password,keyboard-interactive` on both. It was refused only because the probe sent no password. Remote Login is limited to `krisbrown`, and port 22 stays outside the tailnet-only firewall as designed, so the login password is enough to log in to either Mac from the LAN. A fix was tested offline in a temporary folder, now deleted: a drop-in `050-ki-key-only.conf` setting `PasswordAuthentication no` and `KbdInteractiveAuthentication no` passes `sshd -t`, and `sshd -T` then reports both as `no`, with public-key login unchanged. macOS starts `sshd` fresh for each connection, so the drop-in takes effect without a restart and open sessions continue. Rig has no SSH-server resource (its only system-domain resource is the firewall, under the proposed [ADR-KI-TOOL-RIG-009](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/decisions/ADR-KI-TOOL-RIG-009-system-domain-resources-under-an-attended-grant.md)), and chezmoi has no `sudo` script yet. The query is below.
- **TERRA-HARNESS-AHEAD: GitHub does not have `8a453bcd`.** The fetch on `sol` succeeded. GitHub's `main` is still `fcad8a1e`, and `8a453bcd` is unknown on `sol`. On terra, `ki-agentic-harness` is now **11** commits ahead, not 8, and none behind. The extra three were committed on terra at 02:20 to 02:23 BST today, by another session: "reserve review verification effects", "prepare verification effects checklist" and "preserve blocked verification checklist patch" (top `d0c94558`). An untracked `+/_THREADS/` sits beside them. Pushing from terra would publish all 11. The steps are in the query below.
- **REGISTRY-STORES: terra-read missed the folders because of the SSH privacy limit.** Over SSH, terra lists `~/Library/CloudStorage/OneDrive-Personal` itself but refuses to open it ("Operation not permitted", macOS privacy protection), so terra-read's search silently found nothing. Kris is right that the folders exist on both Macs.
- **REGISTRY-STORES: what the real difference is.** Each of the eight principals (`er`, `hnr`, `ki`, `legal`, `personal`, `si`, `tmx`, `va`) declares a `sources` store in its tracked `.ki.toml`. A declaration says the repository has a source store; a **binding** tells `ki` on one machine where that store is. Bindings are machine-local and live only in `~/.local/state/ki/registry.toml`. terra's registry has all eight bindings, each pointing at the matching `OneDrive-Personal/sources-*` folder. sol's has none, so on sol `ki repo store list` shows `sources: unbound` for all eight principals. As a result, tools that follow bindings, such as the source-store scope of `ki` searches and generated VS Code workspaces, cannot see the OneDrive sources on sol.
- **REGISTRY-STORES: what wrote terra's bindings.** `ki` wrote them, not chezmoi. chezmoi does not manage `~/.local/state/ki/`. Only the `ki repo store bind <role> <path> --write` (or `create`) code path writes a `[repositories."…".stores]` table. terra's 12 October backups already held seven bindings, so they date from that earlier `ki` work; terra's shell history shows no hand-typed bind.
- **REGISTRY-STORES: the step that gives sol the same.** On sol, `ki repo store bind --repo <principal checkout> sources <OneDrive folder>` previews each of the eight bindings cleanly ("would bind …"). Adding `--write` writes them. The previews left `registry.toml` unchanged. sol also has a ninth folder, `sources-hnr-principal`, last changed April 2026 and holding one item. No repository declares it, and it is outside this step.

## In Progress

Nothing is running. This report is uncommitted, in the state folder and the thread folder.

## Queries

### SSH-TAILNET - Turn off password logins on both Macs

**Context.** Both Macs offer password and keyboard-interactive SSH logins on port 22, which is open to the LAN by design. Agents and both Macs already log in by key. A tested drop-in closes the gap. Because macOS starts SSH fresh for each connection, a bad change affects only new logins, and Kris can always undo it at the Mac's screen.

**Query.** How should password logins be switched off?

**Options.** a) (recommended) Widen [KB-DOTFILES-UE-088](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-088-ssh-alias-for-sol.md), which already covers SSH between the Macs. chezmoi gets a `run_onchange_after_` script that writes `/etc/ssh/sshd_config.d/050-ki-key-only.conf` (`PasswordAuthentication no`, `KbdInteractiveAuthentication no`). It checks the file with `sshd -t` before installing it, and it uses `sudo -n` only, so it skips with a message, rather than hanging, under a remote `chezmoi apply`. A test covers it, the gate runs and the commit stays local. Kris then applies at each Mac's screen using this restore path: keep the screen session open; from the other Mac, check a key login works and a password probe offers only `publickey`; if either fails, `sudo rm /etc/ssh/sshd_config.d/050-ki-key-only.conf` restores the old behaviour for the next connection. b) A Rig SSH-server resource under ADR-KI-TOOL-RIG-009. This is a new resource type, so it would need an exception to burn-down. c) Kris writes the drop-in by hand at each screen now, undeclared, so a rebuilt Mac would lose it. d) Leave password logins on.

### TERRA-HARNESS-AHEAD - Push terra's 11 harness commits

**Context.** GitHub's `ki-agentic-harness` `main` is `fcad8a1e`, so terra is ahead and not behind. Three of the 11 commits come from another session on terra in the last half hour. Pushing them publishes that session's work, which the standing state-of-play rule allows when the checks pass, naming it.

**Query.** Should Kris push all 11 from terra's screen now?

**Options.** a) (recommended) Yes. At terra's screen, first make sure no agent is still working in `ki-agentic-harness`, then:

1. `git -C ~/workspaces/knowledge-islands/ki-agentic-harness pull --ff-only --no-rebase`
   Expect: `Already up to date.`
2. `git -C ~/workspaces/knowledge-islands/ki-agentic-harness status -sb | head -1`
   Expect: `## main...origin/main [ahead 11]`. If it says `behind`, or ahead by a number other than 11, stop and tell the thread.
3. `git -C ~/workspaces/knowledge-islands/ki-agentic-harness log --oneline -1`
   Expect: `d0c94558 docs(ki-repo): preserve blocked verification checklist patch`
4. `git -C ~/workspaces/knowledge-islands/ki-agentic-harness push origin main`
   Expect: the push hooks pass, then `fcad8a1e..d0c94558  main -> main`.

An agent on `sol` then runs `pull --ff-only --no-rebase` and confirms that `origin/main` contains `8a453bcd`. b) Push only up to `8a453bcd` (`git push origin 8a453bcd:main`) and leave the other session's three commits on terra. c) Wait.

### REGISTRY-STORES - Bind sol's eight source stores

**Context.** The eight principals declare a `sources` store, and the folders exist on `sol`. Only the machine-local binding is missing. `ki` writes it to `~/.local/state/ki/registry.toml`, with no chezmoi change. All eight previews on `sol` are clean. Kris's standing rule requires the repository's approval before a source-store binding. Each principal's tracked `.ki.toml` declaration is that approval, and no chezmoi diff applies.

**Query.** Should `sol` get the same eight bindings as terra?

**Options.** a) (recommended) Yes. An agent on `sol` copies `registry.toml` to `registry.toml.bak-2026-10-15`, then runs `ki repo store bind --repo <checkout> sources <folder> --write` for each of the eight, using terra's exact folders. It confirms that `ki repo store list` shows all eight `sources` as bound and that `ki doctor` has no failures. To restore, copy the backup back, or run `ki repo store unbind sources` per repository. b) Kris runs the eight commands at `sol`'s screen. c) Leave `sol` unbound and record the difference as intended.

```text
SSH-TAILNET - a) widen KB-DOTFILES-UE-088: a chezmoi run_onchange_after_ script installs /etc/ssh/sshd_config.d/050-ki-key-only.conf (PasswordAuthentication no, KbdInteractiveAuthentication no), validated with sshd -t and using sudo -n only so remote applies skip rather than hang; test, gate, local commit; Kris applies at each Mac's screen keeping the screen session open, checks key login works and a password probe offers only publickey from the other Mac, and restores with sudo rm /etc/ssh/sshd_config.d/050-ki-key-only.conf if either fails
TERRA-HARNESS-AHEAD - a) at terra's screen, with no agent working in ki-agentic-harness: pull --ff-only --no-rebase (expect Already up to date), status -sb (expect ahead 11, not behind, else stop), log -1 (expect d0c94558), push origin main (expect fcad8a1e..d0c94558); then an agent on sol pulls --ff-only --no-rebase and confirms origin/main contains 8a453bcd
REGISTRY-STORES - a) an agent on sol backs up ~/.local/state/ki/registry.toml to registry.toml.bak-2026-10-15, runs ki repo store bind --repo <checkout> sources <OneDrive-Personal/sources-*> --write for the eight principals using terra's paths, and confirms ki repo store list shows all eight bound and ki doctor has no failures; restore by copying the backup back
```

```text
╭─ run report · 2026-10-15T01:43:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · 3 checks read-only      │
│  █  █ █▄▄▄ ▄▄▄█   █    · 3 queries               │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] readonly-checks finished; nothing running from this run
- [waiting on Kris] terra-screen steps: TERRA-HARNESS-AHEAD
- [queries] SSH-TAILNET, TERRA-HARNESS-AHEAD, REGISTRY-STORES
- [unpushed] terra ki-agentic-harness main (11)
- [uncommitted] this report (state folder and thread folder)

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
