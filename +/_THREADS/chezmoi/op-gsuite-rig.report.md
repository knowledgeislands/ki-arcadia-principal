# kit-mcp-gsuite 1Password repoint — report

## Done

- Confirmed item `rn2c6gj5y7jqsuztge4n36lnqa` ("Personal GSuite Client Id & Secret") is in the Rig vault (`fwksj5utqpndxhr5y3wm3ahyv4`) with `username` and `password` fields. No secret values were read or printed.
- Repointed both `kit-mcp-gsuite` references in `.chezmoidata/mcp-servers.yaml` from `op://j4zylihswo26fah6lgwvqz2y6y/4lpnt6ymj7phxzkm7ivldtxymi/…` to `op://fwksj5utqpndxhr5y3wm3ahyv4/rn2c6gj5y7jqsuztge4n36lnqa/…`.
- Expired the cache entries for `4lpnt6ymj7phxzkm7ivldtxymi` (previous ID) and `qktyhatmvnljnhgnjageuryz4a` (older ID). The new item is now cached.
- Commit `9d76bbe` — `fix(mcp): repoint kit-mcp-gsuite 1Password reference to Rig vault` (local only, not pushed, no `chezmoi apply`).

## Checks

- `OP_CACHE_TTL_SECONDS=0 chezmoi diff ~/.mcporter/mcporter.json`: exit 0, empty diff.
- `chezmoi status`: exit 0, no errors, no output.
- `ki repo audit --repo .`: PASS=19 WARN=2 FAIL=0. Both warnings are in `ki-agentic-harness` (HOOK-1 no pre-commit gate; ITEM-2 territory registry unavailable) and predate this change.
- `node --test tests/*.test.mjs`: 176 tests, 174 pass, 0 fail, 2 skipped.
- `rumdl check .`: no issues.
- Working tree clean and no `.git/*.lock` files.

## Failed

None.

## Needs the owner

Nothing.
