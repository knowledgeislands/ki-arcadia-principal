# tap-consumer-fix report

Authority: Decision 152 (completes Decision 150, mgit v0.17.0).

## Done

- homebrew-tap `dcd9f66` `fix(ci): accept dotted consumer repository names`, pushed fast-forward to `main`. `CONSUMER_REPOSITORY` now accepts any GitHub repository name (`A-Z a-z 0-9 . _ -`, up to 100 chars) under `knowledgeislands/`. It still rejects empty names, `.` and `..`, traversal, extra path segments, spaces and trailing newlines. I kept the existing org-only restriction and its test. Two new tests cover these cases.
- Gate: `tool_release_events_test.rb` passed (13 runs, 0 failures) and `propose_tool_release_test.rb` passed (7 runs, 0 failures). `ruby -c` passed on both scripts. `ki repo audit` gave FAIL=0 and one existing warning: no `.githooks/pre-commit`.
- Re-sent the mgit v0.17.0 event with CI `workflow_dispatch formula=mgit` ([run 38344001694](https://github.com/knowledgeislands/homebrew-tap/actions/runs/38344001694)). All jobs passed, including Notify release consumers. The push CI for `dcd9f66` also passed.
- The website opened [apps-knowledgeislands.info#32](https://github.com/knowledgeislands/apps-knowledgeislands.info/pull/32) "chore(tooling): advertise mgit v0.17.0". The release bot auto-merged it at 03:58 UTC after CI passed. I did not merge it.
- Missed notifications: none besides mgit v0.17.0. It is the only formula change since the rename fix `d6f3b0c` (2026-10-12). The earlier release, ki v0.10.1, reached the website as PR #31, which is merged. Every other CI run since 2026-10-11 passed.

## Needs the owner

- Unrelated finding: website [apps-knowledgeislands.info#29](https://github.com/knowledgeislands/apps-knowledgeislands.info/pull/29) "advertise ki v0.10.0" is still open with auto-merge enabled. ki v0.10.1 (#31) has replaced it. Decide whether to close it.
