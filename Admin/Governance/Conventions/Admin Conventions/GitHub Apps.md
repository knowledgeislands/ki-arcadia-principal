---
note_type: admin/governance/convention
tags:
  - card/note
  - topic/knowledge-islands
updated: 2026-10-05T13:50:00Z
author: AI-assisted
---

# GitHub Apps

## Overview

The GitHub Apps and automated identities that act on repositories in the `knowledgeislands` organisation. Each is estate infrastructure rather than part of Arcadia's own runtime surface, which [[Admin Conventions/Integrations|Integrations]] covers. This note records what each identity is for, what it may do and who owns its credentials, so that a change to any of them is a deliberate, visible act.

Credential names and custody locations are recorded here, never secret values. Private keys and tokens live in GitHub repository settings and the owner's password manager and never in the island. An App ID is a public identifier, not a secret, and is recorded where known.

---

## ki-tools-release-bot

The organisation's own App for the tool release chain: an immutable `tools-*` release, then a Homebrew tap formula pull request, then a KI Website registry pull request. Auto-merge sits downstream of the immutable release, which is the human gate; each consumer still requires its own CI to pass before a bot pull request merges.

| Attribute | Value |
| --- | --- |
| Owner | `knowledgeislands` organisation |
| Created | 2026-09-20 |
| Permissions | Contents write, Pull requests write, Metadata read |
| App ID | 5008264 |
| Installation | Selected repositories: `ki-website` and `homebrew-tap` |
| Credential holders | `homebrew-tap`, `ki-website`, `tools-ki`, `tools-mgit`, `tools-rig`, `tools-techne` and `tools-git-almanac` - per-repository settings, not organisation-level |
| App ID credential | `KI_TOOLS_RELEASE_BOT_APP_ID` - Actions variable, set to 5008264 |
| Private key credential | `KI_TOOLS_RELEASE_BOT_PRIVATE_KEY` - Actions secret |
| Key custody | Kris's 1Password, `Personal` vault, Secure Note "ki-tools-release-bot private key" |
| Key rotation | Kris |

### Key custody

The private key is held in Kris's 1Password, in the `Personal` vault, as the Secure Note "ki-tools-release-bot private key" with the `.pem` file attached. The note also lists the App ID, the credential-holding repositories and the rotation steps below.

The original key generated on 2026-09-20 was lost. A replacement key was generated on 2026-10-05 and Kris deleted the old key from the App settings the same day, so the 2026-10-05 key is the only active key.

### Credential holders

The App is installed only on `ki-website` and `homebrew-tap`, the repositories it writes to. The tool repositories (`tools-ki`, `tools-mgit`, `tools-rig`, `tools-techne` and `tools-git-almanac`) are not installation targets: they hold the App ID variable and private key secret only so that their release workflows can mint an installation token targeting the tap. All 7 repositories hold the credentials as repository-level settings; there is no organisation-level secret or variable.

### Key rotation

1. Generate a new private key on the App's settings page and attach the `.pem` to the 1Password Secure Note, replacing the old attachment.
2. Update `KI_TOOLS_RELEASE_BOT_PRIVATE_KEY` on all 7 credential-holding repositories.
3. Delete the old key from the App's settings page once every secret is updated.

To keep the key off disk, read it into a shell variable, check it, then pipe it to GitHub for each repository:

```sh
key="$(op read "op://Personal/ki-tools-release-bot private key/<file>.pem")"
if [ -n "$key" ] && printf '%s' "$key" | grep -q BEGIN; then
  printf '%s' "$key" | gh secret set KI_TOOLS_RELEASE_BOT_PRIVATE_KEY -R knowledgeislands/<repo>
else
  echo "key read failed; secret not set" >&2
fi
unset key
```

Never pipe an `op` read straight into `gh secret set`: if the read fails, `gh` receives empty input and sets an empty secret without complaint. This happened on 2026-10-05, because `op document get` fails on an attachment to a Secure Note; `op read` with the `op://` path is the working form.

### Verification

On 2026-10-05 the `homebrew-tap` intake run 37317227744 (`workflow_dispatch`) authenticated with the new key and ran green. The `tools-ki` and `tools-techne` formulae were already at their latest releases, so no formula pull request was expected. Full end-to-end proof of the release chain awaits the next immutable tool release, tracked as `BREW-010` in `homebrew-tap`.

### Workflows

| Repository | Workflow | Use |
| --- | --- | --- |
| `homebrew-tap` | `propose-tool-releases.yml` | Proposes the formula pull request for a new immutable release |
| `homebrew-tap` | `ci.yml` (notify-consumers job) | Dispatches `tool-release-published` to consumer repositories once the formula reaches `main` |
| `ki-website` | `update-tool-release.yml` | Verifies the release, opens or updates the registry pull request and requests squash auto-merge |

In `ki-website` the `main` ruleset requires pull requests and the `build` check, with repository admins as the only bypass actor; the App cannot bypass it. The website's decision is `ODR-KI-WEBSITE-001` in `ki-website`, delivered through `KI-WEB-SITE-042`.

---

## Other Organisation Apps

| Identity | Installation | Role |
| --- | --- | --- |
| `claude` | All repositories | Claude GitHub integration for agent-authored pull requests, reviews and issue work |
| `cloudflare-workers-and-pages` | All repositories | Cloudflare Workers Builds: builds and deploys connected sites, reporting checks and deployments |
| Dependabot | GitHub built-in, per repository | Dependency and security update pull requests where enabled |
