# dock-records - Dock declaration record and [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) amendment - owner report

Thread [rig.mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.mac-studio-setup.md). Run on sol, locally, 2026-10-14, finished about 18:58 BST. State: done. Authority: Kris, decisions log Decision 73 (`/Users/krisbrown/.local/state/ki/agents/mac-studio-bootstrap/decisions.md`): DOCK-CONSUMER, DOCK-APPLY-SOL, UE086-AMEND, UE086-SOL-PASS.

Docs and roadmap only, in the chezmoi source. No configuration changed, nothing applied or installed, no push, no network calls, no secrets read.

## What has been done

- **DOCK-CONSUMER captured** as triage record [KB-DOTFILES-UE-091](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-091-shared-dock-tool-links.md), "Shared Dock tool links". It covers:
  - moving `[dock.workstation]` from `laptop` to `core`, with `tool = "ID"` links, once [KI-TOOL-RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md) reaches Awaiting review;
  - linking `chatgpt-classic` to `chatgpt`, and putting `chatgpt-current` in `core`;
  - Lightroom Classic as a new item straight after Photos;
  - your rule: "same order as the laptop, filtered by what each profile selects";
  - you run the sol acceptance apply yourself.
  It also notes that seven system apps and folders stay unlinked, so they show on every Mac.
- **The issue ledger is advanced to UE-091** in its own commit first, as the repository's ledger rule requires. The audit flagged the original five-word title, so it is now four words.
- **[KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) is amended** as rig-diff recommended. A new "14 October amendment" table sets out these changes:
  - Photoshop 2026 and Creative Cloud are declared `studio` artefact-only (new source step A8).
  - Photoshop 2023 to 2025 are removed through Creative Cloud (new step C7i).
  - ABBYY FineReader moves into C7b.
  - The `ai.hermes.gateway` launch agent is booted out and its plist removed in C7f.
  - Keynote, Numbers and Pages are declared in `core` from the App Store (A8).
  - DaVinci Resolve gets App Store id 571213070 (A8).
  - Canon Utilities, the Chrome apps and Simulator are left undeclared, now listed under Boundary Out.
  - Your timing is recorded: section C plus `mise prune` in the same sol session as SOL-CLT, straight after `rig upgrade`. `mise prune --dry-run`, then `mise prune`, is added to C2.
  - New check step C8, and updates to the removal list, Files touched, Verify and Delegation.
- **Commits** (local, `main`, unpushed): `f3a07bc` (ledger), `da9ddce` ([KB-DOTFILES-UE-091](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-091-shared-dock-tool-links.md)), `415d14c` ([KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md)). The working tree is clean, with no Git locks left behind.
- **Checks:**
  - `rumdl check .` is clean.
  - `node --test tests/*.test.mjs` gives 228 passed and 4 failed. The same 4 fail at `bd82eda`, before this run, in a clean copy of that commit.
  - `ki repo audit --repo .` shows no findings from this run. Its two roadmap findings came from this run (ledger and title) and are fixed.

### Gate failures that were there before this run

| Check | Failure | Cause |
| --- | --- | --- |
| `node --test` | `tests/ki-self-skill.test.mjs` | bare "test failed" at file level; earlier runs traced the same failure to the dangling `.agents/skills/ki-work-housekeeping` link ([KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) notes) |
| `node --test` | `rig-catalogue`: "core plus laptop resolves the former default selection" | the expected list still has `tool.paperclip-agents`, which the laptop selection no longer resolves |
| `node --test` | `rig-catalogue`: "stable private ports retain explicit owners" | assertion mismatch on port owners; not investigated (no configuration in scope) |
| `node --test` | "the real source's isolated exit 40 reaches the wrapper reporter" | `5g-emerge-phase2/apps/site` checkout on sol lacks the `json5` package (dependencies not installed) |
| `ki repo audit` | 8 × RUNTIMES-2, 1 × RUNTIMES-3 | ki-binding, ki-housekeeping and ki-tokenomics skill sets not activated for every runtime; no `.claude/skills/ki-self` projection |
| `ki repo audit` | HOOK-1 warning | no committed pre-commit gate (stays with [KI-HARNESS-GOV-117 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/924b420d3497584b209fcaab0191fc2ad29f2b04/docs/roadmap/KI-HARNESS-GOV-117-govern-hooks-beyond-packages.md), per RENDER-HOOK) |

## What is in progress

Nothing is running. [KB-DOTFILES-UE-091](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-091-shared-dock-tool-links.md) waits for [KI-TOOL-RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md) to reach Awaiting review. [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md)'s new A8 is source work any agent can do under `ki-implement`; C7i and C8 join your at-screen section C.

## Outstanding queries

### UE091-ADOPT - When to adopt the Dock record

**Summary:** [KB-DOTFILES-UE-091](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-091-shared-dock-tool-links.md) is triage only, so it cannot be delivered until it is adopted. It is useful only once [KI-TOOL-RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md) reaches Awaiting review, because that record's sol acceptance check needs it.

**Need from you:** decide when to adopt it.

**Recommendation:** adopt it as `deliver / Next` now, and plan it to Ready when [KI-TOOL-RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md) reaches Awaiting review.

### UE086-A8 - Who does the new source step

**Summary:** A8 changes the Rig declarations: Photoshop, Creative Cloud, iWork and the DaVinci App Store route. It needs the artefact paths and App Store ids read on sol, plus `rig doctor` captured before and after. It is source only, with no apply.

**Need from you:** approve an agent doing A8 on sol, with a local commit only.

**Recommendation:** have a background agent do A8 before your SOL-CLT session, so that session's apply picks it up and C8 can check it.

### PUSH-DOCK-RECORDS - Push these three commits

**Summary:** sol's chezmoi checkout now has these three commits on top of the 7 unpushed ones CHEZMOI-PUSH covers.

**Need from you:** include them in the chezmoi push.

**Recommendation:** push them with CHEZMOI-PUSH.

```text
UE091-ADOPT - adopt KB-DOTFILES-UE-091 as deliver / Next now; plan it when KI-TOOL-RIG-CORE-042 reaches Awaiting review
UE086-A8 - approved: a background agent does KB-DOTFILES-UE-086 step A8 on sol before the SOL-CLT session; local commit only
PUSH-DOCK-RECORDS - push f3a07bc, da9ddce and 415d14c with CHEZMOI-PUSH
```
