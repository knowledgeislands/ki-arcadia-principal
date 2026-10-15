# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) › hostkey-check

**Run report at 10:51 BST · last mark 17:47 BST**

---

## Done

- **What `37295bc` already covered.** The other session's commit added all three of terra's host keys (ed25519, RSA and ECDSA) under `100.96.126.29` to `private_dot_ssh/private_known_hosts`, and they are already live on sol. That covers the brief's known_hosts step. It did not add the alias, the record, the test or the guide.
- **terra's host key checks out.** `ssh-keyscan -t ed25519 100.96.126.29` gives `SHA256:MkvjOvjMezcavRL4O1p4lJT6BTxj7p7306mJxHjzMlY`. That matches the key Kris accepted in sol's live `~/.ssh/known_hosts` and the source entry, and the key line is the same byte for byte. The RSA and ECDSA fingerprints in the source match sol's live entries too.
- **`ssh terra` is in source.** Committed in chezmoi as `ace1863` (local only, not pushed). `private_dot_ssh/private_config` now has `Host terra` (HostName `100.96.126.29`, User `krisbrown`, ForwardAgent `no`) beside `Host sol`. Checked against the source file with `ssh -G -F`: `terra` gives `100.96.126.29`, `krisbrown` and `forwardagent no`, and `sol` and `krisbrown@100.90.130.74` still give `forwardagent yes`.
- **[KB-DOTFILES-UE-088](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-088-ssh-alias-for-sol.md)** now covers terra in its goal, scope, current state, verification and restore path. The record keeps its file name and title. `tests/ssh-sol-alias.test.mjs` now also checks the terra block and terra's known_hosts entry. The remote-access section of [macOS workstation](/Users/krisbrown/.local/share/chezmoi/docs/guides/user/macos-workstation.md) shows `ssh terra` and says that terra does not get the agent.
- **Checks.** `rumdl check .` is clean. `node --test tests/*.test.mjs` gives 241 pass and 2 fail, the two known failures (`ki-self-skill` and the wrapper-reporter exit-40 test). `ki repo audit --repo .` has its one known failure, the missing `.claude/skills/ki-self` projection. No `rig` declaration was touched, so `rig doctor` was not needed. The working tree is clean, no Git lock files are left and the temporary folder is deleted.
- **Not done by this run.** SSH-TAILNET (decision 104, the `sshd_config.d` key-only drop-in) widens the same record but was not in this brief. This run did not touch it.

## In Progress

Nothing is running from this run.

## Queries

**HOSTKEY-APPLY**

**Context:** chezmoi `main` on sol is 5 commits ahead of `origin`, ending with `ace1863`. On sol, `~/.ssh/config` is still waiting for the apply, which brings in both the earlier `Host sol` block and the new `Host terra` block. terra needs the push first. It also gets terra's own known_hosts entries, which do no harm there. `~/.ssh/config` is connection-critical, so the restore path from UE-088 runs from a terminal that stays open the whole time.

**Query:** Will Kris apply the SSH config on both Macs at their screens?

**Options:** a) (recommended) yes, on sol first and then terra, keeping one Terminal window open throughout:

1. At sol, run: `cp -p ~/.ssh/config ~/.ssh/config.pre-ue088 && chezmoi diff ~/.ssh/config`
   Expect: the diff adds the `Host sol 100.90.130.74` block and the `Host terra` block, and removes the old address-only block. Nothing else changes.
2. At sol, run: `chezmoi apply ~/.ssh/config && ssh -G terra | grep -E '^(hostname|user|forwardagent) '`
   Expect: `user krisbrown`, `hostname 100.96.126.29`, `forwardagent no`.
3. At sol, run: `ssh terra true && ssh sol true && ssh -T git@github.com`
   Expect: no host-key prompt, then `Hi krisb! You've successfully authenticated`. Leave the backup in place if this step fails.
4. Only if step 2 or 3 fails, run at sol: `cp -p ~/.ssh/config.pre-ue088 ~/.ssh/config`
   Expect: `ssh krisbrown@100.96.126.29 true` works again. Then tell the thread so the commit is reverted.
5. At sol, once step 3 passes, run: `git -C ~/.local/share/chezmoi push && rm ~/.ssh/config.pre-ue088`
   Expect: `main -> main`.
6. At terra, run: `cp -p ~/.ssh/config ~/.ssh/config.pre-ue088 && chezmoi git -- pull --ff-only && chezmoi diff ~/.ssh/config ~/.ssh/known_hosts`
   Expect: the same config diff as step 1, plus sol's and terra's keys if terra's known_hosts lacks them.
7. At terra, run: `chezmoi apply ~/.ssh/config ~/.ssh/known_hosts && ssh -G terra | grep -E '^(hostname|user|forwardagent) ' && ssh sol true && ssh terra true && ssh -T git@github.com`
   Expect: `hostname 100.96.126.29`, `user krisbrown`, `forwardagent no`, no host-key prompt, then the GitHub greeting. `ssh terra` from terra loops back to itself, which does no harm.
8. Only if step 7 fails, run at terra: `cp -p ~/.ssh/config.pre-ue088 ~/.ssh/config`
   Expect: plain `ssh krisbrown@100.90.130.74 true` works. Tell the thread.
9. At terra, once step 7 passes, run: `rm ~/.ssh/config.pre-ue088`
   Expect: no output.

b) Apply on sol only and leave terra until it is next at hand.

```text
HOSTKEY-APPLY - a) at sol: back up ~/.ssh/config to config.pre-ue088, chezmoi diff then apply ~/.ssh/config, check ssh -G terra (100.96.126.29, krisbrown, forwardagent no), ssh terra true && ssh sol true && ssh -T git@github.com, restore from the backup if any check fails, else push chezmoi and remove the backup; then at terra: back up, chezmoi git -- pull --ff-only, diff and apply ~/.ssh/config and ~/.ssh/known_hosts, run the same checks, restore if one fails, else remove the backup
```

```text
╭─ run report · 2026-10-15T09:51:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · ace1863 local           │
│  █  █ █▄▄▄ ▄▄▄█   █    · 1 query                 │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] hostkey-check finished; nothing running from this run
- [waiting on Kris] HOSTKEY-APPLY at sol's screen, then terra's
- [queries] HOSTKEY-APPLY
- [unpushed] chezmoi `main` on sol is 5 commits ahead, ending `ace1863`

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
