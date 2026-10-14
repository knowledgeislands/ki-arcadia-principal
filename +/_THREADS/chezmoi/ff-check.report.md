# chezmoi › ff-check

**Run report at 21:29 BST · last mark 21:29 BST**

---

## Done

- **Fast-forward:** the tree was clean and `git merge --ff-only origin/main` succeeded (12 files, +392/-83). No fetch, no commit, no apply.
- **Tests:** 237 run, 233 pass, 2 fail. Both failures are in `tests/rig-catalogue.test.mjs` and are the Paperclip expectations, still failing:
  - `core plus laptop resolves the former default selection plus later additions` (line 354): `tool.paperclip-agents` is still expected in core and laptop.
  - `stable private ports retain explicit owners` (line 389): `port.paperclip` is `on-demand`, the test expects `required`.
- **`chezmoi diff --exclude scripts`, target paths that would change:**
  - `.config/rig/conf.d/10-applications.toml`: 2 lines
  - `.config/rig/conf.d/15-command-line.toml`: 47 lines
  - `.config/rig/conf.d/16-homebrew.toml`: 33 lines
  - `.config/mise/config.toml`: 13 lines
  - `.config/ki/config.toml`: 6 lines
  - `.gitconfig`: 3 lines
  - `bin/chezmoi/json`: 46 lines
  - `bin/chezmoi/op_cache`: 24 lines
- No `.git/*.lock` files remain.

## In Progress

Nothing.

## Queries

**Context:** commit 4d07f9c stopped Paperclip and removed its agents from the laptop profile, so the two tests now disagree with the catalogue.

**Query:** Should the tests be updated to match?

**Options:**

a) (recommended) Update both expectations in `tests/rig-catalogue.test.mjs`: drop `tool.paperclip-agents` from core and laptop, and expect `port.paperclip` to be `on-demand`.

b) Leave the tests as they are until the Paperclip change is reviewed.

Reply block:

```text
ff-check query 1: a) Update both Paperclip expectations in tests/rig-catalogue.test.mjs to match the catalogue, then re-run node --test tests/*.test.mjs. Commit nothing until I say so.
```

```text
█▀▀ █▀▀ █▀▀ █ █   run report · issued 21:29 BST
█
 [ff-check: finished] [tests: 2 failing] [apply: not run]
█
 Resume: ask for the test update (query 1 a).
```
