# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [chezmoi](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/chezmoi.md) › triage

**Run report at 00:24 BST · last mark 23:11 BST**

---

## Done

Nothing committed; the tree is clean again. I made the adoption edits (`kind: deliver`, `status: draft`, `horizon` next for UE-087, 088, 090, 091 and future for UE-089, `updated_at`) and ran the checks, then reverted them because the audit failed.

- `node --test tests/*.test.mjs`: 237 tests, 235 pass, 0 fail, 2 skipped.
- `rumdl check docs/roadmap`: no issues.
- `ki repo audit --repo .`: **FAIL** after the edits (FAIL=4). Before them it was PASS=19 WARN=2 FAIL=0. The four failures are ITEM-3 (item body shape) on UE-087, 088, 090 and 091. A draft body must run Goal → Context → Boundary → Current state → Steps → Files touched → Verify → Dependencies / blocks → Documentation impact → Discussion. UE-089 passed.

## In Progress

Nothing.

## Queries

**1. Body shape.** **Context:** adopting UE-087, 088, 090 and 091 to draft makes the audit require the full body shape, which they lack. Restructuring bodies is outside "adoption metadata only". **Query:** how to proceed? **Options:** a) (recommended) Adopt UE-089 now at Future, and leave the other four in triage until a planning run restructures each body. b) Adopt all five and restructure the four bodies in one run, keeping their content and adding the missing sections. c) Adopt all five and commit with the audit failing.

```text
Reply:
1. a) Adopt UE-089 at Future now; leave UE-087, 088, 090 and 091 in triage until their bodies are restructured.
```

```text
╭─ run report · 2026-10-14T23:24:34Z ──────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] resume: reply to the query above.
