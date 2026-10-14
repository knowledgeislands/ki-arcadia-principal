---
note_type: streams/design
updated: 2026-10-14T14:00:00Z
author: Written with Claude
---

# Paperclip rebuild structure

**For:** Kris Brown - **Project:** [[paperclip-capture-and-rebuild|Paperclip capture and rebuild]] - **Date:** 2026-10-14 - **Authority:** Kris's 2026-10-14 instruction to 'recreate it with the same approach but fresh'

The structure of the `terra` Paperclip instance as it stood when it was stopped on 2026-10-14, recorded so a fresh instance can recreate the same approach. It holds no secrets and no issue content. Agent instruction bundles and full configuration, minus secrets, are in the Knowledge Islands source store under `paperclip/2026-10-approach/`, one folder per company code.

## What to keep and what to change

- **Keep:** one CEO per company with every other agent reporting to it; an independent reviewer separate from the implementer, as VA, TMX, LGL and KIT had; a workspace-free Coordination project for routines and coordination; isolated git-worktree execution workspaces from `main`, serialised per shared workspace; concurrency one per agent; on-demand wakes, with no timer heartbeat; Claude subscription login per company (`claude_local`, `responsible_user`); the KI environment (`KI_CONFIG_HOME`, `KI_DATA_HOME`, `KI_STATE_HOME`, `KI_CACHE_HOME`, and `MISE_DATA_DIR` with `MISE_AUTO_INSTALL` where KI skills come through mise); routines with `skip_if_active` and `skip_missed`, scheduled in Europe/London.
- **Change:** company codes, chosen once (see the Project's Design phase); every workspace path, which still points at the retired `~/workspaces/kit/...` and `~/workspaces/hnr/...` layouts; the projects for retired or renamed repositories (`ki-techne-principal`, `ki-arcadia-principal`, `ki-website`, `ki-plugins`, `mcp-housekeeping-codex`, `kit-hnr`, `kit-techmedix`, `kit-legal`, `vallearmonia-*`); `dangerouslySkipPermissions`, which the KI agents and Wren ran with; Wren's 300-second timer heartbeat; hiring rights, which most agents held and few needed; one Onboarding project per company, which the post-hire brief can replace.
- **Missing:** Sacred Inquiry has no company, and the personal company has no repository project.

## Common adapter settings

Every agent used the `claude_local` adapter with a managed instruction bundle (`AGENTS.md`) and Paperclip skill sync, mostly with a 15-second grace period. KIS and HNR agents pinned `opus[1m]`, with a 1,800-second timeout and 50 turns per run; VA pinned high effort; VA, TMX, LGL, KIT and ER set no run timeout and otherwise used the adapter defaults. Only the KIS company required board approval for new agents. No company had a budget.

## Companies

### KIS - Knowledge Islands

| Agent | Role and title | Reports to | Model and effort | Heartbeat | Can hire | Paperclip skills |
| --- | --- | --- | --- | --- | --- | --- |
| Convenor | general, CEO | - | opus[1m] | on demand | yes | paperclip, board, converting-plans-to-tasks, create-agent, para-memory-files |
| Ferryman | general, Remote Execution | Convenor | opus[1m] | on demand | yes | paperclip, board, para-memory-files |
| Steward | general, Knowledge Governance | Convenor | opus[1m] | on demand | yes | paperclip, board, para-memory-files, converting-plans-to-tasks |
| Wright | general, Delivery | Convenor | opus[1m] | on demand | yes | paperclip, board, para-memory-files, converting-plans-to-tasks |

Projects with a repository workspace (23): `dotfiles`, `tools-ki`, `tools-rig`, `ki-specifications`, `ki-agentic-harness`, `ki-techne-harness`, `ki-plugins`, `mcp-gsuite`, `mcp-housekeeping-codex`, `mcp-acquire-whatsapp`, `mcp-ki-kb-fs`, `ki-techne-principal`, `ki-arcadia-principal`, `mcp-housekeeping-chatgpt`, `tools-git-almanac`, `mcp-ki-kb-notion-mirror`, `tools-mgit`, `ki-website`, `mcp-housekeeping-claude`, `mcp-git-audit`, `homebrew-tap`, `mcp-m365`, `tools-techne`. Without a workspace: Coordination.

| Routine | Assignee | Schedule | Concurrency |
| --- | --- | --- | --- |
| Changelog | Convenor | `0 8 * * *` Europe/London | skip_if_active |
| Changelog - weekly roll-up | Convenor | `0 9 * * 1` Europe/London | skip_if_active |

### VA - Valle Armonia

| Agent | Role and title | Reports to | Model and effort | Heartbeat | Can hire | Paperclip skills |
| --- | --- | --- | --- | --- | --- | --- |
| Guru | general, CEO | - | high | on demand | yes | paperclip, board, converting-plans-to-tasks, create-agent, para-memory-files |
| Sakshi | qa, Independent Delivery Reviewer | Guru | high | on demand | no | paperclip, board, para-memory-files |
| Shilpin | engineer, Delivery Engineer | Guru | high | on demand | yes | paperclip, board, para-memory-files |

Projects with a repository workspace (3): `vallearmonia-website`, `vallearmonia-principal`, `mark-markhowarth.com`. Without a workspace: Onboarding, Coordination.

| Routine | Assignee | Schedule | Concurrency |
| --- | --- | --- | --- |
| Weekly / on-demand operational review, including employee knowledge return | Guru | none (manual only) | skip_if_active |
| Next-work review - finish active work, then prepare the next eligible item | Guru | none (manual only) | skip_if_active |
| 08:00 company update - yesterday's change log, today's focus, blockers | Guru | none (manual only) | coalesce_if_active |
| Daily repository health - audit + conform dry-run (Principal, Website, Mark) | Guru | none (manual only) | skip_if_active |

### HNR - Humans Not Robots

| Agent | Role and title | Reports to | Model and effort | Heartbeat | Can hire | Paperclip skills |
| --- | --- | --- | --- | --- | --- | --- |
| Wren | general, Chief of Staff | - | opus[1m] | timer 300s | yes | paperclip, board, converting-plans-to-tasks, create-agent, para-memory-files, hnr-ki-agent-env |
| Brains | general, Knowledge Steward | Wren | opus[1m] | on demand | yes | paperclip, para-memory-files |
| Doc | general, Product Steward | Wren | opus[1m] | on demand | yes | paperclip, para-memory-files |
| Monkey | general, Harness Engineer | Wren | opus[1m] | on demand | yes | paperclip |
| Sputnik | general, Programme Lead, 5G-EMERGE | Wren | opus[1m] | on demand | yes | paperclip, converting-plans-to-tasks |

Projects with a repository workspace (12): `hnr-backend`, `hnr-benchmarks`, `hnr-agentic-harness`, `5g-emerge-ibc2026`, `5g-emerge-phase2`, `5g-emerge-testbed`, `5g-emerge-phase3`, `hnr-shared`, `hnr-frontend`, `kit-hnr`, `5g-emerge-apex`, `hnr-principal`. Without a workspace: Coordination.

### TMX - Techmedix

| Agent | Role and title | Reports to | Model and effort | Heartbeat | Can hire | Paperclip skills |
| --- | --- | --- | --- | --- | --- | --- |
| Bob | general, CEO | - | adapter default | on demand | yes | paperclip, board, converting-plans-to-tasks, create-agent, para-memory-files |
| Rita | general, Repository Implementer - kit-techmedix | Bob | adapter default | on demand | no | paperclip |

Projects with a repository workspace (1): `kit-techmedix`. Without a workspace: Onboarding, Coordination.

### LGL - Legal (Kit)

| Agent | Role and title | Reports to | Model and effort | Heartbeat | Can hire | Paperclip skills |
| --- | --- | --- | --- | --- | --- | --- |
| Forseti | general, CEO | - | adapter default | on demand | yes | paperclip, board, converting-plans-to-tasks, create-agent, para-memory-files |
| Vár | general, Independent reviewer and integration owner, kit-legal | Forseti | adapter default | on demand | no | paperclip |

Projects with a repository workspace (1): `kit-legal`. Without a workspace: Coordination, Onboarding.

### KIT - Kit (Personal)

| Agent | Role and title | Reports to | Model and effort | Heartbeat | Can hire | Paperclip skills |
| --- | --- | --- | --- | --- | --- | --- |
| Kitteth | general, CEO | - | adapter default | on demand | yes | paperclip, board, converting-plans-to-tasks, create-agent, para-memory-files |
| Maketh | engineer, Repository Engineer | Kitteth | adapter default | on demand | no | paperclip |

Projects with a repository workspace (0): none. Without a workspace: Onboarding.

### ER - Equal Remedy

| Agent | Role and title | Reports to | Model and effort | Heartbeat | Can hire | Paperclip skills |
| --- | --- | --- | --- | --- | --- | --- |
| Dike | general, CEO | - | adapter default | on demand | yes | paperclip, board, converting-plans-to-tasks, create-agent, para-memory-files |

Projects with a repository workspace (3): `er-research`, `dafacts-website`, `er-agentic-harness`. Without a workspace: Coordination, Onboarding.

## Agent remits

The remit each agent carried in Paperclip's capabilities field, where one was set. CEOs and agents without a remit take theirs from the instruction bundle.

- **KIS Ferryman.** Owns the path from this Mac to the AWS Kubernetes cluster: naming the target for TECHNE-OPS-002, running the Zed and Herdr persistence proof, and designing the adapter that makes a Paperclip agent's worker a pod without collapsing role, run and workspace.
- **KIS Wright.** Delivers approved Ready roadmap items from an immutable baseline through verification to Awaiting review, one writer per checkout, returning evidence to the governing record.
- **KIS Steward.** Owns the Knowledge Islands-Paperclip boundary: declares ki-agent-coordination-paperclip where it belongs, keeps the two-way task-roadmap-item link applied, and audits that repository authority is never bypassed by a Paperclip status transition.
- **VA Shilpin.** Turns one approved roadmap work record at a time into a verified delivery candidate in an isolated per-task checkout, with real verification output; never pushes, publishes, integrates into main, or accepts KI work.
- **VA Sakshi.** Independently reviews each returned delivery candidate against its governing work record and the owning repository's declared acceptance rules, and returns a cited PASS/FAIL verdict; never implements, accepts or integrates.
- **HNR Brains.** Owns HNR's knowledge system - kit-hnr and hnr-shared - and is the conventions authority for the company: KB methodology, work-record hygiene and the ledger, harvesting decisions into Pillars and Resources, and the consolidated roadmap view across all nine repositories.
- **HNR Monkey.** Owns hnr-agentic-harness: HNR skills and the six Pillar role subagents, ki repo audit/conform conformance across all HNR repositories, and the HNR side of the Knowledge Islands exchange.
- **HNR Doc.** Owns Product Management: the HNR-KB product roadmap, the Analytics/Telemetry/Media Streaming/Core/IAM feature ontology, the value-and-impact-modelling theme, and the Product Pillar in hnr-shared. Writes no code.
- **HNR Sputnik.** Runs the five 5G-EMERGE site repos as a programme: Phase 3 build-out, the IBC 2026 infoschematic and API-contract pack, the apex signpost catalogue, Phase 2 strand content and telemetry, and Cloudflare publishing.
- **TMX Rita.** Implements approved work records in the kit-techmedix repository from its admitted revision in an isolated worktree, runs the repository's declared checks, and hands the exact commit to Bob for independent review.
- **LGL Vár.** Independently reviews kit-legal repository work prepared by others and owns its integration. Verifies governing items, admitted revisions and actual records/ledger writes at the task's admitted revision, and returns a reasoned verdict in the owning repository project. Does not review its own work.
- **KIT Maketh.** Authors repository work for KIT: verifies repository identity and declarations, runs read-only discovery, and implements approved changes in the owning repository project workspace with evidence, handing every result to Kitteth for independent review.
