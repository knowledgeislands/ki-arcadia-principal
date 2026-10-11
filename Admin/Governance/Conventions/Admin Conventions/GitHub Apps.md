---
note_type: admin/governance/convention
tags:
  - card/note
  - topic/knowledge-islands
updated: 2026-10-11T02:19:55Z
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
| Installation | Selected repositories: `ki-website`, `homebrew-tap` and `ki-agentic-harness` |
| Credential holders | `homebrew-tap`, `ki-website`, `ki-agentic-harness`, `tools-ki`, `tools-mgit`, `tools-rig`, `tools-techne` and `tools-git-almanac` - per-repository settings, not organisation-level |
| App ID credential | `KI_TOOLS_RELEASE_BOT_APP_ID` - Actions variable, set to 5008264 |
| Private key credential | `KI_TOOLS_RELEASE_BOT_PRIVATE_KEY` - Actions secret |
| Key custody | Kris's 1Password, `Rig` vault, item "ki-tools-release-bot private key", attachment `ki-tools-release-bot.2026-10-05.private-key.pem` |
| Key rotation | Kris |

### Key custody

The private key is held in Kris's 1Password, in the `Rig` vault, as the item "ki-tools-release-bot private key" with the attachment `ki-tools-release-bot.2026-10-05.private-key.pem`. Its `op read` path is `op://Rig/ki-tools-release-bot private key/ki-tools-release-bot.2026-10-05.private-key.pem`. The item also lists the App ID, the credential-holding repositories and the rotation steps below.

The original key generated on 2026-09-20 was lost. A replacement key was generated on 2026-10-05 and Kris deleted the old key from the App settings the same day, so the 2026-10-05 key is the only active key.

### Credential holders

The App is installed on `ki-website`, `homebrew-tap` and `ki-agentic-harness`, the repositories it writes to. The tool repositories (`tools-ki`, `tools-mgit`, `tools-rig`, `tools-techne` and `tools-git-almanac`) are not installation targets: they hold the App ID variable and private key secret only so their release workflows can mint an installation token targeting the tap. All 8 repositories hold the credentials in repository-level settings; there is no organisation-level secret or variable.

### Key rotation

1. Generate a new private key on the App's settings page and attach the `.pem` to the 1Password item in the `Rig` vault, replacing the old attachment.
2. Update `KI_TOOLS_RELEASE_BOT_PRIVATE_KEY` on all 8 credential-holding repositories.
3. Delete the old key from the App's settings page once every secret is updated.

To keep the key off disk, read it into a shell variable, check it, then pipe it to GitHub for each repository:

```sh
key="$(op read "op://Rig/ki-tools-release-bot private key/<file>.pem")"
if [ -n "$key" ] && printf '%s' "$key" | grep -q BEGIN; then
  printf '%s' "$key" | gh secret set KI_TOOLS_RELEASE_BOT_PRIVATE_KEY -R knowledgeislands/<repo>
else
  echo "key read failed; secret not set" >&2
fi
unset key
```

Never pipe an `op` read straight into `gh secret set`: if the read fails, `gh` receives empty input and sets an empty secret without complaint. This happened on 2026-10-05, because `op document get` fails on an attachment to a Secure Note; `op read` with the `op://` path is the working form.

### Verification

On 2026-10-05 the `homebrew-tap` intake run 37317227744 (`workflow_dispatch`) authenticated with the new key and ran green. The `tools-ki` and `tools-techne` formulae were already at their latest releases, so no formula pull request was expected.

On 2026-10-07 the release chain ran end to end: for the `ki` releases v0.8.1 to v0.9.0 and `mgit` v0.16.0, the App opened and auto-merged `homebrew-tap` formula pull requests #23 to #29 and `ki-website` registry pull requests #24 to #28.

On 2026-10-09 a manual run of `update-ki-pin.yml` in `ki-agentic-harness` minted the bot's installation token successfully.

The tap's sender-side operating procedures live in its [release App operations guide](https://github.com/knowledgeislands/homebrew-tap/blob/8111c9a9944f9f335a6ecfb1cf8c3a20cea6b4be/docs/guides/maintainer/release-app-operations.md) at revision `8111c9a9944f9f335a6ecfb1cf8c3a20cea6b4be`, which cites this note for key custody and rotation.

### Workflows

| Repository | Workflow | Use |
| --- | --- | --- |
| `homebrew-tap` | `propose-tool-releases.yml` | Proposes the formula pull request for a new immutable release |
| `homebrew-tap` | `ci.yml` (notify-consumers job) | Dispatches `tool-release-published` to consumer repositories once the formula reaches `main` |
| `ki-agentic-harness` | `update-ki-pin.yml` | Proposes a `.github/ki-version` bump when `tools-ki` publishes an immutable release |
| `ki-website` | `update-tool-release.yml` | Verifies the release, opens or updates the registry pull request and requests squash auto-merge |

In `ki-website` the `main` ruleset requires pull requests and the `build` check, with repository admins as the only bypass actor; the App cannot bypass it. The website's decision is [ODR-KI-WEB-001](https://github.com/knowledgeislands/ki-website/blob/a2c064ab535842ebfdc65965f79b4b659596c1f5/docs/decisions/ODR-KI-WEB-001-tool-release-updates-auto-merge.md) in `ki-website`; it makes a verified tool release the human gate, so a pin-only tool-release pull request merges itself once `build` passes.

In `ki-agentic-harness`, set up on 2026-10-09, the `main` ruleset allows only repository admins to bypass, requires a pull request with 0 approvals and the `build` check, and blocks deletion and force push.

---

## Other Organisation Apps

| Identity | Installation | Role |
| --- | --- | --- |
| `claude` | All repositories | Claude GitHub integration for agent-authored pull requests, reviews and issue work |
| `cloudflare-workers-and-pages` | All repositories | Cloudflare Workers Builds: builds and deploys connected sites, reporting checks and deployments |
| Dependabot | GitHub built-in, per repository | Dependency and security update pull requests where enabled |
