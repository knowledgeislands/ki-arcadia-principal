---
type: ki-checkpoint
thread: mac-studio-bootstrap
state: active
created_at: 2026-10-08T08:45:00Z
updated_at: 2026-10-08T08:45:00Z
---

# mac-studio-bootstrap

## Objective

Bring Kris's Mac Studio, unused for over a month, back to full estate capability so any thread can resume there ([mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md), Initiative [Rig](../../Streams/Initiatives/rig.md)). This thread runs on the Mac Studio itself; from a browser the checkpoint is at `github.com/knowledgeislands/ki-arcadia-principal`, path `+/_CHECKPOINTS/mac-studio-bootstrap.md`.

## Current state

- Nothing has been done on the Mac Studio yet; its state is unknown. No work records exist and no gov-020 helper is working on it.
- First steps, in plain language, assuming nothing is checked out there:
  1. Update macOS and sign in to the Mac App Store, 1Password and GitHub.
  2. Install Homebrew by its own supported procedure, then install chezmoi with Homebrew.
  3. Fetch the dotfiles from GitHub `krisb/dotfiles` into chezmoi's source folder, review what chezmoi would change, then apply it. Secrets come from 1Password at apply time.
  4. Install the Knowledge Islands tools from the Homebrew tap: `knowledgeislands/tap/rig`, `ki` and `mgit`.
  5. Preview what Rig would install (`rig apply --dry-run`), then apply it; this brings back the applications, Claude Code, Zed and the macOS settings. Check with `rig status` and `rig doctor`.
  6. Sign in to Claude Code (and Zed's agent), then run `ki bootstrap` so `ki` installs the harness and links its skills; check with `ki doctor`.
  7. Restore the workspace: chezmoi writes the `mgit` manifests under `~/workspaces`; preview with `mgit repair`, then clone the missing repositories with `mgit repair --apply`, and record each one with `ki registry add`.
  8. Open Zed in `ki-arcadia-principal` and resume this checkpoint; record anything that went wrong as a work record in its owning repository.

## Decisions made

- The master thread `state-of-play` owns cross-project priorities, releases and decisions; this thread works only the Mac Studio.
- The Project sits in Rig, not agent-host: the Mac Studio is a workstation, and agent-host concerns the Techne agent host.
- No remote calls and no changes to the Mac Studio were made while preparing this thread; each step there is attended by Kris.

## Files touched

The Project note [mac-studio-bootstrap](../../Streams/Projects/mac-studio-bootstrap.md) and this checkpoint. Source guidance: the chezmoi README and its macOS workstation and chezmoi guides, the `ki-bootstrap` skill, and the `tools-ki` getting-started and local-installation guides.

## Open questions

None yet; the Mac Studio's actual state will raise them.

## Next step

On the Mac Studio, run `ki doctor` if `ki` already exists, otherwise start at step 1 above; update this checkpoint after each step.
