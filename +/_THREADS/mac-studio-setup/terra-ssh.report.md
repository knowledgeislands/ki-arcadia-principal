# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › terra-ssh

**Run report 02:02 BST · last mark 17:47 BST**

---

## Done

- **SSH from sol to terra doesn't work yet.** terra is on the tailnet as `terra` at `100.96.126.29` and answers Tailscale ping directly over the LAN in 9 ms, but nothing listens on port 22 (`nc -z -G 3` fails on both the name and the address). That's expected while Remote Login is off. Kris approved turning it on on 2026-10-15.
- **sol already has the right key.** Its agent holds Kris's own RSA key `SHA256:CrQToHMFBUfiWYY2wHPzvnk3PUN2Z3cR/PWouZUQkdk`, from `~/.ssh/kris@kris.me.uk`. That's the same key terra uses to reach sol: sol's `authorized_keys` holds just this key, and its comment is terra's OneDrive key path. No 1Password SSH agent is in use. For terra, `ssh -G` gives user `krisbrown` and `forwardagent no`. That's correct, because the agent-forwarding decision (2026-10-09 to 2026-10-11) covers sol only, and terra should stay without forwarding.
- **Nothing in chezmoi covers terra.** The source has no `Host terra` block and no terra host key; `known_hosts` holds only sol, GitHub and GitLab. [KB-DOTFILES-UE-088](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-088-ssh-alias-for-sol.md) puts a terra alias explicitly out of scope. Its `Host sol 100.90.130.74` block is in the source (`7b11f16`) but not yet applied on sol. Two consequences follow. sol reaches terra by address, `krisbrown@100.96.126.29`. And because chezmoi manages `known_hosts`, the terra host key accepted in the test below gets overwritten at the next `chezmoi apply` (query TERRA-HOSTKEY). `authorized_keys` isn't managed by chezmoi, so a key added on terra stays put.
- **The firewall leaves port 22 alone.** The tailnet-only pf rules ([KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md)) never touch port 22, so turning on Remote Login on terra opens SSH to the LAN as well as the tailnet. sol is set up the same way: stock macOS `sshd` with password login through PAM still allowed, and SSH limited to `krisbrown`.
- **No files, keys, Keychain, ssh config or settings were changed, and nothing was committed.** No private key material was printed.

### Instructions for Kris at terra's screen

**1. Turn on Remote Login**

1. Open System Settings > General > Sharing.
2. Turn on **Remote Login**.
3. Click (i) next to it.
4. Leave **Allow full disk access for remote users** off.
5. Under **Allow access for**, choose **Only these users**. Leave only your own account (`krisbrown`) in the list: select any other entry, such as Administrators, and click −.
6. Click Done.

**2. Authorise sol's key (only if it isn't there already)**

Open Terminal on terra and run:

```sh
mkdir -p ~/.ssh && chmod 700 ~/.ssh
ssh-keygen -lf ~/.ssh/authorized_keys 2>/dev/null | grep CrQToHMF
```

If a line with `CrQToHMF` appears, the key is already authorised; go to step 3. Otherwise, back up the file, add the key from terra's agent, and check it:

```sh
[ -f ~/.ssh/authorized_keys ] && cp -p ~/.ssh/authorized_keys ~/.ssh/authorized_keys.pre-terra-ssh
ssh-add -L | grep -F 'kris@kris.me.uk' >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
ssh-keygen -lf ~/.ssh/authorized_keys | grep CrQToHMF
```

The last command should print one line, `2048 SHA256:CrQToHMFBUfiWYY2wHPzvnk3PUN2Z3cR/PWouZUQkdk … (RSA)`. If `ssh-add -L` says the agent has no identities, run `ssh -T git@github.com` once to load the key, then repeat the `ssh-add -L` line.

**3. Note terra's host key so you can check it from sol**

```sh
ssh-keygen -lf /etc/ssh/ssh_host_ed25519_key.pub
```

Keep the `SHA256:…` value in view for the test.

**4. Test from sol** (at sol's screen, or in any sol session that has Kris's key)

```sh
ssh -o PasswordAuthentication=no -o KbdInteractiveAuthentication=no krisbrown@100.96.126.29 true; echo "exit $?"
```

The two options make the test fail rather than fall back to a password, so success proves the key works. The first time, ssh asks you to confirm terra's ED25519 host key. Check that the fingerprint matches step 3, then type `yes`.

**Success looks like this:** `Warning: Permanently added '100.96.126.29' (ED25519) to the list of known hosts.`, then `exit 0`, with no password prompt. Run it again and you get just `exit 0`. If you see `Permission denied (publickey…)`, the key from step 2 is missing; recheck step 2. If you see `Connection refused` or a timeout, Remote Login is still off; recheck step 1.

**Undo**

1. On terra, open System Settings > General > Sharing and turn off **Remote Login**. This is enough on its own: nothing can SSH in while it's off.
2. To remove the key too, restore the backup if step 2 made one: `mv ~/.ssh/authorized_keys.pre-terra-ssh ~/.ssh/authorized_keys`. If there was no file before step 2, remove it instead: `rm ~/.ssh/authorized_keys`.
3. On sol, the host-key line the test added can stay; the next `chezmoi apply` removes it anyway.

## In Progress

Nothing from this run. Once the test returns `exit 0`, TERRA-READ can run from sol over SSH, read-only, under the 2026-10-15 decision.

## Queries

### TERRA-HOSTKEY - keep terra's host key and give it an alias on sol

**Context.** chezmoi manages `~/.ssh/known_hosts`, so the terra key accepted in the test is wiped at the next `chezmoi apply`. After that, the next SSH to terra asks again, and agents running non-interactively fail. sol has no `Host terra` alias; [KB-DOTFILES-UE-088](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-088-ssh-alias-for-sol.md) put one out of scope.

**Query.** Should terra's host key, and an alias, be added to the chezmoi source?

**Options.** a) (recommended) After the test passes, an agent on sol copies terra's new `known_hosts` line into `private_dot_ssh/private_known_hosts` and adds a `Host terra 100.96.126.29` block to `private_dot_ssh/private_config` with `HostName 100.96.126.29`, `User krisbrown` and no agent forwarding. Both go in as a widening of KB-DOTFILES-UE-088, with that record's test extended, the chezmoi gate run and a local commit. Kris then applies it on each Mac using UE-088's restore path. b) Add the host key only, with no alias. c) Leave it and accept the host key again after each apply.

```text
TERRA-HOSTKEY - a) after the test passes, an agent on sol copies terra's new known_hosts line into private_dot_ssh/private_known_hosts and adds a Host terra 100.96.126.29 block (HostName 100.96.126.29, User krisbrown, no agent forwarding) to private_dot_ssh/private_config as a widening of KB-DOTFILES-UE-088, extends its test, runs the chezmoi gate and commits locally; Kris applies on each Mac with UE-088's restore path
```

```text
╭─ run report · 2026-10-15T01:02:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · 1 query                 │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] terra-ssh finished, nothing running from this run
- [queries] TERRA-HOSTKEY
- [waiting on Kris] Remote Login on terra, the key check and the test from sol (instructions under Done)
- [uncommitted] this report (state folder and thread folder)
- [unpushed] nothing new from this run

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
