---
note_type: admin/governance/convention
tags:
  - card/note
  - topic/knowledge-islands
updated: 2026-10-05T10:30:00Z
author: AI-assisted
---

# GitHub Apps

## Overview

The GitHub Apps and automated identities that act on repositories in the `knowledgeislands` organisation. Each is estate infrastructure rather than part of Arcadia's own runtime surface, which [[Integrations]] covers. This note records what each identity is for, what it may do and who owns its credentials, so that a change to any of them is a deliberate, visible act.

Credential names only are recorded here. Private keys, tokens and App ID values live in GitHub repository settings and never in the island.

---

## ki-tools-release-bot

The organisation's own App for the tool release chain: an immutable `tools-*` release, then a Homebrew tap formula pull request, then a KI Website registry pull request. Auto-merge sits downstream of the immutable release, which is the human gate; each consumer still requires its own CI to pass before a bot pull request merges.

| Attribute | Value |
| --- | --- |
| Owner | `knowledgeislands` organisation |
| Created | 2026-09-20 |
| Permissions | Contents write, Pull requests write, Metadata read |
| Installation | Selected repositories |
| Installed (confirmed) | `ki-website` |
| Installed (planned) | `homebrew-tap` and the tappable tool repositories, per `BREW-007` in `homebrew-tap` |
| App ID credential | `KI_TOOLS_RELEASE_BOT_APP_ID` - Actions variable |
| Private key credential | `KI_TOOLS_RELEASE_BOT_PRIVATE_KEY` - Actions secret |
| Key rotation | Kris |

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
