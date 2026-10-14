# Triage burn-down: a disposition for all 15 triage records

Run `triage-burndown`, state-of-play thread, 2026-10-14 07:35 BST. Read-only: nothing was changed and nothing was committed.

## What has been done

I read all 15 triage records (13 in Knowledge Islands repositories and 2 in chezmoi) and the records they link to. I checked them against Decisions 147, 150, 153, 154, 155 and 158 and against the Techne Programme Hold. Each record below has exactly one recommendation.

If Kris approves everything as written, 4 records close: one duplicate, two merges and one rejection. That takes Knowledge Islands from 35 to 32 open records and chezmoi from 10 to 9. Of the rest, 5 move to dated holds and 6 are adopted, either because Kris asked for them or because they fix a defect.

### Open records now (fresh count, 07:30 BST)

| Repository | triage | draft | ready | in progress | awaiting review | Open |
| --- | --- | --- | --- | --- | --- | --- |
| ki-agentic-harness | 3 | 5 | - | 1 | 2 | 11 |
| ki-principal | 1 | 2 | 2 | - | - | 5 |
| ki-specifications | 1 | - | - | - | - | 1 |
| ki-techne-harness | 2 | 3 | 1 | - | - | 6 |
| tools-ki | 2 | 2 | - | - | - | 4 |
| tools-rig | 4 | - | 1 | - | 2 | 7 |
| tools-techne | - | 1 | - | - | - | 1 |
| **Knowledge Islands total** | **13** | **13** | **4** | **1** | **4** | **35** |
| chezmoi (`krisb/dotfiles`) | 2 | 7 | 1 | - | - | 10 |

The other 13 Knowledge Islands repositories have no open records. Three done records (2 in the harness, 1 in tools-techne) are waiting to be pruned and are not counted.

All dated holds use one of two review dates: **2026-11-16** (Monday) for agent-host and vega work, and **2027-01-04** (Monday) for work with no current consumer.

### ki-agentic-harness

| Record | What it is | Recommendation | Reason |
| --- | --- | --- | --- |
| [KI-HARNESS-GOV-174](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-174-portable-live-artifact-standard.md) | Live-artifact skill gains manifest and bridge fields for hosts other than Cowork | **Duplicate of KI-SPEC-KIN-003** | Same contract. Kris put its home in ki-specifications and froze it there (Decision 153). The Observatory keeps its own working contract until then. |
| [KI-HARNESS-GOV-179](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-179-diagram-html-commit-opt-in.md) | Diagrams manifest field that lets a repository commit the interactive HTML | **Defer, hold until 2026-11-16** | Kris asked for it (HTML-COMMIT), but nothing depends on it and the HTML can be rebuilt locally. Each regeneration adds about 800 KB to Git history. Burn-down comes first. |
| [KI-HARNESS-GOV-180](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-180-tracked-thread-decisions-home.md) | `ki-delegation` standard moves decisions logs and reports to a tracked `+/_THREADS/<thread>/` | **Adopt, Next, deliver** | Kris asked for it (DECISION-HOME), and it fixes a durability defect: losing the state folder loses decisions. It must come before KI-TOOL-KI-CLI-124 and KI-PRINCIPAL-ECO-014. |

### ki-principal

| Record | What it is | Recommendation | Reason |
| --- | --- | --- | --- |
| [KI-PRINCIPAL-ECO-014](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md) | Rewrite decision-number citations across repositories, then reconcile and archive 8 closed run folders | **Adopt, Next, deliver** | Kris asked for it (CITE-RULE, STATE-CLEANUP). The citation sweep can start now. The folder sweep waits for KI-TOOL-KI-CLI-124. It closes more state than it adds. |

### ki-specifications

| Record | What it is | Recommendation | Reason |
| --- | --- | --- | --- |
| [KI-SPEC-KIN-003](/Users/krisbrown/workspaces/knowledge-islands/ki-specifications/docs/roadmap/KI-SPEC-KIN-003-portable-live-artifact-contract.md) | Portable live-artifact contract, the specification counterpart of KI-HARNESS-GOV-174 | **Defer, hold until 2027-01-04** | Kris has stopped moving ki-specifications forward (Decision 153), and the repository is dormant until the v1 boundary review. A dated hold replaces leaving it in triage indefinitely. |

### ki-techne-harness

| Record | What it is | Recommendation | Reason |
| --- | --- | --- | --- |
| [KI-TECHNE-OPS-025](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-025-agentic-rig-roles-folder.md) | Move the agent-host Rig profile into a `roles/` folder outside any recipe | **Merge into KI-TECHNE-OPS-018** | KI-TECHNE-OPS-018 is already on hold to be reshaped for the audit decisions when vega is rebuilt. The move only matters to that reshape and to KI-TECHNE-OPS-024, which is also held. |
| [KI-TECHNE-OPS-026](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-026-agent-host-tailnet-only-firewall.md) | Declare Rig's Linux nftables firewall in the agent-host profile | **Merge into KI-TECHNE-OPS-018** | It is not a defect: the stack has no public inbound rule. It depends on an unreleased Rig provider and on rebuilding vega, and it belongs in the same role-profile reshape. |

### tools-ki

| Record | What it is | Recommendation | Reason |
| --- | --- | --- | --- |
| [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md) | `ki agent` writes the log and reports to the tracked home; `ki agent close` with a reconcile gate | **Adopt, Next, deliver** | Kris approved it (STATE-CLEANUP: "Yes; queue after durability"). It is the mechanism behind KI-HARNESS-GOV-180, and there are 25 run folders, the largest 851 MB. |
| [KI-TOOL-KI-CLI-125](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-125-ki-release-contract.md) | Written KI release contract plus a linux-arm64 `ki` archive | **Defer, hold until 2026-11-16** | No ARM host exists and vega is deleted. `ki` already ships signed archives for the three platforms in use. Review it with the vega rebuild. |

