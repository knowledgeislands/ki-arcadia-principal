# Why `rig upgrade` failed 84 items on sol

## What has been done

The run was on **sol** (the Mac Studio). Your shell history there shows `rig update` at 14:30:23 and `rig upgrade` at 14:30:31 BST today, run with the checkout's Rig 0.6.3. On terra, the last upgrade was the scheduled 08:32 run, which had no failures (91 completed, 0 failed, 66 left for later).

**The short answer:** yes, something on sol needs fixing, and it isn't Rig. sol is on macOS 27.0.1 but still has the Command Line Tools for macOS 26.6. Homebrew 7 now tries to rebuild `pkgconf` (which was built on 26.6) before every install or upgrade, and the rebuild refuses to run with old Command Line Tools. So every Homebrew upgrade on sol fails in the same way, before it gets to the item you asked for. `brew doctor` on sol reports the same problem.

**No record of your 14:30 run exists.** Rig only saves a receipt for scheduled (unattended) runs, so the 84 individual errors were only shown in your terminal. I worked out the groups below from three sources: the scheduled 08:32 run on sol, which used Homebrew Rig 0.5.0 and failed 131 of 131 Homebrew items with the same error; sol's current Homebrew and App Store state; and the rules Rig 0.6.3 uses to choose which items to upgrade. The numbers add up to within one item. Telegram's exact error message is inferred, not seen.

### Failure groups (the 84 failed items)

| Cause | Count | Examples and error | Fix | Who |
| --- | --- | --- | --- | --- |
| Command Line Tools too old for macOS 27, so Homebrew can't rebuild `pkgconf` | 82 to 83 | `ack`, `awscli`, `chezmoi` (73 formulae in all); `meld`, `utm`, `displaylink` (9 Homebrew apps that don't update themselves). Each one fails with "Your Command Line Tools are too outdated … You should download the Command Line Tools for Xcode 27.0." | Install the Command Line Tools for Xcode 27.0 from Software Update. If it isn't offered, run `sudo rm -rf /Library/Developer/CommandLineTools` and then `sudo xcode-select --install`. After that, run `brew reinstall pkgconf` and then `rig upgrade`. | You: this needs an admin password and the Apple installer |
| Telegram deleted by hand | 1 | `telegram` is declared on sol as the App Store app (`mas` 747648890), not the Homebrew app. It no longer appears in `mas list` or `/Applications`, so the App Store upgrade has nothing to upgrade. | If you want it on sol: reinstall it from the App Store, or run `rig apply --target telegram`. If you don't: remove it from sol's selection, which means a studio exclusion in your Rig config through chezmoi, since it comes in from `core`. | You |
| One item I couldn't place | 0 to 1 | The figures leave one item unexplained. It is probably an app whose Homebrew details didn't mark it as self-updating at 14:30, so it was tried and hit the same Command Line Tools error. | Nothing extra: it should clear with the first fix. | — |

### What else the run did (not failures)

- **26 completed:** the 15 items Homebrew isn't involved in (npm, uv, mise, skills) and 11 of the 12 App Store apps. App Store upgrades don't go through Homebrew, so they weren't affected.
- **49 Homebrew apps that update themselves were skipped,** for example Slack and Chrome. This is the main way the checkout's Rig 0.6.3 differs from Homebrew Rig 0.5.0. 0.5.0 tried to upgrade them and failed, which is why this morning's run failed 131 items while yours failed 84. The skips are correct, but they leave your summary line `planned=0 completed=26 failed=84 unavailable=0` without a `skipped=` count. The full `Summary:` line above it in the terminal shows it.
- **A warning about the untrusted `domt4/autoupdate` Homebrew source** appears in the output. It didn't cause any failures: Homebrew ignores that source until it's trusted or removed.
- `brew doctor` also says `python@3.10` is deprecated. That doesn't affect this run.

### Verdict

