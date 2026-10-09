---
tags:
  - card/note
  - topic/knowledge-islands
note_type: admin-process
title: Release Cascade
description: How a change in any Knowledge Islands tooling project is released, published, announced and taken on by every other project and by Kris's machines - what is automatic, what is manual, what is approved to become automatic, and what Kris does when.
status: current - October 2026
author: Written with Claude
---

# Release Cascade

## Overview

Knowledge Islands tooling projects release on demand, not per change. A change lands on a project's `main`, waits until a release is due, and is then published as a signed, immutable GitHub release. The release notifies the Homebrew tap; the tap's bot updates the formula and, once that merges, tells the projects that consume tool releases. Each consumer takes a new `ki` on by moving its own pin. On Kris's machines, local builds from `main` run ahead of the release, and Homebrew copies move only when upgraded.

This note is the canonical overview of the cascade. It explains the flow and who moves each step; the repositories own the mechanics:

- release timing: the `ki-repo-tools` [release-on-demand policy](https://github.com/knowledgeislands/ki-agentic-harness/blob/main/skills/repo-structure/ki-repo-tools/references/standards-release-readiness.md#release-on-demand);
- release steps: each tool's `docs/guides/developer/releasing.md`, such as the [tools-ki releasing guide](https://github.com/knowledgeislands/tools-ki/blob/main/docs/guides/developer/releasing.md), and the harness [MCP source-release guide](https://github.com/knowledgeislands/ki-agentic-harness/blob/main/docs/guides/developer/mcp-source-releases.md);
- pin rules: the `ki-engineering` pin receiver contract and [XDR-KI-HARNESS-001](https://github.com/knowledgeislands/ki-agentic-harness/blob/main/docs/decisions/XDR-KI-HARNESS-001-dependabot-security-updates-without-auto-merge.md);
- tap sender operations and the release App's key custody: the [[GitHub Apps]] convention and the tap's release-App operations guide.

![[Release Cascade.svg]]

The SVG is exported from the Archify source [[Release Cascade.archify.json|beside it]]. Solid arrows run by themselves; dashed arrows wait for a person. The `ki` pin-bump step is drawn as approved rather than as it runs today - see [Automatic, manual and approved](#automatic-manual-and-approved). To change the diagram, edit the source, run Archify's `finalize` for a `workflow` diagram at `showcase` quality, then export the SVG from the rendered viewer. The rendered HTML is a working file and is not kept.

---

## The projects

| Project | Ships | Release trigger | Published through | On Kris's machines |
| --- | --- | --- | --- | --- |
| `tools-ki` | The `ki` CLI, with one exact Harness commit pinned inside | Tag, then dispatch the Release workflow | Signed archives, tap formula `ki` | `~/.local/bin/ki` rebuilt from `main`, ahead of Homebrew |
| `tools-mgit` | `mgit` | Release created by hand; publication raises the tap notice | Tap formula `mgit` | `~/.local/bin/mgit` linked to the checkout |
| `tools-rig` | `rig` | As `tools-mgit` | Tap formula `rig` | `~/.local/bin/rig` linked to the checkout |
| `tools-git-almanac` | `git-almanac` | Pushing a `vX.Y.Z` tag runs the Release workflow | Immutable asset, tap formula `git-almanac` | `~/.local/bin/git-almanac` linked to the checkout |
| `tools-techne` | `techne` | Dispatch the Release workflow | Tap formula `techne` | `~/.local/bin/techne` runs the checkout's source |
| `ki-agentic-harness` | Skills and rubrics | No release of its own: reaches CI through the Harness pin inside a `ki` release | Inside `ki` | `ki update` refreshes installed Harnesses |
| `mcp-*` servers (9) | MCP servers | Annotated tag and GitHub Release by hand; none tagged yet | Source release, installed by `ki mcp` | Installed or run from source |
| `ki-techne-harness`, `apps-observatory` | - | Not released | - | Used from the checkout |
| `homebrew-tap` | Formulae | Bot pull requests | The tap itself | `brew upgrade` |
| `ki-website` | The public site and its tool registry | Not released; a release consumer | - | - |

Every repository in the territory, tools included, is also a **consumer** of `ki`: its CI installs one exact released `ki` version, bootstraps the Harness that version pins, and runs `ki repo audit`.

---

## 1. A change lands

A change merges to the project's `main` after the normal checks and review. Delivered work closes there: its work record never waits for a release, and an agent never releases as part of delivery.

A Harness change - a new skill or a stricter rubric criterion - has one extra hop. CI does not read the Harness directly: `ki bootstrap` installs the Harness commit that the installed `ki` pins. So a Harness change reaches a repository's CI only when `tools-ki` moves its Harness pin, a `ki` release ships that pin, and the repository's own `ki` pin moves to that release.

## 2. Release on demand

Releases are held by default. A release is due when something else needs the new capability (another repository's CI, another person or machine), when there is something significant to ship, or when significant changes have accumulated. Releases that fall due together ship together.

A release is a separate, explicitly authorised action: Kris asks for it by naming it in a task, or runs it directly. For `tools-ki`, bump the Harness pin first if the Harness has moved.

## 3. Publication

Each tool's Release workflow, or Kris's hand release for `tools-mgit` and `tools-rig`, publishes the release:

- **`tools-ki`** builds three archives (`darwin-arm64`, `darwin-x64`, `linux-x64`), signs the checksum manifest with the release key, publishes the release as immutable, downloads and checks it again, and proves a clean install and `ki bootstrap` on a fresh Linux runner.
- **`tools-git-almanac` and `tools-techne`** verify and publish their release assets in their own Release workflows.
- **`tools-mgit` and `tools-rig`** are released by hand; publishing the release raises the event their notify workflow listens for.
- **MCP servers** publish a source release: a tag on the commit carrying the matching package version, and a GitHub Release. There is no package-registry publication and no tap notice.

## 4. Notification

Every released tool sends one `tool-release-published` event to `homebrew-tap`, signed in as the `ki-tools-release-bot` GitHub App:

1. The tap's **propose** workflow reads the release, writes the exact formula update on a bot branch, and opens a pull request set to squash-merge once the KI governance and Homebrew formula checks pass. A daily schedule repeats the check, so a missed event is caught the next morning.
2. When the formula change reaches the tap's `main`, the tap's CI resolves the release consumers listed in its `tool-release-consumers.json` and sends each one the same event, now carrying the tap commit.
3. Today the only listed consumer is `ki-website`, whose **update tool release** workflow opens a version-only pull request that auto-merges after CI. This keeps the website's tool registry in step for every tool.

## 5. Taking it on

Consumers take on a new `ki` by moving their **pin**, held in one of two places:

- **The receiver pin file**, `.github/ki-version`, read by CI and moved by the `update-ki-pin.yml` receiver workflow. The receiver verifies a new `tools-ki` release and opens a one-line pin-bump pull request, from the event or from a daily schedule. It requests auto-merge only when the diff is the pin file alone and `main` has a ruleset requiring checks. Only `ki-agentic-harness` has it today, and it stays inert until the release bot is installed there.
- **An inline `KI_VERSION`** in `ci.yml`. The other twenty `knowledgeislands` repositories use this, all at `v0.8.4` as of October 2026. Nothing proposes a bump; a person edits the line. `ki repo audit` reports it as a CI-1 warning. KI-HARNESS-GOV-168 converts them to receivers.

A pin bump merges like any other change, and CI then runs the new `ki` and the Harness it pins. Until then, the repository keeps using its older `ki`; an older pin is not a failure.

Only `ki` releases cascade into pins. The other tools have no CI consumers: they reach the tap, the website and Kris's machines, and stop there.

## 6. Kris's machines

Two copies of a tool can be installed, and `~/.local/bin` comes first on `PATH`:

- **Local builds** run ahead of releases. `ki` is a compiled build refreshed from `main` with one command in the [tools-ki local development guide](https://github.com/knowledgeislands/tools-ki/blob/main/docs/guides/developer/local-development.md#rebuild-the-local-ki-from-main); it reports the last released version, so `git log -1` in the checkout shows what is installed. `mgit`, `rig` and `git-almanac` are links into their checkouts and `techne` runs its checkout's source, so pulling `main` updates them.
- **Homebrew copies** in `/opt/homebrew/bin` follow the tap but move only on `brew upgrade`. `ki update` never replaces a Homebrew-owned executable; it refreshes installed Harnesses.

To use newly delivered capability, rebuild or pull locally; do not cut a release for it.

---

## Automatic, manual and approved

| Step | Today | Approved to become automatic |
| --- | --- | --- |
| Deciding a release is due and starting it | Manual: Kris | Stays manual by policy |
| Signing, publishing and proving the release | Automatic in the Release workflow (`tools-mgit`, `tools-rig`: hand release) | - |
| Notifying the tap | Automatic, with a daily backstop | - |
| Tap formula pull request | Automatic: the bot opens it and it auto-merges after checks | - |
| Website registry update | Automatic: the bot opens it and it auto-merges after CI | - |
| Proposing a `ki` pin bump | Manual: the Harness receiver is inert until the release bot is installed there; inline pins are edited by hand | Yes: every `knowledgeislands` repository moves to the receiver pin file and `update-ki-pin.yml` (KI-HARNESS-GOV-168) |
| Merging a `ki` pin bump | Manual review; the Harness updater already requests auto-merge behind its guards | Yes: auto-merge when the diff touches only the pin, required checks pass and the release checksum verifies |
| Release bot installation | Only the tap and website use it | Yes: across all `knowledgeislands` repositories, never outside the organisation |
| `brew upgrade` and local rebuilds | Manual: Kris | Stays manual |

Kris approved the automatic rows on 2026-10-09, deciding KI-HARNESS-GOV-161; XDR-KI-HARNESS-001 now carries the exception. The bot is limited to the `knowledgeislands` GitHub organisation: hnr, infoschematics and personal repositories keep manual, reviewed pins. App installation, the App ID variable and private-key secret, the `main` ruleset and each repository's auto-merge setting are GitHub settings only Kris changes.

---

## What Kris does, and when

- **To use new capability yourself:** rebuild `ki` locally from `main`, or pull the tool's checkout. Do not release for this.
- **When a release is due:** ask for it in an explicitly authorised task naming the release, or run it yourself from the tool's releasing guide. For `tools-ki`, check the Harness pin is current first.
- **After a release:** run `brew upgrade` on any machine that uses the Homebrew copy. The tap and website update themselves.
- **When a repository needs new rules in CI:** today, merge or make its `ki` pin bump. Once the approved automation is in place, the bump merges itself when it is pin-only and green; look only at bumps that fail CI.
- **Once, to switch on the automation:** install the release bot App on the `knowledgeislands` organisation for the repositories it may reach, store the App ID variable and private-key secret in each, protect `main` with a ruleset that requires CI and leaves the App off the bypass list, and allow auto-merge in each repository's settings. Add repositories as KI-HARNESS-GOV-168 converts them.
- **If a step looks stuck:** each scheduled workflow catches a missed event on its next daily run; a manual run of the tap's propose workflow or the receiver workflow retries at once.
