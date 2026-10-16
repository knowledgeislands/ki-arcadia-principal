---
note_type: streams/project
slug: tools-burndown
title: Tools burndown
outcome: The tools-ki, tools-mgit and tools-git-almanac roadmaps and the CLI-shaped ki-agentic-harness records are burned down to zero - every record closed, merged or rejected - ending with the ki and mgit releases.
initiative: platform-foundations
lifecycle: active
lead: Kris Brown
target: null
updated: 2026-10-16T01:02:49Z
author: Written with Claude
---

# Tools Burndown

## Outcome

Burn the `tools-ki`, `tools-mgit` and `tools-git-almanac` roadmaps, and the `ki-agentic-harness` records about the `ki` CLI, its commands, release or packaging, down to zero: every record closed, merged or rejected. No new feature record is captured, except the one `tools-ki` triage record Kris's REPO-GIT-HYGIENE decision of 16 October 2026 asks for. The Project ends with the `ki` and `mgit` releases, each cut only after Kris approves it.

This Project sits in [[platform-foundations|Platform foundations]]. Kris revived it on 16 October 2026 with TOOLS-PROJECT: "Revive tools-burndown as a Project under Platform foundations, thread KI > Foundations > tools burndown, scoped to tools-ki, tools-mgit, tools-git-almanac and the CLI-shaped ki-agentic-harness records, excluding tools-rig and tools-techne, ending with the ki and mgit releases."

---

## Notes

### Scope

- **In:** `tools-ki`, `tools-mgit` and `tools-git-almanac` roadmaps; `ki-agentic-harness` records about the `ki` CLI, its commands, release or packaging.
- **Out:** `tools-rig`, which the Rig threads own, and `tools-techne`, under the [Techne Programme Hold](<../../Admin/Governance/Policies/Techne Programme Hold.md>).
- Membership is classification, not authority. Several in-scope records name another Project. Under OWNER-LANE, applied on 16 October 2026 through Kris's BURN-OVERNIGHT, this Project runs the single `tools-ki` writer for every in-scope record, because the installed `ki` runs the primary checkout and two writers would collide; the owning threads, ways-of-working and knowledge-acquisition, keep priority and acceptance input.
- **Held outside the burn-to-zero:** under RELEASE-CONTRACT, applied on 16 October 2026 through BURN-OVERNIGHT, [KI-TOOL-KI-CLI-125](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-125-ki-release-contract.md) stays on Hold with the agent-host Project until its 2026-11-16 review. It is excluded from this Project's burn-to-zero and from the `ki` release gate; `ki` already ships signed archives for the platforms in use, so the release proceeds without it.
- **mgit release:** under MGIT-RELEASE, applied on 16 October 2026 through BURN-OVERNIGHT, an `mgit` release is cut only if `mgit` changes land during the Project, with Kris's approval; otherwise `v0.17.0` stands as the Project's `mgit` release.
- **Coupled harness records, sequenced alongside but not burned down here:**
  - [KI-HARNESS-GOV-175](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-175-delegation-run-events.md) waits for KI-TOOL-KI-CLI-123.
  - [KI-HARNESS-GOV-195](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-195-thread-folder-closed-list.md) pairs with KI-TOOL-KI-CLI-137 and should land with it.
  - [KI-HARNESS-GOV-170](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-170-keep-resolution-targets-local.md) will later hand `tools-ki` a work-item model change.
  - [KI-HARNESS-GOV-189](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-189-move-thread-between-hosts.md) names queue export and import as `tools-ki` mechanics, with no `tools-ki` record yet.

### Inventory

Open records in scope on 16 October 2026, read from each repository's local `main` (`tools-ki` at `f133faf0`, level with `origin/main`; `tools-mgit` `9a30de5`, at `v0.17.0` with no change since; `tools-git-almanac` `00cc916`; `ki-agentic-harness` local `b4875ac1`, ahead 4 of `origin/main` `45bbaea6` with another session's unpushed commits).

| Repository | Record | Title | Status | Horizon | Project |
| --- | --- | --- | --- | --- | --- |
| `tools-ki` | [KI-TOOL-KI-CLI-123](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-123-agent-run-events.md) | Agent run events | draft | next | ways-of-working |
| `tools-ki` | [KI-TOOL-KI-CLI-125](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-125-ki-release-contract.md) | KI release contract | draft | hold | agent-host |
| `tools-ki` | [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) | Unavailable store breaks repair | awaiting-review (released in `v0.10.5`, pinned; Verify 4 and acceptance left) | now | ways-of-working |
| `tools-ki` | [KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md) | Agent thread coordination commands | draft | next | ways-of-working |
| `tools-ki` | [KI-TOOL-KI-CLI-128](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-128-granola-retention-safeguards.md) | Granola retention safeguards | draft | next | knowledge-acquisition |
| `tools-ki` | [KI-TOOL-KI-CLI-130](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-130-skill-generated-surfaces.md) | Generated skill surfaces | in-progress | now | ways-of-working |
| `tools-ki` | [KI-TOOL-KI-CLI-131](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-131-host-absent-store-state.md) | Host-absent store state | triage | - | - |
| `tools-ki` | [KI-TOOL-KI-CLI-133](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-133-retired-reports-come-back.md) | Retired reports come back | ready | now | - |
| `tools-ki` | [KI-TOOL-KI-CLI-134](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-134-launch-footer-follows-brief.md) | Launch footer follows brief | triage | - | - |
| `tools-ki` | [KI-TOOL-KI-CLI-135](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-135-reused-agent-name-overwrites.md) | Reused agent name overwrites | triage | - | - |
| `tools-ki` | [KI-TOOL-KI-CLI-136](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-136-errors-suggest-fixes.md) | Errors suggest fixes | triage | - | - |
| `tools-ki` | [KI-TOOL-KI-CLI-137](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-137-agent-run-tmp-home.md) | Agent run temporary home | triage | - | - |
| `tools-ki` | [KI-TOOL-KI-CLI-138](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-138-warn-unknown-record-fields.md) | Warn unknown record fields | triage | - | - |
| `tools-ki` | [KI-TOOL-KI-CLI-139](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-139-ebu-sources-sync.md) | EBU sources sync | triage | - | - |
| `tools-ki` | [KI-TOOL-KI-CLI-140](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-140-git-hygiene-estate-audit.md) | Git hygiene estate audit | triage | - | - |

`tools-mgit` and `tools-git-almanac` hold no open records, and `tools-mgit` has no change since `v0.17.0`. KI-TOOL-KI-CLI-140 is the one triage record REPO-GIT-HYGIENE asked for. KI-TOOL-KI-CLI-125 is listed but held outside the burn-to-zero (see Scope). All six open `ki-agentic-harness` records are left out: KI-HARNESS-GOV-170, GOV-175, GOV-189, GOV-194, GOV-195 and OPS-005 change skills and standards or acquisition, not the `ki` CLI, its commands, release or packaging, and the CLI mechanics two of them need are already `tools-ki` records.

### History

The earlier tools-burndown thread, run under the [Estate factorisation](estate-factorisation.md) checkpoint, is this Project's history: its folder `+/_THREADS/tools-burndown/`, its `decisions.md` and its `historical-decisions.md`.
