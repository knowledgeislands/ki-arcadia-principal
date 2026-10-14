# Recheck: agent host, TECHNE-TOOL-CLI-008 links, TECHNE-TOOLS-OPS-022 prune

## Verified now

- ki-techne-harness, tools-ki, chezmoi: level with origin, clean.
- tools-techne: 1 ahead (my CLI-008 commit 236b91c), clean. Not behind, so no fast-forward was needed.
- ki-arcadia-principal: 2 ahead (Kris's 7e82b39 mark commit, my checkpoint 4b03074), clean.
- Records: TECHNE-TOOLS-OPS-015 awaiting-review; TECHNE-TOOLS-OPS-016 to TECHNE-TOOLS-OPS-019 triage; TECHNE-TOOLS-OPS-020 and TECHNE-TOOLS-OPS-021 cancelled (rejected) and pruned; DOTFILES-UE-073 accepted and pruned; TECHNE-TOOL-CLI-007 cancelled (rejected) and pruned; TECHNE-TOOL-CLI-008 triage.
- Mac: chezmoi `rigProfile` is `laptop` (fixed). `chezmoi status` works; diffs only in ~/.claude/CLAUDE.md, ~/.codex/AGENTS.md and a pending run script, none in the Techne host settings.
- mise 2026.10.6 and codex 0.162.0 are still off their pins (2026.10.4, 0.161.0).
- Laptop is `terra` (computer, host and Tailscale name).
- `ki agent --wait-for` bug is still present in installed ki 0.10.0: the gate is only a prompt instruction, unchanged since 0.9.0. No record tracks it.
- Agent host: not checked. Tailscale is stopped on the Mac, so `ki-techne-agent-host` does not resolve. I did not start Tailscale (that would change the environment).
- Harness `ki repo audit`: FAIL=0 WARN=2 (the known warnings).

## Done

- tools-techne 236b91c: TECHNE-TOOL-CLI-008 now describes the harness patching model in plain terms and links the recipe manifest and the operator guide's "Patching and restart" section. No links to the OPS-022 record remain anywhere. Not pushed.
- ki-techne-harness 3adad34: pruned TECHNE-TOOLS-OPS-022 (ki-accept); pushed by fast-forward (b731255..3adad34).
- ki-arcadia-principal 4b03074: checkpoint rewritten to verified state. Not pushed.

## Failed

- Host checks (status.sh, updates, reboot-required, kernel, ki version, drift, banner) not run: Tailscale stopped on the Mac.

## Still needs Kris

1. Start Tailscale on the Mac if you want the host recheck; then rerun the host part.
2. Push tools-techne (236b91c) and Arcadia (7e82b39, 4b03074).
3. Review TECHNE-TOOLS-OPS-015.
4. Restart the host through stop/start after the 7.0.0-1014 kernel on 2026-10-10. The binding has no reboot window, so the host will not restart itself.
5. Decide whether to capture the `ki agent --wait-for` fix in tools-ki.
6. Note: harness code comments still mention TECHNE-TOOLS-OPS-022 by ID in recipe.toml, status.sh, converge.sh, provision.sh, the operator guide and checks. These are not links, but Decision 33's rule may want them removed. That belongs to the handoff-rule run.
