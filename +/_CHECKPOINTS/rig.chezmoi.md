---
type: ki-checkpoint
thread: rig.chezmoi
label: 'Rig: chezmoi'
state: active
created_at: 2026-10-08T08:40:00Z
updated_at: 2026-10-14T00:50:00Z
---

# rig.chezmoi

## Objective

Work the open KB-DOTFILES-UE records in the chezmoi source (`~/.local/share/chezmoi`, GitHub `krisb/dotfiles`), keeping the workstation accurate, tidy and observable under the [Rig](../../Streams/Initiatives/rig.md) Initiative. chezmoi does not declare `ki-checkpoint`, so this thread's checkpoint lives in Arcadia.

## Current state

Mark: 2026-10-11T02:29Z, decisions log at Decision 46

ki-delegation read at fbd11977

- **1Password reorganisation applied.** The vault restructure, confident moves, renames and home-page URL fixes are done. Nine wrong-category items were recreated as API Credential, the chezmoi references repointed with byte-identical renders, and all ten originals archived (one was a duplicate). Remaining review tags: about 176 `^triage`, 75 `^duplicate`, 41 `^review` and 8 `^fix_url`, which the repeatable-triage idea in the secrets-hygiene Project now carries. Both records sit in the [secrets-hygiene](../../Streams/Projects/secrets-hygiene.md) Project.
- **Accepted and pruned:** KB-DOTFILES-UE-062 (scoped live-apply measurement: no failures, port 3100 briefly down twice), KB-DOTFILES-UE-073 (cheztoi host profile) and KB-DOTFILES-UE-081 (claude-swap auto-switch service). All pushed; the source audit passes with no failures.
- **Since 2026-10-10:** `mcp-housekeeping-codex` is dropped from the source (CODEX approved); ADR-KB-DOTFILES-007 records the Claude auto-switch exception; new Finder windows open in the home folder; tools-rig carries KI-TOOL-RIG-CORE-044 (accepted and pruned) for a single sudo prompt per apply; the Observatory service drift is reapplied and `rig doctor` reports no findings. All pushed.
- **macOS settings refresh.** The 35 declared settings descend from Mathias Bynens' `.macos`. The new quarterly [KB-DOTFILES-HK-004](/Users/krisbrown/.local/share/chezmoi/docs/housekeeping/KB-DOTFILES-HK-004-refresh-macos-settings.md) compares them with upstream and proposes changes for Kris's approval. Its first run, KB-DOTFILES-UE-083, kept all 35 and added 20 settings from 14 approved rows; it is accepted and pruned, and the next run is due in January 2027. Lightroom Classic's sol-only Dock position waits on tools-rig's profile-filtered Dock items, owned by the mac-studio-bootstrap thread.
- **claude-swap** runs as the launchd service `uk.me.kris.rig.claude-swap-auto` with the consume-first strategy. Check it with `cswap list` or `cswap status --token-status`; after re-adding expired credentials with `cswap add`, restart it with `launchctl kickstart -k gui/$(id -u)/uk.me.kris.rig.claude-swap-auto`. Log: `~/Library/Logs/uk.me.kris.rig.claude-swap-auto.log`.
- **Token over SSH (Decisions 53-57):** `op_cache` reads the Automation token from `~/.config/op-cache/service-account-automation` (mode 600) and no longer uses the Keychain; both guides updated and pushed. The file is on the laptop and `sol`, and `op_cache` on `sol` resolves an Automation item over SSH with no prompt.
- **Since the mark:** KB-DOTFILES-UE-072 (machine-neutral two-checkout rule) and KB-DOTFILES-UE-085 (copy-key script skips itself once the private key exists; `op_cache` race fixed) are delivered, accepted and pruned; `chezmoi status` is empty on the laptop and `sol`. KB-DOTFILES-UE-079 is accepted and pruned: Diagram, Google Drive, Home Assistant and HP are declared in `core`. Its removal list and install-route alignment moved to [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md). 1Password, the 1Password CLI, Telegram and Tailscale already install the same way on both Macs.
- **Open records:** [KB-DOTFILES-UE-071](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-071-audit-macos-privacy-permissions.md) and [KB-DOTFILES-UE-027](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-027-honest-rationales-per-tool.md) are the gated records Kris kept; [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) (Ready, pushed; Kris decided all four open items, Decisions 54 and 55; delivery is Kris-attended at `sol`); [KB-DOTFILES-UE-082](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-082-tolerate-missing-template-tools.md), [KB-DOTFILES-UE-084](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-084-render-zshenv-on-vega.md) and [KB-DOTFILES-UE-077](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-077-reorganise-1password-vaults-safely.md) (triage); [KB-DOTFILES-UE-035](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-035-install-whatsapp-spool-refresh.md) ([knowledge-acquisition](../../Streams/Projects/knowledge-acquisition.md)); [KB-DOTFILES-UE-076](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-076-always-run-latest-source.md) (mac-studio-bootstrap thread). KB-DOTFILES-UE-065, KB-DOTFILES-UE-074 and KB-DOTFILES-UE-078 are cancelled and pruned and kept as ideas in the Rig Initiative and the agent-host and secrets-hygiene Projects.

