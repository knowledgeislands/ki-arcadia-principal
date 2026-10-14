# Plan KI-TOOL-RIG-CORE-050: owner report

## Done

- Planned [KI-TOOL-RIG-CORE-050](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-050-mise-observed-executables.md) under `ki-plan`. It stays `draft` and is not marked Ready. Commit `40b4f8e` is pushed fast-forward to `origin/main`. The `ki-work` and `ki-work-roadmap` audits pass.
- The plan in five lines:
  1. Cause: Rig observes mise tools with `mise which LOCATOR`. That command takes an executable name, so `rust`, `cargo:` packages and versioned locators such as `node@22` always report missing.
  2. Fix: add an optional `install.executables` string array, valid only for mise `tool` and rejected elsewhere or when unsafe. If it is omitted, Rig checks the locator without its `@version`.
  3. Status: Rig runs `mise which` for each named executable. The tool is present only if all of them are found; otherwise it is missing, and the result names the first one not found. Install, upgrade and remove still use the full locator.
  4. Tests: Bats provider-fixture tests cover `rust` with `rustc`+`cargo`, `cargo:cargo-nextest`, a versioned default and the unchanged default. Model-boundary tests cover the rejections. Then the full local gate runs, with no live apply.
  5. Docs: update specifications RIG-ORCH-017, RIG-CONF-010 and RIG-CONF-013, the `install.*` list in `man/rig.1`, and one CHANGELOG line. No Decision Record is needed.

## Failed

Nothing.

## Needs the owner

- **PLAN-RIG-050**: should this plan be approved to Ready and delivered? I recommend approving. The change is small and fixture-tested, and it also fixes versioned mise locators, which is a small widening of the record's Boundary that you should confirm.

```text
PLAN-RIG-050: approve to Ready and deliver / revise: <note> / hold
```
