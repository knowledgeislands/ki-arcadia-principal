# op-gsuite — kit-mcp-gsuite 1Password reference repoint

## Done

- Confirmed the candidate item, "Personal GSuite Client Id & Secret" (`4lpnt6ymj7phxzkm7ivldtxymi`, vault "Side Projects", `j4zylihswo26fah6lgwvqz2y6y`). It has `username` and `password` fields and is the only client-ID/secret item. Its title has a "Personal" prefix that the brief's title lacked. No secret values were read.
- Repointed both `kit-mcp-gsuite` references in `.chezmoidata/mcp-servers.yaml` (lines 92 and 94) to `op://j4zylihswo26fah6lgwvqz2y6y/4lpnt6ymj7phxzkm7ivldtxymi/{username,password}`.
- Committed as `e62ec78` (`fix(mcp): repoint kit-mcp-gsuite 1Password reference to moved item`). It contains only that file. Nothing was pushed and `chezmoi apply` was not run. The other session's three unpushed commits were not touched, and no Git lock files were left behind.
- The op cache did not need clearing. `bin/chezmoi/executable_op_cache` keys entries on the item UUID (`~/.cache/op-cache/<item>.json`), so the new ID uses a separate cache file.
- Checks:
  - `chezmoi status`: rc 0, no errors.
  - `chezmoi diff ~/.mcporter/mcporter.json`: rc 0, empty diff, so the rendered gsuite secret is identical.
  - `node --test tests/*.test.mjs`: 176 tests, 174 pass, 0 fail, 2 skipped.
  - `rumdl check .`: no issues.
  - `ki repo audit --repo .`: PASS=19, WARN=2, FAIL=0. The two warnings were already there: no committed pre-commit hook, and the `ki-arcadia-principal` territory is not registered. The first audit run showed one transient FAIL. It was the `ki-decision-records` RUBRIC-1 check, caused by uncommitted edits another session was making in `ki-agentic-harness`, and was unrelated to this change. A re-run passed.

## Failed

- None.

## Needs Kris

- An orphaned cache file, `~/.cache/op-cache/qktyhatmvnljnhgnjageuryz4a.json`, still holds the old item's plaintext (mode 600). The script only refreshes cache files and never deletes them. Delete it if you want it gone (`rm ~/.cache/op-cache/qktyhatmvnljnhgnjageuryz4a.json`). I did not delete it, because nothing required it.

## Other `op://` references (for the vault reorganisation)

ID-based. All are in `.chezmoidata/mcp-servers.yaml` and all point at vault "HNR (Kris)" (`2ul67mthgfh3fgzf3svpuo6bjm`):

| Line(s) | Item title | Item ID |
| --- | --- | --- |
| 75, 77 | HNR M365 Client Id & Secret | `jpbypjs36hr4o2z546iqldwepy` |
| 104 | Notion Access Token | `jw23jxoxuyyfq5aajv7hutsmm4` |

Name-based. These break if an item is renamed or moved out of the "Personal" vault (`2fdjzn5qjr53nkde7vmovjkahm`). Note that "Personal" is a different vault from "Personal (Kris)":

- `.chezmoidata/mcp-servers.yaml:54`: `op://Personal/project-rend/authorization`
- `.chezmoidata/mcp-servers.yaml:134`: `op://Personal/mcp-acquire-whatsapp/auth-key`
- `docs/guides/tools/chezmoi.md:95`: `op://Personal/GitHub PAT/credential` (a documentation example, not rendered)
