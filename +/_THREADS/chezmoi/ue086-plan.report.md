# KB-DOTFILES-UE-086 plan — owner report

## What has been done

- Planned [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) and set it to `ready`, with Mercury as conditional steps A4, B7 and C8. Committed locally as `a6d9c67` (`docs(roadmap): plan KB-DOTFILES-UE-086 to Ready`). Not pushed.
- Recorded Decision 54. Clockology (App Store 1456386228) and Prime Video (545519333) are on the laptop and are now on its removal list; `sol` gets checked at the machine. `pipx:maturin` stays installed and undeclared. Mercury remains an open item.
- Checked the laptop read-only. Things that shaped the plan:
  - Today the laptop actually runs Homebrew `uv` 0.13.0 and Homebrew `python3` 3.15.0. The mise `python` 3.12.13 and `uv` 0.12.3 installs are inactive. So the plan pins `python = "3.15.0"` and `uv = "0.13.0"`, plus `actionlint`, `rust`, `zig` and the eight cargo tools at their installed versions. No project pins any of them, so none counts as project-only.
  - Rig can't declare `rust` or the `cargo:` tools. Its mise adapter checks a tool with `mise which LOCATOR` and installs it with `mise install LOCATOR`, and those two only agree for `python`, `uv`, `actionlint` and `zig`. Rust and the cargo tools are pinned only in the mise manifest, and `mise install` installs them.
  - Homebrew formulae that can be removed: on the laptop only `uv` and `python@3.10`. `python@3.13` and `python@3.14` still have dependants, so they get marked as dependencies (`brew tab --no-installed-on-request`) instead of uninstalled. Homebrew `node` still has dependants after `cloudflare-wrangler` goes (`git-almanac`, `mcporter`, `summarize`), so it gets marked the same way. On `sol` each formula is decided by running `brew uses --installed` at the machine.
  - The installed Rig 0.5.0 has no `rig remove` (that came after the release), so removals are done by hand.
- Checks:
  - `rumdl check .`: clean.
  - `node --test tests/*.test.mjs`: 226 pass, 0 fail, 2 skipped.
  - `ki repo audit --repo .`: FAIL=0, WARN=3, the same as before this change. My first draft failed ITEM-3 (Steps may hold only task-list entries); that is fixed.
- No live changes, no SSH, no remote calls. No lock files left. The working tree is clean.

## What is in progress

Nothing. Delivery needs you: every uninstall is your step, and every apply waits for your approval of its diff.

## Outstanding queries

- **Needs: MERCURY.** Keep Mercury Weather and declare it in `core` (both Macs), or remove it from the laptop? Until you answer, the record can be delivered but not accepted.
- **Needs: PAPERCLIP-DRIFT.** `rig doctor` on the laptop already has 2 findings. `paperclip-agents` is drifted: `paperclip-reconcile --check` names eight Knowledge Islands and Humans Not Robots agents, and the last apply on 12 October failed. No record owns this, and the Verify step can't report a clean laptop until it's cleared. Recommendation: capture it as its own record, for a short look in this thread.
- **Needs: RIG-MISE-LOCATOR.** Should tools-rig's mise adapter be able to check a binary whose name differs from its locator, so that `rust` and the cargo tools can be declared in Rig? Recommendation: yes, as a tools-rig record. This plan doesn't depend on it.
- **Needs: ITEM-2.** The roadmap audit warns that territory `ki-principal` is not a registered Capital handle. This is on all four records with `initiative: ki-principal/rig`, and was there before this run. The roadmap standard uses this form itself and treats the warning as non-failing, so I didn't let it block Ready. Recommendation: hand it to `ki-agentic-harness`.

```text
MERCURY: keep / remove
PAPERCLIP-DRIFT: capture a record / leave it
RIG-MISE-LOCATOR: file a tools-rig record / no
ITEM-2: hand to ki-agentic-harness / leave it
```
