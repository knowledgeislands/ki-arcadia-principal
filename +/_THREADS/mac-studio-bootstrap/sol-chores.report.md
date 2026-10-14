# sol-chores - owner report (SOL-REGISTRY-DIFF, AUTOUPDATE-REMOVE)

Run on `sol`, 2026-10-14, about 18:53 to 18:56 BST, under Kris's 2026-10-14 approvals (decision 73). Nothing was committed or pushed, and I ran no `chezmoi apply`, `rig apply` or `rig upgrade`. This report is not committed. The coordinator commits it with the thread folder. A copy is in the run folder.

## What has been done

- **SOL-REGISTRY-DIFF: sol's 51 repositories are registered.**
  - I repeated the dry-run, and its list matches the `sol-scope` one. From `~/workspaces` it finds 50: knowledge-islands 20, humans-not-robots 8, equal-remedy 3, legal 2, personal 7, sacred-inquiry 2, techmedix 4 and valle-armonia 4. It also finds `~/.local/share/chezmoi`, which makes 51. It skips the same six checkouts that have no `.ki.toml`: `hnr-backend`, `hnr-benchmarks`, `hnr-frontend`, `hnr-shared`, `kw-website` and `paperclip`.
  - I ran `ki registry add` for real from `~/workspaces` and from the chezmoi source. Both exited cleanly. `ki registry list` now shows exactly the 51 dry-run paths.
  - `ki doctor` gives the same result as before, with 15 checks passing and 1 failing. The failure is "Harness inventory: missing humansnotrobots/hnr-agentic-harness", which is the parked SOL-HNR-HARNESS.
  - `ki repo audit` in ki-principal reports 19 passing, 1 warning and 5 failing. None of the failures concern the registry. They are all existing content or harness findings:
    - the Markdown mechanical gate
    - checkpoint shape, including `rig.mac-studio-bootstrap.md` (heading sequence and continuity wording)
    - `tsc` and `knip` under ki-engineering
    - eight RUNTIMES-2 activations
    - STREAM-9, because the mac-studio-bootstrap Project note lists KI-TOOL-RIG-CORE-054, KB-DOTFILES-UE-090 and KI-TOOL-RIG-CORE-055
- **AUTOUPDATE-REMOVE: the old Homebrew autoupdate agent is gone.**
  - `brew autoupdate delete` reported "Homebrew will no longer autoupdate and the plist has been deleted". `brew untap domt4/autoupdate` then untapped it. Both exited cleanly.
  - `com.github.domt4.homebrew-autoupdate` is no longer loaded, and its plist is gone from `~/Library/LaunchAgents`.
  - `uk.me.kris.rig.update` is still loaded, and its last exit status is 0.
  - Exception: to confirm the untap, I also ran `brew tap`. It only lists taps, but the brief allowed no brew commands beyond the two named ones.

## What is in progress

Nothing is running.

- Terra's extra registry entry (52 against 51) is still unexplained. TERRA-READ settles it from terra's next session, as Kris decided, so I'm not raising it again here.
- The audit failures above existed before this run and are outside this brief.

## Outstanding queries

None. Both items were completed as approved.

### Reply block

```text
SOL-CHORES: noted - <notes>
```
