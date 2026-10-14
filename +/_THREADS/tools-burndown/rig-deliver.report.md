# Rig delivery report

Completed 2026-10-11T10:22:38Z on this Mac in `/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig`, primary branch `main`. Authority: tools-burndown Decisions 1, 3 and 4; subsequent Decision 5 protection of estate naming/configuration was also respected.

## Done

All four existing records were adopted, planned from their captured requirements and delivered serially from committed immutable Ready baselines. Each has a complete six-part Review packet and disposition **Awaiting review**. No record was accepted, pruned or deleted.

### RIG-CORE-043 — self updating applications

Record: [RIG-CORE-043-self-updating-applications.md](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-043-self-updating-applications.md). Disposition: **Awaiting review**.

Self-updated and foreign-source application satisfaction/classification, with honest doctor evidence and no adoption or deletion.

Immutable Ready baseline: `11d9de69d70071875a6a7ae789e51eb1c9e8dff2`. Verified delivery: `ebd6e327dbfa4a3cf88a9e03488a4edd41abaf14`. Both are published to `origin/main`.

Checks: 14 focused delivery fixtures passed; full local gate completed 470 Bats cases with zero failures and two existing optional Python tomllib skips. Repository audit, ShellCheck, Bash syntax, deterministic assembly, portability/reference benchmarks, bounded native version smoke, manual lint and diff review passed. Evidence: `/tmp/rig-043-final-gate.log` and `/tmp/rig-043-reference-final.log`.

### RIG-CORE-041 — unwanted software removal

Record: [RIG-CORE-041-unwanted-software-removal.md](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-041-unwanted-software-removal.md). Disposition: **Awaiting review**.

Explicit declared native removal with preview, confirmation, re-observation and conservative conflict checks; no implicit deletion.

Immutable Ready baseline: `a6946472afd7e8e382613ee8aa0065bc7dd7729f`. Verified delivery: `0d6a342077f676bcb9634afb703252453ab2d9e2`. Both are published to `origin/main`.

Checks: 14 focused delivery fixtures passed; full local gate completed 484 Bats cases with zero failures and two existing optional Python tomllib skips. Repository audit, ShellCheck, Bash syntax, deterministic assembly, portability/reference benchmarks, bounded native version smoke, manual lint and diff review passed. Evidence: `/tmp/rig-041-final-gate.log` and `/tmp/rig-041-reference-final.log`.

### RIG-CORE-044 — single sudo prompt

Record: [RIG-CORE-044-single-sudo-prompt.md](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-044-single-sudo-prompt.md). Disposition: **Awaiting review**.

Opt-in attended sudo validation, owned noninteractive refresh and refusal/interruption/exit cleanup without password storage.

Immutable Ready baseline: `2b450ee38a02ffc01eaf798fc0510ee215c995f6`. Verified delivery: `d026335d15fec98d2cf42ff4c988215200fc37a4`. Both are published to `origin/main`.

Checks: 10 focused delivery fixtures passed; full local gate completed 494 Bats cases with zero failures and two existing optional Python tomllib skips. Repository audit, ShellCheck, Bash syntax, deterministic assembly, portability/reference benchmarks, bounded native version smoke, manual lint and diff review passed. Evidence: `/tmp/rig-044-gate.log` and `/tmp/rig-044-reference-recheck.log`.

### RIG-CORE-045 — default applications

Record: [RIG-CORE-045-default-applications.md](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-rig/docs/roadmap/RIG-CORE-045-default-applications.md). Disposition: **Awaiting review**.

Private UTI/extension/scheme handlers with owned-app identity checks, install ordering, honest drift and effective-result verification.

Immutable Ready baseline: `82ef601351989860b2004ad202901fe8d0969763`. Verified delivery: `e028775d9cf7393f359b133f4ba4d88cd93353aa`. Both are published to `origin/main`.

Checks: 18 focused delivery fixtures passed; full local gate completed 513 Bats cases with zero failures and two existing optional Python tomllib skips. Repository audit, ShellCheck, Bash syntax, deterministic assembly, portability/reference benchmarks, bounded native version smoke, manual lint and diff review passed. Evidence: `/tmp/rig-045-gate.log` and `/tmp/rig-045-reference-final.log`.

RIG-CORE-041 additionally has initial planning commit `2b0102f15a4d60a28412f908e92838162818c0ff`; its readiness-format correction was committed as the immutable baseline above before implementation. Both are published. RIG-CORE-045 also passed five declaration-registry checks, native bridge compilation/symbol reflection without handler access, and rendered manual inspection. RIG-CORE-041 and RIG-CORE-045 full suites proved hostile inherited state containment.

Publication: each completed delivery used explicit intended staging and a normal Conventional Commit with the Codex co-author trailer. Each committed path roster was inspected. Each push followed authorised Git fetch and ancestry/own-commit checks, without force or hook bypass. Final local `main` and `origin/main` are both `e028775d9cf7393f359b133f4ba4d88cd93353aa`; the working tree is clean and no commits remain unpushed on this machine.

Source checkpoints confirmed the generic features were handed on; personal configuration and restart/screen work remain with their source threads. No competing delivery owned these records. RIG-CORE-042, Dock implementation, personal catalogues/profiles, chezmoi and machine files, `.ki.toml`, and Arcadia checkpoints were not changed. No new work record, Project/Initiative note, release, live uninstall, live privilege grant, live handler operation, credential or environment change was performed. Network activity was limited to authorised Git.

## Failed

No unresolved delivery failure. All required final checks passed. The repository audit retains its pre-existing warning for the missing committed `.githooks/pre-commit` gate; no hook was installed or bypassed. Two optional interoperability cases skipped because the isolated test PATH has no Python interpreter supporting tomllib. Earlier corrected verification/performance issues are disclosed in the individual Review packets.

## Needs Kris

Review and approve or reject the four Awaiting review packets above. Acceptance/closure remains solely with Kris; this run has not closed any record. Native sudo policy and macOS handler consent remain authoritative, and their live use was deliberately outside this delivery authority.