## Decisions made

The machine-local decisions log (`~/.local/state/ki/agents/chezmoi/decisions.md`) is consolidated as follows.

- **In durable owners:** Rig is the Initiative over chezmoi (7). The secrets approach, vault precedence and inbox (9, 10, 20, 21) and the single-approval 1Password session (29, 30) are in [KB-DOTFILES-UE-077](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-077-reorganise-1password-vaults-safely.md). The Rig-vault scope, naming and URL rules, the no-Archive `^archive` rule and the recategorise procedure (14, 18, 19, 25, 33) are in the repeatable-triage idea in the secrets-hygiene Project note (26). The claude-swap launchd exception (31, 34, 38) is in the service declaration's rationale and ADR-KB-DOTFILES-007. The CODEX removal (36), the sudo record (37), the Finder choice and HK-004 (39-41) and the UE-083 settings (44) are in their commits, records and setting rationales. The catalogue-tool proposal (44) and the marks convention (45) are with state-of-play.
- **Still only here:** KB-DOTFILES-UE-075 and KB-DOTFILES-UE-076 belong to the mac-studio-bootstrap thread (27); KB-DOTFILES-UE-086 carries the leftovers from KB-DOTFILES-UE-079 and aligns install routes on both Macs, 1Password, Telegram and Tailscale included (50); work the gated records KB-DOTFILES-UE-071 and KB-DOTFILES-UE-027 next (28, 47).
- **Spent:** the vault-plan application and tagging decisions (15, 17, 22-24), the KB-DOTFILES-UE-062 scope (32), the KB-DOTFILES-UE-072 hold (5), the KB-DOTFILES-UE-083 push and prune (46), and the cancellations, KB-DOTFILES-UE-072 and KB-DOTFILES-UE-085 approvals (47, 48), and the KB-DOTFILES-UE-079 declarations (49).

## Files touched

- chezmoi source: `.chezmoidata/mcp-servers.yaml` (repointed to the API Credential items), `dot_config/rig/conf.d/private_50-services.toml` (claude-swap service), KB-DOTFILES-UE-062, KB-DOTFILES-UE-073, KB-DOTFILES-UE-074, KB-DOTFILES-UE-077, KB-DOTFILES-UE-078 and KB-DOTFILES-UE-081.
- mcp-acquire-whatsapp: the operator guide's `op://` reference, pushed.

## Open questions

Needs Kris:

- **PUSH-2:** two local commits await Kris's push: chezmoi `647e137` (roadmap records now use the `knowledge-islands` territory handle, which clears the audit's ITEM-2 warning) and tools-rig `4de347b` and `3ee6fa8` (triage record [KI-TOOL-RIG-CORE-050](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-050-mise-observed-executables.md), mise observed executables, from RIG-MISE-LOCATOR).

Other open questions:

- Parked 2026-10-14: PAPERCLIP-DRIFT - the laptop's `rig doctor` reports `paperclip-agents` drift (eight agents) and a failed apply on 2026-10-12; Kris deferred it (Decision 56). [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md)'s Verify names it rather than reporting the laptop clean.
- SVG handler, waiting on state-of-play: Kris set Chrome for SVG by hand on the laptop and asked for a tools-rig release with default-application support (Decision 57; asked on 2026-10-14). Once it is installed, declare `[default-application.svg]` (Chrome, `public.svg-image`) in `core`.
- Handoff from rig.mac-studio-bootstrap (Decision 25), non-blocking: consider a 1Password service account scoped to the Rig vault ([KB-DOTFILES-UE-077](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-077-reorganise-1password-vaults-safely.md)), so chezmoi applies need no unlock prompt and agents can apply on sol over SSH unattended; the token would be stored on each machine. That thread owns priority and design.
- For `state-of-play`, non-blocking: Kris wants a proposal for a new standalone repository holding a macOS-settings catalogue. It would merge the typed nix-darwin `system.defaults` options and macos-defaults.com entries, read each setting's live value, mark those Rig declares, and turn a System Settings change into a ready Rig declaration. Rig keeps applying; KB-DOTFILES-HK-004 would use it as its source. Kris decided this on 2026-10-11 (Decision 44); state-of-play owns where and when it is proposed.

## Next step

Get Kris's answer on PUSH-2, then deliver section A of KB-DOTFILES-UE-086 and start KB-DOTFILES-UE-071 and KB-DOTFILES-UE-027.
