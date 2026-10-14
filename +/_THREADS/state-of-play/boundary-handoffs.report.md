# Boundary handoffs - report

## Done

- **ki-techne-harness:** captured KI-TECHNE-OPS-025 (agentic-rig roles folder) as triage. Not blocked; KI-TECHNE-OPS-024's pin-bump tool waits on it. The provider replacement extends KI-TECHNE-OPS-018 rather than duplicating it: a Discussion note records that the Rig kind replaces its harness provider, with Claude Code in scope. Boundary, horizon and hold are unchanged; the receiver reshapes them at planning. Commits 1f3734d, e8f5894.
- **tools-rig:** captured KI-TOOL-RIG-CORE-048 (signed-release install kind) and KI-TOOL-RIG-CORE-049 (shared agentic-rig role) as triage. 048 is not blocked but blocks the harness's converge-through-Rig gate. 049 neither blocks nor is blocked. Commits bc634ff, bc1961d.
- **tools-ki:** captured KI-TOOL-KI-CLI-125 (KI release contract: four platforms including linux-arm64, signed manifest, installer; the Homebrew tap is one channel; apt, AUR and Nix deferred). Neither blocks nor is blocked. Commits a65875d, 88a497e.
- **tools-techne:** needs nothing. It does not read the recipe's pin path, so nothing was captured.
- **chezmoi:** nothing captured. No open record contradicts the personal-layer-only boundary; KB-DOTFILES-UE-084 is personal layer only.
- **ki-principal** (df5cdc7):
  - ADR-KI-PRINCIPAL-003 amended in place: Rig installs `ki` through a `tools-rig` signed-release kind, and Consequences moves ownership of the kind to `tools-rig`.
  - The `direct-host` to `agent-host` rename is finished in ADR-KI-PRINCIPAL-003, ADR-KI-PRINCIPAL-006, GDR-KI-PRINCIPAL-004 and ODR-KI-PRINCIPAL-001.
  - The Rig and Techne Initiative directions now match the accepted layers. They record that vega stays on Ubuntu LTS, Omarchy is kept for a future owned Linux workstation, and the appliance is a third role with no recipe.
- **Checks:** the roadmap audit passes in all three receivers. The ki-principal KB audit shows 2 FAIL and 2 WARN, none in the touched files: GitHub topics (TOPICS-1), the Enactment anchor (PRINCIPAL-2), and two Project close-outs (STREAM-10). All commits are pushed fast-forward.

## Failed

- None.

## Needs Kris

- None.
