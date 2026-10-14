# Triage apply - report

## Done

- [KI-PRINCIPAL-OPS-012](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/) - cancelled (rejected) `e8ebb15`, pruned `30fad6d` (ki-principal, **not pushed**, see Needs Kris).
- [KI-TOOL-KI-CLI-122](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/) - cancelled (rejected) `ae8ffdd`, pruned `de4cec0`, pushed.
- [KI-HARNESS-GOV-172](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/) - cancelled (merged into KI-HARNESS-GOV-171) `f481a1f5`, pruned `8817b32c`, pushed.
- [KI-HARNESS-GOV-171](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-171-standing-surface-design-rules.md) - draft / Next, deliver; GOV-172's Claude adapter note merged in, lessons point reworded per Decision 142. `f481a1f5`, `986a81f4`, pushed.
- [KI-TECHNE-OPS-018](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-018-converge-tools-through-rig.md) - draft / Hold (waiting-for signed ki via Rig and vega rebuild; review 2026-11-12), deliver. `dd66922`, pushed.
- [KI-TECHNE-OPS-019](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-019-person-neutral-recipe-defaults.md) - draft / Next, deliver. `dd66922`, pushed.
- [KI-TECHNE-OPS-023](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-023-controller-target-stack-tags.md) - draft / Future, deliver. `dd66922`, pushed.
- [KB-DOTFILES-UE-071](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-071-audit-macos-privacy-permissions.md) - draft / Future, audit. `67bf3d3`, pushed.
- [KB-DOTFILES-UE-076](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-076-always-run-latest-source.md) - draft / Next, deliver. `67bf3d3`, pushed.
- [KB-DOTFILES-UE-077](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-077-reorganise-1password-vaults-safely.md) - draft / Next, deliver; Goal and Boundary rescoped to leftover vault and service-account references, orphaned `op-cache` entries and Decision 129 guidance; vault layout out of scope. `67bf3d3`, pushed.
- [KB-DOTFILES-UE-082](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-082-tolerate-missing-template-tools.md) - draft / Next, deliver. `67bf3d3`, pushed.
- [KB-DOTFILES-UE-084](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-084-render-zshenv-on-vega.md) - draft / Hold (until vega is rebuilt; review 2026-11-12), deliver. `67bf3d3`, pushed.
- [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) - draft / Next, deliver, Kris-attended. `67bf3d3`, pushed.
- [KI-TOOL-RIG-CORE-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-042-profile-filtered-dock-items.md) - ready / Next, plan approval recorded. `6d1fdd6`, pushed.
- [KI-TOOL-TECHNE-CLI-008](/Users/krisbrown/workspaces/knowledge-islands/tools-techne/docs/roadmap/KI-TOOL-TECHNE-CLI-008-host-patching-fields.md) - already ready / Next: the Techne agent-host thread recorded the same approval (its `4a59790`, Techne Decision 42) and is implementing. I made no change, so there is no commit from me.

Checks: `ki repo audit --skill ki-work-roadmap` passes in every touched repository (chezmoi has 1 WARN); commit hooks passed. To pass the roadmap body-shape audit, each new Next record needed the full section set. I added placeholder sections (Current state, Steps, Files touched, Verify, Dependencies / blocks, Documentation impact) and `ki-plan` replaces them.

## Failed

None.

## Needs Kris

- ki-principal: my commits `e8ebb15` and `30fad6d` are not pushed. They sit on top of six other threads' local commits that are not yet pushed (five checkpoint commits and `903be22` docs(agents)). Pushing mine would push those as well. Approve pushing the whole stack, or let the owning threads push first.
- tools-techne also has another thread's unpushed `4a59790` and uncommitted source work, which I left alone.
- My placeholder Next sections could be read as planning. They aren't: `ki-plan` must still fill them in.
