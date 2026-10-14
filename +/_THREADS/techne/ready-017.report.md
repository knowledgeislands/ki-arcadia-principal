# TECHNE-TOOLS-OPS-017 readiness report

**Done**

- [TECHNE-TOOLS-OPS-017](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-017-zsh-shell-at-rebuild.md) records all five Decision 37 answers, with the plan updated to match, and is now `ready`. Implementation has not started. (cf4c50a)
- [TECHNE-TOOLS-OPS-023](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-023-controller-target-stack-tags.md) captures the controller and target stacks' `ki-work-item: TECHNE-OPS-007` tags as an unadopted triage record. Its number was reserved first in fcd676f, and the record landed in b27fd0a. It notes that `operations/aws/target/destroy.sh` relies on that tag as a deletion guard.
- Checks: `bun run test` passed with mise Python 3.12.13 first on PATH. `ki repo audit` reports PASS=16, WARN=2 and FAIL=0. Both warnings were already there: the inline KI_VERSION pin in ci.yml (CI-1) and the missing `.githooks/pre-commit` (HOOK-1).
- Commits are local only and nothing was pushed.

**Needs the owner**

- Push when ready.
