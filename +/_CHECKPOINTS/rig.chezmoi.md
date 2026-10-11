---
type: ki-checkpoint
thread: rig.chezmoi
label: 'Rig: chezmoi'
state: active
created_at: 2026-10-08T08:40:00Z
updated_at: 2026-10-11T02:41:00Z
---

# rig.chezmoi

## Objective

Work the open DOTFILES-UE records in the chezmoi source (`~/.local/share/chezmoi`, GitHub `krisb/dotfiles`), keeping the workstation accurate, tidy and observable under the [Rig](../../Streams/Initiatives/rig.md) Initiative. chezmoi does not declare `ki-checkpoint`, so this thread's checkpoint lives in Arcadia.

## Current state

Mark: 2026-10-11T02:29Z, decisions log at Decision 46

ki-delegation read at cfa9c458

- **1Password reorganisation applied.** The vault restructure, confident moves, renames and home-page URL fixes are done. Nine wrong-category items were recreated as API Credential, the chezmoi references repointed with byte-identical renders, and all ten originals archived (one was a duplicate). Remaining review tags: about 176 `^triage`, 75 `^duplicate`, 41 `^review` and 8 `^fix_url`, which the repeatable triage in [DOTFILES-UE-078](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-078-repeatable-1password-triage.md) will work through. Both records sit in the [secrets-hygiene](../../Streams/Projects/secrets-hygiene.md) Project.
- **Accepted and pruned:** DOTFILES-UE-062 (scoped live-apply measurement: no failures, port 3100 briefly down twice), DOTFILES-UE-073 (cheztoi host profile) and DOTFILES-UE-081 (claude-swap auto-switch service). All pushed; the source audit passes with no failures.
- **Since 2026-10-10:** `mcp-housekeeping-codex` is dropped from the source (CODEX approved); ADR-DOTFILES-007 records the Claude auto-switch exception; new Finder windows open in the home folder; tools-rig carries [RIG-CORE-044](https://github.com/knowledgeislands/tools-rig/blob/main/docs/roadmap/RIG-CORE-044-single-sudo-prompt.md) for a single sudo prompt per apply; the Observatory service drift is reapplied and `rig doctor` reports no findings. All pushed.
- **macOS settings refresh.** The 35 declared settings descend from Mathias Bynens' `.macos`. The new quarterly [DOTFILES-HK-004](https://github.com/krisb/dotfiles/blob/main/docs/housekeeping/DOTFILES-HK-004-refresh-macos-settings.md) compares them with upstream and proposes changes for Kris's approval. Its first run, DOTFILES-UE-083, kept all 35 and added 20 settings from 14 approved rows; it is accepted and pruned, and the next run is due in January 2027. Lightroom Classic's sol-only Dock position waits on tools-rig's profile-filtered Dock items, owned by the mac-studio-bootstrap thread.
- **claude-swap** runs as the launchd service `uk.me.kris.rig.claude-swap-auto` with the consume-first strategy. Check it with `cswap list` or `cswap status --token-status`; after re-adding expired credentials with `cswap add`, restart it with `launchctl kickstart -k gui/$(id -u)/uk.me.kris.rig.claude-swap-auto`. Log: `~/Library/Logs/uk.me.kris.rig.claude-swap-auto.log`.
- **Open records:** [DOTFILES-UE-071](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-071-audit-macos-privacy-permissions.md) and [DOTFILES-UE-027](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-027-honest-rationales-per-tool.md) are the gated records Kris kept; [DOTFILES-UE-072](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-072-machine-neutral-two-checkout-rule.md) is being done by a background run; [DOTFILES-UE-085](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-085-quiet-race-safe-helpers.md) (copy-key script and `op_cache` race, from mac-studio-bootstrap) awaits Kris's plan; [DOTFILES-UE-082](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-082-tolerate-missing-template-tools.md) and [DOTFILES-UE-084](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-084-render-zshenv-on-vega.md) (triage); [DOTFILES-UE-079](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-079-undeclared-software-decisions.md) waits on how it merges into RIG-CORE-041; [DOTFILES-UE-035](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-035-install-whatsapp-spool-refresh.md) ([knowledge-acquisition](../../Streams/Projects/knowledge-acquisition.md)); [DOTFILES-UE-076](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-076-always-run-latest-source.md) (mac-studio-bootstrap thread); DOTFILES-UE-077 (triage). DOTFILES-UE-065, DOTFILES-UE-074 and DOTFILES-UE-078 are cancelled and pruned and kept as ideas in the Rig Initiative and the agent-host and secrets-hygiene Projects.

## Decisions made

The machine-local decisions log (`~/.local/state/ki/agents/chezmoi/decisions.md`) is consolidated as follows.

- **In durable owners:** Rig is the Initiative over chezmoi (7). The secrets approach, vault precedence and inbox (9, 10, 20, 21) and the single-approval 1Password session (29, 30) are in [DOTFILES-UE-077](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-077-reorganise-1password-vaults-safely.md). The Rig-vault scope, naming and URL rules, the no-Archive `^archive` rule and the recategorise procedure (14, 18, 19, 25, 33) are in DOTFILES-UE-078. The secrets-hygiene Project (26) is its Project note. The claude-swap launchd exception (31, 34, 38) is in the service declaration's rationale and ADR-DOTFILES-007. The CODEX removal (36), the sudo record (37), the Finder choice and HK-004 (39-41) and the UE-083 settings (44) are in their commits, records and setting rationales. The catalogue-tool proposal (44) and the marks convention (45) are with state-of-play.
- **Still only here:** DOTFILES-UE-072 is held (5); DOTFILES-UE-075 and DOTFILES-UE-076 belong to the mac-studio-bootstrap thread (27); work the gated records 071, 027 and 065 next (28).
- **Spent:** the vault-plan application and tagging decisions (15, 17, 22-24) and the DOTFILES-UE-062 scope (32).

## Files touched

- chezmoi source: `.chezmoidata/mcp-servers.yaml` (repointed to the API Credential items), `dot_config/rig/conf.d/private_50-services.toml` (claude-swap service), DOTFILES-UE-062, DOTFILES-UE-073, DOTFILES-UE-074, DOTFILES-UE-077, DOTFILES-UE-078 and DOTFILES-UE-081.
- mcp-acquire-whatsapp: the operator guide's `op://` reference, pushed.

## Open questions

- Handoff from rig.mac-studio-bootstrap (Decision 25), non-blocking: consider a 1Password service account scoped to the Rig vault ([DOTFILES-UE-077](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-077-reorganise-1password-vaults-safely.md)), so chezmoi applies need no unlock prompt and agents can apply on sol over SSH unattended; the token would be stored on each machine. That thread owns priority and design.
- For `state-of-play`, non-blocking: Kris wants a proposal for a new standalone repository holding a macOS-settings catalogue. It would merge the typed nix-darwin `system.defaults` options and macos-defaults.com entries, read each setting's live value, mark those Rig declares, and turn a System Settings change into a ready Rig declaration. Rig keeps applying; DOTFILES-HK-004 would use it as its source. Kris decided this on 2026-10-11 (Decision 44); state-of-play owns where and when it is proposed.

## Next step

Agree DOTFILES-UE-085's plan with Kris, settle the DOTFILES-UE-079 merge, review DOTFILES-UE-072's result, then start DOTFILES-UE-071 and DOTFILES-UE-027.
