# Triage review - proposals (read-only, nothing changed)

## Done

Reviewed 13 triage records and listed 12 adopted, non-done records. No files were changed and nothing was committed.

### Triage proposals

| Record | Proposal | Reason |
| --- | --- | --- |
| [KI-PRINCIPAL-OPS-012](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-OPS-012-bootstrap-the-mac-studio.md) | **Reject (overtaken)** | The mac-studio-bootstrap Project and its `rig.mac-studio-bootstrap` checkpoint did the work. Only Kris's attended restart test (FileVault unlock, Tailscale relaunch) remains, and the Project's checkpoint already tracks it. A record would duplicate the Project. |
| [KI-HARNESS-GOV-171](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-171-standing-surface-design-rules.md) | **Adopt**, Next, deliver (guidance) | A small, runtime-neutral addition to `ki-tokenomics`. The skill does not yet state these rules. It fits CLAUDE-MEMORY (Decision 142), which moves path memory into repository guidance. Before planning, reword the "lessons in memory" point: Decision 142 now says to stop relying on memory. |
| [KI-HARNESS-GOV-172](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-172-claude-context-layer-reliability.md) | **Merge into KI-HARNESS-GOV-171** | Both records come from the same Arcadia handoff about where a rule should live. One guidance change can carry the Claude-adapter note, after checking current Claude Code layer behaviour. If the two must stay in separate skills, adopt it as Next instead. |
| [KI-TOOL-KI-CLI-122](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-122-accepted-audit-deviations.md) | **Reject** | Kris chose to have Tower conform with no waiver (Decision 142, TOWER), and the tower-conform run covers that. Kris also said on 2026-10-12 that this escape hatch is too big (Decision 140). |
| [KI-TECHNE-OPS-018](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-018-converge-tools-through-rig.md) | **Adopt**, Hold, deliver (debt) | Still valid as stage 3 of ADR-KI-PRINCIPAL-003. Its record already sets gates: Rig must install the signed `ki` release, and `rig status` must stay clean through a pin bump. vega was deleted and is not rebuilt yet, so the second gate cannot clear for now. Put it on Hold with those conditions; leaving it in Triage hides that it is accepted work. |
| [KI-TECHNE-OPS-019](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-019-person-neutral-recipe-defaults.md) | **Adopt**, Next, deliver (debt) | ADR-KI-PRINCIPAL-006 forbids person-specific defaults, so the current recipe is non-conforming. The change is local with no remote action, which the Techne Programme Hold allows. Do it before vega is rebuilt. A paired `tools-techne` record for the binding fields will be needed at planning. |
| [KI-TECHNE-OPS-023](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-023-controller-target-stack-tags.md) | **Adopt**, Future, deliver (debt) | The stale `TECHNE-OPS-007` tag also guards deletion in `destroy.sh`, so it matters. The repository change can land first, but live stack updates need remote authority that the hold does not grant. Low urgency, and it needs Kris's decision on naming the replacement tag at planning. |
| [KB-DOTFILES-UE-071](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-071-audit-macos-privacy-permissions.md) | **Adopt**, Future, audit | It is real security hygiene: interpreter grants include `node` controlling Chrome. Kris explicitly deferred it on 2026-10-08, and it needs Kris at the machine. |
| [KB-DOTFILES-UE-076](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-076-always-run-latest-source.md) | **Adopt**, Next, deliver | Kris asked for it (mac-studio-bootstrap Decision 8). With two Macs, plus vega when it returns, stale source is a live risk. It is small, local, chezmoi-owned work. |
| [KB-DOTFILES-UE-077](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-077-reorganise-1password-vaults-safely.md) | **Adopt**, Next, deliver (corrective). **Rescope first** | Partly overtaken: the Automation vault and its service account (Decisions 131, 134 and 136) moved the 7 automation items. chezmoi now reads through the Automation account, and the Rig account is revoked. What remains is Kris's target layout for other vaults, any leftover references to "Personal" or "HNR (Kris)", and clearing orphaned plaintext `op-cache` entries. The Rig service account's follow-up guidance (Decision 129) also belongs here. |
| [KB-DOTFILES-UE-082](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-082-tolerate-missing-template-tools.md) | **Adopt**, Next, deliver | Still live: `.chezmoitemplates/mcp-servers-json:117` still calls `output "which"`. Any new machine, including vega's rebuild, hits the failure on its first apply. Small, with clear open questions for planning. |
| [KB-DOTFILES-UE-084](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-084-render-zshenv-on-vega.md) | **Adopt**, Hold, deliver. Condition: vega rebuild | vega was deleted (Decisions 257 and 293) and will be rebuilt later. `hosts/vega.toml` still lacks `.zshenv`. It is a one-line, low-risk change and could land now if preferred. |
| [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) | **Adopt**, Next, deliver. Kris-attended | It carries KB-DOTFILES-UE-079's leftovers. It needs Kris to decide the four open items (Mercury, Clockology, Prime Video, `pipx:maturin`) and to be at `sol` for the uninstalls. |

