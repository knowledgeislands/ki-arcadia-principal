# Rig 0.6.3 on the other Mac (`sol`) — owner report

Thread: state-of-play, under Decision 179. State: finished. Nothing was upgraded, because the precondition in step 2 did not hold.

## What has been done

- **Reached the Mac Studio.** It is `sol` (`100.90.130.74`). SSH as `krisbrown@100.90.130.74` worked non-interactively, with key-based login and no prompt. No SSH, Tailscale, firewall or network setting was changed.
- **Found where `rig` resolves (step 2 stopped here).** `rig` resolves to `~/.local/bin/rig`. That is a symlink into the checkout at `~/workspaces/knowledge-islands/tools-rig/bin/rig`, not to the Homebrew formula. The brief says not to change this, so `brew update` and `brew upgrade` were **not** run.
  - The checkout is at `847f0ea chore(release): prepare Rig v0.6.3 candidate` on `main` and is clean. `rig --version` already reports **0.6.3**.
  - Homebrew still has an old `knowledgeislands/tap/rig` **0.5.0** installed. The checkout link shadows it, so it never runs.
- **Ran a read-only `rig doctor` (profile `studio`).** It reported `unhealthy`, with pass=229, fail=1, skipped=19, and present=155, catalogue-only=19.
  - No cask is reported `application-metadata-invalid` any more (zero matches).
  - There is one failure: **telegram** has drifted via Homebrew (`source-mismatch:app-store-receipt`). The copy in `/Applications/Telegram.app` is the App Store build, not the cask. Rig's fix is a manual source review: quit the app, review removing the existing copy (App Management may need admin rights), then run `rig apply` and sign in again. `rig apply` was not run.
- No repository was changed and nothing was committed or pushed.

## What is in progress

Nothing.

## Outstanding queries

### RIG-SOL-BREW - Stale Homebrew Rig 0.5.0 on sol

- **Summary:** `sol` runs Rig 0.6.3 from its checkout. The Homebrew formula is still at 0.5.0, unused and shadowed.
- **Need from you:** Keep the checkout link, or switch `sol` to the tap formula. If you keep the link, also decide whether to uninstall the stale formula.
- **Recommendation:** Keep the checkout link, as on this Mac, and leave the formula alone until the estate decides one install method per host.

### RIG-SOL-TELEGRAM - Telegram is the App Store copy on sol

- **Summary:** Doctor's only failure is that Telegram on `sol` is the App Store build, while the catalogue says it should be the Homebrew cask.
- **Need from you:** Choose to replace it with the cask (a manual step at the machine, then `rig apply`) or to declare the App Store source in your Rig configuration.
- **Recommendation:** Replace it with the cask at the machine when convenient. It needs you there to quit the app, give admin approval and sign in again.

```text
RIG-SOL-BREW: keep link | switch to tap | keep link and uninstall formula
RIG-SOL-TELEGRAM: replace with cask | declare App Store source | leave
```
