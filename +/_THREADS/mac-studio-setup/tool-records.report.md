# tool-records - Rig, ki and Dock records from the sol bring-up - owner report

Thread [rig.mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.mac-studio-setup.md), Project [mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md). Run on sol, locally, 2026-10-14, finishing about 17:45 BST (sol's clock). Authority: Kris, 2026-10-14, decision 70 (RIG-RECORDS, TOOL-RECORDS, SOL-DOCK-ZED, SOL-DOCK-EXTRAS).

All commits are local. Nothing was pushed or fetched, and there were no brew or `rig apply` runs, no network calls, nothing in hnr-org and no secrets read. The one machine read was a check of which process owns Headroom's port 8787. It matched the command line against words without printing it.

## What has been done

- **tools-rig: two triage records captured** (R1, R3), each with its number reserved by a separate commit first:
  - [KI-TOOL-RIG-CORE-054 Command Line Tools check](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-054-command-line-tools-check.md): `rig doctor` names Command Line Tools older than macOS as the shared cause before an upgrade (D1).
  - [KI-TOOL-RIG-CORE-055 Interpreter port owner matching](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-055-interpreter-port-owner-matching.md) (D13). New evidence: Headroom runs as `Python -m headroom...`, while Rig expects the uv package name `headroom-ai`. Neither name matches the way the port-owner rule (RIG-STATE-026) requires, so a readable non-match counts as `conflicting`.
  - Commits `98420fc` (reserve) and `1506d47` (records).
- **ki-principal: R2 and R4 noted** in the Project note's Notes section. Commit `5c8e3f6`, that file alone. No pull was needed: the checkout was level with `origin/main` and clean.
- **tools-ki: two triage records captured** (K2, K3):
  - [KI-TOOL-KI-CLI-128 Launch footer follows brief](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-128-launch-footer-follows-brief.md) (D38). The four tiers grant only remote publishing, so no tier covers fetch-without-push or an approved change to a machine. The progress protocol always names the thread-folder report path. The footer is cut from the first mention of `## Rules`, so every prompt carries a stray intro fragment. The `ki-delegation` side in ki-agentic-harness is written up as a handoff in the Boundary section.
  - [KI-TOOL-KI-CLI-129 Reused agent name overwrites](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-129-reused-agent-name-overwrites.md) (D39). `launch` refuses a name only while it is running; `queue` already refuses one that is in use.
  - Commits `a4bb37bf` (reserve) and `8b6bc803` (records).
- **tools-rig: [KI-TOOL-RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md) promoted from Next to Now.** It was already Ready (plan approved 12 October), so it needed no reshaping or replan. Commit `b7cf6b3`.
  - Kris's rule ("same order as the laptop, filtered by what each profile selects") is added to Context.
  - A new "Acceptance check on sol" section covers the post-delivery check:
    - before the apply, `rig show` and `rig doctor` report Zed missing from sol's Dock;
    - `rig apply` puts Zed between Claude and Visual Studio Code, with Delta, RendApp and The Tower absent;
    - `rig doctor` then reports the Dock present, and terra's Dock is unchanged;
    - if the check fails, the record goes back through failed review, never through a manual fix.
  - Today's profile selections are recorded. Zed, NordVPN, ChatGPT, LaunchControl, draw.io and Telegram are in both profiles. Delta, RendApp and The Tower are laptop-only. Lightroom Classic is studio-only and has no place in the laptop's Dock list.
- **Checks:** for each repository, `ki repo audit --skill ki-work-roadmap` reported FAIL=0 and one warning: the ki registry on sol is missing (SOL-REGISTRY, parked). `rumdl` was clean on every touched file, and `git diff --check` was clean. One audit failure, a title over four words, was fixed before commit. The tools-ki commit hook rejected a first commit message for line length; the reworded commit passed every hook. Prettier wasn't run because it isn't installed locally.

## What is in progress

Nothing is running, and the records are not being implemented. Six commits are local and unpushed: three in tools-rig, two in tools-ki and one in ki-principal. This report is also copied to the thread folder and is uncommitted there.

The chezmoi source checkout has someone else's uncommitted change in `dot_config/rig/conf.d/private_10-applications.toml`, probably the running chezmoi-fix agent. I read the Dock declaration there and touched nothing.

Like D38, this run's brief and progress protocol named different report paths. I wrote the report to both.

## Outstanding queries

### DOCK-CONSUMER - Who changes the personal Dock declaration

**Summary:** the acceptance check needs a change in the chezmoi source after KI-TOOL-RIG-CORE-042 lands: `[dock.workstation]` moves from `laptop` to `core`, and each machine-specific item links to its tool with `tool = "ID"`. The record that owned this, KB-DOTFILES-UE-075, is no longer open in the chezmoi source, so the change has no record.

**Need from you:** approve capturing a chezmoi triage record for it.

**Recommendation:** have the next chezmoi run capture it as a KB-DOTFILES triage record, to be delivered once KI-TOOL-RIG-CORE-042 reaches Awaiting review.

### DOCK-LIGHTROOM - Where Lightroom Classic goes in the shared Dock

**Summary:** Lightroom Classic is studio-only and is on sol's Dock today, but the laptop's list has no place for it. Following the "same order as the laptop" rule with nothing else would drop it from sol's Dock.

**Need from you:** choose its place in the shared list.

**Recommendation:** put it straight after Photos. It is excluded on the laptop, so the laptop doesn't change.

### DOCK-APPLY-SOL - Who runs the live check on sol

**Summary:** the acceptance check needs a live `rig apply` on sol with the Dock in scope. The fixture-only delivery grant excludes that, as do this thread's limits.

**Need from you:** say who runs it, and when.

**Recommendation:** at acceptance, you run it at sol's screen, or approve one named agent run for that apply alone.

### PUSH-TOOL-RECORDS - Pushing the six local commits

**Summary:** the commits are local in tools-rig (3), tools-ki (2) and ki-principal (1).

**Need from you:** decide when to push them.

**Recommendation:** push them with the thread's next push round.

### Reply block

```text
DOCK-CONSUMER - capture a KB-DOTFILES triage record for moving dock.workstation to core with tool links, delivered after KI-TOOL-RIG-CORE-042 reaches Awaiting review
DOCK-LIGHTROOM - place adobe-lightroom-classic straight after photos in the shared Dock list
DOCK-APPLY-SOL - I run the sol acceptance apply myself at acceptance
PUSH-TOOL-RECORDS - push the tools-rig, tools-ki and ki-principal commits with the next push round
```
