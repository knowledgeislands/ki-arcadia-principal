# Owner report: Tailscale key minting (KI-TECHNE-OPS-027)

Run `ts-oauth-impl`, 2026-10-14, in `ki-techne-harness` on this Mac, branch `main`.

## Done

- **Record adopted and delivered.** [KI-TECHNE-OPS-027](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-027-agent-host-tailscale-key-minting.md) is at horizon `now`, status `awaiting-review`, under Decision 56. It is not accepted or marked done. All four open questions are answered in its Discussion:
  - **Where the secret is read from:** a 1Password item reference in `AGENT_HOST_TAILSCALE_OAUTH_ITEM`, read with `op read`. Under `op run`, two environment variables can be used instead.
  - **How rebuild prints the sequence:** `destroy.sh rebuild` prints the minting route when an OAuth client is configured, and the hand route otherwise.
  - **tools-techne:** needs one binding field, recorded as a handoff (see below). `[status]` needs nothing.
  - **Expiry:** one hour.
- **Minting implemented.**
  - New `operations/aws/agent-host/mint-tailscale-key.sh`. It mints a key that is single-use, not ephemeral, pre-approved, `tag:ki-techne-agent-host` only and expires after one hour. It pipes the key into Parameter Store and never overwrites an existing parameter. `--check` only proves that Tailscale accepts the client: it mints nothing and makes no AWS call.
  - `provision.sh` mints only when the key parameter is absent and a client is configured. It does this after template validation and just before the deploy. With neither a key nor a client, it names both routes and stops.
  - The hand route still works unchanged.
- **Secrecy proved offline.** The repository's checks now run with stand-in `op`, `curl` and `aws` commands and random credentials for each run. They confirm that no secret, token or key appears in any command argument, the output, or any file in the check's home and temporary folders. I also tested the check itself: making the script echo the key, or pass the token as an argument, each made it fail.
- **Guide updated.** The [operator guide](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/guides/operator/agent-host.md#key-minting) has a new Key minting section with the one-time setup. The build, kill-switch, rebuild and withdraw steps now mention the minting route and the OAuth client.
- **Checks:** `bun run test` passes, and so does shellcheck on every agent-host script. `ki repo audit` passes for `ki-work-roadmap`, `ki-guides` and `ki-authoring`. `ki-engineering` shows one warning that was already there and is not from this change: `ci.yml` pins `KI_VERSION` inline. The pre-commit hooks passed.
- **Commit:** `de6b4d3` `feat(agent-host): mint the Tailscale auth key from an OAuth client`, committed by explicit paths. The working tree is clean, and no other session had uncommitted files.

## In progress

Nothing is running.

**Pending handoff:** `ki-techne-harness` on this Mac, branch `main`, is one commit ahead of `origin/main` and **not pushed**. The task asked for `git pull --rebase` and a push, but the run's Rules said never push and make no remote call. I followed the stricter rule (see Needs `TS-OAUTH-PUSH`).

## Outstanding queries

**Needs `TS-OAUTH-PUSH`.** Should I pull with rebase and push `de6b4d3` to `origin/main`? (a) Yes, push it. (b) No, you'll push it yourself.

**Needs `TS-OAUTH-LIVE`.** The live check only you can run. In the Tailscale admin console:

1. Open **Settings → OAuth clients** and generate a client:
   - **Description:** `ki-techne-agent-host key minting`
   - **Scopes:** **Auth Keys**, **Write** only, nothing else
   - **Tags:** `tag:ki-techne-agent-host` only
2. The console shows the client ID and secret once. Leave that dialog open.

Then in 1Password:

1. Create an **API Credential** item named `ki-techne-agent-host-tailscale-oauth`.
2. Paste the client ID into **username** and the secret into **credential**, then clear the clipboard with `pbcopy </dev/null`.

On the Mac, from the harness root, with `op` signed in:

```sh
export AGENT_HOST_TAILSCALE_OAUTH_ITEM='op://<vault>/ki-techne-agent-host-tailscale-oauth'
bash operations/aws/agent-host/mint-tailscale-key.sh --check
```

The check should print `Tailscale accepted the OAuth client (scope: auth_keys); no key was minted`. Your next rebuild then needs no hand-made key.

I wrote the console labels and scope name from Tailscale's documentation without seeing a live tailnet, so please tell me if any differ. (a) Done, and the check passed. (b) Done, but it differed or failed (say how). (c) Not yet.

**Needs `TS-OAUTH-HANDOFF`.** `tools-techne` has a fixed list of binding fields, so a `techne` binding cannot carry the 1Password reference yet. For now the variable is exported by hand. Should a non-blocking handoff go to tools-techne for an optional binding field, `tailscale_oauth_item`, passed to `provision` and `destroy` as `AGENT_HOST_TAILSCALE_OAUTH_ITEM`? This repository would then add the matching optional recipe parameter. I didn't file it because this run couldn't edit tools-techne. (a) Yes, file it in tools-techne. (b) No, exporting the variable by hand is enough.

```text
TS-OAUTH-PUSH - a
TS-OAUTH-LIVE - c
TS-OAUTH-HANDOFF - a
```
