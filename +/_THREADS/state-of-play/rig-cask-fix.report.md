# RIG-CASKS: cask metadata fix (Decision 172)

## Done

- **Cause confirmed.** Homebrew 7.0.9 is installed here with no local `homebrew/cask` tap. When Rig read cask metadata with the API switched off (`HOMEBREW_NO_INSTALL_FROM_API=1`), Homebrew returned a stub where `tap` and `auto_updates` were both null. `plutil` then failed, so Rig marked every cask `application-metadata-invalid`.
- **Fixed in `src/rig/21-provider-state.bash`.** Rig now reads the cask from Homebrew's cached API definition. `HOMEBREW_NO_AUTO_UPDATE=1` is kept, so this check never refreshes Homebrew. If `auto_updates` is true the app updates itself; if false it is managed.
- **Null handling.** In a cask that resolved properly, a null `auto_updates` just means the cask doesn't declare it. Homebrew treats that as managed, and so does Rig now. Eleven casks on this Mac are like this, including `utm` and `meld`. If the definition is an unresolved stub (null `tap`), Rig reports `application-metadata-unavailable` rather than guessing a policy. Anything else malformed is still reported as invalid.
- **Docs updated to match:** the user guide (`docs/guides/user/commands.md`) and the catalogue spec (`docs/specs/catalogue.md`).
- **Regression test added** in `tests/rig-application-updates.bats`. It covers a self-updating cask read through the API, a resolved cask with null `auto_updates` (managed), and the no-tap stub (unavailable). It also checks that the `info` read runs without `HOMEBREW_NO_INSTALL_FROM_API` and with `HOMEBREW_NO_AUTO_UPDATE=1`. The test fails against the previous build and passes with the fix.
- **Checks:** the full local gate passed. That covers repo audit (PASS 19, WARN 1, FAIL 0; the warning is the existing missing pre-commit hook), shellcheck, syntax, the assembly check, benchmark, native-provider smoke, all 544 bats tests, mandoc lint and the diff check.
  - My first suite run had 6 version-marker failures. They happened because the release agent committed its return to `0.6.2+dev` while my run was in progress. I re-ran after its commit and all 544 passed.
- **Committed and pushed** as `671c864 fix(applications): resolve cask auto-update metadata without a cask tap`, fast-forward to `origin/main` on top of the release agent's `0927f6c`. No commits from other threads were pushed with mine.
- **Read-only check on this Mac.** The installed `rig 0.6.2` still reports 54 `application-metadata-invalid` casks. The fixed `./bin/rig doctor` from source reports none, and casks such as Chrome, Zoom and VS Code show `self-updating; action=none`. Doctor's summary is back to `findings=2`. I did not run `rig apply`.
- I waited for `v0.6.2` to be tagged before editing and did not touch that release.

## In progress

- Nothing. I made no tag or release.

## Needs the owner

- **RIG-063: release Rig 0.6.3.** The installed `rig 0.6.2` on both Macs still flags 54 casks and blocks the resources that depend on them. The fix only reaches those Macs through a release. **Recommendation:** approve releasing 0.6.3 from `671c864`.

```text
RIG-063: approve | hold
```
