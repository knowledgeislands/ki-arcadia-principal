# Roadmap triage - 2026-10-10

Read-only. All primaries were level with `origin/main` except ki-arcadia-principal, which is one local commit _ahead_, so its primary was read as is. No commits were made and there were no checks to run.

"Thread" means the record belongs to an active thread (Decisions 13, 18 and 31). That thread decides; any disposition shown is only a suggestion.

## ki-arcadia-principal

| Tag | Record | Lifecycle | Disposition | Reason |
| --- | --- | --- | --- | --- |
| ARC-1 | [KI-ARCADIA-MOD-006](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-MOD-006-knowledge-acquisition-lifecycle.md) | ready | KEEP | knowledge-acquisition is queued as a Project thread (Decision 31 THREAD-2); it is the lifecycle note OPS-005 depends on |
| ARC-2 | [KI-ARCADIA-MOD-007](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-MOD-007-retire-runtime-specific-realisation-notes.md) | draft | Thread: island-model-and-tending | Routed by Decision 18 |
| ARC-3 | [KI-ARCADIA-OPS-012](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-OPS-012-bootstrap-the-mac-studio.md) | triage | Thread: Rig: mac-studio-bootstrap | An umbrella record that repeats the Project's own test; suggest the thread cancel it in favour of the Project note |
| ARC-4 | [KI-ARCADIA-OPS-013](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-OPS-013-decide-on-a-delta-trial.md) | draft | IDEA → delta-evaluation note | A decision with no deadline; Paperclip work waits on the Techne hold (Decision 31), so a Delta trial is speculative |

## ki-agentic-harness

| Tag | Record | Lifecycle | Disposition | Reason |
| --- | --- | --- | --- | --- |
| HARN-1 | [KI-HARNESS-GOV-158](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-158-enforce-the-commit-gate.md) | triage | IDEA → baseline-rollout note | An estate-wide rollout with no owner yet; same treatment as KI-HARNESS-GOV-163 (Decision 31 IDEA-1) |
| HARN-2 | [KI-HARNESS-GOV-168](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-168-roll-out-ki-pin-receivers.md) | draft | Thread: island-model-and-tending | baseline-rollout was routed there by Decision 18 |
| HARN-3 | [KI-HARNESS-GOV-169](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-169-roll-up-since-mark.md) | ready | Thread: island-model-and-tending | MARK design (Decision 16), routed by Decision 18 |
| HARN-4 | [KI-HARNESS-GOV-170](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-170-keep-resolution-targets-local.md) | draft | KEEP | Follows from the 2026-10-09 owner decision; changes the standard, the rubric and the tools-ki parser, so more than 30 minutes |
| HARN-5 | [KI-HARNESS-OPS-005](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md) | in-progress | KEEP | Live delivery: 9 of 19 steps done |
| HARN-6 | [KI-HARNESS-OPS-008](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-008-central-granola-acquisition.md) | awaiting-review | ACCEPT | All steps ticked; Review, verification and post-change review are complete; accept with TOOL-3 |
| HARN-7 | [KI-HARNESS-RTP-015](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-RTP-015-verify-run-mcp-connection.md) | ready | IDEA → paperclip-bootstrap-and-recovery note | Paperclip waits on the Techne hold (Decision 31 THREAD-2); it has been idle since 2026-10-07 |

## tools-ki

| Tag | Record | Lifecycle | Disposition | Reason |
| --- | --- | --- | --- | --- |
| TOOL-1 | [KI-TOOL-CLI-115](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-ki/docs/roadmap/KI-TOOL-CLI-115-enforce-roadmap-writing-checkout.md) | triage | Thread: Techne: agent-host | Project agent-host |
| TOOL-2 | [KI-TOOL-CLI-116](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-ki/docs/roadmap/KI-TOOL-CLI-116-launcher-held-wait-gates.md) | triage | KEEP | Caused three delegation failures on 2026-10-09 and affects every chained run; it has no Project, so give it one (ways-of-working?) when it is adopted |
| TOOL-3 | [KI-TOOL-CLI-117](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-ki/docs/roadmap/KI-TOOL-CLI-117-central-granola-acquisition.md) | awaiting-review | ACCEPT | All steps ticked; 1,104 tests and 100% coverage; audits pass apart from the existing CI-1 warning, which is out of scope |

## ki-website

| Tag | Record | Lifecycle | Disposition | Reason |
| --- | --- | --- | --- | --- |
| WEB-1 | [KI-WEB-SITE-001](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-website/docs/roadmap/KI-WEB-SITE-001-interactive-island-geography-diagram.md) | draft (hold) | IDEA → website note | On hold; depends on the geography model and a tile set that have not been delivered |
| WEB-2 | [KI-WEB-SITE-039](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-website/docs/roadmap/KI-WEB-SITE-039-decide-the-landing-pages.md) | draft (hold) | IDEA → website note | On hold since 2026-10-07; 14 steps of open design questions with no owner |

## ki-techne-harness

| Tag | Record | Lifecycle | Disposition | Reason |
| --- | --- | --- | --- | --- |
| TECH-1 | [TECHNE-TOOLS-OPS-016](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-016-rig-provider-for-ki.md) | triage | Thread: Techne: agent-host | |
| TECH-2 | [TECHNE-TOOLS-OPS-017](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-017-zsh-shell-at-rebuild.md) | triage | Thread: Techne: agent-host | Its blocker, TECHNE-TOOLS-OPS-015, is now done |
| TECH-3 | [TECHNE-TOOLS-OPS-018](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-018-converge-tools-through-rig.md) | triage | Thread: Techne: agent-host | |
| TECH-4 | [TECHNE-TOOLS-OPS-019](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-019-person-neutral-recipe-defaults.md) | triage | Thread: Techne: agent-host | |

