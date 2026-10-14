# Rig 050 delivery: owner report

## Done

- [KI-TOOL-RIG-CORE-050](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-050-mise-observed-executables.md) was marked Ready under Decision 166 (`d6be837`), delivered as planned and moved to awaiting-review with its full review packet (`fde96e8`). Both commits are pushed to `origin/main` as a fast-forward. No other thread's commits were underneath.
- A mise tool can now declare `install.executables` (for example `["rustc", "cargo"]` for `rust`, or `["cargo-nextest"]` for `cargo:cargo-nextest`). Rig observes each name with `mise which`. Without the field, it observes the locator with any `@VERSION` removed, so `node@22` is observed as `node`. Install, upgrade and removal still use the full locator. Specifications RIG-ORCH-017, RIG-CONF-010 and RIG-CONF-013, the manual and the changelog are updated.
- Full local gate passed: repository audit (no failures; one existing, unrelated pre-commit-hook warning), ShellCheck, syntax checks, assembly check, benchmark within budget, read-only native smoke checks (6 of 6), Bats 543 of 543, manual lint, and diff check. Nothing was applied to the live workstation.

## Failed

None.

## In progress

None. The record waits for Kris's review.

## Needs the owner

- **RIG050-RELEASE**: A release is needed before chezmoi can use this. The latest tag is `v0.6.1`, and the workstation runs released Rig, so the chezmoi catalogue cannot move `rust` and `cargo:` tools into Rig until a release that includes `fde96e8` ships. No release was made. Recommendation: release Rig 0.6.2 when convenient. After that, the chezmoi repository can adopt the field.
- **RIG050-ACCEPT**: Review and accept KI-TOOL-RIG-CORE-050. The packet records two interpretations: scoped package names such as `npm:@scope/name` keep their `@`, and the `missing-executable:NAME` detail appears only when the field is declared. Recommendation: accept.

```text
RIG050-RELEASE: release 0.6.2 now / later / hold
RIG050-ACCEPT: accept / changes: ...
```
