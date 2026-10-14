# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [chezmoi](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/chezmoi.md) › burn-b

**Run report at 00:37 BST · last mark 23:11 BST**

---

## Done

Four local commits in `/Users/krisbrown/.local/share/chezmoi`, none pushed or applied; tree clean.

- **Adoption** `910b1d3`: UE-089 at Future; UE-087, 088, 090, 091 at Next; bodies restructured into the draft shape. UE-087 adopted only, not delivered.
- **UE-088** `7b11f16`, `5548280`: `Host sol 100.90.130.74` block (HostName, User krisbrown, ForwardAgent for sol only; address form still forwards), guide updated, `tests/ssh-sol-alias.test.mjs`. `ssh -G -F` on the source resolves correctly. Backup and restore path is in the record's Discussion; the apply step is unticked for Kris.
- **UE-090** `6a07b3c`: gap 5 (template render) was already fixed and tested (`c41d93a`); gap 4 config was already fixed (`6c18b01`), and `tests/ki-config-skills.test.mjs` now checks declared skills against the harness inventory. Record updated with delivered and open gaps.
- **UE-091**: stopped. tools-rig KI-TOOL-RIG-CORE-042 is still `ready` at Now, undelivered and unreleased (latest tag v0.6.3).
- **Tests:** `node --test tests/*.test.mjs` 243 tests, 241 pass, 0 fail, 2 skipped (before the last commit; only a record changed after).
- **Final gates:** `ki repo audit` PASS=19 WARN=2 FAIL=0 (the two WARNs were there before: ADR BODY-12, HOOK-1); `rumdl check .` clean.

## In Progress

Nothing.

## Queries

**1. Gap 3, output-style link ordering (UE-090).** **Context:** the `ki-coordinator` link goes dead if the harness checkout is behind. **Query:** how to handle it? **Options:** a) (recommended) Add a read-only check that reports a dead link after apply, with no pulling during apply; b) a `run_before_` script that fast-forwards the harness; c) both.

**2. Gap 6, pruning `additionalDirectories` (UE-090).** **Context:** the merge only ever unions entries. **Query:** how to prune? **Options:** a) (recommended) Record the previously managed set in a state file and remove entries that left the declaration; b) replace only paths under `~/workspaces` and OneDrive, dropping hand-added entries there.

**3. UE-091 and UE-090 remainder.** **Context:** UE-091 waits on CORE-042; UE-090 gap 1 waits on UE-087; gaps 2, 7, 8, 9 untouched. **Query:** proceed? **Options:** a) (recommended) Hold all until CORE-042 is released and UE-087 is delivered; b) deliver UE-090 gaps 7 to 9 now.

```text
Reply:
1. a) Add a read-only dead-link check for the output-style link, reported after apply, with no pulling during apply.
2. a) Record the previously managed additionalDirectories set in a state file and prune entries that left the declaration.
3. a) Hold UE-091 and the rest of UE-090 until CORE-042 is released and UE-087 is delivered.
```

```text
╭─ run report · 2026-10-14T23:37:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] resume: reply to the queries above.