### tools-rig

| Record | What it is | Recommendation | Reason |
| --- | --- | --- | --- |
| [KI-TOOL-RIG-CORE-046](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-046-remote-access-and-continuity.md) | Profile declarations for Screen Sharing, Handoff and Universal Control | **Defer, hold until 2027-01-04** | Kris asked for it (mac-studio-bootstrap Decision 45). The exposure risk is already split into KI-TOOL-RIG-CORE-047. What remains is drift on two Macs that are already set by hand and documented in the chezmoi guide, and recent macOS mostly blocks setting these from a script. |
| [KI-TOOL-RIG-CORE-048](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-048-signed-release-install-kind.md) | Built-in Rig install kind for signed-release archives (`ki`, `techne`) | **Defer, hold until 2026-11-16** | Its only consumer is gate 1 of KI-TECHNE-OPS-018, which is on hold until vega is rebuilt. Adopting it now would create work no host can use. |
| [KI-TOOL-RIG-CORE-049](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-049-shared-agentic-rig-role.md) | One agentic-rig role shared by `sol` and `vega` | **Defer, hold until 2026-11-16** | vega does not exist, so a role shared across two hosts has only one host. The record expects existing `conf.d` composition may already be enough. Review it with the vega rebuild. |
| [KI-TOOL-RIG-CORE-050](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-050-mise-observed-executables.md) | Mise tool kind can name the executable to observe, apart from the locator | **Adopt, Next, deliver (defect)** | A provider defect: `rust` and `cargo:` tools always report missing, so chezmoi keeps them out of Rig's catalogue. The fix is a small optional field. Kris approved the handoff on 2026-10-14. |

### chezmoi (`krisb/dotfiles`)

| Record | What it is | Recommendation | Reason |
| --- | --- | --- | --- |
| [KB-DOTFILES-UE-087](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-087-manage-headroom-profile-arguments.md) | Single declared source for the `init-user` Headroom profile's proxy arguments | **Reject** | Its defects are gone: the `default` profile was removed (Decision 153). The guide's `headroom install apply` command and `dot_zsh/50_headroom` already declare the arguments. What is left is one attended re-run of that command, which is an action, not roadmap work (see HEADROOM-APPLY). |
| [KB-DOTFILES-UE-088](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-088-ssh-alias-for-sol.md) | `Host sol` SSH alias with agent forwarding scoped to that host | **Adopt, Next, deliver** | Kris asked for it in mac-studio-bootstrap. It is a few lines in `private_dot_ssh/private_config` plus a guide edit, and can be delivered and closed in one short run. |

## What is in progress

Nothing. This run only made recommendations. Applying approved dispositions (`ki-next` for adopt, defer and merge; `ki-accept` for reject and duplicate closures) needs a separate run with write authority in each repository.

## Outstanding queries

### TRIAGE-BURNDOWN - approve the 15 dispositions

**Summary:** 1 duplicate, 2 merges and 1 rejection close 4 records. 5 records move to dated holds and 6 are adopted.

**Need from you:** Approve the whole set, or name any line you want changed.

**Recommendation:** Approve as written. Then launch one apply run per repository, using `ki-next` for adopt, defer and merge and `ki-accept` for the closures. When merging into KI-TECHNE-OPS-018, carry each merged record's Goal and Boundary into it.

### HEADROOM-APPLY - re-run the Headroom install for `init-user`

**Summary:** The live `~/.headroom/deploy/init-user/run-headroom.sh` still does not set `HEADROOM_COMPRESS_USER_MESSAGES=0`. Until it does, Headroom keeps compressing earlier user turns in long threads, which loses Kris's exact words. Re-running the command restarts the proxy, so it has to be run from a terminal that is not routed through Headroom.

**Need from you:** Run the guide's `headroom install apply` command from a plain terminal, or approve an attended run.

**Recommendation:** Run it yourself before KB-DOTFILES-UE-087 is closed.

```text
TRIAGE-BURNDOWN - approve all as below, or amend line by line:
  KI-HARNESS-GOV-174   duplicate of KI-SPEC-KIN-003
  KI-HARNESS-GOV-179   defer, hold until 2026-11-16
  KI-HARNESS-GOV-180   adopt, Next, deliver
  KI-PRINCIPAL-ECO-014 adopt, Next, deliver
  KI-SPEC-KIN-003      defer, hold until 2027-01-04
  KI-TECHNE-OPS-025    merge into KI-TECHNE-OPS-018
  KI-TECHNE-OPS-026    merge into KI-TECHNE-OPS-018
  KI-TOOL-KI-CLI-124   adopt, Next, deliver
  KI-TOOL-KI-CLI-125   defer, hold until 2026-11-16
  KI-TOOL-RIG-CORE-046 defer, hold until 2027-01-04
  KI-TOOL-RIG-CORE-048 defer, hold until 2026-11-16
  KI-TOOL-RIG-CORE-049 defer, hold until 2026-11-16
  KI-TOOL-RIG-CORE-050 adopt, Next, deliver (defect)
  KB-DOTFILES-UE-087   reject (guide command is the declaration)
  KB-DOTFILES-UE-088   adopt, Next, deliver
HEADROOM-APPLY - I will run it myself / run it attended with me / later
```
