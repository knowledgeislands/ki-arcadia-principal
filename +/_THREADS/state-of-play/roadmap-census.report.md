# roadmap-census report

## Done

- I took a census of the Knowledge Islands roadmaps. There are 19 open records across seven repositories, and four terminal records still to prune. tools-mgit has no open records, and neither have ki-specifications or the twelve mcp, app and tap repositories. The full plan, with a table per repository, is in [roadmap-census.plan.md](/Users/krisbrown/.local/state/ki/agents/state-of-play/roadmap-census.plan.md). The run was read-only: no commits were made and no checks were needed.
- **Batch A: tools-ki first, then the releases**
  - `RM-A1-ACCEPT-116`: accept [KI-TOOL-KI-CLI-116](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-116-launcher-held-wait-gates.md). Its packet is sound and its wait gate worked for this run. Then prune it and [KI-TOOL-KI-CLI-120](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-120-personal-territory-ranking.md).
  - `RM-A2-CANCEL-115`: cancel [KI-TOOL-KI-CLI-115](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-115-enforce-roadmap-writing-checkout.md) into the agent-host checkpoint, because the agent-host work is on hold.
  - `RM-A3-DELIVER-121`: deliver [KI-TOOL-KI-CLI-121](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-121-config-writer-and-relaunch.md), the fix for the config writer that drops `[territories]`. Small.
  - `RM-A4-DELIVER-118`: deliver [KI-TOOL-KI-CLI-118](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-118-capital-stores-and-territory-aliases.md). Medium to large; it needs your two plan choices first.
  - `RM-A5-RELEASE`: release ki and mgit once A1 to A4 are accepted.
- **Batch B: tidying only, no delivery**
  - `RM-B1-PRUNE`: prune [KI-OBSERVA-APP-041](/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/docs/roadmap/KI-OBSERVA-APP-041-adopt-territory-selection.md), [KI-TECHNE-OPS-017](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-017-zsh-shell-at-rebuild.md) and [KI-TECHNE-OPS-016](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-016-rig-provider-for-ki.md).
  - `RM-B2-CANCEL-168`: cancel [KI-HARNESS-GOV-168](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-168-roll-out-ki-pin-receivers.md) into the baseline-rollout checkpoint.
  - `RM-B3-FORMAL-HOLDS`: mark eight records as formally held, with your existing reasons. The Techne agent-host records are [KI-TECHNE-OPS-018](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-018-converge-tools-through-rig.md), [KI-TECHNE-OPS-019](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-019-person-neutral-recipe-defaults.md), [KI-TECHNE-OPS-023](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-023-controller-target-stack-tags.md), [KI-TOOL-TECHNE-CLI-006](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-006-guarded-host-commands.md) and [KI-TOOL-TECHNE-CLI-008](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-008-host-patching-fields.md). The Rig mac-studio-bootstrap records are [KI-PRINCIPAL-OPS-012](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-OPS-012-bootstrap-the-mac-studio.md) and [KI-TOOL-RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md). [KI-PRINCIPAL-MOD-008](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-MOD-008-whole-philosophy-coherence-review.md) waits until the roadmaps are near zero.
- **Batch C: small harness documentation changes**
  - `RM-C1-TOKENOMICS`: merge [KI-HARNESS-GOV-172](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-172-claude-context-layer-reliability.md) into [KI-HARNESS-GOV-171](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-171-standing-surface-design-rules.md) and deliver it. Small.
  - `RM-C2-LOCAL-TARGETS`: deliver [KI-HARNESS-GOV-170](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-170-keep-resolution-targets-local.md). Small to medium. Send the tools-ki handoff only if tools-ki actually needs a change, so that tools-ki is not reopened after release.
- **Batch D: knowledge acquisition, both medium**
  - `RM-D1-ACQ-NOTE`: deliver [KI-PRINCIPAL-MOD-006](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-MOD-006-knowledge-acquisition-lifecycle.md), which is already Ready.
  - `RM-D2-ACQ-RESCOPE`: narrow [KI-HARNESS-OPS-005](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-OPS-005-acquire-ai-sessions.md), 51 days old, to the work it has delivered, and submit that for acceptance. The ten unfinished steps go into the knowledge-acquisition checkpoint.
- **What remains:** after every batch, nine records stay open, all on hold for reasons you have given: six for Techne agent-host, two for Rig mac-studio-bootstrap, and KI-PRINCIPAL-MOD-008. The alternative `RM-B3-ALT-PARK` would cancel the seven held triage records into their Project checkpoints instead, leaving two open records. I recommend holding them rather than parking them.

## Failed

- `ki territory roots -t knowledge-islands` fails because `apps-observatory` is not registered. The Capital still lists `apps-observatory`, but the checkout is now `apps-observatory.local`. I worked around it by walking `~/workspaces/knowledge-islands/`. The diagnostic is folded into `RM-A4-DELIVER-118`.

## Needs Kris

- Approve batches by tag. A1, A2, B1, B2 and B3 can run together in one tidy-up pass.
- `RM-D2-ACQ-RESCOPE`: choose between rescoping and accepting KI-HARNESS-OPS-005 (recommended) and holding it behind the queued knowledge-acquisition thread.
- `RM-A4-DELIVER-118` needs your two plan choices: the naming rule for Capitals without a prefix, and whether to keep the read-only scan of historical store names.
- `RM-B3-FORMAL-HOLDS` (recommended) or `RM-B3-ALT-PARK`.
