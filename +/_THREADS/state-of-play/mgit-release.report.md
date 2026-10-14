# mgit release — report

**Done**

- Released mgit v0.17.0 (it was worthwhile because v0.16.0 lacked `mgit --principals`, which selects the territory Capitals): <https://github.com/knowledgeislands/tools-mgit/releases/tag/v0.17.0>. The release is immutable.
- Release commit `9a30de5` (`chore(release): prepare v0.17.0`) was pushed to `main` as a fast-forward and tagged `v0.17.0`. The gate passed: ki repo audit FAIL=0 (with one existing HOOK-1 warning), shellcheck, `bash -n`, mandoc lint, diff check, and 93/93 Bats tests with the real KI producer. Repository CI passed too.
- The pinned installer ran into disposable destinations and reported `mgit 0.17.0`. Its manual resolves.
- Homebrew tap formula PR auto-merged: <https://github.com/knowledgeislands/homebrew-tap/pull/33>. `brew upgrade knowledgeislands/tap/mgit` brought it from 0.16.0 to 0.17.0, and `/opt/homebrew/bin/mgit --version` reports `mgit 0.17.0`. `~/.local/bin/mgit` is a linked checkout that comes before it on PATH and also reports 0.17.0.

**Failed**

- The website handoff didn't happen. Homebrew-tap's post-merge `Notify release consumers` job (run 38343321083) failed: `.github/tool-release-consumers.json: invalid consumer repository "knowledgeislands/apps-knowledgeislands.info"`. The `CONSUMER_REPOSITORY` pattern in `scripts/tool-release-events.rb` appears to reject the dot in the renamed repository (commit d6f3b0c), so no "advertise mgit v0.17.0" PR exists. This will affect every tool release until fixed.

**Needs Kris**

- Authorise a fix in homebrew-tap: let `CONSUMER_REPOSITORY` accept dots, then re-run the notification or re-send the event for mgit v0.17.0. I didn't touch homebrew-tap because it was outside this run's authority.
