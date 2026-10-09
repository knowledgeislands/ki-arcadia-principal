---
type: ki-checkpoint
thread: rig.chezmoi
label: 'Rig: chezmoi'
state: active
created_at: 2026-10-08T08:40:00Z
updated_at: 2026-10-09T21:40:00Z
---

# rig.chezmoi

## Objective

Work the open DOTFILES-UE records in the chezmoi source (`~/.local/share/chezmoi`, GitHub `krisb/dotfiles`), keeping the workstation accurate, tidy and observable under the [Rig](../../Streams/Initiatives/rig.md) Initiative. chezmoi does not declare `ki-checkpoint`, so this thread's checkpoint lives in Arcadia. Current focus: the 1Password vault reorganisation.

## Current state

- **1Password tidy-up** ([DOTFILES-UE-077](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-077-reorganise-1password-vaults-safely.md), triage). Kris restructured the vaults himself: built-in `Personal` as the inbox, Financial, Org - HNR, Org - Techmedix, ten `Personal - ...` vaults, and Rig. Read-only helpers inventoried 899 items and produced one approval sheet, `~/.local/state/ki/agents/chezmoi/vault-plan.md` (local, mode 600, never committed): 118 moves, 359 renames, 295 URL fixes, archive and duplicate lists, a tag scheme and 23 questions with recommended answers.
- **Applying (Decision 22, tag-then-process):** helper `vault-apply` snapshots all items, tags every item `^triage`, creates `Personal - Household`, renames Howden Browns to `Personal - Parents`, sets icons and descriptions, then applies only confident moves, renames and home-page URLs, removing `^triage` from each finished item. Uncertain items go to `Personal` with `^triage`; duplicates get `^duplicate`; hand checks get `^review` or `^fix_url`. It updates chezmoi's `op://` reference whenever a chezmoi-read item moves to Rig. Every change is logged reversibly in `vault-apply.log.md`. The tag-scheme clean-up (removing `kris`, `home`) waits for Kris. Then helper `vault-categories` tags wrong-category items `^recategorise` for Kris to recreate.
- **Repeatable triage** captured as [DOTFILES-UE-078](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-078-repeatable-1password-triage.md) (triage, blocked by DOTFILES-UE-077).
- **chezmoi source:** renders cleanly; GSuite reference now points at its item in Rig. Local `main` is 13 commits ahead of `origin/main` (this thread's DOTFILES-UE-077/078 records, reference fixes and vocabulary note, plus another session's DOTFILES-UE-075/076 and a docs commit); pushing needs Kris.
- **Other records this thread holds, all waiting on Kris:** [DOTFILES-UE-072](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-072-machine-neutral-two-checkout-rule.md) (held until TECHNE-TOOLS-OPS-014 ships, then likely cancelled); [DOTFILES-UE-071](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-071-audit-macos-privacy-permissions.md); [DOTFILES-UE-027](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-027-honest-rationales-per-tool.md), [DOTFILES-UE-062](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-062-measure-the-live-apply.md), [DOTFILES-UE-065](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-065-diagnose-same-boot-mcporter-stall.md) (Hold).
- **Owned elsewhere:** [DOTFILES-UE-073](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-073-cheztoi-host-profile.md) and [DOTFILES-UE-074](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-074-host-detached-delegation.md) ([agent-host](../../Streams/Projects/agent-host/agent-host.md)); [DOTFILES-UE-075](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-075-sol-tailscale-daemon-exception.md) and [DOTFILES-UE-076](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-076-always-run-latest-source.md) (another session, per-machine Rig profiles); [DOTFILES-UE-035](https://github.com/krisb/dotfiles/blob/main/docs/roadmap/DOTFILES-UE-035-install-whatsapp-spool-refresh.md) ([knowledge-acquisition](../../Streams/Projects/knowledge-acquisition.md)).

## Decisions made

- The master thread `state-of-play` owns cross-project priorities, releases and decisions.
- Edit the source, never the target; `chezmoi apply` is allowed after reviewing `chezmoi diff`.
- Run `chezmoi` decisions log (`~/.local/state/ki/agents/chezmoi/decisions.md`, machine-local), in force: Rig is the Initiative over chezmoi (7); secrets approach: a dedicated vault named Rig, one logical-name secrets map, a pre-apply reference check, no title-search fallback (9, 10); Rig holds anything Kris uses on a machine or connects to, Wi-Fi and unlock codes included (14); Howden Browns is Kris's parents and brother, to become `Personal - Parents`, plus a new `Personal - Household` (15); Retford Browns is not Kris's parents (17); item names use a bracketed qualifier where several entries share a service (18); URL fixes need no further approval and point at the home page (19); Financial ranks above a person's own vault (20); uncertain items go to the `Personal` inbox and triage must be repeatable (21); tag-then-process with `^triage` (22); wrong-category items get `^recategorise` (23); DOTFILES-UE-072 held (5).

## Files touched

- chezmoi source: `private_dot_ssh/private_known_hosts`, `.chezmoidata/mcp-servers.yaml`, the `communication.md` source, DOTFILES-UE-077 and DOTFILES-UE-078.

## Open questions

- Kris: answer `vault-plan.md` Questions 1-23 (or "recommended") and approve the tag scheme; until then those items keep `^triage`.
- Kris: push the 13 local chezmoi commits?
- For `state-of-play`: keep this thread open (it now has active work); who may write to the chezmoi source, given another session commits there too.

## Next step

Summarise for Kris from the latest mark in `~/.local/state/ki/agents/chezmoi/marks.md` (Mark 1, 2026-10-09 22:40 BST) when he asks. Record the outcome of the scoped [DOTFILES-UE-062](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-062-measure-the-live-apply.md) apply (evidence in `apply-062/`) in that record, then bring this checkpoint current with Decisions 24-33.