TECHNE-TOOLS-OPS-015 is already `done` and is not counted; it can be pruned.

## tools-techne

| Tag | Record | Lifecycle | Disposition | Reason |
| --- | --- | --- | --- | --- |
| TTEC-1 | [TECHNE-TOOL-CLI-006](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-techne/docs/roadmap/TECHNE-TOOL-CLI-006-guarded-host-commands.md) | triage | Thread: Techne: agent-host | |
| TTEC-2 | [TECHNE-TOOL-CLI-008](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-techne/docs/roadmap/TECHNE-TOOL-CLI-008-host-patching-fields.md) | triage | Thread: Techne: agent-host | |

## tools-rig

| Tag | Record | Lifecycle | Disposition | Reason |
| --- | --- | --- | --- | --- |
| RIG-1 | [RIG-CORE-041](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md) | triage | Thread: Rig: mac-studio-bootstrap | Should absorb DOT-10 |
| RIG-2 | [RIG-CORE-042](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-042-profile-filtered-dock-items.md) | triage | Thread: Rig: mac-studio-bootstrap | |
| RIG-3 | [RIG-DIST-010](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-DIST-010-release-current-catalogue-reader.md) | triage | Thread: Rig: mac-studio-bootstrap | |

## chezmoi

The whole repository belongs to the Rig: chezmoi thread (Decisions 13 and 31). The dispositions below are suggestions for that thread.

| Tag | Record | Lifecycle | Suggested disposition | Reason |
| --- | --- | --- | --- | --- |
| DOT-1 | [DOTFILES-UE-027](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-027-honest-rationales-per-tool.md) | draft (hold) | IDEA → rig note | On hold since 2026-10-07; it improves wording but is not needed |
| DOT-2 | [DOTFILES-UE-035](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-035-install-whatsapp-spool-refresh.md) | draft | KEEP | The WhatsApp spool is live (state-audit FIX-3); install and prove its refresh job |
| DOT-3 | [DOTFILES-UE-065](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-065-diagnose-same-boot-mcporter-stall.md) | draft (hold) | IDEA → rig note | On hold; only a diagnosis, with no repeat recorded since 2026-10-07 |
| DOT-4 | [DOTFILES-UE-071](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-071-audit-macos-privacy-permissions.md) | triage | IDEA → secrets-hygiene note | A one-off audit with no Project and no deadline |
| DOT-5 | [DOTFILES-UE-072](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-072-machine-neutral-two-checkout-rule.md) | triage | DO-NOW | Rewords the two-checkout rule in the personal Claude and Codex instructions; about 20 minutes of editing |
| DOT-6 | [DOTFILES-UE-074](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-074-host-detached-delegation.md) | triage | IDEA → agent-host note | Only applies "once the delegation contract settles"; agent-host Thread |
| DOT-7 | [DOTFILES-UE-076](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-076-always-run-latest-source.md) | triage | Thread: Rig: mac-studio-bootstrap | Project mac-studio-bootstrap |
| DOT-8 | [DOTFILES-UE-077](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-077-reorganise-1password-vaults-safely.md) | triage | KEEP | secrets-hygiene is active (Decision 31 THREAD-1) |
| DOT-9 | [DOTFILES-UE-078](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-078-repeatable-1password-triage.md) | triage | IDEA → secrets-hygiene note | Blocked by DOTFILES-UE-077; recurring work to set up later |
| DOT-10 | [DOTFILES-UE-079](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md) | triage | MERGE → RIG-CORE-041 | RIG-CORE-041's case (b), "installed but not declared", is the same review of undeclared software |

## Totals

- 35 open records: Arcadia 4, harness 7, tools-ki 3, website 2, techne-harness 4, tools-techne 2, tools-rig 3, chezmoi 10.
- Approving the in-scope proposals (ACCEPT 2, IDEA 5) gives **35 → 28**.
- If the Rig: chezmoi thread also takes its suggestions (IDEA 5, MERGE 1, DO-NOW 1), **35 → 21**.
- 24 records are owned by threads: island-model-and-tending 3, Techne: agent-host 7, Rig: mac-studio-bootstrap 5 (counting DOT-7) and Rig: chezmoi 9 (the other chezmoi records).

## Done

- Gave every open record in the eight repositories one disposition. Read-only: no edits, commits or remote calls.

## Failed

- None.

## Needs Kris

- **Approve or decline:** ACCEPT HARN-6 and TOOL-3, which share one Granola delivery (`ki-accept`). IDEA ARC-4, HARN-1, HARN-7, WEB-1 and WEB-2, each cancelled into the named Project note.
- **Send to the Rig: chezmoi thread:** DOT-1, DOT-3, DOT-4, DOT-6, DOT-9 (IDEA), DOT-10 (MERGE into RIG-CORE-041) and DOT-5 (DO-NOW).
- **Prune:** TECHNE-TOOLS-OPS-015 is done and can be pruned by the Techne: agent-host thread.
- **Decide:** KI-TOOL-CLI-116 (TOOL-2) has no Project. Name one (ways-of-working is the likely fit).