- **Machine setup problem:** the Command Line Tools weren't updated after sol moved to macOS 27. That accounts for nearly every failure.
- **Expected behaviour:** Telegram. You removed an app that Rig still expects on sol, and an upgrade doesn't reinstall it.
- **Not a Rig defect,** though two things could be better (see RIG-UX below). Rig repeats the same doomed `pkgconf` rebuild for every Homebrew item instead of reporting the shared cause once. It also reports a declared app that has disappeared as "failed" instead of "missing, run `rig apply`".
- **Until the Command Line Tools are fixed,** the scheduled `rig-update` job on sol (08:30 daily, now running the checkout's Rig) will report about 83 failures every morning.

### Side finding on terra

Terra's 08:32 scheduled run reported 54 Homebrew apps as `application-metadata-invalid`. When I run the same Homebrew metadata read in a terminal on terra now, it works (Slack comes back as self-updating). So something seems to differ in the scheduled job's environment. Those apps weren't upgraded or checked this morning. This is separate from your question; see TERRA-METADATA.

### What I touched

Everything was read-only on both Macs. On sol I ran `brew config`, `brew doctor`, `brew outdated --greedy`, `brew info`, `mas list`, `rig show` and read the state and log files. I briefly copied one list of item names to `/tmp` on sol and deleted it straight away. I made no installs, upgrades, applies, setting changes or commits. Working notes are in `/tmp/rigdiag` on terra.

## What is in progress

Nothing. This run has finished.

## Outstanding queries

### SOL-CLT - Update the Command Line Tools on sol

**Summary:** 82 to 83 of the 84 failures come from sol's macOS 26.6 Command Line Tools on macOS 27. Installing them needs an admin password, so a person has to do it.

**Need from you:** install the Command Line Tools for Xcode 27.0 on sol, or say that I should leave sol's Homebrew failing for now.

**Recommendation:** do it at sol: open Software Update, or if it isn't offered there, run `sudo rm -rf /Library/Developer/CommandLineTools` and then `sudo xcode-select --install`. Then a short run, which may change Homebrew state, can do `brew reinstall pkgconf` and `rig upgrade` and confirm the failures have gone.

```text
SOL-CLT: done, run the follow-up / I'll do it all myself / leave for now — <notes>
```

### SOL-TELEGRAM - Telegram on sol

**Summary:** Rig still expects Telegram (the App Store app) on sol, and you deleted it.

**Need from you:** decide whether sol should have Telegram.

**Recommendation:** if you deleted it to reinstall it, reinstall it from the App Store or with `rig apply --target telegram`. If you don't want it on sol, exclude it from the studio profile in your Rig config through chezmoi, so Rig stops expecting it.

```text
SOL-TELEGRAM: reinstall / exclude from studio — <notes>
```

### SOL-AUTOUPDATE-TAP - The untrusted `domt4/autoupdate` source on sol

**Summary:** Homebrew warns that it is ignoring `domt4/autoupdate` because the source isn't trusted. Rig's `rig-update` job now does the scheduled updating, so this source looks like something left over.

**Need from you:** remove the source or trust it.

**Recommendation:** remove it (`brew untap domt4/autoupdate`), after checking that nothing on sol still uses `brew autoupdate`.

```text
SOL-AUTOUPDATE-TAP: untap / trust / leave — <notes>
```

### RIG-UX - Should Rig report shared failures and missing apps better?

**Summary:** when every Homebrew item fails for one shared reason, Rig reports 84 separate failures and spends about ten seconds on each. A declared app that was removed by hand shows as "failed" rather than "missing". A run you start yourself also leaves no receipt, so nobody can look at the failures later.

**Need from you:** decide whether to capture this as a triage record in `tools-rig`.

**Recommendation:** capture one triage record covering stopping early when a provider fails the same way every time, reporting a missing declared app as missing, and saving a receipt for interactive runs.

```text
RIG-UX: capture triage record / drop — <notes>
```

### TERRA-METADATA - Homebrew app details unreadable in terra's scheduled run

**Summary:** terra's 08:32 run marked 54 Homebrew apps `application-metadata-invalid`, but the same read works when I run it in a terminal.

**Need from you:** decide whether to investigate.

**Recommendation:** a short read-only run on terra that compares the scheduled job's environment with a terminal session.

```text
TERRA-METADATA: investigate / ignore — <notes>
```

### Reply block

```text
SOL-CLT: done, run the follow-up / I'll do it all myself / leave for now — <notes>
SOL-TELEGRAM: reinstall / exclude from studio — <notes>
SOL-AUTOUPDATE-TAP: untap / trust / leave — <notes>
RIG-UX: capture triage record / drop — <notes>
TERRA-METADATA: investigate / ignore — <notes>
```
