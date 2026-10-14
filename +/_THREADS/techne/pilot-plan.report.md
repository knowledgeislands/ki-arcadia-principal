# Workstation pilot plan: TECHNE-TOOLS-OPS-015 with DOTFILES-UE-073

Authority: Decision 20 (planning only). Neither record has been delivered. I made no remote calls; the harness pull was already up to date.

## What the pilot changes

On the host:

- Kris's personal files arrive as one checked bundle, the "payload", which his Mac renders. It holds a minimal zsh setup, his Claude and Codex instructions, and a Rig list of his own tools. This bundle becomes the only way personal instructions reach the host. The old `chezmoi cat` copy is removed, along with its stale files.
- `mgit` is the first personal tool. Rig installs it as a single checksummed file into `~/.local/bin`, with no Homebrew and no `sudo`.
- New interactive SSH sessions switch from bash into zsh. Commands sent over SSH, Git hooks and scripts stay in bash with the same tools. If zsh breaks, an environment variable or a flag file keeps you in bash.
- Delegation on the host uses a variant with no detached agents. Codex's one instruction file puts the recipe's safety rules first and Kris's text after them.
- `status` shows which payload revision is installed and whether any personal tool has drifted.

In Kris's setup (chezmoi source):

- A new repository-only script, `scripts/cheztoi-render`, builds the payload for Linux or macOS from an allowlist and checks it before anything leaves the Mac. Rendering never changes `$HOME`.
- `mgit` gains a Linux entry in the Rig catalogue, and `50_mise` gains a small guard so it no longer adds a Mac-only path on Linux.

The recipe stays general. Any owner can supply a payload and pick a shell (zsh is the default) on a Linux or macOS host. With no payload, the host gets the recipe alone.

## Steps in order

1. Harness: add the `profile` and `shell` settings, written as `AGENT_HOST_PROFILE` and `AGENT_HOST_SHELL` for now, plus a payload checker.
2. Harness: `setup.sh` sends a checked payload and drops `chezmoi`. `converge.sh` writes the files, removes only files it installed earlier, moves the old files over, combines the Codex file and runs `rig apply`.
3. Harness: the zsh hand-off and its escape hatches, then the status drift report.
4. Harness: offline tests for every refusal and every way a shell starts, then the operator guide.
5. chezmoi: the allowlist and renderer, the zsh fragment checks, the host instruction variants, the `mgit` Linux entry (with Rig's own check count unchanged on the Mac), validation and tests.
6. Both: render the real payload and run the harness checker on it offline.
7. Live, only with a separate go-ahead: run setup with the payload, run status, then open a new SSH session.

## What stays manual

- Rendering the payload on the Mac and running setup with `AGENT_HOST_PROFILE` set. `techne host setup` already passes this setting through, so no `tools-techne` change is needed.
- The live run and checks on the host.
- Making zsh the real login shell. That waits for the next rebuild (TECHNE-TOOLS-OPS-017); until then bash hands off to zsh.
- Adding anything beyond the first slice to the allowlist, and every credential.

## Risks

- A broken personal zsh file could spoil interactive logins. The escape hatches and the shell-path tests cover this, and non-interactive SSH is unaffected.
- A secret or Mac-only path could slip into the payload. Both ends check for these, and the checker refuses reserved files and any Rig entry that runs custom code.
- The removal step could delete the wrong files. It only removes files the harness recorded installing, plus a one-time clean-up of the old copies.
- The `mgit` download depends on GitHub serving the tagged file. A checksum pins it.
- The harness-fixes agent and TECHNE-TOOLS-OPS-019 also edit `setup.sh` and `converge.sh`, so delivery must start from a fresh baseline.

## Decisions before delivery

1. Approve both plans so they can become Ready. I left them as `draft` with full plans, because `ki-plan` only marks a record Ready after you explicitly approve the plan, and Decision 20 asks for the plan to come back to you first. Once you approve, it is a one-line change in each record.
2. Confirm the record-level choices: `mgit` by direct download; a combined Codex file with the recipe rules first; the two escape hatches; temporary environment settings until the binding fields exist.
3. Grant SSH separately for the live run when delivery reaches it.
4. Allow a small edit to [TECHNE-TOOLS-OPS-019](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-019-person-neutral-recipe-defaults.md). TECHNE-TOOLS-OPS-015 takes over its `chezmoi cat` removal, so that part should come out of TECHNE-TOOLS-OPS-019's scope. I didn't touch it because it was outside my brief.

## Done

- [TECHNE-TOOLS-OPS-015](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-015-agent-host-workstation-pilot.md) is planned: commit `70c3389` in ki-techne-harness, not pushed.
- [DOTFILES-UE-073](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-073-cheztoi-host-profile.md) is planned: commit `423fae7` in chezmoi, not pushed. The chezmoi branch was already 4 commits ahead before this.
- The links between records are unchanged and still match in both directions: OPS-015 blocks OPS-017, and UE-073 blocks UE-074. The pairing between the two pilot records is written as prose, and neither blocks the other's start.
- Checks: `ki repo audit` gave FAIL=0 WARN=2 in both repositories, the same as before. No BODY-11 failures appeared in this run. `rumdl` is clean on both records. The chezmoi warning (ITEM-2, territory registry unavailable) predates this work and comes from the `ki-arcadia-principal/agent-host` project field shared by three records.

## Failed

- None.

## Needs the owner

- Decisions 1-4 above.
