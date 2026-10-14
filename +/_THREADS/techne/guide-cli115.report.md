# Report: remove tools-ki record link from harness operator guide

**Done**

- `docs/guides/operator/agent-host.md`: the KI-TOOL-CLI-115 link is gone. The host-marker line now reads "which a future `ki` release will honour by refusing roadmap writes on the host". tools-ki has no durable guide or man page for the host marker, so nothing is linked. Commit `b35fc5f` (local, not pushed).
- Searched the rest of the repository: no other links point to another repository's roadmap record. The only other cross-repository link is in local record TECHNE-TOOLS-OPS-015, and it points to an Arcadia design document, not a record, so I left it.
- Checks: `bun run test` passed. `ki repo audit`: PASS=16, WARN=2, FAIL=0. Both warnings were already there before this change: CI-1 (KI_VERSION is pinned inline in ci.yml) and HOOK-1 (no committed `.githooks/pre-commit`).

**Needs the owner**

- The repository still names KI-ARCADIA-GOV-020 and KI-ARCADIA-GOV-023 as plain text without links: in `infra/aws/agent-host-stack.yaml` tags, `recipes/agent-host/recipe.toml` and the operator guide. Decision 33 covers links only, so I didn't change these. Deciding whether those identifiers should also go is up to you.