### Adopted, non-done records

| Record | Status / horizon | Kris now? | Why |
| --- | --- | --- | --- |
| [KI-PRINCIPAL-MOD-006](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-MOD-006-knowledge-acquisition-lifecycle.md) | ready / next | Delegation | Planned and Ready, so implementation can be delegated. Kris reviews at awaiting-review. |
| [KI-PRINCIPAL-MOD-008](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-MOD-008-whole-philosophy-coherence-review.md) | draft / future | No | Future. When it starts, Kris should be involved. |
| [KI-HARNESS-OPS-005](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md) | in-progress / now | Delegation | Read-only acquisition can continue. Deleting source sessions needs Kris to approve the exact manifest, and project routing needs an approved ChatGPT project map. |
| [KI-HARNESS-GOV-168](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-168-roll-out-ki-pin-receivers.md) | draft / future | No (later, Kris-attended) | Owner setup in each repository (ruleset, App, secret, auto-merge) needs Kris when it is scheduled. |
| [KI-HARNESS-GOV-170](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-170-keep-resolution-targets-local.md) | draft / future | No | Must be re-scoped before it becomes actionable. No current work needs it. |
| [KI-TOOL-KI-CLI-115](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-115-enforce-roadmap-writing-checkout.md) | draft / hold | On hold, Kris release | Held until Kris explicitly releases local planning through Techne: agent-host. |
| [KI-TOOL-RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md) | draft / next | **Yes - plan approval** | The plan has been proposed. Implementation waits for Kris to approve it. |
| [KI-TOOL-TECHNE-CLI-006](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-006-guarded-host-commands.md) | draft / next | **Yes - plan review** | Local planning was released (tools-burndown Decision 15). Kris's review of the plan is the Ready gate. It runs after KI-TOOL-TECHNE-CLI-008. |
| [KI-TOOL-TECHNE-CLI-008](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-008-host-patching-fields.md) | draft / next | **Yes - gate** | The plan is approved. Kris must either supply evidence that vega is ready or approve local implementation in parallel. vega is deleted, so parallel approval is the only route now. |
| [KI-TECHNE-OPS-024](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-024-weekly-pin-bump.md) | ready / hold | On hold | Held until the repository has a housekeeping mechanism. Installing the Mac scheduler would need its own approval. |
| [KB-DOTFILES-UE-027](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-027-honest-rationales-per-tool.md) | draft / hold | **Yes - Kris input** | Waiting for Kris's rationale decisions: 10 proposals in `-/rig-rationale-review.md` and 111 entries in small batches. |
| [KB-DOTFILES-UE-035](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-035-install-whatsapp-spool-refresh.md) | draft / hold | Delegation | Waiting for evidence: an agent can check the next unattended 10:15 spool-refresh log and its counts. |

## Failed

None.

## Needs Kris

1. Approve or amend the 13 triage proposals above, especially the rejection of KI-PRINCIPAL-OPS-012 and the merge of KI-HARNESS-GOV-172 into KI-HARNESS-GOV-171.
2. KB-DOTFILES-UE-077: confirm the target vault layout, or close the record once the Automation vault split is enough.
3. KI-TOOL-RIG-CORE-042: approve its plan. KI-TOOL-TECHNE-CLI-006: review its plan. KI-TOOL-TECHNE-CLI-008: approve local implementation in parallel, because vega is deleted.
4. KB-DOTFILES-UE-027 and KB-DOTFILES-UE-086: decisions on rationales and on the four open software items.
