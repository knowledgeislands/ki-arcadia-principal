---
type: ki-checkpoint
thread: rig.chezmoi
label: 'Rig: chezmoi'
state: active
created_at: 2026-10-08T08:40:00Z
updated_at: 2026-10-10T14:50:00Z
---

# rig.chezmoi

## Objective

Work the open DOTFILES-UE records in the chezmoi source (`~/.local/share/chezmoi`, GitHub `krisb/dotfiles`), keeping the workstation accurate, tidy and observable under the [Rig](../../Streams/Initiatives/rig.md) Initiative. chezmoi does not declare `ki-checkpoint`, so this thread's checkpoint lives in Arcadia.

## Current state

- **1Password reorganisation applied.** The vault restructure, confident moves, renames and home-page URL fixes are done. Nine wrong-category items were recreated as API Credential, the chezmoi references repointed with byte-identical renders, and all ten originals archived (one was a duplicate). Remaining review tags: about 176 `^triage`, 75 `^duplicate`, 41 `^review` and 8 `^fix_url`, which the repeatable triage in [DOTFILES-UE-078](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-078-repeatable-1password-triage.md) will work through. Both records sit in the [secrets-hygiene](../../Streams/Projects/secrets-hygiene.md) Project.
- **Accepted and pruned:** DOTFILES-UE-062 (scoped live-apply measurement: no failures, port 3100 briefly down twice), DOTFILES-UE-073 (cheztoi host profile) and DOTFILES-UE-081 (claude-swap auto-switch service). All pushed; the source audit passes with no failures.
- **claude-swap** runs as the launchd service `uk.me.kris.rig.claude-swap-auto` with the consume-first strategy. Check it with `cswap list` or `cswap status --token-status`; after re-adding expired credentials with `cswap add`, restart it with `launchctl kickstart -k gui/$(id -u)/uk.me.kris.rig.claude-swap-auto`. Log: `~/Library/Logs/uk.me.kris.rig.claude-swap-auto.log`.
- **Open records:** [DOTFILES-UE-071](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-071-audit-macos-privacy-permissions.md), [DOTFILES-UE-027](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-027-honest-rationales-per-tool.md) and [DOTFILES-UE-065](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-065-diagnose-same-boot-mcporter-stall.md) are the remaining gated records Kris approved, in that order; [DOTFILES-UE-035](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-035-install-whatsapp-spool-refresh.md) ([knowledge-acquisition](../../Streams/Projects/knowledge-acquisition.md)); [DOTFILES-UE-074](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-074-host-detached-delegation.md) ([agent-host](../../Streams/Projects/agent-host/agent-host.md)); [DOTFILES-UE-076](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-076-always-run-latest-source.md) (mac-studio-bootstrap thread); [DOTFILES-UE-072](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-072-machine-neutral-two-checkout-rule.md) (held); DOTFILES-UE-077, DOTFILES-UE-078 and DOTFILES-UE-079 (triage).

## Decisions in force

The machine-local decisions log (`~/.local/state/ki/agents/chezmoi/decisions.md`) is consolidated as follows.

- **In durable owners:** Rig is the Initiative over chezmoi (7). The secrets approach, vault precedence and inbox (9, 10, 20, 21) and the single-approval 1Password session (29, 30) are in [DOTFILES-UE-077](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-077-reorganise-1password-vaults-safely.md). The Rig-vault scope, naming and URL rules, the no-Archive `^archive` rule and the recategorise procedure (14, 18, 19, 25, 33) are in DOTFILES-UE-078. The secrets-hygiene Project (26) is its Project note. The claude-swap launchd exception (31, 34) is in the service declaration's rationale in `dot_config/rig/conf.d/private_50-services.toml`.
- **Still only here:** DOTFILES-UE-072 is held (5); DOTFILES-UE-075 and DOTFILES-UE-076 belong to the mac-studio-bootstrap thread (27); work the gated records 071, 027 and 065 next (28).
- **Spent:** the vault-plan application and tagging decisions (15, 17, 22-24) and the DOTFILES-UE-062 scope (32).

## Files touched

- chezmoi source: `.chezmoidata/mcp-servers.yaml` (repointed to the API Credential items), `dot_config/rig/conf.d/private_50-services.toml` (claude-swap service), DOTFILES-UE-062, DOTFILES-UE-073, DOTFILES-UE-074, DOTFILES-UE-077, DOTFILES-UE-078 and DOTFILES-UE-081.
- mcp-acquire-whatsapp: the operator guide's `op://` reference, pushed.

## Open questions

- Kris: file a `tools-rig` record so `rig apply` asks for the sudo password once at the start and keeps it alive for the run? An overnight apply stalled at Homebrew's sudo prompt.
- Kris: approve CODEX, so this thread can drop `mcp-housekeeping-codex` from `dot_mgit.toml`, `dot_config/ki/config.toml`, `.chezmoidata/trusted-folders.yaml` and the VS Code workspace.
- Kris: note the approved Claude auto-switch exception in ADR-DOTFILES-007, which says automatic rotation is off for Codex?

## Next step

Start DOTFILES-UE-071 (macOS privacy-permissions audit) as a background run, then DOTFILES-UE-027 and DOTFILES-UE-065.
