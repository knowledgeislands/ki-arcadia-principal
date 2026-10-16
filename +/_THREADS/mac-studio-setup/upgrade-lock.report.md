# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › upgrade-lock

**Run report at 02:00 BST · last mark 17:47 BST**

---

## Done

- **APPLY-UPGRADE-LOCK captured as one record.** [KI-TOOL-RIG-CORE-058 Apply lock, handler history](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-058-apply-lock-handler-history.md) is a triage record, not adopted, purpose `corrective`. It covers both halves Kris approved (decision 85): `rig apply` and `rig upgrade`, including the scheduled `rig-update` job, take one shared lock and refuse to run while the other holds it; and default-application steps record their outcome in the apply history, so a failed handler such as last night's SVG step shows in `rig status`.
- **No existing record owned either half.** I checked every open tools-rig record. I also checked the Rig source, which confirms the evidence from the apply-check run: only resource work takes a lock, `rig upgrade` takes none, and the history leaves out default applications. The record names the two specification items it would amend ([RIG-STATE-025](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/specs/state.md) and [RIG-STATE-035](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/specs/state.md)), plus the questions for planning.
- **Commits, tools-rig `main` on sol, local only:** `cf9db25` reserves the number, and `efd4eae` adds the record. The full tools-rig gate passed: repository audit (the only warning is the existing missing pre-commit hook), shellcheck, syntax checks, assembly check, benchmark, native-provider smoke test, all 544 Bats tests, manual-page lint and whitespace check. The first audit run failed because the title was longer than four words. I shortened the title and the file name before committing.

## In Progress

Nothing is running from this run.

Kris, until [KI-TOOL-RIG-CORE-058](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-058-apply-lock-handler-history.md) is delivered, here is how to avoid the overlap:

1. Before running `rig apply` on sol, check that no upgrade is running. Open Terminal and run `pgrep -fl "rig upgrade"`. If it prints nothing, go ahead.
2. Don't start `rig apply` close to 08:30, when the scheduled `rig-update` job runs.
3. If macOS asks you to confirm a default app during an apply, accept it. Until the fix lands, Rig won't record a declined or failed handler step in its history.

## Queries

No new queries. APPLY-UPGRADE-LOCK is settled.

```text
╭─ run report · 2026-10-15T01:00:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · 0 queries               │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] upgrade-lock finished, nothing running from this run
- [queries] none from this run
- [uncommitted] this report (thread folder)
- [unpushed] tools-rig `cf9db25` and `efd4eae` on sol, `main`; pushing was not authorised

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
