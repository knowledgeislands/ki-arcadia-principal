# [Platform foundations](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/platform-foundations.md) › [tools-burndown](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/tools-burndown.md) › store-repair

**Run report at 02:06 BST · last mark none**

---

## Done

- **Verify 4 replayed locally and passed.** `v0.10.5` contains the fix, and ki-principal pins `v0.10.5`. The installed `ki` runs the tools-ki checkout, whose source is identical to the tag. I replayed ki-principal's CI "Install released KI" step against a fresh clone of its `origin/main` (`a86245c`), in a throwaway home and XDG sandbox with no store bound. Repair exited 0 with the `sources` store warning, 44 projected skills and `RESULT=PASS`, and `ki diag` showed "Configuration: valid" and "Registry: valid", so the step passes. `ki repo audit` then ran to its own verdict, FAIL=8, with every failure an audit finding (STREAM-9, PMO-7 and others) and none a repair or store error.
- **Evidence recorded.** [KI-TOOL-KI-CLI-126](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) carries the evidence under Verification and stays `awaiting-review`, ready for your `ki-accept`. It is committed in tools-ki as `d64ed454`, with hooks passing, and pushed fast-forward to `origin/main`.
- **One remote call to note.** `ki bootstrap` in the sandbox downloaded the canonical harness archive, just as the CI step does. I made no other network or GitHub call.

## In Progress

Nothing. I made no `ki-accept` and no release.

## Queries

### VERIFY4-CI

**Context:** Verify 4 asks for the GitHub-hosted ki-principal CI run on `main` to pass the install step and reach `ki repo audit`. This run had no GitHub access, so the evidence is a faithful local replay of that step with `v0.10.5`, not the runner itself. The record names this gap under Outstanding concerns.

**Query:** Is the local replay enough to accept KI-TOOL-KI-CLI-126, or should the hosted run be checked first?

**Options:**
a) (recommended) Check the latest ki-principal CI run on `main` first. If it passes "Install released KI" and fails, if at all, only at `ki repo audit`, accept KI-TOOL-KI-CLI-126 through `ki-accept`.
b) Accept KI-TOOL-KI-CLI-126 through `ki-accept` on the local replay alone.

```text
VERIFY4-CI: a) Check the latest ki-principal CI run on main first; if it passes "Install released KI" and fails, if at all, only at ki repo audit, accept KI-TOOL-KI-CLI-126 (/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-126-unavailable-store-breaks-repair.md) through ki-accept.
```

```text
╭─ run report · 2026-10-16T01:06:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued from this run
- [waiting] VERIFY4-CI, then `ki-accept` on KI-TOOL-KI-CLI-126
- [uncommitted] store-repair.report.md, left for the thread to commit

Resume line: `Resume Fnd: tools-burndown under current ki-pmo and ki-delegation since 2026-10-16T00:05:00Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.`
